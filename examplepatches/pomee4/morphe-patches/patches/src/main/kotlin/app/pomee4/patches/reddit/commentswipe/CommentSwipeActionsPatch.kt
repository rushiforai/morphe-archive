/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

package app.pomee4.patches.reddit.commentswipe

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.pomee4.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import com.android.tools.smali.dexlib2.Opcode
import org.w3c.dom.Element

private const val EXTENSION_CLASS =
    "Lapp/pomee4/extension/commentswipe/CommentSwipeActionsPatch;"

private const val VOTE_DIRECTION = "Lcom/reddit/domain/model/vote/VoteDirection;"
private const val SHARE_SOURCE = "Lcom/reddit/comments/events/OnClickShareEvent\$Source;"

private const val SETTINGS_ACTIVITY = "app.pomee4.extension.commentswipe.SettingsActivity"

/**
 * Declares the settings screen of the extension in the manifest.
 */
private val settingsActivityPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            application.appendChild(
                document.createElement("activity").apply {
                    setAttribute("android:name", SETTINGS_ACTIVITY)
                    setAttribute("android:exported", "false")
                    setAttribute("android:label", "Comment swipe actions")
                }
            )
        }
    }
}

@Suppress("unused")
val commentSwipeActionsPatch = bytecodePatch(
    name = "Swipe actions",
    description = "Adds swipe actions to comments and posts: swipe left or right to vote, save, " +
        "reply, hide, share, collapse and more. Each direction has a first and a second action, picked by " +
        "how far it is swiped. Posts swipe in feeds, subreddits, profiles, saved posts and history. " +
        "Settings: Reddit settings, General, Swipe actions."
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    dependsOn(settingsActivityPatch, settingsRowPatch, postSwipePatch)

    // The extension is added by settingsRowPatch.

    execute {
        // Watch the window's touch events, to take over a sideways swipe on a comment.
        RedditActivityOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onActivityCreated(Landroid/app/Activity;)V"
        )

        // The comment row's touch scope, which has its size, and the row's callbacks,
        // which have the comment id and the event sink.
        CommentGestureHandlerFingerprint.method.addInstruction(
            0,
            "invoke-static { p0, p1 }, $EXTENSION_CLASS->" +
                "onCommentGestureScope(Ljava/lang/Object;Ljava/lang/Object;)V"
        )

        // Where in the comment the finger went down.
        CommentPressFingerprint.method.addInstruction(
            0,
            "invoke-static { p0, p2, p3 }, $EXTENSION_CLASS->onCommentPress(Ljava/lang/Object;J)V"
        )

        // Comments, for their saved state and author.
        CommentConstructorFingerprint.method.apply {
            instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
                .reversed()
                .forEach { index ->
                    addInstruction(
                        index,
                        "invoke-static { p0 }, $EXTENSION_CLASS->" +
                            "onCommentCreated(Ljava/lang/Object;)V"
                    )
                }
        }

        // Event factories, so the extension can send the events the comment buttons send.
        fillEventFactory(
            "createVoteEvent",
            VoteEventFingerprint,
            listOf(VOTE_DIRECTION, "Ljava/lang/String;")
        ) { event, constructor ->
            """
                if-eqz p0, :downvote
                sget-object p0, $VOTE_DIRECTION->UP:$VOTE_DIRECTION
                goto :create
                :downvote
                sget-object p0, $VOTE_DIRECTION->DOWN:$VOTE_DIRECTION
                :create
                new-instance p2, $event
                invoke-direct { p2, p0, p1 }, $constructor
                return-object p2
            """
        }

        mapOf(
            "createReplyEvent" to ReplyEventFingerprint,
            "createSaveEvent" to SaveEventFingerprint,
            "createUnsaveEvent" to UnsaveEventFingerprint,
            "createCollapseEvent" to CollapseThreadEventFingerprint,
            "createOverflowEvent" to OverflowMenuEventFingerprint,
            "createToggleCollapseEvent" to ClickCommentEventFingerprint,
        ).forEach { (factory, fingerprint) ->
            fillEventFactory(factory, fingerprint, listOf("Ljava/lang/String;")) { event, constructor ->
                """
                    new-instance p1, $event
                    invoke-direct { p1, p0 }, $constructor
                    return-object p1
                """
            }
        }

        // The same event the Share button of a comment sends.
        fillEventFactory(
            "createShareEvent",
            ShareEventFingerprint,
            listOf("I", "Ljava/lang/String;", SHARE_SOURCE)
        ) { event, constructor ->
            """
                new-instance p3, $event
                const/4 p1, -0x1
                sget-object p2, $SHARE_SOURCE->CommentActionBar:$SHARE_SOURCE
                invoke-direct { p3, p1, p0, p2 }, $constructor
                return-object p3
            """
        }
    }
}

/**
 * Replaces the body of an event factory of the extension with one that creates the event.
 * The factories have no local registers, so the smali uses only parameter registers.
 *
 * @param smali Smali creating the event, given the event type and its constructor.
 */
private fun BytecodePatchContext.fillEventFactory(
    factoryName: String,
    eventFingerprint: Fingerprint,
    constructorParameters: List<String>,
    smali: (event: String, constructor: String) -> String,
) {
    val eventClass = eventFingerprint.originalClassDef
    val constructor = eventClass.methods.firstOrNull { method ->
        method.name == "<init>" && method.parameterTypes.map { it.toString() } == constructorParameters
    } ?: throw PatchException("No constructor ${constructorParameters.joinToString("")} in ${eventClass.type}")

    val constructorReference = "${eventClass.type}-><init>(${constructorParameters.joinToString("")})V"

    Fingerprint(
        definingClass = EXTENSION_CLASS,
        name = factoryName,
    ).method.addInstructions(0, smali(eventClass.type, constructorReference))
}
