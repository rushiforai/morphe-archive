package app.template.extension.aare;

import android.content.ComponentName;
import android.content.Context;
import android.content.ServiceConnection;
import android.content.pm.PackageManager;
import android.os.IBinder;
import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.util.Log;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

import rikka.shizuku.Shizuku;

/**
 * Reads WhatsApp voice notes through {@link VoiceNotesShell}, which Shizuku runs with adb-level
 * rights, the same way AARE runs its Shizuku audio helper. Call off the main thread: binding waits
 * for Shizuku's callback, which arrives on the main thread.
 */
final class VoiceNotesAccess {
    private static final String TAG = "AareVoiceNotes";

    /** A voice message's recording, opened read-only by the helper; [token] stands for the file. */
    static final class Found {
        final String token;
        final ParcelFileDescriptor pfd;

        Found(String token, ParcelFileDescriptor pfd) {
            this.token = token;
            this.pfd = pfd;
        }
    }

    private static final Object lock = new Object();
    private static IBinder binder;
    private static Connection connection;

    private VoiceNotesAccess() {
    }

    /** Whether Shizuku is running and AARE may use it (AARE asks for it in Car audio). */
    static boolean available() {
        try {
            return Shizuku.pingBinder() && !Shizuku.isPreV11()
                    && Shizuku.checkSelfPermission() == PackageManager.PERMISSION_GRANTED;
        } catch (Throwable t) {
            return false;
        }
    }

    /** Whether the helper is reachable (Shizuku running and allowed). */
    static boolean reachable(Context context) {
        return helper(context) != null;
    }

    /**
     * The recording of the voice message received at [messageTimeMs], lasting [statedMs] (-1 if
     * unknown), not one of [used]; null if none is. The helper picks it: AARE sees no other file.
     */
    static Found find(Context context, long messageTimeMs, long statedMs, java.util.Collection<String> used) {
        IBinder b = helper(context);
        if (b == null) return null;
        Parcel data = Parcel.obtain();
        Parcel reply = Parcel.obtain();
        try {
            data.writeInterfaceToken(VoiceNotesShell.DESCRIPTOR);
            data.writeLong(messageTimeMs);
            data.writeLong(statedMs);
            data.writeInt(used.size());
            for (String t : used) data.writeString(t);
            b.transact(VoiceNotesShell.TRANSACTION_FIND, data, reply, 0);
            reply.readException();
            if (reply.readInt() == 0) return null;
            String token = reply.readString();
            return new Found(token, ParcelFileDescriptor.CREATOR.createFromParcel(reply));
        } catch (Throwable t) {
            Log.w(TAG, "find", t);
            forget();
            return null;
        } finally {
            data.recycle();
            reply.recycle();
        }
    }

    private static final class Connection implements ServiceConnection {
        final Shizuku.UserServiceArgs args;
        final CountDownLatch bound = new CountDownLatch(1);

        Connection(Shizuku.UserServiceArgs args) {
            this.args = args;
        }

        @Override
        public void onServiceConnected(ComponentName name, IBinder service) {
            synchronized (lock) {
                if (connection == this && service != null && service.pingBinder()) binder = service;
            }
            bound.countDown();
        }

        @Override
        public void onServiceDisconnected(ComponentName name) {
            synchronized (lock) {
                if (connection == this) binder = null;
            }
        }
    }

    /** The helper's binder, starting it through Shizuku if needed; null if it can't. */
    private static IBinder helper(Context context) {
        if (!available()) return null;
        Connection c;
        synchronized (lock) {
            if (binder != null && binder.pingBinder()) return binder;
            binder = null;
            // A bind that connected and then lost its helper: start a new one.
            if (connection != null && connection.bound.getCount() == 0) forget();
            if (connection == null) {
                Shizuku.UserServiceArgs args = new Shizuku.UserServiceArgs(
                        new ComponentName(context.getPackageName(), VoiceNotesShell.class.getName()))
                        .daemon(false)
                        .processNameSuffix("voicenotes")
                        .debuggable(false)
                        .version(2); // 2: find() instead of list/open
                Connection nc = new Connection(args);
                connection = nc;
                try {
                    Shizuku.bindUserService(args, nc);
                } catch (Throwable t) {
                    Log.w(TAG, "Shizuku bind", t);
                    connection = null;
                    return null;
                }
            }
            c = connection;
        }
        try {
            if (!c.bound.await(5, TimeUnit.SECONDS)) {
                forget();
                return null;
            }
        } catch (InterruptedException e) {
            return null;
        }
        synchronized (lock) {
            return binder;
        }
    }

    /** Drops a helper that stopped answering, so the next call starts it again. */
    private static void forget() {
        synchronized (lock) {
            if (connection != null) {
                try {
                    Shizuku.unbindUserService(connection.args, connection, true);
                } catch (Throwable ignored) {
                }
            }
            connection = null;
            binder = null;
        }
    }
}
