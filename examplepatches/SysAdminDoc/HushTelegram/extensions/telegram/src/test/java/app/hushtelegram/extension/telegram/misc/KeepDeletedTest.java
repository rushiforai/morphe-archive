/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;
import org.telegram.messenger.ImageLocation;
import org.telegram.tgnet.TLRPC;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class KeepDeletedTest {
    private static final KeepDeleted.Persist REAL_PERSIST = KeepDeleted.persist;
    private static final KeepDeleted.Keys REAL_KEYS = KeepDeleted.keys;
    private static final KeepDeleted.Accounts REAL_ACCOUNTS = KeepDeleted.accounts;
    private static final long SELF = 99;
    private static final long CHANNEL = -1000000000042L;

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private Memory memory;

    @Before public void reset() {
        restore();
        memory = new Memory();
        KeepDeleted.persist = memory;
        KeepDeleted.forgetAllForTests();
        ShadowToast.reset();
    }

    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.KEEP_DELETED_MESSAGES);
        Settings.KEEP_DELETED_MESSAGES.resetToDefault();
        SettingReadsForTests.mend(Settings.RED_DELETED_LABEL);
        Settings.RED_DELETED_LABEL.resetToDefault();
        KeepDeleted.measuring(null);
        KeepDeleted.persist = REAL_PERSIST;
        KeepDeleted.keys = REAL_KEYS;
        KeepDeleted.accounts = REAL_ACCOUNTS;
        KeepDeleted.STOCK.remove();
        KeepDeleted.forgetAllForTests();
        HookStatus.clear();
    }

    @Test public void offByDefaultNothingIsTaken() {
        assertFalse(Settings.KEEP_DELETED_MESSAGES.get());
        assertFalse(KeepDeleted.userUpdate(new Update(1, 2), null));
        assertFalse(KeepDeleted.channelUpdate(new Update(1, 2), null));
        assertFalse(KeepDeleted.push(null, 0, new ArrayList<>(Arrays.asList(1, 2)), 0));
        KeepDeleted.measuring(new Object());
        assertEquals("9:41 PM", KeepDeleted.labelled("9:41 PM"));
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.KEEP_DELETED_MESSAGES));
    }

    @Test public void onKeepsPlainMessagesFromOthersAndHandsTheRestToTelegram() {
        Settings.KEEP_DELETED_MESSAGES.save(true);
        Fake telegram = new Fake(
                new KeepDeleted.Row(10, 1, false, false, false),
                new KeepDeleted.Row(10, 2, true, false, false),
                new KeepDeleted.Row(10, 3, false, true, false),
                new KeepDeleted.Row(10, 4, false, false, true),
                new KeepDeleted.Row(SELF, 6, false, false, false));
        assertTrue(KeepDeleted.start(telegram, 0, ids(1, 2, 3, 4, 5, 6), 0));
        assertEquals("the decision runs on the storage queue", 1, telegram.posted.size());
        assertTrue("nothing happens before it runs", telegram.stock.isEmpty());
        telegram.posted.get(0).run();

        assertTrue(KeepDeleted.isKept(SELF, 10, 1));
        for (int id = 2; id <= 4; id++) assertFalse("id " + id, KeepDeleted.isKept(SELF, 10, id));
        assertFalse(KeepDeleted.isKept(SELF, SELF, 6));
        assertEquals("your own, timed, protected, saved-messages and unknown ones go the stock way",
                Arrays.asList("0:[2, 3, 4, 5, 6]:0"), telegram.stock);
    }

    @Test public void aFailedLookupLeavesEverythingToTelegramAndKeepsNothing() {
        Settings.KEEP_DELETED_MESSAGES.save(true);
        Fake telegram = new Fake();
        telegram.failRows = true;
        KeepDeleted.decide(telegram, -1000000000042L, ids(7, 8), 42);
        assertFalse(KeepDeleted.isKept(SELF, -1000000000042L, 7));
        assertEquals(Arrays.asList("-1000000000042:[7, 8]:42"), telegram.stock);

        Fake refusing = new Fake();
        refusing.refusePost = true;
        assertFalse("a queue that takes no work leaves the deletion to Telegram",
                KeepDeleted.start(refusing, 0, ids(1), 0));
    }

    @Test public void pausingAnEarlyStartAnUnreadableSwitchOrAnyFailureKeepsTelegramsDeletion() {
        Settings.KEEP_DELETED_MESSAGES.save(true);
        // With the switch on, a controller that can't be read still ends in the stock deletion.
        assertFalse(KeepDeleted.userUpdate(new Update(1, 2), null));
        assertFalse(KeepDeleted.push(new Object(), 0, new ArrayList<>(Arrays.asList(1)), 0));
        // The ids handed back to Telegram aren't asked again.
        KeepDeleted.STOCK.set(Boolean.TRUE);
        assertFalse(KeepDeleted.push(new Object(), 0, new ArrayList<>(Arrays.asList(1)), 0));
        KeepDeleted.STOCK.remove();
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), KeepDeleted.on());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(KeepDeleted.on()));
        SettingReadsForTests.breakReads(Settings.KEEP_DELETED_MESSAGES);
        assertFalse(KeepDeleted.on());
        assertFalse(HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES).isEmpty());
    }

    @Test public void aKeptMessageShowsTheLabelAndStaysKeptAfterARestart() {
        Settings.KEEP_DELETED_MESSAGES.save(true);
        KeepDeleted.remember(SELF, Arrays.asList(new long[] {10, 1}));
        long[] shown = {SELF, 10, 1};
        KeepDeleted.keys = message -> shown;
        KeepDeleted.measuring(new Object());
        assertEquals("deleted 9:41 PM", KeepDeleted.labelled("9:41 PM"));
        shown[2] = 2;
        assertEquals("9:41 PM", KeepDeleted.labelled("9:41 PM"));
        assertNull(KeepDeleted.labelled(null));

        KeepDeleted.forgetAllForTests();
        assertTrue("read back from what was saved", KeepDeleted.isKept(SELF, 10, 1));
        Settings.KEEP_DELETED_MESSAGES.save(false);
        KeepDeleted.measuring(new Object());
        shown[2] = 1;
        assertEquals("off shows no label, and keeps what was saved", "9:41 PM", KeepDeleted.labelled("9:41 PM"));
        assertTrue(KeepDeleted.isKept(SELF, 10, 1));
    }

    /** The bubble's measuring puts the label in, then hands over its finished time text right before it returns. */
    private CharSequence measured(CharSequence around) {
        KeepDeleted.measuring(new Object());
        String label = KeepDeleted.labelled("9:41 PM");
        // Telegram joins the parts with TextUtils.concat, which keeps their spans.
        return KeepDeleted.painted(around == null ? label : TextUtils.concat(around, label));
    }

    @Test public void theRedSwitchPaintsOnlyTheWordAndLeavesTheTextAsItWas() {
        Settings.KEEP_DELETED_MESSAGES.save(true);
        assertFalse("starts off", Settings.RED_DELETED_LABEL.get());
        KeepDeleted.remember(SELF, Arrays.asList(new long[] {10, 1}));
        KeepDeleted.keys = message -> new long[] {SELF, 10, 1};
        CharSequence plain = measured("1.2K  edited ");
        assertEquals("1.2K  edited deleted 9:41 PM", plain.toString());
        assertFalse("off leaves it plain", plain instanceof Spanned);

        Settings.RED_DELETED_LABEL.save(true);
        // Telegram builds the rest of the time text around the label, here views and an edited mark it styled.
        SpannableString around = new SpannableString("1.2K  edited ");
        StyleSpan bold = new StyleSpan(1);
        around.setSpan(bold, 0, 4, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        CharSequence red = measured(around);
        assertEquals("the same text, so the same width", "1.2K  edited deleted 9:41 PM", red.toString());
        Spanned spans = (Spanned) red;
        ForegroundColorSpan[] colors = spans.getSpans(0, red.length(), ForegroundColorSpan.class);
        assertEquals(1, colors.length);
        assertEquals(KeepDeleted.RED, colors[0].getForegroundColor());
        assertEquals("only the word", "deleted", red.subSequence(spans.getSpanStart(colors[0]), spans.getSpanEnd(colors[0])).toString());
        assertEquals("Telegram's own spans stay", 0, spans.getSpanStart(spans.getSpans(0, red.length(), StyleSpan.class)[0]));
        String report = String.join(System.lineSeparator(), HookStatus.report());
        assertTrue(report, report.contains("label shown in red"));
    }

    @Test public void onlyAMeasuringThatPutTheLabelInGetsPainted() {
        Settings.KEEP_DELETED_MESSAGES.save(true);
        Settings.RED_DELETED_LABEL.save(true);
        KeepDeleted.remember(SELF, Arrays.asList(new long[] {10, 1}));
        long[] shown = {SELF, 10, 2};
        KeepDeleted.keys = message -> shown;
        CharSequence text = "9:41 PM";
        KeepDeleted.measuring(new Object());
        assertEquals("9:41 PM", KeepDeleted.labelled("9:41 PM"));
        assertSame("a message that isn't kept", text, KeepDeleted.painted(text));

        shown[2] = 1;
        assertTrue(measured(null) instanceof Spanned);
        CharSequence again = "deleted 9:41 PM";
        assertSame("the label is painted once, at the return its measuring reached", again, KeepDeleted.painted(again));
        KeepDeleted.measuring(new Object());
        KeepDeleted.labelled("9:41 PM");
        KeepDeleted.measuring(new Object());
        assertSame("a new measuring starts clean", again, KeepDeleted.painted(again));

        KeepDeleted.measuring(new Object());
        KeepDeleted.labelled("9:41 PM");
        CharSequence changed = "9:41 PM";
        assertSame("a time text Telegram built without the label", changed, KeepDeleted.painted(changed));
        KeepDeleted.measuring(new Object());
        KeepDeleted.labelled("9:41 PM");
        assertNull(KeepDeleted.painted(null));
    }

    @Test public void pausedOrUnreadableTheLabelKeepsTheTimesColor() {
        Settings.KEEP_DELETED_MESSAGES.save(true);
        Settings.RED_DELETED_LABEL.save(true);
        KeepDeleted.remember(SELF, Arrays.asList(new long[] {10, 1}));
        KeepDeleted.keys = message -> new long[] {SELF, 10, 1};
        KeepDeleted.measuring(new Object());
        String label = KeepDeleted.labelled("9:41 PM");
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertSame(label, KeepDeleted.painted(label));
        PauseForTests.resume();

        KeepDeleted.measuring(new Object());
        label = KeepDeleted.labelled("9:41 PM");
        SettingReadsForTests.breakReads(Settings.RED_DELETED_LABEL);
        assertSame(label, KeepDeleted.painted(label));
        assertTrue(HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES).toString(),
                HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES).toString().contains("red label"));
    }

    @Test public void aMessageThatStillGoesHasItsNotificationClearedUnderTelegramsOwnKey() {
        long channel = -1000000000042L;
        Fake telegram = new Fake(new KeepDeleted.Row(channel, 1, false, false, false), new KeepDeleted.Row(channel, 2, true, false, false));
        KeepDeleted.decide(telegram, channel, ids(1, 2), 42);
        assertEquals(Arrays.asList(channel + ":[2]:42"), telegram.stock);
        assertEquals("only the message that goes, after Telegram deleted it", Arrays.asList("[2]:42"), telegram.cleared);

        Fake user = new Fake(new KeepDeleted.Row(10, 3, true, false, false));
        KeepDeleted.decide(user, 0, ids(3, 4), 0);
        assertEquals(Arrays.asList("[3, 4]:0"), user.cleared);
    }

    @Test public void nothingReleasedOrAFailedDeletionClearsNoNotification() {
        Fake kept = new Fake(new KeepDeleted.Row(10, 1, false, false, false));
        KeepDeleted.decide(kept, 0, ids(1), 0);
        assertTrue(kept.stock.isEmpty());
        assertTrue(kept.cleared.isEmpty());

        Fake failing = new Fake();
        failing.failStock = true;
        KeepDeleted.decide(failing, 0, ids(5), 0);
        assertTrue("a message Telegram didn't delete keeps its notification", failing.cleared.isEmpty());
    }

    @Test public void aFailedCleanupStillLeavesTheDeletionDoneAndShowsInTheReport() {
        Fake telegram = new Fake();
        telegram.failClear = true;
        KeepDeleted.decide(telegram, 0, ids(5), 0);
        assertEquals(Arrays.asList("0:[5]:0"), telegram.stock);
        assertTrue(HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES).toString(),
                HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES).toString().contains("notification cleanup"));
    }

    @Test public void theBridgeFillsTelegramsRenamedSparseArrayWithItsOnlyPut() throws Exception {
        TelegramController controller = new TelegramController();
        KeepDeletedBridge bridge = KeepDeletedBridge.of(controller);
        bridge.clearNotifications(ids(5, 6), 42);
        bridge.clearNotifications(ids(7), 0);
        assertEquals(Arrays.asList("-42=[5, 6] reactions=false", "0=[7] reactions=false"), controller.notifications.calls);
    }

    @Test public void aKeptMessageOnScreenIsDrawnAgainSoTheOpenChatShowsItsLabel() {
        Settings.KEEP_DELETED_MESSAGES.save(true);
        Object first = new Object();
        Object second = new Object();
        Object mine = new Object();
        Object elsewhere = new Object();
        Map<Object, long[]> shown = new HashMap<>();
        shown.put(first, new long[] {SELF, 10, 1});
        shown.put(mine, new long[] {SELF, 10, 2});
        shown.put(elsewhere, new long[] {SELF, 11, 3});
        shown.put(second, new long[] {SELF, 10, 5});
        KeepDeleted.keys = shown::get;
        for (Object bubble : shown.keySet()) {
            KeepDeleted.measuring(bubble);
            assertEquals("measured before it was kept", "9:41 PM", KeepDeleted.labelled("9:41 PM"));
        }

        Fake telegram = new Fake(new KeepDeleted.Row(10, 1, false, false, false), new KeepDeleted.Row(10, 2, true, false, false),
                new KeepDeleted.Row(11, 3, false, false, false), new KeepDeleted.Row(12, 4, false, false, false),
                new KeepDeleted.Row(10, 5, false, false, false));
        KeepDeleted.decide(telegram, 0, ids(1, 2, 3, 4, 5), 0);
        assertEquals("each chat's kept bubbles, once; mine went and 4 was never on screen",
                Arrays.asList("10:" + Arrays.asList(first, second), "11:" + Arrays.asList(elsewhere)), telegram.redrawn);
        assertEquals(Arrays.asList("0:[2]:0"), telegram.stock);

        // Drawn again, the bubble measures its time and the label is there.
        KeepDeleted.measuring(first);
        assertEquals("deleted 9:41 PM", KeepDeleted.labelled("9:41 PM"));
        // A kept bubble isn't asked twice.
        KeepDeleted.redraw(telegram, SELF, Arrays.asList(new long[] {10, 1}));
        assertEquals(2, telegram.redrawn.size());
    }

    @Test public void aRedrawThatFailsStillKeepsTheMessageAndShowsInTheReport() {
        Settings.KEEP_DELETED_MESSAGES.save(true);
        KeepDeleted.keys = message -> new long[] {SELF, 10, 1};
        KeepDeleted.measuring(new Object());
        KeepDeleted.labelled("9:41 PM");
        Fake telegram = new Fake(new KeepDeleted.Row(10, 1, false, false, false));
        telegram.failRedraw = true;
        KeepDeleted.decide(telegram, 0, ids(1), 0);
        assertTrue(KeepDeleted.isKept(SELF, 10, 1));
        assertTrue(telegram.stock.isEmpty());
        assertTrue(HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES).toString(),
                HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES).toString().contains("redraw"));
    }

    /** #2: a kept message's photo or file starts downloading as it's kept, while its file reference still works. */
    @Test public void aKeptMessagesMediaStartsDownloadingTheMomentItsKept() {
        Settings.KEEP_DELETED_MESSAGES.save(true);
        TLRPC.Message photo = message(1, new TLRPC.TL_messageMediaPhoto());
        TLRPC.Message mine = message(2, new TLRPC.TL_messageMediaPhoto());
        Fake telegram = new Fake(new KeepDeleted.Row(10, 1, false, false, false, photo), new KeepDeleted.Row(10, 2, true, false, false, mine),
                new KeepDeleted.Row(10, 3, false, false, false));
        KeepDeleted.decide(telegram, 0, ids(1, 2, 3), 0);
        assertTrue(KeepDeleted.isKept(SELF, 10, 3));
        assertEquals("only the kept ones, and only a message that could be read", Arrays.asList(photo), telegram.saved);
        assertTrue(String.join("\n", HookStatus.report()).contains("kept media downloaded"));

        // A download that can't start leaves the message kept, label and all.
        Fake failing = new Fake(new KeepDeleted.Row(10, 4, false, false, false, message(4, new TLRPC.TL_messageMediaPhoto())));
        failing.failSave = true;
        KeepDeleted.decide(failing, 0, ids(4), 0);
        assertTrue(KeepDeleted.isKept(SELF, 10, 4));
        assertTrue(failing.stock.isEmpty());
        assertTrue(HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES).toString().contains("kept media download"));

        // A list that can't be saved keeps nothing, so nothing downloads either.
        memory.failWrites = true;
        Fake unsaved = new Fake(new KeepDeleted.Row(10, 5, false, false, false, message(5, new TLRPC.TL_messageMediaPhoto())));
        KeepDeleted.decide(unsaved, 0, ids(5), 0);
        memory.failWrites = false;
        assertTrue(unsaved.saved.isEmpty());
        assertEquals(Arrays.asList("0:[5]:0"), unsaved.stock);
    }

    /**
     * Every size of a kept photo, so the bubble and the full-screen viewer each find theirs; a
     * document's previews; and the document itself up to the limit. Each the way Telegram's own
     * download asks: low priority, the regular cache, a photo size as jpg, the message as the parent.
     */
    @Test public void theBridgeDownloadsEveryPhotoSizeAndFilesUpToTheLimit() throws Exception {
        TelegramController controller = new TelegramController();
        TLRPC.Message photo = message(1, new TLRPC.TL_messageMediaPhoto());
        photo.media.photo = new TLRPC.Photo();
        photo.media.photo.sizes.addAll(Arrays.asList(size(new TLRPC.TL_photoStrippedSize(), "i"), size(new TLRPC.TL_photoSize(), "s"),
                size(new TLRPC.TL_photoSize(), "m"), size(new TLRPC.TL_photoSizeProgressive(), "y"), size(new TLRPC.TL_photoPathSize(), "j"),
                size(new TLRPC.TL_photoCachedSize(), "c"), size(new TLRPC.TL_photoSizeEmpty(), ""), null));
        TLRPC.Message video = message(2, new TLRPC.TL_messageMediaDocument());
        video.media.document = document(KeepDeletedBridge.MEDIA_LIMIT);
        TLRPC.Message movie = message(3, new TLRPC.TL_messageMediaDocument());
        movie.media.document = document(KeepDeletedBridge.MEDIA_LIMIT + 1);
        TLRPC.Message text = message(4, null);
        TLRPC.Message empty = message(5, new TLRPC.TL_messageMediaPhoto());

        int asked = KeepDeletedBridge.of(controller).saveMedia(Arrays.asList(photo, video, movie, text, empty));
        assertEquals(Arrays.asList(
                "1: photo s.jpg priority 0 cache 0", "1: photo m.jpg priority 0 cache 0", "1: photo y.jpg priority 0 cache 0",
                "2: preview m.jpg priority 0 cache 0", "2: document of " + KeepDeletedBridge.MEDIA_LIMIT + " bytes priority 0 cache 0",
                "3: preview m.jpg priority 0 cache 0"), controller.loader.loads);
        assertEquals(6, asked);
    }

    private static TLRPC.Message message(int id, TLRPC.MessageMedia media) {
        TLRPC.Message message = new TLRPC.Message();
        message.id = id;
        message.media = media;
        return message;
    }

    private static TLRPC.PhotoSize size(TLRPC.PhotoSize size, String type) {
        size.type = type;
        return size;
    }

    private static TLRPC.Document document(long length) {
        TLRPC.Document document = new TLRPC.Document();
        document.size = length;
        document.thumbs.addAll(Arrays.asList(size(new TLRPC.TL_photoStrippedSize(), "i"), size(new TLRPC.TL_photoSize(), "m")));
        return document;
    }

    @Test public void theBridgeMarksEachMessageAndPostsTheReplacementOnTheMainThread() throws Exception {
        TelegramController controller = new TelegramController();
        Bubble first = new Bubble();
        Bubble second = new Bubble();
        ArrayList<Object> messages = new ArrayList<>(Arrays.asList(first, second));
        KeepDeletedBridge.of(controller).redraw(CHANNEL, messages);
        assertTrue("nothing reaches the chat off the main thread", controller.center.posts.isEmpty());
        assertFalse(first.forceUpdate);

        ShadowLooper.idleMainLooper();
        assertTrue(first.forceUpdate);
        assertTrue(second.forceUpdate);
        assertEquals("the event Telegram's own storage posts, with the chat and the same messages",
                Arrays.asList(Center.replaceMessagesObjects + ":" + Arrays.asList(CHANNEL, messages)), controller.center.posts);
    }

    @Test public void clearingHandsEveryKeptMessageToTelegramChatByChatAndForgetsThem() {
        KeepDeleted.remember(SELF, Arrays.asList(new long[] {10, 1}, new long[] {10, 2}, new long[] {CHANNEL, 7},
                new long[] {-555, 8}, new long[] {CHANNEL, 9}));
        KeepDeleted.remember(77, Arrays.asList(new long[] {20, 3}));
        Fake first = new Fake();
        first.channels.put(CHANNEL, -CHANNEL);
        Fake second = new Fake();
        second.self = 77;
        KeepDeleted.accounts = () -> Arrays.asList(first, second);

        assertFalse("works with the switch off", Settings.KEEP_DELETED_MESSAGES.get());
        assertEquals(6, KeepDeleted.clear());
        assertTrue("the deletion runs on the storage queue", first.stock.isEmpty());
        assertEquals("and nothing moves before it does", 5, KeepDeleted.keptBy(SELF).size());
        first.posted.get(0).run();
        second.posted.get(0).run();
        assertEquals("off the kept list", Collections.emptyList(), KeepDeleted.keptBy(SELF));
        assertEquals("one deletion per chat, with the channel's ID for a channel and 0 otherwise",
                Arrays.asList("10:[1, 2]:0", CHANNEL + ":[7, 9]:" + -CHANNEL, "-555:[8]:0"), first.stock);
        assertEquals("only groups are asked whether they're channels", Arrays.asList(CHANNEL, -555L), first.asked);
        assertEquals(Arrays.asList("[1, 2]:0", "[7, 9]:" + -CHANNEL, "[8]:0"), first.cleared);
        assertEquals(Arrays.asList("20:[3]:0"), second.stock);
        // Each account's last step runs after Telegram's own deletion, on the same queue.
        first.posted.get(1).run();
        second.posted.get(1).run();

        KeepDeleted.forgetAllForTests();
        assertFalse("still forgotten after a restart", KeepDeleted.isKept(SELF, 10, 1));
        assertFalse(KeepDeleted.isKept(SELF, CHANNEL, 9));
        assertFalse(KeepDeleted.isKept(77, 20, 3));
        assertEquals("Removing 6 kept messages.", KeepDeleted.clearedMessage(6));
        assertEquals("Removing 1 kept message.", KeepDeleted.clearedMessage(1));
    }

    @Test public void pastTheCapTheOldestKeptMessagesGoToTelegramsOwnDeletion() {
        Settings.KEEP_DELETED_MESSAGES.save(true);
        List<long[]> full = new ArrayList<>();
        for (int id = 1; id <= KeepDeleted.LIMIT; id++) full.add(new long[] {10, id});
        assertTrue("up to the cap nothing is dropped", KeepDeleted.remember(SELF, full).isEmpty());

        int next = KeepDeleted.LIMIT + 1;
        Fake telegram = new Fake(new KeepDeleted.Row(10, next, false, false, false),
                new KeepDeleted.Row(10, next + 1, false, false, false));
        KeepDeleted.decide(telegram, 0, ids(next, next + 1), 0);
        assertTrue("labelled until Telegram's deletion has run", KeepDeleted.isKept(SELF, 10, 1));
        assertEquals(Arrays.asList("10:1", "10:2"), KeepDeleted.handingBy(SELF));
        assertEquals(1, telegram.posted.size());
        telegram.posted.get(0).run();

        assertTrue(KeepDeleted.isKept(SELF, 10, next + 1));
        assertFalse(KeepDeleted.isKept(SELF, 10, 1));
        assertFalse(KeepDeleted.isKept(SELF, 10, 2));
        assertTrue(KeepDeleted.isKept(SELF, 10, 3));
        assertEquals(KeepDeleted.LIMIT, KeepDeleted.keptBy(SELF).size());
        assertEquals("the two oldest go the stock way instead of lingering with no label",
                Arrays.asList("10:[1, 2]:0"), telegram.stock);
        assertEquals(Arrays.asList("[1, 2]:0"), telegram.cleared);
    }

    @Test public void anOverflowThatCantBeHandedBackIsNextToLeaveAndPushesNothingOutEarly() {
        Settings.KEEP_DELETED_MESSAGES.save(true);
        List<long[]> full = new ArrayList<>();
        for (int id = 1; id <= KeepDeleted.LIMIT; id++) full.add(new long[] {10, id});
        KeepDeleted.remember(SELF, full);

        int next = KeepDeleted.LIMIT + 1;
        Fake failing = new Fake(new KeepDeleted.Row(10, next, false, false, false));
        failing.failStock = true;
        KeepDeleted.decide(failing, 0, ids(next), 0);
        assertEquals("put back as the oldest", "10:1", KeepDeleted.keptBy(SELF).get(0));
        assertTrue(KeepDeleted.isKept(SELF, 10, 2));

        Fake telegram = new Fake(new KeepDeleted.Row(10, next + 1, false, false, false));
        KeepDeleted.decide(telegram, 0, ids(next + 1), 0);
        assertEquals("the one that failed leaves first, with one more for the new message",
                Arrays.asList("10:[1, 2]:0"), telegram.stock);
        assertTrue("no real kept message left ahead of its turn", KeepDeleted.isKept(SELF, 10, 3));
        assertEquals(KeepDeleted.LIMIT, KeepDeleted.keptBy(SELF).size());
    }

    @Test public void nothingKeptGivesThePlainNoticeAndAsksNothingOfTelegram() {
        Fake telegram = new Fake();
        KeepDeleted.accounts = () -> Collections.singletonList(telegram);
        assertEquals(0, KeepDeleted.clear());
        assertTrue(telegram.posted.isEmpty());
        assertEquals("There are no kept messages to clear.", KeepDeleted.clearedMessage(0));
    }

    @Test public void whatCantBeHandedOverStaysKeptAndShowsInTheReport() {
        KeepDeleted.accounts = () -> { throw new ClassNotFoundException("no Telegram"); };
        KeepDeleted.remember(SELF, Arrays.asList(new long[] {10, 1}, new long[] {CHANNEL, 7}, new long[] {CHANNEL, 9}));
        assertEquals(0, KeepDeleted.clear());
        assertTrue(KeepDeleted.isKept(SELF, 10, 1));
        assertTrue(HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES).toString().contains("accounts"));

        // A queue that takes no work keeps the account's list, and the next account still clears.
        Fake refusing = new Fake();
        refusing.refusePost = true;
        Fake unreadable = new Fake();
        unreadable.failSelf = true;
        Fake other = new Fake();
        other.self = 77;
        KeepDeleted.remember(77, Arrays.asList(new long[] {20, 3}));
        KeepDeleted.accounts = () -> Arrays.asList(refusing, unreadable, other);
        assertEquals(1, KeepDeleted.clear());
        other.posted.get(0).run();
        other.posted.get(1).run();
        KeepDeleted.forgetAllForTests();
        assertTrue("saved back", KeepDeleted.isKept(SELF, 10, 1) && KeepDeleted.isKept(SELF, CHANNEL, 9));
        assertFalse(KeepDeleted.isKept(77, 20, 3));

        // A chat whose deletion can't start is remembered again; the others go.
        Fake failing = new Fake();
        failing.failChannel = true;
        KeepDeleted.accounts = () -> Collections.singletonList(failing);
        assertEquals(3, KeepDeleted.clear());
        failing.posted.get(0).run();
        assertEquals(Arrays.asList("10:[1]:0"), failing.stock);
        failing.posted.get(1).run();
        KeepDeleted.forgetAllForTests();
        assertFalse(KeepDeleted.isKept(SELF, 10, 1));
        assertTrue(KeepDeleted.isKept(SELF, CHANNEL, 7));
        assertTrue(KeepDeleted.isKept(SELF, CHANNEL, 9));
        assertTrue(HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES).toString().contains("clearing kept messages"));
    }

    // The saved lists, a failed write and a restart at each step.

    @Test public void aMessageIsOnlyKeptOnceTheListNamingItIsSaved() {
        Settings.KEEP_DELETED_MESSAGES.save(true);
        memory.failWrites = true;
        Fake telegram = new Fake(new KeepDeleted.Row(10, 1, false, false, false));
        KeepDeleted.decide(telegram, 0, ids(1), 0);
        assertEquals("unsaved, it's left to Telegram", Arrays.asList("0:[1]:0"), telegram.stock);
        assertFalse(KeepDeleted.isKept(SELF, 10, 1));
        assertTrue(HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES).toString().contains("saving kept messages"));
        KeepDeleted.forgetAllForTests();
        assertFalse(KeepDeleted.isKept(SELF, 10, 1));
    }

    @Test public void aDeletionForNoSignedInAccountIsLeftToTelegram() {
        Settings.KEEP_DELETED_MESSAGES.save(true);
        Fake telegram = new Fake(new KeepDeleted.Row(10, 1, false, false, false));
        telegram.self = 0;
        KeepDeleted.decide(telegram, 0, ids(1), 0);
        assertEquals(Arrays.asList("0:[1]:0"), telegram.stock);
        assertEquals(0, memory.writes);
    }

    @Test public void aClearWhoseMoveCantBeSavedChangesNothing() {
        KeepDeleted.remember(SELF, Arrays.asList(new long[] {10, 1}, new long[] {10, 2}));
        Fake telegram = new Fake();
        KeepDeleted.accounts = () -> Collections.singletonList(telegram);
        assertEquals(2, KeepDeleted.clear());
        memory.failWrites = true;
        telegram.posted.get(0).run();
        assertTrue(telegram.stock.isEmpty());
        assertEquals(Arrays.asList("10:1", "10:2"), KeepDeleted.keptBy(SELF));
        assertTrue(KeepDeleted.handingBy(SELF).isEmpty());
    }

    /** The move off the kept list is saved, then the app dies before Telegram is asked. */
    @Test public void aRestartAfterTheMoveHandsTheMessagesBackAndKeepsTheirLabelUntilThen() {
        KeepDeleted.remember(SELF, Arrays.asList(new long[] {10, 1}, new long[] {10, 2}));
        assertTrue(KeepDeleted.beginHandBack(SELF));
        KeepDeleted.forgetAllForTests();
        assertTrue("still labelled while it waits", KeepDeleted.isKept(SELF, 10, 1));
        assertEquals(Arrays.asList("10:1", "10:2"), KeepDeleted.handingBy(SELF));

        // The account's next deletion picks them up.
        Fake telegram = new Fake();
        KeepDeleted.decide(telegram, 0, ids(5), 0);
        assertEquals(Arrays.asList("10:[1, 2]:0", "0:[5]:0"), telegram.stock);
        assertEquals(1, telegram.posted.size());
        assertTrue("until Telegram's deletion has run", KeepDeleted.isKept(SELF, 10, 1));
        telegram.posted.get(0).run();
        assertFalse(KeepDeleted.isKept(SELF, 10, 1));
        KeepDeleted.forgetAllForTests();
        assertTrue(KeepDeleted.handingBy(SELF).isEmpty());
        assertTrue(KeepDeleted.keptBy(SELF).isEmpty());
    }

    /** Telegram was asked, then the app dies before its deletion ran on the queue. */
    @Test public void aRestartAfterTelegramWasAskedDeletesAgainThenForgets() {
        KeepDeleted.remember(SELF, Arrays.asList(new long[] {10, 1}));
        Fake before = new Fake();
        KeepDeleted.accounts = () -> Collections.singletonList(before);
        assertEquals(1, KeepDeleted.clear());
        before.posted.get(0).run();
        assertEquals(Arrays.asList("10:[1]:0"), before.stock);
        KeepDeleted.forgetAllForTests();
        assertEquals("nothing came off the list", Arrays.asList("10:1"), KeepDeleted.handingBy(SELF));

        Fake after = new Fake();
        KeepDeleted.accounts = () -> Collections.singletonList(after);
        assertEquals("a tap counts what's still on its way", 1, KeepDeleted.clear());
        after.posted.get(0).run();
        assertEquals("deleting it again finds nothing, so it's safe", Arrays.asList("10:[1]:0"), after.stock);
        after.posted.get(1).run();
        assertTrue(KeepDeleted.handingBy(SELF).isEmpty());
    }

    @Test public void aFinishThatCantBeSavedLeavesTheMessagesToBeDeletedAgain() {
        KeepDeleted.remember(SELF, Arrays.asList(new long[] {10, 1}));
        Fake telegram = new Fake();
        KeepDeleted.accounts = () -> Collections.singletonList(telegram);
        KeepDeleted.clear();
        telegram.posted.get(0).run();
        memory.failWrites = true;
        telegram.posted.get(1).run();
        memory.failWrites = false;
        KeepDeleted.forgetAllForTests();
        assertEquals(Arrays.asList("10:1"), KeepDeleted.handingBy(SELF));
    }

    @Test public void aSecondTapWhileTheFirstIsOnItsWayAsksTelegramNothingTwice() {
        KeepDeleted.remember(SELF, Arrays.asList(new long[] {10, 1}));
        Fake telegram = new Fake();
        KeepDeleted.accounts = () -> Collections.singletonList(telegram);
        assertEquals(1, KeepDeleted.clear());
        telegram.posted.get(0).run();
        assertEquals("already on its way", 0, KeepDeleted.clear());
        assertEquals(2, telegram.posted.size());
    }

    /** A slot signed out, with another account signed in, before the queue ran. */
    @Test public void aSlotNowHoldingAnotherAccountDeletesNoneOfTheFirstOnesMessages() {
        KeepDeleted.remember(SELF, Arrays.asList(new long[] {10, 1}, new long[] {11, 2}));
        Fake slot = new Fake();
        KeepDeleted.accounts = () -> Collections.singletonList(slot);
        assertEquals(2, KeepDeleted.clear());
        slot.self = 77;
        slot.posted.get(0).run();
        assertTrue(slot.stock.isEmpty());
        assertEquals("still kept for the account that kept them", Arrays.asList("10:1", "11:2"), KeepDeleted.keptBy(SELF));
        assertTrue(String.join("\n", HookStatus.report()).contains("kept messages left for their own account"));

        // The account changes between two chats of one hand-back: the second chat waits for it.
        slot.self = SELF;
        slot.posted.clear();
        assertEquals(2, KeepDeleted.clear());
        slot.afterStock = () -> slot.self = 77;
        slot.posted.get(0).run();
        assertEquals(Arrays.asList("10:[1]:0"), slot.stock);
        slot.posted.get(1).run();
        assertEquals(Arrays.asList("11:2"), KeepDeleted.handingBy(SELF));
        assertTrue(KeepDeleted.isKept(SELF, 11, 2));
        assertTrue(KeepDeleted.handingBy(77).isEmpty());
    }

    @Test public void listsSavedByANewerVersionAreReadButNeverWrittenOver() {
        memory.values.put("version", "3");
        memory.values.put("kept_" + SELF, "10:1");
        Settings.KEEP_DELETED_MESSAGES.save(true);
        assertTrue("its messages still show the label", KeepDeleted.isKept(SELF, 10, 1));
        Fake telegram = new Fake(new KeepDeleted.Row(10, 2, false, false, false));
        KeepDeleted.decide(telegram, 0, ids(2), 0);
        assertEquals("a new message goes the stock way", Arrays.asList("0:[2]:0"), telegram.stock);
        assertEquals(0, memory.writes);
        assertEquals("10:1", memory.values.get("kept_" + SELF));
    }

    /** Version 1 saved only the kept list, with no number. */
    @Test public void aListFromBeforeTheJournalIsReadAndKeptWhole() {
        memory.values.put("kept_" + SELF, "10:1,10:2");
        assertTrue(KeepDeleted.isKept(SELF, 10, 2));
        assertNotNull(KeepDeleted.remember(SELF, Arrays.asList(new long[] {10, 3})));
        assertEquals(String.valueOf(KeepDeleted.VERSION), memory.values.get("version"));
        assertEquals("10:1,10:2,10:3", memory.values.get("kept_" + SELF));
        assertEquals("", memory.values.get("handing_" + SELF));
    }

    @Test public void theRowSaysRemovingAtOnceAndRemovedOnceTelegramIsDone() {
        KeepDeleted.remember(SELF, Arrays.asList(new long[] {10, 1}, new long[] {10, 2}));
        Fake telegram = new Fake();
        KeepDeleted.accounts = () -> Collections.singletonList(telegram);
        assertEquals("Removing 2 kept messages.", KeepDeleted.clearedMessage(KeepDeleted.clear()));
        telegram.posted.get(0).run();
        ShadowLooper.idleMainLooper();
        assertNull("nothing says done before Telegram is", ShadowToast.getLatestToast());
        telegram.posted.get(1).run();
        ShadowLooper.idleMainLooper();
        assertEquals("Removed 2 kept messages.", ShadowToast.getTextOfLatestToast());
    }

    @Test public void theCapsOwnHandBackSaysNothing() {
        Settings.KEEP_DELETED_MESSAGES.save(true);
        List<long[]> full = new ArrayList<>();
        for (int id = 1; id <= KeepDeleted.LIMIT; id++) full.add(new long[] {10, id});
        KeepDeleted.remember(SELF, full);
        Fake telegram = new Fake(new KeepDeleted.Row(10, KeepDeleted.LIMIT + 1, false, false, false));
        KeepDeleted.decide(telegram, 0, ids(KeepDeleted.LIMIT + 1), 0);
        telegram.posted.get(0).run();
        ShadowLooper.idleMainLooper();
        assertNull(ShadowToast.getLatestToast());
    }

    @Test public void theBridgeTellsAChannelOrSupergroupFromABasicGroup() throws Exception {
        TelegramController controller = new TelegramController();
        controller.chats.put(42L, new TLRPC.TL_channel());
        controller.chats.put(555L, new TLRPC.Chat());
        controller.storage.chats.put(43L, new TLRPC.TL_channel());
        KeepDeletedBridge bridge = KeepDeletedBridge.of(controller);
        assertEquals(42, bridge.channel(-42));
        assertEquals("a basic group", 0, bridge.channel(-555));
        assertEquals("found in the stored chats", 43, bridge.channel(-43));
        assertEquals("a chat found nowhere goes as a plain chat", 0, bridge.channel(-44));
        assertEquals("a person", 0, bridge.channel(10));
    }

    private static ArrayList<Integer> ids(Integer... ids) { return new ArrayList<>(Arrays.asList(ids)); }

    /** Public, like Telegram's own classes, so the bridge reaches them the same way. */
    public static final class TelegramController {
        final Notifications notifications = new Notifications();
        final Center center = new Center();
        final Storage storage = new Storage();
        final Loader loader = new Loader();
        final Map<Long, TLRPC.Chat> chats = new HashMap<>();

        public Storage getMessagesStorage() { return storage; }

        public Loader getFileLoader() { return loader; }

        public Notifications getNotificationsController() { return notifications; }

        public Center getNotificationCenter() { return center; }

        public TLRPC.Chat getChat(Long id) { return chats.get(id); }
    }

    /** Telegram's FileLoader: the photo-size download and the document download. */
    public static final class Loader {
        final List<String> loads = new ArrayList<>();

        public void loadFile(ImageLocation location, Object parent, String ext, int priority, int cacheType) {
            loads.add(((TLRPC.Message) parent).id + ": " + location + "." + ext + " priority " + priority + " cache " + cacheType);
        }

        public void loadFile(TLRPC.Document document, Object parent, int priority, int cacheType) {
            loads.add(((TLRPC.Message) parent).id + ": document of " + document.size + " bytes priority " + priority + " cache " + cacheType);
        }
    }

    public static final class Storage {
        final Map<Long, TLRPC.Chat> chats = new HashMap<>();

        public TLRPC.Chat getChat(long id) { return chats.get(id); }
    }

    /** Telegram's NotificationCenter: an event number in a static field and a varargs post. */
    public static final class Center {
        public static int replaceMessagesObjects = 7;
        final List<String> posts = new ArrayList<>();

        public void postNotificationName(int id, Object... args) { posts.add(id + ":" + Arrays.asList(args)); }
    }

    /** A message with the mark Telegram's bubble reads. */
    public static final class Bubble {
        public boolean forceUpdate;
    }

    public static final class Notifications {
        final List<String> calls = new ArrayList<>();

        public void removeDeletedMessagesFromNotifications(RenamedSparseArray deleted, boolean reactions) {
            calls.add(deleted.key + "=" + deleted.value + " reactions=" + reactions);
        }

        public void removeDeletedHisoryFromNotifications(Object counts) {
            throw new AssertionError("the history cleanup isn't this one");
        }
    }

    /** Shaped like R8's androidx LongSparseArray in the fixtures: one (Object, long) put among other one-letter methods. */
    public static final class RenamedSparseArray {
        long key = Long.MIN_VALUE;
        Object value;

        public RenamedSparseArray() { }

        public void k(Object value, long key) {
            this.key = key;
            this.value = value;
        }

        public Object g(Object value, long key) { throw new AssertionError("not the put"); }

        public void a(Long value, long key) { throw new AssertionError("not the put"); }
    }

    /** What a deletion update looks like to the bridge: public fields with Telegram's names. */
    public static final class Update {
        public ArrayList<Integer> messages;
        public long channel_id;

        Update(Integer first, Integer second) { messages = ids(first, second); }
    }

    /** The phone's storage, which a test can make refuse a commit. A refused one writes nothing. */
    private static final class Memory implements KeepDeleted.Persist {
        final Map<String, String> values = new HashMap<>();
        boolean failWrites;
        int writes;

        @Override public String read(String key) { return values.get(key); }

        @Override public boolean write(Map<String, String> entries) {
            if (failWrites) return false;
            writes++;
            values.putAll(entries);
            return true;
        }
    }

    private static final class Fake implements KeepDeleted.Source {
        final List<KeepDeleted.Row> rows;
        final List<Runnable> posted = new ArrayList<>();
        final List<String> stock = new ArrayList<>();
        final List<String> cleared = new ArrayList<>();
        final List<String> redrawn = new ArrayList<>();
        final List<Object> saved = new ArrayList<>();
        final List<Long> asked = new ArrayList<>();
        final Map<Long, Long> channels = new HashMap<>();
        long self = SELF;
        boolean failSelf;
        boolean failRows;
        boolean refusePost;
        boolean failStock;
        boolean failClear;
        boolean failChannel;
        boolean failRedraw;
        boolean failSave;
        /** Run after each deletion Telegram is asked for, to change things between two chats. */
        Runnable afterStock;

        Fake(KeepDeleted.Row... rows) { this.rows = Arrays.asList(rows); }

        @Override public long self() {
            if (failSelf) throw new IllegalStateException("no account");
            return self;
        }

        @Override public void post(Runnable work) {
            if (refusePost) throw new IllegalStateException("no work");
            posted.add(work);
        }

        @Override public List<KeepDeleted.Row> rows(long dialogId, List<Integer> ids) {
            if (failRows) throw new IllegalStateException("no database");
            return rows;
        }

        @Override public void stock(long dialogId, ArrayList<Integer> ids, long channelId) {
            if (failStock) throw new IllegalStateException("no deletion");
            stock.add(dialogId + ":" + ids + ":" + channelId);
            if (afterStock != null) afterStock.run();
        }

        @Override public void clearNotifications(ArrayList<Integer> ids, long channelId) {
            if (failClear) throw new IllegalStateException("no notifications");
            cleared.add(ids + ":" + channelId);
        }

        @Override public long channel(long dialogId) {
            asked.add(dialogId);
            if (failChannel) throw new IllegalStateException("no chat");
            Long channel = channels.get(dialogId);
            return channel == null ? 0 : channel;
        }

        @Override public void redraw(long dialogId, ArrayList<Object> messages) {
            if (failRedraw) throw new IllegalStateException("no chat screen");
            redrawn.add(dialogId + ":" + messages);
        }

        @Override public int saveMedia(List<Object> messages) {
            if (failSave) throw new IllegalStateException("no file loader");
            saved.addAll(messages);
            return messages.size();
        }
    }
}
