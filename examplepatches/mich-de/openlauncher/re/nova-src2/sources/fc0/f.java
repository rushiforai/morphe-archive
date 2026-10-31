package fc0;

import com.amplitude.core.events.Identify;
import io.sentry.e3;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import tech.units.indriya.function.DefaultNumberSystem;

/* loaded from: classes5.dex */
public final class f extends e implements kc0.a {

    /* renamed from: d, reason: collision with root package name */
    public final Number f54608d;

    public f(Number number) {
        this.f54608d = ((DefaultNumberSystem) i.a()).i(number);
    }

    @Override // x60.f
    public final boolean a() {
        DefaultNumberSystem defaultNumberSystem = (DefaultNumberSystem) i.a();
        defaultNumberSystem.getClass();
        Number number = this.f54608d;
        return defaultNumberSystem.c(j.a(number).f54632c, number) == 0;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        x60.f fVar = (x60.f) obj;
        if (this == fVar) {
            return 0;
        }
        if (!(fVar instanceof f)) {
            return -1;
        }
        ic0.c cVarA = i.a();
        return ((DefaultNumberSystem) cVarA).c(this.f54608d, ((f) fVar).f54608d);
    }

    @Override // x60.f
    public final boolean e() {
        return a();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof f) {
            return Objects.equals(this.f54608d, ((f) obj).f54608d);
        }
        return false;
    }

    @Override // fc0.e, kc0.a
    public final Object getValue() {
        return this.f54608d;
    }

    @Override // fc0.e
    public final boolean h(e eVar) {
        return eVar instanceof f;
    }

    public final int hashCode() {
        return Objects.hashCode(this.f54608d);
    }

    @Override // fc0.e
    public final Number i(Number number) {
        e3 e3VarQ = e3.q(this.f54608d);
        e3VarQ.getClass();
        Objects.requireNonNull(number);
        ic0.c cVar = (ic0.c) e3VarQ.f67208b;
        Number number2 = (Number) e3VarQ.f67209c;
        DefaultNumberSystem defaultNumberSystem = (DefaultNumberSystem) cVar;
        Number numberI = defaultNumberSystem.i(number);
        defaultNumberSystem.getClass();
        j jVarA = j.a(number2);
        j jVarA2 = j.a(numberI);
        e3VarQ.f67209c = jVarA2.ordinal() > jVarA.ordinal() ? DefaultNumberSystem.a(jVarA2, numberI, number2) : DefaultNumberSystem.a(jVarA, number2, numberI);
        return e3VarQ.t();
    }

    @Override // fc0.e
    public final e k() {
        Number numberNegate;
        DefaultNumberSystem defaultNumberSystem = (DefaultNumberSystem) i.a();
        defaultNumberSystem.getClass();
        Number number = this.f54608d;
        if (number instanceof BigInteger) {
            numberNegate = ((BigInteger) number).negate();
        } else if (number instanceof BigDecimal) {
            numberNegate = ((BigDecimal) number).negate();
        } else if (number instanceof s) {
            s sVar = (s) number;
            numberNegate = new s(-sVar.f54652c, sVar.f54653d, sVar.f54654e);
        } else if (number instanceof Double) {
            numberNegate = Double.valueOf(-((Double) number).doubleValue());
        } else if (number instanceof Float) {
            numberNegate = Float.valueOf(-((Float) number).floatValue());
        } else if ((number instanceof Long) || (number instanceof AtomicLong)) {
            long jLongValue = number.longValue();
            numberNegate = jLongValue == Long.MIN_VALUE ? BigInteger.valueOf(jLongValue).negate() : Long.valueOf(-jLongValue);
        } else if ((number instanceof Integer) || (number instanceof AtomicInteger)) {
            int iIntValue = number.intValue();
            numberNegate = iIntValue == Integer.MIN_VALUE ? Long.valueOf(-number.longValue()) : Integer.valueOf(-iIntValue);
        } else if (number instanceof Short) {
            short sShortValue = ((Short) number).shortValue();
            numberNegate = sShortValue == Short.MIN_VALUE ? Integer.valueOf(-number.intValue()) : Integer.valueOf(-sShortValue);
        } else {
            if (!(number instanceof Byte)) {
                throw defaultNumberSystem.l(number);
            }
            short sByteValue = ((Byte) number).byteValue();
            numberNegate = sByteValue == -128 ? Integer.valueOf(-number.intValue()) : Integer.valueOf(-sByteValue);
        }
        return new f(numberNegate);
    }

    @Override // fc0.e
    public final e l(e eVar) {
        ic0.c cVarA = i.a();
        Number number = ((f) eVar).f54608d;
        ((DefaultNumberSystem) cVarA).getClass();
        Number number2 = this.f54608d;
        j jVarA = j.a(number2);
        j jVarA2 = j.a(number);
        return new f(jVarA2.ordinal() > jVarA.ordinal() ? DefaultNumberSystem.a(jVarA2, number, number2) : DefaultNumberSystem.a(jVarA, number2, number));
    }

    @Override // fc0.e
    public final String m() {
        int iSignum;
        Object sVar;
        ic0.c cVarA = i.a();
        DefaultNumberSystem defaultNumberSystem = (DefaultNumberSystem) cVarA;
        defaultNumberSystem.getClass();
        Number number = this.f54608d;
        if (number instanceof BigInteger) {
            iSignum = ((BigInteger) number).signum();
        } else if (number instanceof BigDecimal) {
            iSignum = ((BigDecimal) number).signum();
        } else if (number instanceof s) {
            iSignum = ((s) number).f54652c;
        } else if (number instanceof Double) {
            iSignum = (int) Math.signum(((Double) number).doubleValue());
        } else if (number instanceof Float) {
            iSignum = (int) Math.signum(((Float) number).floatValue());
        } else if ((number instanceof Long) || (number instanceof AtomicLong)) {
            iSignum = Long.signum(number.longValue());
        } else {
            if (!(number instanceof Integer) && !(number instanceof AtomicInteger) && !(number instanceof Short) && !(number instanceof Byte)) {
                throw defaultNumberSystem.l(number);
            }
            iSignum = Integer.signum(number.intValue());
        }
        String str = iSignum < 0 ? Identify.UNSET_VALUE : "+";
        DefaultNumberSystem defaultNumberSystem2 = (DefaultNumberSystem) cVarA;
        defaultNumberSystem2.getClass();
        if (number instanceof BigInteger) {
            sVar = ((BigInteger) number).abs();
        } else if (number instanceof BigDecimal) {
            sVar = ((BigDecimal) number).abs();
        } else if (number instanceof s) {
            s sVar2 = (s) number;
            int i5 = sVar2.f54652c;
            sVar = sVar2;
            if (i5 < 0) {
                sVar = new s(1, sVar2.f54653d, sVar2.f54654e);
            }
        } else if (number instanceof Double) {
            sVar = Double.valueOf(Math.abs(((Double) number).doubleValue()));
        } else if (number instanceof Float) {
            sVar = Float.valueOf(Math.abs(((Float) number).floatValue()));
        } else if ((number instanceof Long) || (number instanceof AtomicLong)) {
            long jLongValue = number.longValue();
            sVar = jLongValue == Long.MIN_VALUE ? BigInteger.valueOf(jLongValue).abs() : Long.valueOf(Math.abs(jLongValue));
        } else {
            if (!(number instanceof Integer) && !(number instanceof AtomicInteger)) {
                if ((number instanceof Short) || (number instanceof Byte)) {
                    number.intValue();
                }
                throw defaultNumberSystem2.l(number);
            }
            int iIntValue = number.intValue();
            sVar = iIntValue == Integer.MIN_VALUE ? Long.valueOf(Math.abs(number.longValue())) : Integer.valueOf(Math.abs(iIntValue));
        }
        return String.format("x -> x %s %s", str, sVar);
    }
}
