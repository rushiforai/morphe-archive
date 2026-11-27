package dev.jason.gboardpatches.extension.writingtools;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.lang.reflect.Field;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=34,manifest=Config.NONE)
public class GboardAutoFixRoutingTest {
    private enum Intent {
        INTENT_AUTO_FIX,
        INTENT_STYLE_TRANSFER;
        @Override public String toString() { return "INTENT_AUTO_FIX"; }
    }

    @Before
    public void resetPreferencesAndContext() throws Exception {
        Field field = GboardAiWritingToolsRuntime.class.getDeclaredField("applicationContext");
        field.setAccessible(true);
        field.set(null, RuntimeEnvironment.getApplication());
        GboardAiWritingToolsSettings.preferences(RuntimeEnvironment.getApplication())
                .edit().clear().commit();
    }

    @Test
    public void autoFixFollowsLiveFeatureToggleWithoutChangingOtherIntents() {
        assertFalse(GboardAiWritingToolsRuntime.isAutoFixRoutingEnabled(Intent.INTENT_AUTO_FIX));
        GboardAiWritingToolsSettings.preferences(RuntimeEnvironment.getApplication()).edit()
            .putString(GboardAiWritingToolsSettings.PREF_KEY_BACKEND_TYPE,GboardAiWritingToolsSettings.BACKEND_SHARED_LOCAL).commit();
        assertTrue(GboardAiWritingToolsRuntime.isAutoFixRoutingEnabled(Intent.INTENT_AUTO_FIX));
        assertTrue(GboardAiWritingToolsRuntime.allowAutoFixRoute(false, Intent.INTENT_AUTO_FIX));
        assertFalse(GboardAiWritingToolsRuntime.isAutoFixRoutingEnabled(Intent.INTENT_STYLE_TRANSFER));
        GboardAiWritingToolsSettings.preferences(RuntimeEnvironment.getApplication()).edit()
                .putBoolean(GboardAiWritingToolsSettings.PREF_KEY_ENABLED, false).commit();
        assertFalse(GboardAiWritingToolsRuntime.isAutoFixRoutingEnabled(Intent.INTENT_AUTO_FIX));
        assertFalse(GboardAiWritingToolsRuntime.allowAutoFixRoute(false, Intent.INTENT_AUTO_FIX));
        assertTrue(GboardAiWritingToolsRuntime.allowAutoFixRoute(true, Intent.INTENT_AUTO_FIX));
    }

    @Test
    public void stockRoutesAndUnexpectedInputsArePreserved() {
        assertTrue(GboardAiWritingToolsRuntime.allowAutoFixRoute(true, Intent.INTENT_STYLE_TRANSFER));
        assertFalse(GboardAiWritingToolsRuntime.allowAutoFixRoute(false, Intent.INTENT_STYLE_TRANSFER));
        assertFalse(GboardAiWritingToolsRuntime.isAutoFixRoutingEnabled(null));
        assertFalse(GboardAiWritingToolsRuntime.isAutoFixRoutingEnabled("INTENT_AUTO_FIX"));
        assertFalse(GboardAiWritingToolsRuntime.allowAutoFixRoute(false, new Object()));
        assertTrue(GboardAiWritingToolsRuntime.allowAutoFixRoute(true, null));
    }
}
