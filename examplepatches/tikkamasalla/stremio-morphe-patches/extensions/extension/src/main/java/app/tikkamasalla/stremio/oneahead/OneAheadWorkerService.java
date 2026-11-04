package app.tikkamasalla.stremio.oneahead;

import android.app.Service;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Message;
import android.os.Messenger;
import android.os.Process;
import android.os.RemoteException;
import android.util.Log;

/**
 * Runs the background job in its own process (declared with android:process=":oneahead"), so a
 * native decoder crash ends this process only and the player keeps running. It takes exactly one
 * job per process life: the system may recreate a bound service after a crash, and a recreated one
 * is never sent a job. Links arrive in the job message and stay in memory.
 */
public final class OneAheadWorkerService extends Service {
    static final int MSG_START = 1, MSG_STATE = 2, MSG_FINISHED = 3, MSG_DIARY = 4;

    private boolean started;
    private final Messenger in = new Messenger(new Handler(Looper.getMainLooper(), this::onMessage));

    @Override
    public IBinder onBind(Intent intent) {
        return in.getBinder();
    }

    /** Unbound means the job is over: nothing in this process is worth keeping in memory. */
    @Override
    public void onDestroy() {
        Process.killProcess(Process.myPid());
    }

    private boolean onMessage(Message m) {
        try {
            if (m.what == MSG_STATE) {
                OneAheadTrigger.applyPlayerState(m.getData());
            } else if (m.what == MSG_START && !started && m.replyTo != null) {
                started = true;
                startJob(m.getData(), m.replyTo);
            }
        } catch (Throwable t) {
            Log.w("OneAhead", "worker message " + OneAheadGate.safeReason(t));
            if (m.what == MSG_START) Process.killProcess(Process.myPid()); // the app must not wait on a job that never ran
        }
        return true;
    }

    private void startJob(final Bundle job, final Messenger reply) throws RemoteException {
        // The app going away takes this job with it: no player state and nobody to read the result.
        reply.getBinder().linkToDeath(() -> Process.killProcess(Process.myPid()), 0);
        OneAheadTrigger.applyPlayerState(job);
        Thread t = new Thread(() -> {
            try {
                OneAheadTrigger.runJob(getApplicationContext(), job, reply);
            } catch (Throwable fatal) {
                Log.w("OneAhead", "worker job " + OneAheadGate.safeReason(fatal));
                Process.killProcess(Process.myPid());
            }
        }, "one-ahead");
        t.setDaemon(true);
        t.setPriority(Thread.MIN_PRIORITY);
        t.start();
    }
}
