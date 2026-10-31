package com.bytedance.sdk.openadsdk.wwx;

/* loaded from: classes2.dex */
public enum dj {
    TYPE_2G("2g"),
    TYPE_3G("3g"),
    TYPE_4G("4g"),
    TYPE_5G("5g"),
    TYPE_WIFI("wifi"),
    TYPE_MOBILE("mobile"),
    TYPE_UNKNOWN("unknown");

    private String fby;

    dj(String str) {
        this.fby = str;
    }

    @Override // java.lang.Enum
    public String toString() {
        return this.fby;
    }
}
