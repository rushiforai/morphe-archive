package bb0;

import java.util.HashMap;
import java.util.Map;

/* loaded from: classes.dex */
public final class a extends InheritableThreadLocal {
    @Override // java.lang.InheritableThreadLocal
    public final Object childValue(Object obj) {
        Map map = (Map) obj;
        if (map == null) {
            return null;
        }
        return new HashMap(map);
    }
}
