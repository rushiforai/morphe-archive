package e20;

import java.util.LinkedHashMap;
import java.util.Map;

/* loaded from: classes.dex */
public final class o extends LinkedHashMap {

    /* renamed from: a, reason: collision with root package name */
    public final int f52065a;

    public o() {
        super(10);
        this.f52065a = 50;
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final boolean containsKey(Object obj) {
        if (obj instanceof h) {
            return super.containsKey(new h(((h) obj).f52026a));
        }
        return false;
    }

    @Override // java.util.LinkedHashMap, java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final /* bridge */ boolean containsValue(Object obj) {
        if (obj instanceof Long) {
            return super.containsValue((Long) obj);
        }
        return false;
    }

    @Override // java.util.LinkedHashMap, java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final Object get(Object obj) {
        if (obj instanceof h) {
            return (Long) super.get(new h(((h) obj).f52026a));
        }
        return null;
    }

    @Override // java.util.LinkedHashMap, java.util.HashMap, java.util.Map
    public final Object getOrDefault(Object obj, Object obj2) {
        if (!(obj instanceof h)) {
            return obj2;
        }
        return (Long) super.getOrDefault(new h(((h) obj).f52026a), (Long) obj2);
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final Object remove(Object obj) {
        if (obj instanceof h) {
            return (Long) super.remove(new h(((h) obj).f52026a));
        }
        return null;
    }

    @Override // java.util.LinkedHashMap
    public final boolean removeEldestEntry(Map.Entry entry) {
        return super.size() >= this.f52065a;
    }

    @Override // java.util.HashMap, java.util.Map
    public final boolean remove(Object obj, Object obj2) {
        if (!(obj instanceof h) || !(obj2 instanceof Long)) {
            return false;
        }
        return super.remove(new h(((h) obj).f52026a), (Long) obj2);
    }
}
