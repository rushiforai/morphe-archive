package defpackage;

import java.util.ConcurrentModificationException;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class bh7 implements Map.Entry, th6 {
    public final dh7 a;
    public final int b;
    public final int c;

    public bh7(dh7 dh7Var, int i) {
        this.a = dh7Var;
        this.b = i;
        this.c = dh7Var.h;
    }

    public final void a() {
        if (this.a.h != this.c) {
            throw new ConcurrentModificationException("The backing map has been modified after this entry was obtained.");
        }
    }

    @Override // java.util.Map.Entry
    public final boolean equals(Object obj) {
        if (!(obj instanceof Map.Entry)) {
            return false;
        }
        Map.Entry entry = (Map.Entry) obj;
        return g76.L(entry.getKey(), getKey()) && g76.L(entry.getValue(), getValue());
    }

    @Override // java.util.Map.Entry
    public final Object getKey() {
        a();
        return this.a.a[this.b];
    }

    @Override // java.util.Map.Entry
    public final Object getValue() {
        a();
        Object[] objArr = this.a.b;
        objArr.getClass();
        return objArr[this.b];
    }

    @Override // java.util.Map.Entry
    public final int hashCode() {
        Object key = getKey();
        int iHashCode = key != null ? key.hashCode() : 0;
        Object value = getValue();
        return iHashCode ^ (value != null ? value.hashCode() : 0);
    }

    @Override // java.util.Map.Entry
    public final Object setValue(Object obj) {
        a();
        dh7 dh7Var = this.a;
        dh7Var.c();
        Object[] objArr = dh7Var.b;
        if (objArr == null) {
            int length = dh7Var.a.length;
            if (length < 0) {
                ay0.e("capacity must be non-negative.");
                return null;
            }
            objArr = new Object[length];
            dh7Var.b = objArr;
        }
        int i = this.b;
        Object obj2 = objArr[i];
        objArr[i] = obj;
        return obj2;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getKey());
        sb.append('=');
        sb.append(getValue());
        return sb.toString();
    }
}
