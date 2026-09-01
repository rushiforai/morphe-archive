package defpackage;

import androidx.datastore.preferences.protobuf.e;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yy9 extends e {
    public static final int BOOLEAN_FIELD_NUMBER = 1;
    public static final int BYTES_FIELD_NUMBER = 8;
    private static final yy9 DEFAULT_INSTANCE;
    public static final int DOUBLE_FIELD_NUMBER = 7;
    public static final int FLOAT_FIELD_NUMBER = 2;
    public static final int INTEGER_FIELD_NUMBER = 3;
    public static final int LONG_FIELD_NUMBER = 4;
    private static volatile r49 PARSER = null;
    public static final int STRING_FIELD_NUMBER = 5;
    public static final int STRING_SET_FIELD_NUMBER = 6;
    private int valueCase_ = 0;
    private Object value_;

    static {
        yy9 yy9Var = new yy9();
        DEFAULT_INSTANCE = yy9Var;
        e.j(yy9.class, yy9Var);
    }

    public static yy9 n() {
        return DEFAULT_INSTANCE;
    }

    public static wy9 v() {
        return (wy9) ((h75) DEFAULT_INSTANCE.c(r75.NEW_BUILDER));
    }

    public final void A(int i) {
        this.valueCase_ = 3;
        this.value_ = Integer.valueOf(i);
    }

    public final void B(long j) {
        this.valueCase_ = 4;
        this.value_ = Long.valueOf(j);
    }

    public final void C(String str) {
        this.valueCase_ = 5;
        this.value_ = str;
    }

    public final void D(vy9 vy9Var) {
        this.value_ = vy9Var;
        this.valueCase_ = 6;
    }

    @Override // androidx.datastore.preferences.protobuf.e
    public final Object c(r75 r75Var) {
        r49 j75Var;
        switch (qy9.a[r75Var.ordinal()]) {
            case 1:
                return new yy9();
            case 2:
                return new wy9(DEFAULT_INSTANCE);
            case 3:
                return new tsa(DEFAULT_INSTANCE, "\u0001\b\u0001\u0000\u0001\b\b\u0000\u0000\u0000\u0001:\u0000\u00024\u0000\u00037\u0000\u00045\u0000\u0005;\u0000\u0006<\u0000\u00073\u0000\b=\u0000", new Object[]{"value_", "valueCase_", vy9.class});
            case 4:
                return DEFAULT_INSTANCE;
            case 5:
                r49 r49Var = PARSER;
                if (r49Var != null) {
                    return r49Var;
                }
                synchronized (yy9.class) {
                    try {
                        j75Var = PARSER;
                        if (j75Var == null) {
                            j75Var = new j75();
                            PARSER = j75Var;
                        }
                    } catch (Throwable th) {
                        throw th;
                    }
                    break;
                }
                return j75Var;
            case 6:
                return (byte) 1;
            default:
                rd6.b();
            case 7:
                return null;
        }
    }

    public final boolean l() {
        if (this.valueCase_ == 1) {
            return ((Boolean) this.value_).booleanValue();
        }
        return false;
    }

    public final d21 m() {
        return this.valueCase_ == 8 ? (d21) this.value_ : d21.c;
    }

    public final double o() {
        if (this.valueCase_ == 7) {
            return ((Double) this.value_).doubleValue();
        }
        return 0.0d;
    }

    public final float p() {
        if (this.valueCase_ == 2) {
            return ((Float) this.value_).floatValue();
        }
        return 0.0f;
    }

    public final int q() {
        if (this.valueCase_ == 3) {
            return ((Integer) this.value_).intValue();
        }
        return 0;
    }

    public final long r() {
        if (this.valueCase_ == 4) {
            return ((Long) this.value_).longValue();
        }
        return 0L;
    }

    public final String s() {
        return this.valueCase_ == 5 ? (String) this.value_ : "";
    }

    public final vy9 t() {
        return this.valueCase_ == 6 ? (vy9) this.value_ : vy9.m();
    }

    public final xy9 u() {
        return xy9.forNumber(this.valueCase_);
    }

    public final void w(boolean z) {
        this.valueCase_ = 1;
        this.value_ = Boolean.valueOf(z);
    }

    public final void x(d21 d21Var) {
        this.valueCase_ = 8;
        this.value_ = d21Var;
    }

    public final void y(double d) {
        this.valueCase_ = 7;
        this.value_ = Double.valueOf(d);
    }

    public final void z(float f) {
        this.valueCase_ = 2;
        this.value_ = Float.valueOf(f);
    }
}
