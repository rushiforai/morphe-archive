/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.shared.ui;

import static org.junit.Assert.*;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.ApplicationInfo;
import android.content.res.Configuration;
import android.util.Pair;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadows.ShadowLooper;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

import app.hushtelegram.extension.shared.SettingsContextRule;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class CustomDialogTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Test public void neutralCanKeepDialogOpenAndPrimaryRunsBeforeDismiss() {
        try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup()) {
            AtomicReference<Dialog> current = new AtomicReference<>();
            List<String> events = new ArrayList<>();
            Pair<Dialog, LinearLayout> result = CustomDialog.create(activity.get(), "Send message", null, null,
                    "Send", () -> events.add("send:" + current.get().isShowing()), null,
                    "Keep editing", () -> events.add("edit:" + current.get().isShowing()), false);
            current.set(result.first);
            AtomicInteger dismissals = new AtomicInteger();
            result.first.setOnDismissListener(ignored -> dismissals.incrementAndGet());
            result.first.show();
            try {
                button(result.second, "Keep editing").performClick();
                assertTrue(result.first.isShowing());
                assertEquals(Arrays.asList("edit:true"), events);
                button(result.second, "Send").performClick();
                ShadowLooper.idleMainLooper();
                assertFalse(result.first.isShowing());
                assertEquals(Arrays.asList("edit:true", "send:true"), events);
                assertEquals(1, dismissals.get());
            } finally { result.first.dismiss(); }
        }
    }

    @Test public void dismissingNeutralAndCancelOnlyRunTheirOwnActions() {
        try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup()) {
            AtomicInteger sent = new AtomicInteger();
            AtomicInteger cancelled = new AtomicInteger();
            AtomicInteger neutral = new AtomicInteger();
            Pair<Dialog, LinearLayout> result = CustomDialog.create(activity.get(), "Send message", null, null,
                    "Send", sent::incrementAndGet, cancelled::incrementAndGet,
                    "Save draft", neutral::incrementAndGet, true);
            try {
                result.first.show();
                button(result.second, "Save draft").performClick();
                assertFalse(result.first.isShowing());
                assertEquals(1, neutral.get());
                assertEquals(0, cancelled.get());
                assertEquals(0, sent.get());
                result.first.show();
                result.first.cancel();
                assertEquals(0, cancelled.get());
                result.first.show();
                button(result.second, activity.get().getString(android.R.string.cancel)).performClick();
                assertFalse(result.first.isShowing());
                assertEquals(1, cancelled.get());
                assertEquals(0, sent.get());
            } finally { result.first.dismiss(); }
        }
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void actionsReflowForActualWidthAndMirrorWithoutChangingHostFlagsOrTheme() {
        try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup()) {
            Configuration configuration = new Configuration(activity.get().getResources().getConfiguration());
            configuration.setLocale(new Locale("ar"));
            activity.get().getResources().updateConfiguration(configuration, activity.get().getResources().getDisplayMetrics());
            Context host = new ContextWrapper(activity.get()) {
                private final ApplicationInfo info = new ApplicationInfo(activity.get().getApplicationInfo());
                { info.flags &= ~ApplicationInfo.FLAG_SUPPORTS_RTL; }
                @Override public ApplicationInfo getApplicationInfo() { return info; }
            };
            Pair<Dialog, LinearLayout> result = CustomDialog.create(host, "إرسال الرسالة", null, null,
                    "Send", () -> {}, () -> {}, "Keep", () -> {}, true);
            result.first.show();
            try {
                measure(result.second, 640, 900);
                Button keep = button(result.second, "Keep");
                Button send = button(result.second, "Send");
                LinearLayout actions = (LinearLayout) send.getParent();
                assertEquals(LinearLayout.HORIZONTAL, actions.getOrientation());
                assertEquals(View.LAYOUT_DIRECTION_RTL, result.second.getLayoutDirection());
                assertTrue(keep.getLeft() > send.getLeft());
                assertSame(host.getTheme(), result.second.getContext().getTheme());
                assertEquals(0, host.getApplicationInfo().flags & ApplicationInfo.FLAG_SUPPORTS_RTL);

                measure(result.second, 160, 900);
                assertEquals(LinearLayout.VERTICAL, actions.getOrientation());
                assertSame(send, actions.getChildAt(0));
                assertTrue(send.getBottom() <= keep.getTop());
                assertTrue(send.getHeight() >= dp(result.second, 48));

                measure(result.second, 640, 900);
                assertEquals(LinearLayout.HORIZONTAL, actions.getOrientation());
                assertTrue(keep.getLeft() > send.getLeft());
            } finally { result.first.dismiss(); }
        }
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void longActionWrapsAtLargeTextWhileContentKeepsItsScrollCuesAndHeading() {
        try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup()) {
            Configuration configuration = new Configuration(activity.get().getResources().getConfiguration());
            configuration.fontScale = 2;
            activity.get().getResources().updateConfiguration(configuration, activity.get().getResources().getDisplayMetrics());
            String label = "Send this message and keep the conversation open";
            Pair<Dialog, LinearLayout> result = CustomDialog.create(activity.get(), "Send message",
                    "A long message.\n".repeat(80), null, label, () -> {}, null, null, null, true);
            result.first.show();
            try {
                measure(result.second, 220, 640);
                Button action = button(result.second, label);
                assertNull(action.getEllipsize());
                assertTrue("Label did not wrap: width=" + action.getWidth() + ", textSize=" + action.getTextSize()
                        + ", lines=" + action.getLineCount(), action.getLineCount() > 1);
                assertTrue(action.getHeight() > dp(result.second, 48));
                assertEquals(ViewGroup.LayoutParams.WRAP_CONTENT, action.getLayoutParams().height);
                ScrollView scroll = scroll(result.second);
                assertTrue(scroll.isVerticalScrollBarEnabled());
                assertFalse(scroll.isScrollbarFadingEnabled());
                assertTrue(scroll.getHeight() > 0);
                assertTrue(scroll.getChildAt(0).getHeight() > scroll.getHeight());
                assertTrue(result.second.getMeasuredHeight() <= dp(result.second, 640));
                assertTrue(((TextView) result.second.getChildAt(0)).isAccessibilityHeading());
                assertEquals("Send message", result.second.getAccessibilityPaneTitle());
                assertEquals("Send message", result.first.getWindow().getAttributes().getTitle());
            } finally { result.first.dismiss(); }
        }
    }

    /** A dialog's title and message break long words where the text's language hyphenates them. */
    @Test @Config(sdk = 36, qualifiers = "de")
    public void titleAndMessageHyphenateInTheTextsLanguage() {
        try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup()) {
            Pair<Dialog, LinearLayout> result = CustomDialog.create(activity.get(), "Benachrichtigungsberechtigung",
                    "Firebase-Push-Registrierung reparieren", null, "OK", () -> {}, null, null, null, true);
            try {
                TextView title = (TextView) result.second.getChildAt(0);
                TextView message = (TextView) ((ViewGroup) scroll(result.second).getChildAt(0)).getChildAt(0);
                assertEquals("Firebase-Push-Registrierung reparieren", String.valueOf(message.getText()));
                for (TextView text : new TextView[]{title, message}) {
                    assertEquals(android.text.Layout.HYPHENATION_FREQUENCY_NORMAL, text.getHyphenationFrequency());
                    assertEquals("de", text.getTextLocale().getLanguage());
                }
            } finally { result.first.dismiss(); }
        }
    }

    @Test public void customContentScrollsWithoutMovingCancelOffscreen() {
        try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup()) {
            LinearLayout content = new LinearLayout(activity.get());
            content.setOrientation(LinearLayout.VERTICAL);
            for (int i = 0; i < 40; i++) {
                TextView row = new TextView(activity.get());
                row.setText("Destination " + i);
                row.setMinHeight(dp(content, 48));
                content.addView(row);
            }
            LinearLayout oldParent = new LinearLayout(activity.get());
            oldParent.addView(content);
            AtomicInteger cancelled = new AtomicInteger();
            Pair<Dialog, LinearLayout> result = CustomDialog.createWithContent(activity.get(), "Forward to",
                    content, cancelled::incrementAndGet);
            result.first.show();
            try {
                measure(result.second, 320, 500);
                assertEquals(0, oldParent.getChildCount());
                ScrollView scroll = scroll(result.second);
                assertSame(scroll.getChildAt(0), content.getParent());
                assertTrue(scroll.getChildAt(0).getHeight() > scroll.getHeight());
                Button cancel = button(result.second, activity.get().getString(android.R.string.cancel));
                assertTrue(((View) cancel.getParent()).getBottom() <= result.second.getHeight() - result.second.getPaddingBottom());
                cancel.performClick();
                assertEquals(1, cancelled.get());
                assertFalse(result.first.isShowing());
            } finally { result.first.dismiss(); }
        }
    }

    private static void measure(View root, int widthDp, int heightDp) {
        int width = dp(root, widthDp);
        root.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(dp(root, heightDp), View.MeasureSpec.AT_MOST));
        root.layout(0, 0, width, root.getMeasuredHeight());
    }

    private static int dp(View view, int value) {
        return Math.round(value * view.getResources().getDisplayMetrics().density);
    }

    private static Button button(View view, String label) {
        if (view instanceof Button && label.contentEquals(((Button) view).getText())) return (Button) view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                Button found = button(group.getChildAt(i), label);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static ScrollView scroll(ViewGroup root) {
        for (int i = 0; i < root.getChildCount(); i++) {
            if (root.getChildAt(i) instanceof ScrollView) return (ScrollView) root.getChildAt(i);
        }
        throw new AssertionError("Dialog has no scroll area");
    }
}
