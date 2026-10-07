package app.s.chzzk.branding

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.s.chzzk.common.utils.getReference
import app.s.chzzk.shared.Constants.COMPATIBILITY_CHZZK
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element

private const val ORIGINAL_PACKAGE = "com.navercorp.game.android.community"

@Suppress("unused")
val changePackageNamePatch = bytecodePatch(
    name = "Change package name",
    description = "Installs alongside the original app using a separate package name and app data.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CHZZK)
    val packageName by stringOption(
        key = "packageName",
        default = "$ORIGINAL_PACKAGE.morphe",
        title = "패키지 이름",
        description = "원본과 함께 설치할 앱의 고유 이름입니다. 업데이트할 때도 같은 값을 사용하세요.",
        required = true,
    ) {
        it != null && it != ORIGINAL_PACKAGE && it.length <= 255 &&
            it.matches(Regex("[a-zA-Z][a-zA-Z0-9_]*(\\.[a-zA-Z][a-zA-Z0-9_]*)+"))
    }
    val replacements = linkedMapOf<String, String>()
    dependsOn(resourcePatch {
        execute {
            val replacement = packageName!!
            replacements.clear()
            replacements[ORIGINAL_PACKAGE] = replacement
            document("AndroidManifest.xml").use { document ->
                val manifest = document.documentElement
                check(manifest.getAttribute("package") == ORIGINAL_PACKAGE)
                val application = manifest.getElementsByTagName("application").item(0) as Element
                val providers = application.getElementsByTagName("provider")
                for (index in 0 until providers.length) {
                    val provider = providers.item(index) as Element
                    val authorities = provider.getAttribute("android:authorities").split(';')
                    provider.setAttribute("android:authorities", authorities.joinToString(";") { authority ->
                        check(authority.startsWith("$ORIGINAL_PACKAGE.")) { "Unexpected provider: $authority" }
                        val renamed = replacement + authority.removePrefix(ORIGINAL_PACKAGE)
                        replacements[authority] = renamed
                        renamed
                    })
                }
                for (tag in listOf("permission", "uses-permission")) {
                    val permissions = manifest.getElementsByTagName(tag)
                    for (index in 0 until permissions.length) {
                        val permission = permissions.item(index) as Element
                        val name = permission.getAttribute("android:name")
                        if (!name.startsWith("$ORIGINAL_PACKAGE.")) continue
                        val renamed = replacement + name.removePrefix(ORIGINAL_PACKAGE)
                        permission.setAttribute("android:name", renamed)
                        replacements[name] = renamed
                    }
                }
                for (tag in listOf("application", "activity", "activity-alias", "service", "receiver", "provider")) {
                    val nodes = manifest.getElementsByTagName(tag)
                    for (index in 0 until nodes.length) {
                        val node = nodes.item(index) as Element
                        for (attribute in listOf("android:name", "android:targetActivity", "android:backupAgent",
                            "android:appComponentFactory", "android:parentActivityName")) {
                            val name = node.getAttribute(attribute)
                            if (name.startsWith(".")) node.setAttribute(attribute, ORIGINAL_PACKAGE + name)
                            else if (name.isNotEmpty() && !name.contains('.')) {
                                node.setAttribute(attribute, "$ORIGINAL_PACKAGE.$name")
                            }
                        }
                    }
                }
                manifest.setAttribute("package", replacement)
            }
        }
    })
    execute {
        check(replacements[ORIGINAL_PACKAGE] == packageName)
        var replaced = 0
        classDefForEach { original ->
            for (candidate in original.methods) {
                val matches = candidate.implementation?.instructions?.withIndex()?.mapNotNull { (index, instruction) ->
                    val value = instruction.getReference<StringReference>()?.string ?: return@mapNotNull null
                    val replacement = replacements[value] ?: return@mapNotNull null
                    Triple(index, (instruction as OneRegisterInstruction).registerA, replacement)
                }.orEmpty()
                if (matches.isEmpty()) continue
                val method = mutableClassDefBy(original).methods.single { it == candidate }
                for ((index, register, replacement) in matches) {
                    method.replaceInstruction(index, "const-string/jumbo v$register, \"$replacement\"")
                    replaced++
                }
            }
        }
        check(replaced > 0) { "CHZZK application package configuration was not found" }
    }
}

@Suppress("unused")
val customBrandingPatch = resourcePatch(
    name = "Custom app branding",
    description = "Changes the app name shown by Android. Defaults to 치지직 S.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CHZZK)
    val appName by stringOption(
        key = "appName",
        default = "치지직 S",
        title = "앱 이름",
        description = "홈 화면과 Android 앱 목록에 표시할 이름입니다.",
        required = true,
    ) { it != null && it.isNotBlank() && it.length <= 80 && it.none(Char::isISOControl) }
    execute {
        document("res/values/strings.xml").use { document ->
            val label = document.createElement("string")
            label.setAttribute("name", "s_chzzk_app_name")
            label.setAttribute("translatable", "false")
            label.textContent = "\"" + appName!!.trim().replace("\\", "\\\\").replace("\"", "\\\"") + "\""
            document.documentElement.appendChild(label)
        }
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            application.setAttribute("android:label", "@string/s_chzzk_app_name")
            for (tag in listOf("activity", "activity-alias")) {
                val nodes = application.getElementsByTagName(tag)
                for (index in 0 until nodes.length) {
                    val node = nodes.item(index) as Element
                    val categories = node.getElementsByTagName("category")
                    val launcher = (0 until categories.length).any {
                        (categories.item(it) as Element).getAttribute("android:name") in
                            listOf("android.intent.category.LAUNCHER", "android.intent.category.LEANBACK_LAUNCHER")
                    }
                    if (launcher) node.setAttribute("android:label", "@string/s_chzzk_app_name")
                }
            }
        }
    }
}
