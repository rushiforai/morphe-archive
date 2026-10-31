package w20;

import java.lang.ref.SoftReference;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import kotlin.collections.AbstractMutableMap;

/* loaded from: classes.dex */
public final class y extends AbstractMutableMap {

    /* renamed from: a, reason: collision with root package name */
    public final WeakHashMap f93732a = new WeakHashMap();

    @Override // kotlin.collections.AbstractMutableMap
    public final Set a() {
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        for (Map.Entry entry : this.f93732a.entrySet()) {
            Object key = entry.getKey();
            Object obj = ((SoftReference) entry.getValue()).get();
            if (obj != null) {
                linkedHashSet.add(new x(key, obj, this));
            }
        }
        return linkedHashSet;
    }

    @Override // kotlin.collections.AbstractMutableMap
    public final int c() {
        return a().size();
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean containsKey(Object obj) {
        return this.f93732a.containsKey(obj);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object get(Object obj) {
        SoftReference softReference = (SoftReference) this.f93732a.get(obj);
        if (softReference != null) {
            return softReference.get();
        }
        return null;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object put(Object obj, Object obj2) {
        SoftReference softReference = (SoftReference) this.f93732a.put(obj, new SoftReference(obj2));
        if (softReference != null) {
            return softReference.get();
        }
        return null;
    }
}
