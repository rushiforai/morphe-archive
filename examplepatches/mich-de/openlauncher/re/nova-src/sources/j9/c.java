package j9;

import android.util.SparseIntArray;
import com.android.gallery3d.exif.ExifInvalidFormatException;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.nio.ByteOrder;
import java.nio.charset.Charset;
import java.util.HashSet;

/* loaded from: classes2.dex */
public final class c {
    public static final int A;
    public static final int A0;
    public static final int B;
    public static final int B0;
    public static final int C;
    public static final int C0;
    public static final int D;
    public static final int D0;
    public static final int E;
    public static final int E0;
    public static final int F;
    public static final int F0;
    public static final int G;
    public static final int G0;
    public static final int H;
    public static final int H0;
    public static final int I;
    public static final int I0;
    public static final int J;
    public static final int J0;
    public static final int K;
    public static final int K0;
    public static final int L;
    public static final int L0;
    public static final int M;
    public static final int M0;
    public static final int N;
    public static final int N0;
    public static final int O;
    public static final int O0;
    public static final int P;
    public static final int P0;
    public static final int Q;
    public static final int Q0;
    public static final int R;
    public static final int R0;
    public static final int S;
    public static final int S0;
    public static final int T;
    public static final int T0;
    public static final int U;
    public static final int U0;
    public static final int V;
    public static final int V0;
    public static final int W;
    public static final int W0;
    public static final int X;
    public static final int X0;
    public static final int Y;
    public static final int Y0;
    public static final int Z;
    public static final int Z0;

    /* renamed from: a0, reason: collision with root package name */
    public static final int f69163a0;

    /* renamed from: a1, reason: collision with root package name */
    public static final int f69164a1;

    /* renamed from: b0, reason: collision with root package name */
    public static final int f69165b0;

    /* renamed from: b1, reason: collision with root package name */
    public static final int f69166b1;

    /* renamed from: c0, reason: collision with root package name */
    public static final int f69168c0;

    /* renamed from: c1, reason: collision with root package name */
    public static final int f69169c1;

    /* renamed from: d0, reason: collision with root package name */
    public static final int f69171d0;

    /* renamed from: d1, reason: collision with root package name */
    public static final int f69172d1;

    /* renamed from: e0, reason: collision with root package name */
    public static final int f69174e0;

    /* renamed from: e1, reason: collision with root package name */
    public static final int f69175e1;

    /* renamed from: f0, reason: collision with root package name */
    public static final int f69177f0;

    /* renamed from: f1, reason: collision with root package name */
    public static final int f69178f1;

    /* renamed from: g0, reason: collision with root package name */
    public static final int f69180g0;
    public static final int g1;

    /* renamed from: h0, reason: collision with root package name */
    public static final int f69182h0;
    public static final int h1;

    /* renamed from: i0, reason: collision with root package name */
    public static final int f69184i0;
    public static final int i1;

    /* renamed from: j0, reason: collision with root package name */
    public static final int f69186j0;

    /* renamed from: j1, reason: collision with root package name */
    public static final int f69187j1;

    /* renamed from: k, reason: collision with root package name */
    public static final int f69188k;

    /* renamed from: k0, reason: collision with root package name */
    public static final int f69189k0;

    /* renamed from: k1, reason: collision with root package name */
    public static final int f69190k1;

    /* renamed from: l, reason: collision with root package name */
    public static final int f69191l;

    /* renamed from: l0, reason: collision with root package name */
    public static final int f69192l0;

    /* renamed from: l1, reason: collision with root package name */
    public static final int f69193l1;

    /* renamed from: m, reason: collision with root package name */
    public static final int f69194m;

    /* renamed from: m0, reason: collision with root package name */
    public static final int f69195m0;

    /* renamed from: m1, reason: collision with root package name */
    public static final int f69196m1;
    public static final int n;

    /* renamed from: n0, reason: collision with root package name */
    public static final int f69197n0;

    /* renamed from: n1, reason: collision with root package name */
    public static final int f69198n1;
    public static final int o;

    /* renamed from: o0, reason: collision with root package name */
    public static final int f69199o0;

    /* renamed from: o1, reason: collision with root package name */
    public static final int f69200o1;

    /* renamed from: p, reason: collision with root package name */
    public static final int f69201p;

    /* renamed from: p0, reason: collision with root package name */
    public static final int f69202p0;

    /* renamed from: p1, reason: collision with root package name */
    public static final int f69203p1;

