package cp;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Objects;

/* loaded from: classes4.dex */
public final class s extends p {

    /* renamed from: a, reason: collision with root package name */
    public final Serializable f47783a;

    public s(Boolean bool) {
        Objects.requireNonNull(bool);
        this.f47783a = bool;
    }

    public static boolean f(s sVar) {
        Serializable serializable = sVar.f47783a;
        if (!(serializable instanceof Number)) {
            return false;
        }
        Number number = (Number) serializable;
        return (number instanceof BigInteger) || (number instanceof Long) || (number instanceof Integer) || (number instanceof Short) || (number instanceof Byte);
    }

    public final BigInteger c() {
        Serializable serializable = this.f47783a;
        if (serializable instanceof BigInteger) {
            return (BigInteger) serializable;
        }
        if (f(this)) {
            return BigInteger.valueOf(d().longValue());
        }
        String strE = e();
        ep.i.d(strE);
        return new BigInteger(strE);
    }

    public final Number d() {
        Serializable serializable = this.f47783a;
        if (serializable instanceof Number) {
            return (Number) serializable;
        }
        if (serializable instanceof String) {
            return new ep.k((String) serializable);
        }
        throw new UnsupportedOperationException("Primitive is neither a number nor a string");
    }

    public final String e() {
        Serializable serializable = this.f47783a;
        if (serializable instanceof String) {
            return (String) serializable;
        }
        if (serializable instanceof Number) {
            return d().toString();
        }
        if (serializable instanceof Boolean) {
            return ((Boolean) serializable).toString();
        }
        throw new AssertionError("Unexpected value type: " + serializable.getClass());
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || s.class != obj.getClass()) {
            return false;
        }
        s sVar = (s) obj;
        Serializable serializable = sVar.f47783a;
        Serializable serializable2 = this.f47783a;
        if (serializable2 == null) {
            return serializable == null;
        }
        if (f(this) && f(sVar)) {
            return ((serializable2 instanceof BigInteger) || (serializable instanceof BigInteger)) ? c().equals(sVar.c()) : d().longValue() == sVar.d().longValue();
        }
        if (!(serializable2 instanceof Number) || !(serializable instanceof Number)) {
            return serializable2.equals(serializable);
        }
        if ((serializable2 instanceof BigDecimal) && (serializable instanceof BigDecimal)) {
            return (serializable2 instanceof BigDecimal ? (BigDecimal) serializable2 : ep.i.i(e())).compareTo(serializable instanceof BigDecimal ? (BigDecimal) serializable : ep.i.i(sVar.e())) == 0;
        }
        double dDoubleValue = serializable2 instanceof Number ? d().doubleValue() : Double.parseDouble(e());
        double dDoubleValue2 = serializable instanceof Number ? sVar.d().doubleValue() : Double.parseDouble(sVar.e());
        if (dDoubleValue != dDoubleValue2) {
            return Double.isNaN(dDoubleValue) && Double.isNaN(dDoubleValue2);
        }
        return true;
    }

    public final int hashCode() {
        long jDoubleToLongBits;
        Serializable serializable = this.f47783a;
        if (serializable == null) {
            return 31;
        }
        if (f(this)) {
            jDoubleToLongBits = d().longValue();
        } else {
            if (!(serializable instanceof Number)) {
                return serializable.hashCode();
            }
            jDoubleToLongBits = Double.doubleToLongBits(d().doubleValue());
        }
        return (int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32));
    }

    public s(Number number) {
        Objects.requireNonNull(number);
        this.f47783a = number;
    }

    public s(String str) {
        Objects.requireNonNull(str);
        this.f47783a = str;
    }
}
