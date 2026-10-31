package com.bytedance.adsdk.ugeno.sya;

import a2.c;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public class sya {

    /* renamed from: dj, reason: collision with root package name */
    private int f22501dj;
    private int sya;
    private String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private String f22502zb;

    public sya(String str, String str2, int i5, int i11) {
        this.ycx = str;
        this.f22502zb = str2;
        this.sya = i5;
        this.f22501dj = i11;
    }

    public int dj() {
        return this.f22501dj;
    }

    public int sya() {
        return this.sya;
    }

    public String toString() {
        StringBuilder sb2 = new StringBuilder("FormattedPart{type='");
        sb2.append(this.ycx);
        sb2.append("', value='");
        sb2.append(this.f22502zb);
        sb2.append("', start=");
        sb2.append(this.sya);
        sb2.append(", end=");
        return c.m(sb2, this.f22501dj, AbstractJsonLexerKt.END_OBJ);
    }

    public String ycx() {
        return this.ycx;
    }

    public String zb() {
        return this.f22502zb;
    }

    public void ycx(String str) {
        this.ycx = str;
    }

    public void zb(String str) {
        this.f22502zb = str;
    }

    public void ycx(int i5) {
        this.f22501dj = i5;
    }
}
