package patches.flitsmeister

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import java.security.MessageDigest
import java.util.function.Supplier

private const val STARTUP_ASSET = "bsnPCDnBLcHWJvVO"
private var embeddedStartupDex: ByteArray? = null

private fun ByteArray.sha256(): String = MessageDigest.getInstance("SHA-256").digest(this)
    .joinToString("") { "%02x".format(it.toInt() and 0xff) }

private val startupRestorationResources = rawResourcePatch {
    dependsOn(originalInput)
    execute {
        val asset = get("assets").resolve(STARTUP_ASSET).readBytes()
        check(asset.size == 456927)
        check(asset.sha256() == "2a5f48741f795034142e3691996c62b2f1378f7d4812ee0359533168226ecf09")
        val offset = 253917
        check(asset.copyOfRange(offset, offset + 4).contentEquals(byteArrayOf(0x64, 0x65, 0x78, 0x0a)))
        val size = asset.copyOfRange(offset + 0x20, offset + 0x24)
            .foldIndexed(0) { index, value, byte -> value or (byte.toInt() and 0xff).shl(index * 8) }
        check(size == 41244)
        val dex = asset.copyOfRange(offset, offset + size)
        check(dex.sha256() == "3a085520d50a954afefeb4db02ec02bcf8523d4babb6f8e4817398aced2ae7cc")
        embeddedStartupDex = dex
        val stock = checkNotNull(object {}.javaClass.getResourceAsStream("/libmaplibre-arm64-v8a.so")).readBytes()
        check(stock.sha256() == "9b1406b08f0be200cf21acfa8bba81bce4ca3bc6f9f3eb852ca854a8d850d52f")
        val destination = get("lib/arm64-v8a").resolve("libmaplibre.so")
        check(destination.readBytes().sha256() == "38a576f0f34ea5d2d8aaa06eb8c0796ce85985ada000eb034d5ff3c2c2a9f282")
        destination.writeBytes(stock)
    }
}

private val startupManifestResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val namespace = "http://schemas.android.com/apk/res/android"
            val activities = doc.getElementsByTagName("activity")
            for (index in activities.length - 1 downTo 0) {
                val activity = activities.item(index) as? org.w3c.dom.Element ?: continue
                if (activity.getAttributeNS(namespace, "name") == "com.pairip.licensecheck.LicenseActivity") {
                    activity.parentNode.removeChild(activity)
                }
            }
            val permissions = doc.getElementsByTagName("uses-permission")
            for (index in permissions.length - 1 downTo 0) {
                val permission = permissions.item(index) as? org.w3c.dom.Element ?: continue
                if (permission.getAttributeNS(namespace, "name") == "com.android.vending.CHECK_LICENSE") {
                    permission.parentNode.removeChild(permission)
                }
            }
        }
    }
}

private fun smaliString(value: String): String = buildString {
    append('"')
    value.forEach { char ->
        when (char) {
            '\\' -> append("\\\\")
            '"' -> append("\\\"")
            '\n' -> append("\\n")
            '\r' -> append("\\r")
            '\t' -> append("\\t")
            else -> if (char.code < 0x20) append("\\u%04x".format(char.code)) else append(char)
        }
    }
    append('"')
}

context(context: BytecodePatchContext)
private fun replaceBody(descriptor: String, registerCount: Int, instructionCount: Int, code: String) {
    val cls = descriptor.substringBefore("->")
    val signature = descriptor.substringAfter("->")
    val parameters = Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]")
        .findAll(signature.substringAfter('(').substringBefore(')')).map { it.value }.toList()
    val method = exact(cls, signature.substringBefore('('), signature.substringAfter(')'), *parameters.toTypedArray()).method
    val implementation = method.implementation ?: error("Missing implementation: $descriptor")
    check(implementation.registerCount == registerCount && method.instructions.size == instructionCount) {
        "Changed startup method layout: $descriptor; expected registers=$registerCount instructions=$instructionCount, actual registers=${implementation.registerCount} instructions=${method.instructions.size}"
    }
    val replacement = MutableMethod(ImmutableMethod(method.definingClass, method.name,
        method.parameters, method.returnType, method.accessFlags, method.annotations,
        method.hiddenApiRestrictions, ImmutableMethodImplementation(registerCount,
            emptyList(), emptyList(), emptyList()))).apply { addInstructions(0, code) }
    val mutableClass = context.mutableClassDefBy(method.definingClass)
    check(mutableClass.methods.remove(method))
    check(mutableClass.methods.add(replacement))
}

context(context: BytecodePatchContext)
private fun addClinit(type: String, registerCount: Int, body: String) {
    val cls = context.mutableClassDefBy(type)
    check(cls.methods.none { it.name == "<clinit>" }) { "Unexpected existing initializer: $type" }
    val method = MutableMethod(ImmutableMethod(type, "<clinit>", emptyList(), "V",
        AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value, null, null,
        ImmutableMethodImplementation(registerCount, emptyList(), emptyList(), emptyList())))
    method.addInstructions(0, body)
    check(cls.methods.add(method)) { "Duplicate initializer: $type" }
}

