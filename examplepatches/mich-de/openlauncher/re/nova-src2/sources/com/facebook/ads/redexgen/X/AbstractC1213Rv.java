package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.Looper;
import com.facebook.ads.androidx.media3.common.Timeline;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;

/* renamed from: com.facebook.ads.redexgen.X.Rv, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1213Rv implements InterfaceC1276Uj {
    public Looper A00;
    public Timeline A01;
    public QD A02;
    public final ArrayList<InterfaceC1275Ui> A05 = new ArrayList<>(1);
    public final HashSet<InterfaceC1275Ui> A06 = new HashSet<>(1);
    public final C1287Uu A04 = new C1287Uu();
    public final C1207Rp A03 = new C1207Rp();

    public abstract void A09();

    public abstract void A0A(InterfaceC1108Ni interfaceC1108Ni);

    public final QD A00() {
        return (QD) AbstractC1062Ln.A02(this.A02);
    }

    public final C1207Rp A01(C1202Rk c1202Rk) {
        return this.A03.A00(0, c1202Rk);
    }

    public final C1287Uu A02(C1202Rk c1202Rk) {
        return this.A04.A02(0, c1202Rk, 0L);
    }

    public void A03() {
    }

    public void A04() {
    }

    public final void A05(Timeline timeline) {
        this.A01 = timeline;
        Iterator<InterfaceC1275Ui> it = this.A05.iterator();
        while (it.hasNext()) {
            it.next().AH8(this, timeline);
        }
    }

    public final void A06(InterfaceC1275Ui interfaceC1275Ui) {
        boolean z11 = !this.A06.isEmpty();
        this.A06.remove(interfaceC1275Ui);
        if (z11) {
            boolean wasEnabled = this.A06.isEmpty();
            if (wasEnabled) {
                A03();
            }
        }
    }

    public final void A07(InterfaceC1275Ui interfaceC1275Ui) {
        AbstractC1062Ln.A01(this.A00);
        boolean zIsEmpty = this.A06.isEmpty();
        this.A06.add(interfaceC1275Ui);
        if (zIsEmpty) {
            A04();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:6:0x000c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A08(InterfaceC1275Ui interfaceC1275Ui, InterfaceC1108Ni interfaceC1108Ni, QD qd2) {
        boolean z11;
        Looper looperMyLooper = Looper.myLooper();
        Looper looper = this.A00;
        if (looper != null) {
            Looper looper2 = this.A00;
            z11 = looper2 == looperMyLooper;
        }
        AbstractC1062Ln.A07(z11);
        this.A02 = qd2;
        Timeline timeline = this.A01;
        this.A05.add(interfaceC1275Ui);
        Looper looper3 = this.A00;
        if (looper3 == null) {
            this.A00 = looperMyLooper;
            this.A06.add(interfaceC1275Ui);
            A0A(interfaceC1108Ni);
        } else {
            if (timeline == null) {
                return;
            }
            A07(interfaceC1275Ui);
            interfaceC1275Ui.AH8(this, timeline);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1276Uj
    public final void A4P(Handler handler, InterfaceC1288Uv interfaceC1288Uv) {
        AbstractC1062Ln.A01(handler);
        AbstractC1062Ln.A01(interfaceC1288Uv);
        this.A04.A04(handler, interfaceC1288Uv);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1276Uj
    public final void AIK(InterfaceC1275Ui interfaceC1275Ui, InterfaceC1108Ni interfaceC1108Ni) {
        A08(interfaceC1275Ui, interfaceC1108Ni, QD.A03);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1276Uj
    public final void AIz(InterfaceC1275Ui interfaceC1275Ui) {
        this.A05.remove(interfaceC1275Ui);
        if (this.A05.isEmpty()) {
            this.A00 = null;
            this.A01 = null;
            this.A02 = null;
            this.A06.clear();
            A09();
            return;
        }
        A06(interfaceC1275Ui);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1276Uj
    public final void AJj(InterfaceC1288Uv interfaceC1288Uv) {
        this.A04.A0D(interfaceC1288Uv);
    }
}
