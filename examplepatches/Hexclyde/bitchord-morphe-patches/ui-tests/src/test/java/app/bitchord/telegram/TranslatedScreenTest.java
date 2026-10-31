package app.bitchord.telegram;

import static org.junit.Assert.*;

import android.view.*;
import android.widget.*;

import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.*;

import java.util.Locale;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 35, qualifiers = "w393dp-h852dp-mdpi")
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class TranslatedScreenTest {
    ActivityController<TelegramActivity> controller;
    TelegramActivity activity;
    Locale before;

    TelegramActivity open(String language) {
        before = Locale.getDefault();
        Locale.setDefault(Locale.forLanguageTag(language));
        if (android.os.Build.VERSION.SDK_INT >= 31)
            Shadows.shadowOf(RuntimeEnvironment.getApplication())
                    .grantPermissions("android.permission.HIDE_OVERLAY_WINDOWS");
        // BitChord's manifest has android:supportsRtl="true", which the test app lacks.
        RuntimeEnvironment.getApplication().getApplicationInfo().flags |=
                android.content.pm.ApplicationInfo.FLAG_SUPPORTS_RTL;
        TelegramBridge.instance = null;
        controller = Robolectric.buildActivity(TelegramActivity.class).setup();
        return activity = controller.get();
    }

    @After
    public void stop() {
        if (before != null) Locale.setDefault(before);
        if (activity == null) return;
        activity.handler.removeCallbacksAndMessages(null);
        activity.bridge.work.shutdownNow();
        controller.pause().stop().destroy();
    }

    static boolean shows(View view, String value) {
        if (view instanceof TextView && ((TextView) view).getText().toString().equals(value))
            return true;
        if (view instanceof ViewGroup)
            for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++)
                if (shows(((ViewGroup) view).getChildAt(i), value)) return true;
        return false;
    }

    @Test
    public void followsThePhoneLanguage() {
        open("es");
        String button = Strings.t("Save and continue");
        assertNotEquals("Spanish is there", "Save and continue", button);
        assertTrue(button, shows(activity.body, button));
        assertTrue(
                "Card titles too",
                shows(
                        activity.body,
                        Strings.t("Application credentials").toUpperCase(Locale.getDefault())));
        assertFalse("No English left on the button", shows(activity.body, "Save and continue"));
        assertEquals(View.LAYOUT_DIRECTION_LTR, activity.scroll.getLayoutDirection());
    }

    @Test
    public void arabicReadsRightToLeft() {
        open("ar");
        assertTrue(shows(activity.body, Strings.t("Save and continue")));
        assertEquals(View.LAYOUT_DIRECTION_RTL, activity.scroll.getLayoutDirection());
    }

    @Test
    public void placeholdersAreFilledInEveryLanguage() {
        for (String language :
                new String[] {
                    "es", "pt", "fr", "de", "ru", "tr", "ar", "ur", "hi", "bn", "zh", "ja", "ko",
                    "id"
                }) {
            Locale.setDefault(Locale.forLanguageTag(language));
            String text = Strings.f("Up to {0} files an hour", 120);
            assertTrue(language + ": " + text, text.contains("120") && !text.contains("{0}"));
            assertNotEquals(language, "Up to 120 files an hour", text);
        }
        Locale.setDefault(Locale.ENGLISH);
        assertEquals("Up to 120 files an hour", Strings.f("Up to {0} files an hour", 120));
        Locale.setDefault(Locale.forLanguageTag("in"));
        assertNotEquals("Older Android's code for Indonesian", "Cancel", Strings.t("Cancel"));
    }
}
