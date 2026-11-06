/* SPDX-License-Identifier: GPL-3.0-only */
package app.hushtumblr.extension.tumblr.settings;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.Bundle;
import android.preference.Preference;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;
import org.robolectric.util.ReflectionHelpers;

import app.hushtumblr.extension.shared.SettingsContextRule;

import java.util.concurrent.TimeUnit;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {26, 36}, qualifiers = "en-rUS-w390dp-h844dp")
public class SettingsFeedbackTest {
    static String message(Preference row) {
        return ReflectionHelpers.getField(ReflectionHelpers.getField(row, "feedback"), "message");
    }
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private ActivityController<Activity> controller;
    private LinearLayout root;

    @Before public void open() {
        controller = Robolectric.buildActivity(Activity.class).setup().visible();
        root = new LinearLayout(HushTumblrPreferenceFragment.themed(controller.get()));
        root.setOrientation(LinearLayout.VERTICAL);
        controller.get().setContentView(root);
    }

    @After public void close() { controller.pause().stop().destroy(); }

    private LinearLayout region() {
        LinearLayout region = new LinearLayout(root.getContext());
        region.setOrientation(LinearLayout.VERTICAL);
        root.addView(region, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return region;
    }

    @Test public void aRebindKeepsTheResultWithoutPublishingItAgain() {
        SettingsFeedback feedback = new SettingsFeedback();
        LinearLayout first = region();
        feedback.bind(first, () -> true);
        feedback.show("A retained recovery instruction.");
        int[] changes = {0};
        TextView text = first.findViewWithTag(SettingsFeedback.MESSAGE_TAG);
        watch(text, changes);
        ShadowLooper.idleMainLooper(100, TimeUnit.MILLISECONDS);
        assertEquals(1, changes[0]);
        assertEquals(View.ACCESSIBILITY_LIVE_REGION_POLITE, text.getAccessibilityLiveRegion());
        LinearLayout replacement = region();
        feedback.bind(replacement, () -> true);
        TextView restored = replacement.findViewWithTag(SettingsFeedback.MESSAGE_TAG);
        int[] repeated = {0};
        watch(restored, repeated);
        ShadowLooper.idleMainLooper(100, TimeUnit.MILLISECONDS);
        assertEquals("A retained recovery instruction.", restored.getText().toString());
        assertEquals(0, repeated[0]);
        assertEquals(View.ACCESSIBILITY_LIVE_REGION_NONE, restored.getAccessibilityLiveRegion());
        feedback.show("A retained recovery instruction.");
        TextView next = replacement.findViewWithTag(SettingsFeedback.MESSAGE_TAG);
        watch(next, repeated);
        ShadowLooper.idleMainLooper(100, TimeUnit.MILLISECONDS);
        assertEquals("A second attempt needs exactly one fresh result", 1, repeated[0]);
    }

    @Test public void copyUsesTheExactAddressAndOldOrClosedActionsAreInert() {
        SettingsFeedback feedback = new SettingsFeedback();
        LinearLayout region = region();
        boolean[] alive = {true};
        feedback.bind(region, () -> alive[0]);
        ClipboardManager clipboard = (ClipboardManager) controller.get().getSystemService(Activity.CLIPBOARD_SERVICE);
        clipboard.setPrimaryClip(ClipData.newPlainText("control", "unchanged"));
        feedback.show("A link could not open.", "https://example.org/first");
        Button old = region.findViewWithTag(SettingsFeedback.COPY_TAG);
        feedback.show("Another link could not open.", "https://example.org/next?one=two");
        old.performClick();
        assertEquals("unchanged", clipboard.getPrimaryClip().getItemAt(0).getText());
        Button current = region.findViewWithTag(SettingsFeedback.COPY_TAG);
        current.performClick();
        assertEquals("https://example.org/next?one=two", clipboard.getPrimaryClip().getItemAt(0).getText());
        assertNull("Copy must not retry the missing browser", shadowOf(controller.get()).getNextStartedActivity());
        clipboard.setPrimaryClip(ClipData.newPlainText("control", "closed"));
        alive[0] = false;
        current.performClick();
        assertEquals("closed", clipboard.getPrimaryClip().getItemAt(0).getText());
        root.removeView(region);
        current.performClick();
        assertEquals("closed", clipboard.getPrimaryClip().getItemAt(0).getText());
    }

    /** A Copy link the clipboard refuses keeps the instruction it came with, says so under it, and still offers Copy link. */
    @Test public void aCopyThatFailsKeepsTheInstructionAndSaysSoUnderIt() {
        Context noClipboard = new ContextWrapper(root.getContext()) {
            @Override public Object getSystemService(String name) {
                return Context.CLIPBOARD_SERVICE.equals(name) ? null : super.getSystemService(name);
            }
        };
        LinearLayout region = new LinearLayout(noClipboard);
        region.setOrientation(LinearLayout.VERTICAL);
        root.addView(region, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        SettingsFeedback feedback = new SettingsFeedback();
        feedback.bind(region, () -> true);
        feedback.show("Open this link in a browser.", "https://example.org/help");
        ShadowLooper.idleMainLooper(100, TimeUnit.MILLISECONDS);
        ShadowToast.reset();

        ((Button) region.findViewWithTag(SettingsFeedback.COPY_TAG)).performClick();
        ShadowLooper.idleMainLooper(100, TimeUnit.MILLISECONDS);
        TextView text = region.findViewWithTag(SettingsFeedback.MESSAGE_TAG);
        assertEquals("Open this link in a browser.\nCouldn't copy the link. Try again.", text.getText().toString());
        assertEquals("the failure is new, so it's read out", View.ACCESSIBILITY_LIVE_REGION_POLITE, text.getAccessibilityLiveRegion());
        assertNotNull("trying again needs the button", region.findViewWithTag(SettingsFeedback.COPY_TAG));
        assertNull("a failed copy said it copied", ShadowToast.getTextOfLatestToast());

        // The failure line comes back with the instruction after the screen is rebuilt.
        Bundle saved = new Bundle();
        feedback.save(saved, "row");
        SettingsFeedback rebuilt = new SettingsFeedback();
        rebuilt.restore(saved, "row");
        LinearLayout again = region();
        rebuilt.bind(again, () -> true);
        ShadowLooper.idleMainLooper(100, TimeUnit.MILLISECONDS);
        assertEquals(text.getText().toString(), ((TextView) again.findViewWithTag(SettingsFeedback.MESSAGE_TAG)).getText().toString());
    }

    /** A list drops a touch on a row that holds an explicitly focusable view, so Copy link must not be one. */
    @Test public void theCopyButtonLeavesTheRestOfItsRowTappable() {
        SettingsFeedback feedback = new SettingsFeedback();
        LinearLayout region = region();
        feedback.bind(region, () -> true);
        feedback.show("A link could not open.", "https://example.org/help");
        Button copy = region.findViewWithTag(SettingsFeedback.COPY_TAG);
        assertTrue("a keyboard can't reach Copy link", copy.isFocusable());
        assertFalse("a tap on the row around Copy link would be dropped", root.hasExplicitFocusable());
    }

    /** A rebuilt screen shows the result it had without reading it out again, and never over a newer one. */
    @Test public void aSavedResultComesBackQuietlyAndNeverOverANewerOne() {
        SettingsFeedback first = new SettingsFeedback();
        first.bind(region(), () -> true);
        first.show("Settings weren't exported.", "https://example.org/a");
        ShadowLooper.idleMainLooper(100, TimeUnit.MILLISECONDS);
        Bundle saved = new Bundle();
        first.save(saved, "row");
        new SettingsFeedback().save(saved, "empty");
        assertFalse("a row with nothing to say saved something", saved.containsKey("empty"));

        // Android restores state before it binds rows.
        SettingsFeedback rebuilt = new SettingsFeedback();
        rebuilt.restore(saved, "row");
        LinearLayout region = region();
        rebuilt.bind(region, () -> true);
        TextView text = region.findViewWithTag(SettingsFeedback.MESSAGE_TAG);
        int[] changes = {0};
        watch(text, changes);
        ShadowLooper.idleMainLooper(100, TimeUnit.MILLISECONDS);
        assertEquals("Settings weren't exported.", text.getText().toString());
        assertNotNull(region.findViewWithTag(SettingsFeedback.COPY_TAG));
        assertEquals("read out a second time", 0, changes[0]);
        assertEquals(View.ACCESSIBILITY_LIVE_REGION_NONE, text.getAccessibilityLiveRegion());

        SettingsFeedback newer = new SettingsFeedback();
        newer.bind(region(), () -> true);
        newer.show("Settings exported.");
        ShadowLooper.idleMainLooper(100, TimeUnit.MILLISECONDS);
        newer.restore(saved, "row");
        assertEquals("Settings exported.", newer.message());
    }

    /** A list that draws its row again for a new result reads the words out on the row it drew. */
    @Test public void aListThatRedrawsTheRowReadsTheResultOutOnTheNewRow() {
        SettingsFeedback[] feedback = new SettingsFeedback[1];
        int[] drawn = {0};
        BaseAdapter adapter = new BaseAdapter() {
            @Override public int getCount() { return 1; }
            @Override public Object getItem(int position) { return feedback[0]; }
            @Override public long getItemId(int position) { return position; }
            @Override public View getView(int position, View convertView, ViewGroup parent) {
                // As a preference list does, a fresh row each time, never the one it hands back.
                LinearLayout row = new LinearLayout(parent.getContext());
                row.setOrientation(LinearLayout.VERTICAL);
                feedback[0].bind(row, row::isAttachedToWindow);
                drawn[0]++;
                return row;
            }
        };
        feedback[0] = new SettingsFeedback(adapter::notifyDataSetChanged);
        ListView list = new ListView(root.getContext());
        root.addView(list, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 600));
        list.setAdapter(adapter);
        ShadowLooper.idleMainLooper(100, TimeUnit.MILLISECONDS);
        int before = drawn[0];

        feedback[0].show("Couldn't save that. Try again.");
        ShadowLooper.idleMainLooper(100, TimeUnit.MILLISECONDS);

        assertTrue("the list never drew the row again", drawn[0] > before);
        LinearLayout shown = (LinearLayout) list.getChildAt(0);
        assertTrue(shown.isAttachedToWindow());
        TextView text = shown.findViewWithTag(SettingsFeedback.MESSAGE_TAG);
        assertEquals("Couldn't save that. Try again.", text.getText().toString());
        assertEquals("the row on screen was never read out", View.ACCESSIBILITY_LIVE_REGION_POLITE,
                text.getAccessibilityLiveRegion());
    }

    private static void watch(TextView view, int[] changes) {
        view.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) { changes[0]++; }
            @Override public void afterTextChanged(Editable text) {}
        });
    }
}
