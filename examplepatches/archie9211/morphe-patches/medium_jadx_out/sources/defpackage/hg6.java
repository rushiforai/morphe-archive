package defpackage;

import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class hg6 {
    public static final q74 a;

    static {
        q74 q74Var = new q74();
        q74Var.a(gg6.a);
        q74Var.a(gg6.b);
        q74Var.a(gg6.c);
        q74Var.a(gg6.d);
        q74Var.a(gg6.e);
        q74Var.a(gg6.f);
        q74Var.a(gg6.g);
        q74Var.a(gg6.h);
        q74Var.a(gg6.i);
        q74Var.a(gg6.j);
        q74Var.a(gg6.k);
        q74Var.a(gg6.l);
        q74Var.a(gg6.m);
        q74Var.a(gg6.n);
        a = q74Var;
    }

    public static jf6 a(n5a n5aVar, p98 p98Var, wjc wjcVar) {
        String strF0;
        p98Var.getClass();
        wjcVar.getClass();
        o75 o75Var = gg6.a;
        o75Var.getClass();
        yf6 yf6Var = (yf6) il7.z(n5aVar, o75Var);
        String string = (yf6Var == null || (yf6Var.b & 1) != 1) ? "<init>" : p98Var.getString(yf6Var.c);
        if (yf6Var == null || (yf6Var.b & 2) != 2) {
            List<a7a> list = n5aVar.e;
            list.getClass();
            ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
            for (a7a a7aVar : list) {
                a7aVar.getClass();
                String strE = e(vn7.f0(a7aVar, wjcVar), p98Var);
                if (strE == null) {
                    return null;
                }
                arrayList.add(strE);
            }
            strF0 = bu1.F0(arrayList, "", "(", ")V", null, 56);
        } else {
            strF0 = p98Var.getString(yf6Var.d);
        }
        return new jf6(string, strF0);
    }

    /*  JADX ERROR: JadxRuntimeException in pass: IfRegionVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Can't remove SSA var: r4v2 java.lang.String, still in use, count: 2, list:
          (r4v2 java.lang.String) from 0x0047: IF  (r4v2 java.lang.String) == (null java.lang.String)  -> B:23:0x0049 A[HIDDEN] (LINE:72)
          (r4v2 java.lang.String) from 0x004a: PHI (r4v3 java.lang.String) = (r4v2 java.lang.String), (r4v5 java.lang.String) binds: [B:22:0x0047, B:20:0x0038] A[DONT_GENERATE, DONT_INLINE]
        	at jadx.core.utils.InsnRemover.removeSsaVar(InsnRemover.java:162)
        	at jadx.core.utils.InsnRemover.unbindResult(InsnRemover.java:127)
        	at jadx.core.dex.visitors.regions.TernaryMod.makeTernaryInsn(TernaryMod.java:114)
        	at jadx.core.dex.visitors.regions.TernaryMod.processRegion(TernaryMod.java:62)
        	at jadx.core.dex.visitors.regions.TernaryMod.enterRegion(TernaryMod.java:45)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:67)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at java.base/java.util.Collections$UnmodifiableCollection.forEach(Collections.java:1120)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at java.base/java.util.Collections$UnmodifiableCollection.forEach(Collections.java:1120)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverse(DepthRegionTraversal.java:19)
        	at jadx.core.dex.visitors.regions.TernaryMod.process(TernaryMod.java:35)
        	at jadx.core.dex.visitors.regions.IfRegionVisitor.process(IfRegionVisitor.java:44)
        	at jadx.core.dex.visitors.regions.IfRegionVisitor.visit(IfRegionVisitor.java:30)
        */
    public static defpackage.if6 b(defpackage.i6a r4, defpackage.p98 r5, defpackage.wjc r6, boolean r7) {
        /*
            r4.getClass()
            r5.getClass()
            o75 r0 = defpackage.gg6.d
            r0.getClass()
            java.lang.Object r0 = defpackage.il7.z(r4, r0)
            ag6 r0 = (defpackage.ag6) r0
            r1 = 0
            if (r0 != 0) goto L15
            goto L49
        L15:
            int r2 = r0.b
            r3 = 1
            r2 = r2 & r3
            if (r2 != r3) goto L1e
            xf6 r0 = r0.c
            goto L1f
        L1e:
            r0 = r1
        L1f:
            if (r0 != 0) goto L24
            if (r7 == 0) goto L24
            goto L49
        L24:
            if (r0 == 0) goto L2e
            int r7 = r0.b
            r7 = r7 & r3
            if (r7 != r3) goto L2e
            int r7 = r0.c
            goto L30
        L2e:
            int r7 = r4.f
        L30:
            if (r0 == 0) goto L3f
            int r2 = r0.b
            r3 = 2
            r2 = r2 & r3
            if (r2 != r3) goto L3f
            int r4 = r0.d
            java.lang.String r4 = r5.getString(r4)
            goto L4a
        L3f:
            s6a r4 = defpackage.vn7.V(r4, r6)
            java.lang.String r4 = e(r4, r5)
            if (r4 != 0) goto L4a
        L49:
            return r1
        L4a:
            if6 r6 = new if6
            java.lang.String r5 = r5.getString(r7)
            r6.<init>(r5, r4)
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hg6.b(i6a, p98, wjc, boolean):if6");
    }

    public static jf6 c(a6a a6aVar, p98 p98Var, wjc wjcVar) {
        String strConcat;
        p98Var.getClass();
        wjcVar.getClass();
        o75 o75Var = gg6.b;
        o75Var.getClass();
        yf6 yf6Var = (yf6) il7.z(a6aVar, o75Var);
        int i = (yf6Var == null || (yf6Var.b & 1) != 1) ? a6aVar.f : yf6Var.c;
        if (yf6Var == null || (yf6Var.b & 2) != 2) {
            List listS = d46.S(vn7.Q(a6aVar, wjcVar));
            List<a7a> list = a6aVar.p;
            list.getClass();
            ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
            for (a7a a7aVar : list) {
                a7aVar.getClass();
                arrayList.add(vn7.f0(a7aVar, wjcVar));
            }
            ArrayList arrayListQ0 = bu1.Q0(arrayList, listS);
            ArrayList arrayList2 = new ArrayList(cu1.k0(arrayListQ0, 10));
            Iterator it2 = arrayListQ0.iterator();
            while (it2.hasNext()) {
                String strE = e((s6a) it2.next(), p98Var);
                if (strE == null) {
                    return null;
                }
                arrayList2.add(strE);
            }
            String strE2 = e(vn7.U(a6aVar, wjcVar), p98Var);
            if (strE2 == null) {
                return null;
            }
            strConcat = bu1.F0(arrayList2, "", "(", ")", null, 56).concat(strE2);
        } else {
            strConcat = p98Var.getString(yf6Var.d);
        }
        return new jf6(p98Var.getString(i), strConcat);
    }

    public static final boolean d(i6a i6aVar) {
        xl4 xl4Var = xe6.a;
        Object objI = i6aVar.i(gg6.e);
        objI.getClass();
        return xl4Var.d(((Number) objI).intValue()).booleanValue();
    }

    public static String e(s6a s6aVar, p98 p98Var) {
        if (s6aVar.n()) {
            return sn1.b(p98Var.a(s6aVar.i));
        }
        return null;
    }

    public static final f09 f(String[] strArr, String[] strArr2) throws InvalidProtocolBufferException {
        strArr2.getClass();
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(rr0.a(strArr));
        lf6 lf6VarG = g(byteArrayInputStream, strArr2);
        vf6 vf6Var = k5a.H;
        vf6Var.getClass();
        tp1 tp1Var = new tp1(byteArrayInputStream);
        q1 q1Var = (q1) vf6Var.c(tp1Var, a);
        try {
            tp1Var.a(0);
            vf6.a(q1Var);
            return new f09(lf6VarG, (k5a) q1Var);
        } catch (InvalidProtocolBufferException e) {
            e.a = q1Var;
            throw e;
        }
    }

    public static lf6 g(ByteArrayInputStream byteArrayInputStream, String[] strArr) {
        fg6 fg6Var = (fg6) fg6.h.b(byteArrayInputStream, a);
        fg6Var.getClass();
        return new lf6(fg6Var, strArr);
    }

    public static final f09 h(String[] strArr, String[] strArr2) {
        strArr.getClass();
        strArr2.getClass();
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(rr0.a(strArr));
        lf6 lf6VarG = g(byteArrayInputStream, strArr2);
        vf6 vf6Var = e6a.l;
        vf6Var.getClass();
        tp1 tp1Var = new tp1(byteArrayInputStream);
        q1 q1Var = (q1) vf6Var.c(tp1Var, a);
        try {
            tp1Var.a(0);
            vf6.a(q1Var);
            return new f09(lf6VarG, (e6a) q1Var);
        } catch (InvalidProtocolBufferException e) {
            e.a = q1Var;
            throw e;
        }
    }
}
