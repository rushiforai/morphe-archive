/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.facebook.settings.PatchFamily;
import app.morphe.extension.facebook.settings.PatchFamilyForTests;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Share sheet items: the picked types come out of every list in Facebook's order, Hide Meta upsells'
 * Threads switch runs first only when that patch is in, the types a sheet offers are written down
 * once each and capped, and off, paused or with nothing picked the list goes through as it came.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ShareSheetItemsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Stands in for Facebook's enum of share sheet items, which names its constants the same way. */
    private enum ShareItem { SHARE_NOW, SHARE_TO_THREADS, OFF_PLATFORM_WHATSAPP, COPY_LINK }

    private static final List<ShareItem> ITEMS = Collections.unmodifiableList(Arrays.asList(ShareItem.values()));

    @After
    public void restore() {
        PatchFamilyForTests.reset();
        PauseForTests.resume();
        Settings.HIDDEN_SHARE_ITEMS.resetToDefault();
        Settings.SEEN_SHARE_ITEMS.resetToDefault();
        Settings.HIDE_THREADS_SHARE_BUTTON.resetToDefault();
        ShareSheetItems.forgetForTests();
        HookStatus.clear();
    }

    @Test
    public void nothingPickedTheSheetIsFacebooksAndItsTypesAreWrittenDown() {
        PatchFamilyForTests.carry(PatchFamily.SHARE_SHEET_ITEMS);
        assertSame(ITEMS, ShareSheetItems.targets(ITEMS));
        assertEquals("SHARE_NOW,SHARE_TO_THREADS,OFF_PLATFORM_WHATSAPP,COPY_LINK",
                Settings.SEEN_SHARE_ITEMS.savedValue());
    }

    @Test
    public void pickedItemsComeOutAndTheRestKeepTheirOrder() {
        PatchFamilyForTests.carry(PatchFamily.SHARE_SHEET_ITEMS);
        ShareSheetItems.hide(Arrays.asList("COPY_LINK", "SHARE_NOW"));
        assertEquals(Arrays.asList(ShareItem.SHARE_TO_THREADS, ShareItem.OFF_PLATFORM_WHATSAPP),
                ShareSheetItems.targets(ITEMS));
        ShareSheetItems.hide(Collections.singletonList("SEND_IN_SMS"));
        assertSame("a sheet with none of the picked items was copied", ITEMS, ShareSheetItems.targets(ITEMS));
    }

    /** The Threads switch belongs to Hide Meta upsells, and the picks to Share sheet items. */
    @Test
    public void eachPatchRunsOnlyItsOwnRule() {
        Settings.HIDE_THREADS_SHARE_BUTTON.save(true);
        ShareSheetItems.hide(Collections.singletonList("COPY_LINK"));

        PatchFamilyForTests.carry(PatchFamily.SHARE_SHEET_ITEMS);
        assertEquals(Arrays.asList(ShareItem.SHARE_NOW, ShareItem.SHARE_TO_THREADS, ShareItem.OFF_PLATFORM_WHATSAPP),
                ShareSheetItems.targets(ITEMS));

        PatchFamilyForTests.carry(PatchFamily.META_UPSELLS);
        assertEquals(Arrays.asList(ShareItem.SHARE_NOW, ShareItem.OFF_PLATFORM_WHATSAPP, ShareItem.COPY_LINK),
                ShareSheetItems.targets(ITEMS));

        PatchFamilyForTests.carry(PatchFamily.META_UPSELLS, PatchFamily.SHARE_SHEET_ITEMS);
        assertEquals(Arrays.asList(ShareItem.SHARE_NOW, ShareItem.OFF_PLATFORM_WHATSAPP),
                ShareSheetItems.targets(ITEMS));
    }

    @Test
    public void outOfTheBuildOrPausedTheSheetIsFacebooks() {
        ShareSheetItems.hide(Collections.singletonList("COPY_LINK"));
        PatchFamilyForTests.carry();
        assertSame(ITEMS, ShareSheetItems.targets(ITEMS));
        assertEquals("a build without the patch wrote types down", "", Settings.SEEN_SHARE_ITEMS.savedValue());

        PatchFamilyForTests.carry(PatchFamily.SHARE_SHEET_ITEMS);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertSame(ITEMS, ShareSheetItems.targets(ITEMS));
        PauseForTests.resume();
        assertEquals(3, ShareSheetItems.targets(ITEMS).size());
    }

    @Test
    public void emptyOrMissingListsGoThrough() {
        PatchFamilyForTests.carry(PatchFamily.SHARE_SHEET_ITEMS);
        List<ShareItem> none = Collections.emptyList();
        assertSame(none, ShareSheetItems.targets(none));
        assertEquals(null, ShareSheetItems.targets(null));
    }

    @Test
    public void theWrittenDownTypesStayInOrderOnceEachAndStopAtTheLimit() {
        PatchFamilyForTests.carry(PatchFamily.SHARE_SHEET_ITEMS);
        ShareSheetItems.targets(Arrays.asList(ShareItem.COPY_LINK, ShareItem.SHARE_NOW));
        ShareSheetItems.targets(ITEMS);
        assertEquals("COPY_LINK,SHARE_NOW,SHARE_TO_THREADS,OFF_PLATFORM_WHATSAPP", Settings.SEEN_SHARE_ITEMS.savedValue());

        List<String> full = new ArrayList<>();
        for (int i = 0; i < ShareSheetItems.SEEN_LIMIT; i++) full.add("TYPE_" + i);
        Settings.SEEN_SHARE_ITEMS.save(String.join(",", full));
        ShareSheetItems.forgetForTests();
        ShareSheetItems.targets(ITEMS);
        assertEquals(String.join(",", full), Settings.SEEN_SHARE_ITEMS.savedValue());
    }

    @Test
    public void theListShowsSeenTypesThenCommonOnesThenEarlierPicksEachOnce() {
        Settings.SEEN_SHARE_ITEMS.save("SHARE_TO_COWATCH,COPY_LINK");
        ShareSheetItems.hide(Arrays.asList("SHARE_TO_HATCH", "COPY_LINK"));
        List<String> choices = ShareSheetItems.choices();
        assertEquals(Arrays.asList("SHARE_TO_COWATCH", "COPY_LINK"), choices.subList(0, 2));
        assertEquals("SHARE_TO_HATCH", choices.get(choices.size() - 1));
        assertEquals(2 + ShareSheetItems.COMMON.size(), choices.size());
    }

    @Test
    public void savedListsKeepOnlyTypes() {
        assertEquals(Arrays.asList("COPY_LINK", "SHARE_NOW"),
                new ArrayList<>(ShareSheetItems.parse(" COPY_LINK, ,lower,SHARE_NOW,COPY_LINK,A-B")));
        ShareSheetItems.hide(Arrays.asList("nope", "COPY_LINK", "COPY_LINK"));
        assertEquals("COPY_LINK", Settings.HIDDEN_SHARE_ITEMS.savedValue());
    }

    @Test
    public void labelsUseFacebooksWordsTheAppsOwnNamesOrTheTypeInWords() {
        assertEquals("Copy link", ShareSheetItems.label("COPY_LINK"));
        assertEquals("WhatsApp", ShareSheetItems.label("SEND_IN_WHATSAPP"));
        assertEquals("WhatsApp", ShareSheetItems.label("OFF_PLATFORM_WHATSAPP"));
        assertEquals("Share to cowatch", ShareSheetItems.label("SHARE_TO_COWATCH"));
    }
}
