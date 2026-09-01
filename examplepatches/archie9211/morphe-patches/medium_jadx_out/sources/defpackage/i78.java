package defpackage;

import java.util.Collection;
import java.util.Iterator;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i78 implements ii6, Set, th6 {
    public final g78 a;
    public final g78 b;

    public i78(g78 g78Var) {
        this.a = g78Var;
        this.b = g78Var;
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean add(Object obj) {
        return this.b.a(obj);
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean addAll(Collection collection) {
        collection.getClass();
        g78 g78Var = this.b;
        int i = g78Var.d;
        Iterator it2 = collection.iterator();
        while (it2.hasNext()) {
            g78Var.k(it2.next());
        }
        return i != g78Var.d;
    }

    @Override // java.util.Set, java.util.Collection
    public final void clear() {
        this.b.b();
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean contains(Object obj) {
        return this.a.c(obj);
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean containsAll(Collection collection) {
        collection.getClass();
        Iterator it2 = collection.iterator();
        while (it2.hasNext()) {
            if (!this.a.c(it2.next())) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || i78.class != obj.getClass()) {
            return false;
        }
        return this.a.equals(((i78) obj).a);
    }

    @Override // java.util.Set, java.util.Collection
    public final int hashCode() {
        return this.a.hashCode();
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean isEmpty() {
        return this.a.g();
    }

    @Override // java.util.Set, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        return new u75(this);
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean remove(Object obj) {
        return this.b.l(obj);
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean removeAll(Collection collection) {
        collection.getClass();
        g78 g78Var = this.b;
        int i = g78Var.d;
        Iterator it2 = collection.iterator();
        while (it2.hasNext()) {
            g78Var.i(it2.next());
        }
        return i != g78Var.d;
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0051  */
    @Override // java.util.Set, java.util.Collection
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean retainAll(java.util.Collection r17) {
        /*
            r16 = this;
            r17.getClass()
            r0 = r16
            g78 r0 = r0.b
            java.lang.Object[] r1 = r0.b
            int r2 = r0.d
            long[] r3 = r0.a
            int r4 = r3.length
            int r4 = r4 + (-2)
            r5 = 0
            if (r4 < 0) goto L56
            r6 = r5
        L14:
            r7 = r3[r6]
            long r9 = ~r7
            r11 = 7
            long r9 = r9 << r11
            long r9 = r9 & r7
            r11 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r9 = r9 & r11
            int r9 = (r9 > r11 ? 1 : (r9 == r11 ? 0 : -1))
            if (r9 == 0) goto L51
            int r9 = r6 - r4
            int r9 = ~r9
            int r9 = r9 >>> 31
            r10 = 8
            int r9 = 8 - r9
            r11 = r5
        L2e:
            if (r11 >= r9) goto L4f
            r12 = 255(0xff, double:1.26E-321)
            long r12 = r12 & r7
            r14 = 128(0x80, double:6.3E-322)
            int r12 = (r12 > r14 ? 1 : (r12 == r14 ? 0 : -1))
            if (r12 >= 0) goto L4b
            int r12 = r6 << 3
            int r12 = r12 + r11
            r13 = r17
            java.lang.Iterable r13 = (java.lang.Iterable) r13
            r14 = r1[r12]
            boolean r13 = defpackage.bu1.p0(r13, r14)
            if (r13 != 0) goto L4b
            r0.m(r12)
        L4b:
            long r7 = r7 >> r10
            int r11 = r11 + 1
            goto L2e
        L4f:
            if (r9 != r10) goto L56
        L51:
            if (r6 == r4) goto L56
            int r6 = r6 + 1
            goto L14
        L56:
            int r0 = r0.d
            if (r2 == r0) goto L5c
            r0 = 1
            return r0
        L5c:
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.i78.retainAll(java.util.Collection):boolean");
    }

    @Override // java.util.Set, java.util.Collection
    public final int size() {
        return this.a.d;
    }

    @Override // java.util.Set, java.util.Collection
    public final Object[] toArray(Object[] objArr) {
        objArr.getClass();
        return kng.O(this, objArr);
    }

    public final String toString() {
        return this.a.toString();
    }

    @Override // java.util.Set, java.util.Collection
    public final Object[] toArray() {
        return kng.N(this);
    }
}
