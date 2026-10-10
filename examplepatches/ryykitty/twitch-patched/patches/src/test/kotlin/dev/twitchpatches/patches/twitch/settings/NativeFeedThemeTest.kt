package dev.twitchpatches.patches.twitch.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class NativeFeedThemeTest {
    private fun provider(owner: String, override: Boolean = true) = ImmutableMethod("Lsynthetic/Provider;", "get",
        emptyList(), "Ljava/lang/Object;", AccessFlags.PUBLIC.value, null, null,
        MutableMethodImplementation(4)).toMutable().apply {
        addInstructionsWithLabels(0, """
            iget-object v0, p0, $owner->activity:Ljavax/inject/Provider;
            invoke-interface {v0}, Ljavax/inject/Provider;->get()Ljava/lang/Object;
            move-result-object v0
            check-cast v0, Landroidx/fragment/app/n;
            sget-object v1, Lsynthetic/Theme;->DARK:Lsynthetic/Theme;
            ${if (override) "invoke-virtual {v0, v2}, Landroid/view/ContextThemeWrapper;->applyOverrideConfiguration(Landroid/content/res/Configuration;)V" else "nop"}
            return-object v0
        """)
    }

    @Test fun resolvesTheFeedContextOverride() {
        assertEquals(listOf(4), feedContextThemeIndices(provider("Lsynthetic/FeedFactory;"), "Lsynthetic/FeedFactory;"))
    }

    @Test fun excludesUnrelatedVideoAndStoryContexts() {
        assertTrue(feedContextThemeIndices(provider("Lsynthetic/StoryFactory;"), "Lsynthetic/FeedFactory;").isEmpty())
    }

    @Test fun requiresTheContextConfigurationContract() {
        assertTrue(feedContextThemeIndices(provider("Lsynthetic/FeedFactory;", false), "Lsynthetic/FeedFactory;").isEmpty())
    }
}
