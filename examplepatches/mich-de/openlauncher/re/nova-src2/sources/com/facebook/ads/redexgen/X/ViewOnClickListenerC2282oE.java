package com.facebook.ads.redexgen.X;

import android.view.View;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.oE, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class ViewOnClickListenerC2282oE implements View.OnClickListener {
    public final /* synthetic */ InterfaceC05620n<AnonymousClass22> A00;

    public ViewOnClickListenerC2282oE(InterfaceC05620n<AnonymousClass22> interfaceC05620n) {
        this.A00 = interfaceC05620n;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.AB0();
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
