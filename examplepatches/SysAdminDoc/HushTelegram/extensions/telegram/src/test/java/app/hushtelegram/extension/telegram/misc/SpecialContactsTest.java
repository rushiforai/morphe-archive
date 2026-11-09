/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static app.hushtelegram.extension.telegram.misc.SpecialContactsStore.*;
import static org.junit.Assert.*;

import android.content.Context;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;

import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.Executor;
import java.util.function.IntSupplier;
import java.util.function.LongPredicate;
import java.util.function.LongSupplier;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
import app.hushtelegram.extension.telegram.settings.Settings;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowToast;
import org.telegram.tgnet.TLRPC;
import org.telegram.tgnet.tl.TL_update;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = {SpecialContactsTest.NativeMenu.class},
        instrumentedPackages = "app.hushtelegram.extension.telegram.misc")
public class SpecialContactsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    @Rule public final TemporaryFolder folder = new TemporaryFolder();

    /** The fixture test checks the real menu bridge; this one adds a plain row to a plain menu. */
    @Implements(value = LocalIds.class, isInAndroidSdk = false)
    public static class NativeMenu {
        static int dismisses;
        @Implementation protected static View nativeAddRow(Object menu, String text) {
            TextView row = new TextView(((View) menu).getContext());
            row.setText(text);
            ((FrameLayout) menu).addView(row);
            return row;
        }
        @Implementation protected static void nativeDismiss(Object menu) { dismisses++; }
    }

    private static final long NOW = 1_700_000_000_000L;
    private static final long SECONDS = NOW / 1000;

    private Executor work;
    private IntSupplier account;
    private LongPredicate mine;
    private LongSupplier clock;
    private SpecialContacts.Users users;
    private SpecialContactsStore before;

    private SpecialContactsStore store;
    private TLRPC.User cached;
    private SpecialContactsForTests.Controller controller;

    @Before public void swap() throws IOException {
        work = SpecialContacts.work;
        account = SpecialContacts.account;
        mine = SpecialContacts.mine;
        clock = SpecialContacts.clock;
        users = SpecialContacts.users;
        before = SpecialContacts.store;

        store = new SpecialContactsStore(folder.newFolder("special"));
        SpecialContacts.store = store;
        SpecialContacts.work = Runnable::run;
        SpecialContacts.account = () -> 0;
        SpecialContacts.mine = id -> id == 1;
        SpecialContacts.clock = () -> NOW;
        cached = user(42, "Ann", "Lee");
        SpecialContacts.users = (shown, id) -> id == 42 ? cached : null;
        controller = new SpecialContactsForTests.Controller();
        PatchFamilyForTests.installed(PatchFamily.Capability.SPECIAL_CONTACTS);
        Settings.SPECIAL_CONTACTS.save(true);
    }

    @After public void restore() {
        SpecialContacts.work = work;
        SpecialContacts.account = account;
        SpecialContacts.mine = mine;
        SpecialContacts.clock = clock;
        SpecialContacts.users = users;
        SpecialContacts.store = before;
        PatchFamilyForTests.resetCapabilities();
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.SPECIAL_CONTACTS);
        Settings.SPECIAL_CONTACTS.resetToDefault();
        NativeMenu.dismisses = 0;
        HookStatus.clear();
    }

    // ---- The switch and the profile menu -------------------------------------------------------

    @Test public void offByDefaultNothingIsAddedOrRecorded() throws Exception {
        Settings.SPECIAL_CONTACTS.resetToDefault();
        assertFalse(Settings.SPECIAL_CONTACTS.get());
        assertEquals(0, rows(42, 0).getChildCount());
        track(42);
        SpecialContacts.user(controller, user(42, "Ann", "Smith"), 0);
        SpecialContacts.updates(controller, Collections.singletonList(typing(42)));
        assertEquals(Collections.singletonList(TRACKED), kinds(42));
    }

    @Test public void onlyAUsersProfileGetsTheRow() {
        FrameLayout menu = rows(42, 0);
        assertEquals(1, menu.getChildCount());
        TextView row = (TextView) menu.getChildAt(0);
        assertEquals("Track this user", row.getText().toString());
        assertEquals("Track this user", String.valueOf(row.getContentDescription()));
        assertEquals("a chat", 0, rows(0, 5).getChildCount());
        assertEquals("your own account", 0, rows(1, 0).getChildCount());
        SpecialContacts.account = () -> -1;
        assertEquals("no account showing", 0, rows(42, 0).getChildCount());
        SpecialContacts.account = () -> 0;
        PatchFamilyForTests.installed();
        assertEquals("a build without the hooks", 0, rows(42, 0).getChildCount());
    }

    @Test public void tappingTheRowTracksAndTappingAgainStops() throws Exception {
        TextView row = (TextView) rows(42, 0).getChildAt(0);
        assertTrue(row.performClick());
        assertEquals("Tracking this user", ShadowToast.getTextOfLatestToast());
        assertEquals(1, NativeMenu.dismisses);
        assertTrue(store.trackedNow(0, 42));
        assertEquals(Collections.singletonList(TRACKED), kinds(42));
        row.getViewTreeObserver().dispatchOnPreDraw();
        assertEquals("Stop tracking", row.getText().toString());
        assertEquals("Stop tracking", String.valueOf(row.getContentDescription()));
        assertEquals("Stop tracking", ((TextView) rows(42, 0).getChildAt(0)).getText().toString());

        // Telegram's stored copy was taken as how they look now, so a new name is a change.
        SpecialContacts.user(controller, user(42, "Ann", "Smith"), 0);
        assertEquals(Arrays.asList(NAME, TRACKED), kinds(42));
        assertEquals("Ann Lee\nAnn Smith", store.history(0, 42).get(0).detail);

        assertTrue(row.performClick());
        assertEquals("Stopped tracking", ShadowToast.getTextOfLatestToast());
        assertFalse(store.trackedNow(0, 42));
        row.getViewTreeObserver().dispatchOnPreDraw();
        assertEquals("Track this user", row.getText().toString());
    }

    @Test public void aFullListOrAFailedSaveSaysSo() throws IOException {
        for (long id = 100; id < 100 + MAX_PEOPLE; id++) store.track(0, id, null, NOW);
        assertTrue(rows(42, 0).getChildAt(0).performClick());
        assertEquals("You can track up to 50 people", ShadowToast.getTextOfLatestToast());
        assertFalse(store.trackedNow(0, 42));

        SpecialContacts.store = new SpecialContactsStore(folder.newFile("not a folder"));
        assertTrue(rows(42, 0).getChildAt(0).performClick());
        assertEquals("Couldn't start tracking", ShadowToast.getTextOfLatestToast());
        assertFalse(SpecialContacts.store.trackedNow(0, 42));
    }

    @Test public void aSwitchChangePauseOrAnUnreadableSwitchHidesTheRow() {
        View row = rows(42, 0).getChildAt(0);
        Settings.SPECIAL_CONTACTS.save(false);
        row.getViewTreeObserver().dispatchOnPreDraw();
        assertEquals(View.GONE, row.getVisibility());
        assertTrue(row.performClick());
        assertFalse(store.trackedNow(0, 42));
        assertEquals(0, NativeMenu.dismisses);
        Settings.SPECIAL_CONTACTS.save(true);
        row.getViewTreeObserver().dispatchOnPreDraw();
        assertEquals(View.VISIBLE, row.getVisibility());
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertEquals(reason.name(), 0, rows(42, 0).getChildCount());
            row.getViewTreeObserver().dispatchOnPreDraw();
            assertEquals(reason.name(), View.GONE, row.getVisibility());
            PauseForTests.resume();
            row.getViewTreeObserver().dispatchOnPreDraw();
            assertEquals(View.VISIBLE, row.getVisibility());
        }
        SettingsContextRule.withoutContext(() -> assertEquals(0, rows(42, 0).getChildCount()));
        SettingReadsForTests.breakReads(Settings.SPECIAL_CONTACTS);
        assertEquals(0, rows(42, 0).getChildCount());
    }

    // ---- The hooks ------------------------------------------------------------------------------

    @Test public void theUserHookRecordsChangesForTrackedPeopleOnly() throws Exception {
        track(42);
        SpecialContacts.user(controller, user(42, "Ann", "Smith"), 0);
        assertEquals(Arrays.asList(NAME, TRACKED), kinds(42));
        // Telegram's own stored copy can be older than what was seen.
        SpecialContacts.user(controller, user(42, "Ann", "Old"), 1);
        TLRPC.User offline = user(42, "Ann", "Smith");
        offline.status = new TLRPC.TL_userStatusOffline();
        offline.status.expires = (int) SECONDS - 60;
        SpecialContacts.user(controller, offline, 0);
        assertEquals(Arrays.asList(OFFLINE_AT, NAME, TRACKED), kinds(42));
        assertEquals(Long.toString(SECONDS - 60), store.history(0, 42).get(0).detail);

        // Someone not tracked, tracked on another account, a min or empty user: nothing.
        SpecialContacts.user(controller, user(43, "Bob", "Ray"), 0);
        assertTrue(store.history(0, 43).isEmpty());
        controller.currentAccount = 1;
        SpecialContacts.user(controller, user(42, "Ann", "Lee"), 0);
        controller.currentAccount = 0;
        TLRPC.User min = user(42, "Ann", "Min");
        min.min = true;
        SpecialContacts.user(controller, min, 0);
        TLRPC.TL_userEmpty empty = new TLRPC.TL_userEmpty();
        empty.id = 42;
        SpecialContacts.user(controller, empty, 0);
        SpecialContacts.user(null, user(42, "Ann", "Null"), 0);
        SpecialContacts.user(controller, null, 0);
        SpecialContacts.user(controller, new Object(), 0);
        assertEquals(Arrays.asList(OFFLINE_AT, NAME, TRACKED), kinds(42));
    }

    @Test public void theUpdateHookReadsStatusNamePhoneAndTyping() throws Exception {
        track(42);
        List<Object> updates = new ArrayList<>();
        TL_update.TL_updateUserStatus online = new TL_update.TL_updateUserStatus();
        online.user_id = 42;
        online.status = new TLRPC.TL_userStatusOnline();
        online.status.expires = (int) SECONDS + 300;
        updates.add(online);
        TL_update.TL_updateUserName name = new TL_update.TL_updateUserName();
        name.user_id = 42;
        name.first_name = "Ann";
        name.last_name = "Smith";
        name.usernames.add(username("annie", true));
        name.usernames.add(username("old_ann", false));
        updates.add(name);
        TL_update.TL_updateUserPhone phone = new TL_update.TL_updateUserPhone();
        phone.user_id = 42;
        phone.phone = "15550002";
        updates.add(phone);
        updates.add(null);
        updates.add(new TL_update.TL_updateEditMessage());
        SpecialContacts.updates(controller, updates);
        assertEquals(Arrays.asList(PHONE, USERNAME, NAME, ONLINE_NOW, TRACKED), kinds(42));
        List<Event> history = store.history(0, 42);
        assertEquals("15550001\n15550002", history.get(0).detail);
        assertEquals("@ann\n@annie", history.get(1).detail);
        assertEquals("Ann Lee\nAnn Smith", history.get(2).detail);

        TL_update.TL_updateChatUserTyping group = new TL_update.TL_updateChatUserTyping();
        group.chat_id = 5;
        group.from_id = peer(42);
        group.action = new TLRPC.TL_sendMessageTypingAction();
        TL_update.TL_updateChannelUserTyping channel = new TL_update.TL_updateChannelUserTyping();
        channel.channel_id = 9;
        channel.from_id = peer(42);
        channel.action = new TLRPC.TL_sendMessageTypingAction();
        TL_update.TL_updateUserTyping voice = typing(42);
        voice.action = new TLRPC.TL_sendMessageRecordAudioAction();
        TL_update.TL_updateUserTyping cancel = typing(42);
        cancel.action = new TLRPC.TL_sendMessageCancelAction();
        SpecialContacts.updates(controller, Arrays.asList(typing(42), group, channel, voice, cancel, typing(42)));
        history = store.history(0, 42);
        assertEquals(Arrays.asList(TYPING, TYPING, TYPING), kinds(history.subList(0, 3)));
        assertEquals(Arrays.asList("Group 9", "Group 5", ""), Arrays.asList(history.get(0).detail, history.get(1).detail, history.get(2).detail));
        assertEquals(Arrays.asList(5L, 9L), controller.asked);
    }

    @Test public void theUpdateHookLeavesEveryoneElseAlone() throws Exception {
        track(42);
        TL_update.TL_updateChatUserTyping group = new TL_update.TL_updateChatUserTyping();
        group.chat_id = 5;
        group.from_id = peer(43);
        group.action = new TLRPC.TL_sendMessageTypingAction();
        TL_update.TL_updateUserName name = new TL_update.TL_updateUserName();
        name.user_id = 43;
        name.first_name = "Bob";
        SpecialContacts.updates(controller, Arrays.asList(typing(43), group, name));
        controller.currentAccount = 1;
        SpecialContacts.updates(controller, Collections.singletonList(typing(42)));
        controller.currentAccount = 0;
        SpecialContacts.updates(controller, "not a list");
        SpecialContacts.updates(null, Collections.singletonList(typing(42)));
        assertEquals(Collections.singletonList(TRACKED), kinds(42));
        assertTrue(store.history(0, 43).isEmpty());
        assertTrue(controller.asked.isEmpty());
    }

    @Test public void switchedOffPausedOrUnreadableTheHooksRecordNothing() throws Exception {
        track(42);
        Settings.SPECIAL_CONTACTS.save(false);
        SpecialContacts.updates(controller, Collections.singletonList(typing(42)));
        SpecialContacts.user(controller, user(42, "Ann", "Smith"), 0);
        Settings.SPECIAL_CONTACTS.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        SpecialContacts.updates(controller, Collections.singletonList(typing(42)));
        SpecialContacts.user(controller, user(42, "Ann", "Smith"), 0);
        PauseForTests.resume();
        SettingReadsForTests.breakReads(Settings.SPECIAL_CONTACTS);
        SpecialContacts.updates(controller, Collections.singletonList(typing(42)));
        SpecialContacts.user(controller, user(42, "Ann", "Smith"), 0);
        SettingReadsForTests.mend(Settings.SPECIAL_CONTACTS);
        assertEquals(Collections.singletonList(TRACKED), kinds(42));
        assertTrue(SpecialContactsForTests.records());
    }

    // ---- The settings page ----------------------------------------------------------------------

    @Test public void theSummaryCountsThePeopleOfTheAccountShowing() throws Exception {
        assertEquals("Nobody yet. Track someone from their profile's menu.", SpecialContacts.summary());
        track(42);
        assertEquals("1 person tracked", SpecialContacts.summary());
        store.track(0, 43, null, NOW);
        store.track(1, 44, null, NOW);
        assertEquals("2 people tracked", SpecialContacts.summary());
        SpecialContacts.account = () -> 1;
        assertEquals("1 person tracked", SpecialContacts.summary());
    }

    @Test public void theListShowsANameAUsernameAndTheId() throws Exception {
        track(42);
        store.track(0, 43, null, NOW);
        List<SpecialContacts.Tracked> people = SpecialContacts.people(context());
        assertEquals(2, people.size());
        assertEquals(42, people.get(0).id);
        assertEquals("Ann Lee", people.get(0).title);
        assertEquals("Ann Lee\n@ann · User ID 42", people.get(0).label);
        assertEquals(43, people.get(1).id);
        assertEquals("User ID 43", people.get(1).title);
        assertEquals("User ID 43", people.get(1).label);
        SpecialContacts.store = null;
        SettingsContextRule.withoutContext(() -> assertNull(SpecialContacts.people(context())));
    }

    @Test public void theHistoryReadsNewestFirstAndClearsOrStops() throws Exception {
        assertEquals("No history yet", SpecialContacts.history(context(), 42));
        track(42);
        store.typing(0, 42, "Family", "c5", NOW + 60_000);
        DateFormat format = DateFormat.getDateTimeInstance(DateFormat.SHORT, DateFormat.SHORT, Locale.US);
        assertEquals(format.format(new Date(NOW + 60_000)) + "  Typing in " + isolate("Family") + "\n"
                + format.format(new Date(NOW)) + "  Started tracking", SpecialContacts.history(context(), 42));
        assertTrue(SpecialContacts.clearHistory(42));
        assertEquals("No history yet", SpecialContacts.history(context(), 42));
        assertTrue(store.trackedNow(0, 42));
        assertTrue(SpecialContacts.stopTracking(42));
        assertFalse(store.trackedNow(0, 42));
        assertFalse(SpecialContacts.stopTracking(42));
        assertFalse(SpecialContacts.clearHistory(42));
    }

    @Test public void everyKindOfLineReadsAsASentence() {
        DateFormat format = DateFormat.getDateTimeInstance(DateFormat.SHORT, DateFormat.SHORT, Locale.US);
        assertEquals("Started tracking", line(TRACKED, "", format));
        assertEquals("Came online", line(ONLINE_NOW, "", format));
        assertEquals("Went offline, last seen " + format.format(new Date(SECONDS * 1000)), line(OFFLINE_AT, Long.toString(SECONDS), format));
        assertEquals("Went offline", line(OFFLINE_AT, "", format));
        assertEquals("Last seen recently", line(SEEN_RECENTLY, "", format));
        assertEquals("Last seen within a week", line(SEEN_WEEK, "", format));
        assertEquals("Last seen within a month", line(SEEN_MONTH, "", format));
        assertEquals("Last seen a long time ago", line(SEEN_LONG_AGO, "", format));
        assertEquals("Typing", line(TYPING, "", format));
        assertEquals("Typing in " + isolate("Family"), line(TYPING, "Family", format));
        assertEquals("Changed name from " + isolate("Ann Lee") + " to " + isolate("Ann Smith"), line(NAME, "Ann Lee\nAnn Smith", format));
        assertEquals("Changed username from " + isolate("@ann") + " to none", line(USERNAME, "@ann\n", format));
        assertEquals("Changed username from none to " + isolate("@ann"), line(USERNAME, "\n@ann", format));
        assertEquals("Changed phone number from " + isolate("15550001") + " to " + isolate("15550002"),
                line(PHONE, "15550001\n15550002", format));
        assertEquals("Added a profile photo", line(PHOTO_ADDED, "", format));
        assertEquals("Removed their profile photo", line(PHOTO_REMOVED, "", format));
        assertEquals("Changed their profile photo", line(PHOTO_CHANGED, "", format));
        assertEquals("You saved them to your contacts", line(CONTACT_SAVED, "", format));
        assertEquals("You removed them from your contacts", line(CONTACT_REMOVED, "", format));
        assertEquals("Added you to their contacts", line(MUTUAL_ON, "", format));
        assertEquals("Removed you from their contacts", line(MUTUAL_OFF, "", format));
        assertEquals("May have blocked you. A guess: their photo and last seen went away together.", line(MAYBE_BLOCKED, "", format));
        assertEquals("May have unblocked you. A guess: their photo or last seen came back.", line(MAYBE_UNBLOCKED, "", format));
        assertEquals("Deleted their account", line(DELETED, "", format));
        assertNull("a kind a newer version wrote", line("something_new", "", format));
    }

    @Test public void usernamesAreSortedActiveAndOnce() throws Exception {
        List<TLRPC.TL_username> list = new ArrayList<>(Arrays.asList(username("zed", true), username("Ann", true),
                username("hidden", false), username("ANN", true)));
        assertEquals("@Ann, @zed", SpecialContacts.usernames(null, list));
        assertEquals("@ann, @zed", SpecialContacts.usernames("ann", list));
        assertEquals("", SpecialContacts.usernames(null, new ArrayList<>()));
        assertNull(SpecialContacts.usernames(null, null));
    }

    // ---- Helpers --------------------------------------------------------------------------------

    private void track(long id) throws Exception {
        Object user = SpecialContacts.users.find(0, id);
        assertEquals(Result.ADDED, store.track(0, id, user == null ? null : SpecialContacts.seen(user), NOW));
    }

    private List<String> kinds(long id) {
        return kinds(store.history(0, id));
    }

    private static List<String> kinds(List<Event> events) {
        List<String> kinds = new ArrayList<>();
        for (Event event : events) kinds.add(event.kind);
        return kinds;
    }

    private static String line(String kind, String detail, DateFormat format) {
        return SpecialContacts.describe(context(), new Event(NOW, kind, detail), format);
    }

    private static String isolate(String text) {
        return (char) 0x2068 + text + (char) 0x2069;
    }

    private static TLRPC.User user(long id, String first, String last) {
        TLRPC.TL_user user = new TLRPC.TL_user();
        user.id = id;
        user.first_name = first;
        user.last_name = last;
        user.username = "ann";
        user.phone = "15550001";
        user.status = new TLRPC.TL_userStatusRecently();
        TLRPC.TL_userProfilePhoto photo = new TLRPC.TL_userProfilePhoto();
        photo.photo_id = 7;
        user.photo = photo;
        return user;
    }

    private static TLRPC.TL_username username(String name, boolean active) {
        TLRPC.TL_username username = new TLRPC.TL_username();
        username.username = name;
        username.active = active;
        return username;
    }

    private static TLRPC.Peer peer(long userId) {
        TLRPC.TL_peerUser peer = new TLRPC.TL_peerUser();
        peer.user_id = userId;
        return peer;
    }

    private static TL_update.TL_updateUserTyping typing(long userId) {
        TL_update.TL_updateUserTyping typing = new TL_update.TL_updateUserTyping();
        typing.user_id = userId;
        typing.action = new TLRPC.TL_sendMessageTypingAction();
        return typing;
    }

    private static FrameLayout rows(long userId, long chatId) {
        FrameLayout menu = new FrameLayout(context());
        SpecialContacts.addToProfile(menu, userId, chatId);
        return menu;
    }

    private static Context context() {
        return RuntimeEnvironment.getApplication();
    }
}
