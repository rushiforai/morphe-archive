package q1;

import p1.k2;

/* loaded from: classes.dex */
public final class m0 extends u90.b {

    /* renamed from: c, reason: collision with root package name */
    public int f83405c;

    /* renamed from: e, reason: collision with root package name */
    public int f83407e;

    /* renamed from: g, reason: collision with root package name */
    public int f83409g;

    /* renamed from: b, reason: collision with root package name */
    public j0[] f83404b = new j0[16];

    /* renamed from: d, reason: collision with root package name */
    public int[] f83406d = new int[16];

    /* renamed from: f, reason: collision with root package name */
    public Object[] f83408f = new Object[16];

    public final void m0() {
        this.f83405c = 0;
        this.f83407e = 0;
        u90.b.B(0, this.f83409g, null, this.f83408f);
        this.f83409g = 0;
    }

    public final void n0(p1.c cVar, k2 k2Var, x1.l lVar, k0 k0Var) {
        if (p0()) {
            l0 l0Var = new l0(this);
            m0 m0Var = (m0) l0Var.f83402d;
            while (true) {
                j0 j0Var = m0Var.f83404b[l0Var.f83399a];
                p1.a aVarB = j0Var.b(l0Var);
                p1.c cVar2 = cVar;
                k2 k2Var2 = k2Var;
                x1.l lVar2 = lVar;
                k0 k0Var2 = k0Var;
                try {
                    j0Var.a(l0Var, cVar2, k2Var2, lVar2, k0Var2);
                    int i5 = l0Var.f83399a;
                    int i11 = m0Var.f83405c;
                    if (i5 < i11) {
                        j0 j0Var2 = m0Var.f83404b[i5];
                        l0Var.f83400b += j0Var2.f83395a;
                        l0Var.f83401c += j0Var2.f83396b;
                        int i12 = i5 + 1;
                        l0Var.f83399a = i12;
                        if (i12 >= i11) {
                            break;
                        }
                        cVar = cVar2;
                        k2Var = k2Var2;
                        lVar = lVar2;
                        k0Var = k0Var2;
                    } else {
                        break;
                    }
                } catch (Throwable th2) {
                    p6.u.e(th2, k0Var2, k2Var2, aVarB);
                    throw th2;
                }
            }
        }
        m0();
    }

    public final boolean o0() {
        return this.f83405c == 0;
    }

    public final boolean p0() {
        return this.f83405c != 0;
    }

    public final void q0(j0 j0Var) {
        int i5 = this.f83405c;
        j0[] j0VarArr = this.f83404b;
        if (i5 == j0VarArr.length) {
            j0[] j0VarArr2 = new j0[(i5 > 1024 ? 1024 : i5) + i5];
            System.arraycopy(j0VarArr, 0, j0VarArr2, 0, i5);
            this.f83404b = j0VarArr2;
        }
        int i11 = this.f83407e;
        int i12 = j0Var.f83395a;
        int i13 = j0Var.f83396b;
        int i14 = i11 + i12;
        int[] iArr = this.f83406d;
        int length = iArr.length;
        if (i14 > length) {
            int i15 = (length > 1024 ? 1024 : length) + length;
            if (i15 >= i14) {
                i14 = i15;
            }
            int[] iArr2 = new int[i14];
            u90.b.p(0, 0, iArr, iArr2, length);
            this.f83406d = iArr2;
        }
        int i16 = this.f83409g + i13;
        Object[] objArr = this.f83408f;
        int length2 = objArr.length;
        if (i16 > length2) {
            int i17 = (length2 <= 1024 ? length2 : 1024) + length2;
            if (i17 >= i16) {
                i16 = i17;
            }
            Object[] objArr2 = new Object[i16];
            System.arraycopy(objArr, 0, objArr2, 0, length2);
            this.f83408f = objArr2;
        }
        j0[] j0VarArr3 = this.f83404b;
        int i18 = this.f83405c;
        this.f83405c = i18 + 1;
        j0VarArr3[i18] = j0Var;
        this.f83407e += j0Var.f83395a;
        this.f83409g += i13;
    }
}
