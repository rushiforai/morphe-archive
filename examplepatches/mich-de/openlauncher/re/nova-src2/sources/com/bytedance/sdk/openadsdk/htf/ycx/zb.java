package com.bytedance.sdk.openadsdk.htf.ycx;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import com.bytedance.sdk.component.utils.dj;
import com.bytedance.sdk.component.utils.htf;

/* loaded from: classes2.dex */
public class zb {

    /* renamed from: dj, reason: collision with root package name */
    private Bitmap f26838dj;
    private Bitmap lud;
    private byte[] sya;
    int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private Drawable f26839zb;

    public zb(Drawable drawable, int i5) {
        this.sya = null;
        this.f26838dj = null;
        this.lud = null;
        this.f26839zb = drawable;
        this.ycx = i5;
    }

    public Drawable dj() {
        return this.f26839zb;
    }

    public boolean lud() {
        if (this.f26838dj != null || this.f26839zb != null) {
            return true;
        }
        byte[] bArr = this.sya;
        return bArr != null && bArr.length > 0;
    }

    public byte[] sya() {
        try {
            if (this.sya == null) {
                this.sya = dj.ycx(this.f26838dj);
            }
        } catch (OutOfMemoryError e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4IUtGZc5ys=", "fOcrpwatfMKTXuVYnwSsPA==", "XOs5txqobPWFWcJRmA==", 70);
            htf.sya("GifRequestResult", e3.getMessage());
        }
        return this.sya;
    }

    public Bitmap ycx() {
        return this.f26838dj;
    }

    public Bitmap zb() {
        return this.lud;
    }

    public zb(byte[] bArr, int i5) {
        this.f26839zb = null;
        this.f26838dj = null;
        this.lud = null;
        this.sya = bArr;
        this.ycx = i5;
    }

    public zb(Bitmap bitmap, Bitmap bitmap2, int i5) {
        this.f26839zb = null;
        this.sya = null;
        this.lud = bitmap2;
        this.f26838dj = bitmap;
        this.ycx = i5;
    }
}
