package y5;

import b70.k;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import p6.a1;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final LinkedHashMap f96720a;

    /* renamed from: b, reason: collision with root package name */
    public final il.a f96721b;

    public b(LinkedHashMap linkedHashMap, boolean z11) {
        this.f96720a = linkedHashMap;
        this.f96721b = new il.a(z11);
    }

    public final Map a() {
        Pair pair;
        Set<Map.Entry> setEntrySet = this.f96720a.entrySet();
        int iD0 = k.d0(b70.c.u0(setEntrySet, 10));
        if (iD0 < 16) {
            iD0 = 16;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
        for (Map.Entry entry : setEntrySet) {
            Object value = entry.getValue();
            if (value instanceof byte[]) {
                Object key = entry.getKey();
                byte[] bArr = (byte[]) value;
                byte[] bArrCopyOf = Arrays.copyOf(bArr, bArr.length);
                Intrinsics.f(bArrCopyOf, "copyOf(this, size)");
                pair = new Pair(key, bArrCopyOf);
            } else {
                pair = new Pair(entry.getKey(), entry.getValue());
            }
            linkedHashMap.put(pair.f71683a, pair.f71684b);
        }
        return a1.i(linkedHashMap);
    }

    public final Object b(f key) {
        Intrinsics.g(key, "key");
        Object obj = this.f96720a.get(key);
        if (!(obj instanceof byte[])) {
            return obj;
        }
        byte[] bArr = (byte[]) obj;
        byte[] bArrCopyOf = Arrays.copyOf(bArr, bArr.length);
        Intrinsics.f(bArrCopyOf, "copyOf(this, size)");
        return bArrCopyOf;
    }

    public final void c(f key) {
        Intrinsics.g(key, "key");
        if (this.f96721b.a()) {
            throw new IllegalStateException("Do mutate preferences once returned to DataStore.");
        }
        this.f96720a.remove(key);
    }

    public final void d(f key, Object obj) {
        Intrinsics.g(key, "key");
        e(key, obj);
    }

    public final void e(f key, Object obj) {
        Intrinsics.g(key, "key");
        if (this.f96721b.a()) {
            throw new IllegalStateException("Do mutate preferences once returned to DataStore.");
        }
        if (obj == null) {
            c(key);
            return;
        }
        boolean z11 = obj instanceof Set;
        LinkedHashMap linkedHashMap = this.f96720a;
        if (z11) {
            linkedHashMap.put(key, a1.h((Set) obj));
            return;
        }
        if (!(obj instanceof byte[])) {
            linkedHashMap.put(key, obj);
            return;
        }
        byte[] bArr = (byte[]) obj;
        byte[] bArrCopyOf = Arrays.copyOf(bArr, bArr.length);
        Intrinsics.f(bArrCopyOf, "copyOf(this, size)");
        linkedHashMap.put(key, bArrCopyOf);
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x005d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean equals(Object obj) {
        if (obj instanceof b) {
            LinkedHashMap linkedHashMap = ((b) obj).f96720a;
            LinkedHashMap linkedHashMap2 = this.f96720a;
            if (linkedHashMap != linkedHashMap2) {
                if (linkedHashMap.size() == linkedHashMap2.size()) {
                    if (!linkedHashMap.isEmpty()) {
                        for (Map.Entry entry : linkedHashMap.entrySet()) {
                            Object obj2 = linkedHashMap2.get(entry.getKey());
                            if (obj2 != null) {
                                Object value = entry.getValue();
                                boolean zB = value instanceof byte[] ? (obj2 instanceof byte[]) && Arrays.equals((byte[]) value, (byte[]) obj2) : Intrinsics.b(value, obj2);
                                if (!zB) {
                                }
                            }
                        }
                    }
                }
            }
            return true;
        }
        return false;
    }

    public final int hashCode() {
        Iterator it = this.f96720a.entrySet().iterator();
        int iHashCode = 0;
        while (it.hasNext()) {
            Object value = ((Map.Entry) it.next()).getValue();
            iHashCode += value instanceof byte[] ? Arrays.hashCode((byte[]) value) : value.hashCode();
        }
        return iHashCode;
    }

    public final String toString() {
        return b70.g.f1(this.f96720a.entrySet(), ",\n", "{\n", "\n}", 0, a.f96719j, 24);
    }

    public /* synthetic */ b(boolean z11) {
        this(new LinkedHashMap(), z11);
    }
}
