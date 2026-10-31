package com.fyber.inneractive.sdk.config.enums;

import java.util.Locale;

/* loaded from: classes3.dex */
public enum CreativeType {
    PLAYABLE,
    NOT_SET;

    public static CreativeType fromValue(String str) {
        if (str != null && "playable".equals(str.toLowerCase(Locale.US))) {
            return PLAYABLE;
        }
        return NOT_SET;
    }
}
