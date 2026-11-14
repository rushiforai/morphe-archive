package app.hushmessenger.extension;

import android.Manifest;
import android.annotation.SuppressLint;
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
import android.content.pm.PackageManager;
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
    /** Which of the two switches were on when native asked. */
    private static volatile boolean heldForRecording, heldForCaptions;
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
        heldForRecording = heldForCaptions = false;
        complained = false;
        top = null;
        pill = null;
        session = null;
        stopReceiver = null;
        store = new SharedAudio();
        CallCaptions.resetForTests();
    }

    /**
     * Messenger hands native its call settings here as layers of numbers. With the switch on, ours goes last so its word
     * stands. It takes its length from Messenger's own layer, so a list without one gets nothing added. Live captions
     * on calls needs the same Java audio, so either switch adds it.
     */
    public static void addLayer(ArrayList<Object> layers) {
        try {
            Boolean held = playoutHeld;
            if (held == null) {
                heldForRecording = Settings.enabled(KEY) && Settings.available(KEY);
                heldForCaptions = Settings.enabled(CallCaptions.KEY) && Settings.available(CallCaptions.KEY);
                playoutHeld = held = heldForRecording || heldForCaptions;
            }
            if (!held || layers == null) return;
            for (Object layer : layers) {
                if (layer instanceof OverlayConfigLayerInterface) {
                    layers.add(new JavaAudioLayer((OverlayConfigLayerInterface) layer));
                    return;
                }
            }
            Settings.hookFailedPrivately(audioOwner(), "Couldn't choose the call's audio", new IllegalStateException("no config layer of Messenger's own"));
        } catch (Throwable error) {
            Settings.hookFailedPrivately(audioOwner(), "Couldn't choose the call's audio", error);
        }
    }

    /** The switch a failure to choose the call's audio belongs to. */
    private static String audioOwner() {
        return Settings.wouldUse(KEY) || !Settings.wouldUse(CallCaptions.KEY) ? KEY : CallCaptions.KEY;
    }

    /** Says no to Messenger's own native audio and yes to WebRTC's Java audio. Everything else stays unset. */
    static final class JavaAudioLayer implements OverlayConfigLayerInterface {
        /** Ids in Messenger's generated config. Native 586 still reads 6 as audio_device_module_override and 0xb1d as the Oboe switch. */
        static final int OBOE_ON = 0xb1d;
        static final int OBOE_RECORD = 0xb1c;
        static final int MODULE = 6;
        static final int MODULE_JAVA = 1;
        static final int UNSET = -1;
        private static final int SOURCE = 0x17;

        /**
         * Messenger's own layer. Native reads every layer at the length its build was made with (0x18bb on 585, 0x18d6 on
         * 586), and a layer of another length crashed the call as it started, so ours copies the length from this one.
         */
        private final OverlayConfigLayerInterface own;
        private int[] values;

        JavaAudioLayer(OverlayConfigLayerInterface own) {
            this.own = own;
        }

        @Override
        public int getLayerSource() {
            return SOURCE;
        }

        /** Ours never change, so an update is the same numbers. */
        @Override
        public int[] getUpdatedValues() {
            return getValues();
        }

        @Override
        public synchronized int[] getValues() {
            if (values == null) values = build(own.getValues().length);
            return values.clone();
        }

        /** All unset but the three audio ids, or all unset when the build's config is too short to hold them. */
        static int[] build(int length) {
            int[] built = new int[length];
            Arrays.fill(built, UNSET);
            if (length <= Math.max(OBOE_ON, Math.max(OBOE_RECORD, MODULE))) return built;
            built[OBOE_ON] = 0;
            built[OBOE_RECORD] = 0;
            built[MODULE] = MODULE_JAVA;
            return built;
        }

        @Override
        public void logExposure(int id) {}
    }

    /**
     * For the restart row of Record calls or Live captions, once native has asked: what this run holds when the switch
     * now says otherwise. Turning one on works at the next call when the other already has the audio in Java, and
     * turning one off changes nothing on a restart while the other still wants it.
     */
    static Boolean heldPlayout(String key) {
        Boolean held = playoutHeld;
        if (held == null || !Settings.available(key)) return null;
        boolean was = KEY.equals(key) ? heldForRecording : heldForCaptions, now = Settings.wouldUse(key);
        if (was == now) return null;
        if (now) return held ? null : Boolean.FALSE;
        return wantsJavaAudio(KEY) || wantsJavaAudio(CallCaptions.KEY) ? null : Boolean.TRUE;
    }

    private static boolean wantsJavaAudio(String key) {
        return Settings.wouldUse(key) && Settings.available(key);
    }

    /** Native starts the Java playout thread here, so a call's sound is about to run. */
    public static void playoutStarted() {
        active(true);
    }

    public static void playoutStopped() {
        active(false);
    }

    /**
     * The far side's next frame, on its way to the speaker. A running recording takes it as it is, then live captions
     * get it and may turn it down while a caption is read aloud. Nothing's touched with neither running.
     */
    public static void heard(AudioTrack track, ByteBuffer sound, int bytes) {
        Session now = listening;
        if (now != null) {
            try {
                now.mix.theirs.offer(sound, bytes, track.getChannelCount(), track.getSampleRate(), now.elapsed());
            } catch (Throwable error) {
                lostSound(error);
            }
        }
        CallCaptions.heard(track, sound, bytes);
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
                CallCaptions.call(callActive);
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
        refreshPill();
        CallCaptions.screen(top);
    }

    private static void refreshPill() {
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
            shape.setCornerRadius(pill.getResources().getDisplayMetrics().density * 12);
            shape.setColor(recording ? SettingsUi.RECORDING : SettingsUi.CALL_SCRIM);
            // Shows the tap, so a press during a call reads as taken before the recording starts or stops.
            pill.setBackground(new android.graphics.drawable.RippleDrawable(
                android.content.res.ColorStateList.valueOf(SettingsUi.CALL_RIPPLE), shape, null));
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

    // Lint reads the extension's own manifest; the notification posts from Messenger's process, checked just below.
    @SuppressLint("NotificationPermission")
    private static void showNotification(Context context) {
        try {
            // Android 13 drops a notification posted without the grant, so skip it and leave the pill to say it's recording.
            if (Build.VERSION.SDK_INT >= 33 && context.checkSelfPermission(Manifest.permission.POST_NOTIFICATIONS) != PackageManager.PERMISSION_GRANTED) return;
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
