package app.tikkamasalla.stremio.oneahead;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Message;
import android.os.Messenger;
import android.os.RemoteException;
import android.util.Log;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/**
 * The app's side of the worker process: binds, sends the one job, feeds it the player state once a
 * second, and blocks the calling thread until the job reports or the process dies. A dead worker
 * is never sent the job again, and the binding is dropped at once, so the system has nothing to restart.
 */
final class OneAheadWorkerLink {
    enum End { FINISHED, DIED, NO_START }

    private static final long CONNECT_WAIT_S = 30, STATE_EVERY_MS = 1000;

    interface Replies {
        void diary(Bundle event);
        Bundle playerState();
    }

    private final Handler main = new Handler(Looper.getMainLooper());
    private final CountDownLatch connected = new CountDownLatch(1), over = new CountDownLatch(1);
    private volatile Messenger service;
    private volatile Bundle finished;
    private volatile boolean died, sent, closed;

    /** The worker's last report; only meaningful after FINISHED. */
    Bundle finished() {
        return finished;
    }

    End run(Context ctx, Bundle job, Replies replies) throws InterruptedException {
        Messenger back = new Messenger(new Handler(Looper.getMainLooper(), m -> {
            if (m.what == OneAheadWorkerService.MSG_FINISHED) {
                finished = m.getData();
                over.countDown();
            } else if (m.what == OneAheadWorkerService.MSG_DIARY) {
                replies.diary(m.getData());
            }
            return true;
        }));
        Runnable tick = new Runnable() {
            @Override
            public void run() {
                Messenger s = service;
                if (s == null || closed || over.getCount() == 0) return;
                try {
                    Message m = Message.obtain(null, OneAheadWorkerService.MSG_STATE);
                    m.setData(replies.playerState());
                    s.send(m);
                    main.postDelayed(this, STATE_EVERY_MS);
                } catch (RemoteException gone) {
                    markDied();
                }
            }
        };
        ServiceConnection conn = new ServiceConnection() {
            @Override
            public void onServiceConnected(ComponentName name, IBinder binder) {
                if (sent || closed) return; // recreated after a crash, or given up on: it gets nothing
                sent = true;
                try {
                    Messenger s = new Messenger(binder);
                    Message m = Message.obtain(null, OneAheadWorkerService.MSG_START);
                    m.replyTo = back;
                    job.putAll(replies.playerState());
                    m.setData(job);
                    s.send(m);
                    service = s;
                    connected.countDown();
                    main.postDelayed(tick, STATE_EVERY_MS);
                } catch (RemoteException gone) {
                    connected.countDown();
                    markDied();
                }
            }
            @Override public void onServiceDisconnected(ComponentName name) { markDied(); }
            @Override public void onBindingDied(ComponentName name) { markDied(); }
            @Override public void onNullBinding(ComponentName name) { connected.countDown(); markDied(); }
        };
        Intent intent = new Intent().setClassName(ctx.getPackageName(), OneAheadWorkerService.class.getName());
        boolean bound;
        try {
            bound = ctx.bindService(intent, conn, Context.BIND_AUTO_CREATE | Context.BIND_NOT_FOREGROUND);
        } catch (RuntimeException refused) {
            Log.w("OneAhead", "worker bind " + OneAheadGate.safeReason(refused));
            return End.NO_START;
        }
        if (!bound) return End.NO_START;
        try {
            if (!connected.await(CONNECT_WAIT_S, TimeUnit.SECONDS)) return End.NO_START;
            if (died) return End.DIED;
            over.await();
            return died && finished == null ? End.DIED : End.FINISHED;
        } finally {
            closed = true;
            main.removeCallbacks(tick);
            service = null;
            try { ctx.unbindService(conn); } catch (RuntimeException alreadyGone) { /* nothing to unbind */ }
        }
    }

    private void markDied() {
        died = true;
        sent = true;
        connected.countDown();
        over.countDown();
    }
}
