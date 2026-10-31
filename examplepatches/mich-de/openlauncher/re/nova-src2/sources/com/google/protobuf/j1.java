package com.google.protobuf;

import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/* loaded from: classes3.dex */
public final class j1 extends LinkedHashMap {

    /* renamed from: b, reason: collision with root package name */
    public static final j1 f34877b;

    /* renamed from: a, reason: collision with root package name */
    public boolean f34878a = true;

    static {
        j1 j1Var = new j1();
        f34877b = j1Var;
        j1Var.f34878a = false;
    }

    public static int a(Object obj) {
        if (!(obj instanceof byte[])) {
            if (obj instanceof r0) {
                throw new UnsupportedOperationException();
            }
            return obj.hashCode();
        }
        byte[] bArr = (byte[]) obj;
        int length = bArr.length;
        Charset charset = a1.f34808a;
        int i5 = length;
        for (byte b11 : bArr) {
            i5 = (i5 * 31) + b11;
        }
        if (i5 == 0) {
            return 1;
        }
        return i5;
    }

    public static j1 c() {
        return f34877b;
    }

    @Override // java.util.LinkedHashMap, java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final void clear() {
        d();
        super.clear();
    }

    public final void d() {
        if (!this.f34878a) {
            throw new UnsupportedOperationException();
        }
    }

    public final boolean e() {
        return this.f34878a;
    }

    @Override // java.util.LinkedHashMap, java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final Set entrySet() {
        return isEmpty() ? Collections.EMPTY_SET : super.entrySet();
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x005d A[RETURN] */
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

    public final void f() {
        this.f34878a = false;
    }

    public final void g(j1 j1Var) {
        d();
        if (j1Var.isEmpty()) {
            return;
        }
        putAll(j1Var);
    }

    public final j1 h() {
        if (isEmpty()) {
            return new j1();
        }
        j1 j1Var = new j1(this);
        j1Var.f34878a = true;
        return j1Var;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int hashCode() {
        int iA = 0;
        for (Map.Entry entry : entrySet()) {
            iA += a(entry.getValue()) ^ a(entry.getKey());
        }
        return iA;
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final Object put(Object obj, Object obj2) {
        d();
        Charset charset = a1.f34808a;
        obj.getClass();
        obj2.getClass();
        return super.put(obj, obj2);
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final void putAll(Map map) {
        d();
        for (Object obj : map.keySet()) {
            Charset charset = a1.f34808a;
            obj.getClass();
            map.get(obj).getClass();
        }
        super.putAll(map);
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final Object remove(Object obj) {
        d();
        return super.remove(obj);
    }
}
