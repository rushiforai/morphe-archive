package hv;

import b.c9;
import com.stripe.android.uicore.elements.IdentifierSpec;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f60106a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f60107b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f60108c;

    /* renamed from: d, reason: collision with root package name */
    public final kw.b0 f60109d;

    /* renamed from: e, reason: collision with root package name */
    public final kw.e3 f60110e;

    /* renamed from: f, reason: collision with root package name */
    public final Object f60111f;

    public a1(String text, boolean z11, boolean z12, kw.b0 b0Var) {
        Intrinsics.g(text, "text");
        this.f60106a = text;
        this.f60107b = z11;
        this.f60108c = z12;
        this.f60109d = b0Var;
        kw.e3 e3VarJ = text.equals("•• / ••") ? kw.f3.f72376b : b0Var.j(text);
        this.f60110e = e3VarJ;
        this.f60111f = e3VarJ.isValid() ? cw.c1.a(new pw.a(text, false)) : null;
    }

    public static a1 a(a1 a1Var, String text, int i5) {
        if ((i5 & 1) != 0) {
            text = a1Var.f60106a;
        }
        boolean z11 = a1Var.f60107b;
        boolean z12 = (i5 & 4) != 0 ? a1Var.f60108c : true;
        kw.b0 b0Var = a1Var.f60109d;
        Intrinsics.g(text, "text");
        return new a1(text, z11, z12, b0Var);
    }

    /* JADX WARN: Type inference failed for: r1v0, types: [java.lang.Object, java.util.Map] */
    public final Integer b() {
        String str;
        Integer numU0;
        int iIntValue;
        ?? r12 = this.f60111f;
        if (r12 != 0) {
            IdentifierSpec.Companion.getClass();
            pw.a aVar = (pw.a) r12.get(IdentifierSpec.f45369j);
            if (aVar != null && (str = aVar.f83105a) != null && (numU0 = r70.i.u0(str)) != null && 1 <= (iIntValue = numU0.intValue()) && iIntValue <= 12) {
                return numU0;
            }
        }
        return null;
    }

    /* JADX WARN: Type inference failed for: r1v0, types: [java.lang.Object, java.util.Map] */
    public final Integer c() {
        String str;
        Integer numU0;
        int iIntValue;
        ?? r12 = this.f60111f;
        if (r12 != 0) {
            IdentifierSpec.Companion.getClass();
            pw.a aVar = (pw.a) r12.get(IdentifierSpec.f45370k);
            if (aVar != null && (str = aVar.f83105a) != null && (numU0 = r70.i.u0(str)) != null && 2000 <= (iIntValue = numU0.intValue()) && iIntValue <= 2100) {
                return numU0;
            }
        }
        return null;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a1)) {
            return false;
        }
        a1 a1Var = (a1) obj;
        return Intrinsics.b(this.f60106a, a1Var.f60106a) && this.f60107b == a1Var.f60107b && this.f60108c == a1Var.f60108c && Intrinsics.b(this.f60109d, a1Var.f60109d);
    }

    public final int hashCode() {
        return this.f60109d.hashCode() + c9.f(c9.f(this.f60106a.hashCode() * 31, 31, this.f60107b), 31, this.f60108c);
    }

    public final String toString() {
        return "ExpiryDateState(text=" + this.f60106a + ", enabled=" + this.f60107b + ", validating=" + this.f60108c + ", dateConfig=" + this.f60109d + ")";
    }
}
