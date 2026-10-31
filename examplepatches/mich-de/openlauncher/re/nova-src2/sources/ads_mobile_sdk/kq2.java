package ads_mobile_sdk;

import java.util.concurrent.CancellationException;

/* loaded from: classes2.dex */
public final class kq2 extends CancellationException implements b.a4 {

    /* renamed from: a, reason: collision with root package name */
    public final CancellationException f5931a;

    public kq2(CancellationException cancellationException) {
        super(cancellationException.getMessage());
        this.f5931a = cancellationException;
    }

    @Override // b.a4
    public final Throwable a() {
        return this.f5931a;
    }
}