    /* renamed from: q, reason: collision with root package name */
    public static final int f69204q;

    /* renamed from: q0, reason: collision with root package name */
    public static final int f69205q0;

    /* renamed from: q1, reason: collision with root package name */
    public static final int f69206q1;

    /* renamed from: r, reason: collision with root package name */
    public static final int f69207r;

    /* renamed from: r0, reason: collision with root package name */
    public static final int f69208r0;

    /* renamed from: r1, reason: collision with root package name */
    public static final HashSet f69209r1;

    /* renamed from: s, reason: collision with root package name */
    public static final int f69210s;

    /* renamed from: s0, reason: collision with root package name */
    public static final int f69211s0;

    /* renamed from: s1, reason: collision with root package name */
    public static final ByteOrder f69212s1;

    /* renamed from: t, reason: collision with root package name */
    public static final int f69213t;

    /* renamed from: t0, reason: collision with root package name */
    public static final int f69214t0;

    /* renamed from: u, reason: collision with root package name */
    public static final int f69215u;

    /* renamed from: u0, reason: collision with root package name */
    public static final int f69216u0;

    /* renamed from: v, reason: collision with root package name */
    public static final int f69217v;

    /* renamed from: v0, reason: collision with root package name */
    public static final int f69218v0;

    /* renamed from: w, reason: collision with root package name */
    public static final int f69219w;

    /* renamed from: w0, reason: collision with root package name */
    public static final int f69220w0;

    /* renamed from: x, reason: collision with root package name */
    public static final int f69221x;

    /* renamed from: x0, reason: collision with root package name */
    public static final int f69222x0;

    /* renamed from: y, reason: collision with root package name */
    public static final int f69223y;

    /* renamed from: y0, reason: collision with root package name */
    public static final int f69224y0;

    /* renamed from: z, reason: collision with root package name */
    public static final int f69225z;

    /* renamed from: z0, reason: collision with root package name */
    public static final int f69226z0;

    /* renamed from: a, reason: collision with root package name */
    public b f69227a = new b(f69212s1);

    /* renamed from: b, reason: collision with root package name */
    public SparseIntArray f69228b = null;

    /* renamed from: c, reason: collision with root package name */
    public static final int f69167c = a(0, 256);

    /* renamed from: d, reason: collision with root package name */
    public static final int f69170d = a(0, 257);

    /* renamed from: e, reason: collision with root package name */
    public static final int f69173e = a(0, 258);

    /* renamed from: f, reason: collision with root package name */
    public static final int f69176f = a(0, 259);

    /* renamed from: g, reason: collision with root package name */
    public static final int f69179g = a(0, 262);

    /* renamed from: h, reason: collision with root package name */
    public static final int f69181h = a(0, 270);

    /* renamed from: i, reason: collision with root package name */
    public static final int f69183i = a(0, 271);

    /* renamed from: j, reason: collision with root package name */
    public static final int f69185j = a(0, 272);

