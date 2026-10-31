package ads_mobile_sdk;

import java.util.concurrent.CancellationException;
import kotlinx.coroutines.TimeoutCancellationException;

/* loaded from: classes.dex */
public final class lw0 extends CancellationException implements b.a4 {

    /* renamed from: a, reason: collision with root package name */
    public final TimeoutCancellationException f6982a;

    public lw0(TimeoutCancellationException timeoutCancellationException) {
        super(timeoutCancellationException.getMessage());
        this.f6982a = timeoutCancellationException;
    }

    @Override // b.a4
    public final Throwable a() {
        return this.f6982a;
    }
}
