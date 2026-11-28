package app.yydarlinker.aicaptions.settings;

import app.yydarlinker.aicaptions.diagnostics.CaptionDiagnostics;
import app.yydarlinker.aicaptions.host.CaptionActions;
import app.yydarlinker.aicaptions.overlay.SubtitleStyleMetrics;

import static android.R.id.button1;
import static android.R.id.button2;
import static android.R.id.button3;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.RectF;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Looper;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.preference.Preference;
import android.preference.PreferenceFragment;
import android.preference.PreferenceScreen;
import android.view.View;
import android.widget.Button;
import android.widget.CheckedTextView;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.SeekBar;

import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.settings.AppLanguage;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.Setting;

import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowDialog;

@SuppressWarnings("deprecation")
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, shadows = {CaptionSettingsFlowTest.Models.class, CaptionSettingsFlowTest.Key.class})
public class CaptionSettingsFlowTest {
    private static final String PREFIX = "ai_caption_";
    private static final String STORE = "ai_caption_translator";
    private static final String INDEX = "caption_api_profiles";
    private Activity activity;
    private PreferenceFragment fragment;

    public static final class Settings extends PreferenceFragment {}

    @Implements(CaptionActions.class)
    public static class Models {
        @Implementation
        protected static List<String> models(String endpoint) {
            return Arrays.asList("fixture-model-1", "fixture-model-2");
        }
    }

    @Implements(SecureApiKey.class)
    public static class Key {
        @Implementation
        protected static String load(Context context) {
            return "settings-test-key";
        }
    }

    @Before
    public void openPage() {
        activity = Robolectric.buildActivity(Activity.class).setup().get();
        inflate();
    }

    @After
    public void closePage() {
        Setting.preferences.preferences = null;
        BaseSettings.MORPHE_LANGUAGE.save(AppLanguage.DEFAULT);
        ResourceUtils.activity = null;
        activity.finish();
    }

    private void inflate() {
        fragment = new Settings();
        activity.getFragmentManager().beginTransaction()
                .replace(android.R.id.content, fragment).commitNow();
        int resource = activity.getResources().getIdentifier(
                "caption_settings_fixture", "xml", activity.getPackageName());
        assertNotEquals(0, resource);
        fragment.addPreferencesFromResource(resource);
    }

    private Preference row(String key) {
        Preference preference = fragment.findPreference(PREFIX + key);
        assertNotNull(key, preference);
        return preference;
    }

    private MorpheDialog open(String key) {
        ((CaptionSettingsPreference) row(key)).onClick();
        return latest();
    }

    private static MorpheDialog latest() {
        MorpheDialog dialog = (MorpheDialog) ShadowDialog.getLatestDialog();
        assertNotNull(dialog);
        assertTrue(dialog.isShowing());
        return dialog;
    }

    private static void press(MorpheDialog dialog, int button) {
        assertTrue(dialog.button(button).performClick());
        shadowOf(Looper.getMainLooper()).idle();
    }

    private static void enter(MorpheDialog dialog, String value) {
        DialogTestViews.find(dialog, EditText.class).setText(value);
        press(dialog, button1);
    }

    private static void select(MorpheDialog dialog, int index) {
        ListView list = DialogTestViews.find(dialog, ListView.class);
        assertTrue(list.performItemClick(null, index, list.getItemIdAtPosition(index)));
        shadowOf(Looper.getMainLooper()).idle();
    }

    private SharedPreferences legacy() {
        return activity.getSharedPreferences(STORE, 0);
    }

    @Test
    public void settingsXmlInflatesEveryProductionRow() {
        PreferenceScreen screen = fragment.getPreferenceScreen();
        assertEquals("morphe_vot_screen__ai_captions", screen.getKey());
        assertNull(fragment.findPreference(PREFIX + "position"));
        for (String key : Arrays.asList("enabled", "flyout_menu", "shorts_flyout_menu"))
            assertTrue(row(key) instanceof CaptionSettingsSwitch);
        for (String key : Arrays.asList("profiles", "base_url", "api_key", "model", "test_api",
                "delete_key", "text_size", "background_opacity", "reset_position", "clear_cache",
                "diagnostics")) {
            assertTrue(row(key) instanceof CaptionSettingsPreference);
            assertFalse(row(key).getTitle().toString().isEmpty());
            assertFalse(row(key).isPersistent());
        }
    }

