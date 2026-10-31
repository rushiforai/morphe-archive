package com.facebook.ads.redexgen.X;

import android.os.Handler;

/* renamed from: com.facebook.ads.redexgen.X.pi, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2370pi {
    public static String[] A07 = {"AKWVUs1l0Ice5I6VX", "CXPBWDMo1Zqj2yCW5W30Ut48PEWYgYey", "QYYsUNIn7qky9LY", "uhDWqwwqE26XK4rQkizWNR4dlHqM4UZ3", "ZNpftHLPxc7R9PnANzOwdg7R2ap4pSI6", "3ke", "xa09Mpjas6OdUQMP5Qo7kdS83JfCqy78", "u6CBuCaaqyjpN4LkQhRqLLvzhKEDnG9S"};
    public float A00;
    public float A01;
    public long A02;
    public boolean A03;
    public boolean A04;
    public final Handler A05;
    public final InterfaceC2369ph A06;

    public C2370pi(int i5, float f11, long j11, Handler handler, InterfaceC2369ph interfaceC2369ph) {
        this(i5, interfaceC2369ph, handler);
        this.A02 = j11;
        this.A01 = f11;
    }

    public C2370pi(int i5, InterfaceC2369ph interfaceC2369ph) {
        this(i5, interfaceC2369ph, new Handler());
    }

    public C2370pi(int i5, InterfaceC2369ph interfaceC2369ph, Handler handler) {
        this.A04 = false;
        this.A00 = i5;
        this.A06 = interfaceC2369ph;
        this.A05 = handler;
        this.A02 = 250L;
        this.A01 = 0.25f;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A02() {
        this.A00 -= this.A01;
        this.A06.AGb(this.A00);
        if (this.A00 <= 0.0f) {
            boolean z11 = this.A03;
            if (A07[4].charAt(25) == 'L') {
                throw new RuntimeException();
            }
            A07[6] = "KuCOx1ArmKJG2Js90Y8iwcXaowa3uSzZ";
            if (!z11) {
                this.A03 = true;
                this.A06.AET();
                this.A04 = false;
            }
        }
    }

    public final boolean A04() {
        return this.A00 <= 0.0f;
    }

    public final boolean A05() {
        return this.A04;
    }

    public final boolean A06() {
        if (!A05()) {
            return false;
        }
        this.A04 = false;
        return true;
    }

    public final boolean A07() {
        if (A04() && !this.A03) {
            this.A03 = true;
            this.A06.AET();
        }
        if (!A04() && !A05()) {
            this.A04 = true;
            this.A06.AGb(this.A00);
            this.A05.postDelayed(new GA(this), this.A02);
            return true;
        }
        if (A07[4].charAt(25) == 'L') {
            throw new RuntimeException();
        }
        String[] strArr = A07;
        strArr[3] = "u6tCNg8GXSpiTqjQspDcQdpU9nt4kRaX";
        strArr[7] = "uRN5Zlx2bfjM01c7Y9BPyYrHFfBp2TpI";
        return false;
    }
}
