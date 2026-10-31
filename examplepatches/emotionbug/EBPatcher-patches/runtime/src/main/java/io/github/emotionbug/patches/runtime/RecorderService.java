package io.github.emotionbug.patches.runtime;

import android.app.*;
import android.content.*;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.*;
import android.provider.MediaStore;
import android.util.Log;
import android.widget.Toast;
import java.io.*;
import rikka.shizuku.Shizuku;

/** Private-process recorder adapter. The original dialer controls when recording is requested. */
public final class RecorderService extends Service {
    private static final String RECOVERY_PREFS = "ebpatcher_recorder_recovery";
    static final String STOP_ACTION = "io.github.emotionbug.patches.runtime.STOP";
    private static final String CHANNEL = "ebpatcher_recording";
    private HandlerThread workerThread;
    private Handler worker;
    private IBinder shell, client;
    private IBinder.DeathRecipient clientDeath;
    private Shizuku.UserServiceArgs args;
    private volatile String status = "Idle. No audio input is open.";
    private String request;
    private boolean binding, stopRequested;
    private int recordingChannels = 1;
    private volatile RecorderContract.Lifecycle lifecycle;
    private Uri pending;
    private final Runnable timeout = () -> fail(2001, "Recorder connection or finalization timed out");
    private int generation;
    private IBinder.DeathRecipient shellDeath;
    private ServiceConnection connection;
    private ServiceConnection connectionFor(final int token) { return new ServiceConnection() {
        @Override public void onServiceConnected(ComponentName name, IBinder binder) {
            worker.post(() -> {
                if (!binding || token != generation) return;
                shell = binder;
                try {
                    binder.linkToDeath(shellDeath, 0);
                    String problem = shellPreflight();
                    if (problem != null) throw new IOException(problem);
                    if (lifecycle != null && lifecycle.phase() == RecorderContract.Phase.CONNECTING) startCapture();
                } catch (Exception e) { fail(1002, reason(e)); }
            });
        }
        @Override public void onServiceDisconnected(ComponentName name) { worker.post(() -> { if (token == generation) disconnected("Shizuku disconnected"); }); }
        @Override public void onBindingDied(ComponentName name) { worker.post(() -> { if (token == generation) disconnected("Shizuku binding died"); }); }
    }; }
    private final Binder endpoint = new Binder() {
        @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            if (code == INTERFACE_TRANSACTION) { reply.writeString(RecorderContract.RECORDER); return true; }
            if (Binder.getCallingUid() != android.os.Process.myUid()) throw new SecurityException("Only this application UID may use the recorder");
            data.enforceInterface(RecorderContract.RECORDER);
            if (code == RecorderContract.START || code == RecorderContract.STOP) {
                String name = data.readString(); IBinder callback = data.readStrongBinder();
                if (callback == null) throw new IllegalArgumentException("Missing recording callback");
                if (code == RecorderContract.START) worker.post(() -> begin(name, callback));
                else worker.post(() -> stop(name, callback));
            } else if (code == RecorderContract.STATE) {
                reply.writeNoException(); reply.writeInt(isRecording() ? 1 : 0); return true;
            } else return super.onTransact(code, data, reply, flags);
            reply.writeNoException(); return true;
        }
    };
    private Binder callbackFor(final int token) { return new Binder() {
        @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            if (code == INTERFACE_TRANSACTION) { reply.writeString(RecorderContract.SHELL_CALLBACK); return true; }
            if (Binder.getCallingUid() != 2000) throw new SecurityException("Expected shell UID");
            data.enforceInterface(RecorderContract.SHELL_CALLBACK);
            if (code == 1) worker.post(() -> { if (token == generation) started(); });
            else if (code == 2) {
                long duration = data.readLong(), frames = data.readLong(), bytes = data.readLong();
                worker.post(() -> { if (token == generation) completed(duration, frames, bytes); });
            } else if (code == 3) {
                int error = data.readInt(); String reason = data.readString(); worker.post(() -> { if (token == generation) fail(error, reason); });
            } else return super.onTransact(code, data, reply, flags);
            reply.writeNoException(); return true;
        }
    }; }
    @Override public IBinder onBind(Intent intent) { return endpoint; }
    @Override public int onStartCommand(Intent intent, int flags, int id) {
        if (intent != null && STOP_ACTION.equals(intent.getAction())) {
            // A local emergency stop cannot manufacture an original stop request.
            worker.post(() -> fail(2001, "Recording cancelled by user; no completion was delivered"));
        }
        return START_NOT_STICKY;
    }
    private boolean isRecording() {
        RecorderContract.Lifecycle state = lifecycle;
        return state != null && (state.phase() == RecorderContract.Phase.RECORDING || state.phase() == RecorderContract.Phase.STOPPING);
    }
    private static String readiness(Context context) {
        if (!Shizuku.pingBinder()) return "Start Shizuku using wireless debugging or ADB";
        if (Shizuku.isPreV11() || Shizuku.getVersion() < 13) return "Shizuku version 13 or later is required";
        if (Shizuku.checkSelfPermission() != PackageManager.PERMISSION_GRANTED) return "Authorize this app in Shizuku";
        if (Shizuku.getUid() != 2000) return "Shizuku must run as shell UID 2000, not root";
        if (Build.VERSION.SDK_INT >= 33 && context.checkSelfPermission("android.permission.POST_NOTIFICATIONS") != PackageManager.PERMISSION_GRANTED) return "Allow notifications to keep recording status visible";
        return null;
    }
    private void begin(String name, IBinder callback) {
        if (lifecycle != null || binding) { sendError(callback, name, 0, 2001, "A recording request is already active"); return; }
        stopRequested = false;
        try {
            RecorderContract.displayName(name);
            String problem = readiness(this); if (problem != null) throw new SecurityException(problem);
            recordingChannels = ExtensionSettings.separateChannels(this) ? 2 : 1;
            request = name; client = callback; lifecycle = new RecorderContract.Lifecycle(); lifecycle.begin();
            final RecorderContract.Lifecycle active = lifecycle;
            clientDeath = () -> worker.post(() -> { if (lifecycle == active) fail(2001, "Original recording client died"); }); client.linkToDeath(clientDeath, 0);
            startService(new Intent(this, RecorderService.class));
            notifyRecording("Connecting shell recorder");
            setStatus("Connecting shell recorder"); connect();
            worker.postDelayed(timeout, 15000);
        } catch (Exception e) {
            if (lifecycle != null) fail(1002, reason(e)); else sendError(callback, name, 0, 1002, reason(e));
        }
    }
    private void connect() {
        final int token = ++generation;
        connection = connectionFor(token);
        shellDeath = () -> worker.post(() -> { if (token == generation) disconnected("Shell recorder died"); });
        args = new Shizuku.UserServiceArgs(new ComponentName(this, ShellRecorder.class)).daemon(false).processNameSuffix("eb_recorder").version(3).debuggable(false);
        binding = true; Shizuku.bindUserService(args, connection);
    }
    private String shellPreflight() throws Exception {
        Parcel data = Parcel.obtain(), reply = Parcel.obtain();
        try {
            data.writeInterfaceToken(RecorderContract.SHELL); data.writeInt(recordingChannels);
            transact(shell, 1, data, reply); return reply.readString();
        }
        finally { data.recycle(); reply.recycle(); }
    }
    private void startCapture() throws Exception {
        ContentValues values = new ContentValues();
        values.put(MediaStore.Audio.Media.DISPLAY_NAME, RecorderContract.displayName(request));
        values.put(MediaStore.Audio.Media.MIME_TYPE, "audio/mp4");
        values.put(MediaStore.Audio.Media.RELATIVE_PATH, "Music/Adot");
        values.put(MediaStore.Audio.Media.IS_PENDING, 1);
        pending = getContentResolver().insert(MediaStore.Audio.Media.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY), values);
        if (pending == null) throw new IOException("Cannot create pending recording");
        if (!getSharedPreferences(RECOVERY_PREFS, MODE_PRIVATE).edit().putString("pending", pending.toString()).commit())
            throw new IOException("Cannot persist recording recovery metadata");
        try (ParcelFileDescriptor fd = getContentResolver().openFileDescriptor(pending, "rw")) {
            if (fd == null) throw new IOException("Cannot open recording output");
            Parcel data = Parcel.obtain(), reply = Parcel.obtain();
            try {
                data.writeInterfaceToken(RecorderContract.SHELL); data.writeInt(android.os.Process.myUid()); data.writeString(request);
                data.writeInt(1); fd.writeToParcel(data, 0); data.writeStrongBinder(callbackFor(generation));
                data.writeInt(recordingChannels); transact(shell, 2, data, reply);
            } finally { data.recycle(); reply.recycle(); }
        }
    }
    private void started() {
        if (lifecycle == null) return;
        try {
            lifecycle.started(); worker.removeCallbacks(timeout);
            setStatus("Recording VOICE_CALL audio through shell; channels=" + recordingChannels); notifyRecording(status);
            callback(RecorderContract.STARTED, 0);
        } catch (Exception e) { fail(2001, reason(e)); }
    }
    private void stop(String name, IBinder callback) {
        if (lifecycle == null || !java.util.Objects.equals(name, request) || !callback.equals(client)) {
            sendError(callback, name, 1, 2001, "No matching recording request"); return;
        }
        stopRequested = true;
        try {
            lifecycle.stop(); setStatus("Finalizing recording"); notifyRecording(status);
            Parcel data = Parcel.obtain(), reply = Parcel.obtain();
            try { data.writeInterfaceToken(RecorderContract.SHELL); transact(shell, 3, data, reply); }
            finally { data.recycle(); reply.recycle(); }
            worker.postDelayed(timeout, 15000);
        } catch (Exception e) { fail(2001, reason(e)); }
    }
    private void completed(long duration, long frames, long bytes) {
        if (lifecycle == null) return;
        try {
            RecorderContract.requireCompletion(duration, frames, bytes);
            if (lifecycle.phase() != RecorderContract.Phase.STOPPING || pending == null) throw new IOException("Unexpected recording completion");
            try (ParcelFileDescriptor fd = getContentResolver().openFileDescriptor(pending, "r")) {
                if (fd == null || fd.getStatSize() <= 0) throw new IOException("Finalized recording is not readable");
            }
            ContentValues metadata = new ContentValues(); metadata.put(MediaStore.Audio.Media.DURATION, duration);
            metadata.put(MediaStore.Audio.Media.IS_PENDING, 0);
            if (getContentResolver().update(pending, metadata, null, null) != 1) throw new IOException("Cannot publish recording");
            try (Cursor row = getContentResolver().query(pending, new String[]{MediaStore.Audio.Media.DISPLAY_NAME, MediaStore.Audio.Media.SIZE}, null, null, null)) {
                if (row == null || !row.moveToFirst() || row.getString(0) == null || row.getLong(1) <= 0) throw new IOException("MediaStore has no finalized metadata");
            }
            // The original nma -> pma -> uu4 path owns call matching and summary eligibility.
            callback(RecorderContract.COMPLETED, duration);
            lifecycle.complete(); pending = null;
            getSharedPreferences(RECOVERY_PREFS, MODE_PRIVATE).edit().remove("pending").commit();
            setStatus("Recording finalized and delivered to the original call-history and summary pipeline. Server eligibility still applies.");
            cleanup();
        } catch (Exception e) { fail(2001, reason(e)); }
    }
    private void callback(int code, long duration) throws RemoteException {
        Parcel data = Parcel.obtain(), reply = Parcel.obtain();
        try {
            RecorderContract.CallbackWriter wire = new RecorderContract.CallbackWriter() {
                public void token(String value) { data.writeInterfaceToken(value); }
                public void string(String value) { data.writeString(value); }
                public void duration(long value) { data.writeLong(value); }
            };
            if (code == RecorderContract.COMPLETED) RecorderContract.writeCompleted(wire, request, pending.toString(), duration);
            else RecorderContract.writeStarted(wire, request);
            transact(client, code, data, reply);
        } finally { data.recycle(); reply.recycle(); }
    }
    private void fail(int error, String reason) {
        worker.removeCallbacks(timeout);
        if (lifecycle != null && lifecycle.fail()) sendError(client, request, isStopRequested() ? 1 : 0, error, reason);
        setStatus("Recording unavailable: " + reason); cleanup();
    }
    private boolean isStopRequested() { return stopRequested; }
    private void sendError(IBinder callback, String name, int job, int code, String message) {
        String text = "Recording failed: " + message;
        Log.w("EmbeddedRecorder", text);
        // Report on the main looper before a possibly slow original callback. Never open
        // an activity, request permissions or let a Toast failure affect the call lifecycle.
        if (ExtensionSettings.failureToasts(this)) {
            try {
                getMainExecutor().execute(() -> {
                    try { Toast.makeText(this, text, Toast.LENGTH_LONG).show(); }
                    catch (RuntimeException unavailable) { Log.w("EmbeddedRecorder", "Unable to show recording failure", unavailable); }
                });
            } catch (RuntimeException unavailable) { Log.w("EmbeddedRecorder", "Unable to schedule recording failure", unavailable); }
        }
        if (callback == null) return;
        Parcel data = Parcel.obtain(), reply = Parcel.obtain();
        try {
            Bundle error = new Bundle(); error.putInt("jobType", job); error.putInt("errorCode", code); error.putString("extraErrorMessage", message);
            data.writeInterfaceToken(RecorderContract.CALLBACK); data.writeString(name); data.writeInt(1); error.writeToParcel(data, 0);
            transact(callback, RecorderContract.FAILED, data, reply);
        } catch (Exception e) { Log.e("EmbeddedRecorder", "Unable to deliver recording error", e); }
        finally { data.recycle(); reply.recycle(); }
    }
    private static void transact(IBinder binder, int code, Parcel data, Parcel reply) throws RemoteException {
        if (binder == null || !binder.transact(code, data, reply, 0)) throw new RemoteException("Recorder transaction was rejected");
        reply.readException();
    }
    private void disconnected(String message) { if (binding) fail(2001, message); }
    private void cleanup() {
        worker.removeCallbacks(timeout);
        if (pending != null) {
            try { getContentResolver().delete(pending, null, null); getSharedPreferences(RECOVERY_PREFS, MODE_PRIVATE).edit().remove("pending").commit(); }
            catch (Exception e) { Log.e("EmbeddedRecorder", "Pending recording cleanup failed", e); }
            pending = null;
        }
        unlinkDeath(client, clientDeath);
        client = null; clientDeath = null; request = null; lifecycle = null; stopRequested = false;
        releaseShell(); stopForeground(STOP_FOREGROUND_REMOVE); stopSelf();
    }
    private void releaseShell() {
        worker.removeCallbacks(timeout); boolean wasBinding = binding; binding = false; generation++;
        unlinkDeath(shell, shellDeath); shell = null; shellDeath = null;
        try {
            if (wasBinding && args != null && Shizuku.pingBinder()) Shizuku.unbindUserService(args, connection, true);
        } catch (Exception e) { Log.w("EmbeddedRecorder", "Shell service teardown failed", e); }
        finally { args = null; connection = null; }
    }
    private static void unlinkDeath(IBinder binder, IBinder.DeathRecipient recipient) {
        if (binder == null || recipient == null) return;
        try { binder.unlinkToDeath(recipient, 0); }
        catch (RuntimeException e) { Log.w("EmbeddedRecorder", "Recorder death recipient was already removed", e); }
    }
    private void notifyRecording(String text) {
        NotificationManager manager = getSystemService(NotificationManager.class);
        manager.createNotificationChannel(new NotificationChannel(CHANNEL, "Embedded call recording", NotificationManager.IMPORTANCE_LOW));
        Intent settings = new Intent().setClassName(getPackageName(),
                "com.skt.prod.dialer.activities.setting.tservice.callrecord.CallRecordSettingActivity");
        PendingIntent open = PendingIntent.getActivity(this, 0, settings, PendingIntent.FLAG_IMMUTABLE | PendingIntent.FLAG_UPDATE_CURRENT);
        PendingIntent stop = PendingIntent.getService(this, 1, new Intent(this, RecorderService.class).setAction(STOP_ACTION), PendingIntent.FLAG_IMMUTABLE | PendingIntent.FLAG_UPDATE_CURRENT);
        Notification notification = new Notification.Builder(this, CHANNEL).setSmallIcon(android.R.drawable.ic_btn_speak_now)
                .setContentTitle("Embedded call recording").setContentText(text).setContentIntent(open).setOngoing(true)
                .addAction(new Notification.Action.Builder(null, "Cancel recording", stop).build()).build();
        startForeground(29041, notification);
    }
    private void setStatus(String value) { status = value; Log.i("EmbeddedRecorder", value); }
    private static String reason(Exception e) { return e.getMessage() == null ? e.getClass().getSimpleName() : e.getMessage(); }
    @Override public void onCreate() {
        super.onCreate();
        workerThread = new HandlerThread("EBRecorder");
        workerThread.start();
        worker = new Handler(workerThread.getLooper());
        worker.post(this::recoverPendingRecording);
    }
    private void recoverPendingRecording() {
        String abandoned = getSharedPreferences(RECOVERY_PREFS, MODE_PRIVATE).getString("pending", null);
        if (abandoned != null) {
            try {
                Uri uri = Uri.parse(abandoned);
                try (Cursor row = getContentResolver().query(uri, new String[]{MediaStore.Audio.Media.IS_PENDING}, null, null, null)) {
                    if (row != null && row.moveToFirst()) {
                        if (row.getInt(0) == 1) getContentResolver().delete(uri, null, null);
                        else setStatus("Recovered finalized audio. Delivery to the original call history cannot be confirmed; no callback was replayed.");
                    }
                }
                getSharedPreferences(RECOVERY_PREFS, MODE_PRIVATE).edit().remove("pending").commit();
            }
            catch (Exception e) { setStatus("Unable to clean interrupted recording: " + reason(e)); }
        }
    }
    @Override public void onDestroy() {
        worker.post(() -> {
            try {
                if (lifecycle != null) fail(2001, "Recorder service was destroyed before completion");
                else cleanup();
            } finally { workerThread.quitSafely(); }
        });
        super.onDestroy();
    }
}