    @Test
    public void createSelectAndReopenProfileWithItsOwnEndpointAndModel() {
        press(open("profiles"), button3);
        enter(latest(), "Personal");
        String id = activity.getSharedPreferences(INDEX, 0).getString("active", "");
        assertEquals(id, UUID.fromString(id).toString());
        enter(open("base_url"), "https://personal.invalid/v1");
        enter(open("model"), "custom-model");
        select(open("profiles"), 0);
        assertEquals(AiCaptionConfig.DEFAULT_BASE_URL, AiCaptionConfig.baseUrl(activity));
        select(open("profiles"), 1);
        inflate();
        assertEquals("https://personal.invalid/v1",
                DialogTestViews.find(open("base_url"), EditText.class).getText().toString());
        assertEquals("custom-model", AiCaptionConfig.model(activity));
        assertEquals(id, ApiProfiles.active(activity));
    }

    @Test
    public void renameAndSelectDuplicateNamesById() {
        String first = ApiProfiles.create(activity, "Same", "https://first.invalid");
        String second = ApiProfiles.create(activity, "Other", "https://second.invalid");
        select(open("profiles"), 2);
        assertTrue(profileRow(open("profiles"), 2).getChildAt(1).performClick());
        enter(latest(), "Same");
        assertEquals(second, ApiProfiles.active(activity));
        assertEquals("Same", ApiProfiles.list(activity).get(second));
        select(open("profiles"), 1);
        assertEquals(first, ApiProfiles.active(activity));
        assertEquals("https://first.invalid", AiCaptionConfig.baseUrl(activity));
    }

    @Test
    public void deletingActiveProfileSelectsRemainingProfileAndPreservesGlobals() {
        String extra = ApiProfiles.create(activity, "Extra", "https://extra.invalid");
        ApiProfiles.select(activity, extra);
        AiCaptionConfig.saveBackgroundOpacity(activity, 88);
        assertTrue(profileRow(open("profiles"), 1).getChildAt(2).performClick());
        MorpheDialog confirmation = latest();
        assertTrue(ApiProfiles.list(activity).containsKey(extra));
        press(confirmation, button1);
        assertEquals("default", ApiProfiles.active(activity));
        assertFalse(ApiProfiles.list(activity).containsKey(extra));
        assertEquals(88, AiCaptionConfig.displayStyle(activity).backgroundOpacity);
    }

    @Test
    public void lastProfileOffersRenameOnly() {
        MorpheDialog dialog = open("profiles");
        assertEquals(1, DialogTestViews.find(dialog, ListView.class).getAdapter().getCount());
        LinearLayout profile = profileRow(dialog, 0);
        assertEquals(2, profile.getChildCount());
        assertTrue(((CheckedTextView) profile.getChildAt(0)).isChecked());
        assertTrue(profile.getChildAt(1) instanceof ImageButton);
        assertEquals(CaptionStrings.get(activity, "profile_rename"),
                profile.getChildAt(1).getContentDescription());
        assertEquals(new LinkedHashSet<>(Arrays.asList("default")), ApiProfiles.list(activity).keySet());
    }

    private static LinearLayout profileRow(MorpheDialog dialog, int index) {
        ListView list = DialogTestViews.find(dialog, ListView.class);
        return (LinearLayout) list.getAdapter().getView(index, null, list);
    }

