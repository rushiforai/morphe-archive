/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.settings;

import static org.junit.Assert.*;

import android.app.Activity;
import android.app.AlertDialog;
import android.preference.Preference;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.TextView;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;

import java.util.ArrayList;
import java.util.List;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.telegram.misc.ProxyOrder;
import app.hushtelegram.extension.telegram.misc.ProxyOrderForTests;

/** The Proxy order editor (#71): moves and pins are kept as they're made. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ProxyOrderEditorTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After public void restore() {
        ProxyOrderForTests.restore();
    }

    @Test public void aScreenReaderMovesAProxyAndTheWholeOrderIsKept() {
        ProxyOrderForTests.useList("A", "B", "C");
        try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup()) {
            Preference row = new Preference(activity.get());
            AlertDialog dialog = ProxyOrderEditor.open(activity.get(), row);
            try {
                List<View> items = items(dialog);
                assertEquals("Sort by speed waits for an order to undo", View.GONE,
                        dialog.getButton(AlertDialog.BUTTON_NEUTRAL).getVisibility());
                assertFalse("the top one can't go up", actions(items.get(0)).contains(ProxyOrderEditor.MOVE_UP));
                assertTrue(actions(items.get(0)).contains(ProxyOrderEditor.MOVE_DOWN));
                assertTrue(items.get(0).performAccessibilityAction(ProxyOrderEditor.MOVE_DOWN, null));
                ShadowLooper.idleMainLooper();

                assertEquals("kB\nkA\nkC", ProxyOrderForTests.arranged());
                assertEquals("B:443", label(items(dialog).get(0)));
                assertEquals(ProxyOrder.summary(), row.getSummary());
                assertEquals("Telegram's proxy list is in your order. Tap to change it.", row.getSummary());
                assertEquals(View.VISIBLE, dialog.getButton(AlertDialog.BUTTON_NEUTRAL).getVisibility());

                dialog.getButton(AlertDialog.BUTTON_NEUTRAL).performClick();
                ShadowLooper.idleMainLooper();
                assertEquals("Sort by speed keeps only the pins, and there are none", "", ProxyOrderForTests.arranged());
                assertFalse(dialog.isShowing());
            } finally {
                dialog.dismiss();
            }
        }
    }

    @Test public void aPinnedProxyGoesOnTopAndStaysWithThePinnedOnes() {
        ProxyOrderForTests.useList("A", "B", "C");
        try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup()) {
            Preference row = new Preference(activity.get());
            AlertDialog dialog = ProxyOrderEditor.open(activity.get(), row);
            try {
                View c = items(dialog).get(2);
                TextView pin = c.findViewWithTag(ProxyOrderEditor.PIN);
                assertEquals("Pin", pin.getText().toString());
                pin.performClick();

                List<View> items = items(dialog);
                assertSame("pinned on top", c, items.get(0));
                assertEquals("Unpin", pin.getText().toString());
                assertEquals("pins alone leave the rest in Telegram's order", "*kC", ProxyOrderForTests.arranged());
                assertEquals(View.GONE, dialog.getButton(AlertDialog.BUTTON_NEUTRAL).getVisibility());
                assertEquals("1 proxy pinned on top of Telegram's proxy list. The rest keep Telegram's order.",
                        row.getSummary());
                assertFalse("one that isn't pinned can't go above a pin", actions(items.get(1)).contains(ProxyOrderEditor.MOVE_UP));
                assertFalse(items.get(1).performAccessibilityAction(ProxyOrderEditor.MOVE_UP, null));
                assertFalse("a lone pin has nowhere to go", actions(c).contains(ProxyOrderEditor.MOVE_DOWN));

                assertTrue(items.get(2).performAccessibilityAction(ProxyOrderEditor.TOGGLE_PIN, null));
                assertEquals("pinned after the pins already there", "*kC\n*kB", ProxyOrderForTests.arranged());
                assertTrue(c.performAccessibilityAction(ProxyOrderEditor.TOGGLE_PIN, null));
                assertEquals("unpinned, it goes just below the pins", "*kB", ProxyOrderForTests.arranged());
                assertEquals("C:443", label(items(dialog).get(1)));
            } finally {
                dialog.dismiss();
            }
        }
    }

    @Test public void withNoProxiesItSaysWhereToAddOne() {
        ProxyOrderForTests.useList();
        try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup()) {
            AlertDialog dialog = ProxyOrderEditor.open(activity.get(), new Preference(activity.get()));
            try {
                assertTrue(items(dialog).isEmpty());
                assertEquals("nothing to sort", View.GONE, dialog.getButton(AlertDialog.BUTTON_NEUTRAL).getVisibility());
                assertTrue(texts(dialog.getWindow().getDecorView()).contains("Telegram's proxy list is empty. Add a proxy in "
                        + "Telegram's proxy settings, or find free proxies, then come back here."));
            } finally {
                dialog.dismiss();
            }
        }
    }

    private static List<View> items(AlertDialog dialog) {
        List<View> items = new ArrayList<>();
        collect(dialog.getWindow().getDecorView(), items);
        return items;
    }

    private static void collect(View view, List<View> items) {
        if (view.getTag() instanceof ProxyOrder.Row) items.add(view);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) collect(group.getChildAt(i), items);
        }
    }

    private static List<String> texts(View view) {
        List<String> texts = new ArrayList<>();
        if (view instanceof TextView) texts.add(((TextView) view).getText().toString());
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) texts.addAll(texts(group.getChildAt(i)));
        }
        return texts;
    }

    private static String label(View item) {
        return ((ProxyOrder.Row) item.getTag()).label;
    }

    private static List<Integer> actions(View item) {
        AccessibilityNodeInfo info = item.createAccessibilityNodeInfo();
        List<Integer> ids = new ArrayList<>();
        for (AccessibilityNodeInfo.AccessibilityAction action : info.getActionList()) ids.add(action.getId());
        return ids;
    }
}
