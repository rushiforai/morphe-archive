package defpackage;

import java.io.IOException;
import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class zua implements Runnable {
    public final j41 a;
    public volatile AtomicInteger b = new AtomicInteger(0);
    public final /* synthetic */ cva c;

    public zua(cva cvaVar, j41 j41Var) {
        this.c = cvaVar;
        this.a = j41Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        n0c n0cVar;
        String strConcat = "OkHttp ".concat(this.c.b.a.h());
        cva cvaVar = this.c;
        Thread threadCurrentThread = Thread.currentThread();
        String name = threadCurrentThread.getName();
        threadCurrentThread.setName(strConcat);
        try {
            cvaVar.e.i();
            boolean z = false;
            try {
                try {
                    try {
                        this.a.o(cvaVar, cvaVar.g());
                        n0cVar = cvaVar.a.a;
                    } catch (IOException e) {
                        e = e;
                        z = true;
                        if (z) {
                            ea9 ea9Var = ea9.a;
                            ea9 ea9Var2 = ea9.a;
                            StringBuilder sb = new StringBuilder("Callback failure for ");
                            StringBuilder sb2 = new StringBuilder(cvaVar.q ? "canceled " : "");
                            sb2.append(cvaVar.c ? "web socket" : "call");
                            sb2.append(" to ");
                            sb2.append(cvaVar.b.a.h());
                            sb.append(sb2.toString());
                            ea9Var2.i(4, sb.toString(), e);
                        } else {
                            this.a.w(cvaVar, e);
                        }
                        n0cVar = cvaVar.a.a;
                    } catch (Throwable th) {
                        th = th;
                        z = true;
                        cvaVar.cancel();
                        if (!z) {
                            IOException iOException = new IOException("canceled due to " + th);
                            iOException.initCause(th);
                            this.a.w(cvaVar, iOException);
                        }
                        if (!(th instanceof InterruptedException)) {
                            throw th;
                        }
                        Thread.currentThread().interrupt();
                        n0cVar = cvaVar.a.a;
                    }
                } catch (Throwable th2) {
                    n0c n0cVar2 = cvaVar.a.a;
                    n0cVar2.getClass();
                    n0c.b0(n0cVar2, null, null, this, 3);
                    throw th2;
                }
            } catch (IOException e2) {
                e = e2;
            } catch (Throwable th3) {
                th = th3;
            }
            n0cVar.getClass();
            n0c.b0(n0cVar, null, null, this, 3);
        } finally {
            threadCurrentThread.setName(name);
        }
    }
}
