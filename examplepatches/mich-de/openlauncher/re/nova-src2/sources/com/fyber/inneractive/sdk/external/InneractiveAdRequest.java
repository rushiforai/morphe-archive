package com.fyber.inneractive.sdk.external;

import com.fyber.inneractive.sdk.config.x0;
import com.fyber.inneractive.sdk.flow.v0;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes.dex */
public class InneractiveAdRequest extends v0 {
    public static final double FLOOR_PRICE_MAX_VALUE = 400000.0d;
    public static final double FLOOR_PRICE_MIN_VALUE = 0.0d;

    /* renamed from: c, reason: collision with root package name */
    public final String f27988c;

    /* renamed from: d, reason: collision with root package name */
    public x0 f27989d;

    /* renamed from: e, reason: collision with root package name */
    public Double f27990e;

    public InneractiveAdRequest(String str) {
        this.f27988c = str;
    }

    public Double getFloorPrice() {
        return this.f27990e;
    }

    @Deprecated
    public boolean getMuteVideo() {
        return InneractiveAdManager.getMuteVideo();
    }

    public x0 getSelectedUnitConfig() {
        return this.f27989d;
    }

    public String getSpotId() {
        return this.f27988c;
    }

    @Deprecated
    public InneractiveUserConfig getUserParams() {
        return InneractiveAdManager.getUserParams();
    }

    public void setFloorPrice(double d5) {
        double dMax = Double.isNaN(d5) ? 0.0d : Math.max(0.0d, Math.min(d5, 400000.0d));
        if (dMax != d5) {
            IAlog.f("Invalid floor price: %.2f — adjusted to %.2f.", Double.valueOf(d5), Double.valueOf(dMax));
        }
        this.f27990e = Double.valueOf(dMax);
    }

    @Deprecated
    public void setMuteVideo(boolean z11) {
        InneractiveAdManager.setMuteVideo(z11);
    }

    public void setSelectedUnitConfig(x0 x0Var) {
        this.f27989d = x0Var;
    }

    @Deprecated
    public void setUserParams(InneractiveUserConfig inneractiveUserConfig) {
        InneractiveAdManager.setUserParams(inneractiveUserConfig);
    }
}
