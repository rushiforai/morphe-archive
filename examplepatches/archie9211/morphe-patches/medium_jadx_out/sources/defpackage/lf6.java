package defpackage;

import com.google.android.material.internal.It.KLTXZbnQvj;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class lf6 implements p98 {
    public static final List d;
    public final String[] a;
    public final Set b;
    public final ArrayList c;

    public lf6(fg6 fg6Var, String[] strArr) {
        strArr.getClass();
        List list = fg6Var.c;
        Set setQ1 = list.isEmpty() ? ny3.a : bu1.q1(list);
        List<eg6> list2 = fg6Var.b;
        list2.getClass();
        ArrayList arrayList = new ArrayList();
        arrayList.ensureCapacity(list2.size());
        for (eg6 eg6Var : list2) {
            int i = eg6Var.c;
            for (int i2 = 0; i2 < i; i2++) {
                arrayList.add(eg6Var);
            }
        }
        arrayList.trimToSize();
        this.a = strArr;
        this.b = setQ1;
        this.c = arrayList;
    }

    @Override // defpackage.p98
    public final String a(int i) {
        return getString(i);
    }

    @Override // defpackage.p98
    public final boolean b(int i) {
        return this.b.contains(Integer.valueOf(i));
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x003f  */
    @Override // defpackage.p98
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.String getString(int r8) {
        /*
            Method dump skipped, instruction units count: 244
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lf6.getString(int):java.lang.String");
    }

    static {
        String strF0 = bu1.F0(d46.R('k', 'o', 't', 'l', 'i', 'n'), "", null, null, null, 62);
        List listR = d46.R(strF0.concat("/Any"), strF0.concat("/Nothing"), strF0.concat("/Unit"), strF0.concat("/Throwable"), strF0.concat("/Number"), strF0.concat("/Byte"), strF0.concat("/Double"), strF0.concat("/Float"), strF0.concat("/Int"), strF0.concat("/Long"), strF0.concat("/Short"), strF0.concat("/Boolean"), strF0.concat("/Char"), strF0.concat("/CharSequence"), strF0.concat("/String"), strF0.concat("/Comparable"), strF0.concat("/Enum"), strF0.concat("/Array"), strF0.concat("/ByteArray"), strF0.concat("/DoubleArray"), strF0.concat("/FloatArray"), strF0.concat("/IntArray"), strF0.concat("/LongArray"), strF0.concat("/ShortArray"), strF0.concat("/BooleanArray"), strF0.concat("/CharArray"), strF0.concat("/Cloneable"), strF0.concat("/Annotation"), strF0.concat("/collections/Iterable"), strF0.concat("/collections/MutableIterable"), strF0.concat("/collections/Collection"), strF0.concat("/collections/MutableCollection"), strF0.concat("/collections/List"), strF0.concat(KLTXZbnQvj.oRFAbqbpdxEeLp), strF0.concat("/collections/Set"), strF0.concat("/collections/MutableSet"), strF0.concat("/collections/Map"), strF0.concat("/collections/MutableMap"), strF0.concat("/collections/Map.Entry"), strF0.concat("/collections/MutableMap.MutableEntry"), strF0.concat("/collections/Iterator"), strF0.concat("/collections/MutableIterator"), strF0.concat("/collections/ListIterator"), strF0.concat("/collections/MutableListIterator"));
        d = listR;
        i80 i80VarS1 = bu1.s1(listR);
        int iP = ei7.P(cu1.k0(i80VarS1, 10));
        if (iP < 16) {
            iP = 16;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(iP);
        Iterator it2 = i80VarS1.iterator();
        while (true) {
            zm3 zm3Var = (zm3) it2;
            if (!zm3Var.b.hasNext()) {
                return;
            }
            r06 r06Var = (r06) zm3Var.next();
            linkedHashMap.put((String) r06Var.b, Integer.valueOf(r06Var.a));
        }
    }
}
