package ads_mobile_sdk;

import b.n0;
import b.qd;
import b.t2;
import java.util.Collections;
import java.util.Map;

/* loaded from: classes.dex */
public final class ap extends cu0 {
    private static final ap DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f1046c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f1047d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f1048e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f1049f = 4;

    /* renamed from: g, reason: collision with root package name */
    public static final int f1050g = 5;
    private int bitField0_;
    private boolean shouldCollectSignalsOnFullApp_;
    private boolean shouldGatherSignals_;
    private gn1 serverParameters_ = gn1.f4008b;
    private String adapterClassName_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String platform_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        ap apVar = new ap();
        DEFAULT_INSTANCE = apVar;
        cu0.a(ap.class, apVar);
    }

    public static ap o() {
        return DEFAULT_INSTANCE;
    }

    public static qd s() {
        return (qd) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            n0 n0Var = ft3.f3519d;
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0005\u0000\u0001\u0001\u0005\u0005\u0001\u0000\u0000\u0001ለ\u0000\u0002ဇ\u0001\u0003ဇ\u0002\u0004ለ\u0003\u00052", new Object[]{"bitField0_", "adapterClassName_", "shouldGatherSignals_", "shouldCollectSignalsOnFullApp_", "platform_", "serverParameters_", new dn1(n0Var, n0Var, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b)});
        }
        if (iA == 3) {
            return new ap();
        }
        if (iA != 4) {
            return null;
        }
        return new qd(DEFAULT_INSTANCE);
    }

    public final gn1 p() {
        gn1 gn1Var = this.serverParameters_;
        if (!gn1Var.f4009a) {
            this.serverParameters_ = gn1Var.b();
        }
        return this.serverParameters_;
    }

    public final Map q() {
        return Collections.unmodifiableMap(this.serverParameters_);
    }

    public final boolean r() {
        return this.shouldCollectSignalsOnFullApp_;
    }

    public final void b(String str) {
        this.bitField0_ |= 1;
        this.adapterClassName_ = str;
    }

    public final void c(String str) {
        this.bitField0_ |= 8;
        this.platform_ = str;
    }
}
