package h6;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f59349a = new HashMap();

    /* renamed from: b, reason: collision with root package name */
    public final HashMap f59350b;

    public d(HashMap map) {
        this.f59350b = map;
        for (Map.Entry entry : map.entrySet()) {
            s sVar = (s) entry.getValue();
            List arrayList = (List) this.f59349a.get(sVar);
            if (arrayList == null) {
                arrayList = new ArrayList();
                this.f59349a.put(sVar, arrayList);
            }
            arrayList.add((e) entry.getKey());
        }
    }

    public static void a(List list, a0 a0Var, s sVar, Object obj) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        if (list != null) {
            for (int size = list.size() - 1; size >= 0; size--) {
                e eVar = (e) list.get(size);
                Method method = eVar.f59355b;
                try {
                    int i5 = eVar.f59354a;
                    if (i5 == 0) {
                        method.invoke(obj, null);
                    } else if (i5 == 1) {
                        method.invoke(obj, a0Var);
                    } else if (i5 == 2) {
                        method.invoke(obj, a0Var, sVar);
                    }
                } catch (IllegalAccessException e3) {
                    throw new RuntimeException(e3);
                } catch (InvocationTargetException e11) {
                    throw new RuntimeException("Failed to call observer method", e11.getCause());
                }
            }
        }
    }
}
