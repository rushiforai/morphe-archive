package io.github.ilikeadofai.vocacolle.extension.settings;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class MorpheSettingsLauncherTest {
    @Test
    public void matchesOnlyTheDedicatedMorpheMenuItemId() {
        assertTrue(MorpheSettingsLauncher.isMorpheMenuItemId(0x4d4f5250));
        assertFalse(MorpheSettingsLauncher.isMorpheMenuItemId(0));
        assertFalse(MorpheSettingsLauncher.isMorpheMenuItemId(android.R.id.home));
    }

    @Test
    public void createsACompatibleComposeClickCallbackAndReturnsKotlinUnit() {
        Object callback = MorpheSettingsLauncher.createClickCallback();

        assertTrue(callback instanceof Dl.a);
        assertSame(nl.L.a, ((Dl.a) callback).invoke());
        assertTrue(callback.toString().contains("MorpheSettingsClickCallback"));
    }
}
