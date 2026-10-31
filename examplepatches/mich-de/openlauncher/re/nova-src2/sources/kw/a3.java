package kw;

import b.c9;
import com.stripe.android.core.strings.IdentifierResolvableString;
import java.util.ArrayList;

/* loaded from: classes4.dex */
public final class a3 extends d3 {

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierResolvableString f72316a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f72317b;

    /* renamed from: c, reason: collision with root package name */
    public final z2 f72318c;

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f72319d;

    public a3(IdentifierResolvableString identifierResolvableString, boolean z11, z2 z2Var, ArrayList arrayList) {
        this.f72316a = identifierResolvableString;
        this.f72317b = z11;
        this.f72318c = z2Var;
        this.f72319d = arrayList;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a3)) {
            return false;
        }
        a3 a3Var = (a3) obj;
        return this.f72316a.equals(a3Var.f72316a) && this.f72317b == a3Var.f72317b && this.f72318c.equals(a3Var.f72318c) && this.f72319d.equals(a3Var.f72319d);
    }

    public final int hashCode() {
        return this.f72319d.hashCode() + ((this.f72318c.hashCode() + c9.f(this.f72316a.hashCode() * 31, 31, this.f72317b)) * 31);
    }

    public final String toString() {
        return "Dropdown(title=" + this.f72316a + ", hide=" + this.f72317b + ", currentItem=" + this.f72318c + ", items=" + this.f72319d + ")";
    }
}
