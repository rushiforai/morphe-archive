// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.misc.enableultra

import app.edbfi.patches.shared.Edit
import app.edbfi.patches.shared.isCallTo
import app.edbfi.patches.shared.returnBoolean
import app.edbfi.patches.shared.rewriteStrings
import app.edbfi.patches.syncforreddit.SYNC_PACKAGE
import app.edbfi.patches.syncforreddit.SYNC_VERSION
import app.edbfi.patches.syncforreddit.misc.extension.extensionPatch
import app.edbfi.patches.syncforreddit.misc.extension.extensionSwitch
import app.edbfi.patches.syncforreddit.misc.imageclient.imageClientHookPatch
import app.revanced.com.android.tools.smali.dexlib2.mutable.MutableMethod
import app.revanced.patcher.extensions.ExternalLabel
import app.revanced.patcher.extensions.addInstructions
import app.revanced.patcher.extensions.addInstructionsWithLabels
import app.revanced.patcher.extensions.fieldReference
import app.revanced.patcher.extensions.getInstruction
import app.revanced.patcher.extensions.instructions
import app.revanced.patcher.extensions.methodReference
import app.revanced.patcher.extensions.replaceInstruction
import app.revanced.patcher.extensions.string
import app.revanced.patcher.patch.PatchException
import app.revanced.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val TRANSLATE_BADGE = "https://todo.syncforreddit.com"

// The image server URL ImageServer answers; it fails the links it doesn't handle on the device.
private const val IMAGE_SERVER = "https://ap.syncforreddit.com/image?url="

@Suppress("unused")
val enableUltraPatch =
    bytecodePatch(
        name = "Enable Sync Ultra",
        description = "Enables the Sync Ultra features that work without Sync's servers, and loads website previews on the device.",
    ) {
        compatibleWith(SYNC_PACKAGE(SYNC_VERSION))
        dependsOn(extensionPatch, imageClientHookPatch)

        apply {
            val ultra = ultraChecks()
            val hasPurchase = ultra.hasPurchase
            val edits = mutableListOf<Edit>()

            // Every Ultra feature asks isUltra(); the purchase check keeps meaning "bought", for what needs Sync's servers.
            edits += ultra.isUltra.returnBoolean(true)
            // Remote Config can switch Ultra off for anyone without a Play purchase token; Restore comment reads
            // Pushshift, which is gone. Translate runs on the device (ML Kit).
            edits += remoteFlag("c4266fa").returnBoolean(false)
            edits += remoteFlag("ultra_restore").returnBoolean(false)
            edits += remoteFlag("ultra_translate").returnBoolean(true)

            // Where the app talks to Sync's servers about Ultra, or picks where tags are kept, it asks the purchase check.
            listOf(
                // Each start: sends the Reddit username, SIM country, FCM token and installer to Sync ("hmmm").
                methodIn("BaseActivity.java", ".AO-") to 1,
                // Ultra tags live under other keys, filled from Sync's servers: the user's own tags would disappear.
                methodIn("NewUserTagManager.java", "###USER_TAG_ULTRA###") to 1,
                methodIn("NewUserTagManager.java", "user_tags_ultra") to 1,
                // Asks Sync whether the account has a cloud backup.
                methodIn("PreferencesBackupFragment.java", "backupExistsCallable") to 1,
                // Fetching tags and paints from Sync, from Force refresh and from Sync's push messages.
                methodIn("UltraGrabTagsJob.java", " scheduling") to 1,
                methodIn("UltraGrabPaintsJob.java", " scheduling") to 1,
                // Force refresh and Import local (which only uploads) in the tags sheet.
                methodIn("UltraManageTagSelectionBottomSheet.java", "Force refresh", "Import local (") to 2,
                // Clear all sends the account's username to Sync to clear its copy.
                methodIn("UltraManageTagSelectionBottomSheet.java", "TODO", "Refreshing") to 1,
                methodIn("UltraManagePaintSelectionBottomSheet.java", "TODO", "Refreshing") to 1,
            ).forEach { (method, count) -> edits += method.callInstead(ultra.isUltra, hasPurchase, count) }

            // Translations end with a "Translated by Google" badge from Sync's server: ImageServer fails it on the device.
            val badge = methodIn("SyncHtmlToSpannedConverter.java", "$TRANSLATE_BADGE/translate_white.png", "$TRANSLATE_BADGE/translate_grey.png")
                .rewriteStrings { if (it.startsWith("$TRANSLATE_BADGE/")) IMAGE_SERVER + it.removePrefix("https://") else null }
            if (badge.count != 2) throw PatchException("Expected two Translate badges, found ${badge.count}")
            edits += badge

            edits += returnUnlessBought(methodIn("UltraManagePreference.java", "getSubscriptionInformationCallable"), hasPurchase)
            edits += showOnlyIfBought(methodIn("PreferencesUltraFragment.java", "ultra_manage_preference", "ultra_cloud"), hasPurchase)
            // Website previews: the app shows them for Ultra, from this URL, which ImageServer answers from the linked page.
            methodIn("WebsitePreviewHelper.java", IMAGE_SERVER)
            edits += extensionSwitch("WebsitePreviews")

            edits.forEach { it.apply() }
        }
    }

