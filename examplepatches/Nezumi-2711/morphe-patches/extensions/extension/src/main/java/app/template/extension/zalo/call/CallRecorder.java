package app.template.extension.zalo.call;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;

import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import app.template.extension.zalo.shared.ZaloEnv;

/**
 * Process-wide 1-1 call recorder. State lives here (not in the Activity) so recording survives the
 * in-call screen being minimised or recreated. The audio itself is captured by Zalo's own native
 * recorder (PeerJNI.zrtc_peer_start_record_audio); this class only drives it and hands the
 * resulting WAV to {@link RecordingSaver}.
 *
 * TODO: the native recorder may stop on audio-to-video switch or reconnect; not handled in this
 * spike (the file is simply whatever was captured until then).
 */
public final class CallRecorder {
    private CallRecorder() { }

    static final String TAG = "NezumiCallRec";
    private static final long MIN_DURATION_MS = 2000;

    // Obfuscated Zalo 26.11.01 names, kept in one place.
    private static final String PEER_JNI = "com.vng.zing.vn.zrtc.PeerJNI";
    private static final String PEER_HOLDER = "dx2";     // static a() -> holder, field a -> peer object
    private static final String PEER_FIELD = "a";
    private static final String PEER_PTR_FIELD = "e";   // long native pointer
    private static final String CALL_CALLBACK = "vsv";   // static d() -> callback, c() -> call model
    private static final String CALL_MODEL_CONNECTED = "n"; // boolean, state == connected
    private static final String CALL_MODEL_NAME = "b";    // String b(Context)
    private static final String CALL_MODEL_NAME_FALLBACK = "d"; // String d()

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private static boolean recording;
    private static long startedAt;
    private static File wavFile;
    private static String peerName;
    private static boolean outgoing;
    private static boolean nextOutgoing;

    // Hooks from vsv.onMakeCall / onIncomingCall (direction of the call that is starting).
    public static void onMakeCall() { nextOutgoing = true; }

    public static void onIncomingCall() { nextOutgoing = false; }

    /** Hook at the start of vsv.onCallState(int). 6 = call ended. */
    public static void onCallState(int state) {
        if (state == 6) stop();
    }

    /** Safety net from CallService.onDestroy. */
    public static void onCallEnded() {
        stop();
    }

    public static synchronized boolean isRecording() {
        return recording;
    }

    public static synchronized long elapsedMs() {
        return recording ? System.currentTimeMillis() - startedAt : 0;
    }

    /** Tap handler for the in-call button. */
    public static void toggle(Context context) {
        try {
            if (isRecording()) {
                stop();
            } else {
                start(context);
            }
        } catch (Throwable failure) {
            Log.e(TAG, "toggle failed", failure);
            toast("Không thể ghi âm cuộc gọi");
        }
    }

