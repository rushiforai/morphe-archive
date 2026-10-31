package com.bytedance.sdk.openadsdk.xkz;

import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.dj.ry;
import java.util.HashSet;

/* loaded from: classes2.dex */
public class dj {

    /* renamed from: dj, reason: collision with root package name */
    private volatile long f27407dj;
    private final HashSet<String> lud = new HashSet<>();
    private volatile boolean sya;
    private String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private ry f27408zb;

    public dj(ry ryVar) {
        this.f27408zb = ryVar;
    }

    private boolean lud() {
        return this.sya && this.f27407dj != 0 && System.currentTimeMillis() - this.f27407dj <= 5000;
    }

    public boolean dj() {
        return com.bytedance.sdk.openadsdk.utils.zb.dj();
    }

    public void sya() {
        this.ycx = null;
        this.f27407dj = 0L;
        this.sya = false;
        this.lud.clear();
    }

    public void ycx(String str) {
        ry ryVar;
        if (dj() && !TextUtils.isEmpty(str)) {
            if (TextUtils.isEmpty(this.ycx)) {
                this.ycx = str;
            }
            if (sya(str) && !this.lud.contains(str)) {
                this.lud.add(str);
                boolean zZb = zb();
                boolean zLud = lud();
                long jCurrentTimeMillis = zZb ? System.currentTimeMillis() - this.f27407dj : -1L;
                if (zLud || (ryVar = this.f27408zb) == null) {
                    return;
                }
                ryVar.ycx(this.ycx, str, jCurrentTimeMillis);
            }
        }
    }

    public void zb(String str) {
        ry ryVar;
        if (dj() && !TextUtils.isEmpty(str) && sya(str) && !this.lud.contains(str)) {
            this.lud.add(str);
            boolean zZb = zb();
            boolean zLud = lud();
            boolean zDj = dj(str);
            long jCurrentTimeMillis = zZb ? System.currentTimeMillis() - this.f27407dj : -1L;
            if (!zDj || zLud || (ryVar = this.f27408zb) == null) {
                return;
            }
            ryVar.ycx(this.ycx, str, jCurrentTimeMillis);
        }
    }

    private boolean dj(String str) {
        return !TextUtils.equals(this.ycx, str);
    }

    private boolean sya(String str) {
        if (str != null) {
            return str.startsWith("intent://") || str.startsWith("market://") || str.contains("play.google.com/store");
        }
        return false;
    }

    public boolean zb() {
        return this.sya;
    }

    public void ycx() {
        if (dj()) {
            this.f27407dj = System.currentTimeMillis();
            this.sya = true;
        }
    }
}
