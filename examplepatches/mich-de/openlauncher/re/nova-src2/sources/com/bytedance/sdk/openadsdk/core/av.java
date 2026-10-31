package com.bytedance.sdk.openadsdk.core;

import android.content.Intent;
import android.text.TextUtils;
import b.u4;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes2.dex */
public class av {
    private static av ycx;

    /* renamed from: lt, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.ycx.sya.zb f25259lt;
    private com.bytedance.sdk.openadsdk.ycx.lud.ycx lud;

    /* renamed from: ul, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.ycx.dj.zb f25260ul;

    /* renamed from: zb, reason: collision with root package name */
    private final AtomicInteger f25261zb = new AtomicInteger(0);
    private Map<Integer, com.bytedance.sdk.openadsdk.core.model.ycx> sya = new ConcurrentHashMap();

    /* renamed from: dj, reason: collision with root package name */
    private final ConcurrentHashMap<String, ycx<?>> f25258dj = new ConcurrentHashMap<>();
    private final Map<String, zb> fby = new HashMap();

    public static class ycx<T> {
        public final long sya = System.currentTimeMillis();
        public final T ycx;

        /* renamed from: zb, reason: collision with root package name */
        public final String f25262zb;

        public ycx(T t6, String str) {
            this.ycx = t6;
            this.f25262zb = str;
        }
    }

    public interface zb {
        void ycx();
    }

    private av() {
    }

    public com.bytedance.sdk.openadsdk.ycx.dj.zb dj() {
        return this.f25260ul;
    }

    public void lud() {
        this.lud = null;
        this.f25259lt = null;
        this.f25260ul = null;
    }

    public com.bytedance.sdk.openadsdk.ycx.sya.zb sya() {
        return this.f25259lt;
    }

    public <T> void ycx(String str, T t6) {
        if (TextUtils.isEmpty(str) || t6 == null) {
            return;
        }
        this.f25258dj.put(str, new ycx<>(t6, str));
    }

    public com.bytedance.sdk.openadsdk.ycx.lud.ycx zb() {
        return this.lud;
    }

    private static String dj(com.bytedance.sdk.openadsdk.core.model.tn tnVar) {
        if (tnVar == null) {
            return null;
        }
        String strAc = tnVar.ac();
        return TextUtils.isEmpty(strAc) ? String.valueOf(tnVar.hashCode()) : strAc;
    }

    public void sya(int i5) {
        this.sya.remove(Integer.valueOf(i5));
    }

    public com.bytedance.sdk.openadsdk.core.model.ycx zb(int i5) {
        return this.sya.remove(Integer.valueOf(i5));
    }

    public void sya(com.bytedance.sdk.openadsdk.core.model.tn tnVar) {
        String strDj = dj(tnVar);
        if (TextUtils.isEmpty(strDj)) {
            return;
        }
        this.fby.remove(strDj);
    }

    public <T> T ycx(String str, Class<T> cls) {
        ycx<?> ycxVar;
        if (TextUtils.isEmpty(str) || cls == null || (ycxVar = this.f25258dj.get(str)) == null || !cls.isInstance(ycxVar.ycx)) {
            return null;
        }
        return cls.cast(ycxVar.ycx);
    }

    public void zb(com.bytedance.sdk.openadsdk.core.model.tn tnVar) {
        zb zbVar;
        if (tnVar == null) {
            return;
        }
        String strDj = dj(tnVar);
        if (TextUtils.isEmpty(strDj) || (zbVar = this.fby.get(strDj)) == null) {
            return;
        }
        zbVar.ycx();
    }

    public ycx<?> ycx(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        return this.f25258dj.remove(str);
    }

    public static av ycx() {
        if (ycx == null) {
            ycx = new av();
        }
        return ycx;
    }

    public com.bytedance.sdk.openadsdk.core.model.tn ycx(int i5) {
        com.bytedance.sdk.openadsdk.core.model.ycx ycxVarRemove = this.sya.remove(Integer.valueOf(i5));
        if (ycxVarRemove != null) {
            return ycxVarRemove.ry();
        }
        return null;
    }

    public int ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar) {
        com.bytedance.sdk.openadsdk.core.model.ycx ycxVar = new com.bytedance.sdk.openadsdk.core.model.ycx();
        ycxVar.zb(tnVar);
        return ycx(ycxVar);
    }

    public void ycx(com.bytedance.sdk.openadsdk.ycx.sya.zb zbVar) {
        this.f25259lt = zbVar;
    }

    public void ycx(com.bytedance.sdk.openadsdk.ycx.lud.ycx ycxVar) {
        this.lud = ycxVar;
    }

    public void ycx(com.bytedance.sdk.openadsdk.ycx.dj.zb zbVar) {
        this.f25260ul = zbVar;
    }

    public int ycx(com.bytedance.sdk.openadsdk.core.model.ycx ycxVar) {
        int iIncrementAndGet = this.f25261zb.incrementAndGet();
        this.sya.put(Integer.valueOf(iIncrementAndGet), ycxVar);
        return iIncrementAndGet;
    }

    public static int ycx(Intent intent) {
        if (intent != null) {
            return intent.getIntExtra("meta_index", -1);
        }
        return -1;
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar, zb zbVar) {
        if (tnVar == null || zbVar == null) {
            return;
        }
        String strDj = dj(tnVar);
        if (TextUtils.isEmpty(strDj)) {
            return;
        }
        this.fby.put(strDj, zbVar);
    }

    public void ycx(String str, boolean z11, boolean z12) {
        boolean z13 = z11 || !z12;
        boolean zWie = jc.zb().wie();
        if (zWie) {
            com.bytedance.sdk.component.utils.htf.ycx("BVA", "cleanListener: isFinish = " + z11 + ",isConfigChange = " + z12);
        }
        if (z13) {
            ycx(str, zWie);
        } else if (z11 || !z12) {
            ycx(str, zWie);
        }
    }

    private void ycx(String str, boolean z11) {
        ycx<?> ycxVarYcx = ycx(str);
        if (z11) {
            if (ycxVarYcx == null) {
                com.bytedance.sdk.component.utils.htf.ycx("BVA", "cleanListener: removeCallback failed,listenerKey=".concat(String.valueOf(str)));
                return;
            }
            StringBuilder sbK = u4.k("cleanListener: removeCallback success,listenerKey=", str, ",callback=");
            sbK.append(ycxVarYcx.ycx);
            com.bytedance.sdk.component.utils.htf.ycx("BVA", sbK.toString());
        }
    }
}
