package com.bytedance.sdk.openadsdk.api.factory;

import com.bytedance.sdk.openadsdk.api.PAGRequest;
import com.bytedance.sdk.openadsdk.common.ul;

/* loaded from: classes2.dex */
public interface IADLoader<R extends PAGRequest, L extends ul> {
    void loadAd(String str, R r11, L l9);
}
