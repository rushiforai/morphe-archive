package com.bytedance.sdk.openadsdk.dj.ycx;

import android.text.TextUtils;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes2.dex */
public class jc {
    public static jc ycx = new jc();

    /* renamed from: dj, reason: collision with root package name */
    private volatile boolean f26717dj;
    private final Map<String, ycx> sya = new HashMap();

    /* renamed from: zb, reason: collision with root package name */
    private ycx f26718zb;

    public static class ycx {
        private final int ycx;

        /* renamed from: zb, reason: collision with root package name */
        private final int f26719zb;

        public ycx(int i5, int i11) {
            this.ycx = (i5 < 0 || i5 > 5) ? 3 : i5;
            this.f26719zb = i11 < 10 ? 30 : i11;
        }

        public int ycx() {
            return this.ycx;
        }

        public int zb() {
            return this.f26719zb;
        }
    }

    private int sya() {
        ycx ycxVar = this.f26718zb;
        if (ycxVar != null) {
            return ycxVar.zb();
        }
        return 30;
    }

    private int zb() {
        ycx ycxVar = this.f26718zb;
        if (ycxVar != null) {
            return ycxVar.ycx();
        }
        return 3;
    }

    public void ycx(ycx ycxVar) {
        this.f26718zb = ycxVar;
    }

    public void ycx(String str, ycx ycxVar) {
        if (TextUtils.isEmpty(str) || ycxVar == null) {
            return;
        }
        this.sya.put(str, ycxVar);
    }

    public int zb(String str) {
        ycx ycxVar = this.sya.get(str);
        if (ycxVar == null) {
            return sya();
        }
        return ycxVar.zb();
    }

    public int ycx(String str) {
        if (!ycx()) {
            return 4;
        }
        ycx ycxVar = this.sya.get(str);
        if (ycxVar == null) {
            return zb();
        }
        return ycxVar.ycx();
    }

    public boolean ycx() {
        return this.f26717dj;
    }

    public void ycx(boolean z11) {
        this.f26717dj = z11;
    }
}
