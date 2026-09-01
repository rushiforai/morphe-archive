package defpackage;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ydc {
    public final String a;
    public final ArrayList b = new ArrayList();
    public f09 c = new f09("V", null);

    public ydc(mya myaVar, String str, String str2) {
        this.a = str2;
    }

    public final void a(String str, y96... y96VarArr) {
        gwd gwdVar;
        str.getClass();
        if (y96VarArr.length == 0) {
            gwdVar = null;
        } else {
            i80 i80Var = new i80(1, new l8(10, y96VarArr));
            int iP = ei7.P(cu1.k0(i80Var, 10));
            if (iP < 16) {
                iP = 16;
            }
            LinkedHashMap linkedHashMap = new LinkedHashMap(iP);
            Iterator it2 = i80Var.iterator();
            while (true) {
                zm3 zm3Var = (zm3) it2;
                if (!zm3Var.b.hasNext()) {
                    break;
                }
                r06 r06Var = (r06) zm3Var.next();
                linkedHashMap.put(Integer.valueOf(r06Var.a), (y96) r06Var.b);
            }
            gwdVar = new gwd(linkedHashMap);
        }
        this.b.add(new f09(str, gwdVar));
    }

    public final void b(pf6 pf6Var) {
        pf6Var.getClass();
        String desc = pf6Var.getDesc();
        desc.getClass();
        this.c = new f09(desc, null);
    }

    public final void c(String str, y96... y96VarArr) {
        str.getClass();
        i80 i80Var = new i80(1, new l8(10, y96VarArr));
        int iP = ei7.P(cu1.k0(i80Var, 10));
        if (iP < 16) {
            iP = 16;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(iP);
        Iterator it2 = i80Var.iterator();
        while (true) {
            zm3 zm3Var = (zm3) it2;
            if (!zm3Var.b.hasNext()) {
                this.c = new f09(str, new gwd(linkedHashMap));
                return;
            } else {
                r06 r06Var = (r06) zm3Var.next();
                linkedHashMap.put(Integer.valueOf(r06Var.a), (y96) r06Var.b);
            }
        }
    }
}
