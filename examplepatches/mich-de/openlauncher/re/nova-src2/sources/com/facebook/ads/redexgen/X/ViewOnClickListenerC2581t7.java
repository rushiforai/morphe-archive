package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.t7, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2581t7 implements View.OnClickListener {
    public static String[] A01 = {"Vv5FfAmJbj1DWBwz1cnmO8YdvjH2dXTg", "Vk", "Og140H81ZKkTdd89dTXnvM5WMiUkVqOU", "l", "ZV8yFvN", "ZLvjXfbhtayfPu5dTUoCC8YBVzcskEH4", "1CU", "7PUp1YoqJXCOaTwE08JWfyRfSPJfIV7z"};
    public final /* synthetic */ F8 A00;

    public ViewOnClickListenerC2581t7(F8 f82) {
        this.A00 = f82;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A08.A0F().AAa();
            if (this.A00.A05 != null) {
                this.A00.A05.AEP();
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
            if (A01[2].charAt(4) != '0') {
                throw new RuntimeException();
            }
            A01[3] = "xjJ2L6BmMYLJnRX";
        }
    }
}
