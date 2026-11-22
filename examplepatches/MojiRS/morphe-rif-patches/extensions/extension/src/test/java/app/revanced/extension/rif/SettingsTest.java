package app.revanced.extension.rif;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** JVM tests for {@link Settings} defaults (no app Context here, so every getter returns its default). */
public class SettingsTest {

    // Only the Morphe bundle rewrites inlineTablesOnly() (when Patcheddit's Inline media is applied too); as built,
    // and so in the ReVanced bundle, it is off and images keep their own setting.
    @Test
    public void tablesOnlyIsOffAsBuilt() {
        assertFalse(Settings.inlineTablesOnly());
        assertTrue(Settings.inlineImages());
        assertTrue(Settings.inlineVideos());
        assertTrue(Settings.inlineTables());
    }
}
