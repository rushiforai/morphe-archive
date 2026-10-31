package com.facebook.ads.redexgen.X;

import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.IOException;

/* renamed from: com.facebook.ads.redexgen.X.97, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AnonymousClass97 implements InterfaceC1224Sg, InterfaceC1153Pe {
    public static String[] A0E = {"U7Imei8o4AuFxf2c4RWOjnn4xFyDhyeE", "GQSH8QUBAJRZGyD", "Mwf3HtQh3hUEgZCZCmn77UnrLKGKrjyT", b.f42142b, "SxInJUtUll9gTpwbUal7CE", "jdf5BrpQa10M8xq", "gbBgASlNzcbfWFpsgoVfBXv53dyMmgZ2", "NwniVTDIGWaHvQ2bNmdt1p"};
    public int A00;
    public int A01;
    public long A02;
    public long A04;
    public C1154Ph A05;
    public QD A06;
    public VF A07;
    public boolean A08;
    public boolean A09;
    public VC[] A0A;
    public final int A0C;

    @MetaExoPlayerCustomization
    public EnumC1362Xz A0B = EnumC1362Xz.A09;
    public final C1140Oo A0D = new C1140Oo();
    public long A03 = Long.MIN_VALUE;

    public abstract void A1Z();

    public abstract void A1a(long j11, boolean z11) throws AnonymousClass96;

    public abstract void A1c(VC[] vcArr, long j11, long j12) throws AnonymousClass96;

    public AnonymousClass97(int i5) {
        this.A0C = i5;
    }

    private final int A1O() {
        return this.A00;
    }

    private void A1P(long j11, boolean z11) throws AnonymousClass96 {
        this.A08 = false;
        this.A02 = j11;
        this.A03 = j11;
        A1a(j11, z11);
    }

    public final int A1Q(long j11) {
        return ((VF) AbstractC1062Ln.A01(this.A07)).ALK(j11 - this.A04);
    }

    @MetaExoPlayerCustomization
    public final int A1R(C1140Oo c1140Oo, T2 t22, int i5) {
        int iAIc = ((VF) AbstractC1062Ln.A01(this.A07)).AIc(c1140Oo, t22, i5);
        if (iAIc == -4) {
            if (t22.A05()) {
                this.A03 = Long.MIN_VALUE;
                return this.A08 ? -4 : -3;
            }
            t22.A00 = t22.A01;
            t22.A01 += this.A04;
            this.A03 = Math.max(this.A03, t22.A01);
        } else if (iAIc == -5) {
            VC vc = (VC) AbstractC1062Ln.A01(c1140Oo.A00);
            if (vc.A0M != Long.MAX_VALUE) {
                c1140Oo.A00 = vc.A07().A0s(vc.A0M + this.A04).A14();
            }
        }
        return iAIc;
    }

    public final AnonymousClass96 A1S(Throwable th2, VC vc, int i5) {
        return A1T(th2, vc, false, i5);
    }

    public final AnonymousClass96 A1T(Throwable th2, VC vc, boolean z11, int i5) {
        int iA03 = 4;
        if (vc != null && !this.A09) {
            this.A09 = true;
            try {
                int formatSupport = ALf(vc);
                iA03 = PX.A03(formatSupport);
            } catch (AnonymousClass96 unused) {
            } catch (Throwable th3) {
                this.A09 = false;
                throw th3;
            }
            this.A09 = false;
        }
        String name = getName();
        int iA1O = A1O();
        if (A0E[2].charAt(28) == 'I') {
            throw new RuntimeException();
        }
        A0E[2] = "dElzHzE3fsarjB2Hsty7dzBM9TAWgOKi";
        return AnonymousClass96.A04(th2, name, iA1O, vc, iA03, z11, i5);
    }

    public final C1140Oo A1U() {
        this.A0D.A00();
        return this.A0D;
    }

    public final C1154Ph A1V() {
        return (C1154Ph) AbstractC1062Ln.A01(this.A05);
    }

    public final QD A1W() {
        return (QD) AbstractC1062Ln.A01(this.A06);
    }

    public void A1X() throws AnonymousClass96 {
    }

    public void A1Y() {
    }

    public void A1b(boolean z11, boolean z12) throws AnonymousClass96 {
    }

    public final boolean A1d() {
        return AAT() ? this.A08 : ((VF) AbstractC1062Ln.A01(this.A07)).ABM();
    }

    public final VC[] A1e() {
        return (VC[]) AbstractC1062Ln.A01(this.A0A);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1224Sg
    public final void A6W() {
        AbstractC1062Ln.A08(this.A01 == 1);
        this.A0D.A00();
        this.A01 = 0;
        this.A07 = null;
        this.A0A = null;
        this.A08 = false;
        A1Z();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1224Sg
    public final void A6u(C1154Ph c1154Ph, VC[] vcArr, VF vf2, long j11, boolean z11, boolean z12, long j12, long j13) throws AnonymousClass96 {
        AbstractC1062Ln.A08(this.A01 == 0);
        this.A05 = c1154Ph;
        this.A01 = 1;
        A1b(z11, z12);
        AJs(vcArr, vf2, j12, j13);
        A1P(j11, z11);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1224Sg
    public final InterfaceC1153Pe A7n() {
        return this;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1224Sg
    public InterfaceC1149Ox A95() {
        return null;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1224Sg
    @MetaExoPlayerCustomization
    public final EnumC1362Xz A9m() {
        return this.A0B;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1224Sg
    public final int A9n() {
        return this.A01;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1224Sg
    public final VF A9q() {
        return this.A07;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1224Sg, com.facebook.ads.redexgen.X.InterfaceC1153Pe
    public final int AA0() {
        return this.A0C;
    }

    @Override // com.facebook.ads.redexgen.X.PR
    public void AAM(int i5, Object obj) throws AnonymousClass96 {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1224Sg
    public final boolean AAT() {
        return this.A03 == Long.MIN_VALUE;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1224Sg
    public final void AAn(int i5, QD qd2) {
        this.A00 = i5;
        this.A06 = qd2;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1224Sg
    public final boolean AB5() {
        return this.A08;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1224Sg
    public final void ADL() throws IOException {
        ((VF) AbstractC1062Ln.A01(this.A07)).ADI();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1224Sg
    public final void AJs(VC[] vcArr, VF vf2, long j11, long j12) throws AnonymousClass96 {
        AbstractC1062Ln.A08(!this.A08);
        this.A07 = vf2;
        if (this.A03 == Long.MIN_VALUE) {
            this.A03 = j11;
        }
        this.A0A = vcArr;
        this.A04 = j12;
        A1c(vcArr, j11, j12);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1224Sg
    public final void AK4(long j11) throws AnonymousClass96 {
        A1P(j11, false);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1224Sg
    public final void AKf() {
        this.A08 = true;
    }

    public int ALh() throws AnonymousClass96 {
        return 0;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1224Sg
    public final void start() throws AnonymousClass96 {
        AbstractC1062Ln.A08(this.A01 == 1);
        this.A01 = 2;
        A1X();
        String[] strArr = A0E;
        if (strArr[7].length() != strArr[4].length()) {
            throw new RuntimeException();
        }
        A0E[3] = b.f42142b;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1224Sg
    public final void stop() {
        AbstractC1062Ln.A08(this.A01 == 2);
        this.A01 = 1;
        A1Y();
    }
}
