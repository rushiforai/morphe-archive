package defpackage;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xn1 {
    public final HashMap a = new HashMap();
    public final HashMap b;

    public xn1(HashMap map) {
        this.b = map;
        for (Map.Entry entry : map.entrySet()) {
            ux6 ux6Var = (ux6) entry.getValue();
            List arrayList = (List) this.a.get(ux6Var);
            if (arrayList == null) {
                arrayList = new ArrayList();
                this.a.put(ux6Var, arrayList);
            }
            arrayList.add((yn1) entry.getKey());
        }
    }

    public static void a(List list, iy6 iy6Var, ux6 ux6Var, hy6 hy6Var) {
        if (list != null) {
            for (int size = list.size() - 1; size >= 0; size--) {
                yn1 yn1Var = (yn1) list.get(size);
                Method method = yn1Var.b;
                try {
                    int i = yn1Var.a;
                    if (i == 0) {
                        method.invoke(hy6Var, null);
                    } else if (i == 1) {
                        method.invoke(hy6Var, iy6Var);
                    } else if (i == 2) {
                        method.invoke(hy6Var, iy6Var, ux6Var);
                    }
                } catch (IllegalAccessException e) {
                    ik4.j(e);
                    return;
                } catch (InvocationTargetException e2) {
                    lg8.p("Failed to call observer method", e2.getCause());
                    return;
                }
            }
        }
    }
}
