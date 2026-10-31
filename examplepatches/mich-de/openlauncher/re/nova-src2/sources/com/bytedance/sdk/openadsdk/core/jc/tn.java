package com.bytedance.sdk.openadsdk.core.jc;

import android.os.SystemClock;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
public class tn implements com.bytedance.sdk.openadsdk.core.ry.ul.sya {

    /* renamed from: lt, reason: collision with root package name */
    private String f25489lt;
    private long ycx = 0;

    /* renamed from: zb, reason: collision with root package name */
    private long f25491zb = 0;
    private int sya = 0;

    /* renamed from: dj, reason: collision with root package name */
    private String f25488dj = null;
    private String lud = null;

    /* renamed from: ul, reason: collision with root package name */
    private final AtomicBoolean f25490ul = new AtomicBoolean(false);

    @Override // com.bytedance.sdk.openadsdk.core.ry.ul.sya
    public void ycx(String str) {
        this.f25489lt = str;
        this.ycx = SystemClock.elapsedRealtime();
    }

    @Override // com.bytedance.sdk.openadsdk.core.ry.ul.sya
    public void zb(String str) {
        this.lud = str;
        this.f25491zb = SystemClock.elapsedRealtime();
        this.f25490ul.set(true);
    }

    @Override // com.bytedance.sdk.openadsdk.core.ry.ul.sya
    public void ycx(int i5, String str, String str2) {
        this.sya = i5;
        this.f25488dj = str;
        this.lud = str2;
        this.f25491zb = SystemClock.elapsedRealtime();
        this.f25490ul.set(false);
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar, String str) {
        if (this.f25490ul.get()) {
            com.bytedance.sdk.openadsdk.dj.sya.ycx(tnVar, false, str, "success", this.f25491zb - this.ycx, this.lud, this.f25489lt, 0, null);
        } else {
            com.bytedance.sdk.openadsdk.dj.sya.ycx(tnVar, false, str, "fail", this.f25491zb - this.ycx, this.lud, this.f25489lt, this.sya, this.f25488dj);
        }
    }
}
