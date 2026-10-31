package com.bytedance.sdk.openadsdk.core.model;

import java.util.HashSet;
import java.util.Set;

/* loaded from: classes2.dex */
public class dj {
    private com.bytedance.sdk.openadsdk.core.xkz.dj ycx = new com.bytedance.sdk.openadsdk.core.xkz.dj();

    /* renamed from: zb, reason: collision with root package name */
    private Set<com.bytedance.sdk.openadsdk.core.xkz.jc> f25613zb = new HashSet();

    public com.bytedance.sdk.openadsdk.core.xkz.dj ycx() {
        return this.ycx;
    }

    public Set<com.bytedance.sdk.openadsdk.core.xkz.jc> zb() {
        return this.f25613zb;
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.xkz.dj djVar) {
        if (djVar == null) {
            djVar = new com.bytedance.sdk.openadsdk.core.xkz.dj();
        }
        this.ycx = djVar;
    }

    public void zb(Set<com.bytedance.sdk.openadsdk.core.xkz.jc> set) {
        if (set == null || set.isEmpty()) {
            return;
        }
        this.f25613zb.addAll(set);
    }

    public void ycx(Set<com.bytedance.sdk.openadsdk.core.xkz.jc> set) {
        this.f25613zb = set;
    }

    public void ycx(tn tnVar) {
        com.bytedance.sdk.openadsdk.core.xkz.dj djVar = this.ycx;
        if (djVar != null) {
            djVar.ycx(tnVar);
        }
    }
}
