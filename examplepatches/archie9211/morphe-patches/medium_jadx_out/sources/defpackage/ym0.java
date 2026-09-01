package defpackage;

import androidx.recyclerview.widget.RecyclerView;
import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import com.google.android.gms.internal.p000firebaseauthapi.zzalh;
import com.google.android.recaptcha.internal.zzaej;
import com.google.android.recaptcha.internal.zzaek;
import java.lang.reflect.Array;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ym0 {
    public final /* synthetic */ int a;
    public int b;
    public int c;
    public int d;
    public Object e;

    public ym0(int i, int i2) {
        this.a = 0;
        this.e = new zm0[i];
        for (int i3 = 0; i3 < i; i3++) {
            ((zm0[]) this.e)[i3] = new zm0(((i2 + 4) * 17) + 1);
        }
        this.d = i2 * 17;
        this.c = i;
        this.b = -1;
    }

    public static final void D(int i) throws zzaek {
        if ((i & 3) == 0) {
            return;
        }
        ygf.j("Failed to parse the message.");
    }

    public static final void E(int i) throws zzaek {
        if ((i & 7) == 0) {
            return;
        }
        ygf.j("Failed to parse the message.");
    }

    public void A(Object obj, vof vofVar, anf anfVar) throws zzaek {
        up1 up1Var = (up1) this.e;
        int iQ0 = up1Var.q0();
        if (up1Var.b >= 100) {
            ygf.j("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
            return;
        }
        int iD = up1Var.D(iQ0);
        up1Var.b++;
        vofVar.g(obj, this, anfVar);
        up1Var.T();
        up1Var.b--;
        up1Var.E(iD);
    }

    public void B(Object obj, vof vofVar, anf anfVar) {
        int i = this.c;
        this.c = ((this.b >>> 3) << 3) | 4;
        try {
            vofVar.g(obj, this, anfVar);
            if (this.b == this.c) {
            } else {
                throw new zzaek("Failed to parse the message.");
            }
        } finally {
            this.c = i;
        }
    }

    public void C(int i) throws zzaek {
        if (((up1) this.e).G() == i) {
            return;
        }
        ygf.j("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
    }

    public void F(int i) throws zzale {
        if (((up1) this.e).V() != i) {
            throw zzale.g();
        }
    }

    public void G(duf dufVar) throws zzale {
        int iI0;
        up1 up1Var = (up1) this.e;
        int i = this.b & 7;
        if (i == 0) {
            do {
                ((puf) dufVar).add(Boolean.valueOf(up1Var.D0()));
                if (up1Var.C0()) {
                    return;
                } else {
                    iI0 = up1Var.i0();
                }
            } while (iI0 == this.b);
            this.d = iI0;
            return;
        }
        if (i != 2) {
            throw zzale.a();
        }
        int iV = up1Var.V() + up1Var.j0();
        do {
            ((puf) dufVar).add(Boolean.valueOf(up1Var.D0()));
        } while (up1Var.V() < iV);
        F(iV);
    }

    public void H(duf dufVar, suf sufVar, ptf ptfVar) throws zzalh {
        int iI0;
        up1 up1Var = (up1) this.e;
        int i = this.b;
        if ((i & 7) != 3) {
            throw zzale.a();
        }
        do {
            ytf ytfVarZza = sufVar.zza();
            O(ytfVarZza, sufVar, ptfVar);
            sufVar.d(ytfVarZza);
            ((puf) dufVar).add(ytfVarZza);
            if (up1Var.C0() || this.d != 0) {
                return;
            } else {
                iI0 = up1Var.i0();
            }
        } while (iI0 == i);
        this.d = iI0;
    }

    public void I(duf dufVar, boolean z) throws zzalh {
        String strZ0;
        int iI0;
        up1 up1Var = (up1) this.e;
        if ((this.b & 7) != 2) {
            throw zzale.a();
        }
        do {
            if (z) {
                K(2);
                strZ0 = up1Var.B0();
            } else {
                K(2);
                strZ0 = up1Var.z0();
            }
            ((puf) dufVar).add(strZ0);
            if (up1Var.C0()) {
                return;
            } else {
                iI0 = up1Var.i0();
            }
        } while (iI0 == this.b);
        this.d = iI0;
    }

    public int J() {
        int iL = this.d;
        if (iL != 0) {
            this.b = iL;
            this.d = 0;
        } else {
            iL = ((up1) this.e).L();
            this.b = iL;
        }
        if (iL == 0 || iL == this.c) {
            return Integer.MAX_VALUE;
        }
        return iL >>> 3;
    }

    public void K(int i) throws zzalh {
        if ((this.b & 7) != i) {
            throw zzale.a();
        }
    }

    public void L(duf dufVar) throws zzalh {
        int iI0;
        up1 up1Var = (up1) this.e;
        if ((this.b & 7) != 2) {
            throw zzale.a();
        }
        do {
            ((puf) dufVar).add(d0());
            if (up1Var.C0()) {
                return;
            } else {
                iI0 = up1Var.i0();
            }
        } while (iI0 == this.b);
        this.d = iI0;
    }

    public void M(duf dufVar, suf sufVar, ptf ptfVar) throws zzale {
        int iI0;
        up1 up1Var = (up1) this.e;
        int i = this.b;
        if ((i & 7) != 2) {
            throw zzale.a();
        }
        do {
            ytf ytfVarZza = sufVar.zza();
            Q(ytfVarZza, sufVar, ptfVar);
            sufVar.d(ytfVarZza);
            ((puf) dufVar).add(ytfVarZza);
            if (up1Var.C0() || this.d != 0) {
                return;
            } else {
                iI0 = up1Var.i0();
            }
        } while (iI0 == i);
        this.d = iI0;
    }

    public int N() {
        int iI0 = this.d;
        if (iI0 != 0) {
            this.b = iI0;
            this.d = 0;
        } else {
            iI0 = ((up1) this.e).i0();
            this.b = iI0;
        }
        if (iI0 == 0 || iI0 == this.c) {
            return Integer.MAX_VALUE;
        }
        return iI0 >>> 3;
    }

    public void O(Object obj, suf sufVar, ptf ptfVar) {
        int i = this.c;
        this.c = ((this.b >>> 3) << 3) | 4;
        try {
            sufVar.h(obj, this, ptfVar);
            if (this.b == this.c) {
            } else {
                throw zzale.f();
            }
        } finally {
            this.c = i;
        }
    }

    public void P(duf dufVar) throws zzale {
        int iI0;
        up1 up1Var = (up1) this.e;
        int i = this.b & 7;
        if (i == 1) {
            do {
                ((puf) dufVar).add(Double.valueOf(up1Var.K()));
                if (up1Var.C0()) {
                    return;
                } else {
                    iI0 = up1Var.i0();
                }
            } while (iI0 == this.b);
            this.d = iI0;
            return;
        }
        if (i != 2) {
            throw zzale.a();
        }
        int iJ0 = up1Var.j0();
        if ((iJ0 & 7) != 0) {
            throw zzale.f();
        }
        int iV = up1Var.V() + iJ0;
        do {
            ((puf) dufVar).add(Double.valueOf(up1Var.K()));
        } while (up1Var.V() < iV);
    }

    public void Q(Object obj, suf sufVar, ptf ptfVar) throws zzale {
        up1 up1Var = (up1) this.e;
        int iJ0 = up1Var.j0();
        if (up1Var.b + 0 >= 100) {
            throw new zzale("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
        int iS = up1Var.S(iJ0);
        up1Var.b++;
        sufVar.h(obj, this, ptfVar);
        up1Var.X(0);
        up1Var.b--;
        up1Var.a0(iS);
    }

    public void R(duf dufVar) throws zzale {
        int iI0;
        up1 up1Var = (up1) this.e;
        int i = this.b & 7;
        if (i == 0) {
            do {
                ((puf) dufVar).add(Integer.valueOf(up1Var.Z()));
                if (up1Var.C0()) {
                    return;
                } else {
                    iI0 = up1Var.i0();
                }
            } while (iI0 == this.b);
            this.d = iI0;
            return;
        }
        if (i != 2) {
            throw zzale.a();
        }
        int iV = up1Var.V() + up1Var.j0();
        do {
            ((puf) dufVar).add(Integer.valueOf(up1Var.Z()));
        } while (up1Var.V() < iV);
        F(iV);
    }

    public void S(duf dufVar) throws zzale {
        int iI0;
        up1 up1Var = (up1) this.e;
        int i = this.b & 7;
        if (i == 2) {
            int iJ0 = up1Var.j0();
            if ((iJ0 & 3) != 0) {
                throw zzale.f();
            }
            int iV = up1Var.V() + iJ0;
            do {
                ((puf) dufVar).add(Integer.valueOf(up1Var.b0()));
            } while (up1Var.V() < iV);
            return;
        }
        if (i != 5) {
            throw zzale.a();
        }
        do {
            ((puf) dufVar).add(Integer.valueOf(up1Var.b0()));
            if (up1Var.C0()) {
                return;
            } else {
                iI0 = up1Var.i0();
            }
        } while (iI0 == this.b);
        this.d = iI0;
    }

    public void T(duf dufVar) throws zzale {
        int iI0;
        up1 up1Var = (up1) this.e;
        int i = this.b & 7;
        if (i == 1) {
            do {
                ((puf) dufVar).add(Long.valueOf(up1Var.l0()));
                if (up1Var.C0()) {
                    return;
                } else {
                    iI0 = up1Var.i0();
                }
            } while (iI0 == this.b);
            this.d = iI0;
            return;
        }
        if (i != 2) {
            throw zzale.a();
        }
        int iJ0 = up1Var.j0();
        if ((iJ0 & 7) != 0) {
            throw zzale.f();
        }
        int iV = up1Var.V() + iJ0;
        do {
            ((puf) dufVar).add(Long.valueOf(up1Var.l0()));
        } while (up1Var.V() < iV);
    }

    public void U(duf dufVar) throws zzale {
        int iI0;
        up1 up1Var = (up1) this.e;
        int i = this.b & 7;
        if (i == 2) {
            int iJ0 = up1Var.j0();
            if ((iJ0 & 3) != 0) {
                throw zzale.f();
            }
            int iV = up1Var.V() + iJ0;
            do {
                ((puf) dufVar).add(Float.valueOf(up1Var.R()));
            } while (up1Var.V() < iV);
            return;
        }
        if (i != 5) {
            throw zzale.a();
        }
        do {
            ((puf) dufVar).add(Float.valueOf(up1Var.R()));
            if (up1Var.C0()) {
                return;
            } else {
                iI0 = up1Var.i0();
            }
        } while (iI0 == this.b);
        this.d = iI0;
    }

    public void V(duf dufVar) throws zzale {
        int iI0;
        up1 up1Var = (up1) this.e;
        int i = this.b & 7;
        if (i == 0) {
            do {
                ((puf) dufVar).add(Integer.valueOf(up1Var.d0()));
                if (up1Var.C0()) {
                    return;
                } else {
                    iI0 = up1Var.i0();
                }
            } while (iI0 == this.b);
            this.d = iI0;
            return;
        }
        if (i != 2) {
            throw zzale.a();
        }
        int iV = up1Var.V() + up1Var.j0();
        do {
            ((puf) dufVar).add(Integer.valueOf(up1Var.d0()));
        } while (up1Var.V() < iV);
        F(iV);
    }

    public void W(duf dufVar) throws zzale {
        int iI0;
        up1 up1Var = (up1) this.e;
        int i = this.b & 7;
        if (i == 0) {
            do {
                ((puf) dufVar).add(Long.valueOf(up1Var.n0()));
                if (up1Var.C0()) {
                    return;
                } else {
                    iI0 = up1Var.i0();
                }
            } while (iI0 == this.b);
            this.d = iI0;
            return;
        }
        if (i != 2) {
            throw zzale.a();
        }
        int iV = up1Var.V() + up1Var.j0();
        do {
            ((puf) dufVar).add(Long.valueOf(up1Var.n0()));
        } while (up1Var.V() < iV);
        F(iV);
    }

    public void X(duf dufVar) throws zzale {
        int iI0;
        up1 up1Var = (up1) this.e;
        int i = this.b & 7;
        if (i == 2) {
            int iJ0 = up1Var.j0();
            if ((iJ0 & 3) != 0) {
                throw zzale.f();
            }
            int iV = up1Var.V() + iJ0;
            do {
                ((puf) dufVar).add(Integer.valueOf(up1Var.f0()));
            } while (up1Var.V() < iV);
            return;
        }
        if (i != 5) {
            throw zzale.a();
        }
        do {
            ((puf) dufVar).add(Integer.valueOf(up1Var.f0()));
            if (up1Var.C0()) {
                return;
            } else {
                iI0 = up1Var.i0();
            }
        } while (iI0 == this.b);
        this.d = iI0;
    }

    public void Y(duf dufVar) throws zzale {
        int iI0;
        up1 up1Var = (up1) this.e;
        int i = this.b & 7;
        if (i == 1) {
            do {
                ((puf) dufVar).add(Long.valueOf(up1Var.r0()));
                if (up1Var.C0()) {
                    return;
                } else {
                    iI0 = up1Var.i0();
                }
            } while (iI0 == this.b);
            this.d = iI0;
            return;
        }
        if (i != 2) {
            throw zzale.a();
        }
        int iJ0 = up1Var.j0();
        if ((iJ0 & 7) != 0) {
            throw zzale.f();
        }
        int iV = up1Var.V() + iJ0;
        do {
            ((puf) dufVar).add(Long.valueOf(up1Var.r0()));
        } while (up1Var.V() < iV);
    }

    public void Z(duf dufVar) throws zzale {
        int iI0;
        up1 up1Var = (up1) this.e;
        int i = this.b & 7;
        if (i == 0) {
            do {
                ((puf) dufVar).add(Integer.valueOf(up1Var.g0()));
                if (up1Var.C0()) {
                    return;
                } else {
                    iI0 = up1Var.i0();
                }
            } while (iI0 == this.b);
            this.d = iI0;
            return;
        }
        if (i != 2) {
            throw zzale.a();
        }
        int iV = up1Var.V() + up1Var.j0();
        do {
            ((puf) dufVar).add(Integer.valueOf(up1Var.g0()));
        } while (up1Var.V() < iV);
        F(iV);
    }

    public void a(v07 v07Var) {
        v07Var.c = null;
        v07Var.a = null;
        v07Var.b = null;
        v07Var.i = 1;
        int i = this.b;
        if (i > 0) {
            int i2 = this.d;
            if ((i2 & 1) == 0) {
                this.d = i2 + 1;
                i--;
                this.b = i;
                this.c++;
            }
        }
        v07Var.a = (v07) this.e;
        this.e = v07Var;
        int i3 = this.d;
        int i4 = i3 + 1;
        this.d = i4;
        if (i > 0 && (i4 & 1) == 0) {
            this.d = i3 + 2;
            this.b = i - 1;
            this.c++;
        }
        int i5 = 4;
        while (true) {
            int i6 = i5 - 1;
            if ((this.d & i6) != i6) {
                return;
            }
            int i7 = this.c;
            if (i7 == 0) {
                v07 v07Var2 = (v07) this.e;
                v07 v07Var3 = v07Var2.a;
                v07 v07Var4 = v07Var3.a;
                v07Var3.a = v07Var4.a;
                this.e = v07Var3;
                v07Var3.b = v07Var4;
                v07Var3.c = v07Var2;
                v07Var3.i = v07Var2.i + 1;
                v07Var4.a = v07Var3;
                v07Var2.a = v07Var3;
            } else if (i7 == 1) {
                v07 v07Var5 = (v07) this.e;
                v07 v07Var6 = v07Var5.a;
                this.e = v07Var6;
                v07Var6.c = v07Var5;
                v07Var6.i = v07Var5.i + 1;
                v07Var5.a = v07Var6;
                this.c = 0;
            } else if (i7 == 2) {
                this.c = 0;
            }
            i5 *= 2;
        }
    }

    public void a0(duf dufVar) throws zzale {
        int iI0;
        up1 up1Var = (up1) this.e;
        int i = this.b & 7;
        if (i == 0) {
            do {
                ((puf) dufVar).add(Long.valueOf(up1Var.t0()));
                if (up1Var.C0()) {
                    return;
                } else {
                    iI0 = up1Var.i0();
                }
            } while (iI0 == this.b);
            this.d = iI0;
            return;
        }
        if (i != 2) {
            throw zzale.a();
        }
        int iV = up1Var.V() + up1Var.j0();
        do {
            ((puf) dufVar).add(Long.valueOf(up1Var.t0()));
        } while (up1Var.V() < iV);
        F(iV);
    }

    public void b(Object obj) {
        Object obj2;
        Object obj3;
        Object[] objArr = (Object[]) this.e;
        int i = this.b;
        int iHashCode = obj.hashCode() * (-1640531527);
        int i2 = (iHashCode ^ (iHashCode >>> 16)) & i;
        Object obj4 = objArr[i2];
        if (obj4 != null) {
            if (obj4.equals(obj)) {
                return;
            }
            do {
                i2 = (i2 + 1) & i;
                obj3 = objArr[i2];
                if (obj3 == null) {
                }
            } while (!obj3.equals(obj));
            return;
        }
        objArr[i2] = obj;
        int i3 = this.c + 1;
        this.c = i3;
        if (i3 < this.d) {
            return;
        }
        Object[] objArr2 = (Object[]) this.e;
        int length = objArr2.length;
        int i4 = length << 1;
        int i5 = i4 - 1;
        Object[] objArr3 = new Object[i4];
        while (true) {
            int i6 = i3 - 1;
            if (i3 == 0) {
                this.b = i5;
                this.d = (int) (i4 * 0.75f);
                this.e = objArr3;
                return;
            }
            do {
                length--;
                obj2 = objArr2[length];
            } while (obj2 == null);
            int iHashCode2 = obj2.hashCode() * (-1640531527);
            int i7 = (iHashCode2 ^ (iHashCode2 >>> 16)) & i5;
            if (objArr3[i7] != null) {
                do {
                    i7 = (i7 + 1) & i5;
                } while (objArr3[i7] != null);
            }
            objArr3[i7] = objArr2[length];
            i3 = i6;
        }
    }

    public void b0(duf dufVar) throws zzalh {
        I(dufVar, false);
    }

    public void c(int i, int i2) {
        if (i < 0) {
            ay0.e("Layout positions must be non-negative");
            return;
        }
        if (i2 < 0) {
            ay0.e("Pixel distance must be non-negative");
            return;
        }
        int i3 = this.d;
        int i4 = i3 * 2;
        int[] iArr = (int[]) this.e;
        if (iArr == null) {
            int[] iArr2 = new int[4];
            this.e = iArr2;
            Arrays.fill(iArr2, -1);
        } else if (i4 >= iArr.length) {
            int[] iArr3 = new int[i3 * 4];
            this.e = iArr3;
            System.arraycopy(iArr, 0, iArr3, 0, iArr.length);
        }
        int[] iArr4 = (int[]) this.e;
        iArr4[i4] = i;
        iArr4[i4 + 1] = i2;
        this.d++;
    }

    public void c0(duf dufVar) throws zzalh {
        I(dufVar, true);
    }

    public wwb d(int i) {
        return new wwb(lk7.v((qjd) this.e, i), i, 1L);
    }

    public hsf d0() throws zzalh {
        K(2);
        return ((up1) this.e).x0();
    }

    public void e(RecyclerView recyclerView, boolean z) {
        this.d = 0;
        int[] iArr = (int[]) this.e;
        if (iArr != null) {
            Arrays.fill(iArr, -1);
        }
        sxa sxaVar = recyclerView.n;
        if (recyclerView.m == null || sxaVar == null || !sxaVar.i) {
            return;
        }
        if (z) {
            if (!recyclerView.e.j()) {
                sxaVar.i(op8.Y(((gy6) recyclerView.m).c), this);
            }
        } else if (!recyclerView.M()) {
            sxaVar.h(this.b, this.c, recyclerView.u0, this);
        }
        int i = this.d;
        if (i > sxaVar.j) {
            sxaVar.j = i;
            sxaVar.k = z;
            recyclerView.c.n();
        }
    }

    public void e0(duf dufVar) throws zzale {
        int iI0;
        up1 up1Var = (up1) this.e;
        int i = this.b & 7;
        if (i == 0) {
            do {
                ((puf) dufVar).add(Integer.valueOf(up1Var.j0()));
                if (up1Var.C0()) {
                    return;
                } else {
                    iI0 = up1Var.i0();
                }
            } while (iI0 == this.b);
            this.d = iI0;
            return;
        }
        if (i != 2) {
            throw zzale.a();
        }
        int iV = up1Var.V() + up1Var.j0();
        do {
            ((puf) dufVar).add(Integer.valueOf(up1Var.j0()));
        } while (up1Var.V() < iV);
        F(iV);
    }

    public int f() {
        return this.d - this.c;
    }

    public void f0(duf dufVar) throws zzale {
        int iI0;
        up1 up1Var = (up1) this.e;
        int i = this.b & 7;
        if (i == 0) {
            do {
                ((puf) dufVar).add(Long.valueOf(up1Var.v0()));
                if (up1Var.C0()) {
                    return;
                } else {
                    iI0 = up1Var.i0();
                }
            } while (iI0 == this.b);
            this.d = iI0;
            return;
        }
        if (i != 2) {
            throw zzale.a();
        }
        int iV = up1Var.V() + up1Var.j0();
        do {
            ((puf) dufVar).add(Long.valueOf(up1Var.v0()));
        } while (up1Var.V() < iV);
        F(iV);
    }

    public zm0 g() {
        return ((zm0[]) this.e)[this.b];
    }

    public void g0(snf snfVar) throws zzaek {
        int iL;
        up1 up1Var = (up1) this.e;
        int i = this.b & 7;
        if (i == 1) {
            do {
                snfVar.add(Double.valueOf(up1Var.U()));
                if (up1Var.F()) {
                    return;
                } else {
                    iL = up1Var.L();
                }
            } while (iL == this.b);
            this.d = iL;
            return;
        }
        if (i != 2) {
            ygf.g();
            return;
        }
        int iQ0 = up1Var.q0();
        E(iQ0);
        int iG = up1Var.G() + iQ0;
        do {
            snfVar.add(Double.valueOf(up1Var.U()));
        } while (up1Var.G() < iG);
    }

    public int h(int i) {
        return ((qv8) this.e).f[this.c + i];
    }

    public void h0(snf snfVar) throws zzaek {
        int iL;
        up1 up1Var = (up1) this.e;
        int i = this.b & 7;
        if (i == 2) {
            int iQ0 = up1Var.q0();
            D(iQ0);
            int iG = up1Var.G() + iQ0;
            do {
                snfVar.add(Float.valueOf(up1Var.Y()));
            } while (up1Var.G() < iG);
            return;
        }
        if (i != 5) {
            ygf.g();
            return;
        }
        do {
            snfVar.add(Float.valueOf(up1Var.Y()));
            if (up1Var.F()) {
                return;
            } else {
                iL = up1Var.L();
            }
        } while (iL == this.b);
        this.d = iL;
    }

    public Object i(int i) {
        return ((qv8) this.e).h[this.d + i];
    }

    public void i0(snf snfVar) throws zzaek {
        int iL;
        int iL2;
        up1 up1Var = (up1) this.e;
        boolean z = snfVar instanceof aof;
        int i = this.b;
        if (z) {
            aof aofVar = (aof) snfVar;
            int i2 = i & 7;
            if (i2 != 0) {
                if (i2 != 2) {
                    ygf.g();
                    return;
                }
                int iG = up1Var.G() + up1Var.q0();
                do {
                    aofVar.f(up1Var.c0());
                } while (up1Var.G() < iG);
                C(iG);
                return;
            }
            do {
                aofVar.f(up1Var.c0());
                if (up1Var.F()) {
                    return;
                } else {
                    iL2 = up1Var.L();
                }
            } while (iL2 == this.b);
        } else {
            int i3 = i & 7;
            if (i3 != 0) {
                if (i3 != 2) {
                    ygf.g();
                    return;
                }
                int iG2 = up1Var.G() + up1Var.q0();
                do {
                    snfVar.add(Long.valueOf(up1Var.c0()));
                } while (up1Var.G() < iG2);
                C(iG2);
                return;
            }
            do {
                snfVar.add(Long.valueOf(up1Var.c0()));
                if (up1Var.F()) {
                    return;
                } else {
                    iL = up1Var.L();
                }
            } while (iL == this.b);
            iL2 = iL;
        }
        this.d = iL2;
    }

    public byte[][] j(int i, int i2) {
        int i3 = this.c * i2;
        byte[][] bArr = (byte[][]) Array.newInstance((Class<?>) Byte.TYPE, i3, this.d * i);
        for (int i4 = 0; i4 < i3; i4++) {
            int i5 = (i3 - i4) - 1;
            byte[] bArr2 = ((zm0[]) this.e)[i4 / i2].a;
            int length = bArr2.length * i;
            byte[] bArr3 = new byte[length];
            for (int i6 = 0; i6 < length; i6++) {
                bArr3[i6] = bArr2[i6 / i];
            }
            bArr[i5] = bArr3;
        }
        return bArr;
    }

    public void j0(snf snfVar) throws zzaek {
        int iL;
        int iL2;
        up1 up1Var = (up1) this.e;
        boolean z = snfVar instanceof aof;
        int i = this.b;
        if (z) {
            aof aofVar = (aof) snfVar;
            int i2 = i & 7;
            if (i2 != 0) {
                if (i2 != 2) {
                    ygf.g();
                    return;
                }
                int iG = up1Var.G() + up1Var.q0();
                do {
                    aofVar.f(up1Var.e0());
                } while (up1Var.G() < iG);
                C(iG);
                return;
            }
            do {
                aofVar.f(up1Var.e0());
                if (up1Var.F()) {
                    return;
                } else {
                    iL2 = up1Var.L();
                }
            } while (iL2 == this.b);
        } else {
            int i3 = i & 7;
            if (i3 != 0) {
                if (i3 != 2) {
                    ygf.g();
                    return;
                }
                int iG2 = up1Var.G() + up1Var.q0();
                do {
                    snfVar.add(Long.valueOf(up1Var.e0()));
                } while (up1Var.G() < iG2);
                C(iG2);
                return;
            }
            do {
                snfVar.add(Long.valueOf(up1Var.e0()));
                if (up1Var.F()) {
                    return;
                } else {
                    iL = up1Var.L();
                }
            } while (iL == this.b);
            iL2 = iL;
        }
        this.d = iL2;
    }

    public void k(int i, int i2, Object[] objArr) {
        int i3;
        Object obj;
        this.c--;
        while (true) {
            int i4 = i + 1;
            while (true) {
                i3 = i4 & i2;
                obj = objArr[i3];
                if (obj == null) {
                    objArr[i] = null;
                    return;
                }
                int iHashCode = obj.hashCode() * (-1640531527);
                int i5 = (iHashCode ^ (iHashCode >>> 16)) & i2;
                if (i <= i3) {
                    if (i >= i5 || i5 > i3) {
                        break;
                    } else {
                        i4 = i3 + 1;
                    }
                } else if (i < i5 || i5 <= i3) {
                    i4 = i3 + 1;
                }
            }
            objArr[i] = obj;
            i = i3;
        }
    }

    public void l(snf snfVar) throws zzaek {
        int iL;
        int iL2;
        up1 up1Var = (up1) this.e;
        boolean z = snfVar instanceof gnf;
        int i = this.b;
        if (z) {
            gnf gnfVar = (gnf) snfVar;
            int i2 = i & 7;
            if (i2 != 0) {
                if (i2 != 2) {
                    ygf.g();
                    return;
                }
                int iG = up1Var.G() + up1Var.q0();
                do {
                    gnfVar.m(up1Var.f0());
                } while (up1Var.G() < iG);
                C(iG);
                return;
            }
            do {
                gnfVar.m(up1Var.f0());
                if (up1Var.F()) {
                    return;
                } else {
                    iL2 = up1Var.L();
                }
            } while (iL2 == this.b);
        } else {
            int i3 = i & 7;
            if (i3 != 0) {
                if (i3 != 2) {
                    ygf.g();
                    return;
                }
                int iG2 = up1Var.G() + up1Var.q0();
                do {
                    snfVar.add(Integer.valueOf(up1Var.f0()));
                } while (up1Var.G() < iG2);
                C(iG2);
                return;
            }
            do {
                snfVar.add(Integer.valueOf(up1Var.f0()));
                if (up1Var.F()) {
                    return;
                } else {
                    iL = up1Var.L();
                }
            } while (iL == this.b);
            iL2 = iL;
        }
        this.d = iL2;
    }

    public void m(snf snfVar) throws zzaek {
        int iL;
        int iL2;
        up1 up1Var = (up1) this.e;
        boolean z = snfVar instanceof aof;
        int i = this.b;
        if (z) {
            aof aofVar = (aof) snfVar;
            int i2 = i & 7;
            if (i2 != 1) {
                if (i2 != 2) {
                    ygf.g();
                    return;
                }
                int iQ0 = up1Var.q0();
                E(iQ0);
                int iG = up1Var.G() + iQ0;
                do {
                    aofVar.f(up1Var.h0());
                } while (up1Var.G() < iG);
                return;
            }
            do {
                aofVar.f(up1Var.h0());
                if (up1Var.F()) {
                    return;
                } else {
                    iL2 = up1Var.L();
                }
            } while (iL2 == this.b);
        } else {
            int i3 = i & 7;
            if (i3 != 1) {
                if (i3 != 2) {
                    ygf.g();
                    return;
                }
                int iQ02 = up1Var.q0();
                E(iQ02);
                int iG2 = up1Var.G() + iQ02;
                do {
                    snfVar.add(Long.valueOf(up1Var.h0()));
                } while (up1Var.G() < iG2);
                return;
            }
            do {
                snfVar.add(Long.valueOf(up1Var.h0()));
                if (up1Var.F()) {
                    return;
                } else {
                    iL = up1Var.L();
                }
            } while (iL == this.b);
            iL2 = iL;
        }
        this.d = iL2;
    }

    public void n(snf snfVar) throws zzaek {
        int iL;
        int iL2;
        up1 up1Var = (up1) this.e;
        boolean z = snfVar instanceof gnf;
        int i = this.b;
        if (z) {
            gnf gnfVar = (gnf) snfVar;
            int i2 = i & 7;
            if (i2 == 2) {
                int iQ0 = up1Var.q0();
                D(iQ0);
                int iG = up1Var.G() + iQ0;
                do {
                    gnfVar.m(up1Var.i0());
                } while (up1Var.G() < iG);
                return;
            }
            if (i2 != 5) {
                ygf.g();
                return;
            }
            do {
                gnfVar.m(up1Var.i0());
                if (up1Var.F()) {
                    return;
                } else {
                    iL2 = up1Var.L();
                }
            } while (iL2 == this.b);
        } else {
            int i3 = i & 7;
            if (i3 == 2) {
                int iQ02 = up1Var.q0();
                D(iQ02);
                int iG2 = up1Var.G() + iQ02;
                do {
                    snfVar.add(Integer.valueOf(up1Var.i0()));
                } while (up1Var.G() < iG2);
                return;
            }
            if (i3 != 5) {
                ygf.g();
                return;
            }
            do {
                snfVar.add(Integer.valueOf(up1Var.i0()));
                if (up1Var.F()) {
                    return;
                } else {
                    iL = up1Var.L();
                }
            } while (iL == this.b);
            iL2 = iL;
        }
        this.d = iL2;
    }

    public void o(snf snfVar) throws zzaek {
        int iL;
        up1 up1Var = (up1) this.e;
        int i = this.b & 7;
        if (i == 0) {
            do {
                snfVar.add(Boolean.valueOf(up1Var.k0()));
                if (up1Var.F()) {
                    return;
                } else {
                    iL = up1Var.L();
                }
            } while (iL == this.b);
            this.d = iL;
            return;
        }
        if (i != 2) {
            ygf.g();
            return;
        }
        int iG = up1Var.G() + up1Var.q0();
        do {
            snfVar.add(Boolean.valueOf(up1Var.k0()));
        } while (up1Var.G() < iG);
        C(iG);
    }

    public void p(snf snfVar, boolean z) throws zzaej {
        String strM0;
        int iL;
        up1 up1Var = (up1) this.e;
        if ((this.b & 7) != 2) {
            ygf.g();
            return;
        }
        do {
            if (z) {
                z(2);
                strM0 = up1Var.o0();
            } else {
                z(2);
                strM0 = up1Var.m0();
            }
            snfVar.add(strM0);
            if (up1Var.F()) {
                return;
            } else {
                iL = up1Var.L();
            }
        } while (iL == this.b);
        this.d = iL;
    }

    public void q(snf snfVar, vof vofVar, anf anfVar) throws zzaek {
        int iL;
        int i = this.b;
        if ((i & 7) != 2) {
            ygf.g();
            return;
        }
        do {
            fnf fnfVarZza = vofVar.zza();
            A(fnfVarZza, vofVar, anfVar);
            vofVar.a(fnfVarZza);
            snfVar.add(fnfVarZza);
            up1 up1Var = (up1) this.e;
            if (up1Var.F() || this.d != 0) {
                return;
            } else {
                iL = up1Var.L();
            }
        } while (iL == i);
        this.d = iL;
    }

    public void r(snf snfVar, vof vofVar, anf anfVar) throws zzaej {
        int iL;
        int i = this.b;
        if ((i & 7) != 3) {
            ygf.g();
            return;
        }
        do {
            fnf fnfVarZza = vofVar.zza();
            B(fnfVarZza, vofVar, anfVar);
            vofVar.a(fnfVarZza);
            snfVar.add(fnfVarZza);
            up1 up1Var = (up1) this.e;
            if (up1Var.F() || this.d != 0) {
                return;
            } else {
                iL = up1Var.L();
            }
        } while (iL == i);
        this.d = iL;
    }

    public void s(snf snfVar) throws zzaej {
        int iL;
        up1 up1Var = (up1) this.e;
        if ((this.b & 7) != 2) {
            ygf.g();
            return;
        }
        do {
            z(2);
            snfVar.add(up1Var.p0());
            if (up1Var.F()) {
                return;
            } else {
                iL = up1Var.L();
            }
        } while (iL == this.b);
        this.d = iL;
    }

    public void t(snf snfVar) throws zzaek {
        int iL;
        int iL2;
        up1 up1Var = (up1) this.e;
        boolean z = snfVar instanceof gnf;
        int i = this.b;
        if (z) {
            gnf gnfVar = (gnf) snfVar;
            int i2 = i & 7;
            if (i2 != 0) {
                if (i2 != 2) {
                    ygf.g();
                    return;
                }
                int iG = up1Var.G() + up1Var.q0();
                do {
                    gnfVar.m(up1Var.q0());
                } while (up1Var.G() < iG);
                C(iG);
                return;
            }
            do {
                gnfVar.m(up1Var.q0());
                if (up1Var.F()) {
                    return;
                } else {
                    iL2 = up1Var.L();
                }
            } while (iL2 == this.b);
        } else {
            int i3 = i & 7;
            if (i3 != 0) {
                if (i3 != 2) {
                    ygf.g();
                    return;
                }
                int iG2 = up1Var.G() + up1Var.q0();
                do {
                    snfVar.add(Integer.valueOf(up1Var.q0()));
                } while (up1Var.G() < iG2);
                C(iG2);
                return;
            }
            do {
                snfVar.add(Integer.valueOf(up1Var.q0()));
                if (up1Var.F()) {
                    return;
                } else {
                    iL = up1Var.L();
                }
            } while (iL == this.b);
            iL2 = iL;
        }
        this.d = iL2;
    }

    public String toString() {
        switch (this.a) {
            case 1:
                return "";
            case 6:
                StringBuilder sb = new StringBuilder("SelectionInfo(id=1, range=(");
                int i = this.b;
                sb.append(i);
                sb.append('-');
                qjd qjdVar = (qjd) this.e;
                sb.append(lk7.v(qjdVar, i));
                sb.append(',');
                int i2 = this.c;
                sb.append(i2);
                sb.append('-');
                sb.append(lk7.v(qjdVar, i2));
                sb.append("), prevOffset=");
                return km4.A(sb, this.d, ')');
            default:
                return super.toString();
        }
    }

    public void u(snf snfVar) throws zzaek {
        int iL;
        int iL2;
        up1 up1Var = (up1) this.e;
        boolean z = snfVar instanceof gnf;
        int i = this.b;
        if (z) {
            gnf gnfVar = (gnf) snfVar;
            int i2 = i & 7;
            if (i2 != 0) {
                if (i2 != 2) {
                    ygf.g();
                    return;
                }
                int iG = up1Var.G() + up1Var.q0();
                do {
                    gnfVar.m(up1Var.s0());
                } while (up1Var.G() < iG);
                C(iG);
                return;
            }
            do {
                gnfVar.m(up1Var.s0());
                if (up1Var.F()) {
                    return;
                } else {
                    iL2 = up1Var.L();
                }
            } while (iL2 == this.b);
        } else {
            int i3 = i & 7;
            if (i3 != 0) {
                if (i3 != 2) {
                    ygf.g();
                    return;
                }
                int iG2 = up1Var.G() + up1Var.q0();
                do {
                    snfVar.add(Integer.valueOf(up1Var.s0()));
                } while (up1Var.G() < iG2);
                C(iG2);
                return;
            }
            do {
                snfVar.add(Integer.valueOf(up1Var.s0()));
                if (up1Var.F()) {
                    return;
                } else {
                    iL = up1Var.L();
                }
            } while (iL == this.b);
            iL2 = iL;
        }
        this.d = iL2;
    }

    public void v(snf snfVar) throws zzaek {
        int iL;
        int iL2;
        up1 up1Var = (up1) this.e;
        boolean z = snfVar instanceof gnf;
        int i = this.b;
        if (z) {
            gnf gnfVar = (gnf) snfVar;
            int i2 = i & 7;
            if (i2 == 2) {
                int iQ0 = up1Var.q0();
                D(iQ0);
                int iG = up1Var.G() + iQ0;
                do {
                    gnfVar.m(up1Var.u0());
                } while (up1Var.G() < iG);
                return;
            }
            if (i2 != 5) {
                ygf.g();
                return;
            }
            do {
                gnfVar.m(up1Var.u0());
                if (up1Var.F()) {
                    return;
                } else {
                    iL2 = up1Var.L();
                }
            } while (iL2 == this.b);
        } else {
            int i3 = i & 7;
            if (i3 == 2) {
                int iQ02 = up1Var.q0();
                D(iQ02);
                int iG2 = up1Var.G() + iQ02;
                do {
                    snfVar.add(Integer.valueOf(up1Var.u0()));
                } while (up1Var.G() < iG2);
                return;
            }
            if (i3 != 5) {
                ygf.g();
                return;
            }
            do {
                snfVar.add(Integer.valueOf(up1Var.u0()));
                if (up1Var.F()) {
                    return;
                } else {
                    iL = up1Var.L();
                }
            } while (iL == this.b);
            iL2 = iL;
        }
        this.d = iL2;
    }

    public void w(snf snfVar) throws zzaek {
        int iL;
        int iL2;
        up1 up1Var = (up1) this.e;
        boolean z = snfVar instanceof aof;
        int i = this.b;
        if (z) {
            aof aofVar = (aof) snfVar;
            int i2 = i & 7;
            if (i2 != 1) {
                if (i2 != 2) {
                    ygf.g();
                    return;
                }
                int iQ0 = up1Var.q0();
                E(iQ0);
                int iG = up1Var.G() + iQ0;
                do {
                    aofVar.f(up1Var.w0());
                } while (up1Var.G() < iG);
                return;
            }
            do {
                aofVar.f(up1Var.w0());
                if (up1Var.F()) {
                    return;
                } else {
                    iL2 = up1Var.L();
                }
            } while (iL2 == this.b);
        } else {
            int i3 = i & 7;
            if (i3 != 1) {
                if (i3 != 2) {
                    ygf.g();
                    return;
                }
                int iQ02 = up1Var.q0();
                E(iQ02);
                int iG2 = up1Var.G() + iQ02;
                do {
                    snfVar.add(Long.valueOf(up1Var.w0()));
                } while (up1Var.G() < iG2);
                return;
            }
            do {
                snfVar.add(Long.valueOf(up1Var.w0()));
                if (up1Var.F()) {
                    return;
                } else {
                    iL = up1Var.L();
                }
            } while (iL == this.b);
            iL2 = iL;
        }
        this.d = iL2;
    }

    public void x(snf snfVar) throws zzaek {
        int iL;
        int iL2;
        up1 up1Var = (up1) this.e;
        boolean z = snfVar instanceof gnf;
        int i = this.b;
        if (z) {
            gnf gnfVar = (gnf) snfVar;
            int i2 = i & 7;
            if (i2 != 0) {
                if (i2 != 2) {
                    ygf.g();
                    return;
                }
                int iG = up1Var.G() + up1Var.q0();
                do {
                    gnfVar.m(up1Var.y0());
                } while (up1Var.G() < iG);
                C(iG);
                return;
            }
            do {
                gnfVar.m(up1Var.y0());
                if (up1Var.F()) {
                    return;
                } else {
                    iL2 = up1Var.L();
                }
            } while (iL2 == this.b);
        } else {
            int i3 = i & 7;
            if (i3 != 0) {
                if (i3 != 2) {
                    ygf.g();
                    return;
                }
                int iG2 = up1Var.G() + up1Var.q0();
                do {
                    snfVar.add(Integer.valueOf(up1Var.y0()));
                } while (up1Var.G() < iG2);
                C(iG2);
                return;
            }
            do {
                snfVar.add(Integer.valueOf(up1Var.y0()));
                if (up1Var.F()) {
                    return;
                } else {
                    iL = up1Var.L();
                }
            } while (iL == this.b);
            iL2 = iL;
        }
        this.d = iL2;
    }

    public void y(snf snfVar) throws zzaek {
        int iL;
        int iL2;
        up1 up1Var = (up1) this.e;
        boolean z = snfVar instanceof aof;
        int i = this.b;
        if (z) {
            aof aofVar = (aof) snfVar;
            int i2 = i & 7;
            if (i2 != 0) {
                if (i2 != 2) {
                    ygf.g();
                    return;
                }
                int iG = up1Var.G() + up1Var.q0();
                do {
                    aofVar.f(up1Var.A0());
                } while (up1Var.G() < iG);
                C(iG);
                return;
            }
            do {
                aofVar.f(up1Var.A0());
                if (up1Var.F()) {
                    return;
                } else {
                    iL2 = up1Var.L();
                }
            } while (iL2 == this.b);
        } else {
            int i3 = i & 7;
            if (i3 != 0) {
                if (i3 != 2) {
                    ygf.g();
                    return;
                }
                int iG2 = up1Var.G() + up1Var.q0();
                do {
                    snfVar.add(Long.valueOf(up1Var.A0()));
                } while (up1Var.G() < iG2);
                C(iG2);
                return;
            }
            do {
                snfVar.add(Long.valueOf(up1Var.A0()));
                if (up1Var.F()) {
                    return;
                } else {
                    iL = up1Var.L();
                }
            } while (iL == this.b);
            iL2 = iL;
        }
        this.d = iL2;
    }

    public void z(int i) {
        if ((this.b & 7) == i) {
            return;
        }
        ygf.g();
    }

    public ym0(up1 up1Var) {
        this.a = 7;
        this.d = 0;
        this.e = up1Var;
        up1Var.c = this;
    }

    public /* synthetic */ ym0(int i) {
        this.a = i;
    }

    public ym0(up1 up1Var, byte b) {
        this.a = 8;
        this.d = 0;
        byte[] bArr = ztf.a;
        if (up1Var != null) {
            this.e = up1Var;
            up1Var.c = this;
        } else {
            z72.c("input");
            throw null;
        }
    }

    public ym0(qv8 qv8Var) {
        this.a = 5;
        this.e = qv8Var;
    }

    public ym0(int i, int i2, int i3, qjd qjdVar) {
        this.a = 6;
        this.b = i;
        this.c = i2;
        this.d = i3;
        this.e = qjdVar;
    }
}
