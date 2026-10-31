package fe;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class a2 implements e {

    /* renamed from: a, reason: collision with root package name */
    public final int f54708a;

    /* renamed from: b, reason: collision with root package name */
    public final gf.x0 f54709b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f54710c;

    /* renamed from: d, reason: collision with root package name */
    public final int[] f54711d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean[] f54712e;

    public a2(gf.x0 x0Var, boolean z11, int[] iArr, boolean[] zArr) {
        int i5 = x0Var.f57655a;
        this.f54708a = i5;
        boolean z12 = false;
        wf.a.e(i5 == iArr.length && i5 == zArr.length);
        this.f54709b = x0Var;
        if (z11 && i5 > 1) {
            z12 = true;
        }
        this.f54710c = z12;
        this.f54711d = (int[]) iArr.clone();
        this.f54712e = (boolean[]) zArr.clone();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && a2.class == obj.getClass()) {
            a2 a2Var = (a2) obj;
            if (this.f54710c == a2Var.f54710c && this.f54709b.equals(a2Var.f54709b) && Arrays.equals(this.f54711d, a2Var.f54711d) && Arrays.equals(this.f54712e, a2Var.f54712e)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(this.f54712e) + ((Arrays.hashCode(this.f54711d) + (((this.f54709b.hashCode() * 31) + (this.f54710c ? 1 : 0)) * 31)) * 31);
    }
}
