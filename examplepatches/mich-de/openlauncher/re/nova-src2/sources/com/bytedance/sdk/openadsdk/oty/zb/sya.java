package com.bytedance.sdk.openadsdk.oty.zb;

import android.view.View;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.oty.zb.lud;
import java.lang.ref.WeakReference;

/* loaded from: classes2.dex */
public class sya extends zb {

    /* renamed from: dj, reason: collision with root package name */
    private int f26958dj;

    public sya(Integer num, View view, tn tnVar, lud.ycx ycxVar) {
        super(num, view, tnVar, 1000, ycxVar);
        this.f26958dj = -1;
        zb(view);
    }

    @Override // com.bytedance.sdk.openadsdk.oty.zb.zb
    public void dj() {
        super.dj();
    }

    @Override // com.bytedance.sdk.openadsdk.oty.zb.zb
    public int lt() {
        tn tnVar = this.f26965zb;
        return (tnVar != null && tnVar.xym() && this.f26965zb.an() == 1) ? 1000 : 100;
    }

    @Override // com.bytedance.sdk.openadsdk.oty.zb.zb
    public boolean sya() {
        WeakReference<View> weakReference = this.ycx;
        if (weakReference == null || weakReference.get() == null) {
            return false;
        }
        View view = this.ycx.get();
        if (this.f26958dj == -1) {
            zb(view);
        }
        return lt.ycx(view, this.f26958dj == 1, this.f26965zb.tz());
    }

    @Override // com.bytedance.sdk.openadsdk.oty.zb.zb
    public void zb(int i5) {
    }

    private void zb(View view) {
        if (view != null) {
            int width = view.getWidth();
            int height = view.getHeight();
            if (width <= 0 || height <= 0) {
                return;
            }
            this.f26958dj = width * height >= 242500 ? 1 : 0;
        }
    }
}
