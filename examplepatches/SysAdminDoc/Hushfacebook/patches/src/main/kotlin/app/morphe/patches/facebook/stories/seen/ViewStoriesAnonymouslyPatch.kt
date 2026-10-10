/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.stories.seen

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.feed.resolveStatic
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.facebookExtensionPatch
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Keeps the stories you view from being reported, which is what puts you on their viewer lists.
 * See StorySeenAnchors.kt for the report and how the sender is found.
 *
 * The hook goes first in the sender and returns before anything is built or sent, the way the
 * sender already returns when it has no cards. Only the viewing report stops: replies and
 * reactions are sent by another class. With the Mark as seen button's switch on as well, the hook
 * sends the cards you marked instead, in a set of their own, and a second hook in the seen helper
 * tells the button which card is on screen. A third hook, where Facebook's story controllers make a card the
 * active one, keeps the button on that card.
 *
 * In the default selection with its switch and the button's both off, since it changes what other
 * people see, and stories you've viewed keep their unwatched ring: Facebook greys a ring only once
 * the server has taken the report, and a tray reloaded from the server still lists them as
 * unwatched.
 */
@Suppress("unused")
val viewStoriesAnonymouslyPatch = bytecodePatch(
    // The README table check reads this literal; PATCH carries the same text for the messages.
    name = "View stories anonymously",
    description = "Keeps you off the viewer list of stories you watch, because Facebook isn't told which ones " +
        "you've seen. Replying or reacting still shows you, and watched stories still look new. Starts off. Turn " +
        "it on in Hushfacebook settings > Stories.",
) {
    category("Privacy")
    dependsOn(settingsPatch, facebookExtensionPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        // Everything is found before anything changes, so a build missing one part is left as it was.
        val mutations = classDefByStrings(SEEN_ROOT_FIELD, StringComparisonType.EQUALS).filter(::isSeenMutation)
        val mutation = mutations.singleOrNull() ?: throw PatchException(
            "$PATCH: expected one query class whose constructor loads \"$SEEN_MUTATION\" and \"$SEEN_ROOT_FIELD\", " +
                "found ${mutations.size}",
        )
        val senders = classDefByStrings(STORY_IDS, StringComparisonType.EQUALS).mapNotNull { seenSender(it, mutation.type) }
        val sender = senders.singleOrNull() ?: throw PatchException(
            "$PATCH: expected one class that builds $SEEN_MUTATION with \"$STORY_IDS\" and sends it from one void " +
                "method taking the set of story ids, found ${senders.size}",
        )
        if (!hasSendShape(sender)) {
            throw PatchException("$PATCH: the sender doesn't take a callback and ${SENDER_SHAPE.joinToString("")}")
        }
        // The helper's literal can sit in a string table (582's armeabi-v7a build), so the sender's
        // callers are where it's looked for.
        val callers = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (!classDef.type.startsWith(EXTENSION_PACKAGE) && callsSender(classDef, sender)) callers += classDef
        }
        val tables = { call: MethodReference -> classDefByOrNull(call.definingClass)?.let { resolveStatic(it, call) } }
        val helper = seenHelper(callers, sender, tables)
        val card = cardSeen(helper)
        val storyCard = classDefByOrNull(STORY_CARD) ?: throw PatchException("$PATCH: this Facebook build has no $STORY_CARD")
        if (storyCard.methods.none { "${it.definingClass}->${it.name}()${it.returnType}" == CARD_ID && it.parameterTypes.isEmpty() }) {
            throw PatchException("$PATCH: $STORY_CARD has no getId()")
        }
        val activations = classDefByStrings(ACTIVATE_STATE, StringComparisonType.EQUALS)
            .flatMap { owner -> owner.methods.filter(::isCardActivation).map { owner to it } }
        val (activationOwner, activation) = activations.singleOrNull() ?: throw PatchException(
            "$PATCH: expected one controller method that loads \"$ACTIVATE_STATE\" and \"$ACTIVATE_CARD\", " +
                "found ${activations.size}",
        )
        val store = activeCardStore(activation)
        if (store < 0) {
            throw PatchException("$PATCH: ${activationOwner.type}->${activation.name} doesn't store the activated $STORY_CARD once")
        }
        val sendStub = stub(STORY_SEEN, SEND_STUB, "V")
        val cardIdStub = stub(STORY_SEEN_BUTTON, CARD_ID_STUB, "Ljava/lang/String;")

        mutableClassDefBy(sender.definingClass).methods.single { it.sameAs(sender) }.filterViews()
        mutableClassDefBy(card.definingClass).methods.single { it.sameAs(card) }.reportCard()
        mutableClassDefBy(activationOwner.type).methods.single { it.sameAs(activation) }.reportActive(store)
        sendStub.fillSend(sender)
        cardIdStub.fillCardId()
        enableStatus("storySeen")
    }
}

private fun Method.sameAs(other: Method) = name == other.name && returnType == other.returnType &&
    parameterTypes.map(Any::toString) == other.parameterTypes.map(Any::toString)

/** The extension's static stub [name] in [owner], answering [answer]. */
private fun BytecodePatchContext.stub(owner: String, name: String, answer: String): MutableMethod =
    mutableClassDefBy(owner).methods.singleOrNull {
        it.name == name && it.returnType == answer && AccessFlags.STATIC.isSet(it.accessFlags)
    } ?: throw PatchException("$PATCH: $owner has no static $answer $name")
