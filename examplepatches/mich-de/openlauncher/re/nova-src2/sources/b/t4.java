package b;

import ads_mobile_sdk.jn;

/* loaded from: classes2.dex */
public final class t4 extends c0.g2 {
    public final boolean j() {
        return ((Boolean) a("gads:pc:evict_ad_on_impression", Boolean.FALSE, jn.a$10)).booleanValue();
    }

    public final boolean k() {
        return ((Boolean) a("gads:pc:pause_auto_refresh_on_app_background", Boolean.FALSE, jn.a$10)).booleanValue();
    }
}
