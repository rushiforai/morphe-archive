package defpackage;

import java.util.Iterator;
import java.util.Map;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class pnb implements Iterable {
    public mnb a;
    public mnb b;
    public final WeakHashMap c = new WeakHashMap();
    public int d = 0;

    public mnb d(Object obj) {
        mnb mnbVar = this.a;
        while (mnbVar != null && !mnbVar.a.equals(obj)) {
            mnbVar = mnbVar.c;
        }
        return mnbVar;
    }

    public Object e(Object obj) {
        mnb mnbVarD = d(obj);
        if (mnbVarD == null) {
            return null;
        }
        this.d--;
        WeakHashMap weakHashMap = this.c;
        if (!weakHashMap.isEmpty()) {
            Iterator it2 = weakHashMap.keySet().iterator();
            while (it2.hasNext()) {
                ((onb) it2.next()).a(mnbVarD);
            }
        }
        mnb mnbVar = mnbVarD.d;
        mnb mnbVar2 = mnbVarD.c;
        if (mnbVar != null) {
            mnbVar.c = mnbVar2;
        } else {
            this.a = mnbVar2;
        }
        mnb mnbVar3 = mnbVarD.c;
        if (mnbVar3 != null) {
            mnbVar3.d = mnbVar;
        } else {
            this.b = mnbVar;
        }
        mnbVarD.c = null;
        mnbVarD.d = null;
        return mnbVarD.b;
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x0048, code lost:
    
        if (r1.hasNext() != false) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x0050, code lost:
    
        if (((defpackage.lnb) r6).hasNext() != false) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0052, code lost:
    
        return true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0053, code lost:
    
        return false;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r6) {
        /*
            r5 = this;
            r0 = 1
            if (r6 != r5) goto L4
            return r0
        L4:
            boolean r1 = r6 instanceof defpackage.pnb
            r2 = 0
            if (r1 != 0) goto La
            return r2
        La:
            pnb r6 = (defpackage.pnb) r6
            int r1 = r5.d
            int r3 = r6.d
            if (r1 == r3) goto L13
            return r2
        L13:
            java.util.Iterator r5 = r5.iterator()
            java.util.Iterator r6 = r6.iterator()
        L1b:
            r1 = r5
            lnb r1 = (defpackage.lnb) r1
            boolean r3 = r1.hasNext()
            if (r3 == 0) goto L44
            r3 = r6
            lnb r3 = (defpackage.lnb) r3
            boolean r4 = r3.hasNext()
            if (r4 == 0) goto L44
            java.lang.Object r1 = r1.next()
            java.util.Map$Entry r1 = (java.util.Map.Entry) r1
            java.lang.Object r3 = r3.next()
            if (r1 != 0) goto L3b
            if (r3 != 0) goto L43
        L3b:
            if (r1 == 0) goto L1b
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L1b
        L43:
            return r2
        L44:
            boolean r5 = r1.hasNext()
            if (r5 != 0) goto L53
            lnb r6 = (defpackage.lnb) r6
            boolean r5 = r6.hasNext()
            if (r5 != 0) goto L53
            return r0
        L53:
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pnb.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        Iterator it2 = iterator();
        int iHashCode = 0;
        while (true) {
            lnb lnbVar = (lnb) it2;
            if (!lnbVar.hasNext()) {
                return iHashCode;
            }
            iHashCode += ((Map.Entry) lnbVar.next()).hashCode();
        }
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        lnb lnbVar = new lnb(this.a, this.b, 0);
        this.c.put(lnbVar, Boolean.FALSE);
        return lnbVar;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("[");
        Iterator it2 = iterator();
        while (true) {
            lnb lnbVar = (lnb) it2;
            if (!lnbVar.hasNext()) {
                sb.append("]");
                return sb.toString();
            }
            sb.append(((Map.Entry) lnbVar.next()).toString());
            if (lnbVar.hasNext()) {
                sb.append(", ");
            }
        }
    }
}
