package defpackage;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rob implements qob {
    public final x45 a;
    public final f78 b;
    public f78 c;

    public rob(Map map, x45 x45Var) {
        f78 f78Var;
        this.a = x45Var;
        if (map == null || map.isEmpty()) {
            f78Var = null;
        } else {
            f78Var = new f78(map.size());
            for (Map.Entry entry : map.entrySet()) {
                f78Var.m(entry.getKey(), entry.getValue());
            }
        }
        this.b = f78Var;
    }

    @Override // defpackage.qob
    public final boolean a(Object obj) {
        return ((Boolean) this.a.invoke(obj)).booleanValue();
    }

    @Override // defpackage.qob
    public final pob b(String str, m45 m45Var) {
        int length = str.length();
        for (int i = 0; i < length; i++) {
            if (!kyd.c0(str.charAt(i))) {
                f78 f78Var = this.c;
                if (f78Var == null) {
                    long[] jArr = hqb.a;
                    f78Var = new f78();
                    this.c = f78Var;
                }
                Object objG = f78Var.g(str);
                if (objG == null) {
                    objG = new ArrayList();
                    f78Var.m(str, objG);
                }
                ((List) objG).add(m45Var);
                return new vwa(f78Var, str, m45Var, 1);
            }
        }
        ay0.e("Registered key is empty or blank");
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x008e  */
    @Override // defpackage.qob
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.util.Map c() {
        /*
            Method dump skipped, instruction units count: 345
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rob.c():java.util.Map");
    }

    @Override // defpackage.qob
    public final Object d(String str) {
        f78 f78Var = this.b;
        List list = f78Var != null ? (List) f78Var.k(str) : null;
        if (list == null || list.isEmpty()) {
            return null;
        }
        if (list.size() > 1 && f78Var != null) {
            List listSubList = list.subList(1, list.size());
            int iF = f78Var.f(str);
            if (iF < 0) {
                iF = ~iF;
            }
            Object[] objArr = f78Var.c;
            Object obj = objArr[iF];
            f78Var.b[iF] = str;
            objArr[iF] = listSubList;
        }
        return list.get(0);
    }
}
