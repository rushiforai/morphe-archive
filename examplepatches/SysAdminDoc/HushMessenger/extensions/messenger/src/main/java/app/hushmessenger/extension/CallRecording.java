package app.hushmessenger.extension;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Application;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.Icon;
import android.media.AudioRecord;
import android.media.AudioTrack;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.ParcelFileDescriptor;
import android.os.SystemClock;
import android.provider.MediaStore;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import android.widget.Toast;
import com.facebook.rtc.fbwebrtc.overlayconfig.overlayconfiglayer.OverlayConfigLayerInterface;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Locale;
import java.util.UUID;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/**
 * Records a call into one sound file on the phone (#105). With the switch on, calls play through WebRTC's Java thread,
 * the only way the far side's sound reaches Java, and that holds until Messenger restarts. A Record pill sits over
 * Messenger's screens while a call's audio runs, and nothing is read or kept until it's tapped. From there both audio
 * threads show this class each frame and a notification stays up for as long as it records. Hanging up or tapping again
 * finishes the file.
 */
public final class CallRecording {
    static final String KEY = "call_recording";
    static final String FOLDER = "Messenger Calls";
    private static final String CHANNEL = "hush_call_recording";
    private static final int NOTIFICATION = 105;
    private static final String STOP_ACTION = "app.hushmessenger.CALL_RECORDING_STOP.";
    private static final long PUMP_MILLIS = 200;
    private static final long NO_SOUND_MILLIS = 3000;

    /** Where a recording goes. Tests swap it. */
    interface Store {
        Target open(Context context, String name) throws IOException;
    }

    /** The open file. Closing it without keeping it removes it. */
    interface Target {
        FileChannel channel();

        void close(boolean keep) throws IOException;
    }

    static volatile Store store = new SharedAudio();

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static volatile boolean callActive;
    /** The recording the audio threads hand their sound to. */
    private static volatile Session listening;
    /** What native was first told about its audio this run. A flip waits for a restart, so the button and the audio can't disagree. */
    private static volatile Boolean playoutHeld;
    private static volatile boolean complained;
    // Main thread only from here on.
    private static Activity top;
    private static TextView pill;
    private static Session session;
    private static BroadcastReceiver stopReceiver;

    private CallRecording() {}

    static void resetForTests() {
        callActive = false;
        listening = null;
        playoutHeld = null;
        complained = false;
        top = null;
        pill = null;
        session = null;
        stopReceiver = null;
        store = new SharedAudio();
    }

    /** Messenger hands native its call settings here as layers of numbers. With the switch on, ours goes last so its word stands. */
    public static void addLayer(ArrayList<Object> layers) {
        try {
            Boolean held = playoutHeld;
            if (held == null) playoutHeld = held = Settings.enabled(KEY) && Settings.available(KEY);
            if (held && layers != null) layers.add(new JavaAudioLayer());
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Couldn't choose the call's audio", error);
        }
    }

    /** Says no to Messenger's own native audio and yes to WebRTC's Java audio. Everything else stays unset. */
    static final class JavaAudioLayer implements OverlayConfigLayerInterface {
        /** The ids and the length belong to Messenger's generated config, so a new Messenger version has to be checked against them. */
        static final int VALUES = 0x18bb;
        static final int OBOE_ON = 0xb1d;
        static final int OBOE_RECORD = 0xb1c;
        static final int MODULE = 6;
        static final int MODULE_JAVA = 1;
        private static final int UNSET = -1;
        private static final int SOURCE = 0x17;

        @Override
        public int getLayerSource() {
            return SOURCE;
        }

        @Override
        public int[] getUpdatedValues() {
            return new int[0];
        }

        @Override
        public int[] getValues() {
            int[] values = new int[VALUES];
            Arrays.fill(values, UNSET);
            values[OBOE_ON] = 0;
            values[OBOE_RECORD] = 0;
            values[MODULE] = MODULE_JAVA;
            return values;
        }

        @Override
        public void logExposure(int id) {}
    }

    /** For the restart row, once native has asked. */
    static Boolean heldPlayout() {
        return Settings.available(KEY) ? playoutHeld : null;
    }

