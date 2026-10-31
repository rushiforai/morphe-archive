package ads_mobile_sdk;

import java.util.concurrent.CancellationException;

/* loaded from: classes.dex */
public final class du0 extends CancellationException implements b.a4 {

    /* renamed from: a, reason: collision with root package name */
    public final CancellationException f2632a;

    public du0(CancellationException cancellationException) {
        super(cancellationException.getMessage());
        this.f2632a = cancellationException;
    }

    @Override // b.a4
    public final Throwable a() {
        return this.f2632a;
    }
}
