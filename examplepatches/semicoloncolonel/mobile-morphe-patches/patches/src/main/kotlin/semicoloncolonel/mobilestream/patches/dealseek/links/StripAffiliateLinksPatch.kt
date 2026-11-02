package semicoloncolonel.mobilestream.patches.dealseek.links

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.dealseek.shared.Constants

private const val LINK_CLEANER =
    "Lsemicoloncolonel/mobilestream/extension/dealseek/links/DealSeekLinkCleaner;"

// ─────────────────────────────────────────────────────────────────────────────
// Strip affiliate links.
//
// DealSeek 1.64.0 is an Expo / React Native app, and its link logic is Hermes
// bytecode that an OTA update can replace at any time. Every deal still leaves
// the app through one of two native calls, so the URL is rewritten there:
//
//   IntentModule.openURL   React Native's Linking.openURL: Amazon (in the
//                          Amazon app), and DealSeek's own
//                          api.dealseek.com/deeplink/redirect for Walmart,
//                          eBay, Wayfair and Target.
//   openBrowserAsync       expo-web-browser's custom tab: Best Buy.
//
// DealSeekLinkCleaner has the link shapes and the rewrite rules. The deal
// opens at the store's own URL, so DealSeek's click log (which carries the
// PostHog user ID) and the affiliate networks are skipped.
// ─────────────────────────────────────────────────────────────────────────────

internal object OpenUrlFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/modules/intent/IntentModule;",
    name = "openURL",
    parameters = listOf("Ljava/lang/String;", "Lcom/facebook/react/bridge/Promise;"),
    returnType = "V",
)

// The expo-web-browser module's function table is one obfuscated invoke()
// switch that holds openBrowserAsync, warmUpAsync and mayInitWithUrlAsync.
// It is the only method that builds the custom-tab intent extras and the
// proxy-activity extras together.
internal object WebBrowserFunctionsFingerprint : Fingerprint(
    strings = listOf(
        "android.support.customtabs.extra.TITLE_VISIBILITY",
        "expo.modules.webbrowser.EXTRA_CUSTOM_TABS_INTENT_DATA",
    ),
)

private fun MethodReference.isUriParse() =
    definingClass == "Landroid/net/Uri;" &&
        name == "parse" &&
        parameterTypes == listOf("Ljava/lang/String;")

@Suppress("unused")
val stripAffiliateLinksPatch = bytecodePatch(
    name = "Strip affiliate links",
    description = "Opens DealSeek deals at the store's own page. It skips DealSeek's click " +
        "tracking and the affiliate redirects, and removes affiliate tags such as Amazon's.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        // openURL(String, Promise): p1 is the URL.
        OpenUrlFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $LINK_CLEANER->clean(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p1
            """.trimIndent(),
        )

        // Uri.parse(String) -> DealSeekLinkCleaner.parse(String): same
        // registers and return type, so each call is swapped in place.
        var replaced = 0
        WebBrowserFunctionsFingerprint.method.apply {
            implementation!!.instructions.toList().forEachIndexed { index, instruction ->
                if (instruction.opcode != Opcode.INVOKE_STATIC) return@forEachIndexed
                val reference = (instruction as ReferenceInstruction).reference as MethodReference
                if (!reference.isUriParse()) return@forEachIndexed
                val register = (instruction as FiveRegisterInstruction).registerC
                replaceInstruction(
                    index,
                    "invoke-static { v$register }, $LINK_CLEANER->parse(Ljava/lang/String;)Landroid/net/Uri;",
                )
                replaced++
            }
        }
        if (replaced == 0) throw PatchException("No Uri.parse call in the web browser module")
    }
}
