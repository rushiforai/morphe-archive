package com.bytedance.sdk.component.lud.zb.sya.ycx.zb;

import android.graphics.Bitmap;
import com.bytedance.sdk.component.lud.wie;

/* loaded from: classes2.dex */
public class ycx implements wie {

    /* renamed from: dj, reason: collision with root package name */
    private com.bytedance.sdk.component.lud.zb.sya.ycx.sya<String, Bitmap> f24036dj;
    private int sya;
    private long ycx = 4194304;

    /* renamed from: zb, reason: collision with root package name */
    private int f24037zb;

    public ycx(int i5, int i11) {
        this.f24037zb = i11;
        this.sya = i5;
        this.f24036dj = new com.bytedance.sdk.component.lud.zb.sya.ycx.sya<>(i11);
    }

    @Override // com.bytedance.sdk.component.lud.ycx
    public boolean zb(String str) {
        try {
            return this.f24036dj.ycx((com.bytedance.sdk.component.lud.zb.sya.ycx.sya<String, Bitmap>) str) != null;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA64pV6AulAC0bImNT9pSngg=", "a+8quRGpSsiVRMN/hQWtKUvNLJYLuQ==", "WOEjgQK1Z9Q=", 65);
            return false;
        }
    }

    @Override // com.bytedance.sdk.component.lud.ycx
    public boolean ycx(String str, Bitmap bitmap) {
        if (str != null && bitmap != null) {
            try {
                int iYcx = ycx(bitmap);
                if (iYcx <= this.ycx && iYcx != 0) {
                    this.f24036dj.ycx(str, bitmap);
                    return true;
                }
                return false;
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA64pV6AulAC0bImNT9pSngg=", "a+8quRGpSsiVRMN/hQWtKUvNLJYLuQ==", "WO8unQY=", 41);
            }
        }
        return false;
    }

    @Override // com.bytedance.sdk.component.lud.ycx
    public Bitmap ycx(String str) {
        try {
            return this.f24036dj.ycx((com.bytedance.sdk.component.lud.zb.sya.ycx.sya<String, Bitmap>) str);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA64pV6AulAC0bImNT9pSngg=", "a+8quRGpSsiVRMN/hQWtKUvNLJYLuQ==", "XOs5", 51);
            return null;
        }
    }

    public static int ycx(Bitmap bitmap) {
        if (bitmap == null) {
            return 0;
        }
        return bitmap.getAllocationByteCount();
    }
}
