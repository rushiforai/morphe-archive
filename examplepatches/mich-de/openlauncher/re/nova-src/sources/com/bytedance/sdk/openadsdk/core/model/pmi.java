package com.bytedance.sdk.openadsdk.core.model;

import android.text.TextUtils;

/* loaded from: classes2.dex */
public class pmi {

    /* renamed from: dj, reason: collision with root package name */
    private double f25735dj;

    /* renamed from: lt, reason: collision with root package name */
    private String f25736lt;
    private boolean lud;
    private int sya;
    private String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f25737zb;

    public double dj() {
        return this.f25735dj;
    }

    public boolean lt() {
        return this.lud;
    }

    public boolean lud() {
        return !TextUtils.isEmpty(this.ycx) && this.f25737zb > 0 && this.sya > 0;
    }

    public int sya() {
        return this.sya;
    }

    public String ul() {
        return this.f25736lt;
    }

    public String ycx() {
        return this.ycx;
    }

    public int zb() {
        return this.f25737zb;
    }

    public void ycx(String str) {
        this.ycx = str;
    }

    public void zb(int i5) {
        this.sya = i5;
    }

    public void ycx(int i5) {
        this.f25737zb = i5;
    }

    public void zb(String str) {
        this.f25736lt = str;
    }

    public void ycx(boolean z11) {
        this.lud = z11;
    }
}
