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
import android.provider.DocumentsContract;
import android.provider.MediaStore;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
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

        /** Where the kept recording ended up, for the notification that says so (#193). Null when there's no such thing. */
        default Uri uri() {
            return null;
        }

        /** The file itself, which a format written through Android's own muxer needs. Null when there's no such thing. */
        default java.io.FileDescriptor descriptor() {
            return null;
        }
    }

    static volatile Store store = new Saving();

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
    private static LinearLayout bar;
    private static TextView pill;
    private static TextView pausePill;
    private static Session session;
    private static BroadcastReceiver stopReceiver;
    /** Messenger itself, for a call that records itself with no screen of its own in front. */
    private static Context application;
    /** Whether the call in progress has already had its one look at the chosen scope. */
    private static boolean startedThisCall;
    /** Keeps the time on the button going while a recording runs. */
    private static final Runnable TICKING = CallRecording::refreshPill;

    private CallRecording() {}

    static void resetForTests() {
        callActive = false;
        listening = null;
        playoutHeld = null;
        heldForRecording = heldForCaptions = false;
        complained = false;
        top = null;
        bar = null;
        pill = null;
        pausePill = null;
        session = null;
        stopReceiver = null;
        application = null;
        startedThisCall = false;
        MAIN.removeCallbacks(TICKING);
        store = new Saving();
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
        if (now != null && !now.paused()) {
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
        if (now == null || now.paused()) return;
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
                if (!callActive) {
                    if (session != null) session.finishUp();
                    startedThisCall = false;
                }
                CallCaptions.call(callActive);
                refresh();
            });
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Couldn't note the call's state", error);
        }
    }

    /** Watches for which of Messenger's screens is showing. It does nothing else until a call starts. */
    static void register(Application messenger) {
        application = messenger;
        messenger.registerActivityLifecycleCallbacks(new Screens());
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
        autoStart();
        refreshPill();
        CallCaptions.screen(top);
    }

    /**
     * Starts a recording on its own when Calls to record asks for it (#193). It runs again on every screen change
     * while the call is up, since an outgoing call is only named once its screen is in front, and it gives up on the
     * call once it has started one.
     */
    private static void autoStart() {
        try {
            if (!callActive || session != null || startedThisCall) return;
            if (!Settings.wouldUse(KEY) || !Settings.available(KEY)) return;
            Context context = top != null ? top.getApplicationContext() : application;
            if (context == null) return;
            String name = CallName.of(top == null ? null : top.findViewById(android.R.id.content));
            if (!CallRecordings.wants(name)) return;
            startedThisCall = true;
            session = new Session(context, name);
            session.start();
            showNotification(context);
        } catch (RuntimeException error) {
            Settings.hookFailedPrivately(KEY, "Couldn't start the recording on its own", error);
            session = null;
        }
    }

    private static void refreshPill() {
        try {
            View found = top == null ? null : top.findViewById(android.R.id.content);
            if (!(found instanceof FrameLayout) || !offered()) {
                removePill();
                return;
            }
            if (bar == null || bar.getParent() != found) {
                removePill();
                bar = makeBar(top);
                ((ViewGroup) found).addView(bar, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL));
            }
            Session running = session;
            boolean paused = running != null && running.paused();
            SettingsText text = new SettingsText(top);
            // The time stands on the button while it records, and stops where it is while it's held (#193).
            pill.setText(running == null ? text.get("call_recording_start")
                : text.get(paused ? "call_recording_paused_time" : "call_recording_stop_time", clock(running.elapsed())));
            pill.setContentDescription(running == null ? null : text.get("call_recording_stop_pill"));
            paint(pill, running != null ? SettingsUi.RECORDING : SettingsUi.CALL_SCRIM);
            pausePill.setVisibility(running == null ? View.GONE : View.VISIBLE);
            pausePill.setText(text.get(paused ? "call_recording_resume" : "call_recording_pause"));
            paint(pausePill, SettingsUi.CALL_SCRIM);
            MAIN.removeCallbacks(TICKING);
            if (running != null && !paused) MAIN.postDelayed(TICKING, 1000);
        } catch (RuntimeException error) {
            Settings.hookFailedPrivately(KEY, "Couldn't show the Record button", error);
        }
    }

    /** A recording's time, as a phone's own call screen counts it. */
    static String clock(long millis) {
        long seconds = Math.max(0, millis) / 1000;
        return seconds >= 3600 ? String.format(Locale.ROOT, "%d:%02d:%02d", seconds / 3600, seconds / 60 % 60, seconds % 60)
            : String.format(Locale.ROOT, "%d:%02d", seconds / 60, seconds % 60);
    }

    /** Shows the tap, so a press during a call reads as taken before the recording starts, stops or waits. */
    private static void paint(TextView view, int color) {
        GradientDrawable shape = new GradientDrawable();
        shape.setCornerRadius(view.getResources().getDisplayMetrics().density * 12);
        shape.setColor(color);
        view.setBackground(new android.graphics.drawable.RippleDrawable(
            android.content.res.ColorStateList.valueOf(SettingsUi.CALL_RIPPLE), shape, null));
    }

    private static void removePill() {
        if (bar != null && bar.getParent() instanceof ViewGroup) ((ViewGroup) bar.getParent()).removeView(bar);
        bar = null;
        pill = null;
        pausePill = null;
        MAIN.removeCallbacks(TICKING);
    }

    /**
     * How far above the bottom of the screen the button sits, in dp: clear of Messenger's own row of call buttons,
     * which stands about 78dp tall above the navigation bar, with room to spare on a taller row (#105).
     */
    static final int ABOVE_CALL_BUTTONS_DP = 112;

    /** Pause, then the Record button itself, so the one that stops a recording keeps the place it always had. */
    private static LinearLayout makeBar(Activity activity) {
        float density = activity.getResources().getDisplayMetrics().density;
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setTag("call_recording_bar");
        pausePill = makePill(activity, "call_recording_pause", clicked -> pauseTapped());
        pill = makePill(activity, "call_recording_pill", clicked -> tapped(activity));
        LinearLayout.LayoutParams hold = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        // On the Hold button, so a call that isn't recording still centers the Record button on the screen.
        hold.setMarginEnd((int) (density * 8));
        row.addView(pausePill, hold);
        row.addView(pill, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        // Above the call buttons, however this screen lays itself out. Moving it waits until this layout pass is over.
        row.addOnLayoutChangeListener((self, left, up, right, down, oldLeft, oldUp, oldRight, oldDown) -> self.post(() -> place(self)));
        return row;
    }

    private static TextView makePill(Activity activity, String tag, View.OnClickListener tap) {
        float density = activity.getResources().getDisplayMetrics().density;
        TextView view = new TextView(activity);
        view.setTag(tag);
        view.setTextColor(Color.WHITE);
        view.setTextSize(13);
        view.setTypeface(Typeface.DEFAULT_BOLD);
        view.setGravity(Gravity.CENTER);
        view.setMinHeight((int) (density * 40));
        view.setPadding((int) (density * 16), 0, (int) (density * 16), 0);
        view.setElevation(density * 24);
        view.setOnClickListener(tap);
        return view;
    }

    /**
     * Keeps the button above Messenger's own call buttons and clear of the navigation bar. It used to sit under the
     * status bar, where it covered the name of the person you were calling as the call started (#105).
     */
    static void place(View view) {
        View parent = (View) view.getParent();
        if (parent == null) return;
        Rect visible = new Rect();
        int[] where = new int[2];
        parent.getWindowVisibleDisplayFrame(visible);
        parent.getLocationOnScreen(where);
        float density = view.getResources().getDisplayMetrics().density;
        int underTheBar = Math.max(0, where[1] + parent.getHeight() - visible.bottom);
        int margin = underTheBar + (int) (density * ABOVE_CALL_BUTTONS_DP);
        FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) view.getLayoutParams();
        if (params.bottomMargin == margin) return;
        params.bottomMargin = margin;
        view.setLayoutParams(params);
    }

    /**
     * Holds a recording where it is, or carries it on (#193). The time it waited is left out of the file, so what
     * comes back after is the next thing said, not a stretch of silence.
     */
    private static void pauseTapped() {
        try {
            Session running = session;
            if (running == null) return;
            running.pause(!running.paused());
            refresh();
        } catch (RuntimeException error) {
            Settings.hookFailedPrivately(KEY, "Couldn't hold the recording", error);
        }
    }

    private static void tapped(Context screen) {
        try {
            // A tap settles this call either way, so a scope that records on its own doesn't start it up again.
            startedThisCall = true;
            if (session != null) {
                session.finishUp();
                return;
            }
            Context context = screen.getApplicationContext();
            // Who the call's with comes off the screen in front of the person tapping, while it's still showing.
            session = new Session(context, CallName.of(top == null ? null : top.findViewById(android.R.id.content)));
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
        return name(when, null);
    }

    /**
     * "Call with Alex Kim 2026-10-31 14.05.33.wav" when the call screen said who it was with (#193), and the plain
     * name when it didn't. Every recording still starts with "Call ", which is what a tidy-up goes looking for.
     */
    static String name(Date when, String with) {
        String who = fileSafe(with);
        return "Call " + (who.isEmpty() ? "" : "with " + who + " ")
            + new SimpleDateFormat("yyyy-MM-dd HH.mm.ss", Locale.ROOT).format(when) + "." + CallRecordings.format().extension;
    }

    /** Longest a name can run in a file's name, leaving room for the date and the folder it goes in. */
    private static final int LONGEST_NAME = 48;

    /** [text] with what a file name can't carry turned to spaces, run together, trimmed and cut short. */
    static String fileSafe(String text) {
        if (text == null) return "";
        StringBuilder safe = new StringBuilder();
        for (int i = 0; i < text.length(); ) {
            int point = text.codePointAt(i);
            i += Character.charCount(point);
            // Direction marks go too, since one of those turns the rest of a file's name around.
            boolean refused = Character.isISOControl(point) || Character.getType(point) == Character.FORMAT
                || "/\\:*?\"<>|".indexOf(point) >= 0;
            safe.appendCodePoint(refused || Character.isWhitespace(point) ? ' ' : point);
        }
        String one = safe.toString();
        while (one.contains("  ")) one = one.replace("  ", " ");
        one = one.trim();
        while (one.startsWith(".")) one = one.substring(1).trim();
        if (one.codePointCount(0, one.length()) > LONGEST_NAME) {
            one = one.substring(0, one.offsetByCodePoints(0, LONGEST_NAME)).trim();
        }
        return one;
    }

    /**
     * How the file is written: Opus when that's what the name says, since the format is settled before the file is
     * made, and the plain WAV otherwise. An encoder that won't start takes the WAV rather than the call (#193).
     */
    private static CallMix.Sink sink(Target target, String name, int channels) throws IOException {
        if (name.endsWith("." + VoiceMessages.Format.OGG.extension) && target.descriptor() != null) {
            try {
                return new CallOpus(target.descriptor(), channels);
            } catch (IOException | RuntimeException unusable) {
                Settings.hookFailedPrivately(KEY, "Couldn't record this call as Opus", unusable);
            }
        }
        return new CallMix.Wav(target.channel(), channels);
    }

    /** One recording, on a thread of its own, since writing the file shouldn't hold up the call or Messenger's screens. */
    private static final class Session extends Thread {
        private final Context context;
        private final long began = SystemClock.elapsedRealtime();
        private final CountDownLatch stop = new CountDownLatch(1);
        /** Who the call screen said the call was with, or null. Only the file's name uses it. */
        private final String with;
        /** When the recording was held, or 0 while it runs, and how long it has waited in all so far. */
        private volatile long heldAt;
        private volatile long heldFor;
        /** Set before the audio threads can see this session. */
        CallMix mix;

        Session(Context context, String with) {
            super("HushCallRecording");
            setDaemon(true);
            this.context = context;
            this.with = with;
        }

        boolean paused() {
            return heldAt != 0;
        }

        /** Holds the recording or carries it on. The clock the file is written against stops while it waits. */
        void pause(boolean hold) {
            if (hold == paused()) return;
            if (hold) {
                heldAt = SystemClock.elapsedRealtime();
                return;
            }
            heldFor += SystemClock.elapsedRealtime() - heldAt;
            heldAt = 0;
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
            long now = SystemClock.elapsedRealtime();
            long waiting = heldAt == 0 ? 0 : now - heldAt;
            return now - began - heldFor - waiting;
        }

        @Override public void run() {
            boolean kept = false;
            boolean failed = false;
            Target target = null;
            String saved = name(new Date(), with);
            try {
                int channels = CallRecordings.channels();
                target = store.open(context, saved);
                mix = new CallMix(sink(target, saved, channels), channels);
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
                    if (mix != null) mix.release();
                    if (target != null) target.close(kept);
                } catch (IOException | RuntimeException error) {
                    Settings.hookFailedPrivately(KEY, "Couldn't finish a call recording", error);
                }
            }
            // On this thread, with the file closed, so the call is long over before either of these touches the store.
            if (kept && target != null) {
                CallRecordings.saved(context, target.uri(), saved);
                CallRecordings.clean(context, System.currentTimeMillis());
            }
            boolean keptFile = kept;
            boolean failure = failed;
            MAIN.post(() -> finished(this, context, keptFile, failure));
        }
    }

    /**
     * Where a recording goes: the folder picked under the switch when there is one, and the phone's own Recordings
     * folder otherwise. A picked folder that has been moved, renamed or taken away since falls back rather than
     * losing the call (#193).
     */
    @TargetApi(29)
    static final class Saving implements Store {
        @Override public Target open(Context context, String name) throws IOException {
            Uri picked = CallRecordings.folder();
            if (picked != null) {
                try {
                    return new PickedFolder(picked).open(context, name);
                } catch (IOException | RuntimeException unusable) {
                    Settings.hookFailedPrivately(KEY, "Couldn't write to the folder picked", unusable);
                }
            }
            return new SharedAudio().open(context, name);
        }
    }

    /** A recording written into a folder the person picked, through the document it makes there. */
    static final class PickedFolder implements Store {
        private final Uri tree;

        PickedFolder(Uri tree) {
            this.tree = tree;
        }

        @Override public Target open(Context context, String name) throws IOException {
            ContentResolver resolver = context.getContentResolver();
            Uri parent = DocumentsContract.buildDocumentUriUsingTree(tree, DocumentsContract.getTreeDocumentId(tree));
            Uri item = DocumentsContract.createDocument(resolver, parent, CallRecordings.format().mime, name);
            if (item == null) throw new IOException("The folder picked made no file");
            ParcelFileDescriptor descriptor;
            try {
                descriptor = resolver.openFileDescriptor(item, "rw");
                if (descriptor == null) throw new IOException("The folder picked gave no file");
            } catch (IOException | RuntimeException error) {
                remove(resolver, item);
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
                        if (!keep) remove(resolver, item);
                    }
                }

                @Override public Uri uri() {
                    return item;
                }

                @Override public java.io.FileDescriptor descriptor() {
                    return descriptor.getFileDescriptor();
                }
            };
        }

        private static void remove(ContentResolver resolver, Uri item) {
            try {
                DocumentsContract.deleteDocument(resolver, item);
            } catch (IOException | RuntimeException gone) {
                // Nothing left to take away, which is where this was headed anyway.
            }
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
            values.put(MediaStore.MediaColumns.MIME_TYPE, CallRecordings.format().mime);
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

                @Override public Uri uri() {
                    return item;
                }

                @Override public java.io.FileDescriptor descriptor() {
                    return descriptor.getFileDescriptor();
                }
            };
        }
    }
}
