package wk;

import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.AbstractCollection;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.atomic.AtomicReferenceArray;
import java.util.logging.Logger;

/* loaded from: classes.dex */
public final class g0 extends AbstractMap implements ConcurrentMap {

    /* renamed from: r, reason: collision with root package name */
    public static final e f94519r;

    /* renamed from: s, reason: collision with root package name */
    public static final f f94520s;

    /* renamed from: a, reason: collision with root package name */
    public final int f94521a;

    /* renamed from: b, reason: collision with root package name */
    public final int f94522b;

    /* renamed from: c, reason: collision with root package name */
    public final p[] f94523c;

    /* renamed from: d, reason: collision with root package name */
    public final int f94524d = Math.min(4, SQLiteDatabase.OPEN_FULLMUTEX);

    /* renamed from: e, reason: collision with root package name */
    public final vk.b0 f94525e;

    /* renamed from: f, reason: collision with root package name */
    public final vk.b0 f94526f;

    /* renamed from: g, reason: collision with root package name */
    public final u f94527g;

    /* renamed from: h, reason: collision with root package name */
    public final u f94528h;

    /* renamed from: i, reason: collision with root package name */
    public final long f94529i;

    /* renamed from: j, reason: collision with root package name */
    public final c f94530j;

    /* renamed from: k, reason: collision with root package name */
    public final f f94531k;

    /* renamed from: l, reason: collision with root package name */
    public final vk.b0 f94532l;

    /* renamed from: m, reason: collision with root package name */
    public final int f94533m;
    public final a n;
    public m o;

    /* renamed from: p, reason: collision with root package name */
    public a0 f94534p;

    /* renamed from: q, reason: collision with root package name */
    public m f94535q;

    static {
        Logger.getLogger(g0.class.getName());
        f94519r = new e();
        f94520s = new f();
    }

    public g0(d dVar) {
        t tVar = dVar.f94510a;
        r rVar = u.f94571a;
        u uVar = (u) vk.b0.n(tVar, rVar);
        this.f94527g = uVar;
        this.f94528h = (u) vk.b0.n(dVar.f94511b, rVar);
        this.f94525e = ((u) vk.b0.n(dVar.f94510a, rVar)).a();
        this.f94526f = ((u) vk.b0.n(dVar.f94511b, rVar)).a();
        this.f94529i = -1L;
        this.f94530j = c.f94500a;
        this.f94531k = f94520s;
        this.f94532l = d.f94509d;
        int i5 = 0;
        this.f94533m = k.f94541a[(b() ? 1 : 0) | (uVar != u.f94573c ? 0 : 4)];
        this.n = (a) d.f94508c.f92839a;
        int iMin = Math.min(16, 1073741824);
        iMin = b() ? (int) Math.min(iMin, -1L) : iMin;
        int i11 = 1;
        int i12 = 0;
        while (i11 < this.f94524d && (!b() || i11 * 20 <= this.f94529i)) {
            i12++;
            i11 <<= 1;
        }
        this.f94522b = 32 - i12;
        this.f94521a = i11 - 1;
        this.f94523c = new p[i11];
        int i13 = iMin / i11;
        int i14 = 1;
        while (i14 < (i13 * i11 < iMin ? i13 + 1 : i13)) {
            i14 <<= 1;
        }
        if (b()) {
            long j11 = this.f94529i;
            long j12 = i11;
            long j13 = (j11 / j12) + 1;
            long j14 = j11 % j12;
            while (true) {
                p[] pVarArr = this.f94523c;
                if (i5 >= pVarArr.length) {
                    return;
                }
                if (i5 == j14) {
                    j13--;
                }
                long j15 = j13;
                pVarArr[i5] = new p(this, i14, j15, (a) d.f94508c.f92839a);
                i5++;
                j13 = j15;
            }
        } else {
            while (true) {
                p[] pVarArr2 = this.f94523c;
                if (i5 >= pVarArr2.length) {
                    return;
                }
                pVarArr2[i5] = new p(this, i14, -1L, (a) d.f94508c.f92839a);
                i5++;
            }
        }
    }

    public static ArrayList a(AbstractCollection abstractCollection) {
        ArrayList arrayList = new ArrayList(abstractCollection.size());
        v4.a.b(arrayList, abstractCollection.iterator());
        return arrayList;
    }

    public final boolean b() {
        return this.f94529i >= 0;
    }

