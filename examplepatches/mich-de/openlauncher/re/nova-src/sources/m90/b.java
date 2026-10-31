package m90;

import java.util.concurrent.locks.ReentrantLock;
import kotlin.Unit;

/* loaded from: classes.dex */
public final class b extends Thread {
    @Override // java.lang.Thread, java.lang.Runnable
    public final void run() {
        ReentrantLock reentrantLock;
        e eVarJ;
        while (true) {
            try {
                reentrantLock = e.f76107h;
                reentrantLock.lock();
                try {
                    eVarJ = ul.b.j();
                } finally {
                    reentrantLock.unlock();
                }
            } catch (InterruptedException unused) {
                continue;
            }
            if (eVarJ == e.f76111l) {
                e.f76111l = null;
                return;
            }
            Unit unit = Unit.f71706a;
            reentrantLock.unlock();
            if (eVarJ != null) {
                eVarJ.j();
            }
        }
    }
}
