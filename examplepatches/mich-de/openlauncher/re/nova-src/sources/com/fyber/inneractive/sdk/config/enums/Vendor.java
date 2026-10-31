package com.fyber.inneractive.sdk.config.enums;

import android.text.TextUtils;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes3.dex */
public enum Vendor {
    MOAT("moat");

    private static final Map<String, Vendor> CONSTANTS = new HashMap();
    private final String value;

    static {
        for (Vendor vendor : values()) {
            CONSTANTS.put(vendor.value, vendor);
        }
    }

    Vendor(String str) {
        this.value = str;
    }

    public static Vendor fromValue(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        return CONSTANTS.get(str);
    }

    @Override // java.lang.Enum
    public String toString() {
        return this.value;
    }

    public String value() {
        return this.value;
    }
}
