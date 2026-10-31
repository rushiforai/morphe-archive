/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.reels.doubletap

import app.morphe.ExtensionDex
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.media.taptoplay.FB_USER_SESSION
import app.morphe.patches.facebook.media.taptoplay.MOTION_EVENT
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * A small hand-built build with every anchor Turn off double tap to like needs: a reel like helper,
 * a GestureReactionComponent whose view has a heart and a handler read by three owners (the heart
 * itself, a listener the view makes and an event subscriber the component makes), and a feed
 * attachment, and for Home's photos the feed's double-tap like helper and a photo component making
 * its double-tap listener. One version is entirely sound and the patch applies. A second is sound everywhere
 * except the event subscriber, the last reader the hook looks at, whose read isn't followed by a
 * null check. On that build the whole hook must refuse before changing anything: not the reel like
 * helper hookReelLikes used to finish first, and not the heart or the listener hookGestureView's own
 * loop used to hook before reaching the bad reader.
 */
class TurnOffDoubleTapLikeOrderingTest {
    private val helper = "Lfixture/Helper;"
    private val attachmentClass = "Lfixture/Attachment;"
    private val component = "Lfixture/Component;"
    private val view = "Lfixture/GestureView;"
    private val listener = "Lfixture/Listener;"
    private val eventSubscriber = "Lfixture/EventSubscriber;"
    private val handlerField = "$view->handler:Ljava/lang/Object;"
    private val feedHelper = "Lfixture/FeedHelper;"
    private val photoComponent = "Lfixture/PhotoComponent;"
    private val photoDoubleTap = "Lfixture/PhotoDoubleTap;"
    private val photoSingleTap = "Lfixture/PhotoSingleTap;"
    private val otherDoubleTap = "Lfixture/OtherDoubleTap;"

    private fun method(
        owner: String,
        name: String,
        parameters: List<String>,
        returns: String,
        body: String,
        registers: Int = 8,
        static: Boolean = false,
    ): MutableMethod = MutableMethod(
        ImmutableMethod(
            owner, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returns,
            AccessFlags.PUBLIC.value or (if (static) AccessFlags.STATIC.value else 0), null, null,
            ImmutableMethodImplementation(registers, emptyList(), null, null),
        ),
    ).apply { addInstructionsWithLabels(0, body.trimIndent()) }

    private fun classDef(type: String, vararg methods: Method): ClassDef = classDef(type, "Ljava/lang/Object;", *methods)

    private fun classDef(type: String, superclass: String, vararg methods: Method): ClassDef =
        ImmutableClassDef(type, AccessFlags.PUBLIC.value, superclass, null, null, null, null, methods.map(ImmutableMethod::of))

    private fun helperClass() = classDef(
        helper,
        method(
            helper, "like", listOf(FB_USER_SESSION, "Ljava/lang/Object;", "Ljava/lang/String;"), "V",
            """
                const-string v0, "$MUTATE_LIKE"
                return-void
            """,
        ),
        method(
            helper, "doubleTapLike", listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Z"), "V",
            """
                invoke-static {p1, p3}, $helper->keyFor(Ljava/lang/Object;Z)Ljava/lang/String;
                move-result-object v0
                if-eqz v0, :noKey
                const-string v1, "like_double_tap"
                return-void
                :noKey
                return-void
            """,
        ),
    )

    /** [registers] lets a test shrink this to exactly its parameters, leaving no local to borrow. */
    private fun attachment(registers: Int = 8) = classDef(
        attachmentClass,
        method(
            attachmentClass, "onDoubleTap", listOf(MOTION_EVENT), "Z",
            """
                const-string v0, "$HEART_RISE"
                const/4 v1, 0x0
                invoke-virtual {v1, v1, v1, v1}, $helper->doubleTapLike(Ljava/lang/Object;Ljava/lang/Object;Z)V
                const/4 v0, 0x0
                return v0
            """,
            registers = registers,
        ),
    )

    private fun componentClass() = classDef(
        component,
        method(component, "<init>", emptyList(), "V", """
            const-string v0, "$GESTURE_REACTION"
            return-void
        """),
        method(component, "onCreateMountContent", listOf("Landroid/content/Context;"), "Ljava/lang/Object;", """
            new-instance v0, $view
            return-object v0
        """),
        // What the component makes on mount: the event subscriber, the third reader.
        method(component, "onMount", listOf("Ljava/lang/Object;"), "V", """
            new-instance v0, $eventSubscriber
            return-void
        """),
    )

