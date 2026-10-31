package com.bytedance.sdk.openadsdk.api;

import com.bytedance.sdk.openadsdk.common.ul;

/* loaded from: classes2.dex */
public interface PAGLoadListener<Ad> extends ul {
    void onAdLoaded(Ad ad);

    @Override // com.bytedance.sdk.openadsdk.common.ul
    void onError(int i5, String str);
}
