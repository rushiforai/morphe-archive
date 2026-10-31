package p1;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class k2 {

    /* renamed from: a, reason: collision with root package name */
    public final g2 f81465a;

    /* renamed from: b, reason: collision with root package name */
    public int[] f81466b;

    /* renamed from: c, reason: collision with root package name */
    public Object[] f81467c;

    /* renamed from: d, reason: collision with root package name */
    public ArrayList f81468d;

    /* renamed from: e, reason: collision with root package name */
    public HashMap f81469e;

    /* renamed from: f, reason: collision with root package name */
    public z.c0 f81470f;

    /* renamed from: g, reason: collision with root package name */
    public int f81471g;

    /* renamed from: h, reason: collision with root package name */
    public int f81472h;

    /* renamed from: i, reason: collision with root package name */
    public int f81473i;

    /* renamed from: j, reason: collision with root package name */
    public int f81474j;

    /* renamed from: k, reason: collision with root package name */
    public int f81475k;

    /* renamed from: l, reason: collision with root package name */
    public int f81476l;

    /* renamed from: m, reason: collision with root package name */
    public int f81477m;
    public int n;
    public int o;

    /* renamed from: p, reason: collision with root package name */
    public final fa.t f81478p;

    /* renamed from: q, reason: collision with root package name */
    public final fa.t f81479q;

    /* renamed from: r, reason: collision with root package name */
    public final fa.t f81480r;

    /* renamed from: s, reason: collision with root package name */
    public z.c0 f81481s;

    /* renamed from: t, reason: collision with root package name */
    public int f81482t;

    /* renamed from: u, reason: collision with root package name */
    public int f81483u;

    /* renamed from: v, reason: collision with root package name */
    public int f81484v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f81485w;

    /* renamed from: x, reason: collision with root package name */
    public z.b0 f81486x;

    public k2(g2 g2Var) {
        this.f81465a = g2Var;
        int[] iArr = g2Var.f81427a;
        this.f81466b = iArr;
        Object[] objArr = g2Var.f81429c;
        this.f81467c = objArr;
        this.f81468d = g2Var.f81435i;
        this.f81469e = g2Var.f81436j;
        this.f81470f = g2Var.f81437k;
        int i5 = g2Var.f81428b;
        this.f81471g = i5;
        this.f81472h = (iArr.length / 5) - i5;
        int i11 = g2Var.f81430d;
        this.f81475k = i11;
        this.f81476l = objArr.length - i11;
        this.f81477m = i5;
        this.f81478p = new fa.t((char) 0, 3);
        this.f81479q = new fa.t((char) 0, 3);
        this.f81480r = new fa.t((char) 0, 3);
        this.f81483u = i5;
        this.f81484v = -1;
    }

    public static int i(int i5, int i11, int i12, int i13) {
        return i5 > i11 ? -(((i13 - i12) - i5) + 1) : i5;
    }

    public static void y(k2 k2Var) {
        int i5 = k2Var.f81484v;
        int iR = k2Var.r(i5);
        int[] iArr = k2Var.f81466b;
        int i11 = (iR * 5) + 1;
        int i12 = iArr[i11];
        if ((i12 & 134217728) != 0) {
            return;
        }
        int i13 = (i12 & (-134217729)) | 134217728;
        iArr[i11] = i13;
        if ((67108864 & i13) != 0) {
            return;
        }
        k2Var.S(k2Var.D(iArr, i5));
    }

    public final void A(int i5) {
        a aVar;
        int i11;
        a aVar2;
        int i12;
        int i13;
        int i14 = this.f81472h;
        int i15 = this.f81471g;
        if (i15 != i5) {
            if (!this.f81468d.isEmpty()) {
                int iO = o() - this.f81472h;
                if (i15 < i5) {
                    for (int iB = i2.b(this.f81468d, i15, iO); iB < this.f81468d.size() && (i12 = (aVar2 = (a) this.f81468d.get(iB)).f81379a) < 0 && (i13 = i12 + iO) < i5; iB++) {
                        aVar2.f81379a = i13;
                    }
                } else {
                    for (int iB2 = i2.b(this.f81468d, i5, iO); iB2 < this.f81468d.size() && (i11 = (aVar = (a) this.f81468d.get(iB2)).f81379a) >= 0; iB2++) {
                        aVar.f81379a = -(iO - i11);
                    }
                }
            }
            if (i14 > 0) {
                int[] iArr = this.f81466b;
                int i16 = i5 * 5;
                int i17 = i14 * 5;
                int i18 = i15 * 5;
                if (i5 < i15) {
                    u90.b.p(i17 + i16, i16, iArr, iArr, i18);
                } else {
                    u90.b.p(i18, i18 + i17, iArr, iArr, i16 + i17);
                }
            }
            if (i5 < i15) {
                i15 = i5 + i14;
            }
            int iO2 = o();
            if (i15 >= iO2) {
                u.c("Check failed");
            }
            while (i15 < iO2) {
                int i19 = (i15 * 5) + 2;
                int i21 = this.f81466b[i19];
                int iP = i21 > -2 ? i21 : (p() + i21) - (-2);
                if (iP >= i5) {
                    iP = -((p() - iP) - (-2));
                }
                if (iP != i21) {
                    this.f81466b[i19] = iP;
                }
                i15++;
                if (i15 == i5) {
                    i15 += i14;
                }
            }
        }
        this.f81471g = i5;
    }

    public final void B(int i5, int i11) {
        int i12 = this.f81476l;
        int i13 = this.f81475k;
        int i14 = this.f81477m;
        if (i13 != i5) {
            Object[] objArr = this.f81467c;
            if (i5 < i13) {
                System.arraycopy(objArr, i5, objArr, i5 + i12, i13 - i5);
            } else {
                int i15 = i13 + i12;
                System.arraycopy(objArr, i15, objArr, i13, (i5 + i12) - i15);
            }
        }
        int iMin = Math.min(i11 + 1, p());
        if (i14 != iMin) {
            int length = this.f81467c.length - i12;
            if (iMin < i14) {
                int iR = r(iMin);
                int iR2 = r(i14);
                int i16 = this.f81471g;
                while (iR < iR2) {
                    int i17 = (iR * 5) + 4;
                    int i18 = this.f81466b[i17];
                    if (!(i18 >= 0)) {
                        u.c("Unexpected anchor value, expected a positive anchor");
                    }
                    this.f81466b[i17] = -((length - i18) + 1);
                    iR++;
                    if (iR == i16) {
                        iR += this.f81472h;
                    }
                }
            } else {
                int iR3 = r(i14);
                int iR4 = r(iMin);
                while (iR3 < iR4) {
                    int i19 = (iR3 * 5) + 4;
                    int i21 = this.f81466b[i19];
                    if (!(i21 < 0)) {
                        u.c("Unexpected anchor value, expected a negative anchor");
                    }
                    this.f81466b[i19] = i21 + length + 1;
                    iR3++;
                    if (iR3 == this.f81471g) {
                        iR3 += this.f81472h;
                    }
                }
            }
            this.f81477m = iMin;
        }
        this.f81475k = i5;
    }

    public final Object C(int i5) {
        int iR = r(i5);
        int[] iArr = this.f81466b;
        if ((iArr[(iR * 5) + 1] & 1073741824) != 0) {
            return this.f81467c[h(g(iArr, iR))];
        }
        return null;
    }

    public final int D(int[] iArr, int i5) {
        int i11 = iArr[(r(i5) * 5) + 2];
        return i11 > -2 ? i11 : (p() + i11) - (-2);
    }

    public final Object E(Object obj) {
        if (this.n > 0) {
            w(1, this.f81484v);
        }
        Object[] objArr = this.f81467c;
        int i5 = this.f81473i;
        this.f81473i = i5 + 1;
        Object obj2 = objArr[h(i5)];
        if (this.f81473i > this.f81474j) {
            u.c("Writing to an invalid slot");
        }
        this.f81467c[h(this.f81473i - 1)] = obj;
        return obj2;
    }

    public final void F() {
        int i5;
        z.b0 b0Var = this.f81486x;
        if (b0Var != null) {
            while (b0Var.f97784b != 0) {
                int iK = a0.k(b0Var);
                int iR = r(iK);
                int iT = iK + 1;
                int iT2 = t(iK) + iK;
                while (true) {
                    if (iT >= iT2) {
                        i5 = 0;
                        break;
                    } else {
                        if ((this.f81466b[(r(iT) * 5) + 1] & 201326592) != 0) {
                            i5 = 1;
                            break;
                        }
                        iT += t(iT);
                    }
                }
                int[] iArr = this.f81466b;
                int i11 = (iR * 5) + 1;
                int i12 = iArr[i11];
                if (((67108864 & i12) != 0 ? 1 : 0) != i5) {
                    iArr[i11] = (i5 << 26) | ((-67108865) & i12);
                    int iD = D(iArr, iK);
                    if (iD >= 0) {
                        a0.c(b0Var, iD);
                    }
                }
            }
        }
    }

    public final boolean G() {
        if (!(this.n == 0)) {
            u.c("Cannot remove group while inserting");
        }
        int i5 = this.f81482t;
        int i11 = this.f81473i;
        int iG = g(this.f81466b, r(i5));
        int iK = K();
        N(this.f81484v);
        z.b0 b0Var = this.f81486x;
        if (b0Var != null) {
            while (true) {
                int i12 = b0Var.f97784b;
                if (i12 == 0) {
                    break;
                }
                if (i12 == 0) {
                    android.support.v4.media.session.b.n0("IntList is empty.");
                    throw null;
                }
                if (b0Var.f97783a[0] < i5) {
                    break;
                }
                a0.k(b0Var);
            }
        }
        boolean zH = H(i5, this.f81482t - i5);
        I(iG, this.f81473i - iG, i5 - 1);
        this.f81482t = i5;
        this.f81473i = i11;
        this.o -= iK;
        return zH;
    }

    public final boolean H(int i5, int i11) {
        if (i11 > 0) {
            ArrayList arrayList = this.f81468d;
            A(i5);
            if (!arrayList.isEmpty()) {
                HashMap map = this.f81469e;
                int i12 = i5 + i11;
                int iB = i2.b(this.f81468d, i12, o() - this.f81472h);
                if (iB >= this.f81468d.size()) {
                    iB--;
                }
                int i13 = iB + 1;
                int i14 = 0;
                while (iB >= 0) {
                    a aVar = (a) this.f81468d.get(iB);
                    int iC = c(aVar);
                    if (iC < i5) {
                        break;
                    }
                    if (iC < i12) {
                        aVar.f81379a = Integer.MIN_VALUE;
                        if (map != null) {
                        }
                        if (i14 == 0) {
                            i14 = iB + 1;
                        }
                        i13 = iB;
                    }
                    iB--;
                }
                z = i13 < i14;
                if (z) {
                    this.f81468d.subList(i13, i14).clear();
                }
            }
            this.f81471g = i5;
            this.f81472h += i11;
            int i15 = this.f81477m;
            if (i15 > i5) {
                this.f81477m = Math.max(i5, i15 - i11);
            }
            int i16 = this.f81483u;
            if (i16 >= this.f81471g) {
                this.f81483u = i16 - i11;
            }
            int i17 = this.f81484v;
            if (i17 >= 0 && (this.f81466b[(r(i17) * 5) + 1] & 67108864) != 0) {
                S(i17);
            }
        }
        return z;
    }

    public final void I(int i5, int i11, int i12) {
        if (i11 > 0) {
            int i13 = this.f81476l;
            int i14 = i5 + i11;
            B(i14, i12);
            this.f81475k = i5;
            this.f81476l = i13 + i11;
            u90.b.B(i5, i14, null, this.f81467c);
            int i15 = this.f81474j;
            if (i15 >= i5) {
                this.f81474j = i15 - i11;
            }
        }
    }

    public final Object J(int i5, int i11, Object obj) {
        int iM = M(this.f81466b, r(i5));
        int iG = g(this.f81466b, r(i5 + 1));
        int i12 = iM + i11;
        if (i12 < iM || i12 >= iG) {
            u.c("Write to an invalid slot index " + i11 + " for group " + i5);
        }
        int iH = h(i12);
        Object[] objArr = this.f81467c;
        Object obj2 = objArr[iH];
        objArr[iH] = obj;
        return obj2;
    }

    public final int K() {
        int iR = r(this.f81482t);
        int iA = i2.a(this.f81466b, iR) + this.f81482t;
        this.f81482t = iA;
        this.f81473i = g(this.f81466b, r(iA));
        int i5 = this.f81466b[(iR * 5) + 1];
        if ((1073741824 & i5) != 0) {
            return 1;
        }
        return i5 & 67108863;
    }

    public final void L() {
        int i5 = this.f81483u;
        this.f81482t = i5;
        this.f81473i = g(this.f81466b, r(i5));
    }

    public final int M(int[] iArr, int i5) {
        if (i5 >= o()) {
            return this.f81467c.length - this.f81476l;
        }
        int iC = i2.c(iArr, i5);
        return iC < 0 ? (this.f81467c.length - this.f81476l) + iC + 1 : iC;
    }

    public final s0 N(int i5) {
        a aVarQ;
        HashMap map = this.f81469e;
        if (map == null || (aVarQ = Q(i5)) == null) {
            return null;
        }
        return (s0) map.get(aVarQ);
    }

    public final void O() {
        if (this.n != 0) {
            u.c("Key must be supplied when inserting");
        }
        g1 g1Var = n.f81514a;
        P(g1Var, g1Var, false, 0);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void P(Object obj, Object obj2, boolean z11, int i5) {
        int i11;
        int i12 = this.f81484v;
        Object[] objArr = this.n > 0;
        this.f81480r.g(this.o);
        g1 g1Var = n.f81514a;
        if (objArr == true) {
            int i13 = this.f81482t;
            int iG = g(this.f81466b, r(i13));
            v(1);
            this.f81473i = iG;
            this.f81474j = iG;
            int iR = r(i13);
            int i14 = obj != g1Var ? 1 : 0;
            int i15 = (z11 || obj2 == g1Var) ? 0 : 1;
            int i16 = i(iG, this.f81475k, this.f81476l, this.f81467c.length);
            if (i16 >= 0 && this.f81477m < i13) {
                i16 = -(((this.f81467c.length - this.f81476l) - i16) + 1);
            }
            int[] iArr = this.f81466b;
            int i17 = this.f81484v;
            int i18 = iR * 5;
            iArr[i18] = i5;
            iArr[i18 + 1] = ((z11 ? 1 : 0) << 30) | (i14 << 29) | (i15 << 28);
            iArr[i18 + 2] = i17;
            iArr[i18 + 3] = 0;
            iArr[i18 + 4] = i16;
            int i19 = (z11 ? 1 : 0) + i14 + i15;
            if (i19 > 0) {
                w(i19, i13);
                Object[] objArr2 = this.f81467c;
                int i21 = this.f81473i;
                if (z11) {
                    objArr2[i21] = obj2;
                    i21++;
                }
                if (i14 != 0) {
                    objArr2[i21] = obj;
                    i21++;
                }
                if (i15 != 0) {
                    objArr2[i21] = obj2;
                    i21++;
                }
                this.f81473i = i21;
            }
            this.o = 0;
            i11 = i13 + 1;
            this.f81484v = i13;
            this.f81482t = i11;
            if (i12 >= 0) {
                N(i12);
            }
        } else {
            this.f81478p.g(i12);
            this.f81479q.g((o() - this.f81472h) - this.f81483u);
            int i22 = this.f81482t;
            int iR2 = r(i22);
            if (!Intrinsics.b(obj2, g1Var)) {
                if (z11) {
                    T(this.f81482t, obj2);
                } else {
                    R(obj2);
                }
            }
            this.f81473i = M(this.f81466b, iR2);
            this.f81474j = g(this.f81466b, r(this.f81482t + 1));
            int[] iArr2 = this.f81466b;
            int i23 = iR2 * 5;
            this.o = iArr2[i23 + 1] & 67108863;
            this.f81484v = i22;
            this.f81482t = i22 + 1;
            i11 = i22 + iArr2[i23 + 3];
        }
        this.f81483u = i11;
    }

    public final a Q(int i5) {
        ArrayList arrayList;
        int iE;
        if (i5 < 0 || i5 >= p() || (iE = i2.e((arrayList = this.f81468d), i5, p())) < 0) {
            return null;
        }
        return (a) arrayList.get(iE);
    }

    public final void R(Object obj) {
        int iR = r(this.f81482t);
        int i5 = (iR * 5) + 1;
        if ((this.f81466b[i5] & 268435456) == 0) {
            u.c("Updating the data of a group that was not created with a data slot");
        }
        Object[] objArr = this.f81467c;
        int[] iArr = this.f81466b;
        objArr[h(Integer.bitCount(iArr[i5] >> 29) + g(iArr, iR))] = obj;
    }

    public final void S(int i5) {
        if (i5 >= 0) {
            z.b0 b0Var = this.f81486x;
            if (b0Var == null) {
                b0Var = new z.b0();
                this.f81486x = b0Var;
            }
            a0.c(b0Var, i5);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void T(int i5, Object obj) {
        boolean z11;
        int iR = r(i5);
        int[] iArr = this.f81466b;
        if (iR < iArr.length) {
            z11 = (iArr[(iR * 5) + 1] & 1073741824) != 0;
        }
        if (!z11) {
            u.c("Updating the node of a group at " + i5 + " that was not created with as a node group");
        }
        this.f81467c[h(g(this.f81466b, iR))] = obj;
    }

    public final void a(int i5) {
        boolean z11 = false;
        if (!(i5 >= 0)) {
            u.c("Cannot seek backwards");
        }
        if (!(this.n <= 0)) {
            o1.b("Cannot call seek() while inserting");
        }
        if (i5 == 0) {
            return;
        }
        int i11 = this.f81482t + i5;
        if (i11 >= this.f81484v && i11 <= this.f81483u) {
            z11 = true;
        }
        if (!z11) {
            u.c("Cannot seek outside the current group (" + this.f81484v + '-' + this.f81483u + ')');
        }
        this.f81482t = i11;
        int iG = g(this.f81466b, r(i11));
        this.f81473i = iG;
        this.f81474j = iG;
    }

    public final a b(int i5) {
        ArrayList arrayList = this.f81468d;
        int iE = i2.e(arrayList, i5, p());
        if (iE >= 0) {
            return (a) arrayList.get(iE);
        }
        if (i5 > this.f81471g) {
            i5 = -(p() - i5);
        }
        a aVar = new a(i5);
        arrayList.add(-(iE + 1), aVar);
        return aVar;
    }

    public final int c(a aVar) {
        int i5 = aVar.f81379a;
        return i5 < 0 ? p() + i5 : i5;
    }

    public final void d() {
        int i5 = this.n;
        this.n = i5 + 1;
        if (i5 == 0) {
            this.f81479q.g((o() - this.f81472h) - this.f81483u);
        }
    }

    public final void e(boolean z11) {
        this.f81485w = true;
        if (z11 && this.f81478p.f54485a == 0) {
            A(p());
            B(this.f81467c.length - this.f81476l, this.f81471g);
            int i5 = this.f81475k;
            Arrays.fill(this.f81467c, i5, this.f81476l + i5, (Object) null);
            F();
        }
        int[] iArr = this.f81466b;
        int i11 = this.f81471g;
        Object[] objArr = this.f81467c;
        int i12 = this.f81475k;
        ArrayList arrayList = this.f81468d;
        HashMap map = this.f81469e;
        z.c0 c0Var = this.f81470f;
        g2 g2Var = this.f81465a;
        if (!g2Var.f81433g) {
            o1.a("Unexpected writer close()");
        }
        g2Var.f81433g = false;
        g2Var.f81427a = iArr;
        g2Var.f81428b = i11;
        g2Var.f81429c = objArr;
        g2Var.f81430d = i12;
        g2Var.f81435i = arrayList;
        g2Var.f81436j = map;
        g2Var.f81437k = c0Var;
    }

    public final int f(int i5) {
        return g(this.f81466b, r(i5));
    }

    public final int g(int[] iArr, int i5) {
        if (i5 >= o()) {
            return this.f81467c.length - this.f81476l;
        }
        int i11 = iArr[(i5 * 5) + 4];
        return i11 < 0 ? (this.f81467c.length - this.f81476l) + i11 + 1 : i11;
    }

    public final int h(int i5) {
        return (this.f81476l * (i5 < this.f81475k ? 0 : 1)) + i5;
    }

    public final void j() {
        z.j0 j0Var;
        boolean z11 = this.n > 0;
        int i5 = this.f81482t;
        int i11 = this.f81483u;
        int i12 = this.f81484v;
        int iR = r(i12);
        int i13 = this.o;
        int i14 = i5 - i12;
        int i15 = iR * 5;
        int i16 = i15 + 1;
        boolean z12 = (this.f81466b[i16] & 1073741824) != 0;
        fa.t tVar = this.f81480r;
        if (z11) {
            z.c0 c0Var = this.f81481s;
            if (c0Var != null && (j0Var = (z.j0) c0Var.b(i12)) != null) {
                Object[] objArr = j0Var.f97840a;
                int i17 = j0Var.f97841b;
                for (int i18 = 0; i18 < i17; i18++) {
                    E(objArr[i18]);
                }
            }
            int[] iArr = this.f81466b;
            iArr[i15 + 3] = i14;
            i2.d(iR, i13, iArr);
            int iF = tVar.f();
            if (z12) {
                i13 = 1;
            }
            this.o = iF + i13;
            int iD = D(this.f81466b, i12);
            this.f81484v = iD;
            int iP = iD < 0 ? p() : r(iD + 1);
            int iG = iP >= 0 ? g(this.f81466b, iP) : 0;
            this.f81473i = iG;
            this.f81474j = iG;
            return;
        }
        if (i5 != i11) {
            u.c("Expected to be at the end of a group");
        }
        int[] iArr2 = this.f81466b;
        int i19 = i15 + 3;
        int i21 = iArr2[i19];
        int i22 = iArr2[i16] & 67108863;
        iArr2[i19] = i14;
        i2.d(iR, i13, iArr2);
        int iF2 = this.f81478p.f();
        this.f81483u = (o() - this.f81472h) - this.f81479q.f();
        this.f81484v = iF2;
        int iD2 = D(this.f81466b, i12);
        int iF3 = tVar.f();
        this.o = iF3;
        if (iD2 == iF2) {
            this.o = iF3 + (z12 ? 0 : i13 - i22);
            return;
        }
        int i23 = i14 - i21;
        int i24 = z12 ? 0 : i13 - i22;
        if (i23 != 0 || i24 != 0) {
            while (iD2 != 0 && iD2 != iF2 && (i24 != 0 || i23 != 0)) {
                int iR2 = r(iD2);
                if (i23 != 0) {
                    int[] iArr3 = this.f81466b;
                    int i25 = (iR2 * 5) + 3;
                    iArr3[i25] = iArr3[i25] + i23;
                }
                if (i24 != 0) {
                    int[] iArr4 = this.f81466b;
                    i2.d(iR2, (iArr4[(iR2 * 5) + 1] & 67108863) + i24, iArr4);
                }
                int[] iArr5 = this.f81466b;
                if ((iArr5[(iR2 * 5) + 1] & 1073741824) != 0) {
                    i24 = 0;
                }
                iD2 = D(iArr5, iD2);
            }
        }
        this.o += i24;
    }

    public final void k() {
        if (this.n <= 0) {
            o1.b("Unbalanced begin/end insert");
        }
        int i5 = this.n - 1;
        this.n = i5;
        if (i5 == 0) {
            if (this.f81480r.f54485a != this.f81478p.f54485a) {
                u.c("startGroup/endGroup mismatch while inserting");
            }
            this.f81483u = (o() - this.f81472h) - this.f81479q.f();
        }
    }

    public final void l(int i5) {
        boolean z11 = false;
        if (!(this.n <= 0)) {
            u.c("Cannot call ensureStarted() while inserting");
        }
        int i11 = this.f81484v;
        if (i11 != i5) {
            if (i5 >= i11 && i5 < this.f81483u) {
                z11 = true;
            }
            if (!z11) {
                u.c("Started group at " + i5 + " must be a subgroup of the group at " + i11);
            }
            int i12 = this.f81482t;
            int i13 = this.f81473i;
            int i14 = this.f81474j;
            this.f81482t = i5;
            O();
            this.f81482t = i12;
            this.f81473i = i13;
            this.f81474j = i14;
        }
    }

    public final void m(int i5, int i11, int i12) {
        if (i5 >= this.f81471g) {
            i5 = -((p() - i5) + 2);
        }
        while (i12 < i11) {
            this.f81466b[(r(i12) * 5) + 2] = i5;
            int i13 = this.f81466b[(r(i12) * 5) + 3] + i12;
            m(i12, i13, i12 + 1);
            i12 = i13;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:51:0x00eb, code lost:
    
        android.support.v4.media.session.b.m0("Index must be between 0 and size");
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x00f0, code lost:
    
        throw null;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void n(Function2 function2, int i5) {
        int i11;
        int i12;
        a aVar;
        Function2 function22 = function2;
        int iD = D(this.f81466b, i5);
        int iP = p();
        int iT = t(i5) + i5;
        int i13 = i5;
        z.d0 d0Var = null;
        z.b0 b0Var = null;
        loop0: while (i13 < iT) {
            int i14 = i13 + 1;
            int iF = f(i14);
            for (int iF2 = f(i13); iF2 < iF; iF2++) {
                Object obj = this.f81467c[h(iF2)];
                if ((obj instanceof a2) && (aVar = ((a2) obj).f81382b) != null && aVar.a()) {
                    int iC = c(aVar);
                    if (d0Var == null) {
                        int[] iArr = z.p.f97811a;
                        d0Var = new z.d0();
                    }
                    if (b0Var == null) {
                        b0Var = new z.b0();
                    }
                    d0Var.b(iC);
                    b0Var.c(iC);
                    b0Var.c(iF2);
                } else {
                    function22.invoke(Integer.valueOf(iF2), obj);
                }
            }
            int iD2 = i14 < iP ? D(this.f81466b, i14) : -1;
            if (iD2 != i13) {
                while (true) {
                    if (b0Var == null || d0Var == null || !d0Var.e(i13)) {
                        i11 = iP;
                    } else {
                        int i15 = b0Var.f97784b;
                        int i16 = i15 / 2;
                        int i17 = 0;
                        int i18 = 0;
                        while (i17 < i16) {
                            int i19 = i17 * 2;
                            int i21 = iP;
                            int iA = b0Var.a(i19);
                            if (iA == i13) {
                                int iA2 = b0Var.a(i19 + 1);
                                function22.invoke(Integer.valueOf(iA2), this.f81467c[h(iA2)]);
                            } else if (i19 != i18) {
                                int i22 = i18 + 1;
                                b0Var.f(i18, iA);
                                i18 += 2;
                                b0Var.f(i22, b0Var.a(i19 + 1));
                            } else {
                                i18 += 2;
                            }
                            i17++;
                            function22 = function2;
                            iP = i21;
                        }
                        i11 = iP;
                        if (i18 != i15) {
                            if (i18 < 0 || i18 > (i12 = b0Var.f97784b) || i15 < 0 || i15 > i12) {
                                break loop0;
                            }
                            if (i15 < i18) {
                                android.support.v4.media.session.b.k0("The end index must be < start index");
                                throw null;
                            }
                            if (i15 != i18) {
                                if (i15 < i12) {
                                    int[] iArr2 = b0Var.f97783a;
                                    u90.b.p(i18, i15, iArr2, iArr2, i12);
                                }
                                b0Var.f97784b -= i15 - i18;
                            }
                        }
                    }
                    if (i13 == i5 || iD == iD2) {
                        break;
                    }
                    i13 = iD;
                    iP = i11;
                    iD = D(this.f81466b, iD);
                    function22 = function2;
                }
            } else {
                i11 = iP;
            }
            function22 = function2;
            iD = iD2;
            i13 = i14;
            iP = i11;
        }
    }

    public final int o() {
        return this.f81466b.length / 5;
    }

    public final int p() {
        return o() - this.f81472h;
    }

    public final Object q(int i5) {
        int iR = r(i5);
        int[] iArr = this.f81466b;
        int i11 = (iR * 5) + 1;
        if ((iArr[i11] & 268435456) == 0) {
            return n.f81514a;
        }
        return this.f81467c[Integer.bitCount(iArr[i11] >> 29) + g(iArr, iR)];
    }

    public final int r(int i5) {
        return (this.f81472h * (i5 < this.f81471g ? 0 : 1)) + i5;
    }

    public final Object s(int i5) {
        int iR = r(i5);
        int[] iArr = this.f81466b;
        int i11 = iR * 5;
        int i12 = iArr[i11 + 1];
        if ((536870912 & i12) == 0) {
            return null;
        }
        return this.f81467c[Integer.bitCount(i12 >> 30) + iArr[i11 + 4]];
    }

    public final int t(int i5) {
        return i2.a(this.f81466b, r(i5));
    }

    public final String toString() {
        return "SlotWriter(current = " + this.f81482t + " end=" + this.f81483u + " size = " + p() + " gap=" + this.f81471g + '-' + (this.f81471g + this.f81472h) + ')';
    }

    public final boolean u(int i5, int i11) {
        int iO;
        int iT;
        if (i11 == this.f81484v) {
            iO = this.f81483u;
        } else {
            fa.t tVar = this.f81478p;
            if (i11 > tVar.e(0)) {
                iT = t(i11);
            } else {
                int[] iArr = (int[]) tVar.f54486b;
                int iMin = Math.min(iArr.length, tVar.f54485a);
                int i12 = 0;
                while (true) {
                    if (i12 >= iMin) {
                        i12 = -1;
                        break;
                    }
                    if (iArr[i12] == i11) {
                        break;
                    }
                    i12++;
                }
                if (i12 < 0) {
                    iT = t(i11);
                } else {
                    iO = (o() - this.f81472h) - ((int[]) this.f81479q.f54486b)[i12];
                }
            }
            iO = iT + i11;
        }
        return i5 > i11 && i5 < iO;
    }

    public final void v(int i5) {
        if (i5 > 0) {
            int i11 = this.f81482t;
            A(i11);
            int i12 = this.f81471g;
            int i13 = this.f81472h;
            int[] iArr = this.f81466b;
            int length = iArr.length / 5;
            int i14 = length - i13;
            if (i13 < i5) {
                int iMax = Math.max(Math.max(length * 2, i14 + i5), 32);
                int[] iArr2 = new int[iMax * 5];
                int i15 = iMax - i14;
                u90.b.p(0, 0, iArr, iArr2, i12 * 5);
                u90.b.p((i12 + i15) * 5, (i13 + i12) * 5, iArr, iArr2, length * 5);
                this.f81466b = iArr2;
                i13 = i15;
            }
            int i16 = this.f81483u;
            if (i16 >= i12) {
                this.f81483u = i16 + i5;
            }
            int i17 = i12 + i5;
            this.f81471g = i17;
            this.f81472h = i13 - i5;
            int i18 = i(i14 > 0 ? f(i11 + i5) : 0, this.f81477m >= i12 ? this.f81475k : 0, this.f81476l, this.f81467c.length);
            for (int i19 = i12; i19 < i17; i19++) {
                this.f81466b[(i19 * 5) + 4] = i18;
            }
            int i21 = this.f81477m;
            if (i21 >= i12) {
                this.f81477m = i21 + i5;
            }
        }
    }

    public final void w(int i5, int i11) {
        if (i5 > 0) {
            B(this.f81473i, i11);
            int i12 = this.f81475k;
            int i13 = this.f81476l;
            if (i13 < i5) {
                Object[] objArr = this.f81467c;
                int length = objArr.length;
                int i14 = length - i13;
                int iMax = Math.max(Math.max(length * 2, i14 + i5), 32);
                Object[] objArr2 = new Object[iMax];
                for (int i15 = 0; i15 < iMax; i15++) {
                    objArr2[i15] = null;
                }
                int i16 = iMax - i14;
                int i17 = i13 + i12;
                System.arraycopy(objArr, 0, objArr2, 0, i12);
                System.arraycopy(objArr, i17, objArr2, i12 + i16, length - i17);
                this.f81467c = objArr2;
                i13 = i16;
            }
            int i18 = this.f81474j;
            if (i18 >= i12) {
                this.f81474j = i18 + i5;
            }
            this.f81475k = i12 + i5;
            this.f81476l = i13 - i5;
        }
    }

    public final boolean x(int i5) {
        return (this.f81466b[(r(i5) * 5) + 1] & 1073741824) != 0;
    }

    public final void z(g2 g2Var, int i5) {
        if (this.n <= 0) {
            u.c("Check failed");
        }
        if (i5 == 0 && this.f81482t == 0 && this.f81465a.f81428b == 0) {
            int[] iArr = g2Var.f81427a;
            int i11 = iArr[(i5 * 5) + 3];
            int i12 = g2Var.f81428b;
            if (i11 == i12) {
                int[] iArr2 = this.f81466b;
                Object[] objArr = this.f81467c;
                ArrayList arrayList = this.f81468d;
                HashMap map = this.f81469e;
                z.c0 c0Var = this.f81470f;
                Object[] objArr2 = g2Var.f81429c;
                int i13 = g2Var.f81430d;
                HashMap map2 = g2Var.f81436j;
                z.c0 c0Var2 = g2Var.f81437k;
                this.f81466b = iArr;
                this.f81467c = objArr2;
                this.f81468d = g2Var.f81435i;
                this.f81471g = i12;
                this.f81472h = (iArr.length / 5) - i12;
                this.f81475k = i13;
                this.f81476l = objArr2.length - i13;
                this.f81477m = i12;
                this.f81469e = map2;
                this.f81470f = c0Var2;
                g2Var.f81427a = iArr2;
                g2Var.f81428b = 0;
                g2Var.f81429c = objArr;
                g2Var.f81430d = 0;
                g2Var.f81435i = arrayList;
                g2Var.f81436j = map;
                g2Var.f81437k = c0Var;
                return;
            }
        }
        k2 k2VarE = g2Var.e();
        try {
            j2.a(k2VarE, i5, this, true, true, false);
            k2VarE.e(true);
        } catch (Throwable th2) {
            k2VarE.e(false);
            throw th2;
        }
    }
}
