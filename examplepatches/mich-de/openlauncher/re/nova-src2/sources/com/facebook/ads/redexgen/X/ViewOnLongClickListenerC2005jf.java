package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.jf, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnLongClickListenerC2005jf implements View.OnLongClickListener {
    public final /* synthetic */ IM A00;
    public final /* synthetic */ C2615tf A01;

    public ViewOnLongClickListenerC2005jf(IM im2, C2615tf c2615tf) {
        this.A00 = im2;
        this.A01 = c2615tf;
    }

    @Override // android.view.View.OnLongClickListener
    public final boolean onLongClick(View view) {
        if (this.A00.A00 != null) {
            this.A01.setBounds(0, 0, this.A00.A00.getWidth(), this.A00.A00.getHeight());
            this.A01.A0D(!this.A01.A0E());
        }
        return true;
    }
}
