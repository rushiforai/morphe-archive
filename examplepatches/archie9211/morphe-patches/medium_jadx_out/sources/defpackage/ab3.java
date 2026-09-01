package defpackage;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ab3 {
    public static final String a = d87.k("DiagnosticsWrkr");

    public static final String a(s7f s7fVar, i8f i8fVar, q6d q6dVar, List list) throws IOException {
        StringBuilder sb = new StringBuilder("\n Id \t Class Name\t Job Id\t State\t Unique Name\t Tags\t");
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            c8f c8fVar = (c8f) it2.next();
            h7f h7fVarW = il7.w(c8fVar);
            String str = c8fVar.a;
            q6dVar.getClass();
            String str2 = h7fVarW.a;
            int i = h7fVarW.b;
            str2.getClass();
            p6d p6dVar = (p6d) n01.c0(q6dVar.a, true, false, new ne(str2, i, 5));
            Integer numValueOf = p6dVar != null ? Integer.valueOf(p6dVar.c) : null;
            s7fVar.getClass();
            str.getClass();
            String strF0 = bu1.F0((List) n01.c0(s7fVar.a, true, false, new nmc(str, 12)), ",", null, null, null, 62);
            i8fVar.getClass();
            String strF02 = bu1.F0((List) n01.c0(i8fVar.a, true, false, new nmc(str, 25)), ",", null, null, null, 62);
            StringBuilder sbU = lv8.u("\n", str, "\t ");
            sbU.append(c8fVar.c);
            sbU.append("\t ");
            sbU.append(numValueOf);
            sbU.append("\t ");
            sbU.append(c8fVar.b.name());
            sbU.append("\t ");
            sbU.append(strF0);
            sbU.append("\t ");
            sbU.append(strF02);
            sbU.append('\t');
            sb.append(sbU.toString());
        }
        return sb.toString();
    }
}
