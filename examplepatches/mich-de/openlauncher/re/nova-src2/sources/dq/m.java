package dq;

import com.stripe.android.auth.PaymentBrowserAuthContract;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m implements n {

    /* renamed from: a, reason: collision with root package name */
    public final j.c f49356a;

    public m(j.c launcher) {
        Intrinsics.g(launcher, "launcher");
        this.f49356a = launcher;
    }

    @Override // ww.b
    public final void a(Object obj) {
        this.f49356a.a((PaymentBrowserAuthContract.Args) obj, null);
    }
}
