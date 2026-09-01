package defpackage;

import j$.util.DesugarCollections;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b78 {
    public final LinkedHashMap a;
    public final v90 b;

    public b78(LinkedHashMap linkedHashMap, boolean z) {
        this.a = linkedHashMap;
        this.b = new v90(z);
    }

    public final Map a() {
        f09 f09Var;
        Set<Map.Entry> setEntrySet = this.a.entrySet();
        int iP = ei7.P(cu1.k0(setEntrySet, 10));
        if (iP < 16) {
            iP = 16;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(iP);
        for (Map.Entry entry : setEntrySet) {
            Object value = entry.getValue();
            if (value instanceof byte[]) {
                byte[] bArr = (byte[]) value;
                f09Var = new f09(entry.getKey(), Arrays.copyOf(bArr, bArr.length));
            } else {
                f09Var = new f09(entry.getKey(), entry.getValue());
            }
            linkedHashMap.put(f09Var.a, f09Var.b);
        }
        Map mapUnmodifiableMap = DesugarCollections.unmodifiableMap(linkedHashMap);
        mapUnmodifiableMap.getClass();
        return mapUnmodifiableMap;
    }

    public final void b() {
        if (this.b.a.get()) {
            ygf.f("Do mutate preferences once returned to DataStore.");
        }
    }

    public final void c(ny9 ny9Var, Object obj) {
        ny9Var.getClass();
        d(ny9Var, obj);
    }

    public final void d(ny9 ny9Var, Object obj) {
        ny9Var.getClass();
        b();
        LinkedHashMap linkedHashMap = this.a;
        if (obj == null) {
            b();
            linkedHashMap.remove(ny9Var);
        } else if (obj instanceof Set) {
            Set setUnmodifiableSet = DesugarCollections.unmodifiableSet(bu1.q1((Set) obj));
            setUnmodifiableSet.getClass();
            linkedHashMap.put(ny9Var, setUnmodifiableSet);
        } else if (!(obj instanceof byte[])) {
            linkedHashMap.put(ny9Var, obj);
        } else {
            byte[] bArr = (byte[]) obj;
            linkedHashMap.put(ny9Var, Arrays.copyOf(bArr, bArr.length));
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x005d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r6) {
        /*
            r5 = this;
            boolean r0 = r6 instanceof defpackage.b78
            r1 = 0
            if (r0 != 0) goto L6
            goto L60
        L6:
            b78 r6 = (defpackage.b78) r6
            java.util.LinkedHashMap r6 = r6.a
            java.util.LinkedHashMap r5 = r5.a
            r0 = 1
            if (r6 != r5) goto L10
            goto L61
        L10:
            int r2 = r6.size()
            int r3 = r5.size()
            if (r2 == r3) goto L1b
            goto L60
        L1b:
            boolean r2 = r6.isEmpty()
            if (r2 == 0) goto L22
            goto L61
        L22:
            java.util.Set r6 = r6.entrySet()
            java.util.Iterator r6 = r6.iterator()
        L2a:
            boolean r2 = r6.hasNext()
            if (r2 == 0) goto L61
            java.lang.Object r2 = r6.next()
            java.util.Map$Entry r2 = (java.util.Map.Entry) r2
            java.lang.Object r3 = r2.getKey()
            java.lang.Object r3 = r5.get(r3)
            if (r3 == 0) goto L5d
            java.lang.Object r2 = r2.getValue()
            boolean r4 = r2 instanceof byte[]
            if (r4 == 0) goto L58
            boolean r4 = r3 instanceof byte[]
            if (r4 == 0) goto L5d
            byte[] r2 = (byte[]) r2
            byte[] r3 = (byte[]) r3
            boolean r2 = java.util.Arrays.equals(r2, r3)
            if (r2 == 0) goto L5d
            r2 = r0
            goto L5e
        L58:
            boolean r2 = defpackage.g76.L(r2, r3)
            goto L5e
        L5d:
            r2 = r1
        L5e:
            if (r2 != 0) goto L2a
        L60:
            return r1
        L61:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.b78.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        Iterator it2 = this.a.entrySet().iterator();
        int iHashCode = 0;
        while (it2.hasNext()) {
            Object value = ((Map.Entry) it2.next()).getValue();
            iHashCode += value instanceof byte[] ? Arrays.hashCode((byte[]) value) : value.hashCode();
        }
        return iHashCode;
    }

    public final String toString() {
        return bu1.F0(this.a.entrySet(), ",\n", "{\n", "\n}", zu2.v, 24);
    }

    public /* synthetic */ b78(boolean z) {
        this(new LinkedHashMap(), z);
    }
}
