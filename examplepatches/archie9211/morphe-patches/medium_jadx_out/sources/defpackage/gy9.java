package defpackage;

import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gy9 {
    public final gwd a;
    public final ArrayList b;
    public final String c;
    public final gy9 d;

    public gy9(gwd gwdVar, ArrayList arrayList, String str) {
        this.a = gwdVar;
        this.b = arrayList;
        this.c = str;
        gy9 gy9Var = null;
        if (str != null) {
            gwd gwdVarA = gwdVar != null ? gwdVar.a() : null;
            ArrayList arrayList2 = new ArrayList(cu1.k0(arrayList, 10));
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                gwd gwdVar2 = (gwd) it2.next();
                arrayList2.add(gwdVar2 != null ? gwdVar2.a() : null);
            }
            gy9Var = new gy9(gwdVarA, arrayList2, null);
        }
        this.d = gy9Var;
    }
}
