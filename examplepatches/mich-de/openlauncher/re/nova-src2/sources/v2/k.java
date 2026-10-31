package v2;

import androidx.compose.ui.Modifier$Node;
import androidx.compose.ui.node.DelegatingNode;
import b3.l2;
import b3.t1;
import e1.m0;
import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class k extends l {

    /* renamed from: c, reason: collision with root package name */
    public final Modifier$Node f91953c;

    /* renamed from: f, reason: collision with root package name */
    public t1 f91956f;

    /* renamed from: g, reason: collision with root package name */
    public m f91957g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f91958h;

    /* renamed from: d, reason: collision with root package name */
    public final w2.b f91954d = new w2.b(0);

    /* renamed from: e, reason: collision with root package name */
    public final z.v f91955e = new z.v(2);

    /* renamed from: i, reason: collision with root package name */
    public boolean f91959i = true;

    /* renamed from: j, reason: collision with root package name */
    public boolean f91960j = true;

    public k(Modifier$Node modifier$Node) {
        this.f91953c = modifier$Node;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:135:0x0291  */
    /* JADX WARN: Type inference failed for: r1v4, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r4v4, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r5v0, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r5v1, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r5v12, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r5v19 */
    /* JADX WARN: Type inference failed for: r5v20, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r5v21, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r5v22 */
    /* JADX WARN: Type inference failed for: r5v23 */
    /* JADX WARN: Type inference failed for: r5v24 */
    /* JADX WARN: Type inference failed for: r5v25 */
    /* JADX WARN: Type inference failed for: r5v26 */
    /* JADX WARN: Type inference failed for: r5v27 */
    /* JADX WARN: Type inference failed for: r5v28 */
    /* JADX WARN: Type inference failed for: r5v6 */
    /* JADX WARN: Type inference failed for: r5v7, types: [int] */
    /* JADX WARN: Type inference failed for: r8v0 */
    /* JADX WARN: Type inference failed for: r8v1 */
    /* JADX WARN: Type inference failed for: r8v11 */
    /* JADX WARN: Type inference failed for: r8v12, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r8v13 */
    /* JADX WARN: Type inference failed for: r8v14 */
    /* JADX WARN: Type inference failed for: r8v15, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r8v17 */
    /* JADX WARN: Type inference failed for: r8v18 */
    /* JADX WARN: Type inference failed for: r8v19 */
    /* JADX WARN: Type inference failed for: r8v20 */
    @Override // v2.l
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean a(z.v vVar, z2.y yVar, m0 m0Var, boolean z11) {
        z.v vVar2;
        w2.b bVar;
        t tVar;
        boolean z12;
        boolean z13;
        m mVar;
        int i5;
        boolean z14;
        int i11;
        boolean z15;
        int i12;
        int i13;
        boolean zA = super.a(vVar, yVar, m0Var, z11);
        DelegatingNode delegatingNodeB = this.f91953c;
        boolean z16 = true;
        if (delegatingNodeB.getIsAttached()) {
            ?? eVar = 0;
            while (delegatingNodeB != 0) {
                if (delegatingNodeB instanceof l2) {
                    this.f91956f = p10.c0.E((l2) delegatingNodeB);
                } else if ((delegatingNodeB.getKindSet() & 16) != 0 && (delegatingNodeB instanceof DelegatingNode)) {
                    Modifier$Node delegate = delegatingNodeB.getDelegate();
                    int i14 = 0;
                    delegatingNodeB = delegatingNodeB;
                    eVar = eVar;
                    while (delegate != null) {
                        if ((delegate.getKindSet() & 16) != 0) {
                            i14++;
                            eVar = eVar;
                            if (i14 == 1) {
                                delegatingNodeB = delegate;
                            } else {
                                if (eVar == 0) {
                                    eVar = new r1.e(new Modifier$Node[16]);
                                }
                                if (delegatingNodeB != 0) {
                                    eVar.b(delegatingNodeB);
                                    delegatingNodeB = 0;
                                }
                                eVar.b(delegate);
                            }
                        }
                        delegate = delegate.getChild();
                        delegatingNodeB = delegatingNodeB;
                        eVar = eVar;
                    }
                    if (i14 == 1) {
                    }
                }
                delegatingNodeB = b3.o.b(eVar);
            }
            if (this.f91956f != null) {
                int iG = vVar.g();
                int i15 = 0;
                while (true) {
                    vVar2 = this.f91955e;
                    bVar = this.f91954d;
                    if (i15 >= iG) {
                        break;
                    }
                    long jD = vVar.d(i15);
                    t tVar2 = (t) vVar.h(i15);
                    if (bVar.c(jD)) {
                        long jH = tVar2.h();
                        z15 = z16;
                        long jE = tVar2.e();
                        if ((((jH & 9223372034707292159L) + 36028792732385279L) & (-9223372034707292160L)) == 0 && (((jE & 9223372034707292159L) + 36028792732385279L) & (-9223372034707292160L)) == 0) {
                            ArrayList arrayList = new ArrayList(tVar2.c().size());
                            List listC = tVar2.c();
                            z14 = zA;
                            int size = listC.size();
                            i11 = iG;
                            int i16 = 0;
                            while (i16 < size) {
                                c cVar = (c) listC.get(i16);
                                int i17 = size;
                                int i18 = i16;
                                long jB = cVar.b();
                                if ((((jB & 9223372034707292159L) + 36028792732385279L) & (-9223372034707292160L)) == 0) {
                                    long jC = cVar.c();
                                    i13 = i15;
                                    t1 t1Var = this.f91956f;
                                    Intrinsics.d(t1Var);
                                    arrayList.add(new c(jC, t1Var.F0(yVar, jB), cVar.a()));
                                } else {
                                    i13 = i15;
                                }
                                i16 = i18 + 1;
                                size = i17;
                                i15 = i13;
                            }
                            i12 = i15;
                            t1 t1Var2 = this.f91956f;
                            Intrinsics.d(t1Var2);
                            long jF0 = t1Var2.F0(yVar, jH);
                            t1 t1Var3 = this.f91956f;
                            Intrinsics.d(t1Var3);
                            vVar2.e(jD, t.b(tVar2, t1Var3.F0(yVar, jE), jF0, arrayList));
                        } else {
                            z14 = zA;
                            i11 = iG;
                            i12 = i15;
                        }
                    } else {
                        z14 = zA;
                        i11 = iG;
                        z15 = z16;
                        i12 = i15;
                    }
                    i15 = i12 + 1;
                    z16 = z15;
                    zA = z14;
                    iG = i11;
                }
                boolean z17 = zA;
                boolean z18 = z16;
                if (vVar2.g() == 0) {
                    bVar.b();
                    this.f91963a.g();
                    return z18;
                }
                int iF = bVar.f();
                while (true) {
                    iF--;
                    if (-1 >= iF) {
                        break;
                    }
                    long jE2 = bVar.e(iF);
                    if (vVar.f97842a) {
                        int i19 = vVar.f97845d;
                        long[] jArr = vVar.f97843b;
                        Object[] objArr = vVar.f97844c;
                        int i21 = 0;
                        for (int i22 = 0; i22 < i19; i22++) {
                            Object obj = objArr[i22];
                            if (obj != z.w.f97848a) {
                                if (i22 != i21) {
                                    jArr[i21] = jArr[i22];
                                    objArr[i21] = obj;
                                    objArr[i22] = null;
                                }
                                i21++;
                            }
                        }
                        vVar.f97842a = false;
                        vVar.f97845d = i21;
                    }
                    if (a0.a.b(vVar.f97843b, vVar.f97845d, jE2) < 0) {
                        bVar.i(iF);
                    }
                }
                ArrayList arrayList2 = new ArrayList(vVar2.g());
                int iG2 = vVar2.g();
                for (int i23 = 0; i23 < iG2; i23++) {
                    arrayList2.add(vVar2.h(i23));
                }
                m mVar2 = new m(arrayList2, m0Var);
                int size2 = arrayList2.size();
                int i24 = 0;
                while (true) {
                    if (i24 >= size2) {
                        tVar = null;
                        break;
                    }
                    ?? r52 = arrayList2.get(i24);
                    if (m0Var.a(((t) r52).d())) {
                        tVar = r52;
                        break;
                    }
                    i24++;
                }
                t tVar3 = tVar;
                if (tVar3 != null) {
                    if (z11) {
                        z12 = false;
                        if (!this.f91959i && (tVar3.f() || tVar3.i())) {
                            Intrinsics.d(this.f91956f);
                            this.f91959i = !g0.h(tVar3, r3.f98083c);
                        }
                    } else {
                        z12 = false;
                        this.f91959i = false;
                    }
                    boolean z19 = this.f91959i;
                    boolean z21 = this.f91958h;
                    if (z19 == z21 || !((i5 = mVar2.f91979e) == 3 || i5 == 4 || i5 == 5)) {
                        int i25 = mVar2.f91979e;
                        if (i25 == 4 && z21 && !this.f91960j) {
                            mVar2.f91979e = 3;
                        } else if (i25 == 5 && z19 && tVar3.f()) {
                            mVar2.f91979e = 3;
                        }
                    } else {
                        mVar2.f91979e = z19 ? 4 : 5;
                    }
                } else {
                    z12 = false;
                }
                if (z17 || mVar2.f91979e != 3 || (mVar = this.f91957g) == null) {
                    z13 = z18;
                    break;
                }
                ?? r12 = mVar.f91975a;
                int size3 = r12.size();
                ?? r42 = mVar2.f91975a;
                if (size3 == r42.size()) {
                    int size4 = r42.size();
                    for (?? r53 = z12; r53 < size4; r53++) {
                        if (!h2.b.b(((t) r12.get(r53)).e(), ((t) r42.get(r53)).e())) {
                            z13 = z18;
                            break;
                        }
                    }
                    z13 = z12;
                }
                this.f91957g = mVar2;
                return z13;
            }
        }
        return true;
    }

    @Override // v2.l
    public final void b(m0 m0Var) {
        super.b(m0Var);
        m mVar = this.f91957g;
        if (mVar == null) {
            return;
        }
        this.f91958h = this.f91959i;
        List list = mVar.f91975a;
        int size = list.size();
        for (int i5 = 0; i5 < size; i5++) {
            t tVar = (t) list.get(i5);
            boolean zF = tVar.f();
            boolean zA = m0Var.a(tVar.d());
            boolean z11 = this.f91959i;
            if ((!zF && !zA) || (!zF && !z11)) {
                this.f91954d.h(tVar.d());
            }
        }
        this.f91959i = false;
        this.f91960j = mVar.f91979e == 5;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v1, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r1v10 */
    /* JADX WARN: Type inference failed for: r1v11 */
    /* JADX WARN: Type inference failed for: r1v12 */
    /* JADX WARN: Type inference failed for: r1v2, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r1v4 */
    /* JADX WARN: Type inference failed for: r1v5, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r1v6, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r1v7 */
    /* JADX WARN: Type inference failed for: r1v8 */
    /* JADX WARN: Type inference failed for: r1v9 */
    /* JADX WARN: Type inference failed for: r3v11 */
    /* JADX WARN: Type inference failed for: r3v12 */
    /* JADX WARN: Type inference failed for: r3v13 */
    /* JADX WARN: Type inference failed for: r3v14 */
    /* JADX WARN: Type inference failed for: r3v2 */
    /* JADX WARN: Type inference failed for: r3v3 */
    /* JADX WARN: Type inference failed for: r3v4 */
    /* JADX WARN: Type inference failed for: r3v5, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r3v6 */
    /* JADX WARN: Type inference failed for: r3v7 */
    /* JADX WARN: Type inference failed for: r3v8, types: [r1.e] */
    public final void c() {
        r1.e eVar = this.f91963a;
        Object[] objArr = eVar.f85077a;
        int i5 = eVar.f85079c;
        for (int i11 = 0; i11 < i5; i11++) {
            ((k) objArr[i11]).c();
        }
        DelegatingNode delegatingNodeB = this.f91953c;
        ?? eVar2 = 0;
        while (delegatingNodeB != 0) {
            if (delegatingNodeB instanceof l2) {
                ((l2) delegatingNodeB).onCancelPointerInput();
            } else if ((delegatingNodeB.getKindSet() & 16) != 0 && (delegatingNodeB instanceof DelegatingNode)) {
                Modifier$Node delegate = delegatingNodeB.getDelegate();
                int i12 = 0;
                delegatingNodeB = delegatingNodeB;
                eVar2 = eVar2;
                while (delegate != null) {
                    if ((delegate.getKindSet() & 16) != 0) {
                        i12++;
                        eVar2 = eVar2;
                        if (i12 == 1) {
                            delegatingNodeB = delegate;
                        } else {
                            if (eVar2 == 0) {
                                eVar2 = new r1.e(new Modifier$Node[16]);
                            }
                            if (delegatingNodeB != 0) {
                                eVar2.b(delegatingNodeB);
                                delegatingNodeB = 0;
                            }
                            eVar2.b(delegate);
                        }
                    }
                    delegate = delegate.getChild();
                    delegatingNodeB = delegatingNodeB;
                    eVar2 = eVar2;
                }
                if (i12 == 1) {
                }
            }
            delegatingNodeB = b3.o.b(eVar2);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r7v0 */
    /* JADX WARN: Type inference failed for: r7v1, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r7v10 */
    /* JADX WARN: Type inference failed for: r7v11 */
    /* JADX WARN: Type inference failed for: r7v3 */
    /* JADX WARN: Type inference failed for: r7v4, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r7v5, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r7v6 */
    /* JADX WARN: Type inference failed for: r7v7 */
    /* JADX WARN: Type inference failed for: r7v8 */
    /* JADX WARN: Type inference failed for: r7v9 */
    /* JADX WARN: Type inference failed for: r8v0 */
    /* JADX WARN: Type inference failed for: r8v1 */
    /* JADX WARN: Type inference failed for: r8v10 */
    /* JADX WARN: Type inference failed for: r8v11 */
    /* JADX WARN: Type inference failed for: r8v2 */
    /* JADX WARN: Type inference failed for: r8v3, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r8v4 */
    /* JADX WARN: Type inference failed for: r8v5 */
    /* JADX WARN: Type inference failed for: r8v6, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r8v8 */
    /* JADX WARN: Type inference failed for: r8v9 */
    public final boolean d(m0 m0Var) {
        z.v vVar = this.f91955e;
        boolean z11 = false;
        z11 = false;
        if (vVar.g() != 0) {
            Modifier$Node modifier$Node = this.f91953c;
            if (modifier$Node.getIsAttached()) {
                m mVar = this.f91957g;
                Intrinsics.d(mVar);
                t1 t1Var = this.f91956f;
                Intrinsics.d(t1Var);
                long j11 = t1Var.f98083c;
                DelegatingNode delegatingNodeB = modifier$Node;
                ?? eVar = 0;
                while (delegatingNodeB != 0) {
                    if (delegatingNodeB instanceof l2) {
                        ((l2) delegatingNodeB).mo26onPointerEventH0pRuoY(mVar, n.f91982c, j11);
                    } else if ((delegatingNodeB.getKindSet() & 16) != 0 && (delegatingNodeB instanceof DelegatingNode)) {
                        Modifier$Node delegate = delegatingNodeB.getDelegate();
                        int i5 = 0;
                        delegatingNodeB = delegatingNodeB;
                        eVar = eVar;
                        while (delegate != null) {
                            if ((delegate.getKindSet() & 16) != 0) {
                                i5++;
                                eVar = eVar;
                                if (i5 == 1) {
                                    delegatingNodeB = delegate;
                                } else {
                                    if (eVar == 0) {
                                        eVar = new r1.e(new Modifier$Node[16]);
                                    }
                                    if (delegatingNodeB != 0) {
                                        eVar.b(delegatingNodeB);
                                        delegatingNodeB = 0;
                                    }
                                    eVar.b(delegate);
                                }
                            }
                            delegate = delegate.getChild();
                            delegatingNodeB = delegatingNodeB;
                            eVar = eVar;
                        }
                        if (i5 == 1) {
                        }
                    }
                    delegatingNodeB = b3.o.b(eVar);
                }
                if (modifier$Node.getIsAttached()) {
                    r1.e eVar2 = this.f91963a;
                    Object[] objArr = eVar2.f85077a;
                    int i11 = eVar2.f85079c;
                    for (int i12 = 0; i12 < i11; i12++) {
                        ((k) objArr[i12]).d(m0Var);
                    }
                }
                z11 = true;
            }
        }
        b(m0Var);
        vVar.a();
        this.f91956f = null;
        return z11;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v10 */
    /* JADX WARN: Type inference failed for: r0v11 */
    /* JADX WARN: Type inference failed for: r0v12 */
    /* JADX WARN: Type inference failed for: r0v13 */
    /* JADX WARN: Type inference failed for: r0v2, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r0v3, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r0v5 */
    /* JADX WARN: Type inference failed for: r0v6, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r0v7, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r0v8 */
    /* JADX WARN: Type inference failed for: r0v9 */
    /* JADX WARN: Type inference failed for: r14v10 */
    /* JADX WARN: Type inference failed for: r14v11 */
    /* JADX WARN: Type inference failed for: r14v12 */
    /* JADX WARN: Type inference failed for: r14v13 */
    /* JADX WARN: Type inference failed for: r14v2 */
    /* JADX WARN: Type inference failed for: r14v3 */
    /* JADX WARN: Type inference failed for: r14v4 */
    /* JADX WARN: Type inference failed for: r14v5, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r14v6 */
    /* JADX WARN: Type inference failed for: r14v7 */
    /* JADX WARN: Type inference failed for: r14v8, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r6v0 */
    /* JADX WARN: Type inference failed for: r6v1, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r6v10 */
    /* JADX WARN: Type inference failed for: r6v11, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r6v12, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r6v13 */
    /* JADX WARN: Type inference failed for: r6v14 */
    /* JADX WARN: Type inference failed for: r6v15 */
    /* JADX WARN: Type inference failed for: r6v16 */
    /* JADX WARN: Type inference failed for: r6v17 */
    /* JADX WARN: Type inference failed for: r6v18 */
    /* JADX WARN: Type inference failed for: r7v0 */
    /* JADX WARN: Type inference failed for: r7v1 */
    /* JADX WARN: Type inference failed for: r7v10, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r7v12 */
    /* JADX WARN: Type inference failed for: r7v13 */
    /* JADX WARN: Type inference failed for: r7v14 */
    /* JADX WARN: Type inference failed for: r7v15 */
    /* JADX WARN: Type inference failed for: r7v6 */
    /* JADX WARN: Type inference failed for: r7v7, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r7v8 */
    /* JADX WARN: Type inference failed for: r7v9 */
    public final boolean e(m0 m0Var, boolean z11) {
        if (this.f91955e.g() == 0) {
            return false;
        }
        DelegatingNode delegatingNodeB = this.f91953c;
        if (!delegatingNodeB.getIsAttached()) {
            return false;
        }
        m mVar = this.f91957g;
        Intrinsics.d(mVar);
        t1 t1Var = this.f91956f;
        Intrinsics.d(t1Var);
        long j11 = t1Var.f98083c;
        DelegatingNode delegatingNodeB2 = delegatingNodeB;
        ?? eVar = 0;
        while (delegatingNodeB2 != 0) {
            if (delegatingNodeB2 instanceof l2) {
                ((l2) delegatingNodeB2).mo26onPointerEventH0pRuoY(mVar, n.f91980a, j11);
            } else if ((delegatingNodeB2.getKindSet() & 16) != 0 && (delegatingNodeB2 instanceof DelegatingNode)) {
                Modifier$Node delegate = delegatingNodeB2.getDelegate();
                int i5 = 0;
                delegatingNodeB2 = delegatingNodeB2;
                eVar = eVar;
                while (delegate != null) {
                    if ((delegate.getKindSet() & 16) != 0) {
                        i5++;
                        eVar = eVar;
                        if (i5 == 1) {
                            delegatingNodeB2 = delegate;
                        } else {
                            if (eVar == 0) {
                                eVar = new r1.e(new Modifier$Node[16]);
                            }
                            if (delegatingNodeB2 != 0) {
                                eVar.b(delegatingNodeB2);
                                delegatingNodeB2 = 0;
                            }
                            eVar.b(delegate);
                        }
                    }
                    delegate = delegate.getChild();
                    delegatingNodeB2 = delegatingNodeB2;
                    eVar = eVar;
                }
                if (i5 == 1) {
                }
            }
            delegatingNodeB2 = b3.o.b(eVar);
        }
        if (delegatingNodeB.getIsAttached()) {
            r1.e eVar2 = this.f91963a;
            Object[] objArr = eVar2.f85077a;
            int i11 = eVar2.f85079c;
            for (int i12 = 0; i12 < i11; i12++) {
                k kVar = (k) objArr[i12];
                Intrinsics.d(this.f91956f);
                kVar.e(m0Var, z11);
            }
        }
        if (delegatingNodeB.getIsAttached()) {
            ?? eVar3 = 0;
            while (delegatingNodeB != 0) {
                if (delegatingNodeB instanceof l2) {
                    ((l2) delegatingNodeB).mo26onPointerEventH0pRuoY(mVar, n.f91981b, j11);
                } else if ((delegatingNodeB.getKindSet() & 16) != 0 && (delegatingNodeB instanceof DelegatingNode)) {
                    Modifier$Node delegate2 = delegatingNodeB.getDelegate();
                    int i13 = 0;
                    delegatingNodeB = delegatingNodeB;
                    eVar3 = eVar3;
                    while (delegate2 != null) {
                        if ((delegate2.getKindSet() & 16) != 0) {
                            i13++;
                            eVar3 = eVar3;
                            if (i13 == 1) {
                                delegatingNodeB = delegate2;
                            } else {
                                if (eVar3 == 0) {
                                    eVar3 = new r1.e(new Modifier$Node[16]);
                                }
                                if (delegatingNodeB != 0) {
                                    eVar3.b(delegatingNodeB);
                                    delegatingNodeB = 0;
                                }
                                eVar3.b(delegate2);
                            }
                        }
                        delegate2 = delegate2.getChild();
                        delegatingNodeB = delegatingNodeB;
                        eVar3 = eVar3;
                    }
                    if (i13 == 1) {
                    }
                }
                delegatingNodeB = b3.o.b(eVar3);
            }
        }
        return true;
    }

    public final void f(long j11, z.j0 j0Var) {
        w2.b bVar = this.f91954d;
        if (bVar.c(j11) && j0Var.c(this) < 0) {
            bVar.h(j11);
            this.f91955e.f(j11);
        }
        r1.e eVar = this.f91963a;
        Object[] objArr = eVar.f85077a;
        int i5 = eVar.f85079c;
        for (int i11 = 0; i11 < i5; i11++) {
            ((k) objArr[i11]).f(j11, j0Var);
        }
    }

    public final String toString() {
        return "Node(modifierNode=" + this.f91953c + ", children=" + this.f91963a + ", pointerIds=" + this.f91954d + ')';
    }
}
