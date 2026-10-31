package r90;

import com.google.protobuf.g0;
import com.google.protobuf.l;
import com.google.protobuf.m0;
import com.google.protobuf.n0;
import com.google.protobuf.p1;
import com.google.protobuf.v1;

/* loaded from: classes5.dex */
public final class a extends n0 implements p1 {
    public static final int APPLY_EVEN_IF_CRONET_TELEMETRY_DISABLED_FIELD_NUMBER = 8;
    public static final int APP_ID_FIELD_NUMBER = 1;
    public static final int BOOL_VALUE_FIELD_NUMBER = 3;
    public static final int BYTES_VALUE_FIELD_NUMBER = 7;
    private static final a DEFAULT_INSTANCE;
    public static final int FLOAT_VALUE_FIELD_NUMBER = 5;
    public static final int INT_VALUE_FIELD_NUMBER = 4;
    public static final int MIN_VERSION_FIELD_NUMBER = 2;
    private static volatile v1 PARSER = null;
    public static final int STRING_VALUE_FIELD_NUMBER = 6;
    private boolean applyEvenIfCronetTelemetryDisabled_;
    private int bitField0_;
    private Object value_;
    private int valueCase_ = 0;
    private String appId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String minVersion_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        a aVar = new a();
        DEFAULT_INSTANCE = aVar;
        n0.registerDefaultInstance(a.class, aVar);
    }

    @Override // com.google.protobuf.n0
    public final Object dynamicMethod(m0 m0Var, Object obj, Object obj2) {
        v1 g0Var;
        switch (m0Var.ordinal()) {
            case 0:
                return (byte) 1;
            case 1:
                return null;
            case 2:
                return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0001\b\u0001\u0001\u0001\b\b\u0000\u0000\u0000\u0001ဈ\u0000\u0002ဈ\u0001\u0003:\u0000\u00045\u0000\u00054\u0000\u0006;\u0000\u0007=\u0000\bဇ\u0002", new Object[]{"value_", "valueCase_", "bitField0_", "appId_", "minVersion_", "applyEvenIfCronetTelemetryDisabled_"});
            case 3:
                return new a();
            case 4:
                return new da.a(DEFAULT_INSTANCE);
            case 5:
                return DEFAULT_INSTANCE;
            case 6:
                v1 v1Var = PARSER;
                if (v1Var != null) {
                    return v1Var;
                }
                synchronized (a.class) {
                    try {
                        g0Var = PARSER;
                        if (g0Var == null) {
                            g0Var = new g0();
                            PARSER = g0Var;
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                return g0Var;
            default:
                throw new UnsupportedOperationException();
        }
    }

    public final boolean e() {
        return this.applyEvenIfCronetTelemetryDisabled_;
    }

    public final boolean f() {
        if (this.valueCase_ == 3) {
            return ((Boolean) this.value_).booleanValue();
        }
        return false;
    }

    public final l g() {
        return this.valueCase_ == 7 ? (l) this.value_ : l.f34884b;
    }

    public final String getAppId() {
        return this.appId_;
    }

    public final float h() {
        if (this.valueCase_ == 5) {
            return ((Float) this.value_).floatValue();
        }
        return 0.0f;
    }

    public final long i() {
        if (this.valueCase_ == 4) {
            return ((Long) this.value_).longValue();
        }
        return 0L;
    }

    public final String j() {
        return this.minVersion_;
    }

    public final String k() {
        return this.valueCase_ == 6 ? (String) this.value_ : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    public final int l() {
        int i5 = this.valueCase_;
        if (i5 == 0) {
            return 6;
        }
        if (i5 == 3) {
            return 1;
        }
        if (i5 == 4) {
            return 2;
        }
        if (i5 == 5) {
            return 3;
        }
        if (i5 != 6) {
            return i5 != 7 ? 0 : 5;
        }
        return 4;
    }

    public final boolean m() {
        return (this.bitField0_ & 1) != 0;
    }

    public final boolean n() {
        return (this.bitField0_ & 2) != 0;
    }
}
