package w4;

import android.os.OutcomeReceiver;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Result;
import kotlin.ResultKt;
import t70.m;

/* loaded from: classes2.dex */
public final class e extends AtomicBoolean implements OutcomeReceiver {

    /* renamed from: a, reason: collision with root package name */
    public final m f93748a;

    public e(m mVar) {
        super(false);
        this.f93748a = mVar;
    }

    public final void onError(Throwable th2) {
        if (compareAndSet(false, true)) {
            int i5 = Result.f71687b;
            this.f93748a.resumeWith(ResultKt.a(th2));
        }
    }

    public final void onResult(Object obj) {
        if (compareAndSet(false, true)) {
            int i5 = Result.f71687b;
            this.f93748a.resumeWith(obj);
        }
    }

    @Override // java.util.concurrent.atomic.AtomicBoolean
    public final String toString() {
        return "ContinuationOutcomeReceiver(outcomeReceived = " + get() + ')';
    }
}
