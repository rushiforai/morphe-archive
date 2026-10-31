package com.bytedance.sdk.component.zb.ycx;

import java.nio.charset.Charset;

/* loaded from: classes2.dex */
public final class jw {
    private String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private String f24180zb;

    private jw(String str) {
        this.ycx = str;
    }

    public static jw ycx(String str) {
        return new jw(str);
    }

    public String ycx() {
        return this.ycx;
    }

    public Charset ycx(Charset charset) {
        try {
            String str = this.f24180zb;
            return str != null ? Charset.forName(str) : charset;
        } catch (IllegalArgumentException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VryMV5X4=", "duspnAKIcNeF", "WOYshxC5fQ==", 28);
            return charset;
        }
    }
}
