package com.facebook.ads.redexgen.X;

import android.graphics.Bitmap;
import android.widget.RelativeLayout;
import kotlin.Metadata;

@Metadata
/* loaded from: assets/audience_network/classes.dex */
public final class EQ implements InterfaceC2617th {
    public static String[] A08 = {"G5LN0UEHmVw7cg4EHOOVN4ppGEpBF", "0neX0Ljk", "bd", "LYze5M3cG57O5gV22oM2IqEs762zlKKU", "9Z9gV", "P2J", "ecaEBrC7nvRnmKrfh8aOzpk3jWUcd", "9ureXYA6wzuv9DJNS3PYJnsVckD2lwT8"};
    public final /* synthetic */ int A00;
    public final /* synthetic */ int A01;
    public final /* synthetic */ RelativeLayout A02;
    public final /* synthetic */ ViewOnClickListenerC0884El A03;
    public final /* synthetic */ C2661uP A04;
    public final /* synthetic */ C2661uP A05;
    public final /* synthetic */ C2728vU A06;
    public final /* synthetic */ C1g A07;

    public EQ(C2728vU c2728vU, int i5, C1g c1g, RelativeLayout relativeLayout, int i11, ViewOnClickListenerC0884El viewOnClickListenerC0884El, C2661uP c2661uP, C2661uP c2661uP2) {
        this.A06 = c2728vU;
        this.A01 = i5;
        this.A07 = c1g;
        this.A02 = relativeLayout;
        this.A00 = i11;
        this.A03 = viewOnClickListenerC0884El;
        this.A04 = c2661uP;
        this.A05 = c2661uP2;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2617th
    public final void AFA(C2616tg c2616tg) {
        EnumC2722vO enumC2722vO;
        if (this.A06.A01 != this.A01 || this.A07.A00) {
            return;
        }
        C1g c1g = this.A07;
        String[] strArr = A08;
        if (strArr[6].length() == strArr[0].length()) {
            String[] strArr2 = A08;
            strArr2[6] = "Dq6RMAXjYHdYbhvu0Zsld5trmR6Ww";
            strArr2[0] = "6Act5j5il2Rw5u9sEbbZJO2Go9ng6";
            c1g.A00 = true;
            Bitmap bitmap = c2616tg.A00();
            if (bitmap != null && bitmap.getWidth() > bitmap.getHeight()) {
                enumC2722vO = EnumC2722vO.A04;
            } else {
                enumC2722vO = EnumC2722vO.A06;
                String[] strArr3 = A08;
                if (strArr3[3].charAt(28) == strArr3[7].charAt(28)) {
                    String[] strArr4 = A08;
                    strArr4[1] = "IMRT7sFf";
                    strArr4[4] = "JgDiQ";
                }
            }
            this.A06.A0G(this.A02, this.A00, this.A03, enumC2722vO, this.A04, this.A05);
            return;
        }
        throw new RuntimeException();
    }
}
