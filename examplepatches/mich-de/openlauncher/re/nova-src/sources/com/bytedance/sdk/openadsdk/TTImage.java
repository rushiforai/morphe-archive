package com.bytedance.sdk.openadsdk;

/* loaded from: classes2.dex */
public class TTImage {

    /* renamed from: dj, reason: collision with root package name */
    private double f24273dj;
    private final String sya;
    private final int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final int f24274zb;

    public TTImage(int i5, int i11, String str, double d5) {
        this.ycx = i5;
        this.f24274zb = i11;
        this.sya = str;
        this.f24273dj = d5;
    }

    public double getDuration() {
        return this.f24273dj;
    }

    public int getHeight() {
        return this.ycx;
    }

    public String getImageUrl() {
        return this.sya;
    }

    public int getWidth() {
        return this.f24274zb;
    }

    public boolean isValid() {
        String str;
        return this.ycx > 0 && this.f24274zb > 0 && (str = this.sya) != null && str.length() > 0;
    }

    public TTImage(int i5, int i11, String str) {
        this(i5, i11, str, 0.0d);
    }
}
