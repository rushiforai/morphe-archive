package i50;

import h50.o1;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import t70.j0;

/* loaded from: classes.dex */
public final class h implements j0 {

    /* renamed from: a, reason: collision with root package name */
    public final o1 f61393a;

    /* renamed from: b, reason: collision with root package name */
    public final CoroutineContext f61394b;

    public h(o1 httpSendSender, CoroutineContext coroutineContext) {
        Intrinsics.g(httpSendSender, "httpSendSender");
        Intrinsics.g(coroutineContext, "coroutineContext");
        this.f61393a = httpSendSender;
        this.f61394b = coroutineContext;
    }

    @Override // t70.j0
    public final CoroutineContext getCoroutineContext() {
        return this.f61394b;
    }
}
