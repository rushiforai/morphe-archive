package defpackage;

import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cof extends LinkedHashMap {
    public static final cof b;
    public boolean a = true;

    static {
        cof cofVar = new cof();
        b = cofVar;
        cofVar.a = false;
    }

    public static int b(Object obj) {
        if (!(obj instanceof byte[])) {
            if (!(obj instanceof jnf)) {
                return obj.hashCode();
            }
            rd6.b();
            return 0;
        }
        byte[] bArr = (byte[]) obj;
        int length = bArr.length;
        int iB = tnf.b(length, 0, length, bArr);
        if (iB == 0) {
            return 1;
        }
        return iB;
    }

    public final cof a() {
        if (isEmpty()) {
            return new cof();
        }
        cof cofVar = new cof(this);
        cofVar.a = true;
        return cofVar;
    }

    public final void c() {
        if (this.a) {
            return;
        }
        rd6.b();
    }

    @Override // java.util.LinkedHashMap, java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final void clear() {
        c();
        super.clear();
    }

    @Override // java.util.LinkedHashMap, java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final Set entrySet() {
        return isEmpty() ? Collections.EMPTY_SET : super.entrySet();
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean equals(Object obj) {
        if (!(obj instanceof Map)) {
            return false;
        }
        Map map = (Map) obj;
        if (this == map) {
            return true;
        }
        if (size() != map.size()) {
            return false;
        }
        for (Map.Entry entry : entrySet()) {
            if (!map.containsKey(entry.getKey())) {
                return false;
            }
            Object value = entry.getValue();
            Object obj2 = map.get(entry.getKey());
            if (!(((value instanceof byte[]) && (obj2 instanceof byte[])) ? Arrays.equals((byte[]) value, (byte[]) obj2) : value.equals(obj2))) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int hashCode() {
        int iB = 0;
        for (Map.Entry entry : entrySet()) {
            iB += b(entry.getValue()) ^ b(entry.getKey());
        }
        return iB;
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final Object put(Object obj, Object obj2) {
        c();
        obj.getClass();
        obj2.getClass();
        return super.put(obj, obj2);
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final void putAll(Map map) {
        c();
        for (Object obj : map.keySet()) {
            obj.getClass();
            map.get(obj).getClass();
        }
        super.putAll(map);
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final Object remove(Object obj) {
        c();
        return super.remove(obj);
    }
}
