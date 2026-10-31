package vu;

import com.stripe.android.paymentsheet.addresselement.AutocompleteContract;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d implements s40.d {

    /* renamed from: a, reason: collision with root package name */
    public final s40.e f93165a;

    public d(s40.e eVar) {
        this.f93165a = eVar;
    }

    @Override // w60.a
    public final Object get() {
        AutocompleteContract.Args args = (AutocompleteContract.Args) this.f93165a.f86659a;
        Intrinsics.g(args, "args");
        return new pu.u(args.f44712b);
    }
}