    @Test
    public void inlineActionsUseTheBoundUuidAndRecheckExistenceOnConfirmation() {
        String other = ApiProfiles.create(activity, "Duplicate", "https://other.invalid");
        String target = ApiProfiles.create(activity, "Duplicate", "https://target.invalid");
        LinearLayout row = profileRow(open("profiles"), 2);
        CheckedTextView label = (CheckedTextView) row.getChildAt(0);
        assertFalse(label.isChecked());
        int mark = dp(24);
        layout(row, dp(280), dp(200));
        assertEquals(mark, label.getCompoundDrawablesRelative()[0].getBounds().width());
        assertEquals(mark, label.getCompoundDrawablePadding());
        for (int i = 1; i <= 2; i++) {
            ImageButton icon = (ImageButton) row.getChildAt(i);
            assertEquals(dp(40), icon.getLayoutParams().width);
            assertEquals(dp(40), icon.getLayoutParams().height);
            assertEquals(dp(40), icon.getWidth());
            assertEquals(dp(40), icon.getHeight());
            assertEquals(dp(8), icon.getPaddingLeft());
            assertEquals(dp(8), icon.getPaddingRight());
            assertEquals(dp(8), icon.getPaddingTop());
            assertEquals(dp(8), icon.getPaddingBottom());
            assertEquals(android.widget.ImageView.ScaleType.FIT_CENTER, icon.getScaleType());
            RectF painted = new RectF(icon.getDrawable().getBounds());
            icon.getImageMatrix().mapRect(painted);
            assertEquals(mark, painted.width(), 1);
            assertEquals(mark, painted.height(), 1);
            assertFalse(icon.getContentDescription().toString().isBlank());
        }
        assertTrue(label.performClick());
        assertEquals(target, ApiProfiles.active(activity));
        assertTrue(profileRow(open("profiles"), 2).getChildAt(1).performClick());
        MorpheDialog rename = latest();
        ApiProfiles.delete(activity, target);
        enter(rename, "Stale");
        assertNotNull(DialogTestViews.find(rename, EditText.class).getError());
        assertEquals("Duplicate", ApiProfiles.list(activity).get(other));
        assertFalse(ApiProfiles.list(activity).containsKey(target));
    }

    @Test
    public void deletingAnInactiveRowKeepsTheCurrentProfile() {
        String extra = ApiProfiles.create(activity, "Extra", "https://extra.invalid");
        assertTrue(profileRow(open("profiles"), 1).getChildAt(2).performClick());
        press(latest(), button1);
        assertEquals("default", ApiProfiles.active(activity));
        assertFalse(ApiProfiles.list(activity).containsKey(extra));
    }

    @Test
    @Config(sdk = 35, qualifiers = "w720dp-h280dp-land")
    @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void cardUsesTheShortSideAndLetsMeasuredButtonsStackWithoutWrapping() {
        MorpheDialog dialog = new MorpheDialog(activity, "Heading").setMessage("Body")
                .setNegativeButton("Another lengthy secondary action for this small width", null)
                .setPositiveButton("Very long confirmation action for this small dialog width", null);
        dialog.show();
        var bounds = activity.getSystemService(WindowManager.class).getCurrentWindowMetrics().getBounds();
        int width = (int) (.9f * Math.min(bounds.width(), bounds.height()));
        assertEquals(width, dialog.getWindow().getAttributes().width);
        assertEquals(Gravity.CENTER, dialog.getWindow().getAttributes().gravity);
        assertEquals(ViewGroup.LayoutParams.WRAP_CONTENT, dialog.getWindow().getAttributes().height);
        LinearLayout card = (LinearLayout) DialogTestViews.find(dialog, ScrollView.class).getParent();
        layout(card, width, dp(280));
        assertEquals(dp(24), card.getPaddingLeft());
        assertEquals(dp(16), card.getPaddingTop());
        assertEquals(dp(24), card.getPaddingRight());
        assertEquals(dp(24), card.getPaddingBottom());
        assertEquals(dp(28), ((GradientDrawable) card.getBackground()).getCornerRadius(), 0);
        TextView heading = (TextView) card.getChildAt(0);
        assertEquals(Gravity.CENTER, heading.getGravity());
        assertEquals(android.graphics.Typeface.DEFAULT_BOLD, heading.getTypeface());
        LinearLayout footer = (LinearLayout) card.getChildAt(2);
        assertEquals(LinearLayout.VERTICAL, footer.getOrientation());
        assertSame(dialog.button(button1), footer.getChildAt(0));
        assertSame(dialog.button(button2), footer.getChildAt(2));
        assertEquals(dp(8), footer.getChildAt(2).getTop() - footer.getChildAt(0).getBottom());
        assertEquals(footer.getWidth(), footer.getChildAt(0).getWidth());
        assertEquals(footer.getWidth(), footer.getChildAt(2).getWidth());
        assertPill(dialog.button(button1));
        assertPill(dialog.button(button2));
        dialog.dismiss();

        dialog = open("profiles");
        assertPill(dialog.button(button1));
        assertPill(dialog.button(button3));
        assertHorizontalFooter(dialog, dialog.button(button3), dialog.button(button1));
        assertEquals(CaptionStrings.get(activity, "profile_add"), dialog.button(button3).getText());
        assertEquals(CaptionStrings.get(activity, "close"), dialog.button(button1).getText());
        assertEquals(0xfff2f2f2, fill(dialog.button(button3)));
        assertEquals(Color.BLACK, fill(dialog.button(button1)));
        dialog.dismiss();
    }

