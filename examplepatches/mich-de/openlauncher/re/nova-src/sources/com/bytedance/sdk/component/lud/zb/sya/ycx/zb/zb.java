package com.bytedance.sdk.component.lud.zb.sya.ycx.zb;

import com.bytedance.sdk.component.lud.pmi;

/* loaded from: classes2.dex */
public class zb implements pmi {

    /* renamed from: dj, reason: collision with root package name */
    private com.bytedance.sdk.component.lud.zb.sya.ycx.sya<String, byte[]> f24038dj;
    private int sya;
    private long ycx = 1048576;

    /* renamed from: zb, reason: collision with root package name */
    private int f24039zb;

    public zb(int i5, int i11) {
        this.sya = i5;
        this.f24039zb = i11;
        this.f24038dj = new com.bytedance.sdk.component.lud.zb.sya.ycx.sya<>(i11);
    }

    @Override // com.bytedance.sdk.component.lud.ycx
    public boolean zb(String str) {
        try {
            return this.f24038dj.ycx((com.bytedance.sdk.component.lud.zb.sya.ycx.sya<String, byte[]>) str) != null;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA64pV6AulAC0bImNT9pSngg=", "a+8quRGpSsiVRMNvjQaDKVjmKA==", "WOEjgQK1Z9Q=", 63);
            return false;
        }
    }

    @Override // com.bytedance.sdk.component.lud.ycx
    public boolean ycx(String str, byte[] bArr) {
        if (str != null && bArr != null) {
            try {
                if (bArr.length > this.ycx) {
                    return false;
                }
                this.f24038dj.ycx(str, bArr);
                return true;
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA64pV6AulAC0bImNT9pSngg=", "a+8quRGpSsiVRMNvjQaDKVjmKA==", "WO8unQY=", 39);
            }
        }
        return false;
    }

    @Override // com.bytedance.sdk.component.lud.ycx
    public byte[] ycx(String str) {
        try {
            return this.f24038dj.ycx((com.bytedance.sdk.component.lud.zb.sya.ycx.sya<String, byte[]>) str);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA64pV6AulAC0bImNT9pSngg=", "a+8quRGpSsiVRMNvjQaDKVjmKA==", "XOs5", 49);
            return null;
        }
    }
}
