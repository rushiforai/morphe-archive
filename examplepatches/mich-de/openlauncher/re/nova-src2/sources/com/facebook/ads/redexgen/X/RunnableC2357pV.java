package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.pV, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC2357pV implements Runnable {
    public final /* synthetic */ C0957Hh A00;
    public final /* synthetic */ InterfaceC2396q8 A01;
    public final /* synthetic */ String A02;
    public final /* synthetic */ int[] A03;

    public RunnableC2357pV(int[] iArr, String str, C0957Hh c0957Hh, InterfaceC2396q8 interfaceC2396q8) {
        this.A03 = iArr;
        this.A02 = str;
        this.A00 = c0957Hh;
        this.A01 = interfaceC2396q8;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            int[] iArr = this.A03;
            iArr[0] = iArr[0] + 1000;
            if (this.A03[0] > 600000) {
                AbstractC2358pW.A01.removeCallbacks(this);
                AbstractC2358pW.A02.remove(this.A02);
            } else {
                if (AbstractC2358pW.A08(this.A00.getPackageManager(), this.A02)) {
                    AbstractC2358pW.A01.removeCallbacks(this);
                    AbstractC2358pW.A02.remove(this.A02);
                    this.A01.AGB(this.A02);
                    return;
                }
                AbstractC2358pW.A01.postDelayed(this, 1000L);
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
