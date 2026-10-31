package wv;

import com.stripe.android.stripe3ds2.transactions.ErrorData;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import t70.k0;
import t70.m0;

/* loaded from: classes4.dex */
public final class n implements i {

    /* renamed from: a, reason: collision with root package name */
    public final vk.j f94739a;

    /* renamed from: b, reason: collision with root package name */
    public final tv.d f94740b;

    /* renamed from: c, reason: collision with root package name */
    public final CoroutineContext f94741c;

    public n(vk.j jVar, tv.d dVar, CoroutineContext workContext) {
        Intrinsics.g(workContext, "workContext");
        this.f94739a = jVar;
        this.f94740b = dVar;
        this.f94741c = workContext;
    }

    public final void a(ErrorData errorData) {
        Object objA;
        Intrinsics.g(errorData, "errorData");
        try {
            int i5 = Result.f71687b;
            objA = errorData.b().toString();
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            ((tv.c) this.f94740b).c(new RuntimeException("Could not convert ErrorData to JSON.\n$" + errorData, thA));
        }
        Continuation continuation = null;
        if (objA instanceof Result.Failure) {
            objA = null;
        }
        String str = (String) objA;
        if (str != null) {
            m0.t(k0.a(this.f94741c), null, null, new pu.h(this, str, continuation, 23), 3);
        }
    }
}
