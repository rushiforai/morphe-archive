package app.hushmessenger.extension;

import android.os.Looper;
import android.view.View;
import android.widget.TextView;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35)
public class UpdateCheckTest {
    private static final String DEFAULT_URL = SettingsActivity.releasesUrl;
    private static final String RELEASE_PAGE = "https://github.com/SysAdminDoc/HushMessenger/releases/tag/v99.0.0";

    private interface Reply { void send(OutputStream out) throws IOException; }

    private ServerSocket server;
    private final CountDownLatch hold = new CountDownLatch(1);
    private final AtomicInteger requests = new AtomicInteger();
    private volatile Reply reply;

    @Before public void start() throws IOException {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        server = new ServerSocket(0, 50, InetAddress.getByName("127.0.0.1"));
        Thread acceptor = new Thread(() -> {
            while (true) {
                Socket client;
                try { client = server.accept(); } catch (IOException closed) { return; }
                requests.incrementAndGet();
                new Thread(() -> serve(client)).start();
            }
        });
        acceptor.setDaemon(true);
        acceptor.start();
        SettingsActivity.releasesUrl = "http://127.0.0.1:" + server.getLocalPort() + "/releases/latest";
        SettingsActivity.updateTimeoutMillis = 500;
    }

    @After public void stop() throws IOException {
        hold.countDown();
        server.close();
        SettingsActivity.releasesUrl = DEFAULT_URL;
        SettingsActivity.updateTimeoutMillis = 5000;
    }

    @Test public void versionsCompareAsNumbers() {
        assertTrue(SettingsActivity.compareVersions("0.10.0", "0.9.0") > 0);
        assertTrue(SettingsActivity.compareVersions("0.9.0", "0.10.0") < 0);
        assertTrue(SettingsActivity.compareVersions("1.0.0", "0.99.0") > 0);
        assertEquals(0, SettingsActivity.compareVersions("v0.6.0", "0.6.0"));
        assertEquals(0, SettingsActivity.compareVersions("0.6", "0.6.0"));
        assertTrue(SettingsActivity.compareVersions("0.7.0-dev.1", "0.6.0") > 0);
        assertTrue(SettingsActivity.compareVersions("0.7.0-dev.1", "0.7.0") < 0);
        assertTrue(SettingsActivity.compareVersions("0.7.0", "0.7.0-dev.1") > 0);
    }

    @Test public void onlyThisProjectsReleasePagesAreOffered() {
        assertEquals(RELEASE_PAGE, SettingsActivity.releasePage(RELEASE_PAGE));
        assertEquals("", SettingsActivity.releasePage("https://github.com/someone/else/releases/tag/v99.0.0"));
        assertEquals("", SettingsActivity.releasePage("https://github.com/SysAdminDoc/HushMessenger.evil/releases/x"));
        assertEquals("", SettingsActivity.releasePage("http://github.com/SysAdminDoc/HushMessenger/releases/tag/v1"));
        assertEquals("", SettingsActivity.releasePage("https://github.com/SysAdminDoc/HushMessenger/releases/../../../evil/x"));
        assertEquals("", SettingsActivity.releasePage("https://github.com/SysAdminDoc/HushMessenger/releases/tag/%2e%2e/x"));
        assertEquals("", SettingsActivity.releasePage("https://github.com/SysAdminDoc/HushMessenger/releases/tag/.."));
        assertEquals("", SettingsActivity.releasePage("https://github.com/SysAdminDoc/HushMessenger/releases/tag/v1?x=https://evil"));
        assertEquals("", SettingsActivity.releasePage("https://github.com.evil/SysAdminDoc/HushMessenger/releases/tag/v1"));
        assertEquals("", SettingsActivity.releasePage(""));
    }

    @Test public void aNewerReleaseOffersItsPage() throws Exception {
        reply = json(200, release("v99.0.0", RELEASE_PAGE));
        View root = openWithCheckOn();
        assertEquals("Version 99.0.0 is available", awaitStatus(root).getText().toString());
        assertNotNull(root.findViewWithTag("update_release"));
    }

