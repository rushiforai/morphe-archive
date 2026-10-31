package com.bytedance.sdk.component.lud.zb.sya.ycx.zb;

import android.graphics.Bitmap;
import com.bytedance.sdk.component.lud.wie;

/* loaded from: classes2.dex */
public class sya implements wie {
    private final wie ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final com.bytedance.sdk.component.lud.zb.sya.ycx.ycx f24035zb;

    public sya(wie wieVar) {
        this(wieVar, null);
    }

    public sya(wie wieVar, com.bytedance.sdk.component.lud.zb.sya.ycx.ycx ycxVar) {
        this.ycx = wieVar;
        this.f24035zb = ycxVar;
    }

    @Override // com.bytedance.sdk.component.lud.ycx
    public boolean zb(String str) {
        return this.ycx.zb(str);
    }

    @Override // com.bytedance.sdk.component.lud.ycx
    public boolean ycx(String str, Bitmap bitmap) {
        return this.ycx.ycx(str, bitmap);
    }

    @Override // com.bytedance.sdk.component.lud.ycx
    public Bitmap ycx(String str) {
        return this.ycx.ycx(str);
    }
}
