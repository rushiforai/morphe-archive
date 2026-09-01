package defpackage;

import android.os.Process;
import java.util.concurrent.locks.ReentrantLock;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p90 extends Thread {
    public final /* synthetic */ int a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ p90(String str) {
        super(str);
        this.a = 0;
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        ReentrantLock reentrantLock;
        q90 q90VarO;
        switch (this.a) {
            case 0:
                break;
            case 1:
                Process.setThreadPriority(10);
                super.run();
                return;
            default:
                super.run();
                return;
        }
        while (true) {
            try {
                reentrantLock = q90.j;
                reentrantLock.lock();
                try {
                    q90VarO = k40.O();
                } catch (Throwable th) {
                    reentrantLock.unlock();
                    throw th;
                }
            } catch (InterruptedException unused) {
            }
            if (q90VarO == q90.i) {
                q90.i = null;
                reentrantLock.unlock();
                return;
            } else {
                reentrantLock.unlock();
                if (q90VarO != null) {
                    q90VarO.k();
                }
            }
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ p90(int i, Runnable runnable, String str) {
        super(runnable, str);
        this.a = i;
    }
}