    /** Native starts the Java playout thread here, so a call's sound is about to run. */
    public static void playoutStarted() {
        active(true);
    }

    public static void playoutStopped() {
        active(false);
    }

    /** The far side's next frame, on its way to the speaker. Nothing's touched unless a recording is running. */
    public static void heard(AudioTrack track, ByteBuffer sound, int bytes) {
        Session now = listening;
        if (now == null) return;
        try {
            now.mix.theirs.offer(sound, bytes, track.getChannelCount(), track.getSampleRate(), now.elapsed());
        } catch (Throwable error) {
            lostSound(error);
        }
    }

    /** This phone's next frame, on its way to the far side. A mute has already cleared it by here. */
    public static void spoke(AudioRecord record, ByteBuffer sound, int bytes) {
        Session now = listening;
        if (now == null) return;
        try {
            now.mix.mine.offer(sound, bytes, record.getChannelCount(), record.getSampleRate(), now.elapsed());
        } catch (Throwable error) {
            lostSound(error);
        }
    }

    /** These threads run 50 to 100 times a second, so one line is enough. */
    private static void lostSound(Throwable error) {
        if (complained) return;
        complained = true;
        Settings.hookFailedPrivately(KEY, "Couldn't read a call's sound", error);
    }

    static boolean listening() {
        return listening != null;
    }

    private static void active(boolean running) {
        try {
            callActive = running;
            MAIN.post(() -> {
                if (!callActive && session != null) session.finishUp();
                refresh();
            });
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Couldn't note the call's state", error);
        }
    }

    /** Watches for which of Messenger's screens is showing. It does nothing else until a call starts. */
    static void register(Application application) {
        application.registerActivityLifecycleCallbacks(new Screens());
    }

    static final class Screens implements Application.ActivityLifecycleCallbacks {
        @Override public void onActivityResumed(Activity activity) {
            top = activity;
            refresh();
        }

        @Override public void onActivityPaused(Activity activity) {
            if (top != activity) return;
            top = null;
            refresh();
        }

        @Override public void onActivityCreated(Activity activity, Bundle state) {}
        @Override public void onActivityStarted(Activity activity) {}
        @Override public void onActivityStopped(Activity activity) {}
        @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
        @Override public void onActivityDestroyed(Activity activity) {}
    }

    private static boolean offered() {
        return session != null || (callActive && Settings.enabled(KEY) && Settings.available(KEY));
    }

