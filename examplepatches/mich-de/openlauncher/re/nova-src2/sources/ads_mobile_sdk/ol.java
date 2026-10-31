package ads_mobile_sdk;

import b.m9;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class ol implements m9 {

    /* renamed from: a, reason: collision with root package name */
    public final b.c7 f7966a;

    /* renamed from: b, reason: collision with root package name */
    public final AtomicBoolean f7967b;

    public ol(b.c7 refreshListener) {
        Intrinsics.g(refreshListener, "refreshListener");
        this.f7966a = refreshListener;
        this.f7967b = new AtomicBoolean(false);
    }

    @Override // b.m9
    public final Object c(Continuation continuation) {
        Object objA;
        return (this.f7967b.compareAndSet(false, true) && (objA = this.f7966a.a(continuation)) == CoroutineSingletons.f71806a) ? objA : Unit.f71706a;
    }
}
