/*
 * Copyright (c) 2026 HushPinterest contributors
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.settings;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.pm.verify.domain.DomainVerificationManager;
import android.content.pm.verify.domain.DomainVerificationUserState;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.os.Build;
import android.os.Bundle;
import android.os.Process;
import android.os.UserHandle;
import android.preference.PreferenceFragment;
import android.preference.PreferenceScreen;
import android.text.Layout;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.ScrollView;
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
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadow.api.Shadow;
import org.robolectric.shadows.ShadowContextImpl;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;
import org.robolectric.util.ReflectionHelpers;
import org.robolectric.util.ReflectionHelpers.ClassParameter;

import java.lang.reflect.Proxy;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.settings.Setting;

/** Native opt-in clicks, external actions, lifecycle ownership and full text at large font sizes. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 31, qualifiers = "en-rUS-w411dp-h891dp-xxhdpi")
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@SuppressWarnings("deprecation")
public class SetupGuidancePreferenceTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private ActivityController<GuideActivity> controller;
    private GuidePage page;
    private Object answer;
    private final List<String> askedFor = new ArrayList<>();

    @Before public void reset() {
        GuideActivity.refused.clear();
        GuideActivity.browserFailure = null;
        GuideActivity.failWindow = false;
        GuideActivity.attempts.clear();
        ShadowToast.reset();
    }

    @After public void close() {
        if (controller != null) controller.close();
        Settings.HIDE_ADS.resetToDefault();
        RuntimeEnvironment.setFontScale(1f);
    }

    @Test public void guidanceIsOptionalAndOpeningOrDismissingItChangesNoSavedChoices() throws Exception {
        show();
        Settings.HIDE_ADS.save(!Settings.HIDE_ADS.defaultValue);
        Map<String, ?> before = new LinkedHashMap<>(Setting.preferences.preferences.getAll());
        assertNull(page.row.getDialog());
        assertFalse(page.row.isPersistent());
        View row = list().getAdapter().getView(0, null, list());
        AccessibilityNodeInfo node = row.createAccessibilityNodeInfo();
        assertEquals(Button.class.getName(), node.getClassName().toString());
        assertTrue(node.isClickable());
        assertTrue(node.getActionList().contains(AccessibilityNodeInfo.AccessibilityAction.ACTION_CLICK));
        assertEquals(Integer.MAX_VALUE, ((TextView) row.findViewById(android.R.id.summary)).getMaxLines());
        AlertDialog guide = open();
        assertEquals(View.GONE, guide.getButton(AlertDialog.BUTTON_POSITIVE).getVisibility());
        assertEquals(View.GONE, guide.getButton(AlertDialog.BUTTON_NEUTRAL).getVisibility());
        capture(guide, "setup-guide", false);
        guide.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
        ShadowLooper.idleMainLooper();
        assertFalse(guide.isShowing());
        assertNull(page.row.getDialog());
        assertEquals(before, Setting.preferences.preferences.getAll());
        assertTrue(GuideActivity.attempts.isEmpty());
    }

    @Test public void guideDisclosesBuildLoginAndBackupLimitsWithoutRequestingAccountOrKeyInput() {
        show();
        AlertDialog guide = open();
        String copy = copy(guide);
        assertTrue(copy.contains("Changing switches doesn't add or remove patches."));
        assertTrue(copy.contains("changes made while patching remain in the app"));
        assertTrue(copy.contains("email linked to your existing Pinterest account and a Pinterest password"));
        assertTrue(copy.contains("Google sign-in isn't supported with this build's changed signing key"));
        assertTrue(copy.contains("Pinterest no longer offers Facebook login"));
        assertTrue(copy.contains("Push notifications haven't been verified"));
        assertTrue(copy.contains("choose Forgot your password on Pinterest's login page"));
        assertTrue(copy.contains("email already linked to that account"));
        assertTrue(copy.contains("reset link sent to your email to set a Pinterest password"));
        assertTrue(copy.contains("It's separate from your Google password."));
        assertTrue(copy.contains("You don't need to unlink Google."));
        assertTrue(copy.contains("doesn't include your Pinterest account, pins, downloaded files or Morphe Manager's signing key"));
        assertTrue(copy.contains("same key keeps the app's data"));
        assertTrue(copy.contains("different key isn't a compatible update"));
        assertTrue(copy.contains("Android may refuse a downgrade"));
        assertTrue(copy.contains("Pinterest's data export is separate from Export settings"));
        assertFalse(copy.contains("clear data"));
        assertFalse(copy.contains("new account"));
        for (TextView text : textViews(scroll(guide))) assertFalse(text instanceof android.widget.EditText);
    }

    @Test public void bothHelpButtonsOpenOnlyVettedPublicPinterestPagesWithoutPrivatePayload() {
        show();
        AlertDialog guide = open();
        Map<String, ?> before = new LinkedHashMap<>(Setting.preferences.preferences.getAll());
        for (String[] help : new String[][]{
                {"Pinterest password help", "https://help.pinterest.com/en/article/reset-your-password"},
                {"Pinterest data export help", "https://help.pinterest.com/en/article/download-your-pinterest-data"}}) {
            button(guide, help[0]).performClick();
            Intent intent = shadowOf(controller.get()).getNextStartedActivity();
            assertNotNull(intent);
            assertEquals(Intent.ACTION_VIEW, intent.getAction());
            assertEquals(help[1], intent.getDataString());
            assertTrue(intent.hasCategory(Intent.CATEGORY_BROWSABLE));
            assertNull(intent.getPackage());
            assertNull(intent.getClipData());
            assertNull(intent.getExtras());
            assertEquals(0, intent.getFlags());
            assertTrue(guide.isShowing());
        }
        assertEquals(before, Setting.preferences.preferences.getAll());
    }

    @Test public void linkStatusReadsThisAppAndRefreshesWhenTheGuideRegainsFocus() throws Exception {
        show();
        answer = domainState(0, 0);
        installService();
        AlertDialog guide = open();
        assertTrue(copy(guide).contains(SupportedLinks.summary(SupportedLinks.State.NONE)));
        answer = domainState(1, 0);
        scroll(guide).onWindowFocusChanged(true);
        assertTrue(copy(guide).contains(SupportedLinks.summary(SupportedLinks.State.SOME)));
        answer = domainState(1, 1);
        scroll(guide).onWindowFocusChanged(true);
        assertTrue(copy(guide).contains(SupportedLinks.summary(SupportedLinks.State.SELECTED)));
        assertTrue(askedFor.size() >= 3);
        for (String app : askedFor) assertEquals(controller.get().getPackageName(), app);
        button(guide, "Open link settings").performClick();
        Intent intent = shadowOf(controller.get()).getNextStartedActivity();
        assertEquals(android.provider.Settings.ACTION_APP_OPEN_BY_DEFAULT_SETTINGS, intent.getAction());
        assertEquals("package:" + controller.get().getPackageName(), intent.getDataString());
    }

    @Test public void unreadableLinksAreUnknownAndTheAndroidSettingsFallbackRemainsUsable() throws Exception {
        show();
        answer = new SecurityException("unavailable");
        installService();
        AlertDialog guide = open();
        assertTrue(copy(guide).contains(SupportedLinks.summary(SupportedLinks.State.UNKNOWN)));
        GuideActivity.refused.add(android.provider.Settings.ACTION_APP_OPEN_BY_DEFAULT_SETTINGS);
        button(guide, "Open link settings").performClick();
        Intent intent = shadowOf(controller.get()).getNextStartedActivity();
        assertEquals(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS, intent.getAction());
        assertEquals("package:" + controller.get().getPackageName(), intent.getDataString());
        assertTrue(guide.isShowing());
    }

    @Test @Config(sdk = {28, 30})
    public void olderAndroidShowsItsReportingLimitAndOpensOnlyThisAppsInfo() {
        show();
        AlertDialog guide = open();
        assertTrue(copy(guide).contains(SupportedLinks.summary(SupportedLinks.State.NOT_REPORTED)));
        button(guide, "Open link settings").performClick();
        assertEquals(1, GuideActivity.attempts.size());
        Intent intent = GuideActivity.attempts.get(0);
        assertEquals(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS, intent.getAction());
        assertEquals("package:" + controller.get().getPackageName(), intent.getDataString());
    }

    @Test public void failedBrowserAndSettingsActionsShowUsefulFeedbackAndKeepTheGuideOpen() {
        show();
        AlertDialog guide = open();
        for (RuntimeException failure : new RuntimeException[]{new ActivityNotFoundException(),
                new SecurityException("denied"), new IllegalStateException("host unavailable")}) {
            GuideActivity.browserFailure = failure;
            button(guide, "Pinterest password help").performClick();
            ShadowLooper.idleMainLooper();
            assertTrue(ShadowToast.getTextOfLatestToast().contains("https://help.pinterest.com/en/article/reset-your-password"));
            assertTrue(guide.isShowing());
        }
        GuideActivity.refused.add(android.provider.Settings.ACTION_APP_OPEN_BY_DEFAULT_SETTINGS);
        GuideActivity.refused.add(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS);
        button(guide, "Open link settings").performClick();
        ShadowLooper.idleMainLooper();
        assertEquals("Android's settings for this app didn't open. Open App info from Pinterest's icon, then Open by default.", ShadowToast.getTextOfLatestToast());
        assertTrue(guide.isShowing());
        assertNull(shadowOf(controller.get()).getNextStartedActivity());
    }

    @Test public void dismissedGuidesDiscardActionsAndOldCallbacksCannotActOnANewOpening() {
        show();
        AlertDialog old = open();
        Button oldButton = button(old, "Pinterest password help");
        View.OnClickListener callback = listener(oldButton);
        old.dismiss();
        AlertDialog next = open();
        callback.onClick(oldButton);
        scroll(old).onWindowFocusChanged(true);
        oldButton.performClick();
        ShadowLooper.idleMainLooper();
        assertTrue(GuideActivity.attempts.isEmpty());
        assertTrue(next.isShowing());
        assertSame(next, page.row.getDialog());
        button(next, "Pinterest data export help").performClick();
        assertEquals(1, GuideActivity.attempts.size());
    }

    @Test public void removingThePreferenceOrDestroyingItsActivityClosesTheDialogAndDisarmsActions() {
        show();
        AlertDialog removed = open();
        Button removedButton = button(removed, "Open link settings");
        View.OnClickListener removedAction = listener(removedButton);
        assertTrue(page.getPreferenceScreen().removePreference(page.row));
        assertFalse(removed.isShowing());
        removedAction.onClick(removedButton);
        page.getPreferenceScreen().addPreference(page.row);
        AlertDialog destroyed = open();
        Button destroyedButton = button(destroyed, "Pinterest data export help");
        View.OnClickListener destroyedAction = listener(destroyedButton);
        controller.pause().stop().destroy();
        assertFalse(destroyed.isShowing());
        destroyedAction.onClick(destroyedButton);
        assertTrue(GuideActivity.attempts.isEmpty());
    }

    @Test public void aWindowFailureReportsTheProblemAndCanBeRetried() {
        show();
        GuideActivity.failWindow = true;
        click();
        ShadowLooper.idleMainLooper();
        assertEquals("Couldn't open the setup guide. Try again.", ShadowToast.getTextOfLatestToast());
        assertNull(page.row.getDialog());
        GuideActivity.failWindow = false;
        assertTrue(open().isShowing());
    }

    @Test @Config(sdk = {28, 36}, qualifiers = "+ar-rXB-ldrtl")
    public void allTextAndButtonLabelsWrapAtDoubleFontSizeInRtlAndTheLastActionCanBeReached() throws Exception {
        RuntimeEnvironment.setFontScale(2f);
        show();
        AlertDialog guide = open();
        ScrollView scroll = scroll(guide);
        scroll.setLayoutDirection(View.LAYOUT_DIRECTION_RTL);
        int width = dp(320);
        int height = dp(280);
        scroll.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
        scroll.layout(0, 0, width, height);
        assertEquals(2f, controller.get().getResources().getConfiguration().fontScale, 0f);
        assertEquals(View.LAYOUT_DIRECTION_RTL, scroll.getLayoutDirection());
        LinearLayout content = (LinearLayout) scroll.getChildAt(0);
        assertEquals(content.getPaddingStart(), content.getPaddingEnd());
        int wrapped = 0;
        int headings = 0;
        for (TextView text : textViews(scroll)) {
            Layout layout = text.getLayout();
            assertNotNull(text.getText().toString(), layout);
            assertEquals(text.getText().length(), layout.getLineEnd(layout.getLineCount() - 1));
            for (int line = 0; line < layout.getLineCount(); line++) assertEquals(0, layout.getEllipsisCount(line));
            assertTrue(text.getText().toString(), layout.getHeight() <= text.getHeight() - text.getCompoundPaddingTop() - text.getCompoundPaddingBottom());
            if (text.getLineCount() > 1) wrapped++;
            if (text.isAccessibilityHeading()) headings++;
            if (text instanceof Button) {
                assertTrue(text.getHeight() >= dp(48));
                assertEquals(Button.class.getName(), text.getAccessibilityClassName().toString());
                assertTrue(text.isClickable());
            }
        }
        assertEquals(4, headings);
        assertTrue(wrapped > 4);
        assertTrue(content.getHeight() > scroll.getHeight());
        scroll.setSmoothScrollingEnabled(false);
        scroll.fullScroll(View.FOCUS_DOWN);
        Button last = button(guide, "Pinterest data export help");
        assertTrue(last.getBottom() <= scroll.getScrollY() + scroll.getHeight());
        last.performClick();
        assertEquals("https://help.pinterest.com/en/article/download-your-pinterest-data", GuideActivity.attempts.get(0).getDataString());
        assertTrue(guide.getButton(AlertDialog.BUTTON_NEGATIVE).isEnabled());
        capture(guide, "setup-guide-large-rtl-api" + Build.VERSION.SDK_INT, true);
    }

    private void capture(AlertDialog guide, String name, boolean bottom) throws Exception {
        ShadowLooper.idleMainLooper();
        View decor = guide.getWindow().getDecorView();
        decor.measure(View.MeasureSpec.makeMeasureSpec(780, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(1688, View.MeasureSpec.EXACTLY));
        decor.layout(0, 0, 780, 1688);
        if (bottom) scroll(guide).fullScroll(View.FOCUS_DOWN);
        Bitmap image = Bitmap.createBitmap(780, 1688, Bitmap.Config.ARGB_8888);
        decor.draw(new Canvas(image));
        File folder = new File("build/reports/settings-design");
        assertTrue(folder.isDirectory() || folder.mkdirs());
        try (FileOutputStream output = new FileOutputStream(new File(folder, name + ".png"))) {
            assertTrue(image.compress(Bitmap.CompressFormat.PNG, 100, output));
        } finally { image.recycle(); }
    }

    private void show() {
        controller = Robolectric.buildActivity(GuideActivity.class).setup().visible();
        page = new GuidePage();
        controller.get().getFragmentManager().beginTransaction().add(android.R.id.content, page).commitNow();
    }

    private ListView list() { return page.getView().findViewById(android.R.id.list); }
    private void click() {
        ListAdapter adapter = list().getAdapter();
        assertTrue(list().performItemClick(adapter.getView(0, null, list()), 0, adapter.getItemId(0)));
    }
    private AlertDialog open() { click(); AlertDialog opened = (AlertDialog) page.row.getDialog(); assertNotNull(opened); return opened; }
    private static ScrollView scroll(AlertDialog dialog) { return dialog.findViewById(android.R.id.list); }
    private static Button button(AlertDialog dialog, String name) {
        String translated = L10n.t(dialog.getContext(), name);
        for (TextView view : textViews(scroll(dialog))) if (view instanceof Button && view.getText().toString().equals(translated)) return (Button) view;
        throw new AssertionError("no guidance button: " + name);
    }
    private static View.OnClickListener listener(View view) {
        Object info = ReflectionHelpers.callInstanceMethod(view, "getListenerInfo");
        return ReflectionHelpers.getField(info, "mOnClickListener");
    }
    private static List<TextView> textViews(View view) {
        List<TextView> found = new ArrayList<>();
        if (view instanceof TextView) found.add((TextView) view);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) found.addAll(textViews(group.getChildAt(i)));
        }
        return found;
    }
    private static String copy(AlertDialog dialog) {
        StringBuilder result = new StringBuilder();
        for (TextView text : textViews(scroll(dialog))) result.append(text.getText()).append('\n');
        return result.toString();
    }
    private int dp(int value) { return Math.round(value * controller.get().getResources().getDisplayMetrics().density); }

    private DomainVerificationUserState domainState(int first, int second) {
        Map<String, Integer> hosts = new LinkedHashMap<>();
        hosts.put("www.pinterest.com", first);
        hosts.put("pin.it", second);
        return ReflectionHelpers.callConstructor(DomainVerificationUserState.class,
                ClassParameter.from(UUID.class, UUID.randomUUID()),
                ClassParameter.from(String.class, controller.get().getPackageName()),
                ClassParameter.from(UserHandle.class, Process.myUserHandle()),
                ClassParameter.from(boolean.class, true), ClassParameter.from(Map.class, hosts));
    }
    private void installService() throws Exception {
        Context context = controller.get().getBaseContext();
        Class<?> binder = Class.forName("android.content.pm.verify.domain.IDomainVerificationManager");
        Object service = Proxy.newProxyInstance(binder.getClassLoader(), new Class<?>[]{binder}, (proxy, method, args) -> {
            if (!method.getName().equals("getDomainVerificationUserState")) throw new UnsupportedOperationException(method.getName());
            askedFor.add((String) args[0]);
            if (answer instanceof Throwable) throw (Throwable) answer;
            return answer;
        });
        DomainVerificationManager manager = ReflectionHelpers.callConstructor(DomainVerificationManager.class,
                ClassParameter.from(Context.class, context), ClassParameter.from(binder, service));
        ShadowContextImpl shadow = Shadow.extract(context);
        shadow.setSystemService(Context.DOMAIN_VERIFICATION_SERVICE, manager);
    }

    public static class GuidePage extends PreferenceFragment {
        SetupGuidancePreference row;
        @Override public void onCreate(Bundle state) {
            super.onCreate(state);
            PreferenceScreen screen = getPreferenceManager().createPreferenceScreen(getActivity());
            row = new SetupGuidancePreference(getActivity());
            screen.addPreference(row);
            setPreferenceScreen(screen);
        }
    }
    public static class GuideActivity extends Activity {
        static final Set<String> refused = new HashSet<>();
        static final List<Intent> attempts = new ArrayList<>();
        static RuntimeException browserFailure;
        static boolean failWindow;
        @Override public void startActivity(Intent intent) {
            attempts.add(new Intent(intent));
            if (refused.contains(intent.getAction())) throw new ActivityNotFoundException();
            if (Intent.ACTION_VIEW.equals(intent.getAction()) && browserFailure != null) throw browserFailure;
            super.startActivity(intent);
        }
        @Override public Object getSystemService(String name) {
            if (failWindow && Context.WINDOW_SERVICE.equals(name)) throw new IllegalStateException("injected window failure");
            return super.getSystemService(name);
        }
    }
}
