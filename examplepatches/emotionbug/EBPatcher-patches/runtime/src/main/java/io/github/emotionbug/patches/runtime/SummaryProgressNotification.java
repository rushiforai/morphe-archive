package io.github.emotionbug.patches.runtime;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import java.util.function.Consumer;

/** Optional, content-free status. Never a foreground-service or inference prerequisite. */
final class SummaryProgressNotification {
    static final String CHANNEL = "ebpatcher_summary_processing";
    static final int NOTIFICATION = 0x45425350;
    static final long REFRESH_MS = 30_000;
    static final long TIMEOUT_MS = 90_000;
    private final Context context;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final String owner;
    private Session active;
    private boolean stopped;

    SummaryProgressNotification(Context context) {
        this.context = context.getApplicationContext();
        Bundle connected = request("connect", null);
        owner = connected == null ? null : connected.getString("owner");
    }

    synchronized Session begin(SummaryStore.Job job) {
        reset();
        Bundle values = new Bundle();
        values.putLong("job", job.id);
        values.putInt("revision", job.revision);
        Bundle response = stopped ? null : command("begin", values);
        Session session = new Session(response == null ? null : response.getString("session"));
        if (!stopped) {
            active = session;
            session.accept("preparing");
        }
        return session;
    }

    synchronized void reset() {
        if (active != null) active.close();
    }

    synchronized void shutdown() {
        stopped = true;
        reset();
    }

    private Bundle command(String operation, Bundle values) {
        if (owner == null) return null;
        if (values == null) values = new Bundle();
        values.putString("owner", owner);
        return request(operation, values);
    }

    private Bundle request(String operation, Bundle values) {
        try {
            return context.getContentResolver().call(
                    Uri.parse("content://" + context.getPackageName() + ".ebpatcher.settings"),
                    ExtensionSettingsProvider.SUMMARY_STATUS, operation, values);
        } catch (RuntimeException | LinkageError ignored) { return null; }
    }

    /** Only this inference-process handler renews the lease; the provider never starts a heartbeat. */
    final class Session implements Consumer<String>, AutoCloseable, Runnable {
        private final String token;
        private Session(String token) { this.token = token; }

        private void send(String operation, String stage) {
            if (token == null) return;
            Bundle values = new Bundle();
            values.putString("session", token);
            if (stage != null) values.putString("stage", stage);
            command(operation, values);
        }

        @Override public void accept(String stage) {
            if (stageText(stage) == null) return;
            synchronized (SummaryProgressNotification.this) {
                if (active != this) return;
                main.removeCallbacks(this);
                send("stage", stage);
                main.postDelayed(this, REFRESH_MS);
            }
        }

        @Override public void run() {
            synchronized (SummaryProgressNotification.this) {
                if (active != this) return;
                send("heartbeat", null);
                main.postDelayed(this, REFRESH_MS);
            }
        }

        void finish() {
            synchronized (SummaryProgressNotification.this) {
                if (active != this) return;
                main.removeCallbacks(this);
                send("finish", null);
                active = null;
            }
        }

        @Override public void close() {
            synchronized (SummaryProgressNotification.this) {
                if (active != this) return;
                main.removeCallbacks(this);
                send("close", null);
                active = null;
            }
        }
    }

    static Notification notification(Context context, SummaryStore.Job job, String text, boolean ongoing, boolean replaced) {
        PendingIntent settings = PendingIntent.getActivity(context, NOTIFICATION,
                new Intent(context, SummarySettingsActivity.class),
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
        Bundle identity = new Bundle();
        identity.putBoolean(SummaryNotifications.OWNED, true);
        identity.putLong(SummaryNotifications.JOB_ID, job.id);
        identity.putLong(SummaryNotifications.RECORDING_ID, job.recordingId);
        identity.putLong(SummaryNotifications.BRIEFING_ID, job.briefingId);
        identity.putBoolean(SummaryNotifications.REPLACED, replaced);
        return new Notification.Builder(context, CHANNEL)
                .setSmallIcon(android.R.drawable.stat_notify_sync)
                .setContentTitle("EBPatcher · Local summary").setContentText(text).setContentIntent(settings)
                .setOngoing(ongoing).setAutoCancel(!ongoing).setOnlyAlertOnce(true)
                .setDefaults(0).setSound(null).setVibrate(null).addExtras(identity)
                // Platform Builder has no setSilent. A child in a summary-alert-only group is silent
                // even if the user changes this channel's sound; no group summary is posted here.
                .setGroup(CHANNEL).setGroupAlertBehavior(Notification.GROUP_ALERT_SUMMARY)
                .setVisibility(Notification.VISIBILITY_PRIVATE).setLocalOnly(true).setShowWhen(false)
                .setCategory(ongoing ? Notification.CATEGORY_PROGRESS : Notification.CATEGORY_STATUS)
                .setProgress(0, 0, ongoing)
                // A dead native process cannot renew the lease. Android expires its stale status.
                .setTimeoutAfter(ongoing ? TIMEOUT_MS : 0).build();
    }

    static void ensureChannel(Context context) {
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        if (manager != null) ensureChannel(manager);
    }

    static void ensureChannel(NotificationManager manager) {
        // Never reconfigure a channel that Android or the user already owns.
        if (manager.getNotificationChannel(CHANNEL) != null) return;
        NotificationChannel channel = new NotificationChannel(CHANNEL, "Local summary processing",
                NotificationManager.IMPORTANCE_LOW);
        channel.setSound(null, null);
        channel.enableVibration(false);
        channel.setShowBadge(false);
        channel.setLockscreenVisibility(Notification.VISIBILITY_PRIVATE);
        manager.createNotificationChannel(channel);
    }

    static String resultText(String outcome, boolean replaced) {
        String result;
        if ("local".equals(outcome)) result = "Local applied";
        else if ("api".equals(outcome)) result = "API retained";
        else if ("pending".equals(outcome)) result = "Comparison pending";
        else return null;
        return result + (replaced ? " · Existing summary notification updated" : " · New summary notification");
    }

    /** Whitelist the engine protocol; never display arbitrary callback strings or private data. */
    static String stageText(String stage) {
        if (stage == null) return null;
        switch (stage) {
            case "preparing": return "Preparing local processing";
            case "decode": return "Decoding audio on device";
            case "refine": return "Refining saved local summary";
            case "gemma_init": return "Initializing Gemma";
            case "summary": return "Gemma · Generating summary";
            case "notes": return "Gemma · Preparing summary notes";
            case "reduction": return "Gemma · Reducing summary notes";
            case "comparison": return "Gemma · Comparing summaries";
            default:
                if (stage.length() > 80) return null;
                String[] values = stage.split(":", -1);
                if (values.length != 4 || !("whisper".equals(values[0]) || "checkpoint".equals(values[0]))) return null;
                try {
                    long chunk = Long.parseLong(values[1]);
                    int channel = Integer.parseInt(values[2]), channels = Integer.parseInt(values[3]);
                    if (chunk < 1 || channel < 1 || channels < channel) return null;
                    return ("whisper".equals(values[0]) ? "Whisper" : "Reusing transcription")
                            + " · Chunk " + chunk + " · Channel " + channel + "/" + channels;
                } catch (NumberFormatException ignored) { return null; }
        }
    }
}
