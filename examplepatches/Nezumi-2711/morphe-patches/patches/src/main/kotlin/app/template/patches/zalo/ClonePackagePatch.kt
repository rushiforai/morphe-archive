package app.template.patches.zalo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element

private const val ORIGINAL_PACKAGE = "com.zing.zalo"
private val cloneCompatibility = Compatibility(
        name = "Zalo",
        packageName = ORIGINAL_PACKAGE,
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0068FF,
        targets = listOf(AppTarget(version = "26.08.01"), AppTarget(version = "26.10.02")),
    )
private val cloneIdentities = linkedMapOf<String, String>()
private object CloneMainProcess : Fingerprint(
    filters = listOf(
        methodCall(definingClass = "Landroid/os/Process;", name = "myPid"),
        string(ORIGINAL_PACKAGE),
    ),
)
private object CloneAccountOwner : Fingerprint(
    filters = listOf(string("account_type"), string("ZaloAccount")),
)

private val clonePackageOption = stringOption(
        key = "packageName",
        default = "com.zing.zalo.clone",
        title = "Clone package name",
        description = "Unique Android package for this clone. Do not select the stock package.",
        required = true,
        validator = { value ->
            value != null && value != ORIGINAL_PACKAGE && value.length <= 255 &&
                Regex("[a-zA-Z][a-zA-Z0-9_]*(\\.[a-zA-Z][a-zA-Z0-9_]*)+").matches(value)
        },
    )
private val cloneNameOption = stringOption(
        key = "appName",
        default = "Zalo Clone",
        title = "Clone app name",
        description = "Name displayed in the launcher and Android app settings.",
        required = true,
        validator = { !it.isNullOrBlank() && it.length <= 80 && it.none(Char::isISOControl) },
    )

private val clonePackageResources = resourcePatch {
    compatibleWith(cloneCompatibility)
    execute {
        val clonePackage = clonePackageOption.value!!
        val cloneName = cloneNameOption.value!!
        cloneIdentities.clear()
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            check(manifest.getAttribute("package") == ORIGINAL_PACKAGE) {
                "Clone package must be applied to the original Zalo package"
            }
            val elements = document.getElementsByTagName("*")
            val permissions = (0 until elements.length).map { elements.item(it) as Element }
                .filter { it.tagName == "permission" || it.tagName == "permission-tree" || it.tagName == "permission-group" }
                .associate { element ->
                    val name = element.getAttribute("android:name")
                    name to if (name.startsWith("$ORIGINAL_PACKAGE.")) {
                        clonePackage + name.removePrefix(ORIGINAL_PACKAGE)
                    } else {
                        "$clonePackage.$name"
                    }
                }
            cloneIdentities.putAll(permissions)
            val componentTags = setOf("application", "activity", "activity-alias", "service", "receiver", "provider", "instrumentation")
            for (index in 0 until elements.length) {
                val element = elements.item(index) as Element
                if (element.tagName in componentTags) {
                    for (attribute in listOf("android:name", "android:targetActivity", "android:parentActivityName", "android:backupAgent", "android:appComponentFactory")) {
                        val value = element.getAttribute(attribute)
                        if (value.isNotEmpty() && (value.startsWith(".") || !value.contains('.'))) {
                            element.setAttribute(attribute, if (value.startsWith(".")) ORIGINAL_PACKAGE + value else "$ORIGINAL_PACKAGE.$value")
                        }
                    }
                }
                for (attribute in listOf("android:name", "android:permission", "android:readPermission", "android:writePermission", "android:permissionGroup")) {
                    permissions[element.getAttribute(attribute)]?.let { element.setAttribute(attribute, it) }
                }
                if (element.tagName == "provider") {
                    val authorities = element.getAttribute("android:authorities")
                    if (authorities.isNotEmpty()) element.setAttribute("android:authorities", authorities.split(';').joinToString(";") { authority ->
                        val replacement = if (authority == ORIGINAL_PACKAGE || authority.startsWith("$ORIGINAL_PACKAGE.")) {
                            clonePackage + authority.removePrefix(ORIGINAL_PACKAGE)
                        } else {
                            "$clonePackage.$authority"
                        }
                        if (authority != ORIGINAL_PACKAGE) cloneIdentities[authority] = replacement
                        cloneIdentities["content://$authority"] = "content://$replacement"
                        replacement
                    })
                }
                val affinity = element.getAttribute("android:taskAffinity")
                if (affinity == ORIGINAL_PACKAGE || affinity.startsWith("$ORIGINAL_PACKAGE.")) {
                    element.setAttribute("android:taskAffinity", clonePackage + affinity.removePrefix(ORIGINAL_PACKAGE))
                }
                if (element.tagName == "application" || element.tagName == "activity-alias" ||
                    (element.tagName == "activity" && element.getElementsByTagName("intent-filter").let { filters ->
                        (0 until filters.length).any { filterIndex ->
                            val categories = (filters.item(filterIndex) as Element).getElementsByTagName("category")
                            (0 until categories.length).any { categoryIndex ->
                                (categories.item(categoryIndex) as Element).getAttribute("android:name") == "android.intent.category.LAUNCHER"
                            }
                        }
                    })) {
                    element.setAttribute("android:label", cloneName)
                }
            }
            manifest.setAttribute("package", clonePackage)
        }
        for (path in listOf("res/xml/authenticator.xml", "res/xml/syncadapter.xml", "res/xml/contacts.xml")) {
            document(path).use { document ->
                val elements = document.getElementsByTagName("*")
                for (index in 0 until elements.length) {
                    val element = elements.item(index) as Element
                    if (element.getAttribute("android:accountType") == ORIGINAL_PACKAGE) {
                        element.setAttribute("android:accountType", clonePackage)
                    }
                }
            }
        }
    }
}

@Suppress("unused")
val clonePackagePatch = bytecodePatch(
    name = "Clone package",
    description = "Install an ARM64 Zalo clone alongside the original with a custom package and app name. Separate accounts are required.",
    default = false,
) {
    compatibleWith(cloneCompatibility)
    dependsOn(nativeSignaturePatch, clonePackageResources)
    clonePackageOption()
    cloneNameOption()

    execute {
        check(cloneIdentities.isNotEmpty()) { "Missing clone manifest identities" }
        check(CloneMainProcess.matchAll(1..1).size == 1)
        check(CloneAccountOwner.matchAll(1..1).size == 1)
        val selfMethods = mutableClassDefBy(CloneAccountOwner.method.definingClass).methods + CloneMainProcess.method
        for (method in selfMethods) {
            val instructions = method.implementation?.instructions?.toList() ?: continue
            for ((index, instruction) in instructions.withIndex()) {
                if (((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string != ORIGINAL_PACKAGE) continue
                val register = (instruction as OneRegisterInstruction).registerA
                method.replaceInstruction(index, "const-string v$register, \"${clonePackageOption.value!!}\"")
            }
        }
        for ((original, replacement) in cloneIdentities) {
            val fingerprint = object : Fingerprint(filters = listOf(string(original))) {}
            for (match in fingerprint.matchAll(0..Int.MAX_VALUE)) {
                val method = match.method
                val instructions = method.implementation!!.instructions.toList()
                for ((index, instruction) in instructions.withIndex()) {
                    val value = ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
                    if (value != original) continue
                    val register = (instruction as OneRegisterInstruction).registerA
                    method.replaceInstruction(index, "const-string v$register, \"$replacement\"")
                }
            }
        }
    }
}