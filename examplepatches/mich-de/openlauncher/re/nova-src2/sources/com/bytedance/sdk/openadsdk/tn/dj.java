package com.bytedance.sdk.openadsdk.tn;

import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes2.dex */
public enum dj {
    UTF8(26, "UTF-8");


    /* renamed from: dj, reason: collision with root package name */
    private final int[] f27041dj;
    private final String[] lud;

    /* renamed from: zb, reason: collision with root package name */
    private static final Map<Integer, dj> f27040zb = new HashMap();
    private static final Map<String, dj> sya = new HashMap();

    static {
        for (dj djVar : values()) {
            if (Charset.isSupported(djVar.name())) {
                for (int i5 : djVar.f27041dj) {
                    f27040zb.put(Integer.valueOf(i5), djVar);
                }
                sya.put(djVar.name(), djVar);
                for (String str : djVar.lud) {
                    sya.put(str, djVar);
                }
            }
        }
    }

    dj(int i5, String... strArr) {
        this.f27041dj = new int[]{i5};
        this.lud = strArr;
    }

    public int ycx() {
        return this.f27041dj[0];
    }

    public static dj ycx(Charset charset) {
        return sya.get(charset.name());
    }
}