    private fun gestureView() = classDef(
        view,
        method(view, "heart", listOf(MOTION_EVENT, view), "V", """
            const-string v0, "$SHORT_FORM_VIDEO_UNIT"
            iget-object v0, p1, $handlerField
            if-eqz v0, :none
            const-string v1, "played"
            :none
            return-void
        """, static = true),
        // What the view makes: its gesture listener, the second reader.
        method(view, "makeListener", emptyList(), listener, """
            new-instance v0, $listener
            return-object v0
        """),
    )

    private fun listenerClass() = classDef(
        listener,
        method(listener, "onDoubleTap", listOf(MOTION_EVENT), "Z", """
            iget-object v0, p0, $handlerField
            if-eqz v0, :none
            const/4 v0, 0x1
            return v0
            :none
            const/4 v0, 0x0
            return v0
        """),
    )

    /** The event subscriber. [checked] false drops the null check its read must have. */
    private fun eventSubscriberClass(checked: Boolean) = classDef(
        eventSubscriber,
        method(
            eventSubscriber, "onEvent", listOf("Ljava/lang/Object;"), "V",
            if (checked) {
                """
                    iget-object v0, p0, $handlerField
                    if-eqz v0, :none
                    :none
                    return-void
                """
            } else {
                """
                    iget-object v0, p0, $handlerField
                    const-string v1, "no null check follows this read"
                    return-void
                """
            },
        ),
    )

    private val feedLike = "$feedHelper->like(${FB_USER_SESSION}Ljava/lang/Object;${GRAPHQL_FEEDBACK}Ljava/lang/Object;)V"

    /**
     * Home's photos: the feed's double-tap like helper, a photo component calling its like and
     * making a double-tap listener and a single-tap one, and a double-tap listener nothing calling
     * the helper makes. [listenerRegisters] 2 leaves the photo's double-tap listener no local, and
     * [twoDoubleTaps] has the component make the other double-tap listener as well.
     */
    private fun feedClasses(listenerRegisters: Int = 4, twoDoubleTaps: Boolean = false): List<ClassDef> = listOf(
        classDef(
            feedHelper,
            method(feedHelper, "haptic", listOf("Landroid/view/View;"), "V", """
                const-string v0, "$FEED_LIKE_HAPTIC"
                return-void
            """, static = true),
            method(feedHelper, "like", listOf(FB_USER_SESSION, "Ljava/lang/Object;", GRAPHQL_FEEDBACK, "Ljava/lang/Object;"), "V", """
                const-string v0, "liked"
                return-void
            """, static = true),
            method(feedHelper, ANIMATION_POSITION, listOf("Ljava/lang/Object;"), "Landroid/graphics/PointF;", """
                const/4 v0, 0x0
                return-object v0
            """),
        ),
        classDef(
            photoComponent,
            method(photoComponent, "mount", listOf("Ljava/lang/Object;"), "V", """
                new-instance v0, $photoSingleTap
                new-instance v0, $photoDoubleTap
                ${if (twoDoubleTaps) "new-instance v0, $otherDoubleTap" else "nop"}
                const/4 v0, 0x0
                invoke-static {v0, v0, v0, v0}, $feedLike
                return-void
            """),
        ),
        doubleTapListener(photoDoubleTap, listenerRegisters),
        doubleTapListener(otherDoubleTap, 4),
        classDef(
            photoSingleTap, GESTURE_LISTENER,
            method(photoSingleTap, "<init>", emptyList(), "V", "return-void", registers = 1),
            method(photoSingleTap, "onSingleTapConfirmed", listOf(MOTION_EVENT), "Z", """
                const/4 v0, 0x1
                return v0
            """),
        ),
    )

    /** A SimpleOnGestureListener whose only method is an onDoubleTapEvent answering true on the lift. */
    private fun doubleTapListener(type: String, registers: Int) = classDef(
        type, GESTURE_LISTENER,
        method(type, "<init>", emptyList(), "V", "return-void", registers = 1),
        method(type, DOUBLE_TAP_EVENT, listOf(MOTION_EVENT), "Z", """
            invoke-virtual {p1}, $MOTION_EVENT->getAction()I
            move-result p1
            const/4 p0, 0x1
            if-ne p1, p0, :no
            return p0
            :no
            const/4 p0, 0x0
            return p0
        """, registers = registers),
    )

