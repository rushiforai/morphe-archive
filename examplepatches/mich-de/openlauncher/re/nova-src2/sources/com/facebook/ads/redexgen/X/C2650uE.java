package com.facebook.ads.redexgen.X;

import android.content.res.Configuration;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* renamed from: com.facebook.ads.redexgen.X.uE, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2650uE extends RelativeLayout {
    public static String[] A06 = {"GfXFZtEZk1NZfob7Kzf1xTq0EESlD7si", "ewzI1iE8tF5Z2B86REyPWWZDw7DKLBH9", "kOyZSgqEibXIKTIW7tLvn8rBuxcmsyDd", "XpDxTY", "v6DhXkGtrQWw75h", "XA27k4WXBENWs2k6KViFhCSGxV0pMN8g", "cLUj8uWE8C4NOcjwK2waVMiWyPuWQVsm", b.f42142b};
    public final int A00;
    public final LinearLayout A01;
    public final C1048Kz A02;
    public final C0958Hi A03;
    public final InterfaceC2224nG A04;
    public final InterfaceC2459r9 A05;

    public C2650uE(C0958Hi c0958Hi, C1048Kz c1048Kz, InterfaceC2224nG interfaceC2224nG, InterfaceC2459r9 interfaceC2459r9, int i5, int i11) {
        super(c0958Hi);
        this.A03 = c0958Hi;
        this.A02 = c1048Kz;
        this.A04 = interfaceC2224nG;
        this.A05 = interfaceC2459r9;
        this.A00 = i5;
        this.A01 = new LinearLayout(c0958Hi);
        A00();
        addView(this.A01, new FrameLayout.LayoutParams(-1, -1));
        setLayoutOrientation(i11);
    }

    private void A00() {
        int i5 = 0;
        while (true) {
            C1048Kz c1048Kz = this.A02;
            if (A06[4].length() != 15) {
                throw new RuntimeException();
            }
            String[] strArr = A06;
            strArr[6] = "6kBjYVyQvbEVjVKJKeawSG2VEKMXDcJL";
            strArr[5] = "aQimcOJmMOk7TFcbK4Cqi1kaRliNN4Qj";
            int i11 = c1048Kz.A2v();
            if (i5 < i11) {
                C0890Er c0890Er = new C0890Er(this.A03, this.A02.A2z(i5), this.A04, this.A05);
                LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -1);
                layoutParams.weight = 1.0f;
                int i12 = C0890Er.A0B;
                int i13 = C0890Er.A0B;
                int i14 = C0890Er.A0B;
                int i15 = C0890Er.A0B;
                layoutParams.setMargins(i12, i13, i14, i15);
                c0890Er.setLayoutParams(layoutParams);
                this.A01.addView(c0890Er);
                i5++;
            } else {
                return;
            }
        }
    }

    @Override // android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        setLayoutOrientation(configuration.orientation);
    }

    private void setLayoutOrientation(int i5) {
        if (i5 != 1) {
            this.A01.setOrientation(0);
            this.A01.setPadding(0, this.A00, 0, (int) (this.A00 * 0.25d));
        } else {
            this.A01.setOrientation(1);
            this.A01.setPadding(0, (int) (this.A00 * 1.5d), 0, this.A00);
        }
    }
}
