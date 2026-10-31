package m3;

import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public abstract class h {

    /* renamed from: a, reason: collision with root package name */
    public static final g f75897a = new g(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);

    public static final List a(g gVar, int i5, int i11, lm.h hVar) {
        List list;
        if (i5 == i11 || (list = gVar.f75879a) == null) {
            return null;
        }
        if (i5 != 0 || i11 < gVar.f75880b.length()) {
            ArrayList arrayList = new ArrayList(list.size());
            int size = list.size();
            for (int i12 = 0; i12 < size; i12++) {
                e eVar = (e) list.get(i12);
                if ((hVar != null ? ((Boolean) hVar.invoke(eVar.f75852a)).booleanValue() : true) && b(i5, i11, eVar.f75853b, eVar.f75854c)) {
                    arrayList.add(new e((b) eVar.f75852a, kotlin.ranges.a.e0(eVar.f75853b, i5, i11) - i5, kotlin.ranges.a.e0(eVar.f75854c, i5, i11) - i5, eVar.f75855d));
                }
            }
            return arrayList;
        }
        if (hVar == null) {
            return list;
        }
        ArrayList arrayList2 = new ArrayList(list.size());
        int size2 = list.size();
        for (int i13 = 0; i13 < size2; i13++) {
            Object obj = list.get(i13);
            if (((Boolean) hVar.invoke(((e) obj).f75852a)).booleanValue()) {
                arrayList2.add(obj);
            }
        }
        return arrayList2;
    }

    public static final boolean b(int i5, int i11, int i12, int i13) {
        return ((i5 < i13) & (i12 < i11)) | (((i5 == i11) | (i12 == i13)) & (i5 == i12));
    }
}
