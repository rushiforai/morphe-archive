package app.bin0culars.patches.reddit.layout.automod

import app.bin0culars.patches.reddit.misc.settings.BinocularsModsChoice
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSection
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.addBinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.binocularsModsSettingsPatch
import app.bin0culars.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.AccessFlags

private const val EXTENSION_CLASS = "Lapp/bin0culars/extension/reddit/AutoModCommentsPatch;"

private fun fillBridge(name: String, smali: String) {
    Fingerprint(definingClass = EXTENSION_CLASS, name = name).method.addInstructions(0, smali)
}

@Suppress("unused")
val autoModCommentsPatch =
    patch(
        name = "AutoModerator comments",
        description = "Collapses or hides comments from u/AutoModerator. Choose in Settings → bin0culars mods.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_REDDIT)
        dependsOn(binocularsModsSettingsPatch)
        extendWith("extensions/extension.mpe")

        execute {
            addBinocularsModsSetting(
                BinocularsModsSetting(
                    key = "automod_comments",
                    section = BinocularsModsSection.POSTS,
                    title = "AutoModerator comments",
                    summary = "Collapse or hide the bot comments that many subreddits pin above the discussion. Collapsed ones open with a tap. Replies to a hidden comment are hidden too.",
                    choices = listOf(
                        BinocularsModsChoice("off", "Show"),
                        BinocularsModsChoice("collapse", "Collapse"),
                        BinocularsModsChoice("hide", "Hide"),
                    ),
                    defaultChoice = "off",
                ),
            )

            val constructor = SetCommentsToStringFingerprint.classDef.methods.firstOrNull { method ->
                method.name == "<init>" && method.parameterTypes.firstOrNull()?.toString() == "Ljava/util/List;"
            } ?: throw PatchException("Could not find SetComments constructor")

            constructor.addInstructions(
                0,
                """
                    invoke-static {p1}, $EXTENSION_CLASS->filterComments(Ljava/util/List;)Ljava/util/List;
                    move-result-object p1
                """.trimIndent(),
            )

            val commentClass = mutableClassDefBy("Lcom/reddit/domain/model/Comment;")
            val collapsedField = commentClass.fields.firstOrNull { it.name == "collapsed" && it.type == "Z" }
                ?: throw PatchException("Could not find collapsed field in Lcom/reddit/domain/model/Comment;")
            collapsedField.accessFlags =
                (collapsedField.accessFlags and AccessFlags.FINAL.value.inv() and AccessFlags.PRIVATE.value.inv()) or
                AccessFlags.PUBLIC.value

            fillBridge(
                "isComment",
                """
                    instance-of p0, p0, Lcom/reddit/domain/model/Comment;
                    return p0
                """.trimIndent(),
            )

            fillBridge(
                "authorOf",
                """
                    check-cast p0, Lcom/reddit/domain/model/Comment;
                    invoke-virtual {p0}, Lcom/reddit/domain/model/Comment;->getAuthor()Ljava/lang/String;
                    move-result-object p0
                    return-object p0
                """.trimIndent(),
            )

            fillBridge(
                "depthOf",
                """
                    check-cast p0, Lcom/reddit/domain/model/IComment;
                    invoke-virtual {p0}, Lcom/reddit/domain/model/IComment;->getDepth()I
                    move-result p0
                    return p0
                """.trimIndent(),
            )

            fillBridge(
                "collapse",
                """
                    check-cast p0, Lcom/reddit/domain/model/Comment;
                    iput-boolean p1, p0, Lcom/reddit/domain/model/Comment;->collapsed:Z
                    return-void
                """.trimIndent(),
            )
        }
    }
