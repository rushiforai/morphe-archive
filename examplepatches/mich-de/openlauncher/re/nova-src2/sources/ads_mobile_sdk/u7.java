package ads_mobile_sdk;

import android.os.Build;
import b.sa;
import b.t2;
import java.util.Objects;

/* loaded from: classes.dex */
public final class u7 extends cu0 {
    private static final u7 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f10218c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f10219d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f10220e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f10221f = 4;

    /* renamed from: g, reason: collision with root package name */
    public static final int f10222g = 5;

    /* renamed from: h, reason: collision with root package name */
    public static final int f10223h = 6;

    /* renamed from: i, reason: collision with root package name */
    public static final int f10224i = 7;

    /* renamed from: j, reason: collision with root package name */
    public static final int f10225j = 8;
    private long apiLevel_;
    private long appVersionCode_;
    private int bitField0_;
    private int hostType_;
    private int osType_;
    private sq vmVersion_ = sq.f9634b;
    private String model_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String appId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String hostVersion_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        u7 u7Var = new u7();
        DEFAULT_INSTANCE = u7Var;
        cu0.a(u7.class, u7Var);
    }

    public static sa o() {
        return (sa) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\b\u0000\u0001\u0001\b\b\u0000\u0000\u0000\u0001ည\u0000\u0002ဂ\u0001\u0003ဈ\u0002\u0004ဈ\u0003\u0005ဂ\u0004\u0006ဈ\u0005\u0007ဌ\u0006\bဌ\u0007", new Object[]{"bitField0_", "vmVersion_", "apiLevel_", "model_", "appId_", "appVersionCode_", "hostVersion_", "osType_", "hostType_"});
        }
        if (iA == 3) {
            return new u7();
        }
        if (iA != 4) {
            return null;
        }
        return new sa(DEFAULT_INSTANCE);
    }

    public final void b(String str) {
        Objects.requireNonNull(str);
        this.bitField0_ |= 8;
        this.appId_ = str;
    }

    public final void c(String str) {
        Objects.requireNonNull(str);
        this.bitField0_ |= 32;
        this.hostVersion_ = str;
    }

    public final void d(String str) {
        String str2 = Build.MODEL;
        Objects.requireNonNull(str2);
        this.bitField0_ |= 4;
        this.model_ = str2;
    }

    public final void a(qq qqVar) {
        Objects.requireNonNull(qqVar);
        this.bitField0_ |= 1;
        this.vmVersion_ = qqVar;
    }
}
