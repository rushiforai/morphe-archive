package t70;

import java.util.concurrent.ScheduledFuture;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes5.dex */
public final class i implements k {

    /* renamed from: a, reason: collision with root package name */
    public final ScheduledFuture f88802a;

    public i(ScheduledFuture scheduledFuture) {
        this.f88802a = scheduledFuture;
    }

    @Override // t70.k
    public final void a(Throwable th2) {
        this.f88802a.cancel(false);
    }

    public final String toString() {
        return "CancelFutureOnCancel[" + this.f88802a + AbstractJsonLexerKt.END_LIST;
    }
}
