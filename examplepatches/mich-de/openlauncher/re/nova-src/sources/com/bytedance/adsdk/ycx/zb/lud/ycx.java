package com.bytedance.adsdk.ycx.zb.lud;

/* loaded from: classes2.dex */
public class ycx {
    public static boolean dj(char c11) {
        return '+' == c11 || '-' == c11 || '*' == c11 || '/' == c11 || '%' == c11 || '=' == c11 || '>' == c11 || '<' == c11 || '!' == c11 || '&' == c11 || '|' == c11 || '?' == c11 || ':' == c11;
    }

    public static boolean sya(char c11) {
        return c11 >= '0' && c11 <= '9';
    }

    public static boolean ycx(char c11) {
        return c11 == ' ';
    }

    public static boolean zb(char c11) {
        if (c11 < 'A' || c11 > 'Z') {
            return c11 >= 'a' && c11 <= 'z';
        }
        return true;
    }
}
