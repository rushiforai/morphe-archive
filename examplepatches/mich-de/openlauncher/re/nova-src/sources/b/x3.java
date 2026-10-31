package b;

import ads_mobile_sdk.au0;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;

/* loaded from: classes2.dex */
public final class x3 extends au0 {
    public x3() {
        super(ads_mobile_sdk.pd.DEFAULT_INSTANCE);
    }

    public final void c(long j11) {
        b();
        ads_mobile_sdk.pd pdVar = (ads_mobile_sdk.pd) this.f1095b;
        pdVar.bitField2_ |= 2048;
        pdVar.timeSinceVpnOnMs_ = j11;
    }

    public final void d(long j11) {
        b();
        ads_mobile_sdk.pd pdVar = (ads_mobile_sdk.pd) this.f1095b;
        pdVar.bitField0_ |= 67108864;
        pdVar.uhSignal_ = j11;
    }

    public final void e(long j11) {
        b();
        ads_mobile_sdk.pd pdVar = (ads_mobile_sdk.pd) this.f1095b;
        pdVar.bitField0_ |= 33554432;
        pdVar.uwSignal_ = j11;
    }

    public final void f(long j11) {
        b();
        ads_mobile_sdk.pd pdVar = (ads_mobile_sdk.pd) this.f1095b;
        pdVar.bitField0_ |= SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING;
        pdVar.vcdSignal_ = j11;
    }

    public final void g(long j11) {
        b();
        ads_mobile_sdk.pd pdVar = (ads_mobile_sdk.pd) this.f1095b;
        pdVar.bitField1_ |= 67108864;
        pdVar.activityIntentSignal_ = j11;
    }

    public final void h(int i5) {
        b();
        ads_mobile_sdk.pd pdVar = (ads_mobile_sdk.pd) this.f1095b;
        pdVar.getClass();
        pdVar.navigationTriggerType_ = c0.F(i5);
        pdVar.bitField2_ |= 16777216;
    }

    public final void i(long j11) {
        b();
        ads_mobile_sdk.pd pdVar = (ads_mobile_sdk.pd) this.f1095b;
        pdVar.bitField1_ |= 134217728;
        pdVar.activityStackSizeSignal_ = j11;
    }

    public final void j(int i5) {
        b();
        ads_mobile_sdk.pd pdVar = (ads_mobile_sdk.pd) this.f1095b;
        pdVar.getClass();
        pdVar.isLauncherSignal_ = a80.m.c(i5);
        pdVar.bitField3_ |= 1024;
    }

    public final void k(long j11) {
        b();
        ads_mobile_sdk.pd pdVar = (ads_mobile_sdk.pd) this.f1095b;
        pdVar.bitField2_ |= androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT;
        pdVar.adeventToVpnOffMs_ = j11;
    }

    public final void m(int i5) {
        b();
        ads_mobile_sdk.pd pdVar = (ads_mobile_sdk.pd) this.f1095b;
        pdVar.getClass();
        pdVar.launcherActivityEnabled_ = a80.m.c(i5);
        pdVar.bitField2_ |= 32;
    }

    public final void n(int i5) {
        b();
        ads_mobile_sdk.pd pdVar = (ads_mobile_sdk.pd) this.f1095b;
        pdVar.getClass();
        pdVar.proxyDetectedSignal_ = a80.m.c(i5);
        pdVar.bitField2_ |= 16;
    }

    public final void o(long j11) {
        b();
        ads_mobile_sdk.pd pdVar = (ads_mobile_sdk.pd) this.f1095b;
        pdVar.bitField0_ |= 4;
        pdVar.atvSignal_ = j11;
    }

    public final void q(long j11) {
        b();
        ads_mobile_sdk.pd pdVar = (ads_mobile_sdk.pd) this.f1095b;
        pdVar.bitField0_ |= 1048576;
        pdVar.jbkSignal_ = j11;
    }

    public final void r(long j11) {
        b();
        ads_mobile_sdk.pd pdVar = (ads_mobile_sdk.pd) this.f1095b;
        pdVar.bitField0_ |= 1024;
        pdVar.netSignal_ = j11;
    }

    public final void t(long j11) {
        b();
        ads_mobile_sdk.pd pdVar = (ads_mobile_sdk.pd) this.f1095b;
        pdVar.bitField0_ |= 2048;
        pdVar.ornSignal_ = j11;
    }

    public final void u(long j11) {
        b();
        ads_mobile_sdk.pd pdVar = (ads_mobile_sdk.pd) this.f1095b;
        pdVar.bitField1_ |= 4194304;
        pdVar.processImportanceSignal_ = j11;
    }

    public final void v(long j11) {
        b();
        ads_mobile_sdk.pd pdVar = (ads_mobile_sdk.pd) this.f1095b;
        pdVar.bitField0_ |= 524288;
        pdVar.psnSignal_ = j11;
    }

    public final void w(long j11) {
        b();
        ads_mobile_sdk.pd pdVar = (ads_mobile_sdk.pd) this.f1095b;
        pdVar.bitField1_ |= 16777216;
        pdVar.recentForegroundTimeSignal_ = j11;
    }

    public final void x(long j11) {
        b();
        ads_mobile_sdk.pd pdVar = (ads_mobile_sdk.pd) this.f1095b;
        pdVar.bitField1_ |= 8388608;
        pdVar.screenStateSignal_ = j11;
    }
}
