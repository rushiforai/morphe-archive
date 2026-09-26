package app.morphe.patches.reddit.misc.redgifsaudio

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val redgifsAudioPatch = bytecodePatch(
    name = "RedGifs Audio Fix",
    description = "Enables audio playback for RedGifs videos embedded in Reddit posts."
) {
    extendWith("redgifs_extension.dex")
    compatibleWith("com.reddit.frontpage")

    execute {
        // === HOOK 1: VideoMedia constructor ===
        // Still needed if Reddit falls back to WebView player (unlikely for main feed)
        val videoMediaMethod = VideoMediaConstructorFingerprint.method
        videoMediaMethod.addInstructions(
            0,
            """
                invoke-static {p1, p2}, Lapp/morphe/patches/reddit/misc/redgifsaudio/RedGifsHelper;->processVideoMedia(Ljava/lang/String;Ljava/lang/String;)V
                
                sget-object p1, Lapp/morphe/patches/reddit/misc/redgifsaudio/RedGifsHelper;->vmEmbedHtml:Ljava/lang/String;
                sget-object p2, Lapp/morphe/patches/reddit/misc/redgifsaudio/RedGifsHelper;->vmUrl:Ljava/lang/String;
            """.trimIndent()
        )

        // === HOOK 2: LinkMedia constructor ===
        // Passes the native RedditVideo object (p1) and the original VideoMedia object (p3).
        // Our Java helper will use reflection to grab the original RedGifs URL from VideoMedia,
        // fetch the HD video, and overwrite the native RedditVideo object with the HD URL
        // AND set isGif=false so the native speaker icon appears!
        val linkMediaMethod = LinkMediaConstructorFingerprint.method
        linkMediaMethod.addInstructions(
            0,
            """
                invoke-static {p1, p3}, Lapp/morphe/patches/reddit/misc/redgifsaudio/RedGifsHelper;->processLinkMedia(Ljava/lang/Object;Ljava/lang/Object;)V
            """.trimIndent()
        )

        // === HOOK 3: Global isGif overrides ===
        // Reddit's player forcefully hides audio controls and auto-loops if a video is short or flagged as a GIF.
        // By overriding the getters to always return false, we force Reddit to treat ALL videos
        // (including short RedGifs and feed items) as normal videos with audio controls.
        
        val redditVideoIsGif = RedditVideoIsGifFingerprint.method
        redditVideoIsGif.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent()
        )

        val extraTagsIsGif = ExtraTagsIsGifFingerprint.method
        extraTagsIsGif.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent()
        )

        // === HOOK 4: AudioState.ABSENT -> AudioState.MUTED ===
        // The feed mapper in com.reddit.feeds.impl.data.mapper.link.b hardcodes
        // AudioState.ABSENT when building VideoElement objects for the feed.
        // This tells the UI "no audio exists" and hides the speaker icon entirely.
        // By patching the feed mapper method to use MUTED instead of ABSENT,
        // the speaker icon appears and users can unmute to hear audio.
        val feedMapperMethod = FeedVideoMapperFingerprint.method
        val feedInstructions = feedMapperMethod.implementation!!.instructions
        for (i in feedInstructions.indices) {
            val inst = feedInstructions[i]
            if (inst.opcode == com.android.tools.smali.dexlib2.Opcode.SGET_OBJECT) {
                val ref = (inst as com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction).reference
                if (ref.toString().contains("AudioState;->ABSENT")) {
                    // Remove the ABSENT instruction and insert MUTED at the same index
                    feedMapperMethod.removeInstruction(i)
                    feedMapperMethod.addInstruction(
                        i,
                        "sget-object v26, Lcom/reddit/feeds/model/AudioState;->MUTED:Lcom/reddit/feeds/model/AudioState;"
                    )
                }
            } else if (inst.opcode == com.android.tools.smali.dexlib2.Opcode.INVOKE_STATIC) {
                val ref = (inst as com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction).reference
                if (ref.toString().contains("Lgb/a;->v(Lcom/reddit/domain/model/Link;)Z")) {
                    // Intercept the native isGif check and pass it to our custom helper
                    feedMapperMethod.removeInstruction(i)
                    feedMapperMethod.addInstruction(
                        i,
                        "invoke-static {v0}, Lapp/morphe/patches/reddit/misc/redgifsaudio/RedGifsHelper;->isGif(Ljava/lang/Object;)Z"
                    )
                }
            }
        }

        // === HOOK 5: PostTypesKt overrides ===
        // Reddit's logic in PostTypesKt sometimes classifies RedGifs as GIFs (returning PostType.GIF)
        // because of the .gifv URL matching. This overrides that classification.
        val getPostTypeMethod = PostTypesGetPostTypeFingerprint.method
        if (getPostTypeMethod != null) {
            getPostTypeMethod.addInstructions(
                0,
                """
                    invoke-static {p0}, Lapp/morphe/patches/reddit/misc/redgifsaudio/RedGifsHelper;->isRedGifs(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :original
                    sget-object v0, Lcom/reddit/domain/model/PostType;->VIDEO:Lcom/reddit/domain/model/PostType;
                    return-object v0
                    :original
                """.trimIndent()
            )
        }

        val isGifLinkTypeMethod = PostTypesIsGifLinkTypeFingerprint.method
        if (isGifLinkTypeMethod != null) {
            isGifLinkTypeMethod.addInstructions(
                0,
                """
                    invoke-static {p0}, Lapp/morphe/patches/reddit/misc/redgifsaudio/RedGifsHelper;->isRedGifs(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :original
                    const/4 v0, 0x0
                    return v0
                    :original
                """.trimIndent()
            )
        }
    }
}

object VideoMediaConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/domain/model/VideoMedia;",
    returnType = "V",
    name = "<init>",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Lcom/reddit/domain/model/MediaDimensions;",
        "Lcom/reddit/domain/model/VideoAttribution;"
    )
)

object LinkMediaConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/domain/model/LinkMedia;",
    returnType = "V",
    name = "<init>",
    parameters = listOf(
        "Lcom/reddit/domain/model/RedditVideo;",
        "Lcom/reddit/domain/model/StillMedia;",
        "Lcom/reddit/domain/model/VideoMedia;"
    )
)

object RedditVideoIsGifFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/domain/model/RedditVideo;",
    returnType = "Z",
    name = "isGif",
    parameters = emptyList()
)

object ExtraTagsIsGifFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/domain/model/ExtraTags;",
    returnType = "Z",
    name = "isGifPost",
    parameters = emptyList()
)

object FeedVideoMapperFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/feeds/impl/data/mapper/link/b;",
    returnType = "Lym1/q3;",
    name = "n",
    parameters = listOf(
        "Lcom/reddit/domain/model/Link;",
        "I",
        "Z"
    )
)

object PostTypesGetPostTypeFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/domain/model/listing/PostTypesKt;",
    returnType = "Lcom/reddit/domain/model/PostType;",
    name = "getPostType",
    parameters = listOf(
        "Lcom/reddit/domain/model/Link;",
        "Z"
    )
)

object PostTypesIsGifLinkTypeFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/domain/model/listing/PostTypesKt;",
    returnType = "Z",
    name = "isGifLinkType",
    parameters = listOf("Lcom/reddit/domain/model/Link;")
)
