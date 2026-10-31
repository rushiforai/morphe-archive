package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.fB, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1732fB {
    public static String[] A03 = {"bHomE7q1G0eBeaKIoJPrIksfHa7FAQPj", "aAoyC3N31casDe5Opfg6VTV6wQ0WPjIK", "dZdNkt2a956p4RNcAbY1y682bgovLdfu", "Z9SfkrMJ0ZBu9NTjJ7QMdiSaKHXlH6Q6", "rGuf9Q9wuyXaHdoXGGI23bzmXJjVLmgI", "72X851VHbPh4NsFn7zwrUJmeAvYbcPEI", "NMJFOJwEJm2y", "oAQkjH9bX9ZIDfFAbjsoAa3C0Mzu0mS"};
    public boolean A00;
    public boolean A01;
    public boolean A02;

    public final void A00() {
        this.A00 = false;
        this.A01 = false;
        this.A02 = false;
    }

    public final void A01(int i5, int i11, InterfaceC1640df interfaceC1640df) {
        if (i11 <= 0) {
            return;
        }
        float f11 = i5 / i11;
        if (!this.A00 && f11 >= 0.25f) {
            this.A00 = true;
            interfaceC1640df.A47();
        }
        if (!this.A01 && f11 >= 0.5f) {
            this.A01 = true;
            interfaceC1640df.A48();
        }
        if (this.A02) {
            return;
        }
        if (A03[3].charAt(15) != 'j') {
            throw new RuntimeException();
        }
        String[] strArr = A03;
        strArr[1] = "QHruWkyz2Fwt86QiAAtjzryupp6JKyIh";
        strArr[4] = "Gs1jpWwBz4pfUfVc6Bnm6vC34UFDRGuU";
        if (f11 >= 0.75f) {
            this.A02 = true;
            interfaceC1640df.A49();
        }
    }
}
