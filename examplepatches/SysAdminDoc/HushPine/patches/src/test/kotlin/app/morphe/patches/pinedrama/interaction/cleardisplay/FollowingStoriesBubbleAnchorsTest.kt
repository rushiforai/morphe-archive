/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.pinedrama.interaction.cleardisplay

import app.morphe.patcher.patch.PatchException
import org.junit.Assert.assertThrows
import org.junit.Test

private const val BUBBLE_EXTENSION = "Lapp/morphe/extension/pinedrama/cleardisplay/FollowingStoriesBubble;"

/**
 * What the Following stories bubble hook needs, held to each declared build: the bubble's clear
 * mode handler hides it with one call taking two booleans, under a test of the event's own flag
 * whose other arm is the way out; the list model is still a single list model with listGetAll;
 * and the hook lands before the hide and at the start of the way out, keeping the branch into
 * the way out on its first new instruction and PineDrama's own instructions in their order.
 */
class FollowingStoriesBubbleAnchorsTest {

    @Test
    fun `a list model that isn't a single list model is refused`() {
        assertThrows(PatchException::class.java) { checkBubbleList { null } }
    }
}
