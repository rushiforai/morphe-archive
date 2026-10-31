package com.bytedance.adsdk.zb;

import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

/* loaded from: classes2.dex */
public class xkz<K, V> {

    /* renamed from: dj, reason: collision with root package name */
    private int f23140dj;
    private int fby;

    /* renamed from: lt, reason: collision with root package name */
    private int f23141lt;
    private int lud;
    private int sya;

    /* renamed from: ul, reason: collision with root package name */
    private int f23142ul;
    private final LinkedHashMap<K, V> ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f23143zb;

    public xkz(int i5) {
        if (i5 <= 0) {
            throw new IllegalArgumentException("maxSize <= 0");
        }
        this.sya = i5;
        this.ycx = new LinkedHashMap<>(0, 0.75f, true);
    }

    private int sya(K k11, V v11) {
        int iZb = zb(k11, v11);
        if (iZb >= 0) {
            return iZb;
        }
        throw new IllegalStateException("Negative size: " + k11 + "=" + v11);
    }

    public final synchronized String toString() {
        int i5;
        try {
            int i11 = this.f23142ul;
            int i12 = this.fby + i11;
            i5 = i12 != 0 ? (i11 * 100) / i12 : 0;
            Locale locale = Locale.US;
        } catch (Throwable th2) {
            throw th2;
        }
        return "LruCache[maxSize=" + this.sya + ",hits=" + this.f23142ul + ",misses=" + this.fby + ",hitRate=" + i5 + "%]";
    }

    public final V ycx(K k11) {
        V vPut;
        if (k11 == null) {
            throw new NullPointerException("key == null");
        }
        synchronized (this) {
            try {
                V v11 = this.ycx.get(k11);
                if (v11 != null) {
                    this.f23142ul++;
                    return v11;
                }
                this.fby++;
                V vZb = zb(k11);
                if (vZb == null) {
                    return null;
                }
                synchronized (this) {
                    try {
                        this.lud++;
                        vPut = this.ycx.put(k11, vZb);
                        if (vPut != null) {
                            this.ycx.put(k11, vPut);
                        } else {
                            this.f23143zb += sya(k11, vZb);
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                if (vPut != null) {
                    return vPut;
                }
                ycx(this.sya);
                return vZb;
            } finally {
            }
        }
    }

    public int zb(K k11, V v11) {
        return 1;
    }

    public V zb(K k11) {
        return null;
    }

    public final V ycx(K k11, V v11) {
        V vPut;
        if (k11 != null && v11 != null) {
            synchronized (this) {
                try {
                    this.f23140dj++;
                    this.f23143zb += sya(k11, v11);
                    vPut = this.ycx.put(k11, v11);
                    if (vPut != null) {
                        this.f23143zb -= sya(k11, vPut);
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            ycx(this.sya);
            return vPut;
        }
        throw new NullPointerException("key == null || value == null");
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x006f, code lost:
    
        throw new java.lang.IllegalStateException(getClass().getName() + ".sizeOf() is reporting inconsistent results!");
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void ycx(int i5) {
        while (true) {
            synchronized (this) {
                try {
                    if (this.f23143zb < 0 || (this.ycx.isEmpty() && this.f23143zb != 0)) {
                        break;
                    }
                    if (this.f23143zb <= i5 || this.ycx.isEmpty()) {
                        break;
                    }
                    Map.Entry<K, V> next = this.ycx.entrySet().iterator().next();
                    K key = next.getKey();
                    V value = next.getValue();
                    this.ycx.remove(key);
                    this.f23143zb -= sya(key, value);
                    this.f23141lt++;
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
    }
}
