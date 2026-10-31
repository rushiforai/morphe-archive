package com.fyber.inneractive.sdk.protobuf;

import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/* loaded from: classes3.dex */
public final class y1 extends LinkedHashMap {

    /* renamed from: b, reason: collision with root package name */
    public static final y1 f30964b;

    /* renamed from: a, reason: collision with root package name */
    public boolean f30965a;

    static {
        y1 y1Var = new y1();
        f30964b = y1Var;
        y1Var.f30965a = false;
    }

    public y1() {
        this.f30965a = true;
    }

    @Override // java.util.LinkedHashMap, java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final void clear() {
        if (!this.f30965a) {
            throw new UnsupportedOperationException();
        }
        super.clear();
    }

    @Override // java.util.LinkedHashMap, java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final Set entrySet() {
        return isEmpty() ? Collections.EMPTY_SET : super.entrySet();
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x005d A[RETURN] */
    @Override // java.util.AbstractMap, java.util.Map
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean equals(Object obj) {
        boolean z11;
        if (obj instanceof Map) {
            Map map = (Map) obj;
            if (this != map) {
                if (size() == map.size()) {
                    for (Map.Entry entry : entrySet()) {
                        if (map.containsKey(entry.getKey())) {
                            Object value = entry.getValue();
                            Object obj2 = map.get(entry.getKey());
                            if (!(((value instanceof byte[]) && (obj2 instanceof byte[])) ? Arrays.equals((byte[]) value, (byte[]) obj2) : value.equals(obj2))) {
                            }
                        }
                    }
                    z11 = true;
                    if (z11) {
                        return true;
                    }
                }
                z11 = false;
                if (z11) {
                }
            } else {
                z11 = true;
                if (z11) {
                }
            }
        }
        return false;
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
                Charset charset = l1.f30847a;
                iHashCode = bArr.length;
                for (byte b11 : bArr) {
                    iHashCode = (iHashCode * 31) + b11;
                }
                if (iHashCode == 0) {
                    iHashCode = 1;
                }
            } else {
                if (key instanceof d1) {
                    throw new UnsupportedOperationException();
                }
                iHashCode = key.hashCode();
            }
            Object value = entry.getValue();
            if (value instanceof byte[]) {
                byte[] bArr2 = (byte[]) value;
                Charset charset2 = l1.f30847a;
                int length = bArr2.length;
                for (byte b12 : bArr2) {
                    length = (length * 31) + b12;
                }
                if (length != 0) {
                    iHashCode2 = length;
                }
            } else {
                if (value instanceof d1) {
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
        if (!this.f30965a) {
            throw new UnsupportedOperationException();
        }
        Charset charset = l1.f30847a;
        obj.getClass();
        obj2.getClass();
        return super.put(obj, obj2);
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final void putAll(Map map) {
        if (!this.f30965a) {
            throw new UnsupportedOperationException();
        }
        for (Object obj : map.keySet()) {
            Charset charset = l1.f30847a;
            obj.getClass();
            map.get(obj).getClass();
        }
        super.putAll(map);
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final Object remove(Object obj) {
        if (this.f30965a) {
            return super.remove(obj);
        }
        throw new UnsupportedOperationException();
    }

    public y1(Map map) {
        super(map);
        this.f30965a = true;
    }
}
