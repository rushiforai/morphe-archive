/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class CaptionOrderTest {
    private static final Object PROVIDER = new Object();

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.CAPTION_ORDER);
        Settings.CAPTION_ORDER.resetToDefault();
        CaptionOrder.after(null, 0);
        HookStatus.clear();
    }

    private static ArrayList<Object> order(Object... keys) {
        return new ArrayList<>(Arrays.asList(keys));
    }

    @Test public void aNewFirstPhotoAsksForItsCaption() {
        assertTrue(Settings.CAPTION_ORDER.get());
        ArrayList<Object> order = order(1, 2, 3);
        CaptionOrder.before(order, 0, PROVIDER);
        order.remove(0);
        assertSame(PROVIDER, CaptionOrder.after(order, 0));
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.CAPTION_ORDER));

        // A drag that puts another photo in front.
        CaptionOrder.before(order, 0, PROVIDER);
        Collections.swap(order, 0, 1);
        assertSame(PROVIDER, CaptionOrder.after(order, 0));

        // Unpicking the last photo.
        order = order(7);
        CaptionOrder.before(order, 0, PROVIDER);
        order.clear();
        assertSame(PROVIDER, CaptionOrder.after(order, 0));
    }

    @Test public void theSameFirstPhotoLeavesTheFieldAlone() {
        ArrayList<Object> order = order(1, 2, 3);
        CaptionOrder.before(order, 0, PROVIDER);
        order.remove(2);
        order.add(4);
        assertNull(CaptionOrder.after(order, 0));

        // The first photo unpicked and picked again in one change.
        CaptionOrder.before(order, 0, PROVIDER);
        order.remove(0);
        order.add(0, 1);
        assertNull(CaptionOrder.after(order, 0));
    }

    @Test public void oneCaptionForAllPhotosStaysInTheField() {
        ArrayList<Object> order = order(1, 2);
        CaptionOrder.before(order, 1, PROVIDER);
        order.remove(0);
        assertNull(CaptionOrder.after(order, 1));
    }

    @Test public void aChangeBetweenOneCaptionAndOwnCaptionsStillReloads() {
        // Undo of a removal in the preview: one caption for the photo left, then that photo and
        // the captioned one put back in front of it.
        ArrayList<Object> order = order(2);
        CaptionOrder.before(order, 1, PROVIDER);
        order.add(0, 1);
        assertSame(PROVIDER, CaptionOrder.after(order, 0));

        // Own captions until the change leaves one caption for all.
        CaptionOrder.before(order, 0, PROVIDER);
        order.remove(0);
        assertSame(PROVIDER, CaptionOrder.after(order, 1));

        // Across modes, the same first photo still leaves the field alone.
        CaptionOrder.before(order, 1, PROVIDER);
        order.add(3);
        assertNull(CaptionOrder.after(order, 0));
    }

    @Test public void eachChangeAnswersOnce() {
        ArrayList<Object> order = order(1, 2);
        CaptionOrder.before(order, 0, PROVIDER);
        order.remove(0);
        assertSame(PROVIDER, CaptionOrder.after(order, 0));
        assertNull("answered once", CaptionOrder.after(order, 0));

        // An inner change (unpicking past the limit while adding) answers for itself, and the
        // outer one then has nothing left to answer.
        order = order(1, 2);
        CaptionOrder.before(order, 0, PROVIDER);
        CaptionOrder.before(order, 0, PROVIDER);
        order.remove(0);
        assertSame(PROVIDER, CaptionOrder.after(order, 0));
        assertNull(CaptionOrder.after(order, 0));

        // Nothing to answer without a provider or a first photo.
        CaptionOrder.before(order(1), 0, null);
        assertNull(CaptionOrder.after(order(), 0));
        CaptionOrder.before(order(), 0, PROVIDER);
        assertNull(CaptionOrder.after(order(1), 0));
        CaptionOrder.before(null, 0, PROVIDER);
        assertNull(CaptionOrder.after(order(1), 0));
    }

    @Test public void offPausedOrUnreadableTelegramGoesOnAsBefore() {
        Settings.CAPTION_ORDER.save(false);
        ArrayList<Object> order = order(1, 2);
        CaptionOrder.before(order, 0, PROVIDER);
        assertNull(CaptionOrder.after(order(2), 0));

        Settings.CAPTION_ORDER.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            CaptionOrder.before(order, 0, PROVIDER);
            assertNull(reason.name(), CaptionOrder.after(order(2), 0));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> {
            CaptionOrder.before(order, 0, PROVIDER);
            assertNull(CaptionOrder.after(order(2), 0));
        });
        SettingReadsForTests.breakReads(Settings.CAPTION_ORDER);
        CaptionOrder.before(order, 0, PROVIDER);
        assertNull(CaptionOrder.after(order(2), 0));
        assertFalse(HookStatus.missing(FamilyNames.CAPTION_ORDER).isEmpty());
    }
}
