package vu;

import com.stripe.android.paymentsheet.PaymentOptionContract;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class u implements s40.d {

    /* renamed from: a, reason: collision with root package name */
    public final s40.h f93258a;

    public u(r rVar, s40.e eVar) {
        this.f93258a = eVar;
    }

    @Override // w60.a
    public final Object get() {
        PaymentOptionContract.Args args = (PaymentOptionContract.Args) this.f93258a.get();
        Intrinsics.g(args, "args");
        return args.f44434f;
    }
}
