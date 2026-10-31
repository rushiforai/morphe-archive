package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.qz, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2449qz implements View.OnClickListener {
    public final /* synthetic */ C1756fZ A00;
    public final /* synthetic */ C2232nO A01;
    public final /* synthetic */ C2450r0 A02;
    public final /* synthetic */ InterfaceC2459r9 A03;
    public final /* synthetic */ String A04;

    public ViewOnClickListenerC2449qz(C2450r0 c2450r0, C2232nO c2232nO, InterfaceC2459r9 interfaceC2459r9, String str, C1756fZ c1756fZ) {
        this.A02 = c2450r0;
        this.A01 = c2232nO;
        this.A03 = interfaceC2459r9;
        this.A04 = str;
        this.A00 = c1756fZ;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A01.A04(EnumC2231nN.A0A, null);
            if (this.A02.A02.A0O(this.A02.A03.A02(), true)) {
                this.A03.ABW(this.A04, this.A00);
            } else if (!TextUtils.isEmpty(this.A00.A00())) {
                C2347pK.A0P(new C2347pK(), this.A02.A03, AbstractC2351pP.A00(this.A00.A00()), this.A04);
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
