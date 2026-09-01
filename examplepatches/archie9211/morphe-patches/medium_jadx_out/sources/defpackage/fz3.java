package defpackage;

import androidx.work.impl.WorkDatabase;
import java.util.HashSet;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class fz3 {
    public static final String a = d87.k("EnqueueRunnable");

    public static void a(b7f b7fVar) {
        boolean z;
        m7f m7fVar = b7fVar.a;
        HashSet hashSet = new HashSet();
        hashSet.addAll(b7fVar.e);
        HashSet hashSetB = b7f.b(b7fVar);
        Iterator it2 = hashSet.iterator();
        while (true) {
            if (!it2.hasNext()) {
                hashSet.removeAll(b7fVar.e);
                z = false;
                break;
            } else if (hashSetB.contains((String) it2.next())) {
                z = true;
                break;
            }
        }
        if (z) {
            rd6.w("WorkContinuation has cycles (", b7fVar, ")");
            return;
        }
        WorkDatabase workDatabase = m7fVar.c;
        r32 r32Var = m7fVar.b;
        workDatabase.b();
        try {
            nk7.j0(workDatabase, r32Var, b7fVar);
            boolean zB = b(b7fVar);
            workDatabase.q();
            if (zB) {
                zqb.b(r32Var, m7fVar.c, m7fVar.e);
            }
        } finally {
            workDatabase.m();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:83:0x0195  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x01a7  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static boolean b(defpackage.b7f r23) {
        /*
            Method dump skipped, instruction units count: 617
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fz3.b(b7f):boolean");
    }
}
