package com.bytedance.adsdk.zb;

import java.util.Arrays;

/* loaded from: classes2.dex */
public final class ok<V> {
    private final V ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final Throwable f22937zb;

    public ok(V v11) {
        this.ycx = v11;
        this.f22937zb = null;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ok)) {
            return false;
        }
        ok okVar = (ok) obj;
        if (ycx() != null && ycx().equals(okVar.ycx())) {
            return true;
        }
        if (zb() == null || okVar.zb() == null) {
            return false;
        }
        return zb().toString().equals(zb().toString());
    }

    public int hashCode() {
        return Arrays.hashCode(new Object[]{ycx(), zb()});
    }

    public V ycx() {
        return this.ycx;
    }

    public Throwable zb() {
        return this.f22937zb;
    }

    public ok(Throwable th2) {
        this.f22937zb = th2;
        this.ycx = null;
    }
}
