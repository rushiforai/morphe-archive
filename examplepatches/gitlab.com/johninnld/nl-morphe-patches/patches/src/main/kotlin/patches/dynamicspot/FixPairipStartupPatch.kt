package patches.dynamicspot

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import java.util.function.Supplier

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

/** The c2020 dispatcher classes RePairip generated for this build; added to the patched app. */
private val restoreDexStream = Supplier {
    checkNotNull(object {}.javaClass.getResourceAsStream("/dynamicspot-restore.dex")) {
        "dynamicSpot restore dex is missing from the patch bundle resources"
    }
}

private fun BytecodePatchContext.addClinit(type: String, registerCount: Int, body: String) {
    val cls = mutableClassDefBy(type)
    check(cls.methods.none { it.name == "<clinit>" }) { "Unexpected existing initializer: $type" }
    val method = ImmutableMethod(type, "<clinit>", emptyList(), "V",
        AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value, null, null,
        ImmutableMethodImplementation(registerCount, emptyList(), emptyList(), emptyList()))
    val mutable = MutableMethod(method)
    mutable.addInstructions(0, body)
    check(cls.methods.add(mutable)) { "Duplicate initializer: $type" }
}

/**
 * dynamicSpot 3.02 virtualises its startup through the PairIP VM: the wrapped Application
 * boots the native VM, which populates ~1,525 string constants and nine reflective dispatch
 * methods in junk holder classes, and the real lifecycle code (Application.onCreate and the
 * SettingsHome/CallActivity lifecycle hooks) only runs through those dispatchers. A patched,
 * re-signed app trips the pinned-signature check and the native VM refuses to run, so the
 * app dies at startup.
 *
 * This patch restores everything the VM would have populated, following the Flitsmeister
 * "Fix PairIP startup" recipe: the captured constants are baked into each holder's static
 * initializer, the nine Method fields are rebound to dispatcher classes that call the
 * app's own `$hash` implementation methods (shipped in the bundle as an embedded restore
 * dex), and the signature check, license client, startup launcher and VM runner are
 * neutralised so libpairipcore never loads.
 */
@Suppress("unused")
val fixPairipStartupPatch = bytecodePatch(
    name = "Fix PairIP startup",
    description = "Restores the captured PairIP startup data (string constants and lifecycle " +
        "dispatch) and disables the integrity, license and VM startup checks, so a re-signed " +
        "patched dynamicSpot starts normally.",
) {
    compatibleWith(dynamicspot)
    dependsOn(patches.shared.originalInput(dynamicspot))
    extendWithAll { listOf(restoreDexStream) }

    execute {
        check(StartupRestoreData.strings.size == 32)
        check(StartupRestoreData.strings.values.sumOf { it.size } == 1525)
        check(StartupRestoreData.methods.size == 4)
        check(StartupRestoreData.methods.values.sumOf { it.size } == 9)

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

        StartupRestoreData.methods.forEach { (holder, entries) ->
            val body = buildString {
                entries.forEach { (field, dispatcher) ->
                    val (dispatcherType, methodName, parameters) = dispatcher
                    append("const-class v0, $dispatcherType\n")
                    append("const-string v1, ${smaliString(methodName)}\n")
                    append("const/4 v2, 0x${parameters.size.toString(16)}\n")
                    append("new-array v2, v2, [Ljava/lang/Class;\n")
                    parameters.forEachIndexed { index, type ->
                        append(classConstant(type)).append('\n')
                        append("const/4 v4, 0x${index.toString(16)}\n")
                        append("aput-object v3, v2, v4\n")
                    }
                    append(
                        "invoke-virtual {v0, v1, v2}, " +
                            "Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;\n",
                    )
                    append("move-result-object v0\n")
                    append("sput-object v0, $holder->$field:Ljava/lang/reflect/Method;\n")
                }
                append("return-void")
            }
            addClinit(holder, 5, body)
        }

        // Integrity, licensing and the VM itself never run again.
        VerifyIntegrityFingerprint.method.addInstruction(0, "return-void")
        CheckLicenseFingerprint.method.addInstruction(0, "return-void")
        StartupLauncherLaunchFingerprint.method.addInstruction(0, "return-void")
        VmRunnerClinitFingerprint.method.addInstruction(0, "return-void")
        VmRunnerInvokeFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
    }
}
