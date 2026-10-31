package ads_mobile_sdk;

import android.os.Build;
import b.r2;
import b.t2;
import java.io.InputStream;
import java.util.Collections;
import java.util.Map;
import java.util.Objects;

/* loaded from: classes.dex */
public final class g1 extends cu0 {
    private static final g1 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f3608c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f3609d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f3610e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f3611f = 4;

    /* renamed from: g, reason: collision with root package name */
    public static final int f3612g = 5;

    /* renamed from: h, reason: collision with root package name */
    public static final int f3613h = 6;
    private int androidApiVersion_;
    private int bitField0_;
    private long versionCode_;
    private gn1 pools_ = gn1.f4008b;
    private String packageName_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String deviceModel_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String consentStringHash_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        g1 g1Var = new g1();
        DEFAULT_INSTANCE = g1Var;
        cu0.a(g1.class, g1Var);
    }

    public static g1 q() {
        return DEFAULT_INSTANCE;
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0006\u0000\u0001\u0001\u0006\u0006\u0001\u0000\u0000\u00012\u0002ለ\u0000\u0003ဂ\u0001\u0004ለ\u0002\u0005င\u0003\u0006ለ\u0004", new Object[]{"bitField0_", "pools_", new dn1(ft3.f3519d, ft3.f3521f, vr0.p()), "packageName_", "versionCode_", "deviceModel_", "androidApiVersion_", "consentStringHash_"});
        }
        if (iA == 3) {
            return new g1();
        }
        if (iA != 4) {
            return null;
        }
        return new r2(DEFAULT_INSTANCE);
    }

    public final int o() {
        return this.androidApiVersion_;
    }

    public final String p() {
        return this.consentStringHash_;
    }

    public final String r() {
        return this.deviceModel_;
    }

    public final gn1 s() {
        gn1 gn1Var = this.pools_;
        if (!gn1Var.f4009a) {
            this.pools_ = gn1Var.b();
        }
        return this.pools_;
    }

    public final String t() {
        return this.packageName_;
    }

    public final Map u() {
        return Collections.unmodifiableMap(this.pools_);
    }

    public final long v() {
        return this.versionCode_;
    }

    public final void b(String str) {
        Objects.requireNonNull(str);
        this.bitField0_ |= 16;
        this.consentStringHash_ = str;
    }

    public final void c(String str) {
        String str2 = Build.MODEL;
        Objects.requireNonNull(str2);
        this.bitField0_ |= 4;
        this.deviceModel_ = str2;
    }

    public final void d(String str) {
        this.bitField0_ |= 1;
        this.packageName_ = str;
    }

    public static g1 a(InputStream inputStream) {
        cu0 cu0VarA = cu0.a(DEFAULT_INSTANCE, com.google.crypto.tink.shaded.protobuf.k.a(inputStream), nl0.a());
        cu0.a(cu0VarA);
        return (g1) cu0VarA;
    }
}