    static {
        int iA = a(0, (short) 273);
        f69188k = iA;
        f69191l = a(0, (short) 274);
        f69194m = a(0, (short) 277);
        n = a(0, (short) 278);
        int iA2 = a(0, (short) 279);
        o = iA2;
        f69201p = a(0, (short) 282);
        f69204q = a(0, (short) 283);
        f69207r = a(0, (short) 284);
        f69210s = a(0, (short) 296);
        f69213t = a(0, (short) 301);
        f69215u = a(0, (short) 305);
        f69217v = a(0, (short) 306);
        f69219w = a(0, (short) 315);
        f69221x = a(0, (short) 318);
        f69223y = a(0, (short) 319);
        f69225z = a(0, (short) 529);
        A = a(0, (short) 530);
        B = a(0, (short) 531);
        C = a(0, (short) 532);
        D = a(0, (short) -32104);
        int iA3 = a(0, (short) -30871);
        E = iA3;
        int iA4 = a(0, (short) -30683);
        F = iA4;
        int iA5 = a(1, (short) 513);
        G = iA5;
        int iA6 = a(1, (short) 514);
        H = iA6;
        I = a(2, (short) -32102);
        J = a(2, (short) -32099);
        K = a(2, (short) -30686);
        L = a(2, (short) -30684);
        M = a(2, (short) -30681);
        N = a(2, (short) -30680);
        O = a(2, (short) -28672);
        P = a(2, (short) -28669);
        Q = a(2, (short) -28668);
        R = a(2, (short) -28415);
        S = a(2, (short) -28414);
        T = a(2, (short) -28159);
        U = a(2, (short) -28158);
        V = a(2, (short) -28157);
        W = a(2, (short) -28156);
        X = a(2, (short) -28155);
        Y = a(2, (short) -28154);
        Z = a(2, (short) -28153);
        f69163a0 = a(2, (short) -28152);
        f69165b0 = a(2, (short) -28151);
        f69168c0 = a(2, (short) -28150);
        f69171d0 = a(2, (short) -28140);
        f69174e0 = a(2, (short) -28036);
        f69177f0 = a(2, (short) -28026);
        f69180g0 = a(2, (short) -28016);
        f69182h0 = a(2, (short) -28015);
        f69184i0 = a(2, (short) -28014);
        f69186j0 = a(2, (short) -24576);
        f69189k0 = a(2, (short) -24575);
        f69192l0 = a(2, (short) -24574);
        f69195m0 = a(2, (short) -24573);
        f69197n0 = a(2, (short) -24572);
        int iA7 = a(2, (short) -24571);
        f69199o0 = iA7;
        f69202p0 = a(2, (short) -24053);
        f69205q0 = a(2, (short) -24052);
        f69208r0 = a(2, (short) -24050);
        f69211s0 = a(2, (short) -24049);
        f69214t0 = a(2, (short) -24048);
        f69216u0 = a(2, (short) -24044);
        f69218v0 = a(2, (short) -24043);
        f69220w0 = a(2, (short) -24041);
        f69222x0 = a(2, (short) -23808);
        f69224y0 = a(2, (short) -23807);
        f69226z0 = a(2, (short) -23806);
        A0 = a(2, (short) -23551);
        B0 = a(2, (short) -23550);
        C0 = a(2, (short) -23549);
        D0 = a(2, (short) -23548);
        E0 = a(2, (short) -23547);
        F0 = a(2, (short) -23546);
        G0 = a(2, (short) -23545);
        H0 = a(2, (short) -23544);
        I0 = a(2, (short) -23543);
        J0 = a(2, (short) -23542);
        K0 = a(2, (short) -23541);
        L0 = a(2, (short) -23540);
        M0 = a(2, (short) -23520);
        N0 = a(4, (short) 0);
        O0 = a(4, (short) 1);
        P0 = a(4, (short) 2);
        Q0 = a(4, (short) 3);
        R0 = a(4, (short) 4);
        S0 = a(4, (short) 5);
        T0 = a(4, (short) 6);
        U0 = a(4, (short) 7);
        V0 = a(4, (short) 8);
        W0 = a(4, (short) 9);
        X0 = a(4, (short) 10);
        Y0 = a(4, (short) 11);
        Z0 = a(4, (short) 12);
        f69164a1 = a(4, (short) 13);
        f69166b1 = a(4, (short) 14);
        f69169c1 = a(4, (short) 15);
        f69172d1 = a(4, (short) 16);
        f69175e1 = a(4, (short) 17);
        f69178f1 = a(4, (short) 18);
        g1 = a(4, (short) 19);
        h1 = a(4, (short) 20);
        i1 = a(4, (short) 23);
        f69187j1 = a(4, (short) 24);
        f69190k1 = a(4, (short) 25);
        f69193l1 = a(4, (short) 26);
        f69196m1 = a(4, (short) 27);
        f69198n1 = a(4, (short) 28);
        f69200o1 = a(4, (short) 29);
        f69203p1 = a(4, (short) 30);
        f69206q1 = a(3, (short) 1);
        HashSet hashSet = new HashSet();
        f69209r1 = hashSet;
        hashSet.add(Short.valueOf((short) iA4));
        hashSet.add(Short.valueOf((short) iA3));
        hashSet.add(Short.valueOf((short) iA5));
        hashSet.add(Short.valueOf((short) iA7));
        hashSet.add(Short.valueOf((short) iA));
        HashSet hashSet2 = new HashSet(hashSet);
        hashSet2.add(Short.valueOf((short) (-1)));
        hashSet2.add(Short.valueOf((short) iA6));
        hashSet2.add(Short.valueOf((short) iA2));
        f69212s1 = ByteOrder.BIG_ENDIAN;
    }

    public static int a(int i5, short s11) {
        return (i5 << 16) | (s11 & 65535);
    }

