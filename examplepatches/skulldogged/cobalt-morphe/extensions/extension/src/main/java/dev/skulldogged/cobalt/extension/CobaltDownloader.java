package dev.skulldogged.cobalt.extension;

import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;

import java.util.concurrent.atomic.AtomicBoolean;

public final class CobaltDownloader {
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());
    private static final AtomicBoolean DOWNLOAD_ACTIVE = new AtomicBoolean(false);

    private static volatile Context applicationContext;

    private CobaltDownloader() {
    }

    public static void initialize(Object application) {
        if (application instanceof Context) {
            applicationContext = ((Context) application).getApplicationContext();
            CobaltSettings.initialize(applicationContext);
            CobaltDownloadsPageHook.install(application);
        }
    }

    public static boolean onDownloadButtonClick(String videoId) {
        final Context context = applicationContext;
        if (context == null || !CobaltSettings.isEnabled() || !isValidVideoId(videoId)) {
            return false;
        }
        if (CobaltSettings.apiUrl().isEmpty()) {
            showToast(context, "Choose a cobalt API endpoint in Settings");
            return true;
        }
        if (!DOWNLOAD_ACTIVE.compareAndSet(false, true)) {
            showToast(context, "A cobalt download is already running");
            return true;
        }

        String sourceUrl = "https://www.youtube.com/watch?v=" + videoId;
        String recordId = CobaltDownloadRepository.create(context, sourceUrl);
        return startOrAuthorize(context, sourceUrl, recordId);
    }

    static boolean retry(String recordId) {
        Context context = applicationContext;
        if (context == null) {
            return false;
        }
        if (CobaltSettings.apiUrl().isEmpty()) {
            showToast(context, "Choose a cobalt API endpoint in Settings");
            return true;
        }
        if (!DOWNLOAD_ACTIVE.compareAndSet(false, true)) {
            return false;
        }
        CobaltDownloadRepository.Record record = CobaltDownloadRepository.find(context, recordId);
        if (record == null || record.sourceUrl == null || record.sourceUrl.isEmpty()) {
            DOWNLOAD_ACTIVE.set(false);
            return false;
        }
        CobaltDownloadRepository.prepareRetry(context, recordId);
        return startOrAuthorize(context, record.sourceUrl, recordId);
    }

    private static boolean startOrAuthorize(
            Context context,
            String sourceUrl,
            String recordId
    ) {
        String apiUrl = CobaltSettings.apiUrl();
        boolean needsTurnstile = CobaltSettings.apiKey().isEmpty()
                && !CobaltSettings.turnstileUrl().isEmpty();
        if (!needsTurnstile || CobaltSessionManager.hasValidSession(apiUrl)) {
            return start(context, sourceUrl, recordId);
        }

        CobaltDownloadRepository.setAuthorizing(context, recordId);
        Intent intent = new Intent(context, CobaltTurnstileActivity.class)
                .putExtra(CobaltTurnstileActivity.EXTRA_SOURCE_URL, sourceUrl)
                .putExtra(CobaltTurnstileActivity.EXTRA_RECORD_ID, recordId)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        try {
            context.startActivity(intent);
            showToast(context, "Verifying with cobalt…");
        } catch (RuntimeException exception) {
            onAuthorizationFailed(recordId, "Could not open cobalt authorization");
        }
        return true;
    }

    private static boolean start(Context context, String sourceUrl, String recordId) {
        Intent intent = new Intent(context, CobaltDownloadService.class)
                .putExtra(CobaltDownloadService.EXTRA_SOURCE_URL, sourceUrl)
                .putExtra(CobaltDownloadService.EXTRA_RECORD_ID, recordId);
        try {
            context.startForegroundService(intent);
        } catch (RuntimeException exception) {
            DOWNLOAD_ACTIVE.set(false);
            CobaltDownloadRepository.setFailed(
                    context,
                    recordId,
                    "Could not start the cobalt download"
            );
            showToast(context, "Could not start the cobalt download");
            return true;
        }
        showToast(context, "Preparing cobalt download…");
        return true;
    }

    static void onAuthorizationSucceeded(String sourceUrl, String recordId) {
        Context context = applicationContext;
        if (context == null) {
            onAuthorizationFailed(recordId, "YouTube is not ready to start the download");
            return;
        }
        DOWNLOAD_ACTIVE.set(true);
        CobaltDownloadRepository.prepareRetry(context, recordId);
        start(context, sourceUrl, recordId);
    }

    static void onAuthorizationFailed(String recordId, String message) {
        Context context = applicationContext;
        DOWNLOAD_ACTIVE.set(false);
        if (context != null && recordId != null) {
            CobaltDownloadRepository.setFailed(context, recordId, message);
        }
    }

    private static boolean isValidVideoId(String videoId) {
        return videoId != null && videoId.matches("[A-Za-z0-9_-]{6,20}");
    }

    static void onJobFinished() {
        DOWNLOAD_ACTIVE.set(false);
    }

    private static void showToast(Context context, String message) {
        MAIN_HANDLER.post(() ->
                Toast.makeText(context, message, Toast.LENGTH_SHORT).show()
        );
    }
}
