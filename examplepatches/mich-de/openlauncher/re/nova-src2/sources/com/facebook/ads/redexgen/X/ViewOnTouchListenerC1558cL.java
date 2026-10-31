package com.facebook.ads.redexgen.X;

import android.view.MotionEvent;
import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.cL, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnTouchListenerC1558cL implements View.OnTouchListener {
    public final /* synthetic */ TextureViewSurfaceTextureListenerC0771Ac A00;

    public ViewOnTouchListenerC1558cL(TextureViewSurfaceTextureListenerC0771Ac textureViewSurfaceTextureListenerC0771Ac) {
        this.A00 = textureViewSurfaceTextureListenerC0771Ac;
    }

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View view, MotionEvent motionEvent) {
        if (this.A00.A09 != null && motionEvent.getAction() == 1) {
            if (this.A00.A09.isShowing()) {
                this.A00.A09.hide();
            } else {
                this.A00.A09.show();
            }
        }
        return true;
    }
}
