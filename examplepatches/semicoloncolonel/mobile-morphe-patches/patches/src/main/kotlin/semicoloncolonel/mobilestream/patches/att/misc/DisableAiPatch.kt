package semicoloncolonel.mobilestream.patches.att.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.att.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.AI_FILTER
import semicoloncolonel.mobilestream.patches.shared.misc.filterJsRequests

// myAT&T 2026.10.1 switches its AI features ("Fusion": chat history, voice
// to text, AI search suggestions, citations, and AI cards), the Andi
// assistant's chat, and the Personal Assistant with remote flags. The app's
// JavaScript reads them through the native getFeatureFlags(timeout,
// callback). The callback is wrapped, so every AI flag reads as false.
// The JavaScript also fetches the allocations itself, so every response
// body React Native hands it passes through the same filter. The Andi
// button does not depend on these flags, so Andi's own API is blocked as
// well: its chat service, which also hands chats to agents, its AI
// endpoints, and the WebSocket of its streaming hub. The button still opens
// Andi, which can no longer answer.

private const val CALLBACK = "Lcom/facebook/react/bridge/Callback;"

internal object JsDataReceivedFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/modules/network/NetworkEventUtil;",
    name = "onDataReceived",
    parameters = listOf(
        "Lcom/facebook/react/bridge/ReactApplicationContext;",
        "I",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
    ),
    returnType = "V",
)

internal object WebSocketConnectFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/modules/websocket/WebSocketModule;",
    name = "connect",
    returnType = "V",
    custom = { method, _ -> method.parameterTypes.firstOrNull()?.toString() == "Ljava/lang/String;" },
)

internal object GetFeatureFlagsFingerprint : Fingerprint(
    definingClass = "Lcom/att/myWireless/rn/module/ReactNativeModule;",
    name = "getFeatureFlags",
    parameters = listOf("I", CALLBACK),
    returnType = "V",
)

@Suppress("unused")
val disableAiPatch = bytecodePatch(
    name = "Disable AI",
    description = "Stops Andi, AT&T's AI assistant, from answering, and turns off its Fusion " +
        "AI features: chat history, voice to text, AI search suggestions, citations, and AI " +
        "cards. In-app chat with an agent stops too, since it goes through Andi. Phone " +
        "support is not affected. Opt-in; test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        GetFeatureFlagsFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p2 .. p2 }, $AI_FILTER->wrapAttFeatureFlagsCallback(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object p2
                check-cast p2, $CALLBACK
            """.trimIndent(),
        )

        // onDataReceived(context, requestId, devToolsRequestId, data, responseType): p3 is the body.
        JsDataReceivedFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p3 .. p3 }, $AI_FILTER->filterAttJsResponse(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p3
            """.trimIndent(),
        )

        filterJsRequests(AI_FILTER)

        // connect(url, protocols, options, socketID): p1 is the URL of Andi's live chat.
        WebSocketConnectFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $AI_FILTER->filterAttWebSocketUrl(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p1
            """.trimIndent(),
        )
    }
}
