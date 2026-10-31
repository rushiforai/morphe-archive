package com.bytedance.sdk.openadsdk.tn;

import java.nio.charset.Charset;
import java.nio.charset.UnsupportedCharsetException;

/* loaded from: classes2.dex */
public final class pmi {
    public static final Charset ycx;

    /* renamed from: zb, reason: collision with root package name */
    public static final Charset f27058zb;

    static {
        Charset charsetForName;
        Charset charsetForName2 = null;
        try {
            charsetForName = Charset.forName("SJIS");
        } catch (UnsupportedCharsetException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE50Doydf6w==", "aPo/nA27XNOJRsQ=", "B+0hnA21fZk=", 35);
            charsetForName = null;
        }
        ycx = charsetForName;
        try {
            charsetForName2 = Charset.forName("GB2312");
        } catch (UnsupportedCharsetException e11) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE50Doydf6w==", "aPo/nA27XNOJRsQ=", "B+0hnA21fZk=", 46);
        }
        f27058zb = charsetForName2;
    }
}
