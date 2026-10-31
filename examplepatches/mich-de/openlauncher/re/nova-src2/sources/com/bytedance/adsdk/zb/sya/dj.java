package com.bytedance.adsdk.zb.sya;

import b.c0;
import com.bytedance.adsdk.zb.sya.zb.dy;
import java.util.List;

/* loaded from: classes2.dex */
public class dj {

    /* renamed from: dj, reason: collision with root package name */
    private final double f22942dj;

    /* renamed from: lt, reason: collision with root package name */
    private final String f22943lt;
    private final String lud;
    private final double sya;
    private final List<dy> ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final char f22944zb;

    public dj(List<dy> list, char c11, double d5, double d11, String str, String str2) {
        this.ycx = list;
        this.f22944zb = c11;
        this.sya = d5;
        this.f22942dj = d11;
        this.lud = str;
        this.f22943lt = str2;
    }

    public static int ycx(char c11, String str, String str2) {
        return str2.hashCode() + c0.e(c11 * 31, 31, str);
    }

    public int hashCode() {
        return ycx(this.f22944zb, this.f22943lt, this.lud);
    }

    public double zb() {
        return this.f22942dj;
    }

    public List<dy> ycx() {
        return this.ycx;
    }
}
