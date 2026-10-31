package vu;

import com.stripe.android.paymentsheet.PaymentSheetContract;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class x implements s40.d {

    /* renamed from: a, reason: collision with root package name */
    public final v f93260a;

    /* renamed from: b, reason: collision with root package name */
    public final s40.h f93261b;

    public x(v vVar, s40.e eVar) {
        this.f93260a = vVar;
        this.f93261b = eVar;
    }

    @Override // w60.a
    public final Object get() {
        PaymentSheetContract.Args starterArgs = (PaymentSheetContract.Args) this.f93261b.get();
        this.f93260a.getClass();
        Intrinsics.g(starterArgs, "starterArgs");
        return starterArgs.f44666d;
    }
}
