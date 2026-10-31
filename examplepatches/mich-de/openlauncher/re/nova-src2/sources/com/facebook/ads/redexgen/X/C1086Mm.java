package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Mm, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1086Mm implements NN {
    public static String[] A08 = {"PPmQFLdbc7Vlo7qleGwmNW1Ez6r2Gc9E", "AjjL0fVeg9JS5", "gXSfPRV6EPfFZVe6rFDJuR6uHnoCEKGv", "bk5YG8xz5DjG7t6ohO8HaEe", "tU0h9SY5BxB6IZeFXbxG", "ngXQIvduBnbEJ5H6hgcgQ2bsSzGu6GFR", "BIrkD39lSVa", "nxRNg1NVc48CdodXdSwWFqBetUAulFto"};
    public int A00;
    public int A01;
    public NK A02;
    public NN A04;
    public InterfaceC1671eB A05;
    public boolean A07;
    public NN A03 = new TA();
    public InterfaceC1680eK A06 = InterfaceC1680eK.A00;

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.NN
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final C07327y A5r() {
        TE teA5r;
        if (this.A04 != null) {
            NN nn2 = this.A04;
            String[] strArr = A08;
            if (strArr[5].charAt(6) != strArr[0].charAt(6)) {
                throw new RuntimeException();
            }
            A08[2] = "CBInl5umrgZZ3FAIIAgqwfju7KbCyNwG";
            teA5r = nn2.A5r();
        } else {
            teA5r = null;
        }
        C07327y c07327yA01 = A01(teA5r, this.A00, this.A01);
        if (A08[7].length() != 32) {
            return c07327yA01;
        }
        String[] strArr2 = A08;
        strArr2[1] = "RjOeKnMek0dl8";
        strArr2[6] = "jyEGoXvnHHA";
        return c07327yA01;
    }

    private C07327y A01(TE te2, int i5, int i11) {
        C1094Mu c1094MuA5q;
        InterfaceC1671eB interfaceC1671eB = (InterfaceC1671eB) AbstractC1062Ln.A01(this.A05);
        if (this.A07 || te2 == null) {
            c1094MuA5q = null;
        } else if (this.A02 != null) {
            c1094MuA5q = this.A02.A5q();
        } else {
            c1094MuA5q = new C1095Mv().A00(interfaceC1671eB).A5q();
        }
        return new C07327y(interfaceC1671eB, te2, this.A03.A5r(), c1094MuA5q, this.A06, i5, null, i11, null);
    }

    public final LS A02() {
        return null;
    }

    public final C1086Mm A03(int i5) {
        this.A00 = i5;
        return this;
    }

    public final C1086Mm A04(NN nn2) {
        this.A03 = nn2;
        return this;
    }

    public final C1086Mm A05(NN nn2) {
        this.A04 = nn2;
        return this;
    }

    public final C1086Mm A06(InterfaceC1671eB interfaceC1671eB) {
        this.A05 = interfaceC1671eB;
        return this;
    }

    public final C07327y A07() {
        return A01(this.A04 != null ? this.A04.A5r() : null, this.A00 | 1, -1000);
    }
}