    public static int b(int[] iArr) {
        if (iArr.length == 0) {
            return 0;
        }
        int i5 = 0;
        for (int i11 = 0; i11 < 5; i11++) {
            int length = iArr.length;
            int i12 = 0;
            while (true) {
                if (i12 < length) {
                    if (i.f69266c[i11] == iArr[i12]) {
                        i5 |= 1 << i11;
                        break;
                    }
                    i12++;
                }
            }
        }
        return i5;
    }

    public final SparseIntArray c() {
        if (this.f69228b == null) {
            this.f69228b = new SparseIntArray();
            int iB = b(new int[]{0, 1}) << 24;
            SparseIntArray sparseIntArray = this.f69228b;
            int i5 = iB | SQLiteDatabase.OPEN_SHAREDCACHE;
            int i11 = f69183i;
            sparseIntArray.put(i11, i5);
            int i12 = 262144 | iB;
            int i13 = iB | 262145;
            this.f69228b.put(f69167c, i13);
            this.f69228b.put(f69170d, i13);
            this.f69228b.put(f69173e, 196611 | iB);
            int i14 = iB | 196609;
            this.f69228b.put(f69176f, i14);
            this.f69228b.put(f69179g, i14);
            this.f69228b.put(f69191l, i14);
            this.f69228b.put(f69194m, i14);
            this.f69228b.put(f69207r, i14);
            this.f69228b.put(A, iB | 196610);
            this.f69228b.put(B, i14);
            int i15 = iB | 327681;
            this.f69228b.put(f69201p, i15);
            this.f69228b.put(f69204q, i15);
            this.f69228b.put(f69210s, i14);
            this.f69228b.put(f69188k, i12);
            this.f69228b.put(n, i13);
            this.f69228b.put(o, i12);
            this.f69228b.put(f69213t, 197376 | iB);
            this.f69228b.put(f69221x, 327682 | iB);
            int i16 = 327686 | iB;
            this.f69228b.put(f69223y, i16);
            this.f69228b.put(f69225z, iB | 327683);
            this.f69228b.put(C, i16);
            this.f69228b.put(f69217v, iB | 131092);
            this.f69228b.put(f69181h, i5);
            this.f69228b.put(i11, i5);
            this.f69228b.put(f69185j, i5);
            this.f69228b.put(f69215u, i5);
            this.f69228b.put(f69219w, i5);
            this.f69228b.put(D, i5);
            this.f69228b.put(E, i13);
            this.f69228b.put(F, i13);
            int iB2 = (b(new int[]{1}) << 24) | 262145;
            this.f69228b.put(G, iB2);
            this.f69228b.put(H, iB2);
            int iB3 = b(new int[]{2}) << 24;
            int i17 = iB3 | 458752;
            int i18 = 458756 | iB3;
            this.f69228b.put(O, i18);
            this.f69228b.put(f69186j0, i18);
            int i19 = 196608 | iB3;
            int i21 = 196609 | iB3;
            this.f69228b.put(f69189k0, i21);
            this.f69228b.put(R, i18);
            int i22 = iB3 | 327681;
            this.f69228b.put(S, i22);
            int i23 = 262145 | iB3;
            this.f69228b.put(f69192l0, i23);
            this.f69228b.put(f69195m0, i23);
            this.f69228b.put(f69174e0, i17);
            this.f69228b.put(f69177f0, i17);
            SparseIntArray sparseIntArray2 = this.f69228b;
            int i24 = iB3 | SQLiteDatabase.OPEN_SHAREDCACHE;
            sparseIntArray2.put(f69197n0, 131085 | iB3);
            int i25 = iB3 | 131092;
            this.f69228b.put(P, i25);
            this.f69228b.put(Q, i25);
            this.f69228b.put(f69180g0, i24);
            this.f69228b.put(f69182h0, i24);
            this.f69228b.put(f69184i0, i24);
            this.f69228b.put(M0, 131105 | iB3);
            this.f69228b.put(I, i22);
            this.f69228b.put(J, i22);
            this.f69228b.put(K, i21);
            this.f69228b.put(L, i24);
            this.f69228b.put(M, i19);
            this.f69228b.put(N, i17);
            int i26 = 655361 | iB3;
            this.f69228b.put(T, i26);
            this.f69228b.put(U, i22);
            this.f69228b.put(V, i26);
            this.f69228b.put(W, i26);
            this.f69228b.put(X, i22);
            this.f69228b.put(Y, i22);
            this.f69228b.put(Z, i21);
            this.f69228b.put(f69163a0, i21);
            this.f69228b.put(f69165b0, i21);
            this.f69228b.put(f69168c0, i22);
            this.f69228b.put(f69171d0, i19);
            this.f69228b.put(f69202p0, i22);
            this.f69228b.put(f69205q0, i17);
            this.f69228b.put(f69208r0, i22);
            this.f69228b.put(f69211s0, i22);
            this.f69228b.put(f69214t0, i21);
            this.f69228b.put(f69216u0, iB3 | 196610);
            this.f69228b.put(f69218v0, i22);
            this.f69228b.put(f69220w0, i21);
            int i27 = iB3 | 458753;
            this.f69228b.put(f69222x0, i27);
            this.f69228b.put(f69224y0, i27);
            this.f69228b.put(f69226z0, i17);
            this.f69228b.put(A0, i21);
            this.f69228b.put(B0, i21);
            this.f69228b.put(C0, i21);
            this.f69228b.put(D0, i22);
            this.f69228b.put(E0, i21);
            this.f69228b.put(F0, i21);
            this.f69228b.put(G0, i22);
            this.f69228b.put(H0, i21);
            this.f69228b.put(I0, i21);
            this.f69228b.put(J0, i21);
            this.f69228b.put(K0, i17);
            this.f69228b.put(L0, i21);
            this.f69228b.put(f69199o0, i23);
            int iB4 = b(new int[]{4}) << 24;
            this.f69228b.put(N0, 65540 | iB4);
            SparseIntArray sparseIntArray3 = this.f69228b;
            int i28 = iB4 | SQLiteDatabase.OPEN_SHAREDCACHE;
            int i29 = 131074 | iB4;
            sparseIntArray3.put(O0, i29);
            this.f69228b.put(Q0, i29);
            int i31 = 655363 | iB4;
            this.f69228b.put(P0, i31);
            this.f69228b.put(R0, i31);
            this.f69228b.put(S0, 65537 | iB4);
            int i32 = iB4 | 327681;
            this.f69228b.put(T0, i32);
            this.f69228b.put(U0, iB4 | 327683);
            this.f69228b.put(V0, i28);
            this.f69228b.put(W0, i29);
            this.f69228b.put(X0, i29);
            this.f69228b.put(Y0, i32);
            this.f69228b.put(Z0, i29);
            this.f69228b.put(f69164a1, i32);
            this.f69228b.put(f69166b1, i29);
            this.f69228b.put(f69169c1, i32);
            this.f69228b.put(f69172d1, i29);
            this.f69228b.put(f69175e1, i32);
            this.f69228b.put(f69178f1, i28);
            this.f69228b.put(g1, i29);
            this.f69228b.put(h1, i32);
            this.f69228b.put(i1, i29);
            this.f69228b.put(f69187j1, i32);
            this.f69228b.put(f69190k1, i29);
            this.f69228b.put(f69193l1, i32);
            int i33 = iB4 | 458752;
            this.f69228b.put(f69196m1, i33);
            this.f69228b.put(f69198n1, i33);
            this.f69228b.put(f69200o1, 131083 | iB4);
            this.f69228b.put(f69203p1, iB4 | 196619);
            this.f69228b.put(f69206q1, (b(new int[]{3}) << 24) | SQLiteDatabase.OPEN_SHAREDCACHE);
        }
        return this.f69228b;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0020  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Integer d(int i5) {
        h hVar;
        Object obj;
        int[] iArr;
        int i11 = c().get(i5) == 0 ? -1 : i5 >>> 16;
        Charset charset = h.f69257h;
        if (i11 == 0 || i11 == 1 || i11 == 2 || i11 == 3 || i11 == 4) {
            short s11 = (short) i5;
            i iVar = this.f69227a.f69159a[i11];
            hVar = iVar == null ? null : (h) iVar.f69268b.get(Short.valueOf(s11));
        }
        if (hVar == null || (obj = hVar.f69264f) == null || !(obj instanceof long[])) {
            iArr = null;
        } else {
            long[] jArr = (long[]) obj;
            iArr = new int[jArr.length];
            for (int i12 = 0; i12 < jArr.length; i12++) {
                iArr[i12] = (int) jArr[i12];
            }
        }
        if (iArr == null || iArr.length <= 0) {
            return null;
        }
        return Integer.valueOf(iArr[0]);
    }

    public final void e(BufferedInputStream bufferedInputStream) throws IOException {
        try {
            this.f69227a = new gu.j(this, 28).n(bufferedInputStream);
        } catch (ExifInvalidFormatException e3) {
            throw new IOException("Invalid exif format : " + e3);
        }
    }
}
