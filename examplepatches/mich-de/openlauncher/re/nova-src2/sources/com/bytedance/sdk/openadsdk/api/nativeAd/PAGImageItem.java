package com.bytedance.sdk.openadsdk.api.nativeAd;

/* loaded from: classes2.dex */
public class PAGImageItem {

    /* renamed from: dj, reason: collision with root package name */
    private float f24669dj;
    private final String sya;
    private final int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final int f24670zb;

    public PAGImageItem(int i5, int i11, String str, float f11) {
        this.ycx = i5;
        this.f24670zb = i11;
        this.sya = str;
        this.f24669dj = f11;
    }

    public float getDuration() {
        return this.f24669dj;
    }

    public int getHeight() {
        return this.ycx;
    }

    public String getImageUrl() {
        return this.sya;
    }

    public int getWidth() {
        return this.f24670zb;
    }

    public PAGImageItem(int i5, int i11, String str) {
        this(i5, i11, str, 0.0f);
    }
}
