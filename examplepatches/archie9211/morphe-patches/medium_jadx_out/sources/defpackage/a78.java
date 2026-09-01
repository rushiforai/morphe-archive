package defpackage;

import java.util.Collection;
import java.util.Iterator;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a78 implements ii6, Set, th6 {
    public final y68 a;
    public final y68 b;

    public a78(y68 y68Var) {
        this.a = y68Var;
        this.b = y68Var;
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean add(Object obj) {
        return this.b.a(obj);
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean addAll(Collection collection) {
        collection.getClass();
        y68 y68Var = this.b;
        int i = y68Var.g;
        for (Object obj : collection) {
            int iD = y68Var.d(obj);
            y68Var.b[iD] = obj;
            long[] jArr = y68Var.c;
            int i2 = y68Var.d;
            jArr[iD] = (((long) i2) & 2147483647L) | 4611686016279904256L;
            if (i2 != Integer.MAX_VALUE) {
                jArr[i2] = ((2147483647L & ((long) iD)) << 31) | (jArr[i2] & (-4611686016279904257L));
            }
            y68Var.d = iD;
            if (y68Var.e == Integer.MAX_VALUE) {
                y68Var.e = iD;
            }
        }
        return i != y68Var.g;
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
        if (obj == null || a78.class != obj.getClass()) {
            return false;
        }
        return this.a.equals(((a78) obj).a);
    }

    @Override // java.util.Set, java.util.Collection
    public final int hashCode() {
        return this.a.hashCode();
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean isEmpty() {
        return this.a.g == 0;
    }

    @Override // java.util.Set, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        return new u75(this);
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean remove(Object obj) {
        return this.b.g(obj);
    }

    /* JADX WARN: Code restructure failed: missing block: B:17:0x0081, code lost:
    
        r18 = r4;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x008a, code lost:
    
        if (((r9 & ((~r9) << 6)) & (-9187201950435737472L)) == 0) goto L22;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x008c, code lost:
    
        r15 = -1;
     */
    @Override // java.util.Set, java.util.Collection
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean removeAll(java.util.Collection r19) {
        /*
            r18 = this;
            r19.getClass()
            r0 = r19
            java.lang.Iterable r0 = (java.lang.Iterable) r0
            r1 = r18
            y68 r1 = r1.b
            int r2 = r1.g
            java.util.Iterator r0 = r0.iterator()
        L11:
            boolean r3 = r0.hasNext()
            r4 = 1
            r5 = 0
            if (r3 == 0) goto L9b
            java.lang.Object r3 = r0.next()
            if (r3 == 0) goto L24
            int r6 = r3.hashCode()
            goto L25
        L24:
            r6 = r5
        L25:
            r7 = -862048943(0xffffffffcc9e2d51, float:-8.293031E7)
            int r6 = r6 * r7
            int r7 = r6 << 16
            r6 = r6 ^ r7
            r7 = r6 & 127(0x7f, float:1.78E-43)
            int r8 = r1.f
            int r6 = r6 >>> 7
            r6 = r6 & r8
        L33:
            long[] r9 = r1.a
            int r10 = r6 >> 3
            r11 = r6 & 7
            int r11 = r11 << 3
            r12 = r9[r10]
            long r12 = r12 >>> r11
            int r10 = r10 + r4
            r14 = r9[r10]
            int r9 = 64 - r11
            long r9 = r14 << r9
            long r14 = (long) r11
            long r14 = -r14
            r11 = 63
            long r14 = r14 >> r11
            long r9 = r9 & r14
            long r9 = r9 | r12
            long r11 = (long) r7
            r13 = 72340172838076673(0x101010101010101, double:7.748604185489348E-304)
            long r11 = r11 * r13
            long r11 = r11 ^ r9
            long r13 = r11 - r13
            long r11 = ~r11
            long r11 = r11 & r13
            r13 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r11 = r11 & r13
        L5e:
            r15 = 0
            int r17 = (r11 > r15 ? 1 : (r11 == r15 ? 0 : -1))
            if (r17 == 0) goto L81
            int r15 = java.lang.Long.numberOfTrailingZeros(r11)
            int r15 = r15 >> 3
            int r15 = r15 + r6
            r15 = r15 & r8
            r18 = r4
            java.lang.Object[] r4 = r1.b
            r4 = r4[r15]
            boolean r4 = defpackage.g76.L(r4, r3)
            if (r4 == 0) goto L79
            goto L8d
        L79:
            r15 = 1
            long r15 = r11 - r15
            long r11 = r11 & r15
            r4 = r18
            goto L5e
        L81:
            r18 = r4
            long r11 = ~r9
            r4 = 6
            long r11 = r11 << r4
            long r9 = r9 & r11
            long r9 = r9 & r13
            int r4 = (r9 > r15 ? 1 : (r9 == r15 ? 0 : -1))
            if (r4 == 0) goto L94
            r15 = -1
        L8d:
            if (r15 < 0) goto L11
            r1.h(r15)
            goto L11
        L94:
            int r5 = r5 + 8
            int r6 = r6 + r5
            r6 = r6 & r8
            r4 = r18
            goto L33
        L9b:
            r18 = r4
            int r0 = r1.g
            if (r2 == r0) goto La2
            return r18
        La2:
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.a78.removeAll(java.util.Collection):boolean");
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean retainAll(Collection collection) {
        collection.getClass();
        return this.b.i(collection);
    }

    @Override // java.util.Set, java.util.Collection
    public final int size() {
        return this.a.g;
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
