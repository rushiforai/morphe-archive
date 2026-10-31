package ww;

import com.stripe.android.stripe3ds2.init.ui.StripeToolbarCustomization;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f94789a;

    /* renamed from: b, reason: collision with root package name */
    public final StripeToolbarCustomization f94790b;

    public j0(String str, StripeToolbarCustomization toolbarCustomization) {
        Intrinsics.g(toolbarCustomization, "toolbarCustomization");
        this.f94789a = str;
        this.f94790b = toolbarCustomization;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j0)) {
            return false;
        }
        j0 j0Var = (j0) obj;
        return Intrinsics.b(this.f94789a, j0Var.f94789a) && Intrinsics.b(this.f94790b, j0Var.f94790b);
    }

    public final int hashCode() {
        return this.f94790b.hashCode() + (this.f94789a.hashCode() * 31);
    }

    public final String toString() {
        return "ToolbarTitleData(text=" + this.f94789a + ", toolbarCustomization=" + this.f94790b + ")";
    }
}
