package com.fyber.inneractive.sdk.flow;

import com.fyber.inneractive.sdk.config.IAConfigManager;

/* loaded from: classes.dex */
public abstract class v0 {

    /* renamed from: a, reason: collision with root package name */
    public boolean f28393a = true;

    /* renamed from: b, reason: collision with root package name */
    public String f28394b;

    public boolean getAllowFullscreen() {
        return this.f28393a;
    }

    public String getMediationName() {
        return IAConfigManager.Q.f27755m;
    }

    public String getMediationVersion() {
        return IAConfigManager.Q.o;
    }
}
