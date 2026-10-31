package com.facebook.ads.redexgen.X;

import android.view.View;
import android.widget.RelativeLayout;
import javax.annotation.Nullable;

/* renamed from: com.facebook.ads.redexgen.X.jo, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class ViewOnLongClickListenerC2014jo implements View.OnLongClickListener {

    @Nullable
    public final RelativeLayout A00;

    @Nullable
    public final C2615tf A01;

    public ViewOnLongClickListenerC2014jo(C2615tf c2615tf, RelativeLayout relativeLayout) {
        this.A01 = c2615tf;
        this.A00 = relativeLayout;
    }

    @Override // android.view.View.OnLongClickListener
    public final boolean onLongClick(View view) {
        if (this.A01 != null && this.A00 != null) {
            this.A01.setBounds(0, 0, this.A00.getWidth(), this.A00.getHeight());
            this.A01.A0D(!this.A01.A0E());
        }
        return true;
    }
}
