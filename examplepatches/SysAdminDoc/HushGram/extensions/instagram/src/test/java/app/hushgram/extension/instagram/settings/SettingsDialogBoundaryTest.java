/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.settings;

import static org.junit.Assert.*;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.pm.ApplicationInfo;
import android.graphics.Insets;
import android.graphics.Rect;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.TextView;

import java.util.EnumSet;

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
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowAlertDialog;

import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.Utils;

/** Real framework/font boundaries. Instagram 449 declares minSdk 28 and targetSdk 36. */
@RunWith(RobolectricTestRunner.class)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@Config(qualifiers = "w320dp-h640dp-xhdpi")
@SuppressWarnings("deprecation")
public class SettingsDialogBoundaryTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();
    private ActivityController<Activity> controller;
    private SettingsDialog dialog;

    @Before public void host() {
        ApplicationInfo info = RuntimeEnvironment.getApplication().getApplicationInfo();
        info.targetSdkVersion = 36;
        info.flags |= ApplicationInfo.FLAG_SUPPORTS_RTL;
        PatchFamily.inBuildForTests = EnumSet.noneOf(PatchFamily.class);
        RuntimeEnvironment.setFontScale(2f);
    }

    @After public void close() throws Exception {
        if (dialog != null) dialog.dismissAllowingStateLoss();
        if (controller != null) controller.close();
        Utils.awaitBackgroundTasksForTests();
        PatchFamily.inBuildForTests = null;
        RuntimeEnvironment.setFontScale(1f);
        SettingsEntry.onClosedByUser();
    }

    @Test @Config(sdk = 28)
    public void sdk28DialogKeepsLegacyBarsOutsideLargeTextContent() throws Exception {
        assertEquals(28, Build.VERSION.SDK_INT);
        checkInsets(false);
    }

    @Test @Config(sdk = 37)
    public void sdk37DialogKeepsSystemBarsOutsideLargeTextContent() throws Exception {
        assertEquals(37, Build.VERSION.SDK_INT);
        checkInsets(false);
    }

    @Test @Config(sdk = 28, qualifiers = "ar-rEG-ldrtl-w320dp-h640dp-xhdpi")
    public void sdk28DialogMirrorsItsLargeTextHeader() throws Exception {
        assertEquals(28, Build.VERSION.SDK_INT);
        checkInsets(true);
    }

    @Test @Config(sdk = 37, qualifiers = "ar-rEG-ldrtl-w320dp-h640dp-xhdpi")
    public void sdk37DialogMirrorsItsLargeTextHeader() throws Exception {
        assertEquals(37, Build.VERSION.SDK_INT);
        checkInsets(true);
    }

    @Test @Config(sdk = {28, 29, 37})
    public void diagnosticChooserClosesWithItsSettingsPage() {
        controller = Robolectric.buildActivity(Activity.class).setup().visible();
        dialog = new SettingsDialog();
        dialog.show(controller.get().getFragmentManager(), "boundary_settings");
        controller.get().getFragmentManager().executePendingTransactions();
        HushgramPreferenceFragment page = (HushgramPreferenceFragment)
                dialog.getChildFragmentManager().findFragmentById(SettingsDialog.CONTAINER_ID);
        android.preference.Preference export = page.findPreference("action_export_diagnostic_report");
        assertNotNull(export);
        assertTrue(export.getOnPreferenceClickListener().onPreferenceClick(export));
        AlertDialog chooser = ShadowAlertDialog.getLatestAlertDialog();
        assertNotNull(chooser);
        assertTrue(chooser.isShowing());
        dialog.dismissAllowingStateLoss();
        controller.get().getFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();
        assertNull(page.getView());
        assertFalse("report chooser outlived the settings page", chooser.isShowing());
    }

    @Test @Config(sdk = {28, 29, 37})
    public void aLateReportTapCannotOpenAChooserAfterPageTeardown() {
        controller = Robolectric.buildActivity(Activity.class).setup().visible();
        dialog = new SettingsDialog();
        dialog.show(controller.get().getFragmentManager(), "boundary_settings");
        controller.get().getFragmentManager().executePendingTransactions();
        HushgramPreferenceFragment page = (HushgramPreferenceFragment)
                dialog.getChildFragmentManager().findFragmentById(SettingsDialog.CONTAINER_ID);
        android.preference.Preference export = page.findPreference("action_export_diagnostic_report");
        AlertDialog previous = ShadowAlertDialog.getLatestAlertDialog();
        dialog.dismissAllowingStateLoss();
        controller.get().getFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();
        assertNull(page.getView());
        assertTrue(export.getOnPreferenceClickListener().onPreferenceClick(export));
        assertSame("a detached row opened another report chooser", previous,
                ShadowAlertDialog.getLatestAlertDialog());
    }

    private void checkInsets(boolean rtl) throws Exception {
        assertEquals(36, RuntimeEnvironment.getApplication().getApplicationInfo().targetSdkVersion);
        controller = Robolectric.buildActivity(Activity.class).setup().visible();
        dialog = new SettingsDialog();
        dialog.show(controller.get().getFragmentManager(), "boundary_settings");
        controller.get().getFragmentManager().executePendingTransactions();
        // The standalone test host's window is not Instagram's RTL window. Supply that host
        // direction, as SettingsScreenRowLayoutTest does; the dialog's children must inherit it.
        assertEquals(rtl ? View.LAYOUT_DIRECTION_RTL : View.LAYOUT_DIRECTION_LTR,
                controller.get().getResources().getConfiguration().getLayoutDirection());
        dialog.getDialog().getWindow().getDecorView().setLayoutDirection(
                rtl ? View.LAYOUT_DIRECTION_RTL : View.LAYOUT_DIRECTION_LTR);
        ShadowLooper.idleMainLooper();
        ViewGroup root = (ViewGroup) dialog.getView();
        assertNotNull(root);
        WindowInsets bars = Build.VERSION.SDK_INT >= 30
                ? new WindowInsets.Builder().setInsets(WindowInsets.Type.systemBars(), Insets.of(11, 24, 13, 30)).build()
                : WindowInsets.class.getConstructor(Rect.class).newInstance(new Rect(11, 24, 13, 30));
        root.dispatchApplyWindowInsets(bars);
        root.measure(View.MeasureSpec.makeMeasureSpec(640, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(1280, View.MeasureSpec.EXACTLY));
        root.layout(0, 0, 640, 1280);
        assertEquals(11, root.getPaddingLeft());
        assertEquals(24, root.getPaddingTop());
        assertEquals(13, root.getPaddingRight());
        assertEquals(30, root.getPaddingBottom());
        ViewGroup header = (ViewGroup) root.getChildAt(0);
        View back = header.getChildAt(0);
        TextView title = (TextView) header.getChildAt(1);
        assertEquals("HushGram", String.valueOf(title.getText()));
        assertEquals(0, title.getLayout().getEllipsisCount(0));
        assertEquals(title.getText().length(), title.getLayout().getLineEnd(title.getLineCount() - 1));
        assertTrue(title.getHeight() >= title.getLayout().getHeight());
        assertTrue(title.getBottom() <= header.getHeight() - header.getPaddingBottom());
        assertTrue(back.getWidth() >= 96);
        assertTrue(back.getHeight() >= 96);
        assertEquals(rtl ? View.LAYOUT_DIRECTION_RTL : View.LAYOUT_DIRECTION_LTR, header.getLayoutDirection());
        assertTrue(rtl ? title.getRight() <= back.getLeft() : back.getRight() <= title.getLeft());
        View container = root.findViewById(SettingsDialog.CONTAINER_ID);
        assertTrue(container.getBottom() <= root.getHeight() - root.getPaddingBottom());
    }
}
