package dev.jason.gboardpatches.patches.gboard.features.longpressquickactions

import org.junit.Assert.assertEquals
import org.junit.Test

class GboardLongPressQuickActions1777BindingsTest {
    @Test
    fun exact1777InterventionPointsAreCentralized() {
        assertEquals("17.7.7", GboardLongPressQuickActions1777Bindings.targetVersion)
        assertEquals(
            "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;->q(Lowd;J)Z",
            GboardLongPressQuickActions1777Bindings.softKeyBind.descriptor(),
        )
        assertEquals(
            "Loau;->at(Lnbj;)Z",
            GboardLongPressQuickActions1777Bindings.inputEvent.descriptor(),
        )
        assertEquals(
            "Lpbl;->B(Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;FFJI)V",
            GboardLongPressQuickActions1777Bindings.pointerOwner.descriptor(),
        )
    }
}

