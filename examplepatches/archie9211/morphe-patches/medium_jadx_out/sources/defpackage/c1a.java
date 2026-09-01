package defpackage;

import android.util.SparseArray;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class c1a {
    public static final SparseArray a = new SparseArray();
    public static final HashMap b;

    static {
        HashMap map = new HashMap();
        b = map;
        map.put(z0a.DEFAULT, 0);
        map.put(z0a.VERY_LOW, 1);
        map.put(z0a.HIGHEST, 2);
        for (z0a z0aVar : map.keySet()) {
            a.append(((Integer) b.get(z0aVar)).intValue(), z0aVar);
        }
    }

    public static int a(z0a z0aVar) {
        Integer num = (Integer) b.get(z0aVar);
        if (num != null) {
            return num.intValue();
        }
        ik4.o("PriorityMapping is missing known Priority value ", z0aVar);
        return 0;
    }

    public static z0a b(int i) {
        z0a z0aVar = (z0a) a.get(i);
        if (z0aVar != null) {
            return z0aVar;
        }
        ay0.e(b09.w(i, "Unknown Priority for value "));
        return null;
    }
}
