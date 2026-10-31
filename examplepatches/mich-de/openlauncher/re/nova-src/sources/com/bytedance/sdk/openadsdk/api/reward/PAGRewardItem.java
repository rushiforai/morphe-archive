package com.bytedance.sdk.openadsdk.api.reward;

/* loaded from: classes2.dex */
public class PAGRewardItem {
    private final int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final String f24681zb;

    public PAGRewardItem(int i5, String str) {
        this.ycx = i5;
        this.f24681zb = str;
    }

    public int getRewardAmount() {
        return this.ycx;
    }

    public String getRewardName() {
        return this.f24681zb;
    }
}
