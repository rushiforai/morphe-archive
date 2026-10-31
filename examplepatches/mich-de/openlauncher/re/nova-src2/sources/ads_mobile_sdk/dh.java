package ads_mobile_sdk;

import b.b0;
import b.p1;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class dh implements b0 {

    /* renamed from: a, reason: collision with root package name */
    public final ed1 f2522a;

    /* renamed from: b, reason: collision with root package name */
    public final p1 f2523b;

    /* renamed from: c, reason: collision with root package name */
    public final AtomicBoolean f2524c;

    public dh(ed1 internalAppOpenAd, p1 fullscreenAdPresenter) {
        Intrinsics.g(internalAppOpenAd, "internalAppOpenAd");
        Intrinsics.g(fullscreenAdPresenter, "fullscreenAdPresenter");
        this.f2522a = internalAppOpenAd;
        this.f2523b = fullscreenAdPresenter;
        this.f2524c = new AtomicBoolean(false);
    }

    @Override // b.b0
    public final Object a(qo3 qo3Var, Continuation continuation) {
        if (qo3Var.f8763b && this.f2524c.compareAndSet(false, true) && this.f2522a.i().f4565u) {
            this.f2523b.d();
        }
        return Unit.f71706a;
    }
}
