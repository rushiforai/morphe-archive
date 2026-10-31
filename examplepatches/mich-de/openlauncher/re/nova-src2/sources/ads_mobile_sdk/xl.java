package ads_mobile_sdk;

import b.x2;
import kotlin.coroutines.Continuation;

/* loaded from: classes.dex */
public final class xl implements x2 {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f11763a;

    public xl(boolean z11) {
        this.f11763a = z11;
    }

    @Override // b.x2
    public final cw0 a() {
        return cw0.BANNER_REFRESH;
    }

    @Override // b.x2
    public final Object d(Continuation continuation) {
        return new xu0(new wl(this.f11763a));
    }
}
