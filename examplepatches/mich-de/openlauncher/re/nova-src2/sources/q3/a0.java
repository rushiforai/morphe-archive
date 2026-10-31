package q3;

import b.u4;
import h6.c1;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class a0 {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f83523a;

    public a0(x... xVarArr) {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (x xVar : xVarArr) {
            String strB = xVar.b();
            Object arrayList = linkedHashMap.get(strB);
            if (arrayList == null) {
                arrayList = new ArrayList();
                linkedHashMap.put(strB, arrayList);
            }
            ((List) arrayList).add(xVar);
        }
        ArrayList arrayList2 = new ArrayList();
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            String str = (String) entry.getKey();
            List list = (List) entry.getValue();
            if (list.size() != 1) {
                throw new IllegalArgumentException(c1.t(u4.k("'", str, "' must be unique. Actual [ ["), b70.g.f1(list, null, null, null, 0, null, 63), AbstractJsonLexerKt.END_LIST).toString());
            }
            b70.d.z0(list, arrayList2);
        }
        ArrayList arrayList3 = new ArrayList(arrayList2);
        this.f83523a = arrayList3;
        int size = arrayList3.size();
        for (int i5 = 0; i5 < size; i5++) {
            ((x) arrayList3.get(i5)).getClass();
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof a0) {
            return Intrinsics.b(this.f83523a, ((a0) obj).f83523a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f83523a.hashCode();
    }
}
