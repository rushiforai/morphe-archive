/*
 * Copyright 2026 pdscomp, KingOfPoptart, IMXEren.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.patches.reddit.sync.redgifswebview

import app.mix.patches.reddit.sync.extension.sharedExtensionPatch
import app.mix.patches.reddit.sync.shared.Constants.COMPATIBILITY_SYNC
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val HELPER_CLASS = "Lapp/mix/extension/syncforreddit/RedgifsWebViewHelper;"
private const val STRING_TYPE = "Ljava/lang/String;"
private const val WEBVIEW_TYPE = "Landroid/webkit/WebView;"

@Suppress("unused")
val openRedgifsInWebViewPatch = bytecodePatch(
    name = "Open Redgifs links in WebView on failure",
    description = "Falls back to Sync's in-app WebView when native Redgifs playback fails.",
) {
    compatibleWith(COMPATIBILITY_SYNC)
    dependsOn(sharedExtensionPatch)

    execute {
        // Let the native player run first. Only the shared Volley error listener opens the
        // original Redgifs URL in Sync's existing WebView activity.
        redgifsErrorListenerFingerprint.apply {
            val listenerClass = originalClassDef
            val fragmentField = listenerClass.fields.single { it.type == IMAGE_VIEWER_FRAGMENT_CLASS }
            val urlField = listenerClass.fields.single { it.type == STRING_TYPE }

            method.addInstructions(
                0,
                """
                iget-object v0, p0, ${listenerClass.type}->${fragmentField.name}:${fragmentField.type}
                invoke-virtual { v0 }, Landroidx/fragment/app/Fragment;->B0()Landroidx/fragment/app/FragmentActivity;
                move-result-object v0
                if-eqz v0, :noFallback
                iget-object v1, p0, ${listenerClass.type}->${urlField.name}:${urlField.type}
                invoke-static { v0, v1 }, Lcom/laurencedawson/reddit_sync/ui/activities/WebViewActivity;->K0(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
                move-result-object v1
                invoke-virtual { v0, v1 }, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
                invoke-virtual { v0 }, Landroid/app/Activity;->finish()V
                return-void
                :noFallback
                """
            )
        }

        webViewClientOnPageFinishedFingerprint.method.addInstructions(
            0,
            """
            invoke-static { p1, p2 }, $HELPER_CLASS->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
            """
        )

        // Sync normally wipes every cookie before loading a fresh WebView. Preserve cookies only
        // for Redgifs so consent survives, while leaving all other WebView behavior unchanged.
        webViewFragmentOnViewCreatedFingerprint.method.apply {
            val removeCookieIndex = indexOfFirstInstructionOrThrow {
                val reference = getReference<MethodReference>()
                reference?.definingClass == "Landroid/webkit/CookieManager;" &&
                        reference.name == "removeAllCookie"
            }
            val cookieManagerRegister =
                getInstruction<FiveRegisterInstruction>(removeCookieIndex).registerC

            // The separately distributed Modify login WebView patch may already have replaced
            // WebView.loadUrl(String) with a static helper whose first parameter is the WebView.
            val loadUrlIndex = indexOfFirstInstructionOrThrow {
                val reference = getReference<MethodReference>()
                reference?.name == "loadUrl" &&
                        (reference.definingClass == WEBVIEW_TYPE ||
                                reference.parameterTypes.firstOrNull() == WEBVIEW_TYPE)
            }
            val urlField = instructions
                .take(loadUrlIndex)
                .mapNotNull { it.getReference<FieldReference>() }
                .lastOrNull { it.definingClass == definingClass && it.type == STRING_TYPE }
                ?: error("Could not find the WebView URL field")

            addInstructions(
                removeCookieIndex,
                """
                iget-object v0, p0, ${urlField.definingClass}->${urlField.name}:${urlField.type}
                """
            )
            replaceInstruction(
                removeCookieIndex + 1,
                "invoke-static { v$cookieManagerRegister, v0 }, " +
                        "$HELPER_CLASS->removeAllCookieUnlessRedgifs(Landroid/webkit/CookieManager;Ljava/lang/String;)V"
            )
        }
    }
}
