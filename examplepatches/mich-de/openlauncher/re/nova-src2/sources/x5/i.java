package x5;

import androidx.datastore.preferences.protobuf.u0;
import androidx.datastore.preferences.protobuf.w;
import androidx.datastore.preferences.protobuf.x;
import androidx.datastore.preferences.protobuf.y;
import androidx.datastore.preferences.protobuf.y0;
import b.c0;

/* loaded from: classes.dex */
public final class i extends y {
    public static final int BOOLEAN_FIELD_NUMBER = 1;
    public static final int BYTES_FIELD_NUMBER = 8;
    private static final i DEFAULT_INSTANCE;
    public static final int DOUBLE_FIELD_NUMBER = 7;
    public static final int FLOAT_FIELD_NUMBER = 2;
    public static final int INTEGER_FIELD_NUMBER = 3;
    public static final int LONG_FIELD_NUMBER = 4;
    private static volatile u0 PARSER = null;
    public static final int STRING_FIELD_NUMBER = 5;
    public static final int STRING_SET_FIELD_NUMBER = 6;
    private int valueCase_ = 0;
    private Object value_;

    static {
        i iVar = new i();
        DEFAULT_INSTANCE = iVar;
        y.i(i.class, iVar);
    }

    public static h D() {
        return (h) ((w) DEFAULT_INSTANCE.b(5));
    }

    public static void l(i iVar, long j11) {
        iVar.valueCase_ = 4;
        iVar.value_ = Long.valueOf(j11);
    }

    public static void m(i iVar, String str) {
        iVar.getClass();
        iVar.valueCase_ = 5;
        iVar.value_ = str;
    }

    public static void n(i iVar, g gVar) {
        iVar.getClass();
        iVar.value_ = gVar;
        iVar.valueCase_ = 6;
    }

    public static void o(i iVar, double d5) {
        iVar.valueCase_ = 7;
        iVar.value_ = Double.valueOf(d5);
    }

    public static void p(i iVar, androidx.datastore.preferences.protobuf.h hVar) {
        iVar.getClass();
        iVar.valueCase_ = 8;
        iVar.value_ = hVar;
    }

    public static void q(i iVar, boolean z11) {
        iVar.valueCase_ = 1;
        iVar.value_ = Boolean.valueOf(z11);
    }

    public static void r(i iVar, float f11) {
        iVar.valueCase_ = 2;
        iVar.value_ = Float.valueOf(f11);
    }

    public static void s(i iVar, int i5) {
        iVar.valueCase_ = 3;
        iVar.value_ = Integer.valueOf(i5);
    }

    public static i v() {
        return DEFAULT_INSTANCE;
    }

    public final String A() {
        return this.valueCase_ == 5 ? (String) this.value_ : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    public final g B() {
        return this.valueCase_ == 6 ? (g) this.value_ : g.n();
    }

    public final int C() {
        switch (this.valueCase_) {
            case 0:
                return 9;
            case 1:
                return 1;
            case 2:
                return 2;
            case 3:
                return 3;
            case 4:
                return 4;
            case 5:
                return 5;
            case 6:
                return 6;
            case 7:
                return 7;
            case 8:
                return 8;
            default:
                return 0;
        }
    }

    @Override // androidx.datastore.preferences.protobuf.y
    public final Object b(int i5) {
        u0 xVar;
        switch (c0.F(i5)) {
            case 0:
                return (byte) 1;
            case 1:
                return null;
            case 2:
                return new y0(DEFAULT_INSTANCE, "\u0001\b\u0001\u0000\u0001\b\b\u0000\u0000\u0000\u0001:\u0000\u00024\u0000\u00037\u0000\u00045\u0000\u0005;\u0000\u0006<\u0000\u00073\u0000\b=\u0000", new Object[]{"value_", "valueCase_", g.class});
            case 3:
                return new i();
            case 4:
                return new h(DEFAULT_INSTANCE);
            case 5:
                return DEFAULT_INSTANCE;
            case 6:
                u0 u0Var = PARSER;
                if (u0Var != null) {
                    return u0Var;
                }
                synchronized (i.class) {
                    try {
                        xVar = PARSER;
                        if (xVar == null) {
                            xVar = new x();
                            PARSER = xVar;
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                return xVar;
            default:
                throw new UnsupportedOperationException();
        }
    }

    public final boolean t() {
        if (this.valueCase_ == 1) {
            return ((Boolean) this.value_).booleanValue();
        }
        return false;
    }

    public final androidx.datastore.preferences.protobuf.h u() {
        return this.valueCase_ == 8 ? (androidx.datastore.preferences.protobuf.h) this.value_ : androidx.datastore.preferences.protobuf.h.f14324c;
    }

    public final double w() {
        if (this.valueCase_ == 7) {
            return ((Double) this.value_).doubleValue();
        }
        return 0.0d;
    }

    public final float x() {
        if (this.valueCase_ == 2) {
            return ((Float) this.value_).floatValue();
        }
        return 0.0f;
    }

    public final int y() {
        if (this.valueCase_ == 3) {
            return ((Integer) this.value_).intValue();
        }
        return 0;
    }

    public final long z() {
        if (this.valueCase_ == 4) {
            return ((Long) this.value_).longValue();
        }
        return 0L;
    }
}
