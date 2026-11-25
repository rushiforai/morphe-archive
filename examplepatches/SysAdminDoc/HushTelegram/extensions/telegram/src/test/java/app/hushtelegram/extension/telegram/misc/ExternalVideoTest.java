/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Application;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.pm.ServiceInfo;
import android.net.Uri;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.util.ReflectionHelpers;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.Socket;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.BooleanSupplier;
import java.util.function.Consumer;

import app.hushtelegram.extension.shared.L10nTablesForTests;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ExternalVideoTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    @Rule public final TemporaryFolder folder = new TemporaryFolder();

    private static final int WAIT_MS = 5_000;
    private static final String NO_APP = "No app can play this video";
    private static final String NO_STREAM = "Couldn't stream this video";
    private static final Uri SHARED = Uri.parse("content://shared/clip.mp4");
    private static final Object MESSAGE = new Object();
    private static final Object CELL = new Object();

    private static final class Stream {
        long position;
        boolean closed;
    }

    /** Telegram, with a video that's fully allowed to leave and isn't on the phone yet. */
    private static final class Fake implements ExternalVideo.Telegram {
        boolean video = true;
        boolean round;
        boolean gif;
        boolean secret;
        boolean blurred;
        boolean encrypted;
        boolean noForwards;
        boolean chatNoForwards;
        Object document = new Object();
        String path;
        File file;
        String name = "clip.mp4";
        String mime = "video/mp4";
        byte[] bytes = new byte[50_000];
        long size = bytes.length;
        String key = "12_34.mp4";
        boolean loading;
        Uri streamAddress = Uri.parse("tg://12_34.mp4?account=2");
        Uri shared = SHARED;
        boolean providerRefuses;
        String authority;
        Object cellMessage = MESSAGE;
        int cellButton;
        RuntimeException broken;
        final List<Boolean> marks = new CopyOnWriteArrayList<>();
        final List<Stream> streams = new CopyOnWriteArrayList<>();
        final AtomicInteger cancels = new AtomicInteger();
        int cancelledAccount;
        Object cancelledDocument;

        Fake() {
            for (int i = 0; i < bytes.length; i++) bytes[i] = (byte) (i * 7);
        }

        @Override public boolean isVideo(Object message) {
            if (broken != null) throw broken;
            return video;
        }
        @Override public boolean isRound(Object message) { return round; }
        @Override public boolean isGif(Object message) { return gif; }
        @Override public boolean isSecret(Object message) { return secret; }
        @Override public boolean isBlurred(Object message) { return blurred; }
        @Override public long dialog(Object message) { return 77; }
        @Override public boolean dialogEncrypted(long dialog) { return encrypted && dialog == 77; }
        @Override public boolean noForwards(Object message) { return noForwards; }
        @Override public boolean peerNoForwards(int account, long dialog) { return chatNoForwards && account == 2 && dialog == 77; }
        @Override public Object document(Object message) { return document; }
        @Override public int account(Object message) { return 2; }
        @Override public String path(Object message) { return path; }
        @Override public File file(Object message) { return file; }
        @Override public String name(Object message) { return name; }
        @Override public void markDownload(Object message, boolean marked) { marks.add(marked); }
        @Override public String mime(Object document) { return mime; }
        @Override public long size(Object document) { return size; }
        @Override public String key(Object document) { return key; }
        @Override public boolean loading(int account, String key) { return loading; }
        @Override public void cancelLoad(int account, Object document) {
            cancelledAccount = account;
            cancelledDocument = document;
            cancels.incrementAndGet();
        }
        @Override public Uri streamAddress(int account, Object message, Object document) { return streamAddress; }
        @Override public Object newStream() {
            Stream stream = new Stream();
            streams.add(stream);
            return stream;
        }
        @Override public void openStream(Object stream, Uri address, long position, long length) {
            assertEquals(streamAddress, address);
            ((Stream) stream).position = position;
        }
        @Override public int readStream(Object stream, byte[] into, int offset, int count) {
            Stream reading = (Stream) stream;
            if (reading.position >= bytes.length) return -1;
            int length = (int) Math.min(count, bytes.length - reading.position);
            System.arraycopy(bytes, (int) reading.position, into, offset, length);
            reading.position += length;
            return length;
        }
        @Override public void closeStream(Object stream) { ((Stream) stream).closed = true; }
        @Override public Uri fileAddress(Context context, String authority, File file) {
            this.authority = authority;
            if (providerRefuses) throw new IllegalArgumentException("not a shared root");
            return shared;
        }
        @Override public Object cellMessage(Object cell) { return cell == CELL ? cellMessage : null; }
        @Override public int cellButton(Object cell) { return cellButton; }
    }

    private static final class FakePhone implements ExternalVideo.Phone {
        final List<Intent> views = new CopyOnWriteArrayList<>();
        final List<String> toasts = new CopyOnWriteArrayList<>();
        final AtomicInteger keepAlives = new AtomicInteger();
        final AtomicInteger stopped = new AtomicInteger();
        boolean noPlayer;
        RuntimeException keepAliveRefusal;

        @Override public void keepAlive(Context context) {
            keepAlives.incrementAndGet();
            if (keepAliveRefusal != null) throw keepAliveRefusal;
        }

        @Override public void view(Context context, Intent intent) {
            if (noPlayer) throw new ActivityNotFoundException("no player");
            views.add(intent);
        }

        @Override public void toast(String text) { toasts.add(text); }

        @Override public void stopped() { stopped.incrementAndGet(); }
    }

    private Fake telegram;
    private FakePhone phone;
    private Application application;

    @Before public void setUp() {
        application = RuntimeEnvironment.getApplication();
        telegram = new Fake();
        phone = new FakePhone();
        ExternalVideo.reset();
        ExternalVideo.telegram = telegram;
        ExternalVideo.phone = phone;
        HookStatus.clear();
        Settings.EXTERNAL_PLAYER.save(true);
        PatchFamilyForTests.inBuild(PatchFamily.KEEP_VIDEOS_MUTED);
        PatchFamilyForTests.installed(PatchFamily.Capability.EXTERNAL_PLAYER);
    }

    @After public void restore() {
        ExternalVideo.reset();
        Settings.EXTERNAL_PLAYER.resetToDefault();
        PatchFamilyForTests.reset();
        PatchFamilyForTests.resetCapabilities();
        HookStatus.clear();
    }

    private static String report() {
        return String.join("\n", HookStatus.report());
    }

    private static void await(String what, BooleanSupplier done) throws InterruptedException {
        long deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(WAIT_MS);
        while (!done.getAsBoolean()) {
            assertTrue("timed out waiting for " + what, System.nanoTime() < deadline);
            Thread.sleep(5);
        }
    }

    private File fileOf(String name, byte[] bytes) throws IOException {
        File file = folder.newFile(name);
        try (FileOutputStream out = new FileOutputStream(file)) {
            out.write(bytes);
        }
        return file;
    }

    /** The body of a request to the address the player was given. */
    private static byte[] fetch(Uri address, String range) throws IOException {
        try (Socket socket = new Socket(address.getHost(), address.getPort())) {
            socket.setSoTimeout(WAIT_MS);
            String request = "GET " + address.getPath() + " HTTP/1.1\r\nHost: player\r\n"
                    + (range == null ? "" : "Range: " + range + "\r\n") + "\r\n";
            socket.getOutputStream().write(request.getBytes(StandardCharsets.ISO_8859_1));
            ByteArrayOutputStream all = new ByteArrayOutputStream();
            InputStream in = socket.getInputStream();
            byte[] buffer = new byte[8192];
            for (int read; (read = in.read(buffer)) >= 0; ) all.write(buffer, 0, read);
            byte[] raw = all.toByteArray();
            String text = new String(raw, StandardCharsets.ISO_8859_1);
            return Arrays.copyOfRange(raw, text.indexOf("\r\n\r\n") + 4, raw.length);
        }
    }

    private Intent onlyView() {
        assertEquals(1, phone.views.size());
        return phone.views.get(0);
    }

    private void assertStaysInTelegram(int answer) {
        assertEquals(0, answer);
        assertTrue(phone.views.isEmpty());
    }

    private static void assertHas(int flags, int flag) {
        assertEquals(flag, flags & flag);
    }

    @Test public void theSwitchStartsOffAndNothingChangesUntilItIsOn() {
        Settings.EXTERNAL_PLAYER.resetToDefault();
        assertFalse(Settings.EXTERNAL_PLAYER.defaultValue);
        assertFalse(Settings.EXTERNAL_PLAYER.get());
        assertStaysInTelegram(ExternalVideo.open(MESSAGE));
        assertStaysInTelegram(ExternalVideo.pressed(CELL, 0));
        assertTrue(telegram.marks.isEmpty());
        assertFalse(ExternalVideo.streaming());
    }

    @Test public void aBuildWithoutTheHooksStaysInTelegram() {
        PatchFamilyForTests.installed();
        assertStaysInTelegram(ExternalVideo.open(MESSAGE));
    }

    @Test public void noMessageStaysInTelegram() {
        assertStaysInTelegram(ExternalVideo.open(null));
        telegram.cellMessage = null;
        assertStaysInTelegram(ExternalVideo.pressed(CELL, 0));
    }

    @Test public void onlyPlainVideosFromOpenChatsLeaveTelegram() {
        List<Consumer<Fake>> kept = Arrays.asList(
                fake -> fake.video = false,
                fake -> fake.round = true,
                fake -> fake.gif = true,
                fake -> fake.secret = true,
                fake -> fake.blurred = true,
                fake -> fake.encrypted = true,
                fake -> fake.noForwards = true,
                fake -> fake.chatNoForwards = true,
                fake -> fake.document = null);
        for (int i = 0; i < kept.size(); i++) {
            telegram = new Fake();
            kept.get(i).accept(telegram);
            ExternalVideo.telegram = telegram;
            assertEquals("case " + i, 0, ExternalVideo.open(MESSAGE));
            assertEquals("case " + i, 0, ExternalVideo.pressed(CELL, 0));
            assertTrue("case " + i, phone.views.isEmpty());
            assertTrue("case " + i, phone.toasts.isEmpty());
            assertTrue("case " + i, telegram.marks.isEmpty());
        }
    }

    @Test public void aFileOnThePhoneGoesOverAsAnAddressThePlayerMayRead() throws Exception {
        telegram.path = fileOf("sent.mp4", new byte[] {1, 2, 3}).getPath();
        assertEquals(1, ExternalVideo.open(MESSAGE));
        Intent view = onlyView();
        assertEquals(Intent.ACTION_VIEW, view.getAction());
        assertEquals(SHARED, view.getData());
        assertEquals("video/mp4", view.getType());
        assertHas(view.getFlags(), Intent.FLAG_ACTIVITY_NEW_TASK);
        assertHas(view.getFlags(), Intent.FLAG_GRANT_READ_URI_PERMISSION);
        assertEquals(application.getPackageName() + ".provider", telegram.authority);
        assertEquals("nothing needs to keep running", 0, phone.keepAlives.get());
        assertFalse(ExternalVideo.streaming());
        assertTrue(report(), report().contains(ExternalVideo.OPENED));
    }

    @Test public void aDownloadedFileIsFoundWhereTelegramKeepsIt() throws Exception {
        telegram.path = new File(folder.getRoot(), "gone.mp4").getPath();
        telegram.file = fileOf("cached.mp4", new byte[] {1});
        assertEquals(1, ExternalVideo.open(MESSAGE));
        assertEquals(SHARED, onlyView().getData());
    }

    @Test public void anEmptyFileIsNotAVideoYet() throws Exception {
        telegram.file = fileOf("empty.mp4", new byte[0]);
        assertEquals(1, ExternalVideo.open(MESSAGE));
        assertEquals("http", onlyView().getData().getScheme());
    }

    @Test public void anOddTypeFromTheSenderIsNotPassedOn() throws Exception {
        telegram.file = fileOf("odd.mp4", new byte[] {1});
        telegram.mime = "text/html";
        assertEquals(1, ExternalVideo.open(MESSAGE));
        assertEquals("video/*", onlyView().getType());
    }

    @Test public void noPlayerForAFileFallsBackToTelegramWithAToast() throws Exception {
        telegram.file = fileOf("clip.mp4", new byte[] {1});
        phone.noPlayer = true;
        assertEquals(0, ExternalVideo.open(MESSAGE));
        assertEquals(Arrays.asList(NO_APP), phone.toasts);
    }

    @Test public void aFileTheProviderWontShareIsServedInstead() throws Exception {
        byte[] bytes = {9, 8, 7, 6, 5};
        telegram.file = fileOf("private.mp4", bytes);
        telegram.providerRefuses = true;
        assertEquals(1, ExternalVideo.open(MESSAGE));
        Intent view = onlyView();
        assertEquals("127.0.0.1", view.getData().getHost());
        assertEquals("http", view.getData().getScheme());
        assertEquals("no grant goes with a web address", 0, view.getFlags() & Intent.FLAG_GRANT_READ_URI_PERMISSION);
        assertEquals(1, phone.keepAlives.get());
        assertArrayEquals(bytes, fetch(view.getData(), null));
    }

    @Test public void aVideoThatIsNotDownloadedStreamsAndCanSeek() throws Exception {
        assertEquals(1, ExternalVideo.open(MESSAGE));
        Intent view = onlyView();
        Uri address = view.getData();
        assertEquals("http", address.getScheme());
        assertEquals("127.0.0.1", address.getHost());
        assertTrue(address.getPath(), address.getPath().matches("/[0-9a-f]{32}/clip\\.mp4"));
        assertEquals("video/mp4", view.getType());
        assertHas(view.getFlags(), Intent.FLAG_ACTIVITY_NEW_TASK);
        assertEquals("kept running behind the player", 1, phone.keepAlives.get());
        assertTrue(ExternalVideo.streaming());
        assertTrue(report(), report().contains(ExternalVideo.STREAMED));

        assertArrayEquals(telegram.bytes, fetch(address, null));
        assertArrayEquals(Arrays.copyOfRange(telegram.bytes, 40_000, 40_010), fetch(address, "bytes=40000-40009"));
        assertEquals(2, telegram.streams.size());
        await("the streams to close", () -> telegram.streams.get(0).closed && telegram.streams.get(1).closed);
    }

    @Test public void stoppingEndsTheStreamAndTheDownloadItStarted() throws Exception {
        assertEquals(1, ExternalVideo.open(MESSAGE));
        ExternalVideo.stopStreaming();
        await("the server to stop", () -> !ExternalVideo.streaming());
        await("the phone to hear", () -> phone.stopped.get() == 1);
        await("the download to end", () -> telegram.cancels.get() == 1);
        assertEquals(2, telegram.cancelledAccount);
        assertEquals(telegram.document, telegram.cancelledDocument);
    }

    @Test public void aDownloadThePersonStartedCarriesOn() throws Exception {
        telegram.loading = true;
        assertEquals(1, ExternalVideo.open(MESSAGE));
        ExternalVideo.stopStreaming();
        await("the phone to hear", () -> phone.stopped.get() == 1);
        assertEquals(0, telegram.cancels.get());
    }

    @Test public void closingThePlayerEndsTheDownloadAndThenTheServer() throws Exception {
        VideoStreamServer.Timing timing = new VideoStreamServer.Timing();
        timing.tickMs = 20;
        timing.unwatchedMs = 40;
        timing.emptyMs = 200;
        ExternalVideo.timing = timing;
        assertEquals(1, ExternalVideo.open(MESSAGE));
        fetch(onlyView().getData(), "bytes=0-9");
        await("the download to end", () -> telegram.cancels.get() == 1);
        await("the server to stop", () -> !ExternalVideo.streaming());
        await("the phone to hear", () -> phone.stopped.get() == 1);
    }

    @Test public void aSecondVideoSharesTheServer() throws Exception {
        assertEquals(1, ExternalVideo.open(MESSAGE));
        telegram.key = "56_78.mp4";
        assertEquals(1, ExternalVideo.open(MESSAGE));
        assertEquals(2, phone.views.size());
        Uri first = phone.views.get(0).getData();
        Uri second = phone.views.get(1).getData();
        assertEquals(first.getPort(), second.getPort());
        assertFalse(first.getPath().equals(second.getPath()));
    }

    @Test public void whenAndroidWontKeepTheAppRunningTheVideoStaysInTelegram() throws Exception {
        phone.keepAliveRefusal = new IllegalStateException("not allowed");
        assertStaysInTelegram(ExternalVideo.open(MESSAGE));
        assertEquals(Arrays.asList(NO_STREAM), phone.toasts);
        await("the server to stop", () -> !ExternalVideo.streaming());
        await("the phone to hear", () -> phone.stopped.get() == 1);
        await("the stream's download to end", () -> telegram.cancels.get() == 1);
    }

    @Test public void noPlayerForAStreamFallsBackToTelegramWithAToast() throws Exception {
        phone.noPlayer = true;
        assertEquals(0, ExternalVideo.open(MESSAGE));
        assertEquals(Arrays.asList(NO_APP), phone.toasts);
        await("the server to stop", () -> !ExternalVideo.streaming());
    }

    @Test public void aVideoThatJustFinishedArrivingOpensAsAFile() throws Exception {
        telegram.streamAddress = Uri.fromFile(fileOf("arrived.mp4", new byte[] {1, 2}));
        assertEquals(1, ExternalVideo.open(MESSAGE));
        assertEquals(SHARED, onlyView().getData());
        assertFalse(ExternalVideo.streaming());
    }

    @Test public void aVideoThatCannotBeStreamedSaysSo() {
        List<Consumer<Fake>> unusable = Arrays.asList(
                fake -> fake.streamAddress = null,
                fake -> fake.streamAddress = Uri.parse("https://example.com/video.mp4"),
                fake -> fake.streamAddress = Uri.fromFile(new File("/nothing/here.mp4")),
                fake -> fake.size = 0,
                fake -> fake.mime = null,
                fake -> fake.key = null,
                fake -> fake.key = "");
        for (int i = 0; i < unusable.size(); i++) {
            telegram = new Fake();
            unusable.get(i).accept(telegram);
            ExternalVideo.telegram = telegram;
            phone.toasts.clear();
            assertStaysInTelegram(ExternalVideo.open(MESSAGE));
            assertEquals("case " + i, Arrays.asList(NO_STREAM), phone.toasts);
            assertFalse("case " + i, ExternalVideo.streaming());
        }
    }

    @Test public void theDownloadArrowOpensThePlayerWithoutListingADownload() throws Exception {
        assertEquals(1, ExternalVideo.pressed(CELL, 0));
        assertEquals("http", onlyView().getData().getScheme());
        assertEquals(Arrays.asList(false), telegram.marks);
    }

    @Test public void theCornerDownloadButtonStillDownloads() {
        assertStaysInTelegram(ExternalVideo.pressed(CELL, 1));
        assertTrue(telegram.marks.isEmpty());
    }

    @Test public void onlyTheDownloadStateOfTheButtonCounts() {
        for (int state : new int[] {-1, 1, 2, 3, 4}) {
            telegram.cellButton = state;
            assertStaysInTelegram(ExternalVideo.pressed(CELL, 0));
        }
        assertTrue(telegram.marks.isEmpty());
    }

    @Test public void aPressThatCannotOpenThePlayerStillDownloadsAsMarked() {
        phone.noPlayer = true;
        assertEquals(0, ExternalVideo.pressed(CELL, 0));
        assertEquals(Arrays.asList(false, true), telegram.marks);
        assertEquals(Arrays.asList(NO_APP), phone.toasts);
    }

    @Test public void aFailureLeavesTelegramToOpenTheVideo() {
        telegram.broken = new IllegalStateException("Telegram changed");
        assertStaysInTelegram(ExternalVideo.open(MESSAGE));
        assertStaysInTelegram(ExternalVideo.pressed(CELL, 0));
        assertTrue(report(), report().contains("threw"));
    }

    @Test public void theToastsFitTwoLinesInEveryLanguage() {
        for (String toast : new String[] {NO_APP, NO_STREAM}) {
            assertFitsATwoLineToast("en", toast);
            for (String language : new String[] {"bg", "de", "es", "in", "pt-rbr", "tr", "zh-hans"}) {
                String row = L10nTablesForTests.of(language).get(toast);
                assertNotNull(language + ": " + toast, row);
                assertFitsATwoLineToast(language, row);
            }
        }
    }

    /** A toast line holds about 34 characters on a small phone; 28 leaves room for wider letters. */
    private static void assertFitsATwoLineToast(String language, String text) {
        List<String> lines = new ArrayList<>();
        StringBuilder line = new StringBuilder();
        for (String word : text.split(" ")) {
            if (line.length() > 0 && line.length() + 1 + word.length() > 28) {
                lines.add(line.toString());
                line.setLength(0);
            }
            if (line.length() > 0) line.append(' ');
            line.append(word);
        }
        if (line.length() > 0) lines.add(line.toString());
        assertTrue(language + ": " + text, lines.size() <= 2);
        for (String each : lines) assertTrue(language + ": " + each, each.length() <= 28);
    }

    private static ExternalVideoService service() {
        return Robolectric.buildService(ExternalVideoService.class).create().get();
    }

    @Test public void theServiceStaysInFrontWhileAStreamRuns() {
        assertEquals(1, ExternalVideo.open(MESSAGE));
        ExternalVideoService service = service();
        try {
            service.onStartCommand(new Intent(), 0, 1);
            assertEquals(ExternalVideoService.NOTIFICATION_ID, shadowOf(service).getLastForegroundNotificationId());
            assertFalse(shadowOf(service).isForegroundStopped());
            ExternalVideoService.finish();
            assertTrue(shadowOf(service).isForegroundStopped());
            assertTrue("the notification goes with it", shadowOf(service).getNotificationShouldRemoved());
        } finally {
            service.onDestroy();
        }
    }

    @Test public void theServiceEndsAtOnceWithNothingToKeepRunning() {
        ExternalVideoService service = service();
        try {
            service.onStartCommand(new Intent(), 0, 1);
            assertEquals("Android still has to see it in front", ExternalVideoService.NOTIFICATION_ID,
                    shadowOf(service).getLastForegroundNotificationId());
            assertTrue(shadowOf(service).isForegroundStopped());
        } finally {
            service.onDestroy();
        }
    }

    @Test public void theNotificationsStopButtonEndsTheStream() throws Exception {
        assertEquals(1, ExternalVideo.open(MESSAGE));
        ExternalVideoService service = service();
        try {
            service.onStartCommand(new Intent(ExternalVideoService.STOP), 0, 1);
            await("the server to stop", () -> !ExternalVideo.streaming());
            assertTrue(shadowOf(service).isForegroundStopped());
        } finally {
            service.onDestroy();
        }
    }

    @Test public void aServiceAndroidWontPutInFrontEndsTheStream() throws Exception {
        assertEquals(1, ExternalVideo.open(MESSAGE));
        ExternalVideoService service = service();
        shadowOf(service).setThrowInStartForeground(new IllegalStateException("refused"));
        try {
            service.onStartCommand(new Intent(), 0, 1);
            await("the server to stop", () -> !ExternalVideo.streaming());
            assertTrue(report(), report().contains("threw"));
        } finally {
            service.onDestroy();
        }
    }

    @Test public void theNotificationSaysWhatIsHappeningAndCanStopIt() {
        Notification notification = ExternalVideoService.notification(application);
        assertEquals("Playing video in another app", notification.extras.getString(Notification.EXTRA_TITLE));
        assertEquals("Stops on its own when the player closes.", notification.extras.getString(Notification.EXTRA_TEXT));
        assertEquals(1, notification.actions.length);
        assertEquals("Stop", String.valueOf(notification.actions[0].title));
        assertEquals(ExternalVideoService.CHANNEL, notification.getChannelId());
        NotificationChannel channel = application.getSystemService(NotificationManager.class)
                .getNotificationChannel(ExternalVideoService.CHANNEL);
        assertEquals("Video streaming", String.valueOf(channel.getName()));
        assertEquals(NotificationManager.IMPORTANCE_MIN, channel.getImportance());
    }

    @Test public void aBuildWithoutTheServiceRefusesBeforeThePlayerOpens() {
        Context missing = new ContextWrapper(application) {
            @Override public ComponentName startForegroundService(Intent service) {
                return null;
            }
        };
        assertThrows(IllegalStateException.class, () -> ExternalVideoService.start(missing));
    }

    private void declareService(int types) {
        ServiceInfo info = new ServiceInfo();
        info.packageName = application.getPackageName();
        info.name = ExternalVideoService.class.getName();
        info.applicationInfo = application.getApplicationInfo();
        // ServiceInfo keeps the manifest's foregroundServiceType in a field with no public setter.
        ReflectionHelpers.setField(info, "mForegroundServiceType", types);
        shadowOf(application.getPackageManager()).addOrUpdateService(info);
    }

    @Test @Config(sdk = 34) public void android14RefusesUnlessTheMediaTypeIsDeclaredAndAllowed() {
        assertThrows("not in the manifest", IllegalStateException.class, () -> ExternalVideoService.start(application));

        shadowOf(application).grantPermissions(ExternalVideoService.PERMISSION);
        declareService(ServiceInfo.FOREGROUND_SERVICE_TYPE_DATA_SYNC);
        assertThrows("another type", IllegalStateException.class, () -> ExternalVideoService.start(application));

        declareService(ServiceInfo.FOREGROUND_SERVICE_TYPE_MEDIA_PLAYBACK);
        shadowOf(application).denyPermissions(ExternalVideoService.PERMISSION);
        assertThrows("no permission", IllegalStateException.class, () -> ExternalVideoService.start(application));

        shadowOf(application).grantPermissions(ExternalVideoService.PERMISSION);
        ExternalVideoService.start(application);
        Intent started = shadowOf(application).getNextStartedService();
        assertEquals(ExternalVideoService.class.getName(), started.getComponent().getClassName());
    }
}
