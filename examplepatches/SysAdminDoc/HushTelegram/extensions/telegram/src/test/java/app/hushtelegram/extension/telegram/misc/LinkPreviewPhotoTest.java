/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.content.Context;
import android.os.Looper;
import android.text.SpannableStringBuilder;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.telegram.settings.Settings;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.Executor;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowToast;

/** Send photo in the link preview menu (#101): when the row shows, and what a tap sends and clears. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class LinkPreviewPhotoTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    @Rule public final TemporaryFolder folder = new TemporaryFolder();

    private static final int ACCOUNT = 2;
    private static final long DIALOG = -500L;
    private static final long MONO_PEER = 77L;
    private static final byte[] PICTURE = "picture".getBytes(StandardCharsets.UTF_8);

    private final Object page = new Object();
    private final Object chat = new Object();
    private final Object webPage = new Object();
    private final Object photo = new Object();
    private final Object size = new Object();
    private final Object reply = new Object();
    private final Object thread = new Object();
    private final Object quote = new Object();
    private final Object arguments = new Object();

    /** Everything Telegram was asked to do, in order. */
    private final List<String> log = new ArrayList<>();
    private final FakeTelegram fake = new FakeTelegram();

    private Context context;
    private LinearLayout menu;
    private View apply;
    private View remove;
    private Executor realWork;
    private long realWait;
    private LinkPreviewPhoto.Telegram realTelegram;

    private class FakeTelegram implements LinkPreviewPhoto.Telegram {
        Object currentChat = chat;
        Object currentWebPage = webPage;
        Object currentPhoto = photo;
        Object currentSize = size;
        File cacheFile;
        File mediaFile;
        boolean canLoad = true;
        File appearsWhenLoaded;
        Object editing;
        int chatMode;
        boolean allowed = true;
        int limit = 1024;
        CharSequence typed = "";
        boolean shown = true;
        boolean sendWorks = true;
        RuntimeException sendThrows;
        final ArrayList<Object> formatting = new ArrayList<>(Arrays.asList("bold"));
        CharSequence entitiesSaw;
        String afterEntities;

        String sentPath;
        byte[] sentBytes;
        String sentCaption;
        ArrayList<?> sentEntities;
        Object loadedWebPage;
        Object loadedPhoto;
        int rowsMade;
        int sends;

        @Override public View row(Object page, Context context, CharSequence title) {
            rowsMade++;
            TextView row = new TextView(context);
            row.setText(title);
            return row;
        }

        @Override public Object chat(Object page) { return currentChat; }

        @Override public Object webPage(Object chat) { return currentWebPage; }

        @Override public Object photo(Object webPage) { return currentPhoto; }

        @Override public Object bestSize(Object photo) { return currentSize; }

        @Override public File path(int account, Object size, int cache) {
            assertEquals(ACCOUNT, account);
            return cache != 0 ? cacheFile : mediaFile;
        }

        @Override public boolean load(int account, Object size, Object photo, Object webPage) {
            log.add("load");
            loadedPhoto = photo;
            loadedWebPage = webPage;
            if (canLoad && appearsWhenLoaded != null) cacheFile = appearsWhenLoaded;
            return canLoad;
        }

        @Override public int account(Object chat) { return ACCOUNT; }

        @Override public long dialog(Object chat) { return DIALOG; }

        @Override public int chatMode(Object chat) { return chatMode; }

        @Override public Object editing(Object chat) { return editing; }

        @Override public Object reply(Object chat) { return reply; }

        @Override public Object thread(Object chat) { return thread; }

        @Override public Object quote(Object chat) { return quote; }

        @Override public Object arguments(Object chat) { return arguments; }

        @Override public long monoPeer(Object chat) { return MONO_PEER; }

        @Override public boolean photoAllowed(int account, long dialog) {
            assertEquals(ACCOUNT, account);
            assertEquals(DIALOG, dialog);
            return allowed;
        }

        @Override public int captionLimit(int account) { return limit; }

        @Override public ArrayList<?> entities(int account, CharSequence[] text) {
            entitiesSaw = text[0];
            if (afterEntities != null) text[0] = afterEntities;
            return formatting;
        }

        @Override public CharSequence text(Object chat) { return typed; }

        @Override public void clearText(Object chat) { log.add("clearText"); }

        @Override public void clearReply(Object chat) { log.add("clearReply"); }

        @Override public boolean sendPhoto(int account, long dialog, String path, String caption, ArrayList<?> entities,
                                           Object sentReply, Object sentThread, Object sentQuote, Object sentArguments, long monoPeer) {
            log.add("send");
            sends++;
            if (sendThrows != null) throw sendThrows;
            assertEquals(ACCOUNT, account);
            assertEquals(DIALOG, dialog);
            assertSame(reply, sentReply);
            assertSame(thread, sentThread);
            assertSame(quote, sentQuote);
            assertSame(arguments, sentArguments);
            assertEquals(MONO_PEER, monoPeer);
            sentPath = path;
            try {
                sentBytes = Files.readAllBytes(new File(path).toPath());
            } catch (IOException failure) {
                throw new AssertionError(failure);
            }
            sentCaption = caption;
            sentEntities = entities;
            return sendWorks;
        }

        @Override public boolean shown(View row) { return shown; }
    }

    @Before public void setUp() {
        context = RuntimeEnvironment.getApplication();
        realTelegram = LinkPreviewPhoto.telegram;
        realWork = LinkPreviewPhoto.work;
        realWait = LinkPreviewPhoto.waitMs;
        LinkPreviewPhoto.telegram = fake;
        LinkPreviewPhoto.work = Runnable::run;
        LinkPreviewPhoto.waitMs = 2000;
        Settings.LINK_PREVIEW_PHOTO.save(true);
        menu = new LinearLayout(context);
        apply = new TextView(context);
        remove = new TextView(context);
        remove.setOnClickListener(view -> log.add("remove"));
        menu.addView(apply, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 96));
        menu.addView(remove, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 96));
    }

    @After public void tearDown() {
        LinkPreviewPhoto.telegram = realTelegram;
        LinkPreviewPhoto.work = realWork;
        LinkPreviewPhoto.waitMs = realWait;
        Settings.LINK_PREVIEW_PHOTO.resetToDefault();
    }

    private File picture(String name) throws IOException {
        File file = folder.newFile(name);
        Files.write(file.toPath(), PICTURE);
        return file;
    }

    private View builtRow() {
        LinkPreviewPhoto.menuBuilt(page, remove);
        assertEquals("the row is in the menu", 3, menu.getChildCount());
        return menu.getChildAt(1);
    }

    private void idle() {
        shadowOf(Looper.getMainLooper()).idle();
    }

    private void idleFor(long ms) {
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(ms));
    }

    private void assertNoRow() {
        LinkPreviewPhoto.menuBuilt(page, remove);
        assertEquals(2, menu.getChildCount());
        assertEquals(0, fake.rowsMade);
    }

    @Test public void theSwitchStartsOff() {
        assertFalse(Settings.LINK_PREVIEW_PHOTO.defaultValue);
    }

    @Test public void theRowGoesBetweenApplyChangesAndRemovePreview() {
        View row = builtRow();
        assertSame(apply, menu.getChildAt(0));
        assertSame(remove, menu.getChildAt(2));
        assertEquals("Send photo", ((TextView) row).getText().toString());
        assertEquals(ViewGroup.LayoutParams.MATCH_PARENT, row.getLayoutParams().width);
        assertEquals(96, row.getLayoutParams().height);
        assertTrue(row.hasOnClickListeners());
    }

    @Test public void withTheSwitchOffTheMenuStaysAsItIs() {
        Settings.LINK_PREVIEW_PHOTO.save(false);
        assertNoRow();
    }

    @Test public void aPreviewWithoutAPictureGetsNoRow() {
        fake.currentPhoto = null;
        assertNoRow();
    }

    @Test public void aDraftWithoutAPreviewGetsNoRow() {
        fake.currentWebPage = null;
        assertNoRow();
    }

    @Test public void aPictureWithNoSizeToLoadGetsNoRow() {
        fake.currentSize = null;
        assertNoRow();
    }

    @Test public void aMenuOutsideAChatGetsNoRow() {
        fake.currentChat = null;
        assertNoRow();
    }

    @Test public void theScheduledScreenGetsNoRow() {
        fake.chatMode = 1;
        assertNoRow();
    }

    @Test public void editingAMessageGetsNoRow() {
        fake.editing = new Object();
        assertNoRow();
    }

    @Test public void aChatThatRefusesPhotosGetsNoRow() {
        fake.allowed = false;
        assertNoRow();
    }

    @Test public void aRemoveRowOutsideAMenuIsLeftAlone() {
        menu.removeView(remove);
        LinkPreviewPhoto.menuBuilt(page, remove);
        assertEquals(0, fake.rowsMade);
        LinkPreviewPhoto.menuBuilt(page, "not a view");
        assertEquals(0, fake.rowsMade);
    }

    @Test public void aFailureWhileBuildingLeavesTheMenuWorking() {
        LinkPreviewPhoto.telegram = new FakeTelegram() {
            @Override public View row(Object page, Context context, CharSequence title) {
                throw new IllegalStateException("no row");
            }
        };
        LinkPreviewPhoto.menuBuilt(page, remove);
        assertEquals(2, menu.getChildCount());
    }

    @Test public void aPictureOnThePhoneGoesOutWithTheTextAsCaption() throws IOException {
        fake.cacheFile = picture("cache.jpg");
        fake.typed = "  look at this https://example.com \n";
        builtRow().performClick();
        idle();

        assertEquals(Arrays.asList("send", "clearText", "clearReply", "remove"), log);
        assertEquals("look at this https://example.com", fake.sentCaption);
        assertSame(fake.formatting, fake.sentEntities);
        assertArrayEquals(PICTURE, fake.sentBytes);
        assertEquals("photo.jpg", new File(fake.sentPath).getName());
        assertFalse("Telegram's own file isn't what's sent", fake.cacheFile.getAbsolutePath().equals(fake.sentPath));
        assertTrue("outside the app's private folder", fake.sentPath.startsWith(context.getExternalCacheDir().getPath()));
        assertNull(ShadowToast.getLatestToast());
    }

    @Test public void thePictureInTheMediaFolderCountsToo() throws IOException {
        fake.mediaFile = picture("media.jpg");
        builtRow().performClick();
        idle();
        assertArrayEquals(PICTURE, fake.sentBytes);
        assertFalse(log.contains("load"));
    }

    @Test public void anEmptyFileIsNotAPicture() throws IOException {
        fake.cacheFile = folder.newFile("empty.jpg");
        fake.canLoad = false;
        builtRow().performClick();
        idle();
        assertEquals(Arrays.asList("load"), log);
        assertEquals("Couldn't get the photo. Try again.", ShadowToast.getTextOfLatestToast());
    }

    @Test public void anEmptyBoxSendsThePhotoAloneAndClearsNothingTyped() throws IOException {
        fake.cacheFile = picture("cache.jpg");
        fake.typed = "  \n ";
        builtRow().performClick();
        idle();
        assertEquals(Arrays.asList("send", "clearReply", "remove"), log);
        assertNull(fake.sentCaption);
        assertNull(fake.sentEntities);
        assertNull("nothing to read formatting from", fake.entitiesSaw);
    }

    @Test public void textTooLongForACaptionStaysInTheBox() throws IOException {
        fake.cacheFile = picture("cache.jpg");
        fake.typed = "twelve chars";
        fake.limit = 11;
        builtRow().performClick();
        idle();
        assertEquals(Arrays.asList("send", "clearReply", "remove"), log);
        assertNull(fake.sentCaption);
        assertNull(fake.sentEntities);
    }

    @Test public void textThatJustFitsGoesOut() throws IOException {
        fake.cacheFile = picture("cache.jpg");
        fake.typed = "twelve chars";
        fake.limit = 12;
        builtRow().performClick();
        idle();
        assertEquals("twelve chars", fake.sentCaption);
    }

    @Test public void theLimitIsCheckedOnTheTextTelegramWouldSend() throws IOException {
        fake.cacheFile = picture("cache.jpg");
        fake.typed = "**bold words**";
        fake.afterEntities = "bold words";
        fake.limit = 10;
        builtRow().performClick();
        idle();
        assertEquals("bold words", fake.sentCaption);
        assertTrue(log.contains("clearText"));
    }

    @Test public void telegramReadsAPieceOfTheTextNotTheBoxItself() throws IOException {
        fake.cacheFile = picture("cache.jpg");
        SpannableStringBuilder box = new SpannableStringBuilder("words");
        fake.typed = box;
        builtRow().performClick();
        idle();
        assertNotNull(fake.entitiesSaw);
        assertFalse(box == fake.entitiesSaw);
        assertEquals("words", fake.entitiesSaw.toString());
    }

    @Test public void aPictureNotOnThePhoneIsDownloadedFirst() throws IOException {
        File downloaded = picture("later.jpg");
        View row = builtRow();
        row.performClick();
        assertEquals(Arrays.asList("load"), log);
        assertSame(photo, fake.loadedPhoto);
        assertSame(webPage, fake.loadedWebPage);

        idleFor(500);
        assertEquals("still waiting", Arrays.asList("load"), log);
        fake.cacheFile = downloaded;
        idleFor(500);
        assertEquals(Arrays.asList("load", "send", "clearReply", "remove"), log);
        assertArrayEquals(PICTURE, fake.sentBytes);
    }

    @Test public void aDownloadThatNeverLandsSaysSoAndAllowsAnotherTap() throws IOException {
        View row = builtRow();
        row.performClick();
        idleFor(LinkPreviewPhoto.waitMs + 500);
        assertEquals(Arrays.asList("load"), log);
        assertEquals("Couldn't get the photo. Try again.", ShadowToast.getTextOfLatestToast());

        fake.cacheFile = picture("cache.jpg");
        row.performClick();
        idle();
        assertEquals(1, fake.sends);
    }

    @Test public void aPictureTelegramCantLoadSaysSo() {
        fake.canLoad = false;
        builtRow().performClick();
        idle();
        assertEquals("Couldn't get the photo. Try again.", ShadowToast.getTextOfLatestToast());
        assertEquals(0, fake.sends);
    }

    @Test public void closingTheMenuDuringTheDownloadStopsQuietly() throws IOException {
        File downloaded = picture("later.jpg");
        builtRow().performClick();
        fake.shown = false;
        fake.cacheFile = downloaded;
        idleFor(LinkPreviewPhoto.waitMs + 500);
        assertEquals(0, fake.sends);
        assertNull(ShadowToast.getLatestToast());
    }

    @Test public void closingTheMenuDuringTheCopySendsNothing() throws IOException {
        fake.cacheFile = picture("cache.jpg");
        View row = builtRow();
        row.performClick();
        fake.shown = false;
        idle();
        assertEquals(0, fake.sends);
        assertFalse(log.contains("remove"));
    }

    @Test public void aSecondTapWhileBusyDoesNothing() throws IOException {
        fake.cacheFile = picture("cache.jpg");
        View row = builtRow();
        row.performClick();
        row.performClick();
        idle();
        assertEquals(1, fake.sends);
    }

    @Test public void aRefusedSendKeepsTheDraftAndCanBeTriedAgain() throws IOException {
        fake.cacheFile = picture("cache.jpg");
        fake.typed = "words";
        fake.sendWorks = false;
        View row = builtRow();
        row.performClick();
        idle();
        assertEquals(Arrays.asList("send"), log);
        assertEquals("Couldn't send the photo. Try again.", ShadowToast.getTextOfLatestToast());

        fake.sendWorks = true;
        row.performClick();
        idle();
        assertEquals(Arrays.asList("send", "send", "clearText", "clearReply", "remove"), log);
    }

    @Test public void aSendThatThrowsKeepsTheDraft() throws IOException {
        fake.cacheFile = picture("cache.jpg");
        fake.typed = "words";
        fake.sendThrows = new IllegalStateException("no send");
        builtRow().performClick();
        idle();
        assertEquals(Arrays.asList("send"), log);
        assertEquals("Couldn't send the photo. Try again.", ShadowToast.getTextOfLatestToast());
    }

    @Test public void aPictureThatCantBeCopiedSaysSo() throws IOException {
        File gone = picture("cache.jpg");
        fake.cacheFile = gone;
        View row = builtRow();
        LinkPreviewPhoto.work = task -> {
            assertTrue(gone.delete());
            task.run();
        };
        row.performClick();
        idle();
        assertEquals(0, fake.sends);
        assertEquals("Couldn't send the photo. Try again.", ShadowToast.getTextOfLatestToast());
    }

    @Test public void aLinkThatChangedWhileTheMenuWasOpenSendsTheNewPicture() throws IOException {
        View row = builtRow();
        Object newPage = new Object();
        Object newPhoto = new Object();
        fake.currentWebPage = newPage;
        fake.currentPhoto = newPhoto;
        row.performClick();
        assertSame(newPage, fake.loadedWebPage);
        assertSame(newPhoto, fake.loadedPhoto);
    }

    @Test public void aPreviewThatLostItsPictureSaysSo() {
        View row = builtRow();
        fake.currentPhoto = null;
        row.performClick();
        idle();
        assertTrue(log.isEmpty());
        assertEquals("Couldn't get the photo. Try again.", ShadowToast.getTextOfLatestToast());
    }

    @Test public void theRowsFirstTapAfterASendCanSendAgain() throws IOException {
        fake.cacheFile = picture("cache.jpg");
        View row = builtRow();
        row.performClick();
        idle();
        row.performClick();
        idle();
        assertEquals(2, fake.sends);
    }
}
