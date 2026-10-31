package com.bytedance.sdk.openadsdk.api.model;

/* loaded from: classes2.dex */
public class PAGErrorModel {
    private final int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final String f24668zb;

    public PAGErrorModel(int i5, String str) {
        this.ycx = i5;
        this.f24668zb = str;
    }

    public int getErrorCode() {
        return this.ycx;
    }

    public String getErrorMessage() {
        return this.f24668zb;
    }
}
