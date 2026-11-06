package dev.jason.gboardpatches.extension.clipboardcontentlimit;

import android.content.Context;
import android.content.SharedPreferences;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

@RunWith(RobolectricTestRunner.class)
public final class GboardClipboardContentLimitSettingsTest {
    private Context context;
    private SharedPreferences preferences;

    @Before
    public void setUp() {
        context = RuntimeEnvironment.getApplication();
        preferences = GboardClipboardContentLimitSettings.preferences(context);
        preferences.edit().clear().commit();
    }

    @Test
    public void defaultsToOfficialLimitAndPersistsPositiveValues() {
        Assert.assertEquals(20_000,
                GboardClipboardContentLimitSettings.readMaxCharacters(preferences));

        GboardClipboardContentLimitSettings.ensureDefault(preferences);
        Assert.assertEquals(20_000, preferences.getInt(
                GboardClipboardContentLimitSettings.PREF_KEY_MAX_CHARACTERS, -1));

        Assert.assertTrue(
                GboardClipboardContentLimitSettings.writeMaxCharacters(context, 30_000));
        Assert.assertEquals(30_000,
                GboardClipboardContentLimitSettings.readMaxCharacters(preferences));
        Assert.assertFalse(
                GboardClipboardContentLimitSettings.writeMaxCharacters(context, 0));
    }

    @Test
    public void runtimeChangesOnlyTheExactLongFlag() {
        preferences.edit().putInt(
                GboardClipboardContentLimitSettings.PREF_KEY_MAX_CHARACTERS,
                40_000).commit();

        Assert.assertEquals(Long.valueOf(40_000L),
                GboardClipboardContentLimitRuntime.applyOverriddenFlagValue(
                        "text_clip_item_char_limit", Long.valueOf(20_000L), preferences));
        Assert.assertEquals(Long.valueOf(20_000L),
                GboardClipboardContentLimitRuntime.applyOverriddenFlagValue(
                        "another_flag", Long.valueOf(20_000L), preferences));
        Assert.assertEquals(Integer.valueOf(20_000),
                GboardClipboardContentLimitRuntime.applyOverriddenFlagValue(
                        "text_clip_item_char_limit", Integer.valueOf(20_000), preferences));
    }

    @Test
    public void invalidStoredValuesFallBackToOfficialLimit() {
        preferences.edit().putInt(
                GboardClipboardContentLimitSettings.PREF_KEY_MAX_CHARACTERS,
                -1).commit();
        Assert.assertEquals(20_000,
                GboardClipboardContentLimitSettings.readMaxCharacters(preferences));

        preferences.edit().putString(
                GboardClipboardContentLimitSettings.PREF_KEY_MAX_CHARACTERS,
                "not-a-number").commit();
        Assert.assertEquals(20_000,
                GboardClipboardContentLimitSettings.readMaxCharacters(preferences));
    }
}