    public final int c(Object obj) {
        int iL = this.f94525e.l(obj);
        int i5 = iL + ((iL << 15) ^ (-12931));
        int i11 = i5 ^ (i5 >>> 10);
        int i12 = i11 + (i11 << 3);
        int i13 = i12 ^ (i12 >>> 6);
        int i14 = (i13 << 2) + (i13 << 14) + i13;
        return (i14 >>> 16) ^ i14;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final void clear() {
        r rVar = u.f94571a;
        for (p pVar : this.f94523c) {
            if (pVar.f94558b != 0) {
                pVar.lock();
                try {
                    pVar.n(pVar.f94557a.f94532l.r());
                    AtomicReferenceArray atomicReferenceArray = pVar.f94562f;
                    for (int i5 = 0; i5 < atomicReferenceArray.length(); i5++) {
                        for (h0 h0VarP = (h0) atomicReferenceArray.get(i5); h0VarP != null; h0VarP = h0VarP.p()) {
                            if (h0VarP.d().b()) {
                                Object key = h0VarP.getKey();
                                Object obj = h0VarP.d().get();
                                int i11 = (key == null || obj == null) ? 3 : 1;
                                h0VarP.j();
                                pVar.d(key, h0VarP.d().a(), i11, obj);
                            }
                        }
                    }
                    for (int i12 = 0; i12 < atomicReferenceArray.length(); i12++) {
                        atomicReferenceArray.set(i12, null);
                    }
                    g0 g0Var = pVar.f94557a;
                    if (g0Var.f94527g != rVar) {
                        while (pVar.f94564h.poll() != null) {
                        }
                    }
                    if (g0Var.f94528h != rVar) {
                        while (pVar.f94565i.poll() != null) {
                        }
                    }
                    pVar.f94568l.clear();
                    pVar.f94569m.clear();
                    pVar.f94567k.set(0);
                    pVar.f94560d++;
                    pVar.f94558b = 0;
                    pVar.unlock();
                    pVar.o();
                } catch (Throwable th2) {
                    pVar.unlock();
                    pVar.o();
                    throw th2;
                }
            }
        }
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean containsKey(Object obj) {
        if (obj == null) {
            return false;
        }
        int iC = c(obj);
        p pVarD = d(iC);
        pVarD.getClass();
        try {
            if (pVarD.f94558b == 0) {
                return false;
            }
            h0 h0VarH = pVarD.h(pVarD.f94557a.f94532l.r(), obj, iC);
            if (h0VarH == null) {
                return false;
            }
            return h0VarH.d().get() != null;
        } finally {
            pVarD.i();
        }
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean containsValue(Object obj) {
        Object obj2;
        if (obj != null) {
            this.f94532l.r();
            p[] pVarArr = this.f94523c;
            long j11 = -1;
            int i5 = 0;
            while (i5 < 3) {
                int length = pVarArr.length;
                long j12 = 0;
                for (int i11 = 0; i11 < length; i11++) {
                    p pVar = pVarArr[i11];
                    int i12 = pVar.f94558b;
                    AtomicReferenceArray atomicReferenceArray = pVar.f94562f;
                    for (int i13 = 0; i13 < atomicReferenceArray.length(); i13++) {
                        for (h0 h0VarP = (h0) atomicReferenceArray.get(i13); h0VarP != null; h0VarP = h0VarP.p()) {
                            if (h0VarP.getKey() == null || (obj2 = h0VarP.d().get()) == null) {
                                pVar.q();
                                obj2 = null;
                                if (obj2 == null) {
                                }
                            } else {
                                pVar.f94557a.getClass();
                                if (obj2 == null && this.f94526f.m(obj, obj2)) {
                                    return true;
                                }
                            }
                        }
                    }
                    j12 += pVar.f94560d;
                }
                if (j12 == j11) {
                    return false;
                }
                i5++;
                j11 = j12;
            }
        }
        return false;
    }

    public final p d(int i5) {
        return this.f94523c[(i5 >>> this.f94522b) & this.f94521a];
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set entrySet() {
        m mVar = this.f94535q;
        if (mVar != null) {
            return mVar;
        }
        m mVar2 = new m(this, 0);
        this.f94535q = mVar2;
        return mVar2;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object get(Object obj) {
        if (obj == null) {
            return null;
        }
        int iC = c(obj);
        return d(iC).g(iC, obj);
    }

    @Override // java.util.Map, java.util.concurrent.ConcurrentMap
    public final Object getOrDefault(Object obj, Object obj2) {
        Object obj3 = get(obj);
        return obj3 != null ? obj3 : obj2;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean isEmpty() {
        p[] pVarArr = this.f94523c;
        long j11 = 0;
        for (p pVar : pVarArr) {
            if (pVar.f94558b != 0) {
                return false;
            }
            j11 += r8.f94560d;
        }
        if (j11 == 0) {
            return true;
        }
        for (p pVar2 : pVarArr) {
            if (pVar2.f94558b != 0) {
                return false;
            }
            j11 -= r9.f94560d;
        }
        return j11 == 0;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set keySet() {
        m mVar = this.o;
        if (mVar != null) {
            return mVar;
        }
        m mVar2 = new m(this, 1);
        this.o = mVar2;
        return mVar2;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object put(Object obj, Object obj2) {
        obj.getClass();
        obj2.getClass();
        int iC = c(obj);
        return d(iC).j(obj, obj2, false, iC);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final void putAll(Map map) {
        for (Map.Entry entry : map.entrySet()) {
            put(entry.getKey(), entry.getValue());
        }
    }

    @Override // java.util.Map, java.util.concurrent.ConcurrentMap
    public final Object putIfAbsent(Object obj, Object obj2) {
        obj.getClass();
        obj2.getClass();
        int iC = c(obj);
        return d(iC).j(obj, obj2, true, iC);
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x0043, code lost:
    
        r7 = r4.d();
        r6 = r7.get();
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x004b, code lost:
    
        if (r6 == null) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x004d, code lost:
    
        r8 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0053, code lost:
    
        if (r7.b() == false) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0055, code lost:
    
        r8 = 3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0057, code lost:
    
        r2.f94560d++;
        r13 = r2.m(r3, r4, r5, r6, r7, r8);
        r0 = r2.f94558b - 1;
        r9.set(r11, r13);
        r2.f94558b = r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0068, code lost:
    
        r2.unlock();
        r2.o();
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x006e, code lost:
    
        return r6;
     */
    @Override // java.util.AbstractMap, java.util.Map
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object remove(Object obj) {
        if (obj == null) {
            return null;
        }
        int iC = c(obj);
        p pVarD = d(iC);
        pVarD.lock();
        try {
            pVarD.n(pVarD.f94557a.f94532l.r());
            AtomicReferenceArray atomicReferenceArray = pVarD.f94562f;
            int length = iC & (atomicReferenceArray.length() - 1);
            h0 h0Var = (h0) atomicReferenceArray.get(length);
            h0 h0VarP = h0Var;
            while (true) {
                if (h0VarP == null) {
                    break;
                }
                Object key = h0VarP.getKey();
                if (h0VarP.j() == iC && key != null && pVarD.f94557a.f94525e.m(obj, key)) {
                    break;
                }
                h0VarP = h0VarP.p();
            }
            return null;
        } finally {
            pVarD.unlock();
            pVarD.o();
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x0077, code lost:
    
        return null;
     */
    @Override // java.util.Map, java.util.concurrent.ConcurrentMap
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object replace(Object obj, Object obj2) {
        obj.getClass();
        obj2.getClass();
        int iC = c(obj);
        p pVarD = d(iC);
        pVarD.lock();
        try {
            long jR = pVarD.f94557a.f94532l.r();
            pVarD.n(jR);
            AtomicReferenceArray atomicReferenceArray = pVarD.f94562f;
            int length = iC & (atomicReferenceArray.length() - 1);
            h0 h0Var = (h0) atomicReferenceArray.get(length);
            long j11 = jR;
            h0 h0VarP = h0Var;
            while (true) {
                if (h0VarP == null) {
                    break;
                }
                h0 h0Var2 = h0Var;
                Object key = h0VarP.getKey();
                if (h0VarP.j() == iC && key != null && pVarD.f94557a.f94525e.m(obj, key)) {
                    long j12 = j11;
                    z zVarD = h0VarP.d();
                    Object obj3 = zVarD.get();
                    if (obj3 != null) {
                        pVarD.f94560d++;
                        pVarD.d(obj, zVarD.a(), 2, obj3);
                        pVarD.p(h0VarP, obj2, j12);
                        pVarD.e(h0VarP);
                        pVarD.unlock();
                        pVarD.o();
                        return obj3;
                    }
                    if (zVarD.b()) {
                        pVarD.f94560d++;
                        h0 h0VarM = pVarD.m(h0Var2, h0VarP, key, obj3, zVarD, 3);
                        int i5 = pVarD.f94558b - 1;
                        atomicReferenceArray.set(length, h0VarM);
                        pVarD.f94558b = i5;
                    }
                } else {
                    long j13 = j11;
                    h0VarP = h0VarP.p();
                    h0Var = h0Var2;
                    j11 = j13;
                }
            }
        } finally {
            pVarD.unlock();
            pVarD.o();
        }
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int size() {
        long jMax = 0;
        for (int i5 = 0; i5 < this.f94523c.length; i5++) {
            jMax += Math.max(0, r0[i5].f94558b);
        }
        return ul.b.a0(jMax);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Collection values() {
        a0 a0Var = this.f94534p;
        if (a0Var != null) {
            return a0Var;
        }
        a0 a0Var2 = new a0(this, 0);
        this.f94534p = a0Var2;
        return a0Var2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x0046, code lost:
    
        r7 = r4.d();
        r6 = r7.get();
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x0056, code lost:
    
        if (r2.f94557a.f94526f.m(r14, r6) == false) goto L17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0058, code lost:
    
        r8 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x005a, code lost:
    
        if (r6 != null) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0060, code lost:
    
        if (r7.b() == false) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0062, code lost:
    
        r8 = 3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0064, code lost:
    
        r2.f94560d++;
        r13 = r2.m(r3, r4, r5, r6, r7, r8);
        r14 = r2.f94558b - 1;
        r9.set(r11, r13);
        r2.f94558b = r14;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0075, code lost:
    
        if (r8 != 1) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0077, code lost:
    
        r0 = true;
     */
    @Override // java.util.Map, java.util.concurrent.ConcurrentMap
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean remove(Object obj, Object obj2) {
        boolean z11 = false;
        if (obj == null || obj2 == null) {
            return false;
        }
        int iC = c(obj);
        p pVarD = d(iC);
        pVarD.lock();
        try {
            pVarD.n(pVarD.f94557a.f94532l.r());
            AtomicReferenceArray atomicReferenceArray = pVarD.f94562f;
            int length = iC & (atomicReferenceArray.length() - 1);
            h0 h0Var = (h0) atomicReferenceArray.get(length);
            h0 h0VarP = h0Var;
            while (true) {
                if (h0VarP == null) {
                    break;
                }
                Object key = h0VarP.getKey();
                if (h0VarP.j() == iC && key != null && pVarD.f94557a.f94525e.m(obj, key)) {
                    break;
                }
                h0VarP = h0VarP.p();
            }
            return z11;
        } finally {
            pVarD.unlock();
            pVarD.o();
        }
    }

    @Override // java.util.Map, java.util.concurrent.ConcurrentMap
    public final boolean replace(Object obj, Object obj2, Object obj3) {
        boolean z11;
        obj.getClass();
        obj3.getClass();
        boolean z12 = false;
        if (obj2 == null) {
            return false;
        }
        int iC = c(obj);
        p pVarD = d(iC);
        pVarD.lock();
        try {
            long jR = pVarD.f94557a.f94532l.r();
            pVarD.n(jR);
            AtomicReferenceArray atomicReferenceArray = pVarD.f94562f;
            int length = iC & (atomicReferenceArray.length() - 1);
            h0 h0Var = (h0) atomicReferenceArray.get(length);
            long j11 = jR;
            h0 h0VarP = h0Var;
            while (true) {
                if (h0VarP == null) {
                    z11 = z12;
                    break;
                }
                h0 h0Var2 = h0Var;
                Object key = h0VarP.getKey();
                if (h0VarP.j() == iC && key != null && pVarD.f94557a.f94525e.m(obj, key)) {
                    z11 = z12;
                    long j12 = j11;
                    z zVarD = h0VarP.d();
                    Object obj4 = zVarD.get();
                    if (obj4 == null) {
                        if (zVarD.b()) {
                            pVarD.f94560d++;
                            h0 h0VarM = pVarD.m(h0Var2, h0VarP, key, obj4, zVarD, 3);
                            int i5 = pVarD.f94558b - 1;
                            atomicReferenceArray.set(length, h0VarM);
                            pVarD.f94558b = i5;
                        }
                    } else {
                        if (pVarD.f94557a.f94526f.m(obj2, obj4)) {
                            pVarD.f94560d++;
                            pVarD.d(obj, zVarD.a(), 2, obj4);
                            pVarD.p(h0VarP, obj3, j12);
                            pVarD.e(h0VarP);
                            return true;
                        }
                        pVarD.f94557a.getClass();
                        pVarD.f94569m.add(h0VarP);
                    }
                } else {
                    boolean z13 = z12;
                    h0Var = h0Var2;
                    long j13 = j11;
                    int i11 = iC;
                    h0VarP = h0VarP.p();
                    iC = i11;
                    j11 = j13;
                    z12 = z13;
                }
            }
            return z11;
        } finally {
            pVarD.unlock();
            pVarD.o();
        }
    }
}
