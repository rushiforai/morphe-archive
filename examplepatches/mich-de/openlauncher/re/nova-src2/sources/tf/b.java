package tf;

import fe.k0;
import gf.x0;
import java.util.ArrayList;
import java.util.Arrays;
import xk.s0;

/* loaded from: classes3.dex */
public final class b implements q {

    /* renamed from: a, reason: collision with root package name */
    public final x0 f89058a;

    /* renamed from: b, reason: collision with root package name */
    public final int f89059b;

    /* renamed from: c, reason: collision with root package name */
    public final int[] f89060c;

    /* renamed from: d, reason: collision with root package name */
    public final k0[] f89061d;

    /* renamed from: e, reason: collision with root package name */
    public int f89062e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f89063f;

    public b(int i5, x0 x0Var, int[] iArr) {
        this.f89063f = i5;
        wf.a.i(iArr.length > 0);
        x0Var.getClass();
        k0[] k0VarArr = x0Var.f57658d;
        this.f89058a = x0Var;
        int length = iArr.length;
        this.f89059b = length;
        this.f89061d = new k0[length];
        for (int i11 = 0; i11 < iArr.length; i11++) {
            this.f89061d[i11] = k0VarArr[iArr[i11]];
        }
        Arrays.sort(this.f89061d, new com.google.firebase.crashlytics.internal.persistence.c(15));
        this.f89060c = new int[this.f89059b];
        int i12 = 0;
        while (true) {
            int i13 = this.f89059b;
            if (i12 >= i13) {
                long[] jArr = new long[i13];
                return;
            }
            int[] iArr2 = this.f89060c;
            k0 k0Var = this.f89061d[i12];
            int i14 = 0;
            while (true) {
                if (i14 >= k0VarArr.length) {
                    i14 = -1;
                    break;
                } else if (k0Var == k0VarArr[i14]) {
                    break;
                } else {
                    i14++;
                }
            }
            iArr2[i12] = i14;
            i12++;
        }
    }

    public static void k(ArrayList arrayList, long[] jArr) {
        long j11 = 0;
        for (long j12 : jArr) {
            j11 += j12;
        }
        for (int i5 = 0; i5 < arrayList.size(); i5++) {
            s0 s0Var = (s0) arrayList.get(i5);
            if (s0Var != null) {
                s0Var.a(new a(j11, jArr[i5]));
            }
        }
    }

    private final void l() {
    }

    private final void n() {
    }

    private final void p(float f11) {
    }

    @Override // tf.q
    public final int a(int i5) {
        return this.f89060c[i5];
    }

    @Override // tf.q
    public void b() {
        int i5 = this.f89063f;
    }

    @Override // tf.q
    public void c(float f11) {
        int i5 = this.f89063f;
    }

    @Override // tf.q
    public final int e(int i5) {
        for (int i11 = 0; i11 < this.f89059b; i11++) {
            if (this.f89060c[i11] == i5) {
                return i11;
            }
        }
        return -1;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && getClass() == obj.getClass()) {
            b bVar = (b) obj;
            if (this.f89058a == bVar.f89058a && Arrays.equals(this.f89060c, bVar.f89060c)) {
                return true;
            }
        }
        return false;
    }

    @Override // tf.q
    public final x0 f() {
        return this.f89058a;
    }

    @Override // tf.q
    public final k0 getFormat(int i5) {
        return this.f89061d[i5];
    }

    @Override // tf.q
    public void h() {
        int i5 = this.f89063f;
    }

    public final int hashCode() {
        if (this.f89062e == 0) {
            this.f89062e = Arrays.hashCode(this.f89060c) + (System.identityHashCode(this.f89058a) * 31);
        }
        return this.f89062e;
    }

    @Override // tf.q
    public final k0 i() {
        return this.f89061d[0];
    }

    @Override // tf.q
    public final int length() {
        return this.f89060c.length;
    }

    public final void m() {
    }

    public final void o() {
    }

    public final void q(float f11) {
    }
}
