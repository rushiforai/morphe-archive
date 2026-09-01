package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ox {
    public static final mx a = new mx("");

    public static final List a(mx mxVar, int i, int i2, nx nxVar) {
        List list;
        if (i == i2 || (list = mxVar.a) == null) {
            return null;
        }
        int i3 = 0;
        if (i == 0 && i2 >= mxVar.b.length()) {
            if (nxVar == null) {
                return list;
            }
            ArrayList arrayList = new ArrayList(list.size());
            int size = list.size();
            while (i3 < size) {
                Object obj = list.get(i3);
                if (((Boolean) nxVar.invoke(((lx) obj).a)).booleanValue()) {
                    arrayList.add(obj);
                }
                i3++;
            }
            return arrayList;
        }
        ArrayList arrayList2 = new ArrayList(list.size());
        int size2 = list.size();
        while (i3 < size2) {
            lx lxVar = (lx) list.get(i3);
            if (nxVar != null ? ((Boolean) nxVar.invoke(lxVar.a)).booleanValue() : true) {
                int i4 = lxVar.b;
                int i5 = lxVar.c;
                if (b(i, i2, i4, i5)) {
                    arrayList2.add(new lx((ix) lxVar.a, iq7.v(lxVar.b, i, i2) - i, iq7.v(i5, i, i2) - i, lxVar.d));
                }
            }
            i3++;
        }
        return arrayList2;
    }

    public static final boolean b(int i, int i2, int i3, int i4) {
        return ((i < i4) & (i3 < i2)) | (((i == i2) | (i3 == i4)) & (i == i3));
    }
}
