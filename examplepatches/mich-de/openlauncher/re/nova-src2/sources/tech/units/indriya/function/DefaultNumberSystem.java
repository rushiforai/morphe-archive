package tech.units.indriya.function;

import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import fc0.i;
import fc0.j;
import fc0.s;
import ic0.c;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;

/* loaded from: classes5.dex */
public class DefaultNumberSystem implements c {
    public static Number a(j jVar, Number number, Number number2) {
        if (!jVar.f54630a) {
            return number instanceof s ? number2 instanceof s ? ((s) number).a((s) number2) : ((s) number).a(s.i(e(number2))) : number instanceof BigDecimal ? number2 instanceof BigDecimal ? ((BigDecimal) number).add((BigDecimal) number2, i.f54616b) : ((number2 instanceof Double) || (number2 instanceof Float)) ? ((BigDecimal) number).add(BigDecimal.valueOf(number2.doubleValue()), i.f54616b) : number2 instanceof s ? ((BigDecimal) number).add(((s) number2).b()) : ((BigDecimal) number).add(BigDecimal.valueOf(number2.longValue())) : ((number2 instanceof Double) || (number2 instanceof Float)) ? BigDecimal.valueOf(number.doubleValue()).add(BigDecimal.valueOf(number2.doubleValue())) : number2 instanceof s ? BigDecimal.valueOf(number.doubleValue()).add(((s) number2).b()) : number2 instanceof BigInteger ? BigDecimal.valueOf(number.doubleValue()).add(new BigDecimal((BigInteger) number2)) : BigDecimal.valueOf(number.doubleValue()).add(BigDecimal.valueOf(number2.longValue()));
        }
        if (number instanceof BigInteger) {
            return ((BigInteger) number).add(e(number2));
        }
        if (Math.max(b(number), b(number2)) + 1 < 63) {
            return Long.valueOf(number2.longValue() + number.longValue());
        }
        return e(number).add(e(number2));
    }

    public static int b(Number number) {
        if (number instanceof BigInteger) {
            return ((BigInteger) number).bitLength();
        }
        long jLongValue = number.longValue();
        if (jLongValue == Long.MIN_VALUE) {
            return 63;
        }
        return 64 - Long.numberOfLeadingZeros(Math.abs(jLongValue));
    }

    public static int d(j jVar, Number number, Number number2) {
        return jVar.f54630a ? number instanceof BigInteger ? ((BigInteger) number).compareTo(e(number2)) : Long.compare(number.longValue(), number2.longValue()) : number instanceof s ? number2 instanceof s ? ((s) number).c((s) number2) : ((s) number).c(s.i(e(number2))) : number instanceof BigDecimal ? number2 instanceof BigDecimal ? ((BigDecimal) number).compareTo((BigDecimal) number2) : ((number2 instanceof Double) || (number2 instanceof Float)) ? ((BigDecimal) number).compareTo(BigDecimal.valueOf(number2.doubleValue())) : number2 instanceof s ? ((BigDecimal) number).compareTo(((s) number2).b()) : ((BigDecimal) number).compareTo(BigDecimal.valueOf(number2.longValue())) : ((number2 instanceof Double) || (number2 instanceof Float)) ? Double.compare(number.doubleValue(), number2.doubleValue()) : number2 instanceof s ? BigDecimal.valueOf(number.doubleValue()).compareTo(((s) number2).b()) : number2 instanceof BigInteger ? BigDecimal.valueOf(number.doubleValue()).compareTo(new BigDecimal((BigInteger) number2)) : BigDecimal.valueOf(number.doubleValue()).compareTo(BigDecimal.valueOf(number2.longValue()));
    }

    public static BigInteger e(Number number) {
        return number instanceof BigInteger ? (BigInteger) number : BigInteger.valueOf(number.longValue());
    }

    public static Number h(j jVar, Number number, Number number2) {
        if (jVar.f54630a) {
            if (number instanceof BigInteger) {
                return ((BigInteger) number).multiply(e(number2));
            }
            if (b(number2) + b(number) < 63) {
                return Long.valueOf(number2.longValue() * number.longValue());
            }
            return e(number).multiply(e(number2));
        }
        if (number instanceof s) {
            return number2 instanceof s ? ((s) number).e((s) number2) : ((s) number).e(s.i(e(number2)));
        }
        if (number instanceof BigDecimal) {
            return number2 instanceof BigDecimal ? ((BigDecimal) number).multiply((BigDecimal) number2, i.f54616b) : ((number2 instanceof Double) || (number2 instanceof Float)) ? ((BigDecimal) number).multiply(BigDecimal.valueOf(number2.doubleValue()), i.f54616b) : number2 instanceof s ? ((BigDecimal) number).multiply(((s) number2).b()) : ((BigDecimal) number).multiply(BigDecimal.valueOf(number2.longValue()));
        }
        if ((number2 instanceof Double) || (number2 instanceof Float)) {
            return Double.valueOf(number2.doubleValue() * number.doubleValue());
        }
        return number2 instanceof s ? BigDecimal.valueOf(number.doubleValue()).multiply(((s) number2).b()) : number2 instanceof BigInteger ? BigDecimal.valueOf(number.doubleValue()).multiply(new BigDecimal((BigInteger) number2)) : BigDecimal.valueOf(number.doubleValue()).multiply(BigDecimal.valueOf(number2.longValue()));
    }

