package w4;

import android.os.CancellationSignal;
import androidx.core.os.OperationCanceledException;

/* loaded from: classes2.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public boolean f93744a;

    /* renamed from: b, reason: collision with root package name */
    public c f93745b;

    /* renamed from: c, reason: collision with root package name */
    public CancellationSignal f93746c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f93747d;

    public final void a() {
        synchronized (this) {
            try {
                if (this.f93744a) {
                    return;
                }
                this.f93744a = true;
                this.f93747d = true;
                c cVar = this.f93745b;
                CancellationSignal cancellationSignal = this.f93746c;
                if (cVar != null) {
                    try {
                        cVar.onCancel();
                    } catch (Throwable th2) {
                        synchronized (this) {
                            this.f93747d = false;
                            notifyAll();
                            throw th2;
                        }
                    }
                }
                if (cancellationSignal != null) {
                    cancellationSignal.cancel();
                }
                synchronized (this) {
                    this.f93747d = false;
                    notifyAll();
                }
            } finally {
            }
        }
    }

    public final void b(c cVar) {
        synchronized (this) {
            while (this.f93747d) {
                try {
                    try {
                        wait();
                    } catch (InterruptedException unused) {
                    }
                } finally {
                }
            }
            if (this.f93745b == cVar) {
                return;
            }
            this.f93745b = cVar;
            if (this.f93744a && cVar != null) {
                cVar.onCancel();
            }
        }
    }

    public final void c() {
        boolean z11;
        synchronized (this) {
            z11 = this.f93744a;
        }
        if (z11) {
            throw new OperationCanceledException();
        }
    }
}
