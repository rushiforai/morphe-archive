package patches.ytmusic

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import java.util.function.Function
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.w3c.dom.Element

private const val SUPPORT = "Lpatches/ytmusic/GearslipSupport;"
private const val BROWSER = "Lcom/google/android/apps/youtube/music/mediabrowser/MusicBrowserService;"
private const val HOST = "app.seb3thehacker.gearslip"
private const val ANDROID = "http://schemas.android.com/apk/res/android"
private const val ORIGINAL_ELIGIBILITY = "morpheOriginalBrowserEligibility"
private val packageNamePattern = Regex("^[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)+$")

private val packages = setOf("com.google.android.apps.youtube.music", "app.morphe.android.apps.youtube.music")
private val compatibility = packages.map { name ->
    Compatibility(
        name = "YouTube Music", packageName = name,
        apkFileType = if (name == "com.google.android.apps.youtube.music") ApkFileType.APKM else ApkFileType.APK,
        targets = listOf(AppTarget(version = null)),
    )
}

@Suppress("unused")
val gearslipMusicSupport = bytecodePatch(
    name = "Gearslip music browser support",
    description = "Allows installed Gearslip hosts to browse YouTube Music using their actual Android caller UID, without Google Android Auto.",
) {
    compatibleWith(*compatibility.toTypedArray())
    extendWith("extensions/gearslip-ytm.mpe")

    val packageNames by stringOption(
        key = "packageNames", default = HOST, title = "Trusted Gearslip packages",
        description = "Comma-separated installed Gearslip host package names. Each caller must own its package under its actual callback UID.",
        required = true,
    ) { value ->
        value != null && value.length <= 2000 && value.split(',').all { packageNamePattern.matches(it.trim()) }
    }

    val visibility = resourcePatch {
        execute {
            check(packageMetadata.packageName in packages) { "Unsupported YouTube Music package" }
            document("AndroidManifest.xml").use { manifest ->
                val queries = (manifest.getElementsByTagName("queries").item(0) as? Element)
                    ?: manifest.createElement("queries").also(manifest.documentElement::appendChild)
                val existing = queries.getElementsByTagName("package")
                packageNames!!.split(',').map(String::trim).distinct().forEach { host ->
                    if ((0 until existing.length).none {
                        (existing.item(it) as Element).getAttributeNS(ANDROID, "name") == host
                    }) queries.appendChild(manifest.createElement("package").apply {
                        setAttributeNS(ANDROID, "android:name", host)
                    })
                }
            }
        }
    }
    dependsOn(visibility)

    execute {
        check(packageMetadata.packageName in packages) { "Unsupported YouTube Music package" }
        val candidates = Fingerprint(returnType = "Z", filters = listOf(string(BrowserDiscovery.UID_DIAGNOSTIC)))
            .matchAll().map { it.method }.toList()
        val layout = BrowserDiscovery.discover(candidates, classDefBy(BROWSER), Function { classDefBy(it) })
        val owner = mutableClassDefBy(layout.trust.definingClass)
        val trust = owner.methods.single { it.toString() == layout.trust.toString() }
        val eligible = owner.methods.single { it.toString() == layout.eligible.toString() }
        val originalTrust = "morpheOriginalCallerPolicy"
        check(owner.methods.none { it.name in setOf(originalTrust, ORIGINAL_ELIGIBILITY) }) {
            "Gearslip browser support is already applied"
        }
        val configured = mutableClassDefBy(SUPPORT).methods.single {
            it.name == "getConfiguredPackageNames" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;"
        }
        configured.addInstructions(0, "const-string v0, \"${packageNames!!.split(',').joinToString(",") { it.trim() }}\"\nreturn-object v0")

        // Preserve both original implementations verbatim. Wrappers own their locals, so
        // changing R8 register allocations cannot shift parameters in the original code.
        fun wrap(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod, name: String,
                 registers: Int, body: String) {
            val original = ImmutableMethod(method.definingClass, name, method.parameters,
                method.returnType, method.accessFlags, method.annotations, method.hiddenApiRestrictions,
                method.implementation).toMutable()
            val wrapper = ImmutableMethod(method.definingClass, method.name, method.parameters,
                method.returnType, method.accessFlags, method.annotations, method.hiddenApiRestrictions,
                MutableMethodImplementation(registers)).toMutable()
            wrapper.addInstructions(0, body)
            check(owner.methods.remove(method)) { "Browser method disappeared before wrapping" }
            owner.methods.add(original)
            owner.methods.add(wrapper)
        }
        fun invoke(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) =
            if (AccessFlags.PRIVATE.isSet(method.accessFlags)) "invoke-direct" else "invoke-virtual"
        val type = owner.type
        val callerType = trust.parameterTypes[0]
        val clientType = trust.parameterTypes[1]
        wrap(trust, originalTrust, 7, """
            if-eqz p1, :original_caller_policy
            if-eqz p2, :original_caller_policy
            iget-object v0, p0, ${layout.contextField}
            iget-object v1, p1, ${layout.callerPackage}
            invoke-static { v0, v1, p3 }, $SUPPORT->decision(Landroid/content/Context;Ljava/lang/String;I)I
            move-result v0
            if-ltz v0, :original_caller_policy
            return v0
            :original_caller_policy
            ${invoke(trust)}/range { p0 .. p3 }, $type->$originalTrust($callerType${clientType}I)Z
            move-result v0
            return v0
        """)
        wrap(eligible, ORIGINAL_ELIGIBILITY, 3, """
            if-eqz p1, :original_browser_eligibility
            iget-object v0, p1, ${layout.clientPackage}
            invoke-static { v0 }, $SUPPORT->isConfiguredPackage(Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :original_browser_eligibility
            return v0
            :original_browser_eligibility
            ${invoke(eligible)} { p0, p1 }, $type->$ORIGINAL_ELIGIBILITY($clientType)Z
            move-result v0
            return v0
        """)
    }
}
