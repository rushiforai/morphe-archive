package fz;

import com.android.launcher3.icons.BitmapInfo;
import java.util.LinkedHashMap;
import java.util.Map;

/* loaded from: classes.dex */
public final class z extends LinkedHashMap {
    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final /* bridge */ boolean containsKey(Object obj) {
        if (obj instanceof Integer) {
            return super.containsKey((Integer) obj);
        }
        return false;
    }

    @Override // java.util.LinkedHashMap, java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final /* bridge */ boolean containsValue(Object obj) {
        if (obj instanceof BitmapInfo) {
            return super.containsValue((BitmapInfo) obj);
        }
        return false;
    }

    @Override // java.util.LinkedHashMap, java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final /* bridge */ Object get(Object obj) {
        if (obj instanceof Integer) {
            return (BitmapInfo) super.get((Integer) obj);
        }
        return null;
    }

    @Override // java.util.LinkedHashMap, java.util.HashMap, java.util.Map
    public final /* bridge */ Object getOrDefault(Object obj, Object obj2) {
        return !(obj instanceof Integer) ? obj2 : (BitmapInfo) super.getOrDefault((Integer) obj, (BitmapInfo) obj2);
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final /* bridge */ Object remove(Object obj) {
        if (obj instanceof Integer) {
            return (BitmapInfo) super.remove((Integer) obj);
        }
        return null;
    }

    @Override // java.util.LinkedHashMap
    public final boolean removeEldestEntry(Map.Entry entry) {
        return super.size() > 25;
    }

    @Override // java.util.HashMap, java.util.Map
    public final /* bridge */ boolean remove(Object obj, Object obj2) {
        if ((obj instanceof Integer) && (obj2 instanceof BitmapInfo)) {
            return super.remove((Integer) obj, (BitmapInfo) obj2);
        }
        return false;
    }
}
