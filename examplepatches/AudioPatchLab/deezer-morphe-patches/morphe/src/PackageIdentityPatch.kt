package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.xml.XmlElement
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val ORIGINAL_PACKAGE = "deezer.android.app"
private const val PATCHED_PACKAGE = "deezer.android.app.morphe"
private const val SEARCH_AUTHORITY = "$ORIGINAL_PACKAGE.provider.SearchSuggestionProvider"
private const val SOCIAL_STORY_AUTHORITY = "$ORIGINAL_PACKAGE.fileprovider.socialstory"
private const val RECEIVER_PERMISSION = "$ORIGINAL_PACKAGE.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION"
private const val ACCOUNT_PERMISSION = "com.deezer.permission.account"
private const val PATCHED_ACCOUNT_PERMISSION = "$PATCHED_PACKAGE.permission.account"

private fun XmlElement.rewritePackageAttribute(name: String) {
    val value = attribute(name) ?: return
    if (value == ORIGINAL_PACKAGE || value.startsWith("$ORIGINAL_PACKAGE.")) {
        setAttribute(name, PATCHED_PACKAGE + value.removePrefix(ORIGINAL_PACKAGE))
    }
}

@Suppress("unused")
val packageIdentityPatch = patch(
    name = "Install alongside official Deezer",
    description = "Adds .morphe to the package ID. Deselect to keep deezer.android.app. Replacing an existing official installation requires uninstalling it because the signing keys differ.",
    default = true,
) {
    compatibleWith(deezerCompatibility)

    execute {
        resourceXml("AndroidManifest.xml").use { manifest ->
            check(manifest.root.attribute("package") == ORIGINAL_PACKAGE)
            manifest.root.setAttribute("package", PATCHED_PACKAGE)
            // The media notification derives this action from Context.getPackageName().
            val playerActions = manifest.elements("action").filter {
                it.attribute("android:name") == "$ORIGINAL_PACKAGE.GO_TO_PLAYER"
            }
            check(playerActions.count() == 1) { "Missing player notification intent filter" }
            playerActions.single().setAttribute("android:name", "$PATCHED_PACKAGE.GO_TO_PLAYER")
            manifest.elements("provider").forEach { provider ->
                provider.rewritePackageAttribute("android:authorities")
                if (provider.attribute("android:permission") == ACCOUNT_PERMISSION) {
                    provider.setAttribute("android:permission", PATCHED_ACCOUNT_PERMISSION)
                }
            }
            for (tag in listOf("permission", "uses-permission")) {
                for (permission in manifest.elements(tag)) {
                    when (permission.attribute("android:name")) {
                        RECEIVER_PERMISSION -> permission.rewritePackageAttribute("android:name")
                        ACCOUNT_PERMISSION -> permission.setAttribute("android:name", PATCHED_ACCOUNT_PERMISSION)
                    }
                }
            }
        }

        resourceXml("res/xml/searchable.xml").use {
            it.root.rewritePackageAttribute("android:searchSuggestAuthority")
        }
        resourceXml("res/xml/shortcuts.xml").use { shortcuts ->
            shortcuts.elements("intent").forEach { it.rewritePackageAttribute("android:targetPackage") }
        }

        // Keep the callers of the renamed providers in the new app namespace.
        val providerReferences = mapOf(
            "Ldeezer/android/utils/SearchSuggestionProvider;" to SEARCH_AUTHORITY,
            "LlllIIlllllIlII;" to SOCIAL_STORY_AUTHORITY,
            "LIlIIlllIlIlIIllI;" to SOCIAL_STORY_AUTHORITY,
            "LlIlllIlIIIlIlI;" to SOCIAL_STORY_AUTHORITY,
            "LllIlllIIIIIIll;" to ORIGINAL_PACKAGE,
            "LIIlIIlllIIIlllII;" to ORIGINAL_PACKAGE,
            "LIIllllIIIIIIIIl;" to ORIGINAL_PACKAGE,
        )
        for ((type, oldValue) in providerReferences) {
            var matches = 0
            for (method in mutableClassDefBy(type).methods) {
                val instructions = method.implementation?.instructions ?: continue
                for ((index, instruction) in instructions.withIndex()) {
                    val opcode = when (instruction.opcode) {
                        Opcode.CONST_STRING -> "const-string"
                        Opcode.CONST_STRING_JUMBO -> "const-string/jumbo"
                        else -> continue
                    }
                    val reference = (instruction as ReferenceInstruction).reference as StringReference
                    if (reference.string != oldValue) continue
                    val register = (instruction as OneRegisterInstruction).registerA
                    val newValue = PATCHED_PACKAGE + oldValue.removePrefix(ORIGINAL_PACKAGE)
                    method.replaceInstruction(index, "$opcode v$register, \"$newValue\"")
                    matches++
                }
            }
            check(matches > 0) { "Missing provider reference in $type" }
        }
    }
}

internal val appBasePatch = patch {
    dependsOn(playbackSessionPatch, homeLoadingPatch, profileCountPatch)
}
