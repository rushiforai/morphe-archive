package fs;

import com.stripe.android.link.LinkAccountUpdate;
import h6.u0;
import kotlin.jvm.internal.Intrinsics;
import w70.o1;

/* loaded from: classes4.dex */
public final class g0 {

    /* renamed from: a, reason: collision with root package name */
    public final u0 f55776a;

    /* renamed from: b, reason: collision with root package name */
    public final o1 f55777b;

    public g0(u0 u0Var) {
        this.f55776a = u0Var;
        this.f55777b = u0Var.b(new LinkAccountUpdate.Value(null, null), "LINK_ACCOUNT_HOLDER_STATE");
    }

    public final void a(LinkAccountUpdate.Value info) {
        Intrinsics.g(info, "info");
        this.f55776a.d("LINK_ACCOUNT_HOLDER_STATE", info);
    }
}
