package jr;

import f1.z1;
import hv.n2;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class p0 extends q0 {

    /* renamed from: c, reason: collision with root package name */
    public final hv.p0 f69724c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f69725d;

    public p0(hv.p0 p0Var, boolean z11) {
        super(false, true);
        this.f69724c = p0Var;
        this.f69725d = z11;
    }

    @Override // jr.q0
    public final n2 b(Function0 onEditIconPressed) {
        Intrinsics.g(onEditIconPressed, "onEditIconPressed");
        return new n2(!this.f69725d, false, false, new z1(26));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p0)) {
            return false;
        }
        p0 p0Var = (p0) obj;
        return this.f69724c.equals(p0Var.f69724c) && this.f69725d == p0Var.f69725d;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f69725d) + (this.f69724c.hashCode() * 31);
    }

    public final String toString() {
        return "UpdatePaymentMethod(updatePaymentMethodInteractor=" + this.f69724c + ", isLiveMode=" + this.f69725d + ")";
    }
}