private fun MethodReference.smali() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

/** Makes the method call [instead] where it calls [from], which it must do [count] times. Both are static `()Z`. */
private fun MutableMethod.callInstead(
    from: Method,
    instead: MethodReference,
    count: Int,
): Edit {
    val calls = instructions.indices.filter { instructions[it].opcode == Opcode.INVOKE_STATIC && isCallTo(instructions[it].methodReference, from) }
    if (calls.size != count) throw PatchException("Expected $count Ultra checks in $definingClass->$name, found ${calls.size}")
    // Replacing the call keeps any label on it, and the move-result after it reads the new call's result.
    return Edit(count) { calls.forEach { replaceInstruction(it, "invoke-static {}, ${instead.smali()}") } }
}

/** Makes the method return at once unless the purchase check passes. It returns void. */
private fun returnUnlessBought(
    method: MutableMethod,
    hasPurchase: MethodReference,
): Edit {
    val implementation = method.implementation ?: throw PatchException("${method.name} has no code")
    if (method.returnType != "V" || method.parameters.isNotEmpty() || AccessFlags.STATIC.isSet(method.accessFlags)) {
        throw PatchException("${method.name} isn't an instance method taking nothing and returning void")
    }
    if (implementation.registerCount < 2) throw PatchException("${method.name} has no local register")
    return Edit(1) {
        method.addInstructionsWithLabels(
            0,
            """
                invoke-static {}, ${hasPurchase.smali()}
                move-result v0
                if-nez v0, :bought
                return-void
            """,
            ExternalLabel("bought", method.getInstruction(0)),
        )
    }
}

/**
 * `PreferencesUltraFragment`'s setup shows the Manage card, the Settings cloud backup entry and the debug Reset button
 * to every Ultra user. At its end, this shows them only after a purchase: the card names a subscription and the backup
 * is Sync's, and the button would revoke a purchase. Preference methods are obfuscated, so the added code calls the
 * ones the setup itself calls to show its "ultra_cloud_section".
 */
private fun showOnlyIfBought(
    method: MutableMethod,
    hasPurchase: MethodReference,
): Edit {
    val code = method.instructions
    val section = code.indices.singleOrNull { code[it].string == "ultra_cloud_section" }
        ?: throw PatchException("Expected one \"ultra_cloud_section\" in ${method.name}")
    val find = code.getOrNull(section + 1)?.methodReference
    val setVisible = code.getOrNull(section + 3)?.methodReference
    if (find?.parameterTypes != listOf("Ljava/lang/CharSequence;") || find.returnType != "Landroidx/preference/Preference;") {
        throw PatchException("${method.name} doesn't look up \"ultra_cloud_section\" by key")
    }
    if (setVisible?.definingClass != "Landroidx/preference/Preference;" || setVisible.parameterTypes != listOf("Z") || setVisible.returnType != "V") {
        throw PatchException("${method.name} doesn't set \"ultra_cloud_section\"'s visibility")
    }
    val resetKey = code.mapNotNull { it.fieldReference }
        .singleOrNull { it.definingClass.endsWith("/UltraResetPreference;") && it.type == "Ljava/lang/String;" }
        ?: throw PatchException("${method.name} doesn't read UltraResetPreference's key")
    val returns = code.indices.filter { code[it].opcode == Opcode.RETURN_VOID }
    if (returns != listOf(code.lastIndex)) throw PatchException("${method.name} doesn't end in its only return")
    val registers = method.implementation!!.registerCount
    val self = registers - 1
    if (registers < 3 || self > 15 || method.parameters.isNotEmpty()) throw PatchException("${method.name}'s registers don't fit")

    val lookups = listOf("const-string v1, \"ultra_manage_preference\"", "const-string v1, \"ultra_cloud\"", "sget-object v1, ${resetKey.definingClass}->${resetKey.name}:${resetKey.type}")
    val show = lookups.joinToString("\n") {
        """
            $it
            invoke-virtual { v$self, v1 }, ${find.smali()}
            move-result-object v1
            invoke-virtual { v1, v0 }, ${setVisible.smali()}
        """
    }
    return Edit(1) {
        // Branches land on the return: replacing it keeps their label on the added code's first instruction.
        val end = code.lastIndex
        method.replaceInstruction(end, "invoke-static {}, ${hasPurchase.smali()}")
        method.addInstructions(end + 1, "move-result v0\n$show\nreturn-void")
    }
}
