package ai;

import android.os.Binder;
import android.os.Process;
import androidx.core.os.OperationCanceledException;
import com.google.android.gms.internal.measurement.za;
import com.google.android.gms.measurement.internal.zzbh;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes3.dex */
public final /* synthetic */ class e1 implements Callable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f12900a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f12901b;

    public /* synthetic */ e1(Object obj, int i5) {
        this.f12900a = i5;
        this.f12901b = obj;
    }

    @Override // java.util.concurrent.Callable
    public final Object call() {
        switch (this.f12900a) {
            case 0:
                return new za(((g1) this.f12901b).f12975l);
            case 1:
                t1 t1Var = (t1) this.f12901b;
                t1Var.f13334a.V();
                s0 s0Var = t1Var.f13334a.f13046h;
                j4.T(s0Var);
                s0Var.D();
                throw new IllegalStateException("Unexpected call on client side");
            case 2:
                o6.a aVar = (o6.a) this.f12901b;
                AtomicBoolean atomicBoolean = aVar.f79612c;
                aVar.f79613d.set(true);
                try {
                    Process.setThreadPriority(10);
                    try {
                        aVar.f79614e.d();
                    } catch (OperationCanceledException e3) {
                        if (!atomicBoolean.get()) {
                            throw e3;
                        }
                    }
                    Binder.flushPendingCommands();
                    return null;
                } catch (Throwable th2) {
                    try {
                        atomicBoolean.set(true);
                        throw th2;
                    } finally {
                        aVar.a(null);
                    }
                }
            default:
                synchronized (((qo.d) this.f12901b)) {
                    try {
                        qo.d dVar = (qo.d) this.f12901b;
                        if (dVar.f84284i == null) {
                            return null;
                        }
                        dVar.D();
                        if (((qo.d) this.f12901b).e()) {
                            ((qo.d) this.f12901b).s();
                            ((qo.d) this.f12901b).f84286k = 0;
                        }
                        return null;
                    } finally {
                    }
                }
        }
    }

    public e1(t1 t1Var, zzbh zzbhVar, String str) {
        this.f12900a = 1;
        this.f12901b = t1Var;
    }
}
