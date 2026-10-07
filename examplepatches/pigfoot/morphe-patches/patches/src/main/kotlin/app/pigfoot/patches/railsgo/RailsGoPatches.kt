package app.pigfoot.patches.railsgo

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.*
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import java.security.MessageDigest
import org.w3c.dom.Element

private const val OLD = "com.waccliu.taiwanrail"
private const val DEFAULT_PACKAGE = "com.waccliu.taiwanrail.morphe"
private const val K_PIN = "425abc750e8d3f4bc64fa08dda9f204842d5734c12a72c8d8bfcec404593ff9e"
private const val LICENSE_PIN = "1613a00fd0c7316397165c68908ca6ea2357245f20bebdbccc5079c5193ec1ba"
private val target = Compatibility(
    packageName = OLD,
    name = "台灣鐵道通",
    apkFileType = ApkFileType.APKS,
    targets = listOf(AppTarget("1.25.2", versionCodes = mapOf(SupportedAbi.ARM64_V8A to 156)))
)

// Canonical class-level DEX fingerprint, independent of original ZIP/DEX layout.
private fun requireClass(original: ClassDef, pin: String) {
    val pool = DexPool(Opcodes.forDexVersion(37))
    pool.internClass(original)
    val store = MemoryDataStore()
    pool.writeTo(store)
    val actual = MessageDigest.getInstance("SHA-256").digest(store.data)
        .joinToString("") { "%02x".format(it) }
    require(actual == pin) { "Unsupported or already modified class: ${original.type}" }
}

val parallelInstallPatch = resourcePatch(
    name = "Change package name",
    description = "Optional parallel installation with a default or custom package name. Without this patch the original package is retained. The app name is unchanged; providers, permissions and links are isolated when selected.",
    default = false
) {
    compatibleWith(target)
    availability { installer, _ ->
        if (installer == InstallerType.MOUNT) PatchAvailability.UNAVAILABLE else PatchAvailability.DISABLED
    }
    val packageName by stringOption(
        key = "packageName",
        default = DEFAULT_PACKAGE,
        title = "Package name",
        description = "Used only when this patch is selected. Keep the default to update an existing .morphe install with the same signing key. The app name is unchanged.",
        required = true,
        validator = { value ->
            value != null && value.length <= 200 &&
                Regex("[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)+").matches(value) &&
                value != OLD && value != "$OLD.diagnostic"
        }
    )
    execute {
        val newPackage = requireNotNull(packageName)
        val newScheme = if (newPackage == DEFAULT_PACKAGE) "taiwanrail-morphe" else
            "taiwanrail-" + newPackage.toByteArray(Charsets.UTF_8).joinToString("") { "%02x".format(it) }
        require(packageMetadata.versionName == "1.25.2" && packageMetadata.versionCode == "156")
        document("AndroidManifest.xml").use { doc ->
            val manifest = doc.documentElement
            require(manifest.getAttribute("package") == OLD)
            val elements = doc.getElementsByTagName("*")
            var providers = 0
            var permissions = 0
            var schemes = 0
            for (i in 0 until elements.length) {
                val e = elements.item(i) as Element
                fun read(n: String) = e.getAttribute("android:$n")
                fun write(n: String, v: String) = e.setAttribute("android:$n", v)
                when (e.tagName) {
                    "provider" -> {
                        val a = read("authorities")
                        require(a.startsWith("$OLD.")) { "Unexpected provider: $a" }
                        write("authorities", newPackage + a.removePrefix(OLD))
                        providers++
                    }
                    "permission", "uses-permission" -> {
                        val n = read("name")
                        if (n.startsWith("$OLD.")) {
                            require(n == "$OLD.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION")
                            write("name", newPackage + n.removePrefix(OLD))
                            permissions++
                        }
                    }
                    "data" -> if (read("scheme") == "taiwanrail") {
                        write("scheme", newScheme)
                        schemes++
                    }
                }
            }
            require(providers == 6 && permissions == 2 && schemes == 1) { "Unsupported manifest shape" }
            manifest.setAttribute("package", newPackage)
        }
    }
}

val startupCompatibilityPatch = bytecodePatch(
    name = "RailsGo sideload startup compatibility",
    description = "Required for supported re-signed standard or Shizuku installs, with or without package renaming. Bypasses the Java Play-license startup entry. Root mount is not qualified."
) {
    compatibleWith(target)
    availability { installer, _ ->
        if (installer == InstallerType.MOUNT) PatchAvailability.UNAVAILABLE else PatchAvailability.REQUIRED
    }
    execute {
        require(packageMetadata.versionName == "1.25.2" && packageMetadata.versionCode == "156")
        requireClass(classDefBy("Lcom/pairip/licensecheck/LicenseClient;"), LICENSE_PIN)
        val method = mutableClassDefBy("Lcom/pairip/licensecheck/LicenseClient;").methods.single {
            it.name == "checkLicense" && it.parameterTypes == listOf("Landroid/content/Context;") && it.returnType == "V"
        }
        method.addInstructions(0, "return-void")
    }
}

val busUpdatePatch = bytecodePatch(
    name = "RailsGo bus update without video",
    description = "Complete the observed bus-update rewarded unit using its loaded reward metadata; retain the original fallback. Requires sideload startup compatibility, not package renaming."
) {
    compatibleWith(target)
    availability { installer, _ ->
        if (installer == InstallerType.MOUNT) PatchAvailability.UNAVAILABLE else PatchAvailability.ENABLED
    }
    dependsOn(startupCompatibilityPatch)
    extendWith("extensions/railsgo-bus.mpe")
    execute {
        require(packageMetadata.versionName == "1.25.2" && packageMetadata.versionCode == "156")
        requireClass(classDefBy("Lv5/K;"), K_PIN)
        val method = mutableClassDefBy("Lv5/K;").methods.single {
            it.name == "e" && it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        require(method.implementation!!.registerCount == 5)
        val original = method.implementation!!.instructions.first()
        method.addInstructionsWithLabels(0, """
            invoke-static {p0}, Lv5/RailsGoBusUpdate;->tryComplete(Lv5/K;)Z
            move-result v0
            if-eqz v0, :original_show
            return-void
        """, ExternalLabel("original_show", original))
    }
}
