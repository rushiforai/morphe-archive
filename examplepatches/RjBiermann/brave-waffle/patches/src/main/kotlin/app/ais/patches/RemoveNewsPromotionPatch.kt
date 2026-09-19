package app.ais.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * The startup news page (a WebView) shows a third-party "Porn Site
 * Promotion" banner (accordion item with an ad iframe). The page is loaded
 * with the shared WebViewClient `ce0`; its default `onPageFinished` branch
 * (used by the news WebView) simply calls super.
 *
 * A small JS snippet is injected after every page load: it removes any
 * accordion item whose header mentions the promotion, and hides any leftover
 * `.paysiteAd` blocks as a fallback. Harmless on other WebViews sharing this
 * client, since they have no matching elements.
 *
 * Runtime-gated by the pref `morphe_remove_news_promo` (default true). The
 * pref read clobbers p2 (the URL — dead in this branch after the super
 * call) because the method only has v0/v1 free. No settings row is added
 * for it; flipping it requires writing the pref, so the patch flag remains
 * the off switch for users who never touch settings.
 */
private const val STRIP_PROMOTION_JS =
    "(function(){var b=document.querySelectorAll('.accordion-item');" +
        "for(var i=0;i<b.length;i++){var h=b[i].querySelector('.accordion-header');" +
        "if(h&&/Porn Site Promotion/i.test(h.textContent)){b[i].parentNode.removeChild(b[i]);}}" +
        "var s=document.createElement('style');s.textContent='.paysiteAd{display:none!important}';" +
        "document.head.appendChild(s);})();"

object NewsWebClientFingerprint : Fingerprint(
    definingClass = "Lce0;",
    name = "onPageFinished",
    returnType = "V"
)

@Suppress("unused")
val removeNewsPromotionPatch = bytecodePatch(
    name = "Remove news promotions",
    description = "Removes the third-party paysite promotion banner from the startup news page.",
    default = true
) {
    compatibleWith(Constants.COMPATIBILITY_APP)

    execute {
        val method = NewsWebClientFingerprint.method
        // The first invoke-super is the default (non-switch) branch, immediately
        // followed by return-void. Inject the JS call between them, gated on
        // the pref. p2 (URL) is dead after invoke-super in this branch, so it
        // doubles as the default=true register (method only has v0/v1).
        val impl = method.implementation!!
        val superIndex = impl.instructions.indexOfFirst {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Landroid/webkit/WebViewClient;"
        }
        method.addInstructionsWithLabels(
            superIndex + 1,
            """
                const-string v0, "morphe_remove_news_promo"
                sget-object v1, Lka1;->j:Landroid/content/SharedPreferences;
                const/4 p2, 0x1
                invoke-interface {v1, v0, p2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
                move-result v0
                if-eqz v0, :cond_morphe_news_skip
                const-string v0, "$STRIP_PROMOTION_JS"
                const/4 v1, 0x0
                invoke-virtual {p1, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
                :cond_morphe_news_skip
            nop
            """.trimIndent()
        )
    }
}
