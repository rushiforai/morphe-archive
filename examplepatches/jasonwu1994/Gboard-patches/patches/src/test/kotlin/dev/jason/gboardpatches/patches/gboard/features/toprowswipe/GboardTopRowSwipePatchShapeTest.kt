package dev.jason.gboardpatches.patches.gboard.features.toprowswipe

import org.junit.Assert.assertTrue
import org.junit.Test

class GboardTopRowSwipePatchShapeTest {
    @Test
    fun `softkey delegates point at the expected runtime methods`() {
        assertTrue(TOP_ROW_SWIPE_PATCH_INCOMING_METADATA_DELEGATE.contains("patchIncomingSoftKeyMetadata"))
        assertTrue(TOP_ROW_SWIPE_AFTER_BIND_DELEGATE.contains("afterSoftKeyBound"))
        assertTrue(TOP_ROW_SWIPE_PATCH_INCOMING_METADATA_DELEGATE.contains(TOP_ROW_SWIPE_RUNTIME_CLASS))
    }

    @Test
    fun `softkey entry delegate keeps both calls in the parameter-safe region`() {
        assertTrue(TOP_ROW_SWIPE_ENTRY_DELEGATE.contains("patchIncomingSoftKeyMetadata"))
        assertTrue(TOP_ROW_SWIPE_ENTRY_DELEGATE.contains("afterSoftKeyBound"))
        assertTrue(TOP_ROW_SWIPE_ENTRY_DELEGATE.contains(TOP_ROW_SWIPE_RUNTIME_CLASS))
    }

    @Test
    fun `pointer and gesture delegates stay on the agreed runtime contract`() {
        assertTrue(TOP_ROW_SWIPE_POINTER_DELEGATE.contains("maybeArmAndResolveTopRowOwner"))
        assertTrue(TOP_ROW_SWIPE_CLEAR_SESSION_DELEGATE.contains("clearSwipeSession"))
        assertTrue(TOP_ROW_SWIPE_GESTURE_OWNER_DELEGATE.contains("jasondevDispatchWithTopRow"))
        assertTrue(TOP_ROW_SWIPE_POINTER_DELEGATE.contains(TOP_ROW_SWIPE_RUNTIME_CLASS))
        assertTrue(TOP_ROW_SWIPE_DISPATCH_WITH_TOP_ROW_BODY.contains("maybeConsumeTopRowSwipe"))
        assertTrue(
            TOP_ROW_SWIPE_DISPATCH_WITH_TOP_ROW_BODY.contains(
                "invoke-static {p0, p1, p2, p3, p4}, $TOP_ROW_SWIPE_RUNTIME_CLASS->maybeConsumeQuickJsTopRowPress"
            )
        )
        assertTrue(
            TOP_ROW_SWIPE_DISPATCH_WITH_TOP_ROW_BODY.contains(
                "(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z"
            )
        )
        assertTrue(TOP_ROW_SWIPE_DISPATCH_WITH_TOP_ROW_BODY.contains("jasondevDispatchOrToggle"))
        assertTrue(TOP_ROW_SWIPE_DISPATCH_WITH_TOP_ROW_BODY.contains(TOP_ROW_SWIPE_RUNTIME_CLASS))
    }
}
