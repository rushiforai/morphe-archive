package ee;

import android.util.SparseArray;
import b.c0;
import java.util.HashMap;
import qd.d;

/* loaded from: classes.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final SparseArray f52687a = new SparseArray();

    /* renamed from: b, reason: collision with root package name */
    public static final HashMap f52688b;

    static {
        HashMap map = new HashMap();
        f52688b = map;
        map.put(d.f83918a, 0);
        map.put(d.f83919b, 1);
        map.put(d.f83920c, 2);
        for (d dVar : map.keySet()) {
            f52687a.append(((Integer) f52688b.get(dVar)).intValue(), dVar);
        }
    }

    public static int a(d dVar) {
        Integer num = (Integer) f52688b.get(dVar);
        if (num != null) {
            return num.intValue();
        }
        throw new IllegalStateException("PriorityMapping is missing known Priority value " + dVar);
    }

    public static d b(int i5) {
        d dVar = (d) f52687a.get(i5);
        if (dVar != null) {
            return dVar;
        }
        throw new IllegalArgumentException(c0.h(i5, "Unknown Priority for value "));
    }
}
