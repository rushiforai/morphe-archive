package com.bytedance.adsdk.ycx.zb.ycx;

import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public class ycx {
    private String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private Object[] f22825zb;

    public String toString() {
        return "MethodResult{methodName='" + this.ycx + "', args=" + Arrays.toString(this.f22825zb) + AbstractJsonLexerKt.END_OBJ;
    }

    public String ycx() {
        return this.ycx;
    }

    public Object[] zb() {
        return this.f22825zb;
    }

    public void ycx(String str) {
        this.ycx = str;
    }

    public void ycx(Object[] objArr) {
        this.f22825zb = objArr;
    }
}
