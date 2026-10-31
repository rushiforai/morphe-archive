package g4;

import android.view.View;
import androidx.compose.ui.node.LayoutNode;
import b.c0;
import h4.k;
import h4.m;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import mg.l;

/* loaded from: classes2.dex */
public class d {
    public float A;
    public final int[] B;
    public float C;
    public boolean D;
    public boolean E;
    public int F;
    public int G;
    public final c H;
    public final c I;
    public final c J;
    public final c K;
    public final c L;
    public final c M;
    public final c N;
    public final c O;
    public final c[] P;
    public final ArrayList Q;
    public final boolean[] R;
    public d S;
    public int T;
    public int U;
    public float V;
    public int W;
    public int X;
    public int Y;
    public int Z;

    /* renamed from: a0, reason: collision with root package name */
    public int f57083a0;

    /* renamed from: b, reason: collision with root package name */
    public h4.c f57084b;

    /* renamed from: b0, reason: collision with root package name */
    public int f57085b0;

    /* renamed from: c, reason: collision with root package name */
    public h4.c f57086c;

    /* renamed from: c0, reason: collision with root package name */
    public float f57087c0;

    /* renamed from: d0, reason: collision with root package name */
    public float f57089d0;

    /* renamed from: e0, reason: collision with root package name */
    public View f57091e0;

    /* renamed from: f0, reason: collision with root package name */
    public int f57093f0;

    /* renamed from: g0, reason: collision with root package name */
    public String f57095g0;

    /* renamed from: h0, reason: collision with root package name */
    public int f57097h0;

    /* renamed from: i0, reason: collision with root package name */
    public int f57099i0;

    /* renamed from: j, reason: collision with root package name */
    public boolean f57100j;

    /* renamed from: j0, reason: collision with root package name */
    public final float[] f57101j0;

    /* renamed from: k, reason: collision with root package name */
    public boolean f57102k;

    /* renamed from: k0, reason: collision with root package name */
    public final d[] f57103k0;

    /* renamed from: l, reason: collision with root package name */
    public boolean f57104l;

    /* renamed from: l0, reason: collision with root package name */
    public final d[] f57105l0;

    /* renamed from: m, reason: collision with root package name */
    public boolean f57106m;

    /* renamed from: m0, reason: collision with root package name */
    public int f57107m0;
    public int n;

    /* renamed from: n0, reason: collision with root package name */
    public int f57108n0;
    public int o;

    /* renamed from: o0, reason: collision with root package name */
    public final int[] f57109o0;

    /* renamed from: p, reason: collision with root package name */
    public int f57110p;

    /* renamed from: q, reason: collision with root package name */
    public int f57111q;

    /* renamed from: r, reason: collision with root package name */
    public int f57112r;

    /* renamed from: s, reason: collision with root package name */
    public final int[] f57113s;

    /* renamed from: t, reason: collision with root package name */
    public int f57114t;

    /* renamed from: u, reason: collision with root package name */
    public int f57115u;

    /* renamed from: v, reason: collision with root package name */
    public float f57116v;

    /* renamed from: w, reason: collision with root package name */
    public int f57117w;

    /* renamed from: x, reason: collision with root package name */
    public int f57118x;

    /* renamed from: y, reason: collision with root package name */
    public float f57119y;

    /* renamed from: z, reason: collision with root package name */
    public int f57120z;

    /* renamed from: a, reason: collision with root package name */
    public boolean f57082a = false;

    /* renamed from: d, reason: collision with root package name */
    public k f57088d = null;

    /* renamed from: e, reason: collision with root package name */
    public m f57090e = null;

    /* renamed from: f, reason: collision with root package name */
    public final boolean[] f57092f = {true, true};

    /* renamed from: g, reason: collision with root package name */
    public boolean f57094g = true;

    /* renamed from: h, reason: collision with root package name */
    public int f57096h = -1;

    /* renamed from: i, reason: collision with root package name */
    public int f57098i = -1;

    public d() {
        new HashMap();
        this.f57100j = false;
        this.f57102k = false;
        this.f57104l = false;
        this.f57106m = false;
        this.n = -1;
        this.o = -1;
        this.f57110p = 0;
        this.f57111q = 0;
        this.f57112r = 0;
        this.f57113s = new int[2];
        this.f57114t = 0;
        this.f57115u = 0;
        this.f57116v = 1.0f;
        this.f57117w = 0;
        this.f57118x = 0;
        this.f57119y = 1.0f;
        this.f57120z = -1;
        this.A = 1.0f;
        this.B = new int[]{LayoutNode.NotPlacedPlaceOrder, LayoutNode.NotPlacedPlaceOrder};
        this.C = Float.NaN;
        this.D = false;
        this.E = false;
        this.F = 0;
        this.G = 0;
        c cVar = new c(this, 2);
        this.H = cVar;
        c cVar2 = new c(this, 3);
        this.I = cVar2;
        c cVar3 = new c(this, 4);
        this.J = cVar3;
        c cVar4 = new c(this, 5);
        this.K = cVar4;
        c cVar5 = new c(this, 6);
        this.L = cVar5;
        c cVar6 = new c(this, 8);
        this.M = cVar6;
        c cVar7 = new c(this, 9);
        this.N = cVar7;
        c cVar8 = new c(this, 7);
        this.O = cVar8;
        this.P = new c[]{cVar, cVar3, cVar2, cVar4, cVar5, cVar8};
        ArrayList arrayList = new ArrayList();
        this.Q = arrayList;
        this.R = new boolean[2];
        this.f57109o0 = new int[]{1, 1};
        this.S = null;
        this.T = 0;
        this.U = 0;
        this.V = 0.0f;
        this.W = -1;
        this.X = 0;
        this.Y = 0;
        this.Z = 0;
        this.f57087c0 = 0.5f;
        this.f57089d0 = 0.5f;
        this.f57093f0 = 0;
        this.f57095g0 = null;
        this.f57097h0 = 0;
        this.f57099i0 = 0;
        this.f57101j0 = new float[]{-1.0f, -1.0f};
        this.f57103k0 = new d[]{null, null};
        this.f57105l0 = new d[]{null, null};
        this.f57107m0 = -1;
        this.f57108n0 = -1;
        arrayList.add(cVar);
        arrayList.add(cVar2);
        arrayList.add(cVar3);
        arrayList.add(cVar4);
        arrayList.add(cVar6);
        arrayList.add(cVar7);
        arrayList.add(cVar8);
        arrayList.add(cVar5);
    }

