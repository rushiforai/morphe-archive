package dev.twitchpatches.patches.twitch.settings

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class SettingsRendererTest {
    private fun row(styleType: String, flags: Int = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value) =
        ImmutableMethod("Lsynthetic/Settings;", "render",
            listOf("Ljava/lang/String;", "Ljava/lang/String;", "Lsynthetic/Callback;", "I",
                styleType, "Lsynthetic/Composer;", "I", "I").map { ImmutableMethodParameter(it, null, null) },
            "V", flags, null, null, MutableMethodImplementation(8))

    @Test fun rendererDoesNotDependOnOptimizerMergingItsStyleType() {
        assertTrue(isSettingsRow(row("Lsynthetic/Settings;")))
        assertTrue(isSettingsRow(row("Lsynthetic/SeparateStyle;")))
    }

    @Test fun primitiveStyleChangesAreRejected() {
        assertFalse(isSettingsRow(row("I")))
        assertFalse(isSettingsRow(row("J")))
    }

    @Test fun inaccessibleAndInstanceRenderersAreRejected() {
        assertFalse(isSettingsRow(row("Lsynthetic/Style;", AccessFlags.PRIVATE.value or AccessFlags.STATIC.value)))
        assertFalse(isSettingsRow(row("Lsynthetic/Style;", AccessFlags.PUBLIC.value)))
        assertFalse(isSettingsRow(row("Lsynthetic/Style;",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value)))
    }
}
