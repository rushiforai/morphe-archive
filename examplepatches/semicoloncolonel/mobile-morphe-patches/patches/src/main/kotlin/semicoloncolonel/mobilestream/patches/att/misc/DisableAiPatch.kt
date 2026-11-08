package semicoloncolonel.mobilestream.patches.att.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import semicoloncolonel.mobilestream.patches.att.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.AI_FILTER
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle
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
// endpoints, and the WebSocket of its streaming hub.
//
// Andi's entry points are hidden in the JavaScript bundle (2026.10.2):
// - FloatingTabBar reads its showChat prop to draw the round Andi button
//   beside the tab bar. That read becomes a constant false, so neither the
//   button nor its circle is drawn.
// - FloatingChatIcon, the button's icon, returns null as a fallback.
// - Home's "Need help?" section (an unnamed function, the only one that
//   reads askAndi, AskAndi, and ChatWithUs) draws each card when the server
//   config's <card>.show is true. Its askAndi.show read becomes a constant
//   false, so the "Ask Andi" card and its slot are not drawn and the other
//   cards fill the row. AskAndi itself also returns null as a fallback.

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

// Hiding the entry points is extra polish: each edit is skipped if a later
// version renames what it looks for, and the rest of the patch still applies.
private val hideAndiEntryPointsPatch = rawResourcePatch {
    execute {
        val file = get(HERMES_BUNDLE)
        if (!file.exists()) return@execute
        val bundle = HermesBundle(file.readBytes())
        var changed = false
        fun attempt(edit: () -> Unit) {
            try {
                edit()
                changed = true
            } catch (_: PatchException) {
            }
        }
        // GetById r3, r10, "showChat" -> LoadConstFalse r3, three times (bytecode 98).
        attempt {
            bundle.replaceInstructions(
                "FloatingTabBar",
                listOf("showChat"),
                98,
                byteArrayOf(0x45, 0x03, 0x0a, 0x01, 0x16, 0x6e),
                byteArrayOf(0x96.toByte(), 0x03, 0x96.toByte(), 0x03, 0x96.toByte(), 0x03),
            )
        }
        attempt { bundle.returnAtStart("FloatingChatIcon", HermesBundle.Value.NULL) }
        // GetById r9, r17, "show" (r17 is askAndi) -> LoadConstFalse r9, three times.
        attempt {
            bundle.replaceInstructions(
                "",
                listOf("askAndi", "AskAndi", "ChatWithUs"),
                98,
                byteArrayOf(0x45, 0x09, 0x11, 0x07, 0xf8.toByte(), 0x30),
                byteArrayOf(0x96.toByte(), 0x09, 0x96.toByte(), 0x09, 0x96.toByte(), 0x09),
            )
        }
        attempt { bundle.returnAtStart("AskAndi", HermesBundle.Value.NULL) }
        if (changed) file.writeBytes(bundle.toByteArray())
    }
}

@Suppress("unused")
val disableAiPatch = bytecodePatch(
    name = "Disable AI",
    description = "Hides Andi, AT&T's AI assistant, and turns off its Fusion AI features.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(hideAndiEntryPointsPatch)

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
