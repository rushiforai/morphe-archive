package com.facebook.ads.redexgen.X;

import java.nio.ByteBuffer;
import java.util.ArrayDeque;
import java.util.Deque;

/* renamed from: com.facebook.ads.redexgen.X.8k, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C8k implements InterfaceC1136Ok {
    public static String[] A05 = {"9PC1SOdKC", "JujpktqcHomT9OGRIZ5G8TpCthxvd1Qa", "wHKReQS5hv3rWAn5ncRFIhUbB7JPry5H", "k4PQCZoMybcCRpzp", "diNQnVr0BOC1wDnr", "lHDFaj", "d3jtA3BgjqCKHrHBSYp4h1mM98iyof6K", "B5nWeWF9T1WrTZZI9Qy5U1qk7pH0rhWW"};
    public int A00;
    public boolean A01;
    public final C1504bT A02 = new C1504bT();
    public final C8B A03 = new C8B();
    public final Deque<C8A> A04 = new ArrayDeque();

    public C8k() {
        for (int i5 = 0; i5 < 2; i5++) {
            this.A04.addFirst(new C8A() { // from class: com.facebook.ads.redexgen.X.4D
                @Override // com.facebook.ads.redexgen.X.C8A, com.facebook.ads.redexgen.X.T1
                public final void A0B() {
                    this.A00.A04(this);
                }
            });
        }
        this.A00 = 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1115Np
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final C8B A6Q() throws C1135Oj {
        AbstractC1062Ln.A08(!this.A01);
        if (this.A00 != 0) {
            return null;
        }
        this.A00 = 1;
        return this.A03;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1115Np
    /* renamed from: A01, reason: merged with bridge method [inline-methods] */
    public final C8A A6S() throws C1135Oj {
        AbstractC1062Ln.A08(!this.A01);
        if (this.A00 != 2) {
            return null;
        }
        boolean zIsEmpty = this.A04.isEmpty();
        String[] strArr = A05;
        if (strArr[1].charAt(2) != strArr[6].charAt(2)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A05;
        strArr2[4] = "culcy4SRS2Utavla";
        strArr2[3] = "oKppDwPHRPwN5DFU";
        if (zIsEmpty) {
            return null;
        }
        C8A c8aRemoveFirst = this.A04.removeFirst();
        if (this.A03.A05()) {
            c8aRemoveFirst.A00(4);
        } else {
            c8aRemoveFirst.A0C(this.A03.A01, new RV(this.A03.A01, this.A02.A02(((ByteBuffer) AbstractC1062Ln.A01(this.A03.A02)).array())), 0L);
        }
        this.A03.A0A();
        this.A00 = 0;
        return c8aRemoveFirst;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1115Np
    /* renamed from: A03, reason: merged with bridge method [inline-methods] */
    public final void AIW(C8B c8b) throws C1135Oj {
        AbstractC1062Ln.A08(!this.A01);
        AbstractC1062Ln.A08(this.A00 == 1);
        AbstractC1062Ln.A07(this.A03 == c8b);
        this.A00 = 2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A04(C8A c8a) {
        AbstractC1062Ln.A08(this.A04.size() < 2);
        AbstractC1062Ln.A07(!this.A04.contains(c8a));
        c8a.A0A();
        this.A04.addFirst(c8a);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1115Np
    public final void AIp() {
        this.A01 = true;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1136Ok
    public final void AKz(long j11) {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1115Np
    public final void flush() {
        AbstractC1062Ln.A08(!this.A01);
        this.A03.A0A();
        this.A00 = 0;
    }
}
