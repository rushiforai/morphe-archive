package app.morphe.extension.swiftkey;

import android.content.ClipData;
import android.content.ClipDescription;
import android.content.ClipboardManager;
import android.content.Context;
import android.os.PersistableBundle;
import android.os.SystemClock;
import android.os.UserManager;
import android.util.Log;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

/**
 * Sends text copied on the phone to the paired Mac, and puts text copied on the Mac on the phone's
 * clipboard while the keyboard is open. KeyboardService calls the public hooks on the main thread.
 * Network calls and sync state stay on one worker thread, so uploads and downloads run in order.
 */
public final class MacClipboardSync {
    private static final String TAG = "MacClipboardSync";
    /** ClipDescription.EXTRA_IS_SENSITIVE, set by password managers since Android 13. */
    private static final String SENSITIVE = "android.content.extra.IS_SENSITIVE";
    private static final long POLL_MILLIS = 2000;
    private static final long RETRY_MILLIS = 10000;
    private static final long UPLOAD_DEADLINE_MILLIS = 5 * 60 * 1000;

    private static final ScheduledExecutorService worker = Executors.newSingleThreadScheduledExecutor(task -> {
        Thread thread = new Thread(task, "mac-clipboard-sync");
        thread.setDaemon(true);
        return thread;
    });
    private static final ClipboardManager.OnPrimaryClipChangedListener listener = MacClipboardSync::onLocalCopy;

    private static volatile Context appContext;
    private static volatile ClipboardManager clipboard;
    // Main thread only.
    private static ScheduledFuture<?> polling;
    // Worker thread only.
    private static MacClipboardClient client;
    private static boolean clientLoaded;
    private static String lastHash;
    private static String pendingText;
    private static long pendingSince;
    private static boolean retryScheduled;

    private MacClipboardSync() {}

    /** KeyboardService.onCreate. */
    public static void start(Context service) {
        try {
            appContext = service.getApplicationContext();
            clipboard = (ClipboardManager) appContext.getSystemService(Context.CLIPBOARD_SERVICE);
            clipboard.removePrimaryClipChangedListener(listener);
            clipboard.addPrimaryClipChangedListener(listener);
            // Treat the clip already on the phone as synced, so a restart does not send it again.
            String current = copiedText();
            if (current != null) worker.execute(() -> {
                if (lastHash == null) lastHash = MacClipboardClient.hash(current);
            });
        } catch (RuntimeException error) {
            Log.w(TAG, "Could not start", error);
        }
    }

    /** KeyboardService.onDestroy. */
    public static void stop() {
        try {
            hidden();
            if (clipboard != null) clipboard.removePrimaryClipChangedListener(listener);
        } catch (RuntimeException error) {
            Log.w(TAG, "Could not stop", error);
        }
    }

    /** KeyboardService.onWindowShown: fetch the Mac's latest text before the user pastes. */
    public static void shown() {
        if (appContext == null || polling != null) return;
        polling = worker.scheduleWithFixedDelay(MacClipboardSync::poll, 0, POLL_MILLIS, TimeUnit.MILLISECONDS);
    }

    /** KeyboardService.onWindowHidden. */
    public static void hidden() {
        if (polling == null) return;
        polling.cancel(false);
        polling = null;
    }

    /** Called by the settings screen after it pairs or unpairs. */
    static void reload() {
        worker.execute(() -> {
            client = null;
            clientLoaded = false;
            pendingText = null;
        });
    }

    private static void onLocalCopy() {
        try {
            String text = copiedText();
            // Never send a pairing code, even inside other text. It holds the Mac password.
            if (text != null && !text.contains(MacClipboardPairing.CODE_PREFIX)) worker.execute(() -> upload(text));
        } catch (RuntimeException error) {
            Log.w(TAG, "Could not read the copied text", error);
        }
    }

