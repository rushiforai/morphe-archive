package com.bytedance.sdk.component.zb.ycx;

/* loaded from: classes2.dex */
public class ry {

    /* renamed from: dj, reason: collision with root package name */
    public String f24191dj;

    /* renamed from: lt, reason: collision with root package name */
    public ycx f24192lt;
    public byte[] lud;
    public jw sya;

    public enum ycx {
        STRING_TYPE,
        BYTE_ARRAY_TYPE
    }

    public ry() {
    }

    public static ry ycx(jw jwVar, String str) {
        return new ry(jwVar, str, ycx.STRING_TYPE);
    }

    public ry(jw jwVar, String str, ycx ycxVar) {
        this.sya = jwVar;
        this.f24191dj = str;
        this.f24192lt = ycxVar;
    }

    public static ry ycx(jw jwVar, byte[] bArr) {
        return new ry(jwVar, bArr, ycx.BYTE_ARRAY_TYPE);
    }

    public ry(jw jwVar, byte[] bArr, ycx ycxVar) {
        this.sya = jwVar;
        this.lud = bArr;
        this.f24192lt = ycxVar;
    }
}
