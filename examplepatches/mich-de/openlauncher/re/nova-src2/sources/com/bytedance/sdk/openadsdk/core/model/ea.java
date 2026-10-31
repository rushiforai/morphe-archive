package com.bytedance.sdk.openadsdk.core.model;

import a2.c;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public class ea {
    public boolean ycx = true;

    /* renamed from: zb, reason: collision with root package name */
    public boolean f25638zb = true;
    public boolean sya = true;

    /* renamed from: dj, reason: collision with root package name */
    public boolean f25636dj = true;
    public boolean lud = true;

    /* renamed from: lt, reason: collision with root package name */
    public boolean f25637lt = true;

    public String toString() {
        StringBuilder sb2 = new StringBuilder("ClickArea{clickUpperContentArea=");
        sb2.append(this.ycx);
        sb2.append(", clickUpperNonContentArea=");
        sb2.append(this.f25638zb);
        sb2.append(", clickLowerContentArea=");
        sb2.append(this.sya);
        sb2.append(", clickLowerNonContentArea=");
        sb2.append(this.f25636dj);
        sb2.append(", clickButtonArea=");
        sb2.append(this.lud);
        sb2.append(", clickVideoArea=");
        return c.p(sb2, this.f25637lt, AbstractJsonLexerKt.END_OBJ);
    }
}