    /** Plain text on the clipboard, or null when it is empty, too long or marked sensitive. */
    private static String copiedText() {
        ClipData clip = clipboard.getPrimaryClip();
        if (clip == null || clip.getItemCount() == 0) return null;
        PersistableBundle extras = clip.getDescription().getExtras();
        if (extras != null && extras.getBoolean(SENSITIVE)) return null;
        CharSequence text = clip.getItemAt(0).getText();
        if (text == null || text.length() == 0 || text.length() > MacClipboardClient.MAX_TEXT_LENGTH) return null;
        return text.toString();
    }

    private static void upload(String text) {
        String hash = MacClipboardClient.hash(text);
        // The same hash means this clip came from the Mac or was already sent.
        if (hash.equalsIgnoreCase(lastHash)) return;
        lastHash = hash;
        pendingText = text;
        pendingSince = SystemClock.elapsedRealtime();
        sendPending();
    }

    /**
     * Sends the newest unsent phone copy. One retry is scheduled at a time. The copy is dropped when
     * the Mac rejects it or after five minutes.
     */
    private static void sendPending() {
        if (pendingText == null) return;
        MacClipboardClient mac = client();
        if (mac == null || SystemClock.elapsedRealtime() - pendingSince > UPLOAD_DEADLINE_MILLIS) {
            pendingText = null;
            return;
        }
        try {
            mac.send(pendingText);
            pendingText = null;
        } catch (MacClipboardClient.RejectedException error) {
            Log.w(TAG, "The Mac rejected a copy: " + error.getMessage());
            pendingText = null;
        } catch (IOException error) {
            if (!retryScheduled) {
                retryScheduled = true;
                worker.schedule(MacClipboardSync::retry, RETRY_MILLIS, TimeUnit.MILLISECONDS);
            }
        }
    }

    private static void retry() {
        retryScheduled = false;
        try {
            sendPending();
        } catch (RuntimeException error) {
            Log.w(TAG, "Could not resend", error);
        }
    }

    private static void poll() {
        try {
            sendPending();
            MacClipboardClient mac = client();
            if (mac == null) return;
            long phoneClipBefore = phoneClipMillis();
            MacClipboardClient.Clip clip = mac.fetch();
            if (clip == null || clip.hash.equalsIgnoreCase(lastHash)) return;
            if (clip.text.length() > MacClipboardClient.MAX_TEXT_LENGTH) return;
            // A phone copy made while the request ran always wins, whatever the two clocks say.
            long phoneClip = phoneClipMillis();
            if (phoneClip != phoneClipBefore) return;
            // Also keep a phone clip copied after the Mac clip but before the keyboard opened.
            if (clip.copiedAtMillis <= phoneClip) return;
            lastHash = clip.hash;
            clipboard.setPrimaryClip(ClipData.newPlainText("Mac", clip.text));
        } catch (IOException ignored) {
            // The Mac is asleep or unreachable. The next poll tries again.
        } catch (RuntimeException error) {
            // An exception would cancel the repeating poll, so catch everything here.
            Log.w(TAG, "Could not fetch from the Mac", error);
        }
    }

    /** When the phone's current clip was copied, in wall-clock milliseconds, or 0 when it is empty. */
    private static long phoneClipMillis() {
        ClipDescription description = clipboard.getPrimaryClipDescription();
        return description == null ? 0 : description.getTimestamp();
    }

    private static MacClipboardClient client() {
        if (clientLoaded) return client;
        UserManager users = (UserManager) appContext.getSystemService(Context.USER_SERVICE);
        if (users != null && !users.isUserUnlocked()) return null;
        try {
            MacClipboardPairing pairing = MacClipboardPairing.load(appContext);
            client = pairing == null ? null : new MacClipboardClient(pairing);
        } catch (IOException | GeneralSecurityException error) {
            Log.w(TAG, "Could not load the pairing", error);
            client = null;
        }
        clientLoaded = true;
        return client;
    }
}