    public final int c(Number number, Number number2) {
        j jVarA = j.a(number);
        j jVarA2 = j.a(number2);
        return jVarA2.ordinal() > jVarA.ordinal() ? -d(jVarA2, number2, number) : d(jVarA, number, number2);
    }

    public final boolean f(Number number) {
        if (!j.a(number).f54630a) {
            if (number instanceof s) {
                return ((s) number).f54656g;
            }
            if (number instanceof BigDecimal) {
                BigDecimal bigDecimal = (BigDecimal) number;
                if (bigDecimal.scale() > 0) {
                    try {
                        bigDecimal.toBigIntegerExact();
                        return true;
                    } catch (ArithmeticException unused) {
                        return false;
                    }
                }
            } else {
                if (!(number instanceof Double) && !(number instanceof Float)) {
                    throw l(number);
                }
                if (number.doubleValue() % 1.0d != 0.0d) {
                    return false;
                }
            }
        }
        return true;
    }

    public final Number g(Number number, Number number2) {
        j jVarA = j.a(number);
        j jVarA2 = j.a(number2);
        return jVarA2.ordinal() > jVarA.ordinal() ? h(jVarA2, number2, number) : h(jVarA, number, number2);
    }

    public final Number i(Number number) {
        if ((number instanceof Integer) || (number instanceof AtomicInteger) || (number instanceof Short) || (number instanceof Byte)) {
            return number;
        }
        if (!(number instanceof Double) && !(number instanceof Float)) {
            if (j.a(number).f54630a) {
                int iB = b(number);
                return iB < 31 ? Integer.valueOf(number.intValue()) : iB < 63 ? Long.valueOf(number.longValue()) : number;
            }
            if (number instanceof BigDecimal) {
                try {
                    return i(((BigDecimal) number).toBigIntegerExact());
                } catch (ArithmeticException unused) {
                    return number;
                }
            }
            if (!(number instanceof s)) {
                return number;
            }
            s sVar = (s) number;
            return sVar.f54656g ? i(sVar.d()) : number;
        }
        double dDoubleValue = number.doubleValue();
        if (Double.isFinite(dDoubleValue)) {
            return dDoubleValue % 1.0d == 0.0d ? i(BigDecimal.valueOf(dDoubleValue)) : number;
        }
        Double dValueOf = Double.valueOf(dDoubleValue);
        String str = b.f42142b + dValueOf;
        Class<?> cls = dValueOf.getClass();
        String name = getClass().getName();
        StringBuilder sb2 = new StringBuilder("Unsupported number value '");
        sb2.append(str);
        sb2.append("' of type '");
        sb2.append(cls);
        sb2.append("' in number system '");
        throw new IllegalArgumentException(c0.q(sb2, name, "'"));
    }

    public final Number j(int i5, Number number) {
        boolean z11;
        boolean z12;
        boolean z13;
        boolean z14;
        boolean z15;
        boolean z16;
        BigDecimal bigDecimalValueOf;
        if (i5 == 0) {
            if (c(j.a(number).f54632c, number) != 0) {
                return 1;
            }
            throw new ArithmeticException("0^0 is not defined");
        }
        if (i5 == 1) {
            return number;
        }
        boolean z17 = number instanceof BigInteger;
        if (z17 || ((z11 = number instanceof Long)) || ((z12 = number instanceof AtomicLong)) || ((z13 = number instanceof Integer)) || ((z14 = number instanceof AtomicInteger)) || ((z15 = number instanceof Short)) || ((z16 = number instanceof Byte))) {
            BigInteger bigIntegerE = e(number);
            return i5 > 0 ? bigIntegerE.pow(i5) : s.i(bigIntegerE).j(i5);
        }
        boolean z18 = number instanceof BigDecimal;
        if (z18) {
            return ((BigDecimal) number).pow(i5, i.f54616b);
        }
        boolean z19 = number instanceof s;
        if (z19) {
            ((s) number).j(i5);
        }
        boolean z21 = number instanceof Double;
        if (!z21 && !(number instanceof Float)) {
            throw l(number);
        }
        if (z18) {
            bigDecimalValueOf = (BigDecimal) number;
        } else if (z17) {
            bigDecimalValueOf = new BigDecimal((BigInteger) number);
        } else if (z11 || z12 || z13 || z14 || z15 || z16) {
            bigDecimalValueOf = BigDecimal.valueOf(number.longValue());
        } else {
            if (!z21 && !(number instanceof Float)) {
                if (z19) {
                    throw new IllegalStateException("Implementation Error: Code was reached that is expected unreachable");
                }
                throw l(number);
            }
            bigDecimalValueOf = BigDecimal.valueOf(number.doubleValue());
        }
        return bigDecimalValueOf.pow(i5, i.f54616b);
    }

    public final s k(Number number) {
        if (j.a(number).f54630a) {
            return s.h(BigInteger.ONE, e(number));
        }
        if (number instanceof BigDecimal) {
            return s.g((BigDecimal) number).k();
        }
        if (number instanceof s) {
            return ((s) number).k();
        }
        if (number instanceof Double) {
            return s.f(((Double) number).doubleValue()).k();
        }
        if (number instanceof Float) {
            return s.f(number.doubleValue()).k();
        }
        throw l(number);
    }

    public final IllegalArgumentException l(Number number) {
        return new IllegalArgumentException(c0.n("Unsupported number type '", number.getClass().getName(), "' in number system '", getClass().getName(), "'"));
    }
}
