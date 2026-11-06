/*
 * Forked from https://github.com/SysAdminDoc/HushPinterest at debdac4 (GPL-3.0),
 * modified for HushTumblr (Tumblr), 2026.
 */
package app.hushtumblr.extension.tumblr.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.pm.ApplicationInfo;
import android.preference.Preference;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowLooper;

import java.util.EnumSet;

import app.hushtumblr.extension.shared.L10n;
import app.hushtumblr.extension.shared.SettingsContextRule;

/** Tumblr omits supportsRtl, unlike the extension's test manifest. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {26, 30, 36, 37})
@SuppressWarnings("deprecation")
public class SettingsRtlHostTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private ActivityController<Activity> controller;
    private ApplicationInfo hostInfo;
    private int originalFlags;
    private int hostFlags;

    @Before
    public void createTumblrLikeHost() {
        hostInfo = RuntimeEnvironment.getApplication().getApplicationInfo();
        originalFlags = hostInfo.flags;
        hostInfo.flags &= ~ApplicationInfo.FLAG_SUPPORTS_RTL;
        hostFlags = hostInfo.flags;
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        controller = Robolectric.buildActivity(Activity.class).setup();
        assertHostUnchanged();
    }

    @After
    public void restoreHost() {
        if (controller != null) controller.close();
        hostInfo.flags = originalFlags;
        PatchFamily.inBuildForTests = null;
        SettingsDialog.failNextMount = null;
        Settings.HIDE_POSTS_WITH_WORDS.resetToDefault();
        TextSettings.HIDDEN_WORDS.resetToDefault();
    }

    @Test
    @Config(qualifiers = "ar-rXB-ldrtl")
    public void arabicSettingsMirrorInsideAHostWithoutRtlSupport() {
        assertSettingsDirection(View.LAYOUT_DIRECTION_RTL);
    }

    @Test
    @Config(qualifiers = "en-rUS-ldltr")
    public void englishSettingsKeepTheirDirectionWithoutChangingTheHost() {
        assertSettingsDirection(View.LAYOUT_DIRECTION_LTR);
    }

    @Test
    @Config(qualifiers = "ar-rXB-ldrtl")
    public void aRestoredWordEditorKeepsItsScopedDirectionAndDraft() {
        SettingsDialog settings = SettingsL10nTest.show(controller.get());
        click(SettingsL10nTest.pageOf(settings).findPreference(HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW));
        EditText field = ShadowAlertDialog.getLatestAlertDialog().findViewById(android.R.id.edit);
        field.setText("draft \u0645\u0633\u0648\u062f\u0629");
        controller.recreate();
        ShadowLooper.idleMainLooper();
        AlertDialog restored = ShadowAlertDialog.getLatestAlertDialog();
        assertTrue(restored.isShowing());
        assertDialogDirection(restored, View.LAYOUT_DIRECTION_RTL);
        assertEquals("draft \u0645\u0633\u0648\u062f\u0629", ((EditText) restored.findViewById(android.R.id.edit)).getText().toString());
        assertHostUnchanged();
    }

    @Test
    @Config(qualifiers = "ar-rXB-ldrtl")
    public void theWordPreviewMirrorsAndARestoredEditorStartsItEmpty() {
        Settings.HIDE_POSTS_WITH_WORDS.save(true);
        TextSettings.HIDDEN_WORDS.save("cat");
        SettingsDialog settings = SettingsL10nTest.show(controller.get());
        click(SettingsL10nTest.pageOf(settings).findPreference(HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW));
        AlertDialog editor = ShadowAlertDialog.getLatestAlertDialog();
        String arabic = new String(new int[]{0x645, 0x633, 0x648, 0x62F, 0x629}, 0, 5);
        EditText post = SettingsDialogTest.previewInputs(editor).get(0);
        post.setText(arabic + " cat");
        assertDialogDirection(editor, View.LAYOUT_DIRECTION_RTL);
        TextView result = SettingsDialogTest.previewResult(editor);
        ViewGroup section = (ViewGroup) result.getParent();
        assertEquals(View.LAYOUT_DIRECTION_RTL, section.getLayoutDirection());
        assertEquals(View.LAYOUT_DIRECTION_RTL, result.getLayoutDirection());
        assertEquals(View.TEXT_ALIGNMENT_VIEW_START, result.getTextAlignment());
        assertEquals(L10n.f("The word filter would hide this post for \u201c%1$s\u201d in %2$s.", L10n.isolate("cat"),
                L10n.t("Post text")), result.getText().toString());
        assertEquals(View.LAYOUT_DIRECTION_RTL, post.getLayoutDirection());
        Button clear = section.findViewWithTag(WordPreviewSection.CLEAR_TAG);
        assertTrue("Clear isn't on the start side", clear.getLeft() > section.getWidth() / 2);

        controller.recreate();
        ShadowLooper.idleMainLooper();
        AlertDialog restored = ShadowAlertDialog.getLatestAlertDialog();
        assertDialogDirection(restored, View.LAYOUT_DIRECTION_RTL);
        for (EditText input : SettingsDialogTest.previewInputs(restored)) {
            assertEquals("", input.getText().toString());
            assertEquals(View.LAYOUT_DIRECTION_RTL, input.getLayoutDirection());
        }
        assertEquals(L10n.t("Type part of a post above to see what the word filter does with it."),
                SettingsDialogTest.previewResult(restored).getText().toString());
        restored.dismiss();
    }

    @Test
    @Config(qualifiers = "ar-rXB-ldrtl")
    public void theChildMountRecoveryAlsoUsesTheSettingsDirection() {
        SettingsDialog.failNextMount = new IllegalStateException("injected");
        SettingsDialog settings = SettingsL10nTest.show(controller.get());
        layout(settings.getView());
        View recovery = settings.getView().findViewWithTag(SettingsDialog.MOUNT_ERROR);
        assertNotNull(recovery);
        assertEquals(View.LAYOUT_DIRECTION_RTL, recovery.getLayoutDirection());
        assertEquals(View.LAYOUT_DIRECTION_RTL,
                recovery.findViewWithTag(SettingsDialog.MOUNT_RETRY).getLayoutDirection());
        assertHostUnchanged();
    }

    private void assertSettingsDirection(int direction) {
        assertEquals(direction, controller.get().getResources().getConfiguration().getLayoutDirection());
        SettingsDialog settings = SettingsL10nTest.show(controller.get());
        layout(settings.getView());
        assertEquals(direction, settings.getView().getLayoutDirection());
        ImageButton back = SettingsL10nTest.backOf(settings);
        ViewGroup bar = (ViewGroup) back.getParent();
        assertEquals(direction, back.getLayoutDirection());
        assertEquals(direction, back.getDrawable().getLayoutDirection());
        assertEquals(direction == View.LAYOUT_DIRECTION_RTL, back.getLeft() > bar.getWidth() / 2);

        HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(settings);
        ListView list = page.getView().findViewById(android.R.id.list);
        assertEquals(direction, list.getLayoutDirection());
        assertEquals(controller.get().getResources().getConfiguration().getLocales(),
                list.getResources().getConfiguration().getLocales());
        assertChevrons(page, list, direction);

        click(page.findPreference(HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW));
        AlertDialog words = ShadowAlertDialog.getLatestAlertDialog();
        assertDialogDirection(words, direction);
        assertEquals(direction, words.findViewById(android.R.id.edit).getLayoutDirection());
        words.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();

        click(page.findPreference(HushTumblrPreferenceFragment.TAB_ORDER_ROW));
        AlertDialog tabs = ShadowAlertDialog.getLatestAlertDialog();
        assertDialogDirection(tabs, direction);
        assertEquals(direction, tabs.getListView().getLayoutDirection());
        assertNotNull(tabs.getListView().getChildAt(0));
        assertEquals(direction, tabs.getListView().getChildAt(0).getLayoutDirection());
        tabs.dismiss();
        settings.dismiss();
        assertHostUnchanged();
    }

    private void assertChevrons(HushTumblrPreferenceFragment page, ListView list, int direction) {
        ListAdapter navigation = list.getAdapter();
        list.setAdapter(page.getPreferenceScreen().getRootAdapter());
        list.measure(View.MeasureSpec.makeMeasureSpec(1080, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(40000, View.MeasureSpec.EXACTLY));
        list.layout(0, 0, 1080, 40000);
        int found = 0;
        for (int i = 0; i < list.getChildCount(); i++) {
            View row = list.getChildAt(i);
            ImageView chevron = row.findViewWithTag(ScreenColors.CHEVRON);
            if (chevron == null) continue;
            found++;
            assertEquals(direction, row.getLayoutDirection());
            assertEquals(direction, chevron.getDrawable().getLayoutDirection());
            int left = 0;
            for (View part = chevron; part != row; part = (View) part.getParent()) left += part.getLeft();
            assertEquals(direction == View.LAYOUT_DIRECTION_RTL, left < row.getWidth() / 2);
        }
        assertTrue("no action rows were laid out", found > 0);
        list.setAdapter(navigation);
    }

    private void assertDialogDirection(AlertDialog dialog, int direction) {
        assertTrue(dialog.isShowing());
        View decor = dialog.getWindow().getDecorView();
        layout(decor);
        assertEquals(direction, decor.getLayoutDirection());
        assertEquals(direction, dialog.getButton(AlertDialog.BUTTON_NEGATIVE).getLayoutDirection());
        assertHostUnchanged();
    }

    private void assertHostUnchanged() {
        assertEquals(hostFlags, hostInfo.flags);
        assertEquals(hostFlags, controller.get().getApplicationInfo().flags);
        assertFalse((hostInfo.flags & ApplicationInfo.FLAG_SUPPORTS_RTL) != 0);
        View ordinaryHostView = new View(controller.get());
        ordinaryHostView.setLayoutDirection(View.LAYOUT_DIRECTION_RTL);
        assertEquals("the host's compatibility behavior changed", View.LAYOUT_DIRECTION_LTR,
                ordinaryHostView.getLayoutDirection());
    }

    private static void click(Preference row) {
        assertNotNull(row);
        row.getOnPreferenceClickListener().onPreferenceClick(row);
        ShadowLooper.idleMainLooper();
    }

    private static void layout(View view) {
        view.measure(View.MeasureSpec.makeMeasureSpec(1080, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(2160, View.MeasureSpec.EXACTLY));
        view.layout(0, 0, 1080, 2160);
        ShadowLooper.idleMainLooper();
    }
}
