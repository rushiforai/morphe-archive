package com.bytedance.sdk.openadsdk.api;

import android.os.Bundle;
import java.util.Map;

/* loaded from: classes2.dex */
public class PAGRequest {
    private Bundle sya = null;
    private String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private Map<String, Object> f24652zb;

    public final void addNetworkExtrasBundle(Class<?> cls, Bundle bundle) {
        if (this.sya == null) {
            this.sya = new Bundle();
        }
        this.sya.putBundle(cls.getName(), bundle);
    }

    public String getAdString() {
        return this.ycx;
    }

    public Map<String, Object> getExtraInfo() {
        return this.f24652zb;
    }

    public Bundle getNetworkExtrasBundle() {
        return this.sya;
    }

    public void setAdString(String str) {
        this.ycx = str;
    }

    public void setExtraInfo(Map<String, Object> map) {
        this.f24652zb = map;
    }
}
