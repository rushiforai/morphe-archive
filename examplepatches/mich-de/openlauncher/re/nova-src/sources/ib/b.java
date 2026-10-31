package ib;

import android.os.Process;
import gu.j;

/* loaded from: classes2.dex */
public final class b extends Thread {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f61472a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f61473b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(j30.d dVar, Runnable runnable, String str) {
        super(runnable, str);
        this.f61473b = dVar;
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public final void run() throws SecurityException, IllegalArgumentException {
        c cVar;
        a aVar;
        switch (this.f61472a) {
            case 0:
                break;
            case 1:
                do {
                    try {
                    } catch (InterruptedException e3) {
                        throw new IllegalStateException(e3);
                    }
                } while (((jf.e) this.f61473b).g());
                return;
            default:
                Process.setThreadPriority(((j30.d) this.f61473b).f68883a);
                super.run();
                return;
        }
        while (!isInterrupted()) {
            try {
                synchronized (((c) this.f61473b).f61486m) {
                    while (true) {
                        cVar = (c) this.f61473b;
                        j jVar = cVar.f61487p;
                        aVar = (a) jVar.f57836b;
                        if (aVar != null) {
                            jVar.f57836b = aVar.f61468r;
                        }
                        if (aVar == null) {
                            cVar.f61486m.wait();
                        }
                    }
                }
                cVar.a(aVar);
            } catch (InterruptedException unused) {
                return;
            }
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(jf.e eVar) {
        super("ExoPlayer:SimpleDecoder");
        this.f61473b = eVar;
    }

    public b(c cVar) {
        this.f61473b = cVar;
    }
}
