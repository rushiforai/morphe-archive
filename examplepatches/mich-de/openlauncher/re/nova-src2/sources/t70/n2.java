package t70;

import kotlin.coroutines.Continuation;
import kotlinx.coroutines.TimeoutCancellationException;

/* loaded from: classes.dex */
public final class n2 extends y70.s implements Runnable {

    /* renamed from: e, reason: collision with root package name */
    public final long f88842e;

    public n2(long j11, Continuation continuation) {
        super(continuation, continuation.getContext());
        this.f88842e = j11;
    }

    @Override // t70.x1
    public final String Z() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(super.Z());
        sb2.append("(timeMillis=");
        return a2.c.n(sb2, this.f88842e, ')');
    }

    @Override // java.lang.Runnable
    public final void run() {
        t0.d(this.f88769c);
        z(new TimeoutCancellationException("Timed out waiting for " + this.f88842e + " ms", this));
    }
}
