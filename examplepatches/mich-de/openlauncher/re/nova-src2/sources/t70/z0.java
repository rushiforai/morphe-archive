package t70;

import java.util.concurrent.ScheduledFuture;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes5.dex */
public final class z0 implements a1 {

    /* renamed from: a, reason: collision with root package name */
    public final ScheduledFuture f88887a;

    public z0(ScheduledFuture scheduledFuture) {
        this.f88887a = scheduledFuture;
    }

    @Override // t70.a1
    public final void dispose() {
        this.f88887a.cancel(false);
    }

    public final String toString() {
        return "DisposableFutureHandle[" + this.f88887a + AbstractJsonLexerKt.END_LIST;
    }
}
