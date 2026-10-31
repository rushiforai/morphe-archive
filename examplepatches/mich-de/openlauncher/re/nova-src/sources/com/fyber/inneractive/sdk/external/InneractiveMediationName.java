package com.fyber.inneractive.sdk.external;

/* loaded from: classes.dex */
public enum InneractiveMediationName {
    ADMOB(InneractiveMediationNameConsts.ADMOB),
    DFP(InneractiveMediationNameConsts.DFP),
    FYBER(InneractiveMediationNameConsts.FYBER),
    OTHER(InneractiveMediationNameConsts.OTHER);

    final String key;

    InneractiveMediationName(String str) {
        this.key = str;
    }

    public String getKey() {
        return this.key;
    }
}
