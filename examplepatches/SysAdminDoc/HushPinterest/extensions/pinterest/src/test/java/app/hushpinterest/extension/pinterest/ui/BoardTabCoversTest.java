/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ListAdapter;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.TimeUnit;

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
import org.robolectric.util.ReflectionHelpers;

import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/** The picture at the top of a board tab: Pinterest's, or the one chosen for that board (#42). */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class BoardTabCoversTest {
    private static final String BOARD = "1234";
    private static final String STOCK = "https://i.pinimg.com/stock.jpg";
    private static final String PICKED = "https://i.pinimg.com/picked.jpg";

    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    private FrameLayout header;
    private ImageView image;
    private GradientDrawable fade;

    private void build(Context context) {
        FrameLayout tab = new FrameLayout(context);
        header = new FrameLayout(context);
        image = new ImageView(context);
        ImageView overlay = new ImageView(context);
        fade = new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[]{0, 0xFF111111});
        overlay.setBackground(fade);
        header.addView(image);
        header.addView(overlay);
        tab.addView(header);
        BoardTabs.remember(tab, BOARD);
    }

    @Before public void tab() {
        build(RuntimeEnvironment.getApplication());
        Settings.BOARD_TAB_COVERS.save(true);
    }

    @After public void restore() {
        Settings.BOARD_TAB_COVERS.resetToDefault();
        BoardTabCovers.COVERS.resetToDefault();
        BoardTabCovers.clearPinPick();
        HookStatus.clear();
    }

    private void assertBlack() {
        assertTrue(image.getDrawable() instanceof ColorDrawable);
        assertEquals(Color.BLACK, ((ColorDrawable) image.getDrawable()).getColor());
    }

    @Test public void withNoChoicePinterestsPictureLoads() {
        assertEquals(STOCK, BoardTabCovers.coverUrl(image, STOCK));
        assertNull(image.getDrawable());
    }

    @Test public void anImageOutsideABoardTabIsLeftAlone() {
        BoardTabCovers.store(BOARD, BoardTabCovers.BLACK, null);
        ImageView other = new ImageView(RuntimeEnvironment.getApplication());
        assertEquals(STOCK, BoardTabCovers.coverUrl(other, STOCK));
        assertNull(other.getDrawable());
    }

    @Test public void withTheSwitchOffAChoiceIsIgnored() {
        BoardTabCovers.store(BOARD, BoardTabCovers.BLACK, null);
        Settings.BOARD_TAB_COVERS.save(false);
        assertEquals(STOCK, BoardTabCovers.coverUrl(image, STOCK));
        assertNull(image.getDrawable());
        assertFalse("the off state adds no long press", header.isLongClickable());
    }

    @Test public void aKeptPictureLoadsInsteadOfANewOne() {
        BoardTabCovers.store(BOARD, BoardTabCovers.URL, PICKED);
        assertEquals(PICKED, BoardTabCovers.coverUrl(image, STOCK));
    }

    @Test public void noImageIsPlainBlackWithNothingLoading() {
        BoardTabCovers.store(BOARD, BoardTabCovers.BLACK, null);
        assertNull(BoardTabCovers.coverUrl(image, STOCK));
        assertBlack();
    }

    private static final ColorFilter SHADE = new PorterDuffColorFilter(0x80333333, PorterDuff.Mode.SRC_ATOP);

    private static void assertPaintsBlack(ColorFilter filter) {
        assertTrue("a plain color filter paints it", filter instanceof PorterDuffColorFilter);
        assertEquals(Color.BLACK, (int) ReflectionHelpers.<Integer>callInstanceMethod(filter, "getColor"));
        assertEquals(PorterDuff.Mode.SRC_ATOP, ReflectionHelpers.callInstanceMethod(filter, "getMode"));
    }

    private void assertShadeIsBlack() {
        assertPaintsBlack(image.getColorFilter());
        assertPaintsBlack(fade.getColorFilter());
    }

    private void goBlack() {
        image.setColorFilter(SHADE);
        BoardTabCovers.store(BOARD, BoardTabCovers.BLACK, null);
        assertNull(BoardTabCovers.coverUrl(image, STOCK));
    }

    @Test public void noImageIsBlackThroughPinterestsShade() {
        goBlack();
        assertBlack();
        assertShadeIsBlack();
    }

    private void assertPinterestsLook() {
        assertSame(SHADE, image.getColorFilter());
        assertNull("the fade is Pinterest's again", fade.getColorFilter());
    }

    @Test public void pinterestsPictureGetsItsShadeBack() {
        goBlack();
        BoardTabCovers.store(BOARD, null, null);
        assertEquals(STOCK, BoardTabCovers.coverUrl(image, STOCK));
        assertPinterestsLook();
    }

    @Test public void aChosenPictureGetsTheShadeBack() {
        goBlack();
        BoardTabCovers.store(BOARD, BoardTabCovers.URL, PICKED);
        assertEquals(PICKED, BoardTabCovers.coverUrl(image, STOCK));
        assertPinterestsLook();
    }

    @Test public void aPhotoGetsTheShadeBack() {
        goBlack();
        BoardTabCovers.store(BOARD, BoardTabCovers.FILE, "1234");
        assertNull(BoardTabCovers.coverUrl(image, STOCK));
        assertPinterestsLook();
    }

    @Test public void turningTheSwitchOffBringsTheShadeBack() {
        goBlack();
        Settings.BOARD_TAB_COVERS.save(false);
        assertEquals(STOCK, BoardTabCovers.coverUrl(image, STOCK));
        assertPinterestsLook();
    }

    @Test public void anOverlayShowingAPictureIsNotTheFade() {
        ImageView badge = new ImageView(RuntimeEnvironment.getApplication());
        GradientDrawable backdrop = new GradientDrawable();
        badge.setBackground(backdrop);
        badge.setImageDrawable(new ColorDrawable(Color.RED));
        header.removeViewAt(1);
        header.addView(badge);
        goBlack();
        assertNull(backdrop.getColorFilter());
    }

    @Test public void repeatedBindsStillRestoreTheOriginalShade() {
        goBlack();
        assertNull(BoardTabCovers.coverUrl(image, STOCK));
        assertNull(BoardTabCovers.coverUrl(image, STOCK));
        assertShadeIsBlack();
        BoardTabCovers.store(BOARD, null, null);
        BoardTabCovers.coverUrl(image, STOCK);
        assertSame(SHADE, image.getColorFilter());
    }

    @Test public void aShadePinterestDroppedStaysDropped() {
        goBlack();
        image.setColorFilter((ColorFilter) null);
        assertNull(BoardTabCovers.coverUrl(image, STOCK));
        assertShadeIsBlack();
        BoardTabCovers.store(BOARD, null, null);
        BoardTabCovers.coverUrl(image, STOCK);
        assertNull(image.getColorFilter());
    }

    @Test public void withNoChoiceTheShadeIsLeftAlone() {
        image.setColorFilter(SHADE);
        assertEquals(STOCK, BoardTabCovers.coverUrl(image, STOCK));
        assertSame(SHADE, image.getColorFilter());
    }

    @Test public void aPhotoShowsBlackUntilItIsRead() {
        BoardTabCovers.store(BOARD, BoardTabCovers.FILE, "1234");
        assertNull(BoardTabCovers.coverUrl(image, STOCK));
        assertBlack();
    }

    @Test public void anotherBoardsChoiceDoesNotApply() {
        BoardTabCovers.store("other", BoardTabCovers.BLACK, null);
        assertEquals(STOCK, BoardTabCovers.coverUrl(image, STOCK));
    }

    @Test public void aDamagedListCountsAsNoChoice() {
        BoardTabCovers.COVERS.save("not json");
        assertEquals(STOCK, BoardTabCovers.coverUrl(image, STOCK));
        BoardTabCovers.store(BOARD, BoardTabCovers.URL, PICKED);
        assertEquals(PICKED, BoardTabCovers.coverUrl(image, STOCK));
    }

    @Test public void goingBackToPinterestEmptiesTheList() {
        BoardTabCovers.store(BOARD, BoardTabCovers.BLACK, null);
        BoardTabCovers.store(BOARD, null, null);
        assertEquals("", BoardTabCovers.COVERS.savedValue());
    }

    private interface MenuCheck {
        void run() throws Exception;
    }

    private void onActivity(MenuCheck check) throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            build(controller.get());
            check.run();
        }
    }

    private AlertDialog longPress() {
        assertTrue(header.performLongClick());
        ShadowLooper.idleMainLooper();
        return ShadowAlertDialog.getLatestAlertDialog();
    }

    private static List<String> rows(AlertDialog dialog) {
        ListAdapter adapter = dialog.getListView().getAdapter();
        List<String> shown = new ArrayList<>();
        for (int index = 0; index < adapter.getCount(); index++) shown.add(String.valueOf(adapter.getItem(index)));
        return shown;
    }

    private static void pick(AlertDialog dialog, String row) {
        int index = rows(dialog).indexOf(row);
        assertTrue(row, index >= 0);
        dialog.getListView().performItemClick(null, index, index);
        ShadowLooper.idleMainLooper();
    }

    @Test public void aLongPressCanKeepTheCurrentPicture() throws Exception {
        onActivity(() -> {
            assertEquals(STOCK, BoardTabCovers.coverUrl(image, STOCK));
            AlertDialog dialog = longPress();
            assertEquals(Arrays.asList("Keep this picture", "Image from phone", "No image"), rows(dialog));
            pick(dialog, "Keep this picture");
            assertEquals(STOCK, BoardTabCovers.coverUrl(image, "https://i.pinimg.com/next.jpg"));
        });
    }

    @Test public void aLongPressCanGoBlackAndBack() throws Exception {
        onActivity(() -> {
            image.setColorFilter(SHADE);
            BoardTabCovers.coverUrl(image, STOCK);
            pick(longPress(), "No image");
            assertBlack();
            assertShadeIsBlack();
            AlertDialog dialog = longPress();
            assertEquals(Arrays.asList("Image from phone", "No image", "Pinterest's choice"), rows(dialog));
            pick(dialog, "Pinterest's choice");
            assertSame("the picture's shade is back at once", SHADE, image.getColorFilter());
            assertEquals(STOCK, BoardTabCovers.coverUrl(image, STOCK));
        });
    }

    @Test public void aPinPickLastsTenMinutes() {
        assertFalse(BoardTabCovers.pickingPin());
        BoardTabCovers.startPinPick(image, BOARD);
        assertTrue(BoardTabCovers.pickingPin());
        ShadowLooper.idleMainLooper(11, TimeUnit.MINUTES);
        assertFalse(BoardTabCovers.pickingPin());
    }

    @Test public void aPinPickEndsWithTheSwitch() {
        BoardTabCovers.startPinPick(image, BOARD);
        Settings.BOARD_TAB_COVERS.save(false);
        assertFalse(BoardTabCovers.pickingPin());
    }

    @Test public void thePickedPinBecomesTheBoardsCover() {
        BoardTabCovers.startPinPick(image, BOARD);
        BoardTabCovers.usePin(PICKED);
        assertFalse(BoardTabCovers.pickingPin());
        assertEquals(PICKED, BoardTabCovers.coverUrl(image, STOCK));
    }

    @Test public void aPinWithoutAPickChangesNothing() {
        BoardTabCovers.usePin(PICKED);
        assertEquals("", BoardTabCovers.COVERS.savedValue());
    }

    @Test public void aFileOverTheCapIsRefused() throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        assertFalse(BoardTabCovers.copyCapped(new ByteArrayInputStream(new byte[11]), out, 10));
        out.reset();
        assertTrue(BoardTabCovers.copyCapped(new ByteArrayInputStream(new byte[10]), out, 10));
        assertArrayEquals(new byte[10], out.toByteArray());
    }

    @Test public void aFileNameKeepsOnlySafeCharacters() {
        assertEquals("12_34-a_", BoardTabCovers.safeName("12/34-a."));
    }
}
