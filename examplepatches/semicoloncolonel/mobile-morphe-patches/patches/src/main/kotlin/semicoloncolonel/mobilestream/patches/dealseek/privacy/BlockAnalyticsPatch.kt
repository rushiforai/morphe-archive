package semicoloncolonel.mobilestream.patches.dealseek.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import semicoloncolonel.mobilestream.patches.dealseek.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.TRACKER_BLOCKER
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// DealSeek 1.64.0 ships AppsFlyer, the Meta SDK (auto-logged events and ad-ID
// collection switched on), Firebase Analytics, the TikTok Business SDK and
// PostHog. The native SDKs send through URL.openConnection(), which the shared
// layer covers. OkHttp is renamed in this build, so the shared OkHttp layer
// does not apply. PostHog runs in JavaScript, and the app's JavaScript sends
// through Expo's expo/fetch module, so each request URL is checked there
// against the same blocklist. React Native's own NetworkingModule (fetch and
// XMLHttpRequest) gets the same check. PostHog feature flags (/flags/) are
// left alone, since the app reads them.
//
// Not touched: sign-in (Supabase, Google, Apple, Meta), Sentry crash
// reporting, Crisp support chat, push, deals and images.
// ─────────────────────────────────────────────────────────────────────────────

private fun isUrlCast(instruction: Instruction) =
    instruction.opcode == Opcode.CHECK_CAST &&
        ((instruction as ReferenceInstruction).reference as TypeReference).type == "Ljava/net/URL;"

// expo/fetch's start(request, url, init, body) handler. It is the only method
// that maps file URLs to http://filesystem.local and also casts an argument to
// java.net.URL (the module's OkHttp interceptor uses the same string).
internal object ExpoFetchStartFingerprint : Fingerprint(
    strings = listOf("http://filesystem.local"),
    custom = { method, _ ->
        method.implementation?.instructions?.any(::isUrlCast) == true
    },
)

internal object JsRequestFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/modules/network/NetworkingModule;",
    name = "sendRequestInternalReal",
    returnType = "V",
)

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops analytics and tracking in the DealSeek app: AppsFlyer, Meta app " +
        "events, Firebase, TikTok and PostHog. Blocking happens on the device, inside the app. " +
        "Sign-in and deals are left alone. Opt-in / experimental; test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // expo/fetch: filter the URL argument right after its check-cast.
        ExpoFetchStartFingerprint.method.apply {
            val index = implementation!!.instructions.indexOfFirst(::isUrlCast)
            if (index < 0) throw PatchException("No URL cast in the expo/fetch start handler")
            val register = (implementation!!.instructions.toList()[index] as OneRegisterInstruction).registerA
            addInstructions(
                index + 1,
                """
                    invoke-static/range { v$register .. v$register }, $TRACKER_BLOCKER->filterJsRequestUrl(Ljava/net/URL;)Ljava/net/URL;
                    move-result-object v$register
                """.trimIndent(),
            )
        }

        // sendRequestInternalReal(method, url, ...): p2 is the URL.
        JsRequestFingerprint.methodOrNull?.addInstructions(
            0,
            """
                invoke-static/range { p2 .. p2 }, $TRACKER_BLOCKER->filterJsRequestUrl(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p2
            """.trimIndent(),
        )

        blockTrackers()
    }
}