    @Test
    public void profileCreationPrefillsAndSavesTheNextFreeLocalizedName() {
        ResourceUtils.activity = activity;
        Setting.preferences.preferences = activity.getSharedPreferences("host_settings", 0);
        BaseSettings.MORPHE_LANGUAGE.save(AppLanguage.HANS);
        String format = CaptionStrings.get(activity, "profile_default_name");
        String two = String.format(Locale.SIMPLIFIED_CHINESE, format, 2);
        String three = String.format(Locale.SIMPLIFIED_CHINESE, format, 3);
        assertEquals("Profile %d", CaptionTextResolver.string(activity, Locale.ENGLISH, "profile_default_name"));
        ApiProfiles.rename(activity, "default", two);
        press(open("profiles"), button3);
        MorpheDialog create = latest();
        EditText input = DialogTestViews.find(create, EditText.class);
        assertEquals(three, input.getText().toString());
        assertEquals(input.length(), input.getSelectionEnd());
        press(create, button1);
        assertFalse(create.isShowing());
        assertEquals(three, ApiProfiles.list(activity).get(ApiProfiles.active(activity)));
    }

    @Test
    public void confirmationUsesPhysicalSpacingAndPrimaryOnTheRight() {
        MorpheDialog dialog = open("reset_position");
        assertHorizontalFooter(dialog, dialog.button(button2), dialog.button(button1));
        assertEquals(CaptionStrings.get(activity, "cancel"), dialog.button(button2).getText());
        assertEquals(Color.BLACK, fill(dialog.button(button1)));
    }

