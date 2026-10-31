package com.bytedance.sdk.openadsdk.api.init;

/* loaded from: classes2.dex */
public class PAGBidError {
    private int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private String f24656zb;

    public PAGBidError(int i5, String str) {
        this.ycx = i5;
        this.f24656zb = str;
    }

    public int getCode() {
        return this.ycx;
    }

    public String getMessage() {
        return this.f24656zb;
    }
}