    private static synchronized void start(Context context) {
        if (recording) return;
        Context app = context.getApplicationContext() != null ? context.getApplicationContext() : context;
        Object peer = peerHandle();
        if (peer == null || !isConnected()) {
            toast("Cuộc gọi chưa kết nối");
            return;
        }
        try {
            File dir = new File(app.getCacheDir(), "nezumi_call_rec");
            if (!dir.isDirectory() && !dir.mkdirs()) throw new IllegalStateException("cache dir");
            String stamp = new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US).format(new Date());
            File file = new File(dir, "rec_" + stamp + ".wav");
            peerName = callerName(app);
            outgoing = nextOutgoing;
            nativeRecord(peer, true, file.getAbsolutePath());
            wavFile = file;
            startedAt = System.currentTimeMillis();
            recording = true;
            Log.i(TAG, "start " + file);
        } catch (Throwable failure) {
            Log.e(TAG, "start failed", failure);
            toast("Không thể bắt đầu ghi âm");
        }
    }

    private static void stop() {
        File file;
        String name;
        boolean out;
        long duration;
        synchronized (CallRecorder.class) {
            if (!recording) return;
            recording = false;
            file = wavFile;
            name = peerName;
            out = outgoing;
            duration = System.currentTimeMillis() - startedAt;
            wavFile = null;
        }
        try {
            Object peer = peerHandle();
            if (peer != null) nativeRecord(peer, false, "");
            else Log.w(TAG, "peer already gone at stop; WAV header may be unfinished");
        } catch (Throwable failure) {
            Log.e(TAG, "native stop failed", failure);
        }
        Log.i(TAG, "stop after " + duration + " ms");
        final File wav = file;
        final String who = name;
        final boolean isOut = out;
        final long when = System.currentTimeMillis();
        Thread worker = new Thread(() -> {
            try {
                Thread.sleep(400); // let the native writer flush
                RecordingSaver.save(wav, who, isOut, when, MIN_DURATION_MS);
            } catch (Throwable failure) {
                Log.e(TAG, "save failed", failure);
                toast("Lưu bản ghi thất bại");
            }
        }, "NezumiCallRecSave");
        worker.start();
    }

    // ---- Zalo bridge (reflection) ----

    private static Object peerHandle() {
        try {
            Object holder = Class.forName(PEER_HOLDER).getMethod("a").invoke(null);
            if (holder == null) return null;
            Field field = holder.getClass().getField(PEER_FIELD);
            return field.get(holder);
        } catch (Throwable failure) {
            Log.e(TAG, "peer lookup failed", failure);
            return null;
        }
    }

    private static void nativeRecord(Object peer, boolean start, String path) throws Exception {
        long pointer = peer.getClass().getField(PEER_PTR_FIELD).getLong(peer);
        Method method = Class.forName(PEER_JNI).getMethod("zrtc_peer_start_record_audio",
            long.class, boolean.class, String.class);
        method.invoke(null, pointer, start, path);
    }

    private static Object callModel() throws Exception {
        Object callback = Class.forName(CALL_CALLBACK).getMethod("d").invoke(null);
        return callback == null ? null : callback.getClass().getMethod("c").invoke(callback);
    }

    private static boolean isConnected() {
        try {
            Object model = callModel();
            return model != null && (Boolean) model.getClass().getMethod(CALL_MODEL_CONNECTED).invoke(model);
        } catch (Throwable failure) {
            Log.w(TAG, "connected check failed, assuming connected", failure);
            return true;
        }
    }

    private static String callerName(Context context) {
        try {
            Object model = callModel();
            if (model == null) return "";
            try {
                Object value = model.getClass().getMethod(CALL_MODEL_NAME, Context.class).invoke(model, context);
                if (value instanceof String && !((String) value).isEmpty()) return (String) value;
            } catch (Throwable ignored) { }
            Object value = model.getClass().getMethod(CALL_MODEL_NAME_FALLBACK).invoke(model);
            return value instanceof String ? (String) value : "";
        } catch (Throwable failure) {
            return "";
        }
    }

    /** Best-effort: open Music/ZaloRecordings in the system file browser, else show its path. */
    public static void openFolder(Context context) {
        try {
            android.net.Uri uri = android.provider.DocumentsContract.buildDocumentUri(
                "com.android.externalstorage.documents", "primary:" + RecordingSaver.RELATIVE_PATH);
            android.content.Intent intent = new android.content.Intent(android.content.Intent.ACTION_VIEW);
            intent.setDataAndType(uri, android.provider.DocumentsContract.Document.MIME_TYPE_DIR);
            intent.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK
                | android.content.Intent.FLAG_GRANT_READ_URI_PERMISSION);
            context.startActivity(intent);
        } catch (Throwable failure) {
            Log.w(TAG, "open folder failed", failure);
            Toast.makeText(context, "Thư mục bản ghi: " + RecordingSaver.RELATIVE_PATH, Toast.LENGTH_LONG).show();
        }
    }

    static void toast(String message) {
        MAIN.post(() -> {
            Context context = ZaloEnv.appContext();
            if (context != null) Toast.makeText(context, message, Toast.LENGTH_LONG).show();
        });
    }
}