    private static void layout(View view, int width, int maxHeight) {
        view.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(maxHeight, View.MeasureSpec.AT_MOST));
        view.layout(0, 0, view.getMeasuredWidth(), view.getMeasuredHeight());
    }

    private void assertHorizontalFooter(MorpheDialog dialog, Button... ordered) {
        LinearLayout footer = (LinearLayout) ordered[0].getParent();
        LinearLayout card = (LinearLayout) footer.getParent();
        layout(card, dialog.getWindow().getAttributes().width, dp(480));
        assertEquals(LinearLayout.HORIZONTAL, footer.getOrientation());
        assertEquals(0, ordered[0].getLeft());
        assertEquals(footer.getWidth(), ordered[ordered.length - 1].getRight());
        for (int i = 0; i < ordered.length; i++) {
            assertSame(ordered[i], footer.getChildAt(i));
            if (i > 0) assertTrue(ordered[i].getLeft() - ordered[i - 1].getRight() >= dp(8));
        }
    }

    private static int fill(Button button) {
        return ((GradientDrawable) ((RippleDrawable) button.getBackground()).getDrawable(0))
                .getColor().getDefaultColor();
    }

    private int dp(int value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
    }

    private void assertPill(Button action) {
        assertEquals(dp(36), action.getLayoutParams().height);
        assertEquals(dp(8), action.getPaddingLeft());
        assertEquals(0, action.getPaddingBottom());
        assertEquals(1, action.getMaxLines());
        assertEquals(TextUtils.TruncateAt.END, action.getEllipsize());
        assertFalse(action.getPaint().isFakeBoldText());
        assertTrue(action.getTypeface() == null || !action.getTypeface().isBold());
    }

    @Test
    public void simplifiedChineseActionsKeepTheirDetailedSettingsTitles() {
        BaseSettings.MORPHE_LANGUAGE.save(AppLanguage.HANS);
        assertEquals("清除本方案的 API Key", CaptionStrings.get(activity, "profile_clear_key"));
        assertEquals("恢复字幕默认位置", CaptionStrings.get(activity, "reset_position"));
        assertEquals("清除密钥", CaptionStrings.get(activity, "clear_key_action"));
        assertEquals("恢复默认", CaptionStrings.get(activity, "reset_position_action"));
        assertEquals("删除", CaptionStrings.get(activity, "delete"));
        assertEquals("导出到文件", CaptionStrings.get(activity, "save_diagnostics"));
        assertEquals("清除", CaptionStrings.get(activity, "clear_diagnostics_action"));
    }

    @Test
    public void cancelledEndpointAndInvalidModelLeavePreviousSettings() {
        Map<String, ?> before = legacy().getAll();
        MorpheDialog endpoint = open("base_url");
        DialogTestViews.find(endpoint, EditText.class).setText("https://discard.invalid/v1");
        press(endpoint, button2);
        MorpheDialog model = open("model");
        enter(model, " ");
        assertTrue(model.isShowing());
        assertNotNull(DialogTestViews.find(model, EditText.class).getError());
        assertEquals(before, legacy().getAll());
    }

    @Test
    public void pickedProviderModelIsSavedOnlyAfterConfirmation() throws Exception {
        MorpheDialog editor = open("model");
        press(editor, button3);
        MorpheDialog choices = editor;
        long end = System.nanoTime() + TimeUnit.SECONDS.toNanos(5);
        while (choices == editor && System.nanoTime() < end) {
            Thread.sleep(10);
            shadowOf(Looper.getMainLooper()).idle();
            choices = (MorpheDialog) ShadowDialog.getLatestDialog();
        }
        assertNotSame(editor, choices);
        select(choices, 1);
        assertEquals(AiCaptionConfig.DEFAULT_MODEL, AiCaptionConfig.model(activity));
        press(editor, button1);
        assertEquals("fixture-model-2", AiCaptionConfig.model(activity));
    }

    @Test
    public void staleEditorCannotWriteEvenAfterSwitchingBack() {
        String extra = ApiProfiles.create(activity, "Other", "https://other.invalid");
        MorpheDialog editor = open("base_url");
        ApiProfiles.select(activity, extra);
        ApiProfiles.select(activity, "default");
        enter(editor, "https://stale.invalid");
        assertTrue(editor.isShowing());
        assertNotNull(DialogTestViews.find(editor, EditText.class).getError());
        assertEquals(AiCaptionConfig.DEFAULT_BASE_URL, AiCaptionConfig.baseUrl(activity));
        assertEquals("https://other.invalid", ApiProfiles.values(activity, extra).getString("base_url", ""));
    }

    @Test
    public void readableIndexAllowsExplicitRecoveryOfBadActiveId() {
        String id = ApiProfiles.create(activity, "Known", "https://known.invalid");
        activity.getSharedPreferences(INDEX, 0).edit().putString("active", "unknown").commit();
        select(open("profiles"), 1);
        assertEquals(id, ApiProfiles.active(activity));
    }

    @Test
    public void sizeDialogUsesMigratedTierAndStoresBoundedSelection() {
        legacy().edit().putInt("caption_glyph_height_ratio_bps", 10000).commit();
        MorpheDialog size = open("text_size");
        assertEquals(SubtitleStyleMetrics.COUNT - 1, DialogTestViews.find(size, ListView.class).getCheckedItemPosition());
        select(size, 0);
        assertEquals(0, legacy().getInt("caption_size_tier", -1));
        assertEquals(10000, legacy().getInt("caption_glyph_height_ratio_bps", 0));
    }

    @Test
    public void opacityClampsLegacyValueAndWritesOnlyOnSave() {
        legacy().edit().putInt("background_opacity", 300).commit();
        MorpheDialog opacity = open("background_opacity");
        SeekBar slider = DialogTestViews.find(opacity, SeekBar.class);
        assertEquals(100, slider.getProgress());
        LinearLayout range = (LinearLayout) slider.getParent();
        assertEquals("0%", ((TextView) range.getChildAt(0)).getText());
        assertEquals("100%", ((TextView) range.getChildAt(2)).getText());
        press(opacity, button3);
        assertTrue(opacity.isShowing());
        assertEquals(70, slider.getProgress());
        assertEquals("70%", ((TextView) ((LinearLayout) range.getParent()).getChildAt(0)).getText());
        slider.setProgress(-5);
        assertEquals(300, legacy().getInt("background_opacity", 0));
        press(opacity, button1);
        assertEquals(0, legacy().getInt("background_opacity", -1));
    }

    @Test
    public void addressResetChangesOnlyTheOpenEditorUntilSaved() {
        String custom = "https://custom.invalid/v1";
        AiCaptionConfig.saveBaseUrl(activity, custom);
        MorpheDialog dialog = open("base_url");
        EditText input = DialogTestViews.find(dialog, EditText.class);
        assertTrue(input.getClipToOutline());
        assertEquals(dp(10), ((GradientDrawable) input.getBackground()).getCornerRadius(), 0);
        assertEquals(0xfff7f7f7, ((GradientDrawable) input.getBackground()).getColor().getDefaultColor());
        press(dialog, button3);
        assertTrue(dialog.isShowing());
        assertEquals(custom, AiCaptionConfig.baseUrl(activity));
        assertEquals(AiCaptionConfig.DEFAULT_BASE_URL, input.getText().toString());
        press(dialog, button1);
        assertEquals(AiCaptionConfig.DEFAULT_BASE_URL, AiCaptionConfig.baseUrl(activity));
    }

    @Test
    @Config(sdk = 35, qualifiers = "w360dp-h260dp")
    public void diagnosticsKeepFourReachableActionsOutsideTheLongLogInBothThemes() throws Exception {
        CaptionDiagnostics.clear(activity);
        for (int i = 0; i < 64; i++) CaptionDiagnostics.mark(activity, "layout", "test line " + i);
        try {
            for (boolean dark : new boolean[] {false, true}) {
                activity.setTheme(dark ? android.R.style.Theme_Material : android.R.style.Theme_Material_Light);
                var previous = ShadowDialog.getLatestDialog();
                ((CaptionSettingsPreference) row("diagnostics")).onClick();
                long end = System.nanoTime() + TimeUnit.SECONDS.toNanos(5);
                while (ShadowDialog.getLatestDialog() == previous && System.nanoTime() < end) {
                    Thread.sleep(10);
                    shadowOf(Looper.getMainLooper()).idle();
                }
                assertNotSame(previous, ShadowDialog.getLatestDialog());
                MorpheDialog dialog = latest();
                ScrollView log = DialogTestViews.find(dialog, ScrollView.class);
                LinearLayout card = (LinearLayout) log.getParent();
                float density = activity.getResources().getDisplayMetrics().density;
                int width = Math.round(320 * density);
                int height = Math.round(234 * density);
                card.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                        View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.AT_MOST));
                card.layout(0, 0, card.getMeasuredWidth(), card.getMeasuredHeight());
                int fill = ((GradientDrawable) card.getBackground()).getColor().getDefaultColor();
                assertEquals(dark ? 0xff0f0f0f : Color.WHITE, fill);
                assertTrue(log.getHeight() > 0);
                assertTrue(log.getHeight() <= Math.round(260 * density * .52f));
                assertTrue(log.getChildAt(0).getHeight() > log.getHeight());
                assertTrue(log.getClipToOutline());
                GradientDrawable logBackground = (GradientDrawable) log.getBackground();
                assertEquals(dp(10), logBackground.getCornerRadius(), 0);
                assertEquals(dark ? 0xff1a1a1a : 0xfff7f7f7, logBackground.getColor().getDefaultColor());
                LinearLayout entries = (LinearLayout) log.getChildAt(0);
                assertTrue(entries.getChildCount() >= 64);
                TextView entry = (TextView) entries.getChildAt(0);
                assertTrue(entry.isTextSelectable());
                assertEquals(12f * activity.getResources().getDisplayMetrics().scaledDensity,
                        entry.getTextSize(), 1);
                LinearLayout export = (LinearLayout) card.getChildAt(2);
                assertEquals(1, export.getChildCount());
                Button exportButton = (Button) export.getChildAt(0);
                assertEquals(export.getWidth(), exportButton.getWidth());
                assertEquals(dp(16), export.getTop() - log.getBottom());
                assertEquals(CaptionStrings.get(activity, "save_diagnostics"), exportButton.getText());
                assertPill(exportButton);
                LinearLayout footer = (LinearLayout) card.getChildAt(3);
                assertEquals(dp(12), footer.getTop() - export.getBottom());
                assertTrue(footer.getBottom() <= card.getHeight());
                assertHorizontalFooter(dialog, dialog.button(button3), dialog.button(button2), dialog.button(button1));
                String[] labels = {"clear_diagnostics_action", "close", "copy"};
                for (int i = 0; i < labels.length; i++) {
                    Button action = (Button) footer.getChildAt(i);
                    assertEquals(CaptionStrings.get(activity, labels[i]), action.getText());
                    assertTrue(action.isEnabled() && action.isClickable());
                    assertPill(action);
                }
                assertEquals(dark ? Color.WHITE : Color.BLACK, fill(dialog.button(button1)));
                press(dialog, button1);
                assertTrue(dialog.isShowing());
                var clipboard = activity.getSystemService(ClipboardManager.class);
                assertTrue(clipboard.getPrimaryClip().getItemAt(0).getText().toString().contains("test line 63"));
                press(dialog, button2);
                assertFalse(dialog.isShowing());
            }
        } finally {
            CaptionDiagnostics.clear(activity);
        }
    }

    @Test
    public void positionResetRestoresAllSurfacesAndKeepsOtherStyle() {
        AiCaptionConfig.saveCaptionPosition(activity, false, -1f);
        AiCaptionConfig.saveCaptionPosition(activity, true, 5f);
        AiCaptionConfig.saveShortsPosition(activity, Float.NaN);
        AiCaptionConfig.saveBackgroundOpacity(activity, 42);
        assertEquals(0f, AiCaptionConfig.captionPositionY(activity, false), 0f);
        assertEquals(1f, AiCaptionConfig.captionPositionY(activity, true), 0f);
        assertEquals(.5f, AiCaptionConfig.shortsPosition(activity), 0f);
        press(open("reset_position"), button1);
        assertEquals(.82f, AiCaptionConfig.captionPositionY(activity, false), 0f);
        assertEquals(.80f, AiCaptionConfig.captionPositionY(activity, true), 0f);
        assertEquals(.72f, AiCaptionConfig.shortsPosition(activity), 0f);
        assertEquals(42, AiCaptionConfig.displayStyle(activity).backgroundOpacity);
    }

    @Test
    public void switchRowsKeepSeparateLegacyValuesAcrossReinflation() {
        CaptionSettingsSwitch video = (CaptionSettingsSwitch) row("flyout_menu");
        CaptionSettingsSwitch shorts = (CaptionSettingsSwitch) row("shorts_flyout_menu");
        video.getOnPreferenceChangeListener().onPreferenceChange(video, false);
        assertFalse(legacy().getBoolean("flyout_menu", true));
        assertTrue(AiCaptionConfig.shortsFlyoutMenuEnabled(activity));
        shorts.getOnPreferenceChangeListener().onPreferenceChange(shorts, false);
        video.getOnPreferenceChangeListener().onPreferenceChange(video, true);
        inflate();
        assertTrue(AiCaptionConfig.flyoutMenuEnabled(activity));
        assertFalse(AiCaptionConfig.shortsFlyoutMenuEnabled(activity));
        assertFalse(AiCaptionConfig.enabled(activity));
    }

    @Test
    public void localeOverrideRefreshesSettingsAndDialogLabels() {
        ResourceUtils.activity = activity;
        Setting.preferences.preferences = activity.getSharedPreferences("host_settings", 0);
        inflate();
        BaseSettings.MORPHE_LANGUAGE.save(AppLanguage.JA);
        shadowOf(Looper.getMainLooper()).idle();
        MorpheDialog dialog = open("base_url");
        assertEquals(CaptionTextResolver.string(activity, Locale.JAPANESE, "profile_save"),
                dialog.button(button1).getText().toString());
        assertEquals(CaptionTextResolver.string(activity, Locale.JAPANESE, "api_address"),
                row("base_url").getTitle().toString());
        assertFalse(legacy().contains("base_url"));
    }
}
