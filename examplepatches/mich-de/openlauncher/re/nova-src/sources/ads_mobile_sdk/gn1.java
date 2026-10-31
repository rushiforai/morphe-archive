package ads_mobile_sdk;

import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/* loaded from: classes.dex */
public final class gn1 extends LinkedHashMap {

    /* renamed from: b, reason: collision with root package name */
    public static final gn1 f4008b;

    /* renamed from: a, reason: collision with root package name */
    public boolean f4009a = true;

    static {
        gn1 gn1Var = new gn1();
        f4008b = gn1Var;
        gn1Var.f4009a = false;
    }

    public final gn1 b() {
        if (isEmpty()) {
            return new gn1();
        }
        gn1 gn1Var = new gn1(this);
        gn1Var.f4009a = true;
        return gn1Var;
    }

    @Override // java.util.LinkedHashMap, java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final void clear() {
        if (!this.f4009a) {
            throw new UnsupportedOperationException();
        }
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
        int iHashCode;
        int i5 = 0;
        for (Map.Entry entry : entrySet()) {
            Object key = entry.getKey();
            int iHashCode2 = 1;
            if (key instanceof byte[]) {
                byte[] bArr = (byte[]) key;
                byte[] bArr2 = rb1.f9048a;
                iHashCode = bArr.length;
                for (byte b11 : bArr) {
                    iHashCode = (iHashCode * 31) + b11;
                }
                if (iHashCode == 0) {
                    iHashCode = 1;
                }
            } else {
                if (key instanceof b.e5) {
                    throw new UnsupportedOperationException();
                }
                iHashCode = key.hashCode();
            }
            Object value = entry.getValue();
            if (value instanceof byte[]) {
                byte[] bArr3 = (byte[]) value;
                byte[] bArr4 = rb1.f9048a;
                int length = bArr3.length;
                for (byte b12 : bArr3) {
                    length = (length * 31) + b12;
                }
                if (length != 0) {
                    iHashCode2 = length;
                }
            } else {
                if (value instanceof b.e5) {
                    throw new UnsupportedOperationException();
                }
                iHashCode2 = value.hashCode();
            }
            i5 += iHashCode ^ iHashCode2;
        }
        return i5;
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final Object put(Object obj, Object obj2) {
        if (!this.f4009a) {
            throw new UnsupportedOperationException();
        }
        byte[] bArr = rb1.f9048a;
        obj.getClass();
        obj2.getClass();
        return super.put(obj, obj2);
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final void putAll(Map map) {
        if (!this.f4009a) {
            throw new UnsupportedOperationException();
        }
        for (Object obj : map.keySet()) {
            byte[] bArr = rb1.f9048a;
            obj.getClass();
            map.get(obj).getClass();
        }
        super.putAll(map);
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final Object remove(Object obj) {
        if (this.f4009a) {
            return super.remove(obj);
        }
        throw new UnsupportedOperationException();
    }
}
