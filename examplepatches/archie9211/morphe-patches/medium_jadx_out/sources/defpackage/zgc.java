package defpackage;

import java.util.Collections;
import java.util.Iterator;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class zgc extends u1 {
    public static final /* synthetic */ int c = 0;
    public Object a;
    public int b;

    /* JADX WARN: Code restructure failed: missing block: B:22:0x0061, code lost:
    
        if (defpackage.pwd.z(r2).add(r6) == false) goto L23;
     */
    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean add(java.lang.Object r6) {
        /*
            r5 = this;
            int r0 = r5.b
            r1 = 1
            if (r0 != 0) goto L8
            r5.a = r6
            goto L64
        L8:
            java.lang.Object r2 = r5.a
            r3 = 0
            if (r0 != r1) goto L20
            boolean r0 = defpackage.g76.L(r2, r6)
            if (r0 == 0) goto L14
            goto L63
        L14:
            java.lang.Object r0 = r5.a
            r2 = 2
            java.lang.Object[] r2 = new java.lang.Object[r2]
            r2[r3] = r0
            r2[r1] = r6
            r5.a = r2
            goto L64
        L20:
            r4 = 5
            if (r0 >= r4) goto L56
            r2.getClass()
            java.lang.Object[] r2 = (java.lang.Object[]) r2
            boolean r0 = defpackage.k80.d0(r6, r2)
            if (r0 == 0) goto L2f
            goto L63
        L2f:
            int r0 = r5.b
            r3 = 4
            if (r0 != r3) goto L4a
            int r0 = r2.length
            java.lang.Object[] r0 = java.util.Arrays.copyOf(r2, r0)
            java.util.LinkedHashSet r2 = new java.util.LinkedHashSet
            int r3 = r0.length
            int r3 = defpackage.ei7.P(r3)
            r2.<init>(r3)
            defpackage.k80.L0(r0, r2)
            r2.add(r6)
            goto L53
        L4a:
            int r0 = r0 + r1
            java.lang.Object[] r2 = java.util.Arrays.copyOf(r2, r0)
            int r0 = r2.length
            int r0 = r0 - r1
            r2[r0] = r6
        L53:
            r5.a = r2
            goto L64
        L56:
            r2.getClass()
            java.util.Set r0 = defpackage.pwd.z(r2)
            boolean r6 = r0.add(r6)
            if (r6 != 0) goto L64
        L63:
            return r3
        L64:
            int r6 = r5.b
            int r6 = r6 + r1
            r5.b = r6
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zgc.add(java.lang.Object):boolean");
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final void clear() {
        this.a = null;
        this.b = 0;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        if (d() == 0) {
            return false;
        }
        if (d() == 1) {
            return g76.L(this.a, obj);
        }
        int iD = d();
        Object obj2 = this.a;
        if (iD < 5) {
            obj2.getClass();
            return k80.d0(obj, (Object[]) obj2);
        }
        obj2.getClass();
        return ((Set) obj2).contains(obj);
    }

    @Override // defpackage.u1
    public final int d() {
        return this.b;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        int i = this.b;
        if (i == 0) {
            return Collections.EMPTY_SET.iterator();
        }
        Object obj = this.a;
        if (i == 1) {
            return new tzb(1, obj);
        }
        if (i < 5) {
            obj.getClass();
            return new p89((Object[]) obj);
        }
        obj.getClass();
        return pwd.z(obj).iterator();
    }
}
