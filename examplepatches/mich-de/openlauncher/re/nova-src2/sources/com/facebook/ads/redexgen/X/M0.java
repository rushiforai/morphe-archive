package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.view.View;

/* loaded from: assets/audience_network/classes.dex */
public class M0 implements InterfaceC2761w1 {
    public final /* synthetic */ C07257r A00;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    @Override // com.facebook.ads.redexgen.X.InterfaceC2761w1
    public final void ABV() {
        if (this.A00.A03 == null || this.A00.A03.A35() == null) {
            return;
        }
        String strA00 = this.A00.A03.A35().A00();
        if (TextUtils.isEmpty(strA00)) {
            return;
        }
        C2347pK.A0P(new C2347pK(), this.A00.A04, AbstractC2351pP.A00(strA00), this.A00.A7z());
    }

    public M0(C07257r c07257r) {
        this.A00 = c07257r;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2761w1
    public final void AEo(C6T c6t) {
        new Handler(Looper.getMainLooper()).postDelayed(new M4(this, c6t), 1L);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2761w1
    public final void AF5() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2761w1
    public final void AHL(View view, MotionEvent motionEvent) {
    }
}