    public final void A() {
        d dVar = this.S;
        if (dVar != null && (dVar instanceof e)) {
            ((e) dVar).getClass();
        }
        ArrayList arrayList = this.Q;
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            ((c) arrayList.get(i5)).j();
        }
    }

    public final void B() {
        this.f57100j = false;
        this.f57102k = false;
        this.f57104l = false;
        this.f57106m = false;
        ArrayList arrayList = this.Q;
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            c cVar = (c) arrayList.get(i5);
            cVar.f57075c = false;
            cVar.f57074b = 0;
        }
    }

    public void C(l lVar) {
        this.H.k();
        this.I.k();
        this.J.k();
        this.K.k();
        this.L.k();
        this.O.k();
        this.M.k();
        this.N.k();
    }

    public final void D(int i5) {
        this.Z = i5;
        this.D = i5 > 0;
    }

    public final void E(int i5, int i11) {
        if (this.f57100j) {
            return;
        }
        this.H.l(i5);
        this.J.l(i11);
        this.X = i5;
        this.T = i11 - i5;
        this.f57100j = true;
    }

    public final void F(int i5, int i11) {
        if (this.f57102k) {
            return;
        }
        this.I.l(i5);
        this.K.l(i11);
        this.Y = i5;
        this.U = i11 - i5;
        if (this.D) {
            this.L.l(i5 + this.Z);
        }
        this.f57102k = true;
    }

    public final void G(int i5) {
        this.U = i5;
        int i11 = this.f57085b0;
        if (i5 < i11) {
            this.U = i11;
        }
    }

    public final void H(int i5) {
        this.f57109o0[0] = i5;
    }

    public final void I(int i5) {
        this.f57109o0[1] = i5;
    }

    public final void J(int i5) {
        this.T = i5;
        int i11 = this.f57083a0;
        if (i5 < i11) {
            this.T = i11;
        }
    }

    public void K(boolean z11, boolean z12) {
        int i5;
        int i11;
        k kVar = this.f57088d;
        boolean z13 = z11 & kVar.f59138g;
        m mVar = this.f57090e;
        boolean z14 = z12 & mVar.f59138g;
        int i12 = kVar.f59139h.f59113g;
        int i13 = mVar.f59139h.f59113g;
        int i14 = kVar.f59140i.f59113g;
        int i15 = mVar.f59140i.f59113g;
        int i16 = i15 - i13;
        if (i14 - i12 < 0 || i16 < 0 || i12 == Integer.MIN_VALUE || i12 == Integer.MAX_VALUE || i13 == Integer.MIN_VALUE || i13 == Integer.MAX_VALUE || i14 == Integer.MIN_VALUE || i14 == Integer.MAX_VALUE || i15 == Integer.MIN_VALUE || i15 == Integer.MAX_VALUE) {
            i14 = 0;
            i15 = 0;
            i12 = 0;
            i13 = 0;
        }
        int i17 = i14 - i12;
        int i18 = i15 - i13;
        if (z13) {
            this.X = i12;
        }
        if (z14) {
            this.Y = i13;
        }
        if (this.f57093f0 == 8) {
            this.T = 0;
            this.U = 0;
            return;
        }
        int[] iArr = this.f57109o0;
        if (z13) {
            if (iArr[0] == 1 && i17 < (i11 = this.T)) {
                i17 = i11;
            }
            this.T = i17;
            int i19 = this.f57083a0;
            if (i17 < i19) {
                this.T = i19;
            }
        }
        if (z14) {
            if (iArr[1] == 1 && i18 < (i5 = this.U)) {
                i18 = i5;
            }
            this.U = i18;
            int i21 = this.f57085b0;
            if (i18 < i21) {
                this.U = i21;
            }
        }
    }

    public void L(e4.c cVar, boolean z11) {
        int i5;
        int i11;
        m mVar;
        k kVar;
        cVar.getClass();
        int iN = e4.c.n(this.H);
        int iN2 = e4.c.n(this.I);
        int iN3 = e4.c.n(this.J);
        int iN4 = e4.c.n(this.K);
        if (z11 && (kVar = this.f57088d) != null) {
            h4.f fVar = kVar.f59139h;
            if (fVar.f59116j) {
                h4.f fVar2 = kVar.f59140i;
                if (fVar2.f59116j) {
                    iN = fVar.f59113g;
                    iN3 = fVar2.f59113g;
                }
            }
        }
        if (z11 && (mVar = this.f57090e) != null) {
            h4.f fVar3 = mVar.f59139h;
            if (fVar3.f59116j) {
                h4.f fVar4 = mVar.f59140i;
                if (fVar4.f59116j) {
                    iN2 = fVar3.f59113g;
                    iN4 = fVar4.f59113g;
                }
            }
        }
        int i12 = iN4 - iN2;
        if (iN3 - iN < 0 || i12 < 0 || iN == Integer.MIN_VALUE || iN == Integer.MAX_VALUE || iN2 == Integer.MIN_VALUE || iN2 == Integer.MAX_VALUE || iN3 == Integer.MIN_VALUE || iN3 == Integer.MAX_VALUE || iN4 == Integer.MIN_VALUE || iN4 == Integer.MAX_VALUE) {
            iN = 0;
            iN2 = 0;
            iN3 = 0;
            iN4 = 0;
        }
        int i13 = iN3 - iN;
        int i14 = iN4 - iN2;
        this.X = iN;
        this.Y = iN2;
        if (this.f57093f0 == 8) {
            this.T = 0;
            this.U = 0;
            return;
        }
        int[] iArr = this.f57109o0;
        int i15 = iArr[0];
        if (i15 == 1 && i13 < (i11 = this.T)) {
            i13 = i11;
        }
        if (iArr[1] == 1 && i14 < (i5 = this.U)) {
            i14 = i5;
        }
        this.T = i13;
        this.U = i14;
        int i16 = this.f57085b0;
        if (i14 < i16) {
            this.U = i16;
        }
        int i17 = this.f57083a0;
        if (i13 < i17) {
            this.T = i17;
        }
        int i18 = this.f57115u;
        if (i18 > 0 && i15 == 3) {
            this.T = Math.min(this.T, i18);
        }
        int i19 = this.f57118x;
        if (i19 > 0 && iArr[1] == 3) {
            this.U = Math.min(this.U, i19);
        }
        int i21 = this.T;
        if (i13 != i21) {
            this.f57096h = i21;
        }
        int i22 = this.U;
        if (i14 != i22) {
            this.f57098i = i22;
        }
    }

    public final void a(e eVar, e4.c cVar, HashSet hashSet, int i5, boolean z11) {
        if (z11) {
            if (!hashSet.contains(this)) {
                return;
            }
            j.b(eVar, cVar, this);
            hashSet.remove(this);
            b(cVar, eVar.R(64));
        }
        if (i5 == 0) {
            HashSet hashSet2 = this.H.f57073a;
            if (hashSet2 != null) {
                Iterator it = hashSet2.iterator();
                while (it.hasNext()) {
                    ((c) it.next()).f57076d.a(eVar, cVar, hashSet, i5, true);
                }
            }
            HashSet hashSet3 = this.J.f57073a;
            if (hashSet3 != null) {
                Iterator it2 = hashSet3.iterator();
                while (it2.hasNext()) {
                    ((c) it2.next()).f57076d.a(eVar, cVar, hashSet, i5, true);
                }
                return;
            }
            return;
        }
        HashSet hashSet4 = this.I.f57073a;
        if (hashSet4 != null) {
            Iterator it3 = hashSet4.iterator();
            while (it3.hasNext()) {
                ((c) it3.next()).f57076d.a(eVar, cVar, hashSet, i5, true);
            }
        }
        HashSet hashSet5 = this.K.f57073a;
        if (hashSet5 != null) {
            Iterator it4 = hashSet5.iterator();
            while (it4.hasNext()) {
                ((c) it4.next()).f57076d.a(eVar, cVar, hashSet, i5, true);
            }
        }
        HashSet hashSet6 = this.L.f57073a;
        if (hashSet6 != null) {
            Iterator it5 = hashSet6.iterator();
            while (it5.hasNext()) {
                ((c) it5.next()).f57076d.a(eVar, cVar, hashSet, i5, true);
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:121:0x0204  */
    /* JADX WARN: Removed duplicated region for block: B:125:0x020c  */
    /* JADX WARN: Removed duplicated region for block: B:128:0x0215  */
    /* JADX WARN: Removed duplicated region for block: B:157:0x028b  */
    /* JADX WARN: Removed duplicated region for block: B:161:0x029a  */
    /* JADX WARN: Removed duplicated region for block: B:164:0x02a3  */
    /* JADX WARN: Removed duplicated region for block: B:165:0x02a6  */
    /* JADX WARN: Removed duplicated region for block: B:168:0x02b5  */
    /* JADX WARN: Removed duplicated region for block: B:170:0x02bc  */
    /* JADX WARN: Removed duplicated region for block: B:173:0x02c3  */
    /* JADX WARN: Removed duplicated region for block: B:174:0x02c6  */
    /* JADX WARN: Removed duplicated region for block: B:177:0x02e4  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0062  */
    /* JADX WARN: Removed duplicated region for block: B:268:0x03f5  */
    /* JADX WARN: Removed duplicated region for block: B:272:0x040d  */
    /* JADX WARN: Removed duplicated region for block: B:276:0x0416  */
    /* JADX WARN: Removed duplicated region for block: B:279:0x041a  */
    /* JADX WARN: Removed duplicated region for block: B:284:0x0426  */
    /* JADX WARN: Removed duplicated region for block: B:287:0x042e  */
    /* JADX WARN: Removed duplicated region for block: B:290:0x0434  */
    /* JADX WARN: Removed duplicated region for block: B:292:0x0437  */
    /* JADX WARN: Removed duplicated region for block: B:295:0x0453  */
    /* JADX WARN: Removed duplicated region for block: B:314:0x049a  */
    /* JADX WARN: Removed duplicated region for block: B:330:0x0537  */
    /* JADX WARN: Removed duplicated region for block: B:346:0x058a  */
    /* JADX WARN: Removed duplicated region for block: B:349:0x059c  */
    /* JADX WARN: Removed duplicated region for block: B:352:0x05a0  */
    /* JADX WARN: Removed duplicated region for block: B:374:0x05d5  */
    /* JADX WARN: Removed duplicated region for block: B:389:0x0661  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0092  */
    /* JADX WARN: Removed duplicated region for block: B:391:0x0667  */
    /* JADX WARN: Removed duplicated region for block: B:397:0x06c5  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x009e  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00fd  */
    /* JADX WARN: Type inference failed for: r17v10, types: [boolean] */
    /* JADX WARN: Type inference failed for: r17v16 */
    /* JADX WARN: Type inference failed for: r17v17 */
    /* JADX WARN: Type inference failed for: r17v2 */
    /* JADX WARN: Type inference failed for: r17v20 */
    /* JADX WARN: Type inference failed for: r18v25 */
    /* JADX WARN: Type inference failed for: r18v6, types: [boolean] */
    /* JADX WARN: Type inference failed for: r18v7 */
    /* JADX WARN: Type inference failed for: r27v3 */
    /* JADX WARN: Type inference failed for: r27v4, types: [boolean] */
    /* JADX WARN: Type inference failed for: r27v6 */
    /* JADX WARN: Type inference failed for: r27v7 */
    /* JADX WARN: Type inference failed for: r27v8 */
    /* JADX WARN: Type inference failed for: r58v0, types: [g4.d] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void b(e4.c cVar, boolean z11) {
        boolean z12;
        boolean z13;
        boolean z14;
        ?? r17;
        int i5;
        boolean z15;
        boolean z16;
        d dVar;
        d dVar2;
        boolean[] zArr;
        c cVar2;
        boolean[] zArr2;
        c cVar3;
        c cVar4;
        boolean z17;
        boolean z18;
        boolean z19;
        int i11;
        int i12;
        int[] iArr;
        float f11;
        c cVar5;
        e4.f fVar;
        c cVar6;
        int i13;
        int i14;
        int i15;
        boolean z21;
        int i16;
        boolean z22;
        c cVar7;
        int i17;
        int[] iArr2;
        c cVar8;
        e4.f fVar2;
        e4.f fVar3;
        c cVar9;
        int[] iArr3;
        e4.f fVar4;
        boolean z23;
        boolean z24;
        boolean z25;
        e4.f fVar5;
        c cVar10;
        e4.f fVar6;
        int i18;
        boolean[] zArr3;
        e4.f fVar7;
        e4.f fVar8;
        e4.f fVar9;
        int i19;
        int i21;
        boolean z26;
        int i22;
        e4.f fVar10;
        e4.f fVar11;
        m mVar;
        boolean z27;
        k kVar;
        int i23;
        int i24;
        boolean zU;
        int i25;
        boolean zV;
        k kVar2;
        m mVar2;
        boolean z28;
        e4.c cVar11 = cVar;
        c cVar12 = this.H;
        e4.f fVarK = cVar11.k(cVar12);
        c cVar13 = this.J;
        e4.f fVarK2 = cVar11.k(cVar13);
        c cVar14 = this.I;
        e4.f fVarK3 = cVar11.k(cVar14);
        c cVar15 = this.K;
        e4.f fVarK4 = cVar11.k(cVar15);
        c cVar16 = this.L;
        e4.f fVarK5 = cVar11.k(cVar16);
        d dVar3 = this.S;
        if (dVar3 != null) {
            int[] iArr4 = dVar3.f57109o0;
            r17 = 0;
            z12 = false;
            r17 = 0;
            z14 = iArr4[0] == 2;
            boolean z29 = iArr4[1] == 2;
            int i26 = this.f57110p;
            if (i26 != 1) {
                if (i26 == 2) {
                    z14 = false;
                } else if (i26 != 3) {
                }
                z13 = z29;
            } else {
                z13 = false;
            }
            i5 = this.f57093f0;
            boolean[] zArr4 = this.R;
            boolean z31 = z13;
            if (i5 != 8) {
                ArrayList arrayList = this.Q;
                int size = arrayList.size();
                z15 = z14;
                int i27 = r17;
                while (true) {
                    if (i27 < size) {
                        int i28 = size;
                        HashSet hashSet = ((c) arrayList.get(i27)).f57073a;
                        if (hashSet != null && hashSet.size() > 0) {
                            break;
                        }
                        i27++;
                        size = i28;
                    } else if (!zArr4[r17] && !zArr4[1]) {
                        return;
                    }
                }
            } else {
                z15 = z14;
            }
            z16 = this.f57100j;
            if (!z16 || this.f57102k) {
                if (z16) {
                    cVar11.d(fVarK, this.X);
                    cVar11.d(fVarK2, this.X + this.T);
                    if (z15 && (dVar2 = this.S) != null) {
                        e eVar = (e) dVar2;
                        WeakReference weakReference = eVar.G0;
                        if (weakReference == null || weakReference.get() == null || cVar12.d() > ((c) eVar.G0.get()).d()) {
                            eVar.G0 = new WeakReference(cVar12);
                        }
                        WeakReference weakReference2 = eVar.I0;
                        if (weakReference2 == null || weakReference2.get() == null || cVar13.d() > ((c) eVar.I0.get()).d()) {
                            eVar.I0 = new WeakReference(cVar13);
                        }
                    }
                }
                if (this.f57102k) {
                    cVar11.d(fVarK3, this.Y);
                    cVar11.d(fVarK4, this.Y + this.U);
                    HashSet hashSet2 = cVar16.f57073a;
                    if (hashSet2 != null && hashSet2.size() > 0) {
                        cVar11.d(fVarK5, this.Y + this.Z);
                    }
                    if (z31 && (dVar = this.S) != null) {
                        e eVar2 = (e) dVar;
                        WeakReference weakReference3 = eVar2.F0;
                        if (weakReference3 == null || weakReference3.get() == null || cVar14.d() > ((c) eVar2.F0.get()).d()) {
                            eVar2.F0 = new WeakReference(cVar14);
                        }
                        WeakReference weakReference4 = eVar2.H0;
                        if (weakReference4 == null || weakReference4.get() == null || cVar15.d() > ((c) eVar2.H0.get()).d()) {
                            eVar2.H0 = new WeakReference(cVar15);
                        }
                    }
                }
                if (this.f57100j && this.f57102k) {
                    boolean z32 = r17;
                    this.f57100j = z32;
                    this.f57102k = z32;
                    return;
                }
            }
            zArr = this.f57092f;
            if (z11 || (kVar2 = this.f57088d) == null || (mVar2 = this.f57090e) == null) {
                cVar2 = cVar16;
                zArr2 = zArr;
            } else {
                cVar2 = cVar16;
                h4.f fVar12 = kVar2.f59139h;
                zArr2 = zArr;
                if (fVar12.f59116j && kVar2.f59140i.f59116j && mVar2.f59139h.f59116j && mVar2.f59140i.f59116j) {
                    cVar11.d(fVarK, fVar12.f59113g);
                    cVar11.d(fVarK2, this.f57088d.f59140i.f59113g);
                    cVar11.d(fVarK3, this.f57090e.f59139h.f59113g);
                    cVar11.d(fVarK4, this.f57090e.f59140i.f59113g);
                    cVar11.d(fVarK5, this.f57090e.f59124k.f59113g);
                    if (this.S == null) {
                        z28 = false;
                    } else {
                        if (z15 && zArr2[0] && !u()) {
                            cVar11.f(cVar11.k(this.S.J), fVarK2, 0, 8);
                        }
                        if (z31 && zArr2[1] && !v()) {
                            z28 = false;
                            cVar11.f(cVar11.k(this.S.K), fVarK4, 0, 8);
                        }
                    }
                    this.f57100j = z28;
                    this.f57102k = z28;
                    return;
                }
            }
            if (this.S == null) {
                if (t(0)) {
                    ((e) this.S).M(this, 0);
                    zU = true;
                    i25 = 1;
                } else {
                    zU = u();
                    i25 = 1;
                }
                if (t(i25)) {
                    ((e) this.S).M(this, i25);
                    zV = true;
                } else {
                    zV = v();
                }
                if (!zU && z15 && this.f57093f0 != 8 && cVar12.f57078f == null && cVar13.f57078f == null) {
                    cVar3 = cVar12;
                    cVar11.f(cVar11.k(this.S.J), fVarK2, 0, 1);
                } else {
                    cVar3 = cVar12;
                }
                if (!zV && z31 && this.f57093f0 != 8 && cVar14.f57078f == null && cVar15.f57078f == null && cVar2 == null) {
                    cVar11.f(cVar11.k(this.S.K), fVarK4, 0, 1);
                }
                cVar4 = cVar13;
                z17 = z31;
                z19 = zV;
                z18 = zU;
            } else {
                cVar3 = cVar12;
                cVar4 = cVar13;
                z17 = z31;
                z18 = false;
                z19 = false;
            }
            i11 = this.T;
            i12 = this.f57083a0;
            if (i11 >= i12) {
                i12 = i11;
            }
            int i29 = this.U;
            c cVar17 = cVar4;
            int i31 = this.f57085b0;
            int i32 = i29 >= i31 ? i31 : i29;
            iArr = this.f57109o0;
            int i33 = iArr[0];
            boolean z33 = z17;
            boolean z34 = i33 == 3;
            int i34 = iArr[1];
            boolean z35 = i34 == 3;
            int i35 = this.W;
            this.f57120z = i35;
            f11 = this.V;
            this.A = f11;
            int i36 = this.f57111q;
            int i37 = this.f57112r;
            if (f11 <= 0.0f) {
                cVar5 = cVar15;
                if (this.f57093f0 != 8) {
                    int i38 = (i33 == 3 && i36 == 0) ? 3 : i36;
                    if (i34 == 3 && i37 == 0) {
                        fVar = fVarK4;
                        i24 = 3;
                    } else {
                        fVar = fVarK4;
                        i24 = i37;
                    }
                    if (i33 == 3 && i34 == 3 && i38 == 3 && i24 == 3) {
                        if (i35 == -1) {
                            if (z34 && !z35) {
                                this.f57120z = 0;
                            } else if (!z34 && z35) {
                                this.f57120z = 1;
                                if (i35 == -1) {
                                    this.A = 1.0f / f11;
                                }
                            }
                        }
                        if (this.f57120z == 0 && (!cVar14.h() || !cVar5.h())) {
                            this.f57120z = 1;
                        } else if (this.f57120z == 1 && (!cVar3.h() || !cVar17.h())) {
                            this.f57120z = 0;
                        }
                        if (this.f57120z == -1 && (!cVar14.h() || !cVar5.h() || !cVar3.h() || !cVar17.h())) {
                            if (cVar14.h() && cVar5.h()) {
                                this.f57120z = 0;
                            } else if (cVar3.h() && cVar17.h()) {
                                this.A = 1.0f / this.A;
                                this.f57120z = 1;
                            }
                        }
                        if (this.f57120z == -1) {
                            int i39 = this.f57114t;
                            if (i39 > 0 && this.f57117w == 0) {
                                this.f57120z = 0;
                            } else if (i39 == 0 && this.f57117w > 0) {
                                this.A = 1.0f / this.A;
                                this.f57120z = 1;
                            }
                        }
                    } else {
                        if (i33 != 3 || i38 != 3) {
                            if (i34 == 3 && i24 == 3) {
                                this.f57120z = 1;
                                if (i35 == -1) {
                                    this.A = 1.0f / f11;
                                }
                                i13 = (int) (this.A * i11);
                                if (i33 != 3) {
                                    i14 = i38;
                                    cVar6 = cVar2;
                                    i15 = 4;
                                } else {
                                    i14 = i38;
                                    cVar6 = cVar2;
                                }
                            }
                            z21 = true;
                            i15 = i24;
                            int[] iArr5 = this.f57113s;
                            iArr5[0] = i14;
                            iArr5[1] = i15;
                            if (!z21) {
                                int i40 = this.f57120z;
                                i16 = -1;
                                boolean z36 = i40 == 0 || i40 == -1;
                                boolean z37 = z21 && ((i23 = this.f57120z) == 1 || i23 == i16);
                                z22 = iArr[0] == 2 && (this instanceof e);
                                if (z22) {
                                    i12 = 0;
                                }
                                cVar7 = this.O;
                                boolean z38 = !cVar7.h();
                                char c11 = '\b';
                                boolean z39 = zArr4[0];
                                boolean z41 = zArr4[1];
                                i17 = this.n;
                                iArr2 = this.B;
                                if (i17 == 2 || this.f57100j) {
                                    cVar8 = cVar6;
                                    fVar2 = fVarK;
                                    fVar3 = fVarK2;
                                    cVar9 = cVar7;
                                    iArr3 = iArr2;
                                    fVar4 = fVarK5;
                                    z23 = z18;
                                    z24 = z15;
                                    z25 = z33;
                                    fVar5 = fVarK3;
                                    cVar10 = cVar5;
                                    fVar6 = fVar;
                                    i18 = i14;
                                    zArr3 = zArr2;
                                } else {
                                    if (z11 && (kVar = this.f57088d) != null) {
                                        h4.f fVar13 = kVar.f59139h;
                                        if (fVar13.f59116j && kVar.f59140i.f59116j) {
                                            if (z11) {
                                                cVar11.d(fVarK, fVar13.f59113g);
                                                cVar11.d(fVarK2, this.f57088d.f59140i.f59113g);
                                                if (this.S != null && z15 && zArr2[0] && !u()) {
                                                    cVar11.f(cVar11.k(this.S.J), fVarK2, 0, 8);
                                                }
                                            }
                                            cVar8 = cVar6;
                                            fVar2 = fVarK;
                                            fVar3 = fVarK2;
                                            cVar9 = cVar7;
                                            iArr3 = iArr2;
                                            fVar4 = fVarK5;
                                            z23 = z18;
                                            z24 = z15;
                                            z25 = z33;
                                            fVar5 = fVarK3;
                                            cVar10 = cVar5;
                                            fVar6 = fVar;
                                            i18 = i14;
                                            zArr3 = zArr2;
                                        } else {
                                            c11 = '\b';
                                        }
                                    }
                                    d dVar4 = this.S;
                                    e4.f fVarK6 = dVar4 != null ? cVar11.k(dVar4.J) : null;
                                    d dVar5 = this.S;
                                    e4.f fVarK7 = dVar5 != null ? cVar11.k(dVar5.H) : null;
                                    z24 = z15;
                                    i18 = i14;
                                    z23 = z18;
                                    cVar9 = cVar7;
                                    iArr3 = iArr2;
                                    boolean z42 = z36;
                                    fVar2 = fVarK;
                                    z25 = z33;
                                    fVar5 = fVarK3;
                                    fVar3 = fVarK2;
                                    cVar10 = cVar5;
                                    fVar6 = fVar;
                                    cVar8 = cVar6;
                                    fVar4 = fVarK5;
                                    zArr3 = zArr2;
                                    cVar11 = cVar;
                                    d(cVar11, true, z24, z25, zArr2[0], fVarK7, fVarK6, iArr[0], z22, this.H, this.J, this.X, i12, this.f57083a0, iArr2[0], this.f57087c0, z42, iArr[1] == 3, z23, z19, z39, i18, i15, this.f57114t, this.f57115u, this.f57116v, z38);
                                }
                                if (!z11 || (mVar = this.f57090e) == null) {
                                    fVar7 = fVar5;
                                    fVar8 = fVar6;
                                    fVar9 = fVar4;
                                    i19 = 0;
                                    i21 = 8;
                                    z26 = true;
                                    i22 = 1;
                                } else {
                                    h4.f fVar14 = mVar.f59139h;
                                    if (fVar14.f59116j && mVar.f59140i.f59116j) {
                                        int i41 = fVar14.f59113g;
                                        fVar7 = fVar5;
                                        cVar11.d(fVar7, i41);
                                        fVar8 = fVar6;
                                        cVar11.d(fVar8, this.f57090e.f59140i.f59113g);
                                        fVar9 = fVar4;
                                        cVar11.d(fVar9, this.f57090e.f59124k.f59113g);
                                        d dVar6 = this.S;
                                        if (dVar6 == null || z19 || !z25) {
                                            i19 = 0;
                                            i21 = 8;
                                            z27 = true;
                                        } else {
                                            z27 = true;
                                            z27 = true;
                                            if (zArr3[1]) {
                                                i19 = 0;
                                                i21 = 8;
                                                cVar11.f(cVar11.k(dVar6.K), fVar8, 0, 8);
                                            } else {
                                                i19 = 0;
                                                i21 = 8;
                                            }
                                        }
                                        i22 = i19;
                                        z26 = z27;
                                    }
                                }
                                if (this.o == 2) {
                                    i22 = i19;
                                }
                                if (i22 == 0 || this.f57102k) {
                                    fVar10 = fVar7;
                                    fVar11 = fVar8;
                                } else {
                                    int i42 = (iArr[z26 ? 1 : 0] == 2 && (this instanceof e)) ? z26 ? 1 : 0 : i19;
                                    int i43 = i42 != 0 ? i19 : i13;
                                    d dVar7 = this.S;
                                    e4.f fVarK8 = dVar7 != null ? cVar11.k(dVar7.K) : null;
                                    d dVar8 = this.S;
                                    e4.f fVarK9 = dVar8 != null ? cVar11.k(dVar8.I) : null;
                                    int i44 = this.Z;
                                    if (i44 <= 0) {
                                        ?? r27 = z38;
                                        if (this.f57093f0 == i21) {
                                            c cVar18 = cVar8;
                                            if (cVar18.f57078f != null) {
                                                cVar11.e(fVar9, fVar7, i44, i21);
                                                cVar11.e(fVar9, cVar11.k(cVar18.f57078f), cVar18.e(), i21);
                                                if (z25) {
                                                    cVar11.f(fVarK8, cVar11.k(cVar10), i19, 5);
                                                }
                                                r27 = i19;
                                            } else if (this.f57093f0 == i21) {
                                                cVar11.e(fVar9, fVar7, cVar18.e(), i21);
                                                r27 = z38;
                                            } else {
                                                cVar11.e(fVar9, fVar7, i44, i21);
                                                r27 = z38;
                                            }
                                        }
                                        boolean z43 = zArr3[z26 ? 1 : 0];
                                        int i45 = i19;
                                        int i46 = iArr[z26 ? 1 : 0];
                                        int i47 = this.Y;
                                        int i48 = this.f57085b0;
                                        int i49 = iArr3[z26 ? 1 : 0];
                                        float f12 = this.f57089d0;
                                        int i51 = iArr[i45];
                                        boolean z44 = z26 ? 1 : 0;
                                        ?? r18 = z26;
                                        if (i51 != 3) {
                                            r18 = i45;
                                        }
                                        fVar11 = fVar8;
                                        fVar10 = fVar7;
                                        cVar11 = cVar;
                                        d(cVar11, false, z25, z24, z43, fVarK9, fVarK8, i46, i42, this.I, this.K, i47, i43, i48, i49, f12, z37, r18, z19, z23, z41, i15, i18, this.f57117w, this.f57118x, this.f57119y, r27);
                                    }
                                }
                                if (z21) {
                                    if (this.f57120z == 1) {
                                        float f13 = this.A;
                                        e4.b bVarL = cVar11.l();
                                        bVarL.f52132d.g(fVar11, -1.0f);
                                        bVarL.f52132d.g(fVar10, 1.0f);
                                        bVarL.f52132d.g(fVar3, f13);
                                        bVarL.f52132d.g(fVar2, -f13);
                                        cVar11.c(bVarL);
                                    } else {
                                        float f14 = this.A;
                                        e4.b bVarL2 = cVar11.l();
                                        bVarL2.f52132d.g(fVar3, -1.0f);
                                        bVarL2.f52132d.g(fVar2, 1.0f);
                                        bVarL2.f52132d.g(fVar11, f14);
                                        bVarL2.f52132d.g(fVar10, -f14);
                                        cVar11.c(bVarL2);
                                    }
                                }
                                if (cVar9.h()) {
                                    c cVar19 = cVar9;
                                    d dVar9 = cVar19.f57078f.f57076d;
                                    float radians = (float) Math.toRadians(this.C + 90.0f);
                                    int iE = cVar19.e();
                                    e4.f fVarK10 = cVar11.k(i(2));
                                    e4.f fVarK11 = cVar11.k(i(3));
                                    e4.f fVarK12 = cVar11.k(i(4));
                                    e4.f fVarK13 = cVar11.k(i(5));
                                    e4.f fVarK14 = cVar11.k(dVar9.i(2));
                                    e4.f fVarK15 = cVar11.k(dVar9.i(3));
                                    e4.f fVarK16 = cVar11.k(dVar9.i(4));
                                    e4.f fVarK17 = cVar11.k(dVar9.i(5));
                                    e4.b bVarL3 = cVar11.l();
                                    double d5 = radians;
                                    double dSin = Math.sin(d5);
                                    double d11 = iE;
                                    bVarL3.f52132d.g(fVarK15, 0.5f);
                                    bVarL3.f52132d.g(fVarK17, 0.5f);
                                    bVarL3.f52132d.g(fVarK11, -0.5f);
                                    bVarL3.f52132d.g(fVarK13, -0.5f);
                                    bVarL3.f52130b = -((float) (dSin * d11));
                                    cVar11.c(bVarL3);
                                    e4.b bVarL4 = cVar11.l();
                                    float fCos = (float) (Math.cos(d5) * d11);
                                    bVarL4.f52132d.g(fVarK14, 0.5f);
                                    bVarL4.f52132d.g(fVarK16, 0.5f);
                                    bVarL4.f52132d.g(fVarK10, -0.5f);
                                    bVarL4.f52132d.g(fVarK12, -0.5f);
                                    bVarL4.f52130b = -fCos;
                                    cVar11.c(bVarL4);
                                }
                                this.f57100j = false;
                                this.f57102k = false;
                            }
                            i16 = -1;
                            if (z21) {
                            }
                            if (iArr[0] == 2) {
                            }
                            if (z22) {
                            }
                            cVar7 = this.O;
                            boolean z382 = !cVar7.h();
                            char c112 = '\b';
                            boolean z392 = zArr4[0];
                            boolean z412 = zArr4[1];
                            i17 = this.n;
                            iArr2 = this.B;
                            if (i17 == 2) {
                                cVar8 = cVar6;
                                fVar2 = fVarK;
                                fVar3 = fVarK2;
                                cVar9 = cVar7;
                                iArr3 = iArr2;
                                fVar4 = fVarK5;
                                z23 = z18;
                                z24 = z15;
                                z25 = z33;
                                fVar5 = fVarK3;
                                cVar10 = cVar5;
                                fVar6 = fVar;
                                i18 = i14;
                                zArr3 = zArr2;
                            }
                            if (z11) {
                                fVar7 = fVar5;
                                fVar8 = fVar6;
                                fVar9 = fVar4;
                                i19 = 0;
                                i21 = 8;
                                z26 = true;
                                i22 = 1;
                            }
                            if (this.o == 2) {
                            }
                            if (i22 == 0) {
                                fVar10 = fVar7;
                                fVar11 = fVar8;
                            }
                            if (z21) {
                            }
                            if (cVar9.h()) {
                            }
                            this.f57100j = false;
                            this.f57102k = false;
                        }
                        this.f57120z = 0;
                        i12 = (int) (f11 * i29);
                        if (i34 != 3) {
                            cVar6 = cVar2;
                            i13 = i32;
                            i14 = 4;
                            z21 = false;
                            i15 = i24;
                            int[] iArr52 = this.f57113s;
                            iArr52[0] = i14;
                            iArr52[1] = i15;
                            if (!z21) {
                            }
                            if (z21) {
                            }
                            if (iArr[0] == 2) {
                            }
                            if (z22) {
                            }
                            cVar7 = this.O;
                            boolean z3822 = !cVar7.h();
                            char c1122 = '\b';
                            boolean z3922 = zArr4[0];
                            boolean z4122 = zArr4[1];
                            i17 = this.n;
                            iArr2 = this.B;
                            if (i17 == 2) {
                            }
                            if (z11) {
                            }
                            if (this.o == 2) {
                            }
                            if (i22 == 0) {
                            }
                            if (z21) {
                            }
                            if (cVar9.h()) {
                            }
                            this.f57100j = false;
                            this.f57102k = false;
                        }
                    }
                    i14 = i38;
                    cVar6 = cVar2;
                    i13 = i32;
                    z21 = true;
                    i15 = i24;
                    int[] iArr522 = this.f57113s;
                    iArr522[0] = i14;
                    iArr522[1] = i15;
                    if (!z21) {
                    }
                    if (z21) {
                    }
                    if (iArr[0] == 2) {
                    }
                    if (z22) {
                    }
                    cVar7 = this.O;
                    boolean z38222 = !cVar7.h();
                    char c11222 = '\b';
                    boolean z39222 = zArr4[0];
                    boolean z41222 = zArr4[1];
                    i17 = this.n;
                    iArr2 = this.B;
                    if (i17 == 2) {
                    }
                    if (z11) {
                    }
                    if (this.o == 2) {
                    }
                    if (i22 == 0) {
                    }
                    if (z21) {
                    }
                    if (cVar9.h()) {
                    }
                    this.f57100j = false;
                    this.f57102k = false;
                }
                z21 = false;
                int[] iArr5222 = this.f57113s;
                iArr5222[0] = i14;
                iArr5222[1] = i15;
                if (!z21) {
                }
                if (z21) {
                }
                if (iArr[0] == 2) {
                }
                if (z22) {
                }
                cVar7 = this.O;
                boolean z382222 = !cVar7.h();
                char c112222 = '\b';
                boolean z392222 = zArr4[0];
                boolean z412222 = zArr4[1];
                i17 = this.n;
                iArr2 = this.B;
                if (i17 == 2) {
                }
                if (z11) {
                }
                if (this.o == 2) {
                }
                if (i22 == 0) {
                }
                if (z21) {
                }
                if (cVar9.h()) {
                }
                this.f57100j = false;
                this.f57102k = false;
            }
            cVar5 = cVar15;
            fVar = fVarK4;
            cVar6 = cVar2;
            i13 = i32;
            i14 = i36;
            i15 = i37;
            z21 = false;
            int[] iArr52222 = this.f57113s;
            iArr52222[0] = i14;
            iArr52222[1] = i15;
            if (!z21) {
            }
            if (z21) {
            }
            if (iArr[0] == 2) {
            }
            if (z22) {
            }
            cVar7 = this.O;
            boolean z3822222 = !cVar7.h();
            char c1122222 = '\b';
            boolean z3922222 = zArr4[0];
            boolean z4122222 = zArr4[1];
            i17 = this.n;
            iArr2 = this.B;
            if (i17 == 2) {
            }
            if (z11) {
            }
            if (this.o == 2) {
            }
            if (i22 == 0) {
            }
            if (z21) {
            }
            if (cVar9.h()) {
            }
            this.f57100j = false;
            this.f57102k = false;
        }
        z12 = false;
        z13 = z12 ? 1 : 0;
        z14 = z13;
        r17 = z12;
        i5 = this.f57093f0;
        boolean[] zArr42 = this.R;
        boolean z312 = z13;
        if (i5 != 8) {
        }
        z16 = this.f57100j;
        if (!z16) {
            if (z16) {
            }
            if (this.f57102k) {
            }
            if (this.f57100j) {
                boolean z322 = r17;
                this.f57100j = z322;
                this.f57102k = z322;
                return;
            }
        }
        zArr = this.f57092f;
        if (z11) {
            cVar2 = cVar16;
            zArr2 = zArr;
        }
        if (this.S == null) {
        }
        i11 = this.T;
        i12 = this.f57083a0;
        if (i11 >= i12) {
        }
        int i292 = this.U;
        c cVar172 = cVar4;
        int i312 = this.f57085b0;
        if (i292 >= i312) {
        }
        iArr = this.f57109o0;
        int i332 = iArr[0];
        boolean z332 = z17;
        if (i332 == 3) {
        }
        int i342 = iArr[1];
        if (i342 == 3) {
        }
        int i352 = this.W;
        this.f57120z = i352;
        f11 = this.V;
        this.A = f11;
        int i362 = this.f57111q;
        int i372 = this.f57112r;
        if (f11 <= 0.0f) {
        }
        fVar = fVarK4;
        cVar6 = cVar2;
        i13 = i32;
        i14 = i362;
        i15 = i372;
        z21 = false;
        int[] iArr522222 = this.f57113s;
        iArr522222[0] = i14;
        iArr522222[1] = i15;
        if (!z21) {
        }
        if (z21) {
        }
        if (iArr[0] == 2) {
        }
        if (z22) {
        }
        cVar7 = this.O;
        boolean z38222222 = !cVar7.h();
        char c11222222 = '\b';
        boolean z39222222 = zArr42[0];
        boolean z41222222 = zArr42[1];
        i17 = this.n;
        iArr2 = this.B;
        if (i17 == 2) {
        }
        if (z11) {
        }
        if (this.o == 2) {
        }
        if (i22 == 0) {
        }
        if (z21) {
        }
        if (cVar9.h()) {
        }
        this.f57100j = false;
        this.f57102k = false;
    }

    public boolean c() {
        return this.f57093f0 != 8;
    }

    /* JADX WARN: Removed duplicated region for block: B:217:0x03bc A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:220:0x03c5  */
    /* JADX WARN: Removed duplicated region for block: B:222:0x03c9  */
    /* JADX WARN: Removed duplicated region for block: B:231:0x0402  */
    /* JADX WARN: Removed duplicated region for block: B:240:0x041f  */
    /* JADX WARN: Removed duplicated region for block: B:257:0x0452  */
    /* JADX WARN: Removed duplicated region for block: B:259:0x0458  */
    /* JADX WARN: Removed duplicated region for block: B:287:0x0493 A[PHI: r3
      0x0493: PHI (r3v17 int) = (r3v16 int), (r3v21 int), (r3v21 int), (r3v21 int) binds: [B:280:0x0483, B:282:0x0489, B:283:0x048b, B:285:0x048f] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:290:0x04a5  */
    /* JADX WARN: Removed duplicated region for block: B:303:0x04c6  */
    /* JADX WARN: Removed duplicated region for block: B:308:0x04d4 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:337:0x0521  */
    /* JADX WARN: Removed duplicated region for block: B:345:? A[ADDED_TO_REGION, RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void d(e4.c cVar, boolean z11, boolean z12, boolean z13, boolean z14, e4.f fVar, e4.f fVar2, int i5, boolean z15, c cVar2, c cVar3, int i11, int i12, int i13, int i14, float f11, boolean z16, boolean z17, boolean z18, boolean z19, boolean z21, int i15, int i16, int i17, int i18, float f12, boolean z22) {
        boolean z23;
        boolean z24;
        int iMin;
        boolean z25;
        boolean z26;
        int i19;
        int i21;
        boolean z27;
        e4.f fVarK;
        e4.f fVarK2;
        c cVar4;
        e4.f fVar3;
        boolean z28;
        int i22;
        e4.f fVar4;
        e4.f fVar5;
        e4.f fVar6;
        e4.f fVar7;
        int i23;
        int i24;
        int i25;
        boolean z29;
        boolean z31;
        boolean z32;
        boolean z33;
        d dVar;
        int i26;
        int i27;
        c cVar5;
        boolean z34;
        int iMin2;
        boolean z35;
        int i28;
        HashSet hashSet;
        boolean z36;
        int i29;
        int i31;
        int i32;
        int i33;
        int i34;
        boolean z37;
        boolean z38;
        int i35;
        e4.c cVar6 = cVar;
        int i36 = i17;
        int i37 = i18;
        e4.f fVarK3 = cVar6.k(cVar2);
        e4.f fVarK4 = cVar6.k(cVar3);
        e4.f fVarK5 = cVar6.k(cVar2.f57078f);
        e4.f fVarK6 = cVar6.k(cVar3.f57078f);
        boolean zH = cVar2.h();
        boolean zH2 = cVar3.h();
        boolean zH3 = this.O.h();
        int i38 = zH2 ? (zH ? 1 : 0) + 1 : zH ? 1 : 0;
        if (zH3) {
            i38++;
        }
        int i39 = i38;
        int i40 = z16 ? 3 : i15;
        int iF = c0.F(i5);
        boolean z39 = (iF == 0 || iF == 1 || iF != 2 || i40 == 4) ? false : true;
        int i41 = this.f57096h;
        if (i41 == -1 || !z11) {
            i41 = i12;
            z23 = z39;
        } else {
            this.f57096h = -1;
            z23 = false;
        }
        int i42 = this.f57098i;
        if (i42 == -1 || z11) {
            z24 = z23;
        } else {
            this.f57098i = -1;
            i41 = i42;
            z24 = false;
        }
        boolean z41 = z24;
        if (this.f57093f0 == 8) {
            z25 = false;
            iMin = 0;
        } else {
            iMin = i41;
            z25 = z41;
        }
        if (z22) {
            if (!zH && !zH2 && !zH3) {
                cVar6.d(fVarK3, i11);
            } else if (zH && !zH2) {
                z26 = z25;
                i19 = 8;
                cVar6.e(fVarK3, fVarK5, cVar2.e(), 8);
            }
            z26 = z25;
            i19 = 8;
        } else {
            z26 = z25;
            i19 = 8;
        }
        if (z26) {
            if (i39 == 2 || z16 || !(i40 == 1 || i40 == 0)) {
                if (i36 == -2) {
                    i36 = iMin;
                }
                if (i37 == -2) {
                    i37 = iMin;
                }
                if (iMin > 0 && i40 != 1) {
                    iMin = 0;
                }
                if (i36 > 0) {
                    cVar6.f(fVarK4, fVarK3, i36, 8);
                    iMin = Math.max(iMin, i36);
                }
                if (i37 > 0) {
                    if (!z12 || i40 != 1) {
                        cVar6.g(fVarK4, fVarK3, i37, 8);
                    }
                    iMin = Math.min(iMin, i37);
                }
                if (i40 == 1) {
                    if (z12) {
                        cVar6.e(fVarK4, fVarK3, iMin, 8);
                    } else if (z18) {
                        cVar6.e(fVarK4, fVarK3, iMin, 5);
                        cVar6.g(fVarK4, fVarK3, iMin, 8);
                    } else {
                        cVar6.e(fVarK4, fVarK3, iMin, 5);
                        cVar6.g(fVarK4, fVarK3, iMin, 8);
                    }
                } else if (i40 == 2) {
                    int i43 = cVar2.f57077e;
                    if (i43 == 3 || i43 == 5) {
                        fVarK = cVar6.k(this.S.i(3));
                        fVarK2 = cVar6.k(this.S.i(5));
                    } else {
                        fVarK = cVar6.k(this.S.i(2));
                        fVarK2 = cVar6.k(this.S.i(4));
                    }
                    e4.b bVarL = cVar6.l();
                    int i44 = i36;
                    bVarL.f52132d.g(fVarK4, -1.0f);
                    bVarL.f52132d.g(fVarK3, 1.0f);
                    bVarL.f52132d.g(fVarK2, f12);
                    bVarL.f52132d.g(fVarK, -f12);
                    cVar6.c(bVarL);
                    if (z12) {
                        z26 = false;
                    }
                    z27 = z14;
                    i21 = i44;
                } else {
                    i21 = i36;
                    z27 = true;
                }
            } else {
                int iMax = Math.max(i36, iMin);
                if (i37 > 0) {
                    iMax = Math.min(i37, iMax);
                }
                cVar6.e(fVarK4, fVarK3, iMax, 8);
                z27 = z14;
                i21 = i36;
                z26 = false;
            }
            if (z22 || z18) {
                boolean z42 = z27;
                if (i39 >= 2 && z12 && z42) {
                    cVar6.f(fVarK3, fVar, 0, 8);
                    c cVar7 = this.L;
                    boolean z43 = z11 || cVar7.f57078f == null;
                    if (!z11 && (cVar4 = cVar7.f57078f) != null) {
                        d dVar2 = cVar4.f57076d;
                        if (dVar2.V != 0.0f) {
                            int[] iArr = dVar2.f57109o0;
                            z43 = iArr[0] == 3 && iArr[1] == 3;
                        }
                    }
                    if (z43) {
                        cVar6.f(fVar2, fVarK4, 0, 8);
                        return;
                    }
                    return;
                }
                return;
            }
            if (!zH && !zH2 && !zH3) {
                cVar5 = cVar3;
                fVar6 = fVarK4;
                z28 = z27;
                fVar3 = fVarK6;
            } else if (!zH || zH2) {
                if (zH || !zH2) {
                    fVar3 = fVarK6;
                    if (zH && zH2) {
                        d dVar3 = cVar2.f57078f.f57076d;
                        d dVar4 = cVar3.f57078f.f57076d;
                        z28 = z27;
                        d dVar5 = this.S;
                        int i45 = 6;
                        if (z26) {
                            if (i40 == 0) {
                                if (i37 != 0 || i21 != 0) {
                                    i33 = 5;
                                    i34 = 5;
                                    z37 = true;
                                    z38 = false;
                                    z31 = true;
                                } else if (fVarK5.f52160f && fVar3.f52160f) {
                                    cVar6.e(fVarK3, fVarK5, cVar2.e(), 8);
                                    cVar6.e(fVarK4, fVar3, -cVar3.e(), 8);
                                    return;
                                } else {
                                    i33 = 8;
                                    i34 = 8;
                                    z37 = false;
                                    z38 = true;
                                    z31 = false;
                                }
                                if ((dVar3 instanceof a) || (dVar4 instanceof a)) {
                                    cVar6 = cVar;
                                    i22 = i40;
                                    fVar5 = fVarK3;
                                    fVar6 = fVarK4;
                                    z32 = z38;
                                    fVar4 = fVar2;
                                    i24 = i33;
                                    fVar7 = fVarK5;
                                    i23 = 6;
                                    z29 = z37;
                                    i25 = 4;
                                    if (z31 || fVar7 != fVar3 || dVar3 == dVar5) {
                                        z33 = true;
                                    } else {
                                        z31 = false;
                                        z33 = false;
                                    }
                                    if (z29) {
                                        dVar = dVar4;
                                        i26 = i21;
                                        i27 = i22;
                                        cVar5 = cVar3;
                                        z34 = z12;
                                    } else {
                                        if (z26 || z17 || z19 || fVar7 != fVar || fVar3 != fVar4) {
                                            z34 = z12;
                                            z36 = z33;
                                            i29 = i24;
                                        } else {
                                            i23 = 8;
                                            z34 = false;
                                            i29 = 8;
                                            z36 = false;
                                        }
                                        e4.f fVar8 = fVar7;
                                        i26 = i21;
                                        i27 = i22;
                                        dVar = dVar4;
                                        cVar5 = cVar3;
                                        cVar6.b(fVar5, fVar8, cVar2.e(), f11, fVar3, fVar6, cVar3.e(), i23);
                                        fVar7 = fVar8;
                                        i24 = i29;
                                        z33 = z36;
                                    }
                                    if (this.f57093f0 != 8 && ((hashSet = cVar5.f57073a) == null || hashSet.size() <= 0)) {
                                        return;
                                    }
                                    if (z31) {
                                        if (z34 && fVar7 != fVar3 && !z26 && ((dVar3 instanceof a) || (dVar instanceof a))) {
                                            i24 = 6;
                                        }
                                        cVar6.f(fVar5, fVar7, cVar2.e(), i24);
                                        cVar6.g(fVar6, fVar3, -cVar5.e(), i24);
                                    }
                                    if (z34 || !z21 || (dVar3 instanceof a) || (dVar instanceof a) || dVar == dVar5) {
                                        iMin2 = i25;
                                        z35 = z33;
                                    } else {
                                        iMin2 = 6;
                                        i24 = 6;
                                        z35 = true;
                                    }
                                    if (z35) {
                                        if (z32 && (!z19 || z13)) {
                                            if (dVar3 != dVar5 && dVar != dVar5) {
                                                i45 = iMin2;
                                            }
                                            if ((dVar3 instanceof h) || (dVar instanceof h)) {
                                                i45 = 5;
                                            }
                                            if ((dVar3 instanceof a) || (dVar instanceof a)) {
                                                i45 = 5;
                                            }
                                            iMin2 = Math.max(z19 ? 5 : i45, iMin2);
                                        }
                                        if (z34) {
                                            iMin2 = Math.min(i24, iMin2);
                                            int i46 = (z16 && !z19 && (dVar3 == dVar5 || dVar == dVar5)) ? 4 : iMin2;
                                            cVar6.e(fVar5, fVar7, cVar2.e(), i46);
                                            cVar6.e(fVar6, fVar3, -cVar5.e(), i46);
                                        }
                                    }
                                    if (z34) {
                                        int iE = fVar == fVar7 ? cVar2.e() : 0;
                                        if (fVar7 != fVar) {
                                            cVar6.f(fVar5, fVar, iE, 5);
                                        }
                                    }
                                    if (z34 || !z26 || i13 != 0 || i26 != 0) {
                                        i28 = 5;
                                        i35 = i28;
                                    } else if (z26 && i27 == 3) {
                                        cVar6.f(fVar6, fVar5, 0, 8);
                                        i28 = 5;
                                        i35 = i28;
                                    } else {
                                        i28 = 5;
                                        cVar6.f(fVar6, fVar5, 0, 5);
                                        i35 = i28;
                                    }
                                } else {
                                    cVar6 = cVar;
                                    fVar5 = fVarK3;
                                    fVar6 = fVarK4;
                                    z32 = z38;
                                    i24 = i33;
                                    fVar7 = fVarK5;
                                    i23 = 6;
                                    z29 = z37;
                                    i25 = i34;
                                    i22 = i40;
                                    fVar4 = fVar2;
                                    if (z31) {
                                        z33 = true;
                                        if (z29) {
                                        }
                                        if (this.f57093f0 != 8) {
                                        }
                                        if (z31) {
                                        }
                                        if (z34) {
                                            iMin2 = i25;
                                            z35 = z33;
                                            if (z35) {
                                            }
                                            if (z34) {
                                            }
                                            if (z34) {
                                                i28 = 5;
                                                i35 = i28;
                                            }
                                        }
                                    }
                                }
                            } else {
                                if (i40 == 2) {
                                    if ((dVar3 instanceof a) || (dVar4 instanceof a)) {
                                        cVar6 = cVar;
                                        i22 = i40;
                                        fVar5 = fVarK3;
                                        fVar6 = fVarK4;
                                        fVar7 = fVarK5;
                                        i23 = 6;
                                        i24 = 5;
                                    } else {
                                        cVar6 = cVar;
                                        i22 = i40;
                                        fVar5 = fVarK3;
                                        fVar6 = fVarK4;
                                        fVar7 = fVarK5;
                                        i23 = 6;
                                        i24 = 5;
                                        i25 = 5;
                                        z29 = true;
                                        z31 = true;
                                        z32 = false;
                                        fVar4 = fVar2;
                                        if (z31) {
                                        }
                                    }
                                } else if (i40 == 1) {
                                    cVar6 = cVar;
                                    i22 = i40;
                                    fVar5 = fVarK3;
                                    fVar6 = fVarK4;
                                    fVar7 = fVarK5;
                                    i23 = 6;
                                    i24 = 8;
                                } else if (i40 == 3) {
                                    i22 = i40;
                                    if (this.f57120z != -1) {
                                        if (z16) {
                                            if (i16 == 2 || i16 == 1) {
                                                i31 = 5;
                                                i32 = 4;
                                            } else {
                                                i31 = 8;
                                                i32 = 5;
                                            }
                                            i25 = i32;
                                            fVar5 = fVarK3;
                                            fVar6 = fVarK4;
                                            fVar7 = fVarK5;
                                            i23 = 6;
                                            z29 = true;
                                            z31 = true;
                                            z32 = true;
                                            fVar4 = fVar2;
                                        } else if (i37 > 0) {
                                            cVar6 = cVar;
                                            fVar4 = fVar2;
                                            fVar5 = fVarK3;
                                            fVar6 = fVarK4;
                                            fVar7 = fVarK5;
                                            i23 = 6;
                                            i24 = 5;
                                        } else {
                                            if (i37 != 0 || i21 != 0) {
                                                cVar6 = cVar;
                                                fVar4 = fVar2;
                                                fVar5 = fVarK3;
                                                fVar6 = fVarK4;
                                                fVar7 = fVarK5;
                                                i23 = 6;
                                                i24 = 5;
                                                i25 = 4;
                                            } else if (z19) {
                                                i31 = (dVar3 == dVar5 || dVar4 == dVar5) ? 5 : 4;
                                                fVar4 = fVar2;
                                                fVar5 = fVarK3;
                                                fVar6 = fVarK4;
                                                fVar7 = fVarK5;
                                                i23 = 6;
                                                i25 = 4;
                                                z29 = true;
                                                z31 = true;
                                                z32 = true;
                                            } else {
                                                cVar6 = cVar;
                                                fVar4 = fVar2;
                                                fVar5 = fVarK3;
                                                fVar6 = fVarK4;
                                                fVar7 = fVarK5;
                                                i23 = 6;
                                                i24 = 5;
                                                i25 = 8;
                                            }
                                            z29 = true;
                                            z31 = true;
                                            z32 = true;
                                            if (z31) {
                                            }
                                        }
                                        i24 = i31;
                                        cVar6 = cVar;
                                        if (z31) {
                                        }
                                    } else if (z19) {
                                        cVar6 = cVar;
                                        fVar4 = fVar2;
                                        fVar5 = fVarK3;
                                        fVar6 = fVarK4;
                                        fVar7 = fVarK5;
                                        i24 = 8;
                                        i23 = z12 ? 5 : 4;
                                    } else {
                                        cVar6 = cVar;
                                        fVar4 = fVar2;
                                        fVar5 = fVarK3;
                                        fVar6 = fVarK4;
                                        fVar7 = fVarK5;
                                        i24 = 8;
                                        i23 = 8;
                                    }
                                    i25 = 5;
                                    z29 = true;
                                    z31 = true;
                                    z32 = true;
                                    if (z31) {
                                    }
                                } else {
                                    i22 = i40;
                                    cVar6 = cVar;
                                    fVar4 = fVar2;
                                    fVar5 = fVarK3;
                                    fVar6 = fVarK4;
                                    fVar7 = fVarK5;
                                    i23 = 6;
                                    i24 = 5;
                                    i25 = 4;
                                    z29 = false;
                                    z31 = false;
                                }
                                i25 = 4;
                                z29 = true;
                                z31 = true;
                                z32 = false;
                                fVar4 = fVar2;
                                if (z31) {
                                }
                            }
                            if (z34 && z28) {
                                int iE2 = cVar5.f57078f != null ? cVar5.e() : 0;
                                if (fVar3 != fVar2) {
                                    cVar6.f(fVar2, fVar6, iE2, i35);
                                    return;
                                }
                                return;
                            }
                            return;
                        }
                        i22 = i40;
                        if (fVarK5.f52160f && fVar3.f52160f) {
                            cVar.b(fVarK3, fVarK5, cVar2.e(), f11, fVar3, fVarK4, cVar3.e(), 8);
                            if (z12 && z28) {
                                int iE3 = cVar3.f57078f != null ? cVar3.e() : 0;
                                if (fVar3 != fVar2) {
                                    cVar.f(fVar2, fVarK4, iE3, 5);
                                    return;
                                }
                                return;
                            }
                            return;
                        }
                        cVar6 = cVar;
                        fVar4 = fVar2;
                        fVar5 = fVarK3;
                        fVar6 = fVarK4;
                        fVar7 = fVarK5;
                        i23 = 6;
                        i24 = 5;
                        i25 = 4;
                        z29 = true;
                        z31 = true;
                        z32 = false;
                        if (z31) {
                        }
                        if (z34) {
                            return;
                        } else {
                            return;
                        }
                    }
                } else {
                    fVar3 = fVarK6;
                    cVar6.e(fVarK4, fVar3, -cVar3.e(), 8);
                    if (z12) {
                        cVar6.f(fVarK3, fVar, 0, 5);
                        cVar5 = cVar3;
                        i28 = 5;
                        fVar6 = fVarK4;
                        z28 = z27;
                        z34 = z12;
                        i35 = i28;
                        if (z34) {
                        }
                    }
                }
                cVar5 = cVar3;
                fVar6 = fVarK4;
                z28 = z27;
            } else {
                cVar5 = cVar3;
                fVar6 = fVarK4;
                z28 = z27;
                fVar3 = fVarK6;
                z34 = z12;
                i35 = (z12 && (cVar2.f57078f.f57076d instanceof a)) ? 8 : 5;
                if (z34) {
                }
            }
            i28 = 5;
            z34 = z12;
            i35 = i28;
            if (z34) {
            }
        } else if (z15) {
            cVar6.e(fVarK4, fVarK3, 0, 3);
            if (i13 > 0) {
                cVar6.f(fVarK4, fVarK3, i13, i19);
            }
            if (i14 < Integer.MAX_VALUE) {
                cVar6.g(fVarK4, fVarK3, i14, i19);
            }
        } else {
            cVar6.e(fVarK4, fVarK3, iMin, i19);
        }
        z27 = z14;
        i21 = i36;
        if (z22) {
        }
        boolean z422 = z27;
        if (i39 >= 2) {
        }
    }

    public final void e(int i5, d dVar, int i11, int i12) {
        boolean z11;
        if (i5 == 7) {
            if (i11 != 7) {
                if (i11 == 2 || i11 == 4) {
                    e(2, dVar, i11, 0);
                    e(4, dVar, i11, 0);
                    i(7).a(dVar.i(i11), 0);
                    return;
                } else {
                    if (i11 == 3 || i11 == 5) {
                        e(3, dVar, i11, 0);
                        e(5, dVar, i11, 0);
                        i(7).a(dVar.i(i11), 0);
                        return;
                    }
                    return;
                }
            }
            c cVarI = i(2);
            c cVarI2 = i(4);
            c cVarI3 = i(3);
            c cVarI4 = i(5);
            boolean z12 = true;
            if ((cVarI == null || !cVarI.h()) && (cVarI2 == null || !cVarI2.h())) {
                e(2, dVar, 2, 0);
                e(4, dVar, 4, 0);
                z11 = true;
            } else {
                z11 = false;
            }
            if ((cVarI3 == null || !cVarI3.h()) && (cVarI4 == null || !cVarI4.h())) {
                e(3, dVar, 3, 0);
                e(5, dVar, 5, 0);
            } else {
                z12 = false;
            }
            if (z11 && z12) {
                i(7).a(dVar.i(7), 0);
                return;
            } else if (z11) {
                i(8).a(dVar.i(8), 0);
                return;
            } else {
                if (z12) {
                    i(9).a(dVar.i(9), 0);
                    return;
                }
                return;
            }
        }
        if (i5 == 8 && (i11 == 2 || i11 == 4)) {
            c cVarI5 = i(2);
            c cVarI6 = dVar.i(i11);
            c cVarI7 = i(4);
            cVarI5.a(cVarI6, 0);
            cVarI7.a(cVarI6, 0);
            i(8).a(cVarI6, 0);
            return;
        }
        if (i5 == 9 && (i11 == 3 || i11 == 5)) {
            c cVarI8 = dVar.i(i11);
            i(3).a(cVarI8, 0);
            i(5).a(cVarI8, 0);
            i(9).a(cVarI8, 0);
            return;
        }
        if (i5 == 8 && i11 == 8) {
            i(2).a(dVar.i(2), 0);
            i(4).a(dVar.i(4), 0);
            i(8).a(dVar.i(i11), 0);
            return;
        }
        if (i5 == 9 && i11 == 9) {
            i(3).a(dVar.i(3), 0);
            i(5).a(dVar.i(5), 0);
            i(9).a(dVar.i(i11), 0);
            return;
        }
        c cVarI9 = i(i5);
        c cVarI10 = dVar.i(i11);
        if (cVarI9.i(cVarI10)) {
            if (i5 == 6) {
                c cVarI11 = i(3);
                c cVarI12 = i(5);
                if (cVarI11 != null) {
                    cVarI11.j();
                }
                if (cVarI12 != null) {
                    cVarI12.j();
                }
            } else if (i5 == 3 || i5 == 5) {
                c cVarI13 = i(6);
                if (cVarI13 != null) {
                    cVarI13.j();
                }
                c cVarI14 = i(7);
                if (cVarI14.f57078f != cVarI10) {
                    cVarI14.j();
                }
                c cVarF = i(i5).f();
                c cVarI15 = i(9);
                if (cVarI15.h()) {
                    cVarF.j();
                    cVarI15.j();
                }
            } else if (i5 == 2 || i5 == 4) {
                c cVarI16 = i(7);
                if (cVarI16.f57078f != cVarI10) {
                    cVarI16.j();
                }
                c cVarF2 = i(i5).f();
                c cVarI17 = i(8);
                if (cVarI17.h()) {
                    cVarF2.j();
                    cVarI17.j();
                }
            }
            cVarI9.a(cVarI10, i12);
        }
    }

    public final void f(c cVar, c cVar2, int i5) {
        if (cVar.f57076d == this) {
            e(cVar.f57077e, cVar2.f57076d, cVar2.f57077e, i5);
        }
    }

    public final void g(e4.c cVar) {
        cVar.k(this.H);
        cVar.k(this.I);
        cVar.k(this.J);
        cVar.k(this.K);
        if (this.Z > 0) {
            cVar.k(this.L);
        }
    }

    public final void h() {
        if (this.f57088d == null) {
            k kVar = new k(this);
            kVar.f59139h.f59111e = 4;
            kVar.f59140i.f59111e = 5;
            kVar.f59137f = 0;
            this.f57088d = kVar;
        }
        if (this.f57090e == null) {
            m mVar = new m(this);
            h4.f fVar = new h4.f(mVar);
            mVar.f59124k = fVar;
            mVar.f59125l = null;
            mVar.f59139h.f59111e = 6;
            mVar.f59140i.f59111e = 7;
            fVar.f59111e = 8;
            mVar.f59137f = 1;
            this.f57090e = mVar;
        }
    }

    public c i(int i5) {
        switch (c0.F(i5)) {
            case 0:
                return null;
            case 1:
                return this.H;
            case 2:
                return this.I;
            case 3:
                return this.J;
            case 4:
                return this.K;
            case 5:
                return this.L;
            case 6:
                return this.O;
            case 7:
                return this.M;
            case 8:
                return this.N;
            default:
                throw new AssertionError(fq.c.w(i5));
        }
    }

    public final int j(int i5) {
        int[] iArr = this.f57109o0;
        if (i5 == 0) {
            return iArr[0];
        }
        if (i5 == 1) {
            return iArr[1];
        }
        return 0;
    }

    public final int k() {
        if (this.f57093f0 == 8) {
            return 0;
        }
        return this.U;
    }

    public final d l(int i5) {
        c cVar;
        c cVar2;
        if (i5 != 0) {
            if (i5 == 1 && (cVar2 = (cVar = this.K).f57078f) != null && cVar2.f57078f == cVar) {
                return cVar2.f57076d;
            }
            return null;
        }
        c cVar3 = this.J;
        c cVar4 = cVar3.f57078f;
        if (cVar4 == null || cVar4.f57078f != cVar3) {
            return null;
        }
        return cVar4.f57076d;
    }

    public final d m(int i5) {
        c cVar;
        c cVar2;
        if (i5 != 0) {
            if (i5 == 1 && (cVar2 = (cVar = this.I).f57078f) != null && cVar2.f57078f == cVar) {
                return cVar2.f57076d;
            }
            return null;
        }
        c cVar3 = this.H;
        c cVar4 = cVar3.f57078f;
        if (cVar4 == null || cVar4.f57078f != cVar3) {
            return null;
        }
        return cVar4.f57076d;
    }

    public final int n() {
        if (this.f57093f0 == 8) {
            return 0;
        }
        return this.T;
    }

    public final int o() {
        d dVar = this.S;
        return (dVar == null || !(dVar instanceof e)) ? this.X : ((e) dVar).f57128w0 + this.X;
    }

    public final int p() {
        d dVar = this.S;
        return (dVar == null || !(dVar instanceof e)) ? this.Y : ((e) dVar).f57129x0 + this.Y;
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x003a A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:30:0x003b A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean q(int i5) {
        if (i5 == 0) {
            return (this.H.f57078f != null ? 1 : 0) + (this.J.f57078f != null ? 1 : 0) < 2;
        }
        if ((this.I.f57078f != null ? 1 : 0) + (this.K.f57078f != null ? 1 : 0) + (this.L.f57078f != null ? 1 : 0) < 2) {
        }
    }

    public final boolean r(int i5, int i11) {
        c cVar;
        c cVar2;
        c cVar3;
        c cVar4;
        if (i5 == 0) {
            c cVar5 = this.H;
            c cVar6 = cVar5.f57078f;
            if (cVar6 == null || !cVar6.f57075c || (cVar4 = (cVar3 = this.J).f57078f) == null || !cVar4.f57075c) {
                return false;
            }
            return (cVar4.d() - cVar3.e()) - (cVar5.e() + cVar5.f57078f.d()) >= i11;
        }
        c cVar7 = this.I;
        c cVar8 = cVar7.f57078f;
        if (cVar8 == null || !cVar8.f57075c || (cVar2 = (cVar = this.K).f57078f) == null || !cVar2.f57075c) {
            return false;
        }
        return (cVar2.d() - cVar.e()) - (cVar7.e() + cVar7.f57078f.d()) >= i11;
    }

    public final void s(int i5, int i11, int i12, int i13, d dVar) {
        i(i5).b(dVar.i(i11), i12, i13, true);
    }

    public final boolean t(int i5) {
        c cVar;
        c cVar2;
        int i11 = i5 * 2;
        c[] cVarArr = this.P;
        c cVar3 = cVarArr[i11];
        c cVar4 = cVar3.f57078f;
        return (cVar4 == null || cVar4.f57078f == cVar3 || (cVar2 = (cVar = cVarArr[i11 + 1]).f57078f) == null || cVar2.f57078f != cVar) ? false : true;
    }

    public String toString() {
        String strQ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        StringBuilder sbQ = a2.c.q(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        if (this.f57095g0 != null) {
            strQ = c0.q(new StringBuilder("id: "), this.f57095g0, " ");
        }
        sbQ.append(strQ);
        sbQ.append("(");
        sbQ.append(this.X);
        sbQ.append(", ");
        sbQ.append(this.Y);
        sbQ.append(") - (");
        sbQ.append(this.T);
        sbQ.append(" x ");
        return c0.o(sbQ, this.U, ")");
    }

    public final boolean u() {
        c cVar = this.H;
        c cVar2 = cVar.f57078f;
        if (cVar2 != null && cVar2.f57078f == cVar) {
            return true;
        }
        c cVar3 = this.J;
        c cVar4 = cVar3.f57078f;
        return cVar4 != null && cVar4.f57078f == cVar3;
    }

    public final boolean v() {
        c cVar = this.I;
        c cVar2 = cVar.f57078f;
        if (cVar2 != null && cVar2.f57078f == cVar) {
            return true;
        }
        c cVar3 = this.K;
        c cVar4 = cVar3.f57078f;
        return cVar4 != null && cVar4.f57078f == cVar3;
    }

    public final boolean w() {
        return this.f57094g && this.f57093f0 != 8;
    }

    public boolean x() {
        if (this.f57100j) {
            return true;
        }
        return this.H.f57075c && this.J.f57075c;
    }

    public boolean y() {
        if (this.f57102k) {
            return true;
        }
        return this.I.f57075c && this.K.f57075c;
    }

    public void z() {
        this.H.j();
        this.I.j();
        this.J.j();
        this.K.j();
        this.L.j();
        this.M.j();
        this.N.j();
        this.O.j();
        this.S = null;
        this.C = Float.NaN;
        this.T = 0;
        this.U = 0;
        this.V = 0.0f;
        this.W = -1;
        this.X = 0;
        this.Y = 0;
        this.Z = 0;
        this.f57083a0 = 0;
        this.f57085b0 = 0;
        this.f57087c0 = 0.5f;
        this.f57089d0 = 0.5f;
        int[] iArr = this.f57109o0;
        iArr[0] = 1;
        iArr[1] = 1;
        this.f57091e0 = null;
        this.f57093f0 = 0;
        this.f57097h0 = 0;
        this.f57099i0 = 0;
        float[] fArr = this.f57101j0;
        fArr[0] = -1.0f;
        fArr[1] = -1.0f;
        this.n = -1;
        this.o = -1;
        int[] iArr2 = this.B;
        iArr2[0] = Integer.MAX_VALUE;
        iArr2[1] = Integer.MAX_VALUE;
        this.f57111q = 0;
        this.f57112r = 0;
        this.f57116v = 1.0f;
        this.f57119y = 1.0f;
        this.f57115u = LayoutNode.NotPlacedPlaceOrder;
        this.f57118x = LayoutNode.NotPlacedPlaceOrder;
        this.f57114t = 0;
        this.f57117w = 0;
        this.f57120z = -1;
        this.A = 1.0f;
        boolean[] zArr = this.f57092f;
        zArr[0] = true;
        zArr[1] = true;
        this.E = false;
        boolean[] zArr2 = this.R;
        zArr2[0] = false;
        zArr2[1] = false;
        this.f57094g = true;
        int[] iArr3 = this.f57113s;
        iArr3[0] = 0;
        iArr3[1] = 0;
        this.f57096h = -1;
        this.f57098i = -1;
    }
}
