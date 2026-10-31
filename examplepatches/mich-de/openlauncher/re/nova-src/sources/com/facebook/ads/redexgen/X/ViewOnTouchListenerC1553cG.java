package com.facebook.ads.redexgen.X;

import android.view.MotionEvent;
import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.cG, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnTouchListenerC1553cG implements View.OnTouchListener {
    public final /* synthetic */ TextureViewSurfaceTextureListenerC0770Ab A00;

    public ViewOnTouchListenerC1553cG(TextureViewSurfaceTextureListenerC0770Ab textureViewSurfaceTextureListenerC0770Ab) {
        this.A00 = textureViewSurfaceTextureListenerC0770Ab;
    }

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View view, MotionEvent motionEvent) {
        if (!this.A00.A0G && this.A00.A0A != null && motionEvent.getAction() == 1) {
            if (this.A00.A0A.isShowing()) {
                this.A00.A0A.hide();
            } else {
                this.A00.A0A.show();
            }
        }
        return true;
    }
}
