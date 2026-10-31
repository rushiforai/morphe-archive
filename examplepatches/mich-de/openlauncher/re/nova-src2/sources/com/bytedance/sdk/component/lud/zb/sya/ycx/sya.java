package com.bytedance.sdk.component.lud.zb.sya.ycx;

import java.lang.ref.SoftReference;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

/* loaded from: classes2.dex */
public class sya<K, V> {
    private final LinkedHashMap<K, SoftReference<V>> ycx = new LinkedHashMap<>(0, 0.75f, true);

    /* renamed from: zb, reason: collision with root package name */
    private int f24026zb;

    public sya(int i5) {
        this.f24026zb = i5;
    }

    public final synchronized String toString() {
        return String.format("LruCache[maxCount=%d,size=%d]", Integer.valueOf(this.f24026zb), Integer.valueOf(this.ycx.size()));
    }

    public synchronized V ycx(K k11) {
        V v11 = null;
        if (k11 == null) {
            return null;
        }
        if (this.f24026zb <= 0) {
            return null;
        }
        SoftReference<V> softReference = this.ycx.get(k11);
        if (softReference != null) {
            v11 = softReference.get();
            if (v11 != null) {
                return v11;
            }
            this.ycx.remove(k11);
        }
        return v11;
    }

    public synchronized void ycx(K k11, V v11) {
        if (this.f24026zb <= 0) {
            return;
        }
        if (k11 == null || v11 == null) {
            return;
        }
        this.ycx.put(k11, new SoftReference<>(v11));
        int size = this.ycx.size();
        int i5 = this.f24026zb;
        if (size > i5) {
            ycx((int) (i5 * 0.7d));
        }
    }

    public synchronized void ycx(int i5) {
        int size = this.ycx.size() - i5;
        if (size > 0) {
            Iterator<Map.Entry<K, SoftReference<V>>> it = this.ycx.entrySet().iterator();
            for (int i11 = 0; i11 < size; i11++) {
                it.next();
                it.remove();
            }
        }
        if (i5 == 0) {
            return;
        }
        Iterator<Map.Entry<K, SoftReference<V>>> it2 = this.ycx.entrySet().iterator();
        while (it2.hasNext()) {
            if (it2.next().getValue().get() == null) {
                it2.remove();
            }
        }
    }
}
