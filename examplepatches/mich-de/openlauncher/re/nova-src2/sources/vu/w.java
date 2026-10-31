package vu;

import com.stripe.android.paymentsheet.PaymentSheetContract;
import kotlin.jvm.internal.Intrinsics;
import ps.i0;

/* loaded from: classes4.dex */
public final class w implements s40.d {

    /* renamed from: a, reason: collision with root package name */
    public final s40.h f93259a;

    public w(v vVar, s40.e eVar) {
        this.f93259a = eVar;
    }

    @Override // w60.a
    public final Object get() {
        PaymentSheetContract.Args args = (PaymentSheetContract.Args) this.f93259a.get();
        Intrinsics.g(args, "args");
        String str = args.f44665c;
        i0.i(str);
        return str;
    }
}
