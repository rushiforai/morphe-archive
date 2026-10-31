package com.facebook.ads.redexgen.X;

import android.view.MotionEvent;
import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.v4, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnTouchListenerC2702v4 implements View.OnTouchListener {
    public final /* synthetic */ ET A00;

    public ViewOnTouchListenerC2702v4(ET et2) {
        this.A00 = et2;
    }

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View view, MotionEvent motionEvent) {
        int action = motionEvent.getActionMasked();
        switch (action) {
            case 0:
                this.A00.A00 = motionEvent.getY();
                break;
            case 1:
                float browserFinalY = motionEvent.getY();
                if (this.A00.A00 < browserFinalY) {
                    this.A00.A0i(false);
                    break;
                }
                break;
        }
        return true;
    }
}
