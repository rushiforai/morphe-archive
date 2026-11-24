package app.morphe.patches.kicktv.emotes

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.patch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patches.kicktv.KICK_TV
import app.morphe.patches.kicktv.settings.settingsPatch

private const val EXTENSION_CLASS = "Lapp/morphe/extension/kicktv/emotes/"

/** Turns raw chat text into the AnnotatedString shown in chat. */
private object ChatTextFingerprint : Fingerprint(
    definingClass = "Lvz3;",
    name = "d",
    parameters = listOf("Ljava/lang/String;"),
    returnType = "Lhn;",
)

/** Builds the inline content map that holds the emote images. */
private object ChatInlineMapFingerprint : Fingerprint(
    definingClass = "Lvz3;",
    name = "a",
    parameters = listOf(
        "Ljava/lang/String;",
        "F",
        "Ljava/util/List;",
        "Z",
        "Ljava/util/List;",
        "I",
    ),
    returnType = "Ljava/util/LinkedHashMap;",
)

/** Builds a single emote URL from the chat_emotes_url string resource. */
private object EmoteUrlFingerprint : Fingerprint(
    definingClass = "Lj40;",
    name = "i",
    parameters = listOf(
        "Ljava/lang/Object;",
        "Ljava/lang/Object;",
        "Ljava/lang/Object;",
    ),
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        resourceLiteral(ResourceType.STRING, "chat_emotes_url"),
        methodCall(definingClass = "Lai7;", name = "j"),
    ),
)

/** Channel response, used to learn the KICK channel currently being watched. */
private object ChannelResponseFingerprint : Fingerprint(
    definingClass =
        "Lcom/kick/base/data/remote/model/kick/api/response/channel/GetChannelResponse;",
    name = "getSlug",
    parameters = emptyList(),
    returnType = "Ljava/lang/String;",
)

/** MainActivity.onCreate(), used to warm up the global emote sets early. */
private object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/kick/tv/MainActivity;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;"),
    returnType = "V",
)

/**
 * EMOTES tweak: renders 7TV, BTTV and FFZ emotes in the KICK chat.
 *
 * The stock chat renderer already understands {@code [emote:<id>:<name>]}
 * tokens. The extension rewrites third-party emote names into those tokens
 * using reserved fake IDs, and the patched URL builder resolves the fake IDs
 * to the provider CDN. A single switch in SEYTTINGS controls all three
 * providers.
 */
@Suppress("unused")
val emotesPatch = patch(
    name = "EMOTES",
    description = "Shows 7TV, BTTV and FFZ emotes in the KICK TV chat. " +
        "One toggle in SEYTTINGS enables or disables all providers. " +
        "Requires the SEYTTINGS patch.",
    default = true,
) {
    compatibleWith(KICK_TV)

    dependsOn(settingsPatch)

    extendWith("extensions/KickEmotes.mpe")

    execute {
        // Both parsing passes must see the rewritten text: vz3.d builds the
        // text annotations, vz3.a builds the matching inline-content map.
        ChatTextFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0}, ${EXTENSION_CLASS}EmoteTextHook;->transform(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p0
            """,
        )

        // vz3.a has 24 locals, so p0 is v24 and a normal 35c invoke cannot
        // address it. Use invoke-static/range instead.
        ChatInlineMapFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range {p0 .. p0}, ${EXTENSION_CLASS}EmoteTextHook;->transform(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p0
                invoke-static/range {p0 .. p0}, ${EXTENSION_CLASS}EmoteTextHook;->hasProviderEmote(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :morphe_url_renderer
                or-int/lit8 p5, p5, 0x10
                :morphe_url_renderer
            """,
        )

        // Replace the stock chat_emotes_url formatting with the provider-aware
        // resolver. v4 = Context, v0 = string resource id, p1 = {id, width}.
        EmoteUrlFingerprint.apply {
            val index = instructionMatches[1].index
            method.replaceInstruction(
                index,
                "invoke-static {v4, v0, p1}, ${EXTENSION_CLASS}EmoteUrlResolver;->" +
                    "resolve(Landroid/content/Context;I[Ljava/lang/Object;)Ljava/lang/String;",
            )
        }

        // Hand the channel response (slug + KICK user id) to the extension so
        // it can load the matching 7TV channel emote set.
        ChannelResponseFingerprint.method.addInstructions(
            0,
            "invoke-static {p0}, ${EXTENSION_CLASS}EmoteRepository;->" +
                "onChannelResponse(Ljava/lang/Object;)V",
        )

        // Warm up the global 7TV/BTTV/FFZ sets while the app starts, so chat
        // does not have to wait for them on the first visible message.
        MainActivityOnCreateFingerprint.method.addInstructions(
            0,
            "invoke-static {}, ${EXTENSION_CLASS}EmoteRepository;->ensureStarted()V",
        )
    }
}
