package com.bytedance.sdk.openadsdk.api.open;

import com.bytedance.sdk.openadsdk.api.PAGRequest;

/* loaded from: classes2.dex */
public class PAGAppOpenRequest extends PAGRequest {
    private int ycx;

    public int getTimeout() {
        return this.ycx;
    }

    public void setTimeout(int i5) {
        this.ycx = i5;
    }
}