    private fun build(
        eventSubscriberChecked: Boolean = true,
        attachmentRegisters: Int = 8,
        feed: List<ClassDef> = feedClasses(),
    ): BytecodePatchContext = PatchContexts.of(
        listOf(
            helperClass(), attachment(attachmentRegisters), componentClass(), gestureView(), listenerClass(),
            eventSubscriberClass(eventSubscriberChecked), ExtensionDex.classDef(SETTINGS_STATUS),
        ) + feed,
    )

    /** Every hooked method of a sound build, for the tests that check nothing changed. */
    private val hooked = listOf(helper to "like", helper to "doubleTapLike", attachmentClass to "onDoubleTap",
        view to "heart", listener to "onDoubleTap", eventSubscriber to "onEvent", feedHelper to "like",
        photoDoubleTap to DOUBLE_TAP_EVENT)

    private fun instructionCount(context: BytecodePatchContext, owner: String, name: String) =
        context.mutableClassDefBy(owner).methods.single { it.name == name }.implementation!!.instructions.count()

    @Test
    fun `a sound build applies and hooks every reader`() {
        val context = build()
        val before = hooked.associateWith { (owner, name) -> instructionCount(context, owner, name) }
        val untouched = listOf(otherDoubleTap to DOUBLE_TAP_EVENT, photoSingleTap to "onSingleTapConfirmed", photoComponent to "mount")
            .associateWith { (owner, name) -> instructionCount(context, owner, name) }

        turnOffDoubleTapLikePatch.execute(context)

        before.forEach { (ownerAndName, originalCount) ->
            val (owner, name) = ownerAndName
            val grown = instructionCount(context, owner, name) - originalCount
            assertTrue("$owner->$name should have grown by a hook, was $originalCount now ${instructionCount(context, owner, name)}", grown > 0)
        }
        // The single-tap listener, the double-tap listener nothing calling the helper makes, and the
        // component itself are left as built.
        untouched.forEach { (ownerAndName, originalCount) ->
            val (owner, name) = ownerAndName
            assertEquals("$owner->$name was changed", originalCount, instructionCount(context, owner, name))
        }
        val photo = context.mutableClassDefBy(photoDoubleTap).methods.single { it.name == DOUBLE_TAP_EVENT }
            .implementation!!.instructions.toList()
        // Registers: two locals, this, then the event the hook hands over.
        assertEquals(3, (photo[0] as TwoRegisterInstruction).registerB)
    }

    /** The photo's double-tap listener has no free local; nothing else may have changed. */
    @Test
    fun `a feed photo listener with no free local leaves everything unchanged`() {
        val context = build(feed = feedClasses(listenerRegisters = 2))
        val before = hooked.associateWith { (owner, name) -> instructionCount(context, owner, name) }

        val message = assertThrows(PatchException::class.java) { turnOffDoubleTapLikePatch.execute(context) }.message!!
        assertTrue(message, message.contains("$photoDoubleTap->$DOUBLE_TAP_EVENT has 0 local register(s), needs 1"))

        before.forEach { (ownerAndName, originalCount) ->
            val (owner, name) = ownerAndName
            assertEquals("$owner->$name changed even though the photo listener had no free local", originalCount,
                instructionCount(context, owner, name))
        }
    }

    /** A photo component making two double-tap listeners can't say which one likes; nothing changes. */
    @Test
    fun `two feed photo double-tap listeners refuse with everything unchanged`() {
        val context = build(feed = feedClasses(twoDoubleTaps = true))
        val before = hooked.associateWith { (owner, name) -> instructionCount(context, owner, name) }

        val message = assertThrows(PatchException::class.java) { turnOffDoubleTapLikePatch.execute(context) }.message!!
        assertTrue(message, message.contains("made by a class calling the feed's double-tap like helper, found 2"))

        before.forEach { (ownerAndName, originalCount) ->
            val (owner, name) = ownerAndName
            assertEquals("$owner->$name changed even though the photo listener was ambiguous", originalCount,
                instructionCount(context, owner, name))
        }
    }