private fun parameterTypes(descriptor: String): List<String> = Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]")
    .findAll(descriptor).map { it.value }.toList()

private fun classConstant(type: String): String = when (type) {
    "Z" -> "sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;"
    "B" -> "sget-object v3, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;"
    "S" -> "sget-object v3, Ljava/lang/Short;->TYPE:Ljava/lang/Class;"
    "C" -> "sget-object v3, Ljava/lang/Character;->TYPE:Ljava/lang/Class;"
    "I" -> "sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;"
    "J" -> "sget-object v3, Ljava/lang/Long;->TYPE:Ljava/lang/Class;"
    "F" -> "sget-object v3, Ljava/lang/Float;->TYPE:Ljava/lang/Class;"
    "D" -> "sget-object v3, Ljava/lang/Double;->TYPE:Ljava/lang/Class;"
    else -> "const-class v3, $type"
}

internal val startupCompatibility = bytecodePatch(
    name = "Fix PairIP startup",
    description = "Restores captured startup strings and reflection registrations, merges the original embedded lifecycle DEX and bypasses only the damaged startup dispatcher and Java signature gate.",
    default = true,
) {
    compatibleWith(flitsmeister)
    dependsOn(originalInput, startupRestorationResources, startupManifestResources)
    extendWithAll {
        listOf(Supplier {
            checkNotNull(embeddedStartupDex) { "Startup resource extraction did not run" }.inputStream()
        })
    }
    execute {
        check(StartupRestoreData.strings.size == 32)
        check(StartupRestoreData.strings.values.sumOf { it.size } == 1442)
        check(StartupRestoreData.methods.size == 17)
        StartupRestoreData.strings.forEach { (type, fields) ->
            val body = buildString {
                fields.forEach { (name, value) ->
                    append("const-string v0, ${smaliString(value)}\n")
                    append("sput-object v0, $type->$name:Ljava/lang/String;\n")
                }
                append("return-void")
            }
            addClinit(type, 1, body)
        }
        StartupRestoreData.methods.entries.groupBy { it.key.substringBeforeLast('.') }.forEach { (holder, entries) ->
            val body = buildString {
                entries.forEach { (target, restore) ->
                    val field = target.substringAfterLast('.')
                    val parameters = listOf(restore.helper.substringBefore("\$c") + ";") + parameterTypes(restore.parameters)
                    append("const-class v0, ${restore.helper}\n")
                    append("const-string v1, ${smaliString(restore.name)}\n")
                    append("const/4 v2, 0x${parameters.size.toString(16)}\n")
                    append("new-array v2, v2, [Ljava/lang/Class;\n")
                    parameters.forEachIndexed { index, type ->
                        append(classConstant(type)).append('\n')
                        append("const/4 v4, 0x${index.toString(16)}\n")
                        append("aput-object v3, v2, v4\n")
                    }
                    append("invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;\n")
                    append("move-result-object v0\n")
                    append("sput-object v0, $holder->$field:Ljava/lang/reflect/Method;\n")
                }
                append("return-void")
            }
            addClinit(holder, 5, body)
        }
        replaceBody("Lcom/pairip/SignatureCheck;->verifyIntegrity(Landroid/content/Context;)V", 3, 41, "return-void")
        replaceBody("Lcom/pairip/StartupLauncher;->launch()V", 3, 16, "return-void")
        replaceBody("Lcom/pairip/licensecheck/LicenseClient;->checkLicense(Landroid/content/Context;)V", 3, 16, "return-void")
        replaceBody("Lcom/pairip/licensecheck/LicenseClient;->initializeLicenseCheck()V", 4, 30, "return-void")
        replaceBody("Lcom/pairip/licensecheck/LicenseClient;->startErrorDialogActivity()V", 4, 9, "return-void")
        replaceBody("Lcom/pairip/licensecheck/LicenseClient;->startPaywallActivity(Landroid/app/PendingIntent;)V", 4, 11, "return-void")
        replaceBody("Lcom/pairip/licensecheck/LicenseActivity;->onStart()V", 3, 21, """
            invoke-super {p0}, Landroid/app/Activity;->onStart()V
            invoke-virtual {p0}, Lcom/pairip/licensecheck/LicenseActivity;->finish()V
            return-void
        """.trimIndent())
        replaceBody("Lcom/pairip/VMRunner;-><clinit>()V", 1, 3, "return-void")
        replaceBody("Lcom/pairip/VMRunner;->invoke(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;", 8, 46, "const/4 v0, 0x0\nreturn-object v0")
        replaceBody("Lcom/pairip/VMRunner;->isDebuggingEnabled()Z", 2, 5, "const/4 v0, 0x1\nreturn v0")
        exact("Lcom/pairip/VMRunner;", "invoke", "Ljava/lang/Object;", "Ljava/lang/String;", "[Ljava/lang/Object;").method.addInstructions(0, """
            new-instance v0, Ljava/lang/Throwable;
            invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V
            invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;
            move-result-object v0
            const-string v1, "VMRunner"
            invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
            move-result v0
        """.trimIndent())
    }
}
