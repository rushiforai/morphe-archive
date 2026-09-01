package defpackage;

import j$.util.concurrent.ConcurrentHashMap;
import java.util.Collections;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class t1b extends s1b {
    public static ph6 l(h41 h41Var) {
        lh6 owner = h41Var.getOwner();
        return owner instanceof ph6 ? (ph6) owner : yx3.b;
    }

    @Override // defpackage.s1b
    public final qh6 a(w55 w55Var) {
        ph6 ph6VarL = l(w55Var);
        String name = w55Var.getName();
        String signature = w55Var.getSignature();
        Object boundReceiver = w55Var.getBoundReceiver();
        name.getClass();
        signature.getClass();
        return new sh6(ph6VarL, name, signature, null, boundReceiver);
    }

    @Override // defpackage.s1b
    public final wg6 b(Class cls) {
        return q31.a(cls);
    }

    @Override // defpackage.s1b
    public final lh6 c(Class cls) {
        lig ligVar = q31.a;
        cls.getClass();
        return (lh6) q31.b.D(cls);
    }

    @Override // defpackage.s1b
    public final xh6 d(bp7 bp7Var) {
        return new zh6(l(bp7Var), bp7Var.getName(), bp7Var.getSignature(), bp7Var.getBoundReceiver());
    }

    @Override // defpackage.s1b
    public final ai6 e(c78 c78Var) {
        return new ci6(l(c78Var), c78Var.getName(), c78Var.getSignature(), c78Var.getBoundReceiver());
    }

    @Override // defpackage.s1b
    public final ti6 f(kv4 kv4Var) {
        return new wi6(l(kv4Var), kv4Var.getName(), kv4Var.getSignature(), kv4Var.getBoundReceiver());
    }

    @Override // defpackage.s1b
    public final xi6 g(u4a u4aVar) {
        return new aj6(l(u4aVar), u4aVar.getName(), u4aVar.getSignature(), u4aVar.getBoundReceiver());
    }

    @Override // defpackage.s1b
    public final bj6 h(v4a v4aVar) {
        return new ej6(l(v4aVar), v4aVar.getName(), v4aVar.getSignature());
    }

    /* JADX WARN: Removed duplicated region for block: B:4:0x0011  */
    @Override // defpackage.s1b
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.String i(defpackage.l55 r14) throws java.io.IOException {
        /*
            Method dump skipped, instruction units count: 249
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.t1b.i(l55):java.lang.String");
    }

    @Override // defpackage.s1b
    public final String j(co6 co6Var) {
        return i(co6Var);
    }

    @Override // defpackage.s1b
    public final qj6 k(wg6 wg6Var, List list) {
        if (!(wg6Var instanceof ym1)) {
            return vv2.D(wg6Var, list, false, Collections.EMPTY_LIST);
        }
        Class clsE = ((ym1) wg6Var).e();
        lig ligVar = q31.a;
        clsE.getClass();
        list.getClass();
        if (list.isEmpty()) {
            return (qj6) q31.c.D(clsE);
        }
        ConcurrentHashMap concurrentHashMap = (ConcurrentHashMap) q31.d.D(clsE);
        f09 f09Var = new f09(list, Boolean.FALSE);
        Object obj = concurrentHashMap.get(f09Var);
        if (obj == null) {
            vj6 vj6VarD = vv2.D(q31.a(clsE), list, false, ey3.a);
            Object objPutIfAbsent = concurrentHashMap.putIfAbsent(f09Var, vj6VarD);
            obj = objPutIfAbsent == null ? vj6VarD : objPutIfAbsent;
        }
        return (qj6) obj;
    }
}
