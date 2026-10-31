package z;

import b.u4;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntRange;

/* loaded from: classes.dex */
public abstract class u0 {

    /* renamed from: a, reason: collision with root package name */
    public Object[] f97840a;

    /* renamed from: b, reason: collision with root package name */
    public int f97841b;

    public final Object a() {
        if (!d()) {
            return this.f97840a[0];
        }
        android.support.v4.media.session.b.n0("ObjectList is empty.");
        throw null;
    }

    public final Object b(int i5) {
        if (i5 >= 0 && i5 < this.f97841b) {
            return this.f97840a[i5];
        }
        f(i5);
        throw null;
    }

    public final int c(Object obj) {
        int i5 = 0;
        if (obj == null) {
            Object[] objArr = this.f97840a;
            int i11 = this.f97841b;
            while (i5 < i11) {
                if (objArr[i5] == null) {
                    return i5;
                }
                i5++;
            }
            return -1;
        }
        Object[] objArr2 = this.f97840a;
        int i12 = this.f97841b;
        while (i5 < i12) {
            if (obj.equals(objArr2[i5])) {
                return i5;
            }
            i5++;
        }
        return -1;
    }

    public final boolean d() {
        return this.f97841b == 0;
    }

    public final boolean e() {
        return this.f97841b != 0;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof u0) {
            u0 u0Var = (u0) obj;
            int i5 = u0Var.f97841b;
            int i11 = this.f97841b;
            if (i5 == i11) {
                Object[] objArr = this.f97840a;
                Object[] objArr2 = u0Var.f97840a;
                IntRange intRangeM0 = kotlin.ranges.a.m0(0, i11);
                int i12 = intRangeM0.f71906a;
                int i13 = intRangeM0.f71907b;
                if (i12 > i13) {
                    return true;
                }
                while (Intrinsics.b(objArr[i12], objArr2[i12])) {
                    if (i12 == i13) {
                        return true;
                    }
                    i12++;
                }
                return false;
            }
        }
        return false;
    }

    public final void f(int i5) {
        StringBuilder sbJ = u4.j(i5, "Index ", " must be in 0..");
        sbJ.append(this.f97841b - 1);
        android.support.v4.media.session.b.m0(sbJ.toString());
        throw null;
    }

    public final int hashCode() {
        Object[] objArr = this.f97840a;
        int i5 = this.f97841b;
        int iHashCode = 0;
        for (int i11 = 0; i11 < i5; i11++) {
            Object obj = objArr[i11];
            iHashCode += (obj != null ? obj.hashCode() : 0) * 31;
        }
        return iHashCode;
    }

    public final String toString() {
        v2.k0 k0Var = new v2.k0(this, 1);
        StringBuilder sb2 = new StringBuilder("[");
        Object[] objArr = this.f97840a;
        int i5 = this.f97841b;
        int i11 = 0;
        while (true) {
            if (i11 >= i5) {
                sb2.append((CharSequence) "]");
                break;
            }
            Object obj = objArr[i11];
            if (i11 == -1) {
                sb2.append((CharSequence) "...");
                break;
            }
            if (i11 != 0) {
                sb2.append((CharSequence) ", ");
            }
            sb2.append((CharSequence) k0Var.invoke(obj));
            i11++;
        }
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }
}
