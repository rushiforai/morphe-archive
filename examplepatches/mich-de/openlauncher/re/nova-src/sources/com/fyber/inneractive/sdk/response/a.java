package com.fyber.inneractive.sdk.response;

/* loaded from: classes.dex */
public enum a {
    RETURNED_ADTYPE_HTML(4),
    RETURNED_ADTYPE_MRAID(6),
    RETURNED_ADTYPE_VAST(8),
    RETURNED_ADTYPE_HTML5_VIDEO(9),
    RETURNED_ADTYPE_NATIVE(10),
    RETURNED_ADTYPE_PMN(11),
    RETURNED_ADTYPE_MOBILE_ADS(15);

    private int value;

    a(int i5) {
        this.value = i5;
    }

    public static a a(int i5) {
        for (a aVar : values()) {
            if (aVar.value == i5) {
                return aVar;
            }
        }
        return null;
    }
}