    private static void refresh() {
        try {
            View found = top == null ? null : top.findViewById(android.R.id.content);
            if (!(found instanceof FrameLayout) || !offered()) {
                removePill();
                return;
            }
            if (pill == null || pill.getParent() != found) {
                removePill();
                pill = makePill(top);
                ((ViewGroup) found).addView(pill, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.TOP | Gravity.CENTER_HORIZONTAL));
            }
            boolean recording = session != null;
            pill.setText(new SettingsText(top).get(recording ? "call_recording_stop_pill" : "call_recording_start"));
            GradientDrawable shape = new GradientDrawable();
            shape.setCornerRadius(pill.getResources().getDisplayMetrics().density * 24);
            shape.setColor(recording ? 0xFFD32F2F : 0xE6202124);
            pill.setBackground(shape);
        } catch (RuntimeException error) {
            Settings.hookFailedPrivately(KEY, "Couldn't show the Record button", error);
        }
    }

    private static void removePill() {
        if (pill != null && pill.getParent() instanceof ViewGroup) ((ViewGroup) pill.getParent()).removeView(pill);
        pill = null;
    }

    private static TextView makePill(Activity activity) {
        float density = activity.getResources().getDisplayMetrics().density;
        TextView view = new TextView(activity);
        view.setTextColor(Color.WHITE);
        view.setTextSize(14);
        view.setTypeface(Typeface.DEFAULT_BOLD);
        view.setGravity(Gravity.CENTER);
        view.setMinHeight((int) (density * 48));
        view.setPadding((int) (density * 20), 0, (int) (density * 20), 0);
        view.setElevation(density * 24);
        view.setOnClickListener(clicked -> tapped(activity));
        // Below the status bar, however this screen lays itself out. Moving it waits until this layout pass is over.
        view.addOnLayoutChangeListener((self, left, up, right, down, oldLeft, oldUp, oldRight, oldDown) -> self.post(() -> place(self)));
        return view;
    }

    private static void place(View view) {
        View parent = (View) view.getParent();
        if (parent == null) return;
        Rect visible = new Rect();
        int[] where = new int[2];
        parent.getWindowVisibleDisplayFrame(visible);
        parent.getLocationOnScreen(where);
        int margin = Math.max(0, visible.top - where[1]) + (int) (view.getResources().getDisplayMetrics().density * 8);
        FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) view.getLayoutParams();
        if (params.topMargin == margin) return;
        params.topMargin = margin;
        view.setLayoutParams(params);
    }

    private static void tapped(Context screen) {
        try {
            if (session != null) {
                session.finishUp();
                return;
            }
            Context context = screen.getApplicationContext();
            session = new Session(context);
            session.start();
            showNotification(context);
            refresh();
        } catch (RuntimeException error) {
            Settings.hookFailedPrivately(KEY, "Couldn't start recording", error);
            session = null;
        }
    }

    private static void showNotification(Context context) {
        try {
            NotificationManager manager = context.getSystemService(NotificationManager.class);
            if (manager == null) return;
            SettingsText text = new SettingsText(context);
            manager.createNotificationChannel(new NotificationChannel(CHANNEL, text.get("call_recording_channel"), NotificationManager.IMPORTANCE_LOW));
            // A private action, since this receiver has no export flag to set below Android 13.
            String action = STOP_ACTION + UUID.randomUUID();
            stopReceiver = new BroadcastReceiver() {
                @Override public void onReceive(Context received, Intent intent) {
                    if (session != null) session.finishUp();
                }
            };
            IntentFilter filter = new IntentFilter(action);
            if (Build.VERSION.SDK_INT >= 33) context.registerReceiver(stopReceiver, filter, Context.RECEIVER_NOT_EXPORTED);
            else context.registerReceiver(stopReceiver, filter);
            PendingIntent stop = PendingIntent.getBroadcast(context, NOTIFICATION, new Intent(action).setPackage(context.getPackageName()),
                PendingIntent.FLAG_IMMUTABLE | PendingIntent.FLAG_UPDATE_CURRENT);
            Icon dot = dot();
            manager.notify(NOTIFICATION, new Notification.Builder(context, CHANNEL).setSmallIcon(dot)
                .setContentTitle(text.get("call_recording_on")).setOngoing(true).setUsesChronometer(true)
                .setWhen(System.currentTimeMillis()).setShowWhen(true)
                .addAction(new Notification.Action.Builder(dot, text.get("call_recording_stop"), stop).build()).build());
        } catch (RuntimeException error) {
            // The pill still says it's recording, and hanging up still finishes the file.
            Settings.hookFailedPrivately(KEY, "Couldn't show the recording notification", error);
        }
    }

    /** Android draws a notification's small icon from its shape, so a plain circle reads as the usual recording dot. */
    private static Icon dot() {
        Bitmap bitmap = Bitmap.createBitmap(48, 48, Bitmap.Config.ARGB_8888);
        Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        paint.setColor(Color.WHITE);
        new Canvas(bitmap).drawCircle(24, 24, 18, paint);
        return Icon.createWithBitmap(bitmap);
    }

    private static void hideNotification(Context context) {
        try {
            NotificationManager manager = context.getSystemService(NotificationManager.class);
            if (manager != null) manager.cancel(NOTIFICATION);
            if (stopReceiver != null) context.unregisterReceiver(stopReceiver);
        } catch (RuntimeException error) {
            Settings.hookFailedPrivately(KEY, "Couldn't take the recording notification down", error);
        } finally {
            stopReceiver = null;
        }
    }

    /** Back on the main thread once a recording's file is finished. */
    private static void finished(Session done, Context context, boolean kept, boolean failed) {
        if (session == done) session = null;
        hideNotification(context);
        refresh();
        if (!kept && !failed) return;
        SettingsText text = new SettingsText(context);
        Toast.makeText(context, failed ? text.get("call_recording_failed") : text.get("call_recording_saved", SharedAudio.folder()), Toast.LENGTH_LONG).show();
    }

    /** Like "Call 2026-10-31 14.05.33.wav". */
    static String name(Date when) {
        return "Call " + new SimpleDateFormat("yyyy-MM-dd HH.mm.ss", Locale.ROOT).format(when) + "." + VoiceMessages.Format.WAV.extension;
    }

    /** One recording, on a thread of its own, since writing the file shouldn't hold up the call or Messenger's screens. */
    private static final class Session extends Thread {
        private final Context context;
        private final long began = SystemClock.elapsedRealtime();
        private final CountDownLatch stop = new CountDownLatch(1);
        /** Set before the audio threads can see this session. */
        CallMix mix;

        Session(Context context) {
            super("HushCallRecording");
            setDaemon(true);
            this.context = context;
        }

        // Never an interrupt: one that lands during a write closes the file before its last header goes in.
        void finishUp() {
            stop.countDown();
        }

        private boolean stopped() {
            try {
                return stop.await(PUMP_MILLIS, TimeUnit.MILLISECONDS);
            } catch (InterruptedException woken) {
                return true;
            }
        }

        long elapsed() {
            return SystemClock.elapsedRealtime() - began;
        }

        @Override public void run() {
            boolean kept = false;
            boolean failed = false;
            Target target = null;
            try {
                target = store.open(context, name(new Date()));
                mix = new CallMix(target.channel());
                listening = this;
                try {
                    while (!mix.full() && !stopped()) mix.pump(elapsed());
                } finally {
                    listening = null;
                }
                mix.finish(elapsed());
                kept = mix.heard();
                // A few seconds with no sound from either side means the call never handed any over, so that's a failure to report.
                failed = !kept && elapsed() >= NO_SOUND_MILLIS;
            } catch (IOException | RuntimeException error) {
                failed = true;
                Settings.hookFailedPrivately(KEY, "Couldn't record a call", error);
            } finally {
                try {
                    if (target != null) target.close(kept);
                } catch (IOException | RuntimeException error) {
                    Settings.hookFailedPrivately(KEY, "Couldn't finish a call recording", error);
                }
            }
            boolean keptFile = kept;
            boolean failure = failed;
            MAIN.post(() -> finished(this, context, keptFile, failure));
        }
    }

    /** The phone's shared audio, in a folder of its own. Android 9 lets no app write there without the storage permission. */
    @TargetApi(29)
    static final class SharedAudio implements Store {
        static String folder() {
            return (Build.VERSION.SDK_INT >= 31 ? "Recordings/" : "Music/") + FOLDER;
        }

        @Override public Target open(Context context, String name) throws IOException {
            ContentResolver resolver = context.getContentResolver();
            ContentValues values = new ContentValues();
            values.put(MediaStore.MediaColumns.DISPLAY_NAME, name);
            values.put(MediaStore.MediaColumns.MIME_TYPE, VoiceMessages.Format.WAV.mime);
            values.put(MediaStore.MediaColumns.RELATIVE_PATH, folder());
            // Never pending: a crash has to leave a file people can find, and Android removes pending ones after a week.
            Uri item = resolver.insert(VoiceMessages.SharedAudio.collection(), values);
            if (item == null) throw new IOException("MediaStore made no item");
            ParcelFileDescriptor descriptor;
            try {
                descriptor = resolver.openFileDescriptor(item, "rw");
                if (descriptor == null) throw new IOException("MediaStore gave no file");
            } catch (IOException | RuntimeException error) {
                resolver.delete(item, null, null);
                throw error;
            }
            FileOutputStream stream = new FileOutputStream(descriptor.getFileDescriptor());
            return new Target() {
                @Override public FileChannel channel() {
                    return stream.getChannel();
                }

                @Override public void close(boolean keep) throws IOException {
                    try {
                        stream.close();
                        descriptor.close();
                    } finally {
                        if (!keep) resolver.delete(item, null, null);
                    }
                }
            };
        }
    }
}
