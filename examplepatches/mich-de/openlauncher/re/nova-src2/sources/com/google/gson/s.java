package com.google.gson;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Objects;

/* loaded from: classes.dex */
public final class s extends p {

    /* renamed from: a, reason: collision with root package name */
    public final Serializable f34796a;

    public s(Boolean bool) {
        Objects.requireNonNull(bool);
        this.f34796a = bool;
    }

    public static boolean q(s sVar) {
        Serializable serializable = sVar.f34796a;
        if (!(serializable instanceof Number)) {
            return false;
        }
        Number number = (Number) serializable;
        return (number instanceof BigInteger) || (number instanceof Long) || (number instanceof Integer) || (number instanceof Short) || (number instanceof Byte);
    }

    @Override // com.google.gson.p
    public final p c() {
        return this;
    }

    @Override // com.google.gson.p
    public final boolean d() {
        Serializable serializable = this.f34796a;
        return serializable instanceof Boolean ? ((Boolean) serializable).booleanValue() : Boolean.parseBoolean(o());
    }

    @Override // com.google.gson.p
    public final double e() {
        return this.f34796a instanceof Number ? n().doubleValue() : Double.parseDouble(o());
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || s.class != obj.getClass()) {
            return false;
        }
        s sVar = (s) obj;
        Serializable serializable = sVar.f34796a;
        Serializable serializable2 = this.f34796a;
        if (serializable2 == null) {
            return serializable == null;
        }
        if (q(this) && q(sVar)) {
            return ((serializable2 instanceof BigInteger) || (serializable instanceof BigInteger)) ? p().equals(sVar.p()) : n().longValue() == sVar.n().longValue();
        }
        if (!(serializable2 instanceof Number) || !(serializable instanceof Number)) {
            return serializable2.equals(serializable);
        }
        if ((serializable2 instanceof BigDecimal) && (serializable instanceof BigDecimal)) {
            return (serializable2 instanceof BigDecimal ? (BigDecimal) serializable2 : hn.h.j(o())).compareTo(serializable instanceof BigDecimal ? (BigDecimal) serializable : hn.h.j(sVar.o())) == 0;
        }
        double dE = e();
        double dE2 = sVar.e();
        if (dE != dE2) {
            return Double.isNaN(dE) && Double.isNaN(dE2);
        }
        return true;
    }

    @Override // com.google.gson.p
    public final float f() {
        return this.f34796a instanceof Number ? n().floatValue() : Float.parseFloat(o());
    }

    @Override // com.google.gson.p
    public final int g() {
        return this.f34796a instanceof Number ? n().intValue() : Integer.parseInt(o());
    }

    public final int hashCode() {
        long jDoubleToLongBits;
        Serializable serializable = this.f34796a;
        if (serializable == null) {
            return 31;
        }
        if (q(this)) {
            jDoubleToLongBits = n().longValue();
        } else {
            if (!(serializable instanceof Number)) {
                return serializable.hashCode();
            }
            jDoubleToLongBits = Double.doubleToLongBits(n().doubleValue());
        }
        return (int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32));
    }

    @Override // com.google.gson.p
    public final long l() {
        return this.f34796a instanceof Number ? n().longValue() : Long.parseLong(o());
    }

    @Override // com.google.gson.p
    public final Number n() {
        Serializable serializable = this.f34796a;
        if (serializable instanceof Number) {
            return (Number) serializable;
        }
        if (serializable instanceof String) {
            return new hn.k((String) serializable);
        }
        throw new UnsupportedOperationException("Primitive is neither a number nor a string");
    }

    @Override // com.google.gson.p
    public final String o() {
        Serializable serializable = this.f34796a;
        if (serializable instanceof String) {
            return (String) serializable;
        }
        if (serializable instanceof Number) {
            return n().toString();
        }
        if (serializable instanceof Boolean) {
            return ((Boolean) serializable).toString();
        }
        throw new AssertionError("Unexpected value type: " + serializable.getClass());
    }

    public final BigInteger p() {
        Serializable serializable = this.f34796a;
        if (serializable instanceof BigInteger) {
            return (BigInteger) serializable;
        }
        if (q(this)) {
            return BigInteger.valueOf(n().longValue());
        }
        String strO = o();
        hn.h.c(strO);
        return new BigInteger(strO);
    }

    public s(Number number) {
        Objects.requireNonNull(number);
        this.f34796a = number;
    }

    public s(String str) {
        Objects.requireNonNull(str);
        this.f34796a = str;
    }
}
