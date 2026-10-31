package com.bytedance.adsdk.zb.sya;

import android.util.Pair;

/* loaded from: classes2.dex */
public class ul<T> {
    T ycx;

    /* renamed from: zb, reason: collision with root package name */
    T f23020zb;

    private static boolean zb(Object obj, Object obj2) {
        if (obj != obj2) {
            return obj != null && obj.equals(obj2);
        }
        return true;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof Pair)) {
            return false;
        }
        Pair pair = (Pair) obj;
        return zb(pair.first, this.ycx) && zb(pair.second, this.f23020zb);
    }

    public int hashCode() {
        T t6 = this.ycx;
        int iHashCode = t6 == null ? 0 : t6.hashCode();
        T t9 = this.f23020zb;
        return iHashCode ^ (t9 != null ? t9.hashCode() : 0);
    }

    public String toString() {
        return "Pair{" + this.ycx + " " + this.f23020zb + "}";
    }

    public void ycx(T t6, T t9) {
        this.ycx = t6;
        this.f23020zb = t9;
    }
}
