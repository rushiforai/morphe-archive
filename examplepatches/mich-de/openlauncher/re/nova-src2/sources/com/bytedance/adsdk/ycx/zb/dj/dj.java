package com.bytedance.adsdk.ycx.zb.dj;

import java.util.HashMap;
import java.util.Map;

/* loaded from: classes2.dex */
public enum dj implements lud {
    LEFT_PAREN("("),
    RIGHT_PAREN(")"),
    LEFT_BRACKET("["),
    RIGHT_BRACKET("]"),
    COMMA(",");


    /* renamed from: lt, reason: collision with root package name */
    private static final Map<String, dj> f22797lt;

    /* renamed from: ul, reason: collision with root package name */
    private final String f22799ul;

    static {
        HashMap map = new HashMap(128);
        f22797lt = map;
        for (dj djVar : map.values()) {
            f22797lt.put(djVar.ycx(), djVar);
        }
    }

    dj(String str) {
        this.f22799ul = str;
    }

    public static boolean ycx(lud ludVar) {
        return ludVar instanceof dj;
    }

    public String ycx() {
        return this.f22799ul;
    }
}
