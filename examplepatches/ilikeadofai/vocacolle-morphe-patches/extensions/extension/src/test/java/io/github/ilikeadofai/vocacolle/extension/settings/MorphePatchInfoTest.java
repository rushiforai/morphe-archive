package io.github.ilikeadofai.vocacolle.extension.settings;

import static org.junit.Assert.assertEquals;

import io.github.ilikeadofai.vocacolle.extension.BuildConfig;
import org.junit.Test;

public class MorphePatchInfoTest {
    @Test
    public void appVersionIncludesTheCurrentMorphePatchVersion() {
        assertEquals(
                "7.40.0 · Morphe " + BuildConfig.MORPHE_PATCH_VERSION,
                MorphePatchInfo.formatAppVersion("7.40.0")
        );
    }
}