    /** Without the feed's double-tap like helper the patch refuses, with the reel hooks unchanged. */
    @Test
    fun `a build without the feed's double-tap like helper refuses`() {
        val context = build(feed = feedClasses().filter { it.type != feedHelper })
        val reelHooks = hooked.filter { it.first != feedHelper }
        val before = reelHooks.associateWith { (owner, name) -> instructionCount(context, owner, name) }

        val message = assertThrows(PatchException::class.java) { turnOffDoubleTapLikePatch.execute(context) }.message!!
        assertTrue(message, message.contains("expected one class loading \"$FEED_LIKE_HAPTIC\""))

        before.forEach { (ownerAndName, originalCount) ->
            val (owner, name) = ownerAndName
            assertEquals("$owner->$name changed even though the feed helper was missing", originalCount,
                instructionCount(context, owner, name))
        }
    }

    /**
     * The event subscriber, the last reader hookGestureView looks at, has no null check after its
     * read. The whole hook must refuse before touching anything: the reel like helper's like and
     * double-tap like, the attachment, the heart and the listener all stay exactly as built.
     */
    @Test
    fun `a bad last reader refuses the patch before anything else changes`() {
        val context = build(eventSubscriberChecked = false)
        val before = listOf(helper to "like", helper to "doubleTapLike", attachmentClass to "onDoubleTap",
            view to "heart", listener to "onDoubleTap", feedHelper to "like", photoDoubleTap to DOUBLE_TAP_EVENT)
            .associateWith { (owner, name) -> instructionCount(context, owner, name) }

        val message = assertThrows(PatchException::class.java) { turnOffDoubleTapLikePatch.execute(context) }.message!!
        assertTrue(message, message.contains("without checking it for null straight away"))

        before.forEach { (ownerAndName, originalCount) ->
            val (owner, name) = ownerAndName
            assertEquals("$owner->$name changed even though a later anchor refused", originalCount, instructionCount(context, owner, name))
        }
    }

    /**
     * The attachment, a later anchor than the helper's own like and double-tap like, has no free
     * local for its hook to borrow. The whole hook must refuse before touching anything: the
     * helper's like and double-tap like, found and checked before the attachment, must not have
     * been changed, and neither must the gesture view, found only once the reel like anchors pass.
     */
    @Test
    fun `a later anchor with no free local leaves everything unchanged`() {
        val context = build(attachmentRegisters = 2)
        val before = hooked.associateWith { (owner, name) -> instructionCount(context, owner, name) }

        val message = assertThrows(PatchException::class.java) { turnOffDoubleTapLikePatch.execute(context) }.message!!
        assertTrue(message, message.contains("$attachmentClass->onDoubleTap has 0 local register(s), needs 1"))

        before.forEach { (ownerAndName, originalCount) ->
            val (owner, name) = ownerAndName
            assertEquals("$owner->$name changed even though a later anchor had no free local", originalCount,
                instructionCount(context, owner, name))
        }
    }

    /**
     * A build where the feed attachment's own class is also what the gesture view hook would
     * change: the component mounts it instead of a separate event subscriber, and its onDoubleTap
     * reads the handler field too, checked, so findGestureViewAnchors alone would accept it as a
     * reader. The whole hook must still refuse: applying the reel like hook to this class would
     * shift the read position the gesture view hook already recorded for it.
     */
    @Test
    fun `a class that is both a reel like anchor and a gesture view reader refuses`() {
        val collidingComponent = classDef(
            component,
            method(component, "<init>", emptyList(), "V", """
                const-string v0, "$GESTURE_REACTION"
                return-void
            """),
            method(component, "onCreateMountContent", listOf("Landroid/content/Context;"), "Ljava/lang/Object;", """
                new-instance v0, $view
                return-object v0
            """),
            // Mounts the attachment class itself, instead of a separate event subscriber.
            method(component, "onMount", listOf("Ljava/lang/Object;"), "V", """
                new-instance v0, $attachmentClass
                return-void
            """),
        )
        val collidingAttachment = classDef(
            attachmentClass,
            method(
                attachmentClass, "onDoubleTap", listOf(MOTION_EVENT), "Z",
                """
                    iget-object v0, p0, $handlerField
                    if-eqz v0, :none
                    :none
                    const-string v1, "$HEART_RISE"
                    const/4 v2, 0x0
                    invoke-virtual {v2, v2, v2, v2}, $helper->doubleTapLike(Ljava/lang/Object;Ljava/lang/Object;Z)V
                    const/4 v0, 0x0
                    return v0
                """,
                registers = 10,
            ),
        )
        val context = PatchContexts.of(
            listOf(helperClass(), collidingAttachment, collidingComponent, gestureView(), listenerClass(),
                eventSubscriberClass(checked = true), ExtensionDex.classDef(SETTINGS_STATUS)) + feedClasses(),
        )
        val before = listOf(helper to "like", helper to "doubleTapLike", attachmentClass to "onDoubleTap",
            view to "heart", listener to "onDoubleTap")
            .associateWith { (owner, name) -> instructionCount(context, owner, name) }

        val message = assertThrows(PatchException::class.java) { turnOffDoubleTapLikePatch.execute(context) }.message!!
        assertTrue(message, message.contains("is both a gesture view reader and part of the reel like hooks"))

        before.forEach { (ownerAndName, originalCount) ->
            val (owner, name) = ownerAndName
            assertEquals("$owner->$name changed even though the two hooks collided", originalCount,
                instructionCount(context, owner, name))
        }
    }