    @Test public void theSameReleaseSaysUpToDate() throws Exception {
        reply = json(200, release("v" + BuildConfig.VERSION_NAME, RELEASE_PAGE));
        View root = openWithCheckOn();
        assertEquals("You have the latest version.", awaitStatus(root).getText().toString());
        assertNull(root.findViewWithTag("update_release"));
    }

    @Test public void aReleaseLinkOutsideThisProjectGetsNoButton() throws Exception {
        reply = json(200, release("v99.0.0", "https://example.com/releases/tag/v99.0.0"));
        View root = openWithCheckOn();
        assertEquals("Version 99.0.0 is available", awaitStatus(root).getText().toString());
        assertNull(root.findViewWithTag("update_release"));
    }

    @Test public void rateLimitingShowsTheError() throws Exception {
        reply = json(403, "{\"message\":\"API rate limit exceeded\"}");
        assertEquals("Couldn't check for updates.", awaitStatus(openWithCheckOn()).getText().toString());
    }

    @Test public void aBodyWithoutATagShowsTheError() throws Exception {
        reply = json(200, "{\"name\":\"latest\"}");
        assertEquals("Couldn't check for updates.", awaitStatus(openWithCheckOn()).getText().toString());
    }

    @Test public void aServerThatNeverAnswersTimesOut() throws Exception {
        // Hold the connection open past awaitStatus's window, so only the read timeout can end the wait.
        reply = out -> {
            try { hold.await(20, TimeUnit.SECONDS); } catch (InterruptedException ignored) { Thread.currentThread().interrupt(); }
        };
        long started = System.nanoTime();
        assertEquals("Couldn't check for updates.", awaitStatus(openWithCheckOn()).getText().toString());
        long waited = TimeUnit.NANOSECONDS.toMillis(System.nanoTime() - started);
        assertTrue("Gave up after " + waited + " ms with a 500 ms timeout", waited < 3000);
    }

    @Test public void nothingIsFetchedWhileTheSwitchIsOff() throws Exception {
        reply = json(200, release("v99.0.0", RELEASE_PAGE));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            Thread.sleep(300);
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals(View.GONE, ((View) root.findViewWithTag("update_status")).getVisibility());
        }
        assertEquals(0, requests.get());
    }

    private View openWithCheckOn() {
        Settings.preferences.edit().putBoolean("check_updates", true).commit();
        return Robolectric.buildActivity(SettingsActivity.class).setup().get().getWindow().getDecorView();
    }

    private static TextView awaitStatus(View root) throws InterruptedException {
        TextView status = root.findViewWithTag("update_status");
        long deadline = System.currentTimeMillis() + 10_000;
        while (status.getVisibility() != View.VISIBLE && System.currentTimeMillis() < deadline) {
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            Thread.sleep(20);
        }
        assertEquals(View.VISIBLE, status.getVisibility());
        return status;
    }

    private static String release(String tag, String page) {
        return "{\"html_url\":\"" + page + "\",\"tag_name\":\"" + tag + "\",\"author\":{\"html_url\":\"https://github.com/SysAdminDoc\"}}";
    }

    /** Reads the request headers, then lets the test's reply answer, and closes the connection. */
    private void serve(Socket client) {
        try (Socket socket = client) {
            InputStream in = socket.getInputStream();
            int matched = 0;
            while (matched < 4) {
                int next = in.read();
                if (next < 0) return;
                matched = next == "\r\n\r\n".charAt(matched) ? matched + 1 : (next == '\r' ? 1 : 0);
            }
            reply.send(socket.getOutputStream());
        } catch (IOException ignored) {
            // The client gave up (the timeout case); nothing to answer.
        }
    }

    private static Reply json(int code, String body) {
        return out -> {
            byte[] bytes = body.getBytes(StandardCharsets.UTF_8);
            String head = "HTTP/1.1 " + code + " Test\r\nContent-Type: application/json\r\nContent-Length: "
                + bytes.length + "\r\nConnection: close\r\n\r\n";
            out.write(head.getBytes(StandardCharsets.US_ASCII));
            out.write(bytes);
            out.flush();
        };
    }
}
