package vu;

import com.stripe.android.paymentsheet.PaymentOptionContract;
import kotlin.jvm.internal.Intrinsics;
import ps.i0;

/* loaded from: classes4.dex */
public final class s implements s40.d {

    /* renamed from: a, reason: collision with root package name */
    public final s40.e f93256a;

    public s(r rVar, s40.e eVar) {
        this.f93256a = eVar;
    }

    @Override // w60.a
    public final Object get() {
        PaymentOptionContract.Args args = (PaymentOptionContract.Args) this.f93256a.f86659a;
        Intrinsics.g(args, "args");
        String str = args.f44435g;
        i0.i(str);
        return str;
    }
}
