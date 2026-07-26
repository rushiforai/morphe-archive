package dev.jason.gboardpatches.patches.gboard.features.advancedvoice

import org.junit.Assert.assertEquals
import org.junit.Test

class GboardAdvancedVoice1777BindingsTest {
    @Test
    fun exact1777InterventionPointsAreCentralized() {
        assertEquals("17.7.7", GboardAdvancedVoice1777Bindings.targetVersion)
        assertEquals(
            "Lneg;->g()Ljava/lang/Object;",
            GboardAdvancedVoice1777Bindings.flagValue.descriptor(),
        )
        assertEquals(
            "Lric;->a()Z",
            GboardAdvancedVoice1777Bindings.nativeReadiness.descriptor(),
        )
        assertEquals(
            "Leqb;->d(Landroid/content/Context;Lptc;)V",
            GboardAdvancedVoice1777Bindings.initialVoiceSettings.descriptor(),
        )
        assertEquals(
            "Lqzh;-><init>(Landroid/content/Context;Lqzi;Lqzc;Laave;)V",
            GboardAdvancedVoice1777Bindings.mddProviderConstructor.descriptor(),
        )
        assertEquals(
            "Lrcb;-><init>(Ljava/util/Locale;Leed;Lros;Ledu;ZLrce;Lrud;Lsln;" +
                "Ljava/util/concurrent/Executor;)V",
            GboardAdvancedVoice1777Bindings.formatterConstructor.descriptor(),
        )
    }
}
