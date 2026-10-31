package com.facebook.ads.redexgen.X;

import android.net.Uri;
import java.io.IOException;
import java.util.Map;

/* loaded from: assets/audience_network/classes.dex */
public final class OO implements InterfaceC1383Yv {
    public static String[] A03 = {"p1adl8IUa2eu0dGTxXaFBoizQYd7cPnt", "diieC9oxRTogf9RAHnBNHRXejOvyxJpx", "kkGExPJisKikUUo7ZDcfbH9eFAUyqfDV", "2geYVKGa9pxxi", "e3gpZ7RPdMBGV", "CWc2mkArbCBB2hcEx2xbuCazULuXgshm", "ST", "5pjvfoGpqYOAvBfOrVKaLDy7mxDFLaNl"};
    public static final InterfaceC1387Yz A04 = new InterfaceC1387Yz() { // from class: com.facebook.ads.redexgen.X.OP
        @Override // com.facebook.ads.redexgen.X.InterfaceC1387Yz
        public final InterfaceC1383Yv[] A5w() {
            return OO.A00();
        }

        @Override // com.facebook.ads.redexgen.X.InterfaceC1387Yz
        public final /* synthetic */ InterfaceC1383Yv[] A5x(Uri uri, Map map) {
            return AbstractC1386Yy.A01(this, uri, map);
        }
    };
    public boolean A00;
    public final ON A02 = new ON();
    public final C1084Mk A01 = new C1084Mk(2786);

    public static /* synthetic */ InterfaceC1383Yv[] A00() {
        return new InterfaceC1383Yv[]{new OO()};
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AAq(InterfaceC1384Yw interfaceC1384Yw) {
        this.A02.A6B(interfaceC1384Yw, new C1601d2(0, 1));
        interfaceC1384Yw.A6x();
        interfaceC1384Yw.AKP(new Q4(-9223372036854775807L));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final int AIY(Q9 q92, ZH zh2) throws IOException {
        int i5 = q92.read(this.A01.A0l(), 0, 2786);
        if (i5 == -1) {
            return -1;
        }
        this.A01.A0f(0);
        this.A01.A0e(i5);
        if (!this.A00) {
            this.A02.AI3(0L, 4);
            this.A00 = true;
        }
        this.A02.A5j(this.A01);
        return 0;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AIp() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AKO(long j11, long j12) {
        this.A00 = false;
        this.A02.AKN();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final boolean ALN(Q9 q92) throws IOException {
        C1084Mk c1084Mk = new C1084Mk(10);
        int length = 0;
        while (true) {
            q92.AI6(c1084Mk.A0l(), 0, 10);
            c1084Mk.A0f(0);
            if (c1084Mk.A0K() != 4801587) {
                break;
            }
            c1084Mk.A0g(3);
            int iA0H = c1084Mk.A0H();
            length += iA0H + 10;
            q92.A4X(iA0H);
        }
        q92.AK3();
        q92.A4X(length);
        int i5 = length;
        int syncBytes = 0;
        while (true) {
            q92.AI6(c1084Mk.A0l(), 0, 6);
            c1084Mk.A0f(0);
            int iA0M = c1084Mk.A0M();
            int headerPosition = A03[6].length();
            if (headerPosition == 14) {
                throw new RuntimeException();
            }
            String[] strArr = A03;
            strArr[3] = "NUA0WGqxCkDWZ";
            strArr[4] = "likpFnC3j04t3";
            if (iA0M != 2935) {
                syncBytes = 0;
                q92.AK3();
                i5++;
                int headerPosition2 = i5 - length;
                if (headerPosition2 >= 8192) {
                    return false;
                }
                q92.A4X(i5);
            } else {
                syncBytes++;
                if (syncBytes >= 4) {
                    return true;
                }
                int headerPosition3 = AbstractC1366Yd.A05(c1084Mk.A0l());
                if (headerPosition3 == -1) {
                    return false;
                }
                q92.A4X(headerPosition3 - 6);
            }
        }
    }
}
