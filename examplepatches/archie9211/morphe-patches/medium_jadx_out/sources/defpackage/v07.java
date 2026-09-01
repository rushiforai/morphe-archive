package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class v07 implements Map.Entry {
    public v07 a;
    public v07 b;
    public v07 c;
    public v07 d;
    public v07 e;
    public final Object f;
    public final int g;
    public Object h;
    public int i;

    public v07(v07 v07Var, Object obj, int i, v07 v07Var2, v07 v07Var3) {
        this.a = v07Var;
        this.f = obj;
        this.g = i;
        this.i = 1;
        this.d = v07Var2;
        this.e = v07Var3;
        v07Var3.d = this;
        v07Var2.e = this;
    }

    @Override // java.util.Map.Entry
    public final boolean equals(Object obj) {
        if (obj instanceof Map.Entry) {
            Map.Entry entry = (Map.Entry) obj;
            Object obj2 = this.f;
            if (obj2 != null ? obj2.equals(entry.getKey()) : entry.getKey() == null) {
                Object obj3 = this.h;
                if (obj3 == null) {
                    if (entry.getValue() == null) {
                        return true;
                    }
                } else if (obj3.equals(entry.getValue())) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override // java.util.Map.Entry
    public final Object getKey() {
        return this.f;
    }

    @Override // java.util.Map.Entry
    public final Object getValue() {
        return this.h;
    }

    @Override // java.util.Map.Entry
    public final int hashCode() {
        Object obj = this.f;
        int iHashCode = obj == null ? 0 : obj.hashCode();
        Object obj2 = this.h;
        return iHashCode ^ (obj2 != null ? obj2.hashCode() : 0);
    }

    @Override // java.util.Map.Entry
    public final Object setValue(Object obj) {
        Object obj2 = this.h;
        this.h = obj;
        return obj2;
    }

    public final String toString() {
        return this.f + "=" + this.h;
    }

    public v07() {
        this.f = null;
        this.g = -1;
        this.e = this;
        this.d = this;
    }
}
