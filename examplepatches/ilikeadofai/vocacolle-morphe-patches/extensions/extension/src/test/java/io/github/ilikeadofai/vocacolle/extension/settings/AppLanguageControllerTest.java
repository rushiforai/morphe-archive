package io.github.ilikeadofai.vocacolle.extension.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

public class AppLanguageControllerTest {
    @Test
    public void api33UsesPlatformLocaleManagerAndSystemUsesEmptyOverride() {
        RecordingBackend backend = new RecordingBackend();

        AppLanguageController.apply(DisplayLanguage.KOREAN, 33, backend);
        assertEquals("ko", backend.platformLanguageTag);
        assertEquals("ko", backend.processLanguageTag);
        assertEquals(null, backend.legacyLanguageTag);

        AppLanguageController.apply(DisplayLanguage.SYSTEM, 36, backend);
        assertEquals("", backend.platformLanguageTag);
        assertEquals("", backend.processLanguageTag);
    }

    @Test
    public void api26To32UsesLegacyResourcesAndSystemUsesEmptyOverride() {
        RecordingBackend backend = new RecordingBackend();

        AppLanguageController.apply(DisplayLanguage.JAPANESE, 26, backend);
        assertEquals("ja", backend.legacyLanguageTag);
        assertEquals("ja", backend.processLanguageTag);
        assertEquals(null, backend.platformLanguageTag);

        AppLanguageController.apply(DisplayLanguage.SYSTEM, 32, backend);
        assertEquals("", backend.legacyLanguageTag);
        assertEquals("", backend.processLanguageTag);
    }

    @Test
    public void savedLanguageFailureFallsBackToSystemWithoutCrashingStartup() {
        RecordingBackend backend = new RecordingBackend();
        backend.failPlatformLanguageTag = "ko";

        AppLanguageController.applySavedLanguage(DisplayLanguage.KOREAN, 33, backend);

        assertEquals("", backend.platformLanguageTag);
        assertEquals("", backend.processLanguageTag);
    }

    @Test
    public void failedPlatformApplyDoesNotPartiallyChangeProcessLocale() {
        RecordingBackend backend = new RecordingBackend();
        backend.failPlatformLanguageTag = "ko";

        try {
            AppLanguageController.apply(DisplayLanguage.KOREAN, 33, backend);
        } catch (RuntimeException expected) {
            // Expected: the startup-safe wrapper owns recovery.
        }

        assertNull(backend.processLanguageTag);
    }

    private static final class RecordingBackend implements AppLanguageController.Backend {
        private String platformLanguageTag;
        private String legacyLanguageTag;
        private String processLanguageTag;
        private String failPlatformLanguageTag;

        @Override
        public void updateProcessLocale(String languageTag) {
            processLanguageTag = languageTag;
        }

        @Override
        public void setPlatformApplicationLocale(String languageTag) {
            if (languageTag.equals(failPlatformLanguageTag)) {
                throw new IllegalStateException("simulated platform locale failure");
            }
            platformLanguageTag = languageTag;
        }

        @Override
        public void updateLegacyResources(String languageTag) {
            legacyLanguageTag = languageTag;
        }
    }
}