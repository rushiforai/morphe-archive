package js;

import com.stripe.android.link.LinkConfiguration;
import com.stripe.android.model.StripeIntent;
import ir.d;
import ir.e;
import ir.f;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final StripeIntent f69748a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f69749b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f69750c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f69751d;

    public a(StripeIntent stripeIntent, boolean z11, boolean z12, boolean z13) {
        Intrinsics.g(stripeIntent, "stripeIntent");
        this.f69748a = stripeIntent;
        this.f69749b = z11;
        this.f69750c = z12;
        this.f69751d = z13;
    }

    public final boolean a() {
        if (!this.f69748a.getF43545m()) {
            Object obj = d.f68006a;
            f fVar = f.f68008a;
            if (fVar.equals(obj)) {
                return false;
            }
            if (fVar.equals(e.f68007a)) {
                return true;
            }
            if (!fVar.equals(fVar)) {
                throw new NoWhenBranchMatchedException();
            }
        }
        return this.f69749b;
    }

    public final boolean b() {
        if (this.f69748a.getF43545m()) {
            return a();
        }
        Object obj = d.f68006a;
        f fVar = f.f68008a;
        if (fVar.equals(obj)) {
            return false;
        }
        if (fVar.equals(e.f68007a)) {
            return true;
        }
        if (fVar.equals(fVar)) {
            return a();
        }
        throw new NoWhenBranchMatchedException();
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public a(LinkConfiguration configuration) {
        this(configuration.f42895a, configuration.f42908p, configuration.f42909q, configuration.f42910r);
        Intrinsics.g(configuration, "configuration");
    }
}
