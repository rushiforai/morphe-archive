package jv;

import b.c9;
import com.stripe.android.core.strings.IdentifierResolvableString;
import hv.n2;
import java.util.List;
import kotlin.LazyKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class u {

    /* renamed from: a, reason: collision with root package name */
    public final List f70171a;

    /* renamed from: b, reason: collision with root package name */
    public final ou.j f70172b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f70173c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f70174d;

    /* renamed from: e, reason: collision with root package name */
    public final a70.d f70175e;

    public u(List paymentMethods, ou.j jVar, boolean z11, boolean z12) {
        Intrinsics.g(paymentMethods, "paymentMethods");
        this.f70171a = paymentMethods;
        this.f70172b = jVar;
        this.f70173c = z11;
        this.f70174d = z12;
        this.f70175e = LazyKt.a(new fr.b0(this, 16));
    }

    public final IdentifierResolvableString a() {
        boolean z11 = this.f70173c;
        a70.d dVar = this.f70175e;
        if (z11) {
            return zg.a.G(((Boolean) dVar.getValue()).booleanValue() ? 2132019911 : 2132019913);
        }
        return zg.a.G(((Boolean) dVar.getValue()).booleanValue() ? 2132019983 : 2132019984);
    }

    public final n2 b(bo.c cVar) {
        return new n2(!cVar.f18343j, this.f70174d, this.f70173c, new fr.b0(cVar, 15));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u)) {
            return false;
        }
        u uVar = (u) obj;
        return Intrinsics.b(this.f70171a, uVar.f70171a) && Intrinsics.b(this.f70172b, uVar.f70172b) && this.f70173c == uVar.f70173c && this.f70174d == uVar.f70174d;
    }

    public final int hashCode() {
        int iHashCode = this.f70171a.hashCode() * 31;
        ou.j jVar = this.f70172b;
        return Boolean.hashCode(this.f70174d) + c9.f((iHashCode + (jVar == null ? 0 : jVar.hashCode())) * 31, 31, this.f70173c);
    }

    public final String toString() {
        return "State(paymentMethods=" + this.f70171a + ", currentSelection=" + this.f70172b + ", isEditing=" + this.f70173c + ", canEdit=" + this.f70174d + ")";
    }
}
