package com.bytedance.sdk.openadsdk.dy.ycx;

import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.utils.oby;

/* loaded from: classes2.dex */
public class zb {

    /* renamed from: dj, reason: collision with root package name */
    private int f26823dj;
    private int fby = 0;

    /* renamed from: jw, reason: collision with root package name */
    private int f26824jw = 0;

    /* renamed from: lt, reason: collision with root package name */
    private String f26825lt;
    private boolean lud;
    private String sya;

    /* renamed from: ul, reason: collision with root package name */
    private int f26826ul;
    private String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private tn f26827zb;

    public int dj() {
        return this.f26823dj;
    }

    public int fby() {
        return this.fby;
    }

    public int jw() {
        return this.f26824jw;
    }

    public String lt() {
        return this.f26825lt;
    }

    public boolean lud() {
        return this.lud;
    }

    public String sya() {
        tn tnVar;
        if (TextUtils.isEmpty(this.sya) && (tnVar = this.f26827zb) != null) {
            this.sya = oby.ycx(tnVar);
        }
        return this.sya;
    }

    public int ul() {
        return this.f26826ul;
    }

    public String ycx() {
        return this.ycx;
    }

    public tn zb() {
        return this.f26827zb;
    }

    public void ycx(String str) {
        this.ycx = str;
    }

    public void zb(String str) {
        this.sya = str;
    }

    public void ycx(tn tnVar) {
        this.f26827zb = tnVar;
    }

    public void zb(int i5) {
        this.f26826ul = i5;
    }

    public void ycx(int i5) {
        this.f26823dj = i5;
    }

    public void sya(String str) {
        this.f26825lt = str;
    }

    public void ycx(boolean z11) {
        this.lud = z11;
    }
}
