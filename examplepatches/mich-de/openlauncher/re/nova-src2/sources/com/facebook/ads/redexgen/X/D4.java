package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public class D4 implements InterfaceC2511rz {
    public static byte[] A02;
    public static String[] A03 = {"d87ZlIF9hICjjvvmEhth2xU6osJ9G", "AvbzD", "FRSrsiOwMTtRoL0SBSrdk1NjL7kfv5d7", "pbZc1uy81WgsMwQOTCHi5qBICaz1gvqj", "4loT0XhvyWfo", "sxaln9AtEcky", "FoJPWMvyCdHIb0u0Ts69xOD", "Tvu3xZOYQyOOmxuOgKZy"};
    public final /* synthetic */ int A00;
    public final /* synthetic */ D2 A01;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 74);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{5, 18, 25, 19, 18, 5, 87, 25, 18, 15, 3, 87, 22, 19, 0, 23, 5, 19, 0, 22, 82, 21, 0, 19, 28, 6, 82, 19, 28, 22, 82, 17, 30, 29, 1, 23, 82, 19, 22, 82, 73, 78, 86, 1, 68, 79, 69, 1, 66, 64, 83, 69};
    }

    static {
        A01();
    }

    public D4(D2 d22, int i5) {
        this.A01 = d22;
        this.A00 = i5;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2511rz
    public final void ADH() {
        this.A01.A0G();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2511rz
    public final void AE6() {
        this.A01.A0X(false, this.A00);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2511rz
    public final void AEd(int i5) {
        D2.A03(this.A01, i5);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2511rz
    public final void AEz(float f11) {
        if (!this.A01.A08) {
            this.A01.A0L(f11);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2511rz
    public final void AH3(boolean z11) {
        this.A01.A0W(z11);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2511rz
    public final void AHT() {
        this.A01.setUnskippableSecondsComplete(true);
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x00b1, code lost:
    
        if (r5.A00 < r6.A01.A0A.A2v()) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x00b3, code lost:
    
        r6.A01.A0D.A0F().AC5(A00(0, 14, 61));
        r6.A01.A0X(false, r6.A00);
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x00e6, code lost:
    
        if (r5.A00 < r6.A01.A0A.A2v()) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x00e9, code lost:
    
        r6.A01.A0D.A0F().AC5(A00(14, 25, 56));
        r6.A01.A0M(1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:?, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:?, code lost:
    
        return;
     */
    @Override // com.facebook.ads.redexgen.X.InterfaceC2511rz
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void AHa(String str) {
        this.A01.A0D.A0F().A3x(str, this.A01.A0A.A2z(this.A01.A00 - 1).A32().A0I().A09());
        if (!this.A01.A0A.A36()) {
            if (this.A01.A0A.A3A() && this.A01.A00 < this.A01.A0A.A2v()) {
                this.A01.A0D.A0F().ACs();
                this.A01.A0X(false, this.A00);
                return;
            } else {
                this.A01.A0I.A5C(this.A01.A0J.A8c());
                this.A01.A0M(3);
                return;
            }
        }
        if (this.A01.A04 != null && this.A01.A04.A1o()) {
            D2 d22 = this.A01;
            if (A03[3].charAt(30) == 'c') {
                throw new RuntimeException();
            }
            A03[7] = "q0MtYxOUTCdLtjeZcM6q";
            d22.A0D.A0F().AC5(A00(39, 13, 107));
            this.A01.A09 = true;
            this.A01.A04.A1g();
            return;
        }
        D2 d23 = this.A01;
        String[] strArr = A03;
        if (strArr[6].length() != strArr[1].length()) {
            A03[2] = "tTfOm1jQOkQN1c4GOLlUM92ibhlV39AJ";
        } else {
            A03[0] = "3ZS21jaPOiosINYmreYylXmQNt0f";
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2511rz
    public final void ALw() {
        this.A01.setUnskippableSecondsComplete(false);
        this.A01.A0H.setProgressImmediate(0.0f);
        this.A01.A0H.setToolbarActionMode(2);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2511rz
    public final void ALx(float f11) {
        this.A01.A0H.setProgress(100.0f * f11);
    }
}
