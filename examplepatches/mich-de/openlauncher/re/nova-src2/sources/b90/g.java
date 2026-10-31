package b90;

import java.io.IOException;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.ExceptionsKt;
import kotlin.jvm.internal.Intrinsics;
import x80.e0;
import x80.v;

/* loaded from: classes.dex */
public final class g implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final x80.j f17679a;

    /* renamed from: b, reason: collision with root package name */
    public volatile AtomicInteger f17680b = new AtomicInteger(0);

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ j f17681c;

    public g(j jVar, x80.j jVar2) {
        this.f17681c = jVar;
        this.f17679a = jVar2;
    }

    @Override // java.lang.Runnable
    public final void run() {
        e0 e0Var;
        v vVarH = this.f17681c.f17685b.f95509a.h("/...");
        Intrinsics.d(vVarH);
        vVarH.h(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        vVarH.f(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        String strConcat = "OkHttp ".concat(vVarH.b().f95633i);
        j jVar = this.f17681c;
        Thread threadCurrentThread = Thread.currentThread();
        String name = threadCurrentThread.getName();
        threadCurrentThread.setName(strConcat);
        try {
            jVar.f17687d.h();
            boolean z11 = false;
            try {
                try {
                } catch (Throwable th2) {
                    jVar.f17684a.f95458a.b(this);
                    throw th2;
                }
            } catch (IOException e3) {
                e = e3;
            } catch (Throwable th3) {
                th = th3;
            }
            try {
                this.f17679a.onResponse(jVar, jVar.f());
                e0Var = jVar.f17684a;
            } catch (IOException e11) {
                e = e11;
                z11 = true;
                if (z11) {
                    g90.m mVar = g90.m.f57276a;
                    g90.m mVar2 = g90.m.f57276a;
                    String str = "Callback failure for " + j.a(jVar);
                    mVar2.getClass();
                    g90.m.i(4, str, e);
                } else {
                    this.f17679a.onFailure(jVar, e);
                }
                e0Var = jVar.f17684a;
                e0Var.f95458a.b(this);
            } catch (Throwable th4) {
                th = th4;
                z11 = true;
                jVar.cancel();
                if (!z11) {
                    IOException iOException = new IOException("canceled due to " + th);
                    ExceptionsKt.a(iOException, th);
                    this.f17679a.onFailure(jVar, iOException);
                }
                throw th;
            }
            e0Var.f95458a.b(this);
        } finally {
            threadCurrentThread.setName(name);
        }
    }
}
