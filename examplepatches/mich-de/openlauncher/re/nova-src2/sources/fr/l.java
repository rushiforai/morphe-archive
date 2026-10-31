package fr;

import com.amplitude.android.migration.DatabaseConstants;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import t70.y0;

/* loaded from: classes4.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public final cw.r f55655a;

    /* renamed from: b, reason: collision with root package name */
    public final CoroutineContext f55656b;

    /* renamed from: c, reason: collision with root package name */
    public final xq.c f55657c;

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public l() {
        this(xq.d.f96224b, a80.d.f488c);
        a80.e eVar = y0.f88884a;
    }

    public final void a(b bVar) {
        this.f55657c.c("Event: " + bVar.f55579a.get(DatabaseConstants.EVENT_FIELD));
        t70.m0.t(t70.k0.a(this.f55656b), null, null, new dm.c(this, bVar, (Continuation) null, 11), 3);
    }

    public l(xq.c logger, CoroutineContext workContext) {
        Intrinsics.g(logger, "logger");
        Intrinsics.g(workContext, "workContext");
        this.f55655a = new cw.r(workContext, logger, 14);
        this.f55656b = workContext;
        this.f55657c = logger;
    }
}