    private fun like(vararg parameters: String) = method(helper, "like", parameters.toList(), "V", """
        const-string v0, "$MUTATE_LIKE"
        return-void
    """, registers = parameters.size + 2)

    /**
     * The like's source is its last string: the last parameter on 577 and 580, followed by two
     * Function1 callbacks on 581. Anything else after it, or no string, isn't a reel like.
     */
    @Test
    fun `the like's source is its last string, with only callbacks after it`() {
        val callback = "Lkotlin/jvm/functions/Function1;"
        val older = like(FB_USER_SESSION, "Ljava/lang/Integer;", STRING)
        assertEquals(2, likeSource(older))
        assertTrue(isReelLike(older))
        val newer = like(FB_USER_SESSION, "Ljava/lang/Integer;", STRING, callback, callback)
        assertEquals(2, likeSource(newer))
        assertTrue(isReelLike(newer))

        assertEquals(null, likeSource(like(FB_USER_SESSION, STRING, "Ljava/lang/Object;")))
        assertFalse(isReelLike(like(FB_USER_SESSION, "Ljava/lang/Integer;")))
        assertFalse(isReelLike(like("Ljava/lang/Object;", STRING)))
    }

    @Test
    fun `the like hook reads the source, not the callbacks after it`() {
        val callback = "Lkotlin/jvm/functions/Function1;"
        val newer = classDef(helper, like(FB_USER_SESSION, STRING, callback, callback), helperClass().methods.single {
            it.name == "doubleTapLike"
        })
        val context = PatchContexts.of(
            listOf(newer, attachment(), componentClass(), gestureView(), listenerClass(),
                eventSubscriberClass(checked = true), ExtensionDex.classDef(SETTINGS_STATUS)) + feedClasses(),
        )
        turnOffDoubleTapLikePatch.execute(context)
        val hooked = context.mutableClassDefBy(helper).methods.single { it.name == "like" }.implementation!!.instructions.toList()
        // Registers: one local, this, the session, then the source and the two callbacks.
        assertEquals(3, (hooked[0] as TwoRegisterInstruction).registerB)
    }

    /** SettingsStatus with none of its usual switches, so it has no boolean doubleTapLike(). */
    private fun settingsStatusMissingDoubleTapLike() = classDef(
        SETTINGS_STATUS,
        method(SETTINGS_STATUS, "someOtherSwitch", emptyList(), "Z", "const/4 v0, 0x0\nreturn v0", static = true),
    )

    /**
     * SettingsStatus carries no doubleTapLike() method, everything else about the build is sound.
     * enableStatus itself would refuse on this, but only after both hooks already changed their
     * anchors; the whole hook must refuse before either one runs, the same as a bad anchor does.
     */
    @Test
    fun `SettingsStatus missing the switch refuses before either hook changes anything`() {
        val context = PatchContexts.of(
            listOf(helperClass(), attachment(), componentClass(), gestureView(), listenerClass(),
                eventSubscriberClass(checked = true), settingsStatusMissingDoubleTapLike()) + feedClasses(),
        )
        val before = hooked.associateWith { (owner, name) -> instructionCount(context, owner, name) }

        val message = assertThrows(PatchException::class.java) { turnOffDoubleTapLikePatch.execute(context) }.message!!
        assertTrue(message, message.contains("SettingsStatus has no boolean method doubleTapLike()"))

        before.forEach { (ownerAndName, originalCount) ->
            val (owner, name) = ownerAndName
            assertEquals("$owner->$name changed even though SettingsStatus was missing the switch", originalCount,
                instructionCount(context, owner, name))
        }
    }
}
