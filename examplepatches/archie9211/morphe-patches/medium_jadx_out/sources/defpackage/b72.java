package defpackage;

import com.drew.imaging.raf.yvq.AXoTRPEGKEve;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class b72 {
    public float A;
    public int B;
    public float C;
    public final int[] D;
    public float E;
    public boolean F;
    public boolean G;
    public int H;
    public int I;
    public final l52 J;
    public final l52 K;
    public final l52 L;
    public final l52 M;
    public final l52 N;
    public final l52 O;
    public final l52 P;
    public final l52 Q;
    public final l52[] R;
    public final ArrayList S;
    public final boolean[] T;
    public final a72[] U;
    public c72 V;
    public int W;
    public int X;
    public float Y;
    public int Z;
    public boolean a;
    public int a0;
    public rj1 b;
    public int b0;
    public rj1 c;
    public int c0;
    public pr5 d;
    public int d0;
    public bte e;
    public int e0;
    public final boolean[] f;
    public float f0;
    public boolean g;
    public float g0;
    public int h;
    public Object h0;
    public int i;
    public int i0;
    public final i3f j;
    public String j0;
    public String k;
    public int k0;
    public boolean l;
    public int l0;
    public boolean m;
    public final float[] m0;
    public boolean n;
    public final b72[] n0;
    public boolean o;
    public final b72[] o0;
    public int p;
    public int p0;
    public int q;
    public int q0;
    public int r;
    public int s;
    public int t;
    public final int[] u;
    public int v;
    public int w;
    public float x;
    public int y;
    public int z;

    public b72() {
        this.a = false;
        this.d = null;
        this.e = null;
        this.f = new boolean[]{true, true};
        this.g = true;
        this.h = -1;
        this.i = -1;
        this.j = new i3f(this);
        this.l = false;
        this.m = false;
        this.n = false;
        this.o = false;
        this.p = -1;
        this.q = -1;
        this.r = 0;
        this.s = 0;
        this.t = 0;
        this.u = new int[2];
        this.v = 0;
        this.w = 0;
        this.x = 1.0f;
        this.y = 0;
        this.z = 0;
        this.A = 1.0f;
        this.B = -1;
        this.C = 1.0f;
        this.D = new int[]{Integer.MAX_VALUE, Integer.MAX_VALUE};
        this.E = Float.NaN;
        this.F = false;
        this.G = false;
        this.H = 0;
        this.I = 0;
        l52 l52Var = new l52(this, k52.LEFT);
        this.J = l52Var;
        l52 l52Var2 = new l52(this, k52.TOP);
        this.K = l52Var2;
        l52 l52Var3 = new l52(this, k52.RIGHT);
        this.L = l52Var3;
        l52 l52Var4 = new l52(this, k52.BOTTOM);
        this.M = l52Var4;
        l52 l52Var5 = new l52(this, k52.BASELINE);
        this.N = l52Var5;
        this.O = new l52(this, k52.CENTER_X);
        this.P = new l52(this, k52.CENTER_Y);
        l52 l52Var6 = new l52(this, k52.CENTER);
        this.Q = l52Var6;
        this.R = new l52[]{l52Var, l52Var3, l52Var2, l52Var4, l52Var5, l52Var6};
        this.S = new ArrayList();
        this.T = new boolean[2];
        a72 a72Var = a72.FIXED;
        this.U = new a72[]{a72Var, a72Var};
        this.V = null;
        this.W = 0;
        this.X = 0;
        this.Y = 0.0f;
        this.Z = -1;
        this.a0 = 0;
        this.b0 = 0;
        this.c0 = 0;
        this.f0 = 0.5f;
        this.g0 = 0.5f;
        this.i0 = 0;
        this.j0 = null;
        this.k0 = 0;
        this.l0 = 0;
        this.m0 = new float[]{-1.0f, -1.0f};
        this.n0 = new b72[]{null, null};
        this.o0 = new b72[]{null, null};
        this.p0 = -1;
        this.q0 = -1;
        a();
    }

    public static void H(int i, int i2, String str, StringBuilder sb) {
        if (i == i2) {
            return;
        }
        sb.append(str);
        sb.append(" :   ");
        sb.append(i);
        sb.append(",\n");
    }

    public static void I(StringBuilder sb, String str, float f, float f2) {
        if (f == f2) {
            return;
        }
        sb.append(str);
        sb.append(" :   ");
        sb.append(f);
        sb.append(",\n");
    }

    public static void q(StringBuilder sb, String str, l52 l52Var) {
        if (l52Var.f == null) {
            return;
        }
        sb.append("    ");
        sb.append(str);
        sb.append(" : [ '");
        sb.append(l52Var.f);
        sb.append("'");
        if (l52Var.h != Integer.MIN_VALUE || l52Var.g != 0) {
            sb.append(",");
            sb.append(l52Var.g);
            if (l52Var.h != Integer.MIN_VALUE) {
                sb.append(",");
                sb.append(l52Var.h);
                sb.append(",");
            }
        }
        sb.append(" ] ,\n");
    }

    public final boolean A() {
        return this.g && this.i0 != 8;
    }

    public boolean B() {
        if (this.l) {
            return true;
        }
        return this.J.c && this.L.c;
    }

    public boolean C() {
        if (this.m) {
            return true;
        }
        return this.K.c && this.M.c;
    }

    public void D() {
        this.J.j();
        this.K.j();
        this.L.j();
        this.M.j();
        this.N.j();
        this.O.j();
        this.P.j();
        this.Q.j();
        this.V = null;
        this.E = Float.NaN;
        this.W = 0;
        this.X = 0;
        this.Y = 0.0f;
        this.Z = -1;
        this.a0 = 0;
        this.b0 = 0;
        this.c0 = 0;
        this.d0 = 0;
        this.e0 = 0;
        this.f0 = 0.5f;
        this.g0 = 0.5f;
        a72 a72Var = a72.FIXED;
        a72[] a72VarArr = this.U;
        a72VarArr[0] = a72Var;
        a72VarArr[1] = a72Var;
        this.h0 = null;
        this.i0 = 0;
        this.k0 = 0;
        this.l0 = 0;
        float[] fArr = this.m0;
        fArr[0] = -1.0f;
        fArr[1] = -1.0f;
        this.p = -1;
        this.q = -1;
        int[] iArr = this.D;
        iArr[0] = Integer.MAX_VALUE;
        iArr[1] = Integer.MAX_VALUE;
        this.s = 0;
        this.t = 0;
        this.x = 1.0f;
        this.A = 1.0f;
        this.w = Integer.MAX_VALUE;
        this.z = Integer.MAX_VALUE;
        this.v = 0;
        this.y = 0;
        this.B = -1;
        this.C = 1.0f;
        boolean[] zArr = this.f;
        zArr[0] = true;
        zArr[1] = true;
        this.G = false;
        boolean[] zArr2 = this.T;
        zArr2[0] = false;
        zArr2[1] = false;
        this.g = true;
        int[] iArr2 = this.u;
        iArr2[0] = 0;
        iArr2[1] = 0;
        this.h = -1;
        this.i = -1;
    }

    public final void E() {
        ArrayList arrayList = this.S;
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            ((l52) arrayList.get(i)).j();
        }
    }

    public final void F() {
        this.l = false;
        this.m = false;
        this.n = false;
        this.o = false;
        ArrayList arrayList = this.S;
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            l52 l52Var = (l52) arrayList.get(i);
            l52Var.c = false;
            l52Var.b = 0;
        }
    }

    public void G(m50 m50Var) {
        this.J.k();
        this.K.k();
        this.L.k();
        this.M.k();
        this.N.k();
        this.Q.k();
        this.O.k();
        this.P.k();
    }

    public final void J(int i) {
        this.c0 = i;
        this.F = i > 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x0086 A[PHI: r0
      0x0086: PHI (r0v2 int) = (r0v1 int), (r0v0 int), (r0v0 int), (r0v0 int), (r0v0 int), (r0v0 int) binds: [B:46:0x0086, B:36:0x007f, B:24:0x0051, B:26:0x0057, B:28:0x0063, B:30:0x0067] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:39:0x0086 -> B:40:0x0087). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void K(java.lang.String r9) {
        /*
            r8 = this;
            r0 = 0
            if (r9 == 0) goto L90
            int r1 = r9.length()
            if (r1 != 0) goto Lb
            goto L90
        Lb:
            int r1 = r9.length()
            r2 = 44
            int r2 = r9.indexOf(r2)
            r3 = 0
            r4 = 1
            r5 = -1
            if (r2 <= 0) goto L39
            int r6 = r1 + (-1)
            if (r2 >= r6) goto L39
            java.lang.String r6 = r9.substring(r3, r2)
            java.lang.String r7 = "W"
            boolean r7 = r6.equalsIgnoreCase(r7)
            if (r7 == 0) goto L2b
            goto L36
        L2b:
            java.lang.String r3 = "H"
            boolean r3 = r6.equalsIgnoreCase(r3)
            if (r3 == 0) goto L35
            r3 = r4
            goto L36
        L35:
            r3 = r5
        L36:
            int r2 = r2 + r4
            r5 = r3
            r3 = r2
        L39:
            r2 = 58
            int r2 = r9.indexOf(r2)
            if (r2 < 0) goto L77
            int r1 = r1 - r4
            if (r2 >= r1) goto L77
            java.lang.String r1 = r9.substring(r3, r2)
            int r2 = r2 + r4
            java.lang.String r9 = r9.substring(r2)
            int r2 = r1.length()
            if (r2 <= 0) goto L86
            int r2 = r9.length()
            if (r2 <= 0) goto L86
            float r1 = java.lang.Float.parseFloat(r1)     // Catch: java.lang.NumberFormatException -> L86
            float r9 = java.lang.Float.parseFloat(r9)     // Catch: java.lang.NumberFormatException -> L86
            int r2 = (r1 > r0 ? 1 : (r1 == r0 ? 0 : -1))
            if (r2 <= 0) goto L86
            int r2 = (r9 > r0 ? 1 : (r9 == r0 ? 0 : -1))
            if (r2 <= 0) goto L86
            if (r5 != r4) goto L71
            float r9 = r9 / r1
            float r9 = java.lang.Math.abs(r9)     // Catch: java.lang.NumberFormatException -> L86
            goto L87
        L71:
            float r1 = r1 / r9
            float r9 = java.lang.Math.abs(r1)     // Catch: java.lang.NumberFormatException -> L86
            goto L87
        L77:
            java.lang.String r9 = r9.substring(r3)
            int r1 = r9.length()
            if (r1 <= 0) goto L86
            float r9 = java.lang.Float.parseFloat(r9)     // Catch: java.lang.NumberFormatException -> L86
            goto L87
        L86:
            r9 = r0
        L87:
            int r0 = (r9 > r0 ? 1 : (r9 == r0 ? 0 : -1))
            if (r0 <= 0) goto L8f
            r8.Y = r9
            r8.Z = r5
        L8f:
            return
        L90:
            r8.Y = r0
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.b72.K(java.lang.String):void");
    }

    public final void L(int i, int i2) {
        if (this.l) {
            return;
        }
        this.J.l(i);
        this.L.l(i2);
        this.a0 = i;
        this.W = i2 - i;
        this.l = true;
    }

    public final void M(int i, int i2) {
        if (this.m) {
            return;
        }
        this.K.l(i);
        this.M.l(i2);
        this.b0 = i;
        this.X = i2 - i;
        if (this.F) {
            this.N.l(i + this.c0);
        }
        this.m = true;
    }

    public final void N(int i) {
        this.X = i;
        int i2 = this.e0;
        if (i < i2) {
            this.X = i2;
        }
    }

    public final void O(a72 a72Var) {
        this.U[0] = a72Var;
    }

    public final void P(float f, int i, int i2, int i3) {
        this.s = i;
        this.v = i2;
        if (i3 == Integer.MAX_VALUE) {
            i3 = 0;
        }
        this.w = i3;
        this.x = f;
        if (f <= 0.0f || f >= 1.0f || i != 0) {
            return;
        }
        this.s = 2;
    }

    public final void Q(a72 a72Var) {
        this.U[1] = a72Var;
    }

    public final void R(float f, int i, int i2, int i3) {
        this.t = i;
        this.y = i2;
        if (i3 == Integer.MAX_VALUE) {
            i3 = 0;
        }
        this.z = i3;
        this.A = f;
        if (f <= 0.0f || f >= 1.0f || i != 0) {
            return;
        }
        this.t = 2;
    }

    public final void S(int i) {
        this.W = i;
        int i2 = this.d0;
        if (i < i2) {
            this.W = i2;
        }
    }

    public void T(boolean z, boolean z2) {
        int i;
        int i2;
        pr5 pr5Var = this.d;
        boolean z3 = z & pr5Var.g;
        bte bteVar = this.e;
        boolean z4 = z2 & bteVar.g;
        int i3 = pr5Var.h.g;
        int i4 = bteVar.h.g;
        int i5 = pr5Var.i.g;
        int i6 = bteVar.i.g;
        int i7 = i6 - i4;
        if (i5 - i3 < 0 || i7 < 0 || i3 == Integer.MIN_VALUE || i3 == Integer.MAX_VALUE || i4 == Integer.MIN_VALUE || i4 == Integer.MAX_VALUE || i5 == Integer.MIN_VALUE || i5 == Integer.MAX_VALUE || i6 == Integer.MIN_VALUE || i6 == Integer.MAX_VALUE) {
            i5 = 0;
            i6 = 0;
            i3 = 0;
            i4 = 0;
        }
        int i8 = i5 - i3;
        int i9 = i6 - i4;
        if (z3) {
            this.a0 = i3;
        }
        if (z4) {
            this.b0 = i4;
        }
        if (this.i0 == 8) {
            this.W = 0;
            this.X = 0;
            return;
        }
        a72[] a72VarArr = this.U;
        if (z3) {
            if (a72VarArr[0] == a72.FIXED && i8 < (i2 = this.W)) {
                i8 = i2;
            }
            this.W = i8;
            int i10 = this.d0;
            if (i8 < i10) {
                this.W = i10;
            }
        }
        if (z4) {
            if (a72VarArr[1] == a72.FIXED && i9 < (i = this.X)) {
                i9 = i;
            }
            this.X = i9;
            int i11 = this.e0;
            if (i9 < i11) {
                this.X = i11;
            }
        }
    }

    public void U(wz6 wz6Var, boolean z) {
        int i;
        int i2;
        bte bteVar;
        pr5 pr5Var;
        wz6Var.getClass();
        int iN = wz6.n(this.J);
        int iN2 = wz6.n(this.K);
        int iN3 = wz6.n(this.L);
        int iN4 = wz6.n(this.M);
        if (z && (pr5Var = this.d) != null) {
            y73 y73Var = pr5Var.h;
            if (y73Var.j) {
                y73 y73Var2 = pr5Var.i;
                if (y73Var2.j) {
                    iN = y73Var.g;
                    iN3 = y73Var2.g;
                }
            }
        }
        if (z && (bteVar = this.e) != null) {
            y73 y73Var3 = bteVar.h;
            if (y73Var3.j) {
                y73 y73Var4 = bteVar.i;
                if (y73Var4.j) {
                    iN2 = y73Var3.g;
                    iN4 = y73Var4.g;
                }
            }
        }
        int i3 = iN4 - iN2;
        if (iN3 - iN < 0 || i3 < 0 || iN == Integer.MIN_VALUE || iN == Integer.MAX_VALUE || iN2 == Integer.MIN_VALUE || iN2 == Integer.MAX_VALUE || iN3 == Integer.MIN_VALUE || iN3 == Integer.MAX_VALUE || iN4 == Integer.MIN_VALUE || iN4 == Integer.MAX_VALUE) {
            iN = 0;
            iN2 = 0;
            iN3 = 0;
            iN4 = 0;
        }
        int i4 = iN3 - iN;
        int i5 = iN4 - iN2;
        this.a0 = iN;
        this.b0 = iN2;
        if (this.i0 == 8) {
            this.W = 0;
            this.X = 0;
            return;
        }
        a72[] a72VarArr = this.U;
        a72 a72Var = a72VarArr[0];
        a72 a72Var2 = a72.FIXED;
        if (a72Var == a72Var2 && i4 < (i2 = this.W)) {
            i4 = i2;
        }
        if (a72VarArr[1] == a72Var2 && i5 < (i = this.X)) {
            i5 = i;
        }
        this.W = i4;
        this.X = i5;
        int i6 = this.e0;
        if (i5 < i6) {
            this.X = i6;
        }
        int i7 = this.d0;
        if (i4 < i7) {
            this.W = i7;
        } else {
            i7 = i4;
        }
        int i8 = this.w;
        if (i8 > 0 && a72Var == a72.MATCH_CONSTRAINT) {
            this.W = Math.min(i7, i8);
        }
        int i9 = this.z;
        if (i9 > 0 && a72VarArr[1] == a72.MATCH_CONSTRAINT) {
            this.X = Math.min(this.X, i9);
        }
        int i10 = this.W;
        if (i4 != i10) {
            this.h = i10;
        }
        int i11 = this.X;
        if (i5 != i11) {
            this.i = i11;
        }
    }

    public final void a() {
        l52 l52Var = this.J;
        ArrayList arrayList = this.S;
        arrayList.add(l52Var);
        arrayList.add(this.K);
        arrayList.add(this.L);
        arrayList.add(this.M);
        arrayList.add(this.O);
        arrayList.add(this.P);
        arrayList.add(this.Q);
        arrayList.add(this.N);
    }

    public final void b(c72 c72Var, wz6 wz6Var, HashSet hashSet, int i, boolean z) {
        if (z) {
            if (!hashSet.contains(this)) {
                return;
            }
            bgf.v(c72Var, wz6Var, this);
            hashSet.remove(this);
            c(wz6Var, c72Var.c0(64));
        }
        if (i == 0) {
            HashSet hashSet2 = this.J.a;
            if (hashSet2 != null) {
                Iterator it2 = hashSet2.iterator();
                while (it2.hasNext()) {
                    ((l52) it2.next()).d.b(c72Var, wz6Var, hashSet, i, true);
                }
            }
            HashSet hashSet3 = this.L.a;
            if (hashSet3 != null) {
                Iterator it3 = hashSet3.iterator();
                while (it3.hasNext()) {
                    ((l52) it3.next()).d.b(c72Var, wz6Var, hashSet, i, true);
                }
                return;
            }
            return;
        }
        HashSet hashSet4 = this.K.a;
        if (hashSet4 != null) {
            Iterator it4 = hashSet4.iterator();
            while (it4.hasNext()) {
                ((l52) it4.next()).d.b(c72Var, wz6Var, hashSet, i, true);
            }
        }
        HashSet hashSet5 = this.M.a;
        if (hashSet5 != null) {
            Iterator it5 = hashSet5.iterator();
            while (it5.hasNext()) {
                ((l52) it5.next()).d.b(c72Var, wz6Var, hashSet, i, true);
            }
        }
        HashSet hashSet6 = this.N.a;
        if (hashSet6 != null) {
            Iterator it6 = hashSet6.iterator();
            while (it6.hasNext()) {
                ((l52) it6.next()).d.b(c72Var, wz6Var, hashSet, i, true);
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:122:0x0203  */
    /* JADX WARN: Removed duplicated region for block: B:126:0x020b  */
    /* JADX WARN: Removed duplicated region for block: B:129:0x0214  */
    /* JADX WARN: Removed duplicated region for block: B:158:0x0286  */
    /* JADX WARN: Removed duplicated region for block: B:162:0x0295  */
    /* JADX WARN: Removed duplicated region for block: B:165:0x029e  */
    /* JADX WARN: Removed duplicated region for block: B:166:0x02a1  */
    /* JADX WARN: Removed duplicated region for block: B:169:0x02b1  */
    /* JADX WARN: Removed duplicated region for block: B:171:0x02b8  */
    /* JADX WARN: Removed duplicated region for block: B:174:0x02bf  */
    /* JADX WARN: Removed duplicated region for block: B:176:0x02c4  */
    /* JADX WARN: Removed duplicated region for block: B:179:0x02e3  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0065  */
    /* JADX WARN: Removed duplicated region for block: B:274:0x03fa  */
    /* JADX WARN: Removed duplicated region for block: B:278:0x0412 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:281:0x0418  */
    /* JADX WARN: Removed duplicated region for block: B:283:0x041b A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:287:0x0424  */
    /* JADX WARN: Removed duplicated region for block: B:290:0x042d  */
    /* JADX WARN: Removed duplicated region for block: B:293:0x0434  */
    /* JADX WARN: Removed duplicated region for block: B:295:0x0438  */
    /* JADX WARN: Removed duplicated region for block: B:298:0x0454  */
    /* JADX WARN: Removed duplicated region for block: B:334:0x0543  */
    /* JADX WARN: Removed duplicated region for block: B:336:0x0559  */
    /* JADX WARN: Removed duplicated region for block: B:352:0x05aa  */
    /* JADX WARN: Removed duplicated region for block: B:355:0x05ba  */
    /* JADX WARN: Removed duplicated region for block: B:357:0x05bd  */
    /* JADX WARN: Removed duplicated region for block: B:379:0x05f3  */
    /* JADX WARN: Removed duplicated region for block: B:394:0x067f  */
    /* JADX WARN: Removed duplicated region for block: B:396:0x0685  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0095  */
    /* JADX WARN: Removed duplicated region for block: B:402:0x06e1  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x009f  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00a1  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00fe  */
    /* JADX WARN: Type inference failed for: r10v20 */
    /* JADX WARN: Type inference failed for: r10v25 */
    /* JADX WARN: Type inference failed for: r10v26 */
    /* JADX WARN: Type inference failed for: r12v22 */
    /* JADX WARN: Type inference failed for: r12v23 */
    /* JADX WARN: Type inference failed for: r12v34 */
    /* JADX WARN: Type inference failed for: r12v7, types: [boolean] */
    /* JADX WARN: Type inference failed for: r17v8, types: [boolean] */
    /* JADX WARN: Type inference failed for: r17v9, types: [boolean] */
    /* JADX WARN: Type inference failed for: r18v0 */
    /* JADX WARN: Type inference failed for: r18v1, types: [boolean] */
    /* JADX WARN: Type inference failed for: r18v2 */
    /* JADX WARN: Type inference failed for: r19v10 */
    /* JADX WARN: Type inference failed for: r19v14 */
    /* JADX WARN: Type inference failed for: r19v15 */
    /* JADX WARN: Type inference failed for: r19v4 */
    /* JADX WARN: Type inference failed for: r19v5 */
    /* JADX WARN: Type inference failed for: r19v8 */
    /* JADX WARN: Type inference failed for: r19v9, types: [boolean] */
    /* JADX WARN: Type inference failed for: r20v3, types: [boolean] */
    /* JADX WARN: Type inference failed for: r27v3 */
    /* JADX WARN: Type inference failed for: r27v4, types: [boolean] */
    /* JADX WARN: Type inference failed for: r27v6 */
    /* JADX WARN: Type inference failed for: r27v7 */
    /* JADX WARN: Type inference failed for: r27v8 */
    /* JADX WARN: Type inference failed for: r3v16, types: [boolean] */
    /* JADX WARN: Type inference failed for: r3v18 */
    /* JADX WARN: Type inference failed for: r3v19 */
    /* JADX WARN: Type inference failed for: r3v2 */
    /* JADX WARN: Type inference failed for: r4v20, types: [boolean] */
    /* JADX WARN: Type inference failed for: r4v21 */
    /* JADX WARN: Type inference failed for: r4v22, types: [boolean] */
    /* JADX WARN: Type inference failed for: r4v24 */
    /* JADX WARN: Type inference failed for: r4v4 */
    /* JADX WARN: Type inference failed for: r60v0, types: [b72] */
    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void c(defpackage.wz6 r61, boolean r62) {
        /*
            Method dump skipped, instruction units count: 1944
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.b72.c(wz6, boolean):void");
    }

    public boolean d() {
        return this.i0 != 8;
    }

    /* JADX WARN: Removed duplicated region for block: B:218:0x03b8 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:221:0x03c1  */
    /* JADX WARN: Removed duplicated region for block: B:223:0x03c5  */
    /* JADX WARN: Removed duplicated region for block: B:232:0x03ff  */
    /* JADX WARN: Removed duplicated region for block: B:241:0x041c  */
    /* JADX WARN: Removed duplicated region for block: B:258:0x044f  */
    /* JADX WARN: Removed duplicated region for block: B:260:0x0455  */
    /* JADX WARN: Removed duplicated region for block: B:288:0x0490 A[PHI: r0
      0x0490: PHI (r0v16 int) = (r0v15 int), (r0v20 int), (r0v20 int), (r0v20 int) binds: [B:281:0x0480, B:283:0x0486, B:284:0x0488, B:286:0x048c] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:291:0x04a2  */
    /* JADX WARN: Removed duplicated region for block: B:304:0x04c3  */
    /* JADX WARN: Removed duplicated region for block: B:309:0x04d1 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:338:0x0520  */
    /* JADX WARN: Removed duplicated region for block: B:346:? A[ADDED_TO_REGION, RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void e(defpackage.wz6 r30, boolean r31, boolean r32, boolean r33, boolean r34, defpackage.gkc r35, defpackage.gkc r36, defpackage.a72 r37, boolean r38, defpackage.l52 r39, defpackage.l52 r40, int r41, int r42, int r43, int r44, float r45, boolean r46, boolean r47, boolean r48, boolean r49, boolean r50, int r51, int r52, int r53, int r54, float r55, boolean r56) {
        /*
            Method dump skipped, instruction units count: 1322
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.b72.e(wz6, boolean, boolean, boolean, boolean, gkc, gkc, a72, boolean, l52, l52, int, int, int, int, float, boolean, boolean, boolean, boolean, boolean, int, int, int, int, float, boolean):void");
    }

    public final void f(k52 k52Var, b72 b72Var, k52 k52Var2, int i) {
        k52 k52Var3;
        k52 k52Var4;
        boolean z;
        k52 k52Var5 = k52.CENTER;
        if (k52Var == k52Var5) {
            if (k52Var2 != k52Var5) {
                k52 k52Var6 = k52.LEFT;
                if (k52Var2 == k52Var6 || k52Var2 == k52.RIGHT) {
                    f(k52Var6, b72Var, k52Var2, 0);
                    f(k52.RIGHT, b72Var, k52Var2, 0);
                    j(k52Var5).a(b72Var.j(k52Var2), 0);
                    return;
                }
                k52 k52Var7 = k52.TOP;
                if (k52Var2 == k52Var7 || k52Var2 == k52.BOTTOM) {
                    f(k52Var7, b72Var, k52Var2, 0);
                    f(k52.BOTTOM, b72Var, k52Var2, 0);
                    j(k52Var5).a(b72Var.j(k52Var2), 0);
                    return;
                }
                return;
            }
            k52 k52Var8 = k52.LEFT;
            l52 l52VarJ = j(k52Var8);
            k52 k52Var9 = k52.RIGHT;
            l52 l52VarJ2 = j(k52Var9);
            k52 k52Var10 = k52.TOP;
            l52 l52VarJ3 = j(k52Var10);
            k52 k52Var11 = k52.BOTTOM;
            l52 l52VarJ4 = j(k52Var11);
            boolean z2 = true;
            if ((l52VarJ == null || !l52VarJ.h()) && (l52VarJ2 == null || !l52VarJ2.h())) {
                f(k52Var8, b72Var, k52Var8, 0);
                f(k52Var9, b72Var, k52Var9, 0);
                z = true;
            } else {
                z = false;
            }
            if ((l52VarJ3 == null || !l52VarJ3.h()) && (l52VarJ4 == null || !l52VarJ4.h())) {
                f(k52Var10, b72Var, k52Var10, 0);
                f(k52Var11, b72Var, k52Var11, 0);
            } else {
                z2 = false;
            }
            if (z && z2) {
                j(k52Var5).a(b72Var.j(k52Var5), 0);
                return;
            }
            if (z) {
                k52 k52Var12 = k52.CENTER_X;
                j(k52Var12).a(b72Var.j(k52Var12), 0);
                return;
            } else {
                if (z2) {
                    k52 k52Var13 = k52.CENTER_Y;
                    j(k52Var13).a(b72Var.j(k52Var13), 0);
                    return;
                }
                return;
            }
        }
        k52 k52Var14 = k52.CENTER_X;
        if (k52Var == k52Var14 && (k52Var2 == (k52Var4 = k52.LEFT) || k52Var2 == k52.RIGHT)) {
            l52 l52VarJ5 = j(k52Var4);
            l52 l52VarJ6 = b72Var.j(k52Var2);
            l52 l52VarJ7 = j(k52.RIGHT);
            l52VarJ5.a(l52VarJ6, 0);
            l52VarJ7.a(l52VarJ6, 0);
            j(k52Var14).a(l52VarJ6, 0);
            return;
        }
        k52 k52Var15 = k52.CENTER_Y;
        if (k52Var == k52Var15 && (k52Var2 == (k52Var3 = k52.TOP) || k52Var2 == k52.BOTTOM)) {
            l52 l52VarJ8 = b72Var.j(k52Var2);
            j(k52Var3).a(l52VarJ8, 0);
            j(k52.BOTTOM).a(l52VarJ8, 0);
            j(k52Var15).a(l52VarJ8, 0);
            return;
        }
        if (k52Var == k52Var14 && k52Var2 == k52Var14) {
            k52 k52Var16 = k52.LEFT;
            j(k52Var16).a(b72Var.j(k52Var16), 0);
            k52 k52Var17 = k52.RIGHT;
            j(k52Var17).a(b72Var.j(k52Var17), 0);
            j(k52Var14).a(b72Var.j(k52Var2), 0);
            return;
        }
        if (k52Var == k52Var15 && k52Var2 == k52Var15) {
            k52 k52Var18 = k52.TOP;
            j(k52Var18).a(b72Var.j(k52Var18), 0);
            k52 k52Var19 = k52.BOTTOM;
            j(k52Var19).a(b72Var.j(k52Var19), 0);
            j(k52Var15).a(b72Var.j(k52Var2), 0);
            return;
        }
        l52 l52VarJ9 = j(k52Var);
        l52 l52VarJ10 = b72Var.j(k52Var2);
        if (l52VarJ9.i(l52VarJ10)) {
            k52 k52Var20 = k52.BASELINE;
            if (k52Var == k52Var20) {
                l52 l52VarJ11 = j(k52.TOP);
                l52 l52VarJ12 = j(k52.BOTTOM);
                if (l52VarJ11 != null) {
                    l52VarJ11.j();
                }
                if (l52VarJ12 != null) {
                    l52VarJ12.j();
                }
            } else if (k52Var == k52.TOP || k52Var == k52.BOTTOM) {
                l52 l52VarJ13 = j(k52Var20);
                if (l52VarJ13 != null) {
                    l52VarJ13.j();
                }
                l52 l52VarJ14 = j(k52Var5);
                if (l52VarJ14.f != l52VarJ10) {
                    l52VarJ14.j();
                }
                l52 l52VarF = j(k52Var).f();
                l52 l52VarJ15 = j(k52Var15);
                if (l52VarJ15.h()) {
                    l52VarF.j();
                    l52VarJ15.j();
                }
            } else if (k52Var == k52.LEFT || k52Var == k52.RIGHT) {
                l52 l52VarJ16 = j(k52Var5);
                if (l52VarJ16.f != l52VarJ10) {
                    l52VarJ16.j();
                }
                l52 l52VarF2 = j(k52Var).f();
                l52 l52VarJ17 = j(k52Var14);
                if (l52VarJ17.h()) {
                    l52VarF2.j();
                    l52VarJ17.j();
                }
            }
            l52VarJ9.a(l52VarJ10, i);
        }
    }

    public final void g(l52 l52Var, l52 l52Var2, int i) {
        if (l52Var.d == this) {
            f(l52Var.e, l52Var2.d, l52Var2.e, i);
        }
    }

    public final void h(wz6 wz6Var) {
        wz6Var.k(this.J);
        wz6Var.k(this.K);
        wz6Var.k(this.L);
        wz6Var.k(this.M);
        if (this.c0 > 0) {
            wz6Var.k(this.N);
        }
    }

    public final void i() {
        if (this.d == null) {
            pr5 pr5Var = new pr5(this);
            pr5Var.h.e = x73.LEFT;
            pr5Var.i.e = x73.RIGHT;
            pr5Var.f = 0;
            this.d = pr5Var;
        }
        if (this.e == null) {
            bte bteVar = new bte(this);
            y73 y73Var = new y73(bteVar);
            bteVar.k = y73Var;
            bteVar.l = null;
            bteVar.h.e = x73.TOP;
            bteVar.i.e = x73.BOTTOM;
            y73Var.e = x73.BASELINE;
            bteVar.f = 1;
            this.e = bteVar;
        }
    }

    public l52 j(k52 k52Var) {
        switch (z62.a[k52Var.ordinal()]) {
            case 1:
                return this.J;
            case 2:
                return this.K;
            case 3:
                return this.L;
            case 4:
                return this.M;
            case 5:
                return this.N;
            case 6:
                return this.Q;
            case 7:
                return this.O;
            case 8:
                return this.P;
            default:
                ay0.d(k52Var.name());
            case 9:
                return null;
        }
    }

    public final a72 k(int i) {
        a72[] a72VarArr = this.U;
        if (i == 0) {
            return a72VarArr[0];
        }
        if (i == 1) {
            return a72VarArr[1];
        }
        return null;
    }

    public final int l() {
        if (this.i0 == 8) {
            return 0;
        }
        return this.X;
    }

    public final b72 m(int i) {
        l52 l52Var;
        l52 l52Var2;
        if (i != 0) {
            if (i == 1 && (l52Var2 = (l52Var = this.M).f) != null && l52Var2.f == l52Var) {
                return l52Var2.d;
            }
            return null;
        }
        l52 l52Var3 = this.L;
        l52 l52Var4 = l52Var3.f;
        if (l52Var4 == null || l52Var4.f != l52Var3) {
            return null;
        }
        return l52Var4.d;
    }

    public final b72 n(int i) {
        l52 l52Var;
        l52 l52Var2;
        if (i != 0) {
            if (i == 1 && (l52Var2 = (l52Var = this.K).f) != null && l52Var2.f == l52Var) {
                return l52Var2.d;
            }
            return null;
        }
        l52 l52Var3 = this.J;
        l52 l52Var4 = l52Var3.f;
        if (l52Var4 == null || l52Var4.f != l52Var3) {
            return null;
        }
        return l52Var4.d;
    }

    public void o(StringBuilder sb) {
        sb.append("  " + this.k + ":{\n");
        StringBuilder sb2 = new StringBuilder("    actualWidth:");
        sb2.append(this.W);
        sb.append(sb2.toString());
        sb.append("\n");
        sb.append("    actualHeight:" + this.X);
        sb.append("\n");
        sb.append("    actualLeft:" + this.a0);
        sb.append("\n");
        sb.append("    actualTop:" + this.b0);
        sb.append("\n");
        q(sb, "left", this.J);
        q(sb, "top", this.K);
        q(sb, "right", this.L);
        q(sb, "bottom", this.M);
        q(sb, "baseline", this.N);
        q(sb, "centerX", this.O);
        q(sb, "centerY", this.P);
        int i = this.W;
        int i2 = this.d0;
        int[] iArr = this.D;
        int i3 = iArr[0];
        int i4 = this.v;
        int i5 = this.s;
        float f = this.x;
        a72[] a72VarArr = this.U;
        a72 a72Var = a72VarArr[0];
        float[] fArr = this.m0;
        float f2 = fArr[0];
        p(sb, "    width", i, i2, i3, i4, i5, f, a72Var);
        int i6 = this.X;
        int i7 = this.e0;
        int i8 = iArr[1];
        int i9 = this.y;
        int i10 = this.t;
        float f3 = this.A;
        a72 a72Var2 = a72VarArr[1];
        float f4 = fArr[1];
        p(sb, "    height", i6, i7, i8, i9, i10, f3, a72Var2);
        float f5 = this.Y;
        int i11 = this.Z;
        if (f5 != 0.0f) {
            sb.append("    dimensionRatio");
            sb.append(" :  [");
            sb.append(f5);
            sb.append(",");
            sb.append(i11);
            sb.append("");
            sb.append("],\n");
        }
        I(sb, "    horizontalBias", this.f0, 0.5f);
        I(sb, "    verticalBias", this.g0, 0.5f);
        H(this.k0, 0, "    horizontalChainStyle", sb);
        H(this.l0, 0, "    verticalChainStyle", sb);
        sb.append("  }");
    }

    public final int r() {
        if (this.i0 == 8) {
            return 0;
        }
        return this.W;
    }

    public final int s() {
        c72 c72Var = this.V;
        return c72Var != null ? c72Var.y0 + this.a0 : this.a0;
    }

    public final int t() {
        c72 c72Var = this.V;
        return c72Var != null ? c72Var.z0 + this.b0 : this.b0;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("");
        sb.append(this.j0 != null ? ka1.v(new StringBuilder("id: "), this.j0, " ") : "");
        sb.append("(");
        sb.append(this.a0);
        sb.append(", ");
        sb.append(this.b0);
        sb.append(") - (");
        sb.append(this.W);
        sb.append(" x ");
        return ho2.H(sb, this.X, ")");
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x003a A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:30:0x003b A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean u(int r5) {
        /*
            r4 = this;
            r0 = 2
            r1 = 0
            r2 = 1
            if (r5 != 0) goto L1b
            l52 r5 = r4.J
            l52 r5 = r5.f
            if (r5 == 0) goto Ld
            r5 = r2
            goto Le
        Ld:
            r5 = r1
        Le:
            l52 r4 = r4.L
            l52 r4 = r4.f
            if (r4 == 0) goto L16
            r4 = r2
            goto L17
        L16:
            r4 = r1
        L17:
            int r5 = r5 + r4
            if (r5 >= r0) goto L3b
            goto L3a
        L1b:
            l52 r5 = r4.K
            l52 r5 = r5.f
            if (r5 == 0) goto L23
            r5 = r2
            goto L24
        L23:
            r5 = r1
        L24:
            l52 r3 = r4.M
            l52 r3 = r3.f
            if (r3 == 0) goto L2c
            r3 = r2
            goto L2d
        L2c:
            r3 = r1
        L2d:
            int r5 = r5 + r3
            l52 r4 = r4.N
            l52 r4 = r4.f
            if (r4 == 0) goto L36
            r4 = r2
            goto L37
        L36:
            r4 = r1
        L37:
            int r5 = r5 + r4
            if (r5 >= r0) goto L3b
        L3a:
            return r2
        L3b:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.b72.u(int):boolean");
    }

    public final boolean v(int i, int i2) {
        l52 l52Var;
        l52 l52Var2;
        l52 l52Var3;
        l52 l52Var4;
        if (i == 0) {
            l52 l52Var5 = this.J;
            l52 l52Var6 = l52Var5.f;
            if (l52Var6 == null || !l52Var6.c || (l52Var4 = (l52Var3 = this.L).f) == null || !l52Var4.c) {
                return false;
            }
            return (l52Var4.d() - l52Var3.e()) - (l52Var5.e() + l52Var5.f.d()) >= i2;
        }
        l52 l52Var7 = this.K;
        l52 l52Var8 = l52Var7.f;
        if (l52Var8 == null || !l52Var8.c || (l52Var2 = (l52Var = this.M).f) == null || !l52Var2.c) {
            return false;
        }
        return (l52Var2.d() - l52Var.e()) - (l52Var7.e() + l52Var7.f.d()) >= i2;
    }

    public final void w(k52 k52Var, b72 b72Var, k52 k52Var2, int i, int i2) {
        j(k52Var).b(b72Var.j(k52Var2), i, i2, true);
    }

    public final boolean x(int i) {
        l52 l52Var;
        l52 l52Var2;
        int i2 = i * 2;
        l52[] l52VarArr = this.R;
        l52 l52Var3 = l52VarArr[i2];
        l52 l52Var4 = l52Var3.f;
        return (l52Var4 == null || l52Var4.f == l52Var3 || (l52Var2 = (l52Var = l52VarArr[i2 + 1]).f) == null || l52Var2.f != l52Var) ? false : true;
    }

    public final boolean y() {
        l52 l52Var = this.J;
        l52 l52Var2 = l52Var.f;
        if (l52Var2 != null && l52Var2.f == l52Var) {
            return true;
        }
        l52 l52Var3 = this.L;
        l52 l52Var4 = l52Var3.f;
        return l52Var4 != null && l52Var4.f == l52Var3;
    }

    public final boolean z() {
        l52 l52Var = this.K;
        l52 l52Var2 = l52Var.f;
        if (l52Var2 != null && l52Var2.f == l52Var) {
            return true;
        }
        l52 l52Var3 = this.M;
        l52 l52Var4 = l52Var3.f;
        return l52Var4 != null && l52Var4.f == l52Var3;
    }

    public static void p(StringBuilder sb, String str, int i, int i2, int i3, int i4, int i5, float f, a72 a72Var) {
        sb.append(str);
        sb.append(" :  {\n");
        String string = a72Var.toString();
        if (!a72.FIXED.toString().equals(string)) {
            ka1.C(sb, "      behavior", " :   ", string, ",\n");
        }
        H(i, 0, "      size", sb);
        H(i2, 0, "      min", sb);
        H(i3, Integer.MAX_VALUE, AXoTRPEGKEve.caHQjrRrSTsp, sb);
        H(i4, 0, "      matchMin", sb);
        H(i5, 0, "      matchDef", sb);
        I(sb, "      matchPercent", f, 1.0f);
        sb.append("    },\n");
    }

    public b72(int i, int i2) {
        this.a = false;
        this.d = null;
        this.e = null;
        this.f = new boolean[]{true, true};
        this.g = true;
        this.h = -1;
        this.i = -1;
        this.j = new i3f(this);
        this.l = false;
        this.m = false;
        this.n = false;
        this.o = false;
        this.p = -1;
        this.q = -1;
        this.r = 0;
        this.s = 0;
        this.t = 0;
        this.u = new int[2];
        this.v = 0;
        this.w = 0;
        this.x = 1.0f;
        this.y = 0;
        this.z = 0;
        this.A = 1.0f;
        this.B = -1;
        this.C = 1.0f;
        this.D = new int[]{Integer.MAX_VALUE, Integer.MAX_VALUE};
        this.E = Float.NaN;
        this.F = false;
        this.G = false;
        this.H = 0;
        this.I = 0;
        l52 l52Var = new l52(this, k52.LEFT);
        this.J = l52Var;
        l52 l52Var2 = new l52(this, k52.TOP);
        this.K = l52Var2;
        l52 l52Var3 = new l52(this, k52.RIGHT);
        this.L = l52Var3;
        l52 l52Var4 = new l52(this, k52.BOTTOM);
        this.M = l52Var4;
        l52 l52Var5 = new l52(this, k52.BASELINE);
        this.N = l52Var5;
        this.O = new l52(this, k52.CENTER_X);
        this.P = new l52(this, k52.CENTER_Y);
        l52 l52Var6 = new l52(this, k52.CENTER);
        this.Q = l52Var6;
        this.R = new l52[]{l52Var, l52Var3, l52Var2, l52Var4, l52Var5, l52Var6};
        this.S = new ArrayList();
        this.T = new boolean[2];
        a72 a72Var = a72.FIXED;
        this.U = new a72[]{a72Var, a72Var};
        this.V = null;
        this.Y = 0.0f;
        this.Z = -1;
        this.c0 = 0;
        this.f0 = 0.5f;
        this.g0 = 0.5f;
        this.i0 = 0;
        this.j0 = null;
        this.k0 = 0;
        this.l0 = 0;
        this.m0 = new float[]{-1.0f, -1.0f};
        this.n0 = new b72[]{null, null};
        this.o0 = new b72[]{null, null};
        this.p0 = -1;
        this.q0 = -1;
        this.a0 = 0;
        this.b0 = 0;
        this.W = i;
        this.X = i2;
        a();
    }
}
