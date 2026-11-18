/*
 * YTAfterglow for Android.
 *
 * Hooks adapted from Morphe patches v2.2.0 (https://github.com/MorpheApp/morphe-patches, GPLv3),
 * forked from ReVanced patches (https://github.com/ReVanced/revanced-patches, GPLv3): the Bypass link redirects and Sanitize sharing links patches, and the search suggestions hook of Hide layout components.
 * Modified for YTAfterglow: rewritten for patcher 2.1.0 and YouTube 21.43.523 and driven by the
 * iOS settings. Not an official Morphe or ReVanced file.
 *
 * Portions of this software are provided "AS IS" by the Morphe software project.
 * Any express or implied warranties, including the implied warranties of
 * merchantability and fitness for a particular purpose, are disclaimed.
 */

package app.afterglow.patches.tweaks.navigation

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.shared.smali
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

internal const val PRIVACY_HOOKS = "$EXTENSION_PACKAGE/navigation/PrivacyHooks;"

/**
 * Hooks of the iOS "Privacy" settings: noLinkTracking (links opened from descriptions, posts and
 * comments), noShareChunk (copy link, share panel and system share sheet, and opened links, as
 * iOS cleans both) and noSearchHistory (the search box's suggestions). Used by the named
 * "Privacy" patch.
 */
internal val privacyHooksPatch = bytecodePatch(
    description = "Hooks YouTube's links, sharing and search suggestions for the Afterglow Privacy settings.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch)

    execute {
        val sharedText = "$PRIVACY_HOOKS->sharedText(Ljava/lang/String;)Ljava/lang/String;"
        val openedLink = "$PRIVACY_HOOKS->openedLink(Landroid/net/Uri;)Landroid/net/Uri;"

        CopyLinkFingerprint.let {
            val index = it.instructionMatches.first().index
            val register = it.method.instruction<OneRegisterInstruction>(index).registerA
            it.method.addInstructions(index + 1, "${invokeStatic(register, method = sharedText)}\nmove-result-object v$register")
        }

        val shareSheets = ShareSheetFingerprint.matchAll()
        if (shareSheets.isEmpty()) throw PatchException("No share panel intent found")
        (shareSheets + SystemShareSheetFingerprint.match()).forEach { match ->
            val index = match.instructionMatches[3].index
            val link = match.method.instruction<FiveRegisterInstruction>(index).registerE
            match.method.addInstructionsAtControlFlowLabel(index, "${invokeStatic(link, method = sharedText)}\nmove-result-object v$link")
        }

        CommentsLinkFingerprint.let {
            val index = it.instructionMatches.last().index
            val uri = it.method.instruction<FiveRegisterInstruction>(index).registerE
            it.method.addInstructions(index, "${invokeStatic(uri, method = openedLink)}\nmove-result-object v$uri")
        }

        DescriptionLinkFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $openedLink
                move-result-object p1
            """,
        )

        SearchSuggestionsFingerprint.let {
            val suggestions = it.instructionMatches.first().fieldReference
            val method = it.method
            if (method.implementation!!.registerCount - 2 < 2) throw PatchException("No free registers in $method")
            method.addInstructions(
                0,
                """
                    move-object/from16 v0, p1
                    iget-object v1, v0, ${suggestions.smali}
                    invoke-static { v1 }, $PRIVACY_HOOKS->searchSuggestions(Ljava/util/Collection;)Ljava/util/Collection;
                    move-result-object v1
                    iput-object v1, v0, ${suggestions.smali}
                """,
            )
        }
    }
}
