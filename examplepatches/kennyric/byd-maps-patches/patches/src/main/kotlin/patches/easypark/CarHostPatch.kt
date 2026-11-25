package patches.easypark

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.w3c.dom.Element

private const val ANDROID = "http://schemas.android.com/apk/res/android"
private val packageName = Regex("[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)+")
private val easypark = Compatibility(
    name = "EasyPark", packageName = "net.easypark.android", apkFileType = ApkFileType.APKM,
    appIconColor = 0xff7cac,
    signatures = setOf("0639fa559a0571df5d38d716dd670757043033cdd5e719150f3cb87270fa4cfc"),
    targets = listOf(AppTarget(version = "26.40.1", minSdk = 26,
        versionCodes = mapOf(SupportedAbi.ARM64_V8A to 82640010, SupportedAbi.ARMEABI_V7A to 82640010))),
)
internal val easyparkNl = Compatibility(
    name = "EasyPark NL", packageName = "com.parkmobile", apkFileType = ApkFileType.APKS,
    signatures = setOf("2ca37a08cb0213a2750a09afc8a1e783e2220fc047db440f55d4171594a7b065"),
    targets = listOf(AppTarget(version = "26.42.4", minSdk = 32,
        versionCodes = mapOf(SupportedAbi.ARM64_V8A to 82642040))),
)
internal val originalInput = patches.shared.originalInput(easypark, variants = listOf(easyparkNl))
internal val nlOriginalInput = patches.shared.originalInput(easyparkNl)
private val hostTypes = mapOf(
    "net.easypark.android" to ("Lcu7;" to "Lbu7;"),
    "com.parkmobile" to ("Lm08;" to "Ll08;"),
)

private fun hosts(value: String?): List<String> {
    if (value.isNullOrBlank()) return emptyList()
    require(value.length <= 2000) { "EasyPark host package list is too long" }
    return value.split(',').map(String::trim).distinct().also { names ->
        require(names.all(packageName::matches)) { "Use comma-separated Android host package names" }
    }
}

@Suppress("unused")
val carHostPatch = bytecodePatch(
    name = "Allow custom Android Auto hosts",
    description = "Enables EasyPark on third-party Android Auto systems such as DriveDeck. " +
        "Only install this patch if you use a third-party system. Optionally restrict access to listed host packages. " +
        "EasyPark NL sign-in requires MicroG-RE; phone and email sign-in do not work.",
    default = true,
) {
    compatibleWith(easypark, easyparkNl)
    val allowedHostPackages by stringOption(
        key = "allowedHostPackages", default = "", title = "Allowed host packages",
        description = "Leave empty to allow all compatible hosts. Otherwise enter comma-separated host app " +
            "package names; every other host is denied, including Android Auto unless listed. Repatch to change this list.",
        required = false,
    )
    // Validate in execute. Morphe's option setter logs rejected validator values
    // and keeps the default, which would turn a malformed restriction into allow-all.

    val visibility = resourcePatch {
        dependsOn(originalInput)
        execute {
            val names = hosts(allowedHostPackages)
            document("AndroidManifest.xml").use { doc ->
                val root = doc.documentElement
                if (names.isEmpty()) {
                    // Arbitrary host packages must be visible for the package/UID check.
                    val permissions = doc.getElementsByTagName("uses-permission")
                    if ((0 until permissions.length).none {
                        (permissions.item(it) as Element).getAttributeNS(ANDROID, "name") == "android.permission.QUERY_ALL_PACKAGES"
                    }) root.appendChild(doc.createElement("uses-permission").apply {
                        setAttributeNS(ANDROID, "android:name", "android.permission.QUERY_ALL_PACKAGES")
                    })
                } else {
                    val queries = doc.getElementsByTagName("queries").item(0) as? Element
                        ?: doc.createElement("queries").also(root::appendChild)
                    val existing = queries.getElementsByTagName("package")
                    for (name in names) if ((0 until existing.length).none {
                        (existing.item(it) as Element).getAttributeNS(ANDROID, "name") == name
                    }) queries.appendChild(doc.createElement("package").apply {
                        setAttributeNS(ANDROID, "android:name", name)
                    })
                }
            }
        }
    }
    dependsOn(originalInput, visibility)
    execute {
        val names = hosts(allowedHostPackages)
        // Exact R8 bindings for the inspected builds. CarAppBinder constructs the host identity using
        // HandshakeInfo.getHostPackageName() and Binder.getCallingUid() synchronously.
        val (validatorType, hostType) = hostTypes.getValue(packageMetadata.packageName)
        check(classDefBy("Lnet/easypark/android/auto/MobileCarAppService;").methods.any {
            it.name == "a" && it.parameterTypes.isEmpty() && it.returnType == validatorType
        }) { "EasyPark car service validator changed" }
        val owner = mutableClassDefBy(validatorType)
        check(owner.fields.any { it.name == "d" && it.type == "Landroid/content/pm/PackageManager;" }) {
            "EasyPark host validator package manager changed"
        }
        val host = classDefBy(hostType)
        check(host.fields.any { it.name == "c" && it.type == "Ljava/lang/String;" } &&
            host.fields.any { it.name == "b" && it.type == "I" }) { "EasyPark host identity changed" }
        val original = owner.methods.single {
            it.name == "b" && it.returnType == "Z" && it.parameterTypes.map(CharSequence::toString) == listOf(hostType)
        }
        // Own the whole decision: the original cache, debug bypass, system UID and
        // privileged-renderer exceptions must not override an explicit restricted list.
        val replacement = ImmutableMethod(original.definingClass, original.name, original.parameters,
            original.returnType, original.accessFlags, original.annotations, original.hiddenApiRestrictions,
            MutableMethodImplementation(6)).toMutable()
        val policy = if (names.isEmpty()) "goto :accept" else names.joinToString("\n") { name -> """
            const-string v2, "$name"
            invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v2
            if-nez v2, :accept
        """ } + "\ngoto :deny"
        val source = """
            if-eqz p1, :deny
            iget-object v0, p0, $validatorType->d:Landroid/content/pm/PackageManager;
            if-eqz v0, :deny
            iget-object v1, p1, $hostType->c:Ljava/lang/String;
            if-eqz v1, :deny
            :lookup_start
            const/4 v2, 0x0
            invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageUid(Ljava/lang/String;I)I
            move-result v2
            :lookup_end
            iget v3, p1, $hostType->b:I
            if-ne v2, v3, :deny
            $policy
            :accept
            const/4 v0, 0x1
            return v0
            :lookup_failed
            move-exception v0
            :deny
            const/4 v0, 0x0
            return v0
        """.trimIndent()
        replacement.addInstructions(0, source)
        // InlineSmaliCompiler returns instructions only; persist the handler explicitly.
        fun index(label: String) = source.lineSequence().takeWhile { it.trim() != label }
            .count { it.isNotBlank() && !it.trim().startsWith(":") }
        replacement.implementation!!.apply {
            addCatch("Landroid/content/pm/PackageManager\$NameNotFoundException;",
                newLabelForIndex(index(":lookup_start")), newLabelForIndex(index(":lookup_end")),
                newLabelForIndex(index(":lookup_failed")))
        }
        check(owner.methods.remove(original)) { "EasyPark host validator disappeared" }
        owner.methods.add(replacement)
    }
}
