package app.bin0culars.patches.reddit.misc.samesubredditmedia

import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSection
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.addBinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.binocularsModsSettingsPatch
import app.bin0culars.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/bin0culars/extension/reddit/SameSubredditMediaPatch;"

private val RELABEL_SMALI =
    """
    invoke-static/range { p2 .. p2 }, $EXTENSION_CLASS->shouldRelabel(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :keep
    invoke-virtual/range { p2 .. p2 }, Lcom/reddit/domain/model/media/MediaContext;->getSeedSubredditIds()Ljava/util/List;
    move-result-object v2
    sget-object v3, Lcom/reddit/listing/common/ListingType;->SUBREDDIT:Lcom/reddit/listing/common/ListingType;
    invoke-virtual/range { p2 .. p2 }, Lcom/reddit/domain/model/media/MediaContext;->getLinkKindWithId()Ljava/lang/String;
    move-result-object v4
    invoke-virtual/range { p2 .. p2 }, Lcom/reddit/domain/model/media/MediaContext;->getOnboardingCategories()Ljava/util/List;
    move-result-object v5
    invoke-virtual/range { p2 .. p2 }, Lcom/reddit/domain/model/media/MediaContext;->isImage()Z
    move-result v6
    invoke-virtual/range { p2 .. p2 }, Lcom/reddit/domain/model/media/MediaContext;->isArticleLink()Z
    move-result v7
    invoke-virtual/range { p2 .. p2 }, Lcom/reddit/domain/model/media/MediaContext;->getCrossPostSeedId()Ljava/lang/String;
    move-result-object v8
    invoke-virtual/range { p2 .. p2 }, Lcom/reddit/domain/model/media/MediaContext;->getMarkArticleAsRead()Z
    move-result v9
    new-instance v1, Lcom/reddit/domain/model/media/MediaContext;
    invoke-direct/range { v1 .. v9 }, Lcom/reddit/domain/model/media/MediaContext;-><init>(Ljava/util/List;Lcom/reddit/listing/common/ListingType;Ljava/lang/String;Ljava/util/List;ZZLjava/lang/String;Z)V
    move-object/16 p2, v1
    :keep
    nop
    """.trimIndent()

private fun fillBridge(name: String, smali: String) {
    Fingerprint(definingClass = EXTENSION_CLASS, name = name).method.addInstructions(0, smali)
}

@Suppress("unused")
val sameSubredditMediaPatch =
    patch(
        name = "Same-subreddit full-screen media",
        description = "Lets full-screen videos and images show only posts from the subreddit you opened. Turn it on in Settings → bin0culars mods.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_REDDIT)
        dependsOn(binocularsModsSettingsPatch)
        extendWith("extensions/extension.mpe")

        execute {
            addBinocularsModsSetting(
                BinocularsModsSetting(
                    key = "fullscreen_same_subreddit",
                    section = BinocularsModsSection.MEDIA,
                    title = "Keep full-screen media in one subreddit",
                    summary = "When you swipe through full-screen videos and images, only show posts from the subreddit of the post you opened. In small subreddits the list may end sooner.",
                    default = false,
                ),
            )

            val mediaContextClass = classDefByOrNull("Lcom/reddit/domain/model/media/MediaContext;")
                ?: throw PatchException("Could not find class Lcom/reddit/domain/model/media/MediaContext;")

            val expectedConstructorParams = listOf(
                "Ljava/util/List;",
                "Lcom/reddit/listing/common/ListingType;",
                "Ljava/lang/String;",
                "Ljava/util/List;",
                "Z",
                "Z",
                "Ljava/lang/String;",
                "Z",
            )

            val hasConstructor = mediaContextClass.methods.any { method ->
                method.name == "<init>" &&
                    method.returnType == "V" &&
                    method.parameterTypes.map { it.toString() } == expectedConstructorParams
            }
            if (!hasConstructor) {
                throw PatchException("MediaContext missing expected 8-arg constructor")
            }

            val requiredMethods = listOf(
                "getLinkKindWithId",
                "getOnboardingCategories",
                "isImage",
                "isArticleLink",
                "getCrossPostSeedId",
                "getMarkArticleAsRead",
            )
            for (methodName in requiredMethods) {
                if (mediaContextClass.methods.none { it.name == methodName }) {
                    throw PatchException("MediaContext missing required method: $methodName")
                }
            }

            val targetMethods = listOf(
                RecommendedMediaRequestFingerprint.method,
                RecommendedVideosRequestFingerprint.method,
            )

            for (method in targetMethods) {
                val instructions = method.instructions.toList()
                val returnIndex = instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
                if (returnIndex == -1) {
                    throw PatchException("Could not find RETURN_OBJECT instruction in ${method.name}")
                }
                val returnInstruction = instructions[returnIndex] as? OneRegisterInstruction
                    ?: throw PatchException("RETURN_OBJECT instruction in ${method.name} is not a OneRegisterInstruction")
                val returnRegister = returnInstruction.registerA

                method.addInstructions(
                    returnIndex,
                    "invoke-static/range { v$returnRegister .. v$returnRegister }, $EXTENSION_CLASS->filterResults(Ljava/lang/Object;)V",
                )

                method.addInstructionsWithLabels(0, RELABEL_SMALI)
            }

            fillBridge(
                "seedsOf",
                """
                    check-cast p0, Lcom/reddit/domain/model/media/MediaContext;
                    invoke-virtual {p0}, Lcom/reddit/domain/model/media/MediaContext;->getSeedSubredditIds()Ljava/util/List;
                    move-result-object p0
                    return-object p0
                """.trimIndent(),
            )

            fillBridge(
                "listingTypeOf",
                """
                    check-cast p0, Lcom/reddit/domain/model/media/MediaContext;
                    invoke-virtual {p0}, Lcom/reddit/domain/model/media/MediaContext;->getListingType()Lcom/reddit/listing/common/ListingType;
                    move-result-object p0
                    return-object p0
                """.trimIndent(),
            )

            fillBridge(
                "childrenOf",
                """
                    check-cast p0, Lcom/reddit/domain/model/listing/Listing;
                    invoke-virtual {p0}, Lcom/reddit/domain/model/listing/Listing;->getChildren()Ljava/util/List;
                    move-result-object p0
                    return-object p0
                """.trimIndent(),
            )

            fillBridge(
                "subredditIdOf",
                """
                    check-cast p0, Lcom/reddit/domain/model/Link;
                    invoke-virtual {p0}, Lcom/reddit/domain/model/Link;->getSubredditId()Ljava/lang/String;
                    move-result-object p0
                    return-object p0
                """.trimIndent(),
            )
        }
    }
