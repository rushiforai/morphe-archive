package defpackage;

import j$.util.Objects;
import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zc6 extends dc6 {
    public final Serializable a;

    public zc6(Boolean bool) {
        Objects.requireNonNull(bool);
        this.a = bool;
    }

    public static boolean t(zc6 zc6Var) {
        Serializable serializable = zc6Var.a;
        if (!(serializable instanceof Number)) {
            return false;
        }
        Number number = (Number) serializable;
        return (number instanceof BigInteger) || (number instanceof Long) || (number instanceof Integer) || (number instanceof Short) || (number instanceof Byte);
    }

    @Override // defpackage.dc6
    public final int d() {
        return this.a instanceof Number ? s().intValue() : Integer.parseInt(m());
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || zc6.class != obj.getClass()) {
            return false;
        }
        zc6 zc6Var = (zc6) obj;
        Serializable serializable = zc6Var.a;
        boolean zT = t(this);
        Serializable serializable2 = this.a;
        if (zT && t(zc6Var)) {
            return ((serializable2 instanceof BigInteger) || (serializable instanceof BigInteger)) ? p().equals(zc6Var.p()) : s().longValue() == zc6Var.s().longValue();
        }
        if (!(serializable2 instanceof Number) || !(serializable instanceof Number)) {
            return serializable2.equals(serializable);
        }
        if ((serializable2 instanceof BigDecimal) && (serializable instanceof BigDecimal)) {
            return (serializable2 instanceof BigDecimal ? (BigDecimal) serializable2 : qk7.w(m())).compareTo(serializable instanceof BigDecimal ? (BigDecimal) serializable : qk7.w(zc6Var.m())) == 0;
        }
        double dR = r();
        double dR2 = zc6Var.r();
        if (dR != dR2) {
            return Double.isNaN(dR) && Double.isNaN(dR2);
        }
        return true;
    }

    @Override // defpackage.dc6
    public final long f() {
        return this.a instanceof Number ? s().longValue() : Long.parseLong(m());
    }

    public final int hashCode() {
        long jDoubleToLongBits;
        if (t(this)) {
            jDoubleToLongBits = s().longValue();
        } else {
            Serializable serializable = this.a;
            if (!(serializable instanceof Number)) {
                return serializable.hashCode();
            }
            jDoubleToLongBits = Double.doubleToLongBits(s().doubleValue());
        }
        return (int) ((jDoubleToLongBits >>> 32) ^ jDoubleToLongBits);
    }

    @Override // defpackage.dc6
    public final String m() {
        Serializable serializable = this.a;
        if (serializable instanceof String) {
            return (String) serializable;
        }
        if (serializable instanceof Number) {
            return s().toString();
        }
        if (serializable instanceof Boolean) {
            return ((Boolean) serializable).toString();
        }
        throw new AssertionError("Unexpected value type: " + serializable.getClass());
    }

    public final BigInteger p() {
        Serializable serializable = this.a;
        if (serializable instanceof BigInteger) {
            return (BigInteger) serializable;
        }
        if (t(this)) {
            return BigInteger.valueOf(s().longValue());
        }
        String strM = m();
        qk7.n(strM);
        return new BigInteger(strM);
    }

    public final boolean q() {
        Serializable serializable = this.a;
        return serializable instanceof Boolean ? ((Boolean) serializable).booleanValue() : Boolean.parseBoolean(m());
    }

    public final double r() {
        return this.a instanceof Number ? s().doubleValue() : Double.parseDouble(m());
    }

    public final Number s() {
        Serializable serializable = this.a;
        if (serializable instanceof Number) {
            return (Number) serializable;
        }
        if (serializable instanceof String) {
            return new uq6((String) serializable);
        }
        ik4.k("Primitive is neither a number nor a string");
        return null;
    }

    public zc6(Number number) {
        Objects.requireNonNull(number);
        this.a = number;
    }

    public zc6(String str) {
        Objects.requireNonNull(str);
        this.a = str;
    }
}
