package h4;

import fa.u;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import m90.z;

/* loaded from: classes2.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f59098a = 0;

    /* renamed from: b, reason: collision with root package name */
    public boolean f59099b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f59100c;

    /* renamed from: d, reason: collision with root package name */
    public Object f59101d;

    /* renamed from: e, reason: collision with root package name */
    public Object f59102e;

    /* renamed from: f, reason: collision with root package name */
    public Serializable f59103f;

    /* renamed from: g, reason: collision with root package name */
    public Serializable f59104g;

    /* renamed from: h, reason: collision with root package name */
    public Object f59105h;

    /* renamed from: i, reason: collision with root package name */
    public Object f59106i;

    public /* synthetic */ e() {
    }

    public void a(f fVar, int i5, ArrayList arrayList, l lVar) {
        o oVar = fVar.f59110d;
        l lVar2 = oVar.f59134c;
        f fVar2 = oVar.f59140i;
        f fVar3 = oVar.f59139h;
        if (lVar2 == null) {
            g4.e eVar = (g4.e) this.f59101d;
            if (oVar == eVar.f57088d || oVar == eVar.f57090e) {
                return;
            }
            if (lVar == null) {
                lVar = new l();
                lVar.f59122a = null;
                lVar.f59123b = new ArrayList();
                lVar.f59122a = oVar;
                arrayList.add(lVar);
            }
            oVar.f59134c = lVar;
            lVar.f59123b.add(oVar);
            Iterator it = fVar3.f59117k.iterator();
            while (it.hasNext()) {
                d dVar = (d) it.next();
                if (dVar instanceof f) {
                    a((f) dVar, i5, arrayList, lVar);
                }
            }
            Iterator it2 = fVar2.f59117k.iterator();
            while (it2.hasNext()) {
                d dVar2 = (d) it2.next();
                if (dVar2 instanceof f) {
                    a((f) dVar2, i5, arrayList, lVar);
                }
            }
            if (i5 == 1 && (oVar instanceof m)) {
                Iterator it3 = ((m) oVar).f59124k.f59117k.iterator();
                while (it3.hasNext()) {
                    d dVar3 = (d) it3.next();
                    if (dVar3 instanceof f) {
                        a((f) dVar3, i5, arrayList, lVar);
                    }
                }
            }
            Iterator it4 = fVar3.f59118l.iterator();
            while (it4.hasNext()) {
                a((f) it4.next(), i5, arrayList, lVar);
            }
            Iterator it5 = fVar2.f59118l.iterator();
            while (it5.hasNext()) {
                a((f) it5.next(), i5, arrayList, lVar);
            }
            if (i5 == 1 && (oVar instanceof m)) {
                Iterator it6 = ((m) oVar).f59124k.f59118l.iterator();
                while (it6.hasNext()) {
                    a((f) it6.next(), i5, arrayList, lVar);
                }
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:146:0x0303  */
    /* JADX WARN: Removed duplicated region for block: B:149:0x0315  */
    /* JADX WARN: Removed duplicated region for block: B:150:0x0328  */
    /* JADX WARN: Removed duplicated region for block: B:171:0x0293 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:180:0x028c A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:188:0x019d A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:199:0x000a A[ADDED_TO_REGION, REMOVE, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00b3  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00c7  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x01a2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void b(g4.e eVar) {
        int i5;
        int i11;
        int i12;
        int iK;
        int i13;
        int i14;
        int i15;
        e eVar2;
        int i16;
        int i17;
        int i18;
        int i19;
        int i21;
        int i22;
        int i23;
        int i24;
        int i25;
        int i26;
        ArrayList arrayList = eVar.f57121p0;
        int[] iArr = eVar.f57109o0;
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            g4.d dVar = (g4.d) it.next();
            int[] iArr2 = dVar.f57109o0;
            g4.c[] cVarArr = dVar.P;
            g4.c cVar = dVar.K;
            g4.c cVar2 = dVar.I;
            g4.c cVar3 = dVar.J;
            g4.c cVar4 = dVar.H;
            int i27 = iArr2[0];
            int i28 = iArr2[1];
            if (dVar.f57093f0 == 8) {
                dVar.f57082a = true;
            } else {
                float f11 = dVar.f57116v;
                if (f11 < 1.0f && i27 == 3) {
                    dVar.f57111q = 2;
                }
                float f12 = dVar.f57119y;
                if (f12 < 1.0f && i28 == 3) {
                    dVar.f57112r = 2;
                }
                if (dVar.V > 0.0f) {
                    if (i27 == 3 && (i28 == 2 || i28 == 1)) {
                        dVar.f57111q = 3;
                    } else if (i28 == 3 && (i27 == 2 || i27 == 1)) {
                        dVar.f57112r = 3;
                    } else if (i27 == 3 && i28 == 3) {
                        if (dVar.f57111q == 0) {
                            dVar.f57111q = 3;
                        }
                        if (dVar.f57112r == 0) {
                            dVar.f57112r = 3;
                        }
                    }
                }
                if (i27 == 3 && dVar.f57111q == 1 && (cVar4.f57078f == null || cVar3.f57078f == null)) {
                    i27 = 2;
                }
                if (i28 == 3 && dVar.f57112r == 1 && (cVar2.f57078f == null || cVar.f57078f == null)) {
                    i28 = 2;
                }
                k kVar = dVar.f57088d;
                kVar.f59135d = i27;
                int i29 = dVar.f57111q;
                kVar.f59132a = i29;
                m mVar = dVar.f57090e;
                mVar.f59135d = i28;
                int i31 = dVar.f57112r;
                mVar.f59132a = i31;
                if (i27 == 4 || i27 == 1) {
                    if (i28 != 4) {
                        if (i28 != 1) {
                            i16 = 2;
                            if (i28 != 2) {
                                if (i27 == 3) {
                                    i17 = i28;
                                    i18 = 1;
                                } else if (i28 != i16 && i28 != 1) {
                                    i17 = i28;
                                    i19 = 3;
                                    i18 = 1;
                                    if (i17 == i19) {
                                    }
                                    i25 = 3;
                                    if (i24 == i25) {
                                    }
                                } else if (i29 == 3) {
                                    if (i28 == i16) {
                                        f(i16, 0, i16, 0, dVar);
                                    }
                                    int iK2 = dVar.k();
                                    f(1, (int) ((iK2 * dVar.V) + 0.5f), 1, iK2, dVar);
                                    dVar.f57088d.f59136e.d(dVar.n());
                                    dVar.f57090e.f59136e.d(dVar.k());
                                    dVar.f57082a = true;
                                } else {
                                    int i32 = i16;
                                    if (i29 == 1) {
                                        f(i32, 0, i28, 0, dVar);
                                        dVar.f57088d.f59136e.f59119m = dVar.n();
                                    } else {
                                        i16 = i32;
                                        if (i29 == 2) {
                                            int i33 = iArr[0];
                                            if (i33 == 1 || i33 == 4) {
                                                f(1, (int) ((f11 * eVar.n()) + 0.5f), i28, dVar.k(), dVar);
                                                dVar.f57088d.f59136e.d(dVar.n());
                                                dVar.f57090e.f59136e.d(dVar.k());
                                                dVar.f57082a = true;
                                            } else {
                                                i18 = 1;
                                                i17 = i28;
                                            }
                                        } else {
                                            i18 = 1;
                                            i17 = i28;
                                            if (cVarArr[0].f57078f == null || cVarArr[1].f57078f == null) {
                                                f(i16, 0, i17, 0, dVar);
                                                dVar.f57088d.f59136e.d(dVar.n());
                                                dVar.f57090e.f59136e.d(dVar.k());
                                                dVar.f57082a = true;
                                            }
                                        }
                                        if (i17 == i19) {
                                            i21 = i17;
                                            i22 = i16;
                                            i23 = 1;
                                            i24 = i27;
                                        } else if (i27 != i16 && i27 != i18) {
                                            i25 = i19;
                                            i21 = i17;
                                            i22 = i16;
                                            i23 = 1;
                                            i24 = i27;
                                            if (i24 == i25 && i21 == i25) {
                                                if (i29 == i23 || i31 == i23) {
                                                    f(i22, 0, i22, 0, dVar);
                                                    dVar.f57088d.f59136e.f59119m = dVar.n();
                                                    dVar.f57090e.f59136e.f59119m = dVar.k();
                                                } else if (i31 == 2 && i29 == 2 && iArr[0] == i18 && iArr[i23] == i18) {
                                                    f(i18, (int) ((f11 * eVar.n()) + 0.5f), i18, (int) ((f12 * eVar.k()) + 0.5f), dVar);
                                                    dVar.f57088d.f59136e.d(dVar.n());
                                                    dVar.f57090e.f59136e.d(dVar.k());
                                                    dVar.f57082a = true;
                                                }
                                            }
                                        } else if (i31 == i19) {
                                            if (i27 == i16) {
                                                i26 = i18;
                                                f(i16, 0, i16, 0, dVar);
                                            } else {
                                                i26 = i18;
                                            }
                                            int iN = dVar.n();
                                            float f13 = dVar.V;
                                            if (dVar.W == -1) {
                                                f13 = 1.0f / f13;
                                            }
                                            f(i26, iN, i26, (int) ((iN * f13) + 0.5f), dVar);
                                            dVar.f57088d.f59136e.d(dVar.n());
                                            dVar.f57090e.f59136e.d(dVar.k());
                                            dVar.f57082a = true;
                                        } else {
                                            int i34 = i17;
                                            int i35 = i18;
                                            int i36 = i16;
                                            if (i31 == 1) {
                                                f(i27, 0, i36, 0, dVar);
                                                dVar.f57090e.f59136e.f59119m = dVar.k();
                                            } else {
                                                int i37 = i27;
                                                if (i31 == 2) {
                                                    int i38 = iArr[1];
                                                    if (i38 == i35 || i38 == 4) {
                                                        f(i37, dVar.n(), i35, (int) ((f12 * eVar.k()) + 0.5f), dVar);
                                                        dVar.f57088d.f59136e.d(dVar.n());
                                                        dVar.f57090e.f59136e.d(dVar.k());
                                                        dVar.f57082a = true;
                                                    } else {
                                                        i21 = i34;
                                                        i24 = i37;
                                                        i18 = i35;
                                                        i22 = i36;
                                                        i23 = 1;
                                                    }
                                                } else {
                                                    i24 = i37;
                                                    i18 = i35;
                                                    if (cVarArr[2].f57078f == null || cVarArr[3].f57078f == null) {
                                                        f(i36, 0, i34, 0, dVar);
                                                        dVar.f57088d.f59136e.d(dVar.n());
                                                        dVar.f57090e.f59136e.d(dVar.k());
                                                        dVar.f57082a = true;
                                                    } else {
                                                        i21 = i34;
                                                        i22 = i36;
                                                        i23 = 1;
                                                    }
                                                }
                                            }
                                        }
                                        i25 = 3;
                                        if (i24 == i25) {
                                        }
                                    }
                                }
                                i19 = 3;
                                if (i17 == i19) {
                                }
                                i25 = 3;
                                if (i24 == i25) {
                                }
                            }
                        } else {
                            i12 = i28;
                            i5 = 1;
                            i11 = i27;
                            int iN2 = dVar.n();
                            if (i11 == 4) {
                                iN2 = (eVar.n() - cVar4.f57079g) - cVar3.f57079g;
                                i11 = i5;
                            }
                            int iK3 = dVar.k();
                            if (i12 != 4) {
                                iK = (eVar.k() - cVar2.f57079g) - cVar.f57079g;
                                i13 = i5;
                                eVar2 = this;
                                i14 = iN2;
                                i15 = i11;
                            } else {
                                iK = iK3;
                                i13 = i12;
                                i14 = iN2;
                                i15 = i11;
                                eVar2 = this;
                            }
                            eVar2.f(i15, i14, i13, iK, dVar);
                            dVar.f57088d.f59136e.d(dVar.n());
                            dVar.f57090e.f59136e.d(dVar.k());
                            dVar.f57082a = true;
                        }
                    }
                    i12 = i28;
                    i11 = i27;
                    i5 = 1;
                    int iN22 = dVar.n();
                    if (i11 == 4) {
                    }
                    int iK32 = dVar.k();
                    if (i12 != 4) {
                    }
                    eVar2.f(i15, i14, i13, iK, dVar);
                    dVar.f57088d.f59136e.d(dVar.n());
                    dVar.f57090e.f59136e.d(dVar.k());
                    dVar.f57082a = true;
                } else {
                    i16 = 2;
                    if (i27 == 2) {
                    }
                    if (i27 == 3) {
                    }
                    i19 = 3;
                    if (i17 == i19) {
                    }
                    i25 = 3;
                    if (i24 == i25) {
                    }
                }
            }
        }
    }

    public void c() {
        g4.e eVar = (g4.e) this.f59101d;
        ArrayList arrayList = (ArrayList) this.f59104g;
        ArrayList arrayList2 = (ArrayList) this.f59103f;
        arrayList2.clear();
        g4.e eVar2 = (g4.e) this.f59102e;
        eVar2.f57088d.f();
        eVar2.f57090e.f();
        arrayList2.add(eVar2.f57088d);
        arrayList2.add(eVar2.f57090e);
        Iterator it = eVar2.f57121p0.iterator();
        HashSet hashSet = null;
        while (it.hasNext()) {
            g4.d dVar = (g4.d) it.next();
            if (dVar instanceof g4.h) {
                i iVar = new i(dVar);
                dVar.f57088d.f();
                dVar.f57090e.f();
                iVar.f59137f = ((g4.h) dVar).f57162t0;
                arrayList2.add(iVar);
            } else {
                if (dVar.u()) {
                    if (dVar.f57084b == null) {
                        dVar.f57084b = new c(dVar, 0);
                    }
                    if (hashSet == null) {
                        hashSet = new HashSet();
                    }
                    hashSet.add(dVar.f57084b);
                } else {
                    arrayList2.add(dVar.f57088d);
                }
                if (dVar.v()) {
                    if (dVar.f57086c == null) {
                        dVar.f57086c = new c(dVar, 1);
                    }
                    if (hashSet == null) {
                        hashSet = new HashSet();
                    }
                    hashSet.add(dVar.f57086c);
                } else {
                    arrayList2.add(dVar.f57090e);
                }
                if (dVar instanceof g4.i) {
                    arrayList2.add(new j(dVar));
                }
            }
        }
        if (hashSet != null) {
            arrayList2.addAll(hashSet);
        }
        Iterator it2 = arrayList2.iterator();
        while (it2.hasNext()) {
            ((o) it2.next()).f();
        }
        Iterator it3 = arrayList2.iterator();
        while (it3.hasNext()) {
            o oVar = (o) it3.next();
            if (oVar.f59133b != eVar2) {
                oVar.d();
            }
        }
        arrayList.clear();
        e(eVar.f57088d, 0, arrayList);
        e(eVar.f57090e, 1, arrayList);
        this.f59099b = false;
    }

    public int d(g4.e eVar, int i5) {
        ArrayList arrayList;
        int i11;
        long jMax;
        float f11;
        g4.e eVar2 = eVar;
        ArrayList arrayList2 = (ArrayList) this.f59104g;
        int size = arrayList2.size();
        long j11 = 0;
        int i12 = 0;
        long jMax2 = 0;
        while (i12 < size) {
            o oVar = ((l) arrayList2.get(i12)).f59122a;
            if (!(oVar instanceof c) ? !(i5 != 0 ? (oVar instanceof m) : (oVar instanceof k)) : ((c) oVar).f59137f != i5) {
                f fVar = (i5 == 0 ? eVar2.f57088d : eVar2.f57090e).f59139h;
                f fVar2 = (i5 == 0 ? eVar2.f57088d : eVar2.f57090e).f59140i;
                f fVar3 = oVar.f59139h;
                f fVar4 = oVar.f59140i;
                boolean zContains = fVar3.f59118l.contains(fVar);
                boolean zContains2 = fVar4.f59118l.contains(fVar2);
                long j12 = oVar.j();
                if (zContains && zContains2) {
                    long jB = l.b(fVar3, j11);
                    long jA = l.a(fVar4, j11);
                    long j13 = jB - j12;
                    int i13 = fVar4.f59112f;
                    arrayList = arrayList2;
                    i11 = size;
                    if (j13 >= (-i13)) {
                        j13 += i13;
                    }
                    long j14 = fVar3.f59112f;
                    long j15 = ((-jA) - j12) - j14;
                    if (j15 >= j14) {
                        j15 -= j14;
                    }
                    g4.d dVar = oVar.f59133b;
                    if (i5 == 0) {
                        f11 = dVar.f57087c0;
                    } else if (i5 == 1) {
                        f11 = dVar.f57089d0;
                    } else {
                        dVar.getClass();
                        f11 = -1.0f;
                    }
                    float f12 = f11 > 0.0f ? (long) ((j13 / (1.0f - f11)) + (j15 / f11)) : 0L;
                    jMax = (fVar3.f59112f + ((((long) ((f12 * f11) + 0.5f)) + j12) + ((long) a2.c.a(1.0f, f11, f12, 0.5f)))) - fVar4.f59112f;
                } else {
                    arrayList = arrayList2;
                    i11 = size;
                    jMax = zContains ? Math.max(l.b(fVar3, fVar3.f59112f), fVar3.f59112f + j12) : zContains2 ? Math.max(-l.a(fVar4, fVar4.f59112f), (-fVar4.f59112f) + j12) : (oVar.j() + fVar3.f59112f) - fVar4.f59112f;
                }
            } else {
                arrayList = arrayList2;
                i11 = size;
                jMax = j11;
            }
            jMax2 = Math.max(jMax2, jMax);
            i12++;
            eVar2 = eVar;
            arrayList2 = arrayList;
            size = i11;
            j11 = 0;
        }
        return (int) jMax2;
    }

    public void e(o oVar, int i5, ArrayList arrayList) {
        f fVar = oVar.f59139h;
        f fVar2 = oVar.f59140i;
        Iterator it = fVar.f59117k.iterator();
        while (it.hasNext()) {
            d dVar = (d) it.next();
            if (dVar instanceof f) {
                a((f) dVar, i5, arrayList, null);
            } else if (dVar instanceof o) {
                a(((o) dVar).f59139h, i5, arrayList, null);
            }
        }
        Iterator it2 = fVar2.f59117k.iterator();
        while (it2.hasNext()) {
            d dVar2 = (d) it2.next();
            if (dVar2 instanceof f) {
                a((f) dVar2, i5, arrayList, null);
            } else if (dVar2 instanceof o) {
                a(((o) dVar2).f59140i, i5, arrayList, null);
            }
        }
        if (i5 == 1) {
            Iterator it3 = ((m) oVar).f59124k.f59117k.iterator();
            while (it3.hasNext()) {
                d dVar3 = (d) it3.next();
                if (dVar3 instanceof f) {
                    a((f) dVar3, i5, arrayList, null);
                }
            }
        }
    }

    public void f(int i5, int i11, int i12, int i13, g4.d dVar) {
        b bVar = (b) this.f59106i;
        bVar.f59086a = i5;
        bVar.f59087b = i12;
        bVar.f59088c = i11;
        bVar.f59089d = i13;
        ((u) this.f59105h).f(dVar, bVar);
        dVar.J(bVar.f59090e);
        dVar.G(bVar.f59091f);
        dVar.D = bVar.f59093h;
        dVar.D(bVar.f59092g);
    }

    public void g() {
        a aVar;
        Iterator it = ((g4.e) this.f59101d).f57121p0.iterator();
        while (it.hasNext()) {
            g4.d dVar = (g4.d) it.next();
            if (!dVar.f57082a) {
                int[] iArr = dVar.f57109o0;
                boolean z11 = false;
                int i5 = iArr[0];
                int i11 = iArr[1];
                int i12 = dVar.f57111q;
                int i13 = dVar.f57112r;
                boolean z12 = i5 == 2 || (i5 == 3 && i12 == 1);
                if (i11 == 2 || (i11 == 3 && i13 == 1)) {
                    z11 = true;
                }
                g gVar = dVar.f57088d.f59136e;
                boolean z13 = gVar.f59116j;
                g gVar2 = dVar.f57090e.f59136e;
                boolean z14 = gVar2.f59116j;
                boolean z15 = z12;
                if (z13 && z14) {
                    f(1, gVar.f59113g, 1, gVar2.f59113g, dVar);
                    dVar.f57082a = true;
                } else if (z13 && z11) {
                    f(1, gVar.f59113g, 2, gVar2.f59113g, dVar);
                    if (i11 == 3) {
                        dVar.f57090e.f59136e.f59119m = dVar.k();
                    } else {
                        dVar.f57090e.f59136e.d(dVar.k());
                        dVar.f57082a = true;
                    }
                } else if (z14 && z15) {
                    f(2, gVar.f59113g, 1, gVar2.f59113g, dVar);
                    if (i5 == 3) {
                        dVar.f57088d.f59136e.f59119m = dVar.n();
                    } else {
                        dVar.f57088d.f59136e.d(dVar.n());
                        dVar.f57082a = true;
                    }
                }
                if (dVar.f57082a && (aVar = dVar.f57090e.f59125l) != null) {
                    aVar.d(dVar.Z);
                }
            }
        }
    }

    public String toString() {
        switch (this.f59098a) {
            case 1:
                Map map = (Map) this.f59106i;
                Long l9 = (Long) this.f59105h;
                Long l11 = (Long) this.f59104g;
                Long l12 = (Long) this.f59103f;
                Long l13 = (Long) this.f59102e;
                ArrayList arrayList = new ArrayList();
                if (this.f59099b) {
                    arrayList.add("isRegularFile");
                }
                if (this.f59100c) {
                    arrayList.add("isDirectory");
                }
                if (l13 != null) {
                    arrayList.add("byteCount=" + l13);
                }
                if (l12 != null) {
                    arrayList.add("createdAt=" + l12);
                }
                if (l11 != null) {
                    arrayList.add("lastModifiedAt=" + l11);
                }
                if (l9 != null) {
                    arrayList.add("lastAccessedAt=" + l9);
                }
                if (!map.isEmpty()) {
                    arrayList.add("extras=" + map);
                }
                return b70.g.f1(arrayList, ", ", "FileMetadata(", ")", 0, null, 56);
            default:
                return super.toString();
        }
    }

    public e(boolean z11, boolean z12, z zVar, Long l9, Long l11, Long l12, Long l13, Map extras) {
        Intrinsics.g(extras, "extras");
        this.f59099b = z11;
        this.f59100c = z12;
        this.f59101d = zVar;
        this.f59102e = l9;
        this.f59103f = l11;
        this.f59104g = l12;
        this.f59105h = l13;
        this.f59106i = MapsKt.s0(extras);
    }

    public /* synthetic */ e(boolean z11, boolean z12, z zVar, Long l9, Long l11, Long l12, Long l13) {
        this(z11, z12, zVar, l9, l11, l12, l13, b70.h.f17594a);
    }
}
