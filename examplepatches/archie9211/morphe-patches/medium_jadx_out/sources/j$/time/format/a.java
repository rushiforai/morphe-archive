package j$.time.format;

import j$.time.LocalDate;
import j$.time.LocalTime;
import j$.time.ZoneId;
import j$.time.ZoneOffset;
import j$.time.temporal.Temporal;
import j$.time.temporal.TemporalAccessor;
import j$.util.function.Predicate$CC;
import java.util.LinkedHashSet;
import java.util.function.BiConsumer;
import java.util.function.DoubleBinaryOperator;
import java.util.function.DoubleFunction;
import java.util.function.IntFunction;
import java.util.function.ObjDoubleConsumer;
import java.util.function.Predicate;
import java.util.function.Supplier;
import java.util.function.ToDoubleFunction;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final /* synthetic */ class a implements j$.time.temporal.l, IntFunction, Supplier, BiConsumer, DoubleFunction, ToDoubleFunction, DoubleBinaryOperator, ObjDoubleConsumer, Predicate {
    public final /* synthetic */ int a;

    public /* synthetic */ a(int i) {
        this.a = i;
    }

    @Override // java.util.function.BiConsumer
    public void accept(Object obj, Object obj2) {
        switch (this.a) {
            case 14:
                ((LinkedHashSet) obj).add(obj2);
                break;
            case 15:
                ((LinkedHashSet) obj).addAll((LinkedHashSet) obj2);
                break;
            case 16:
                ((j$.util.u) obj).a((j$.util.u) obj2);
                break;
            case 23:
                double[] dArr = (double[]) obj;
                double[] dArr2 = (double[]) obj2;
                j$.util.stream.j.a(dArr, dArr2[0]);
                j$.util.stream.j.a(dArr, dArr2[1]);
                dArr[2] = dArr[2] + dArr2[2];
                break;
            default:
                double[] dArr3 = (double[]) obj;
                double[] dArr4 = (double[]) obj2;
                j$.util.stream.j.a(dArr3, dArr4[0]);
                j$.util.stream.j.a(dArr3, dArr4[1]);
                dArr3[2] = dArr3[2] + dArr4[2];
                dArr3[3] = dArr3[3] + dArr4[3];
                break;
        }
    }

    public /* synthetic */ Predicate and(Predicate predicate) {
        return Predicate$CC.$default$and(this, predicate);
    }

    public /* synthetic */ BiConsumer andThen(BiConsumer biConsumer) {
        switch (this.a) {
            case 14:
                break;
            case 15:
                break;
            case 16:
                break;
            case 23:
                break;
        }
        return j$.time.a.b(this, biConsumer);
    }

    @Override // java.util.function.IntFunction
    public Object apply(int i) {
        switch (this.a) {
            case 9:
                return new Object[i];
            default:
                return new Double[i];
        }
    }

    @Override // java.util.function.DoubleBinaryOperator
    public double applyAsDouble(double d, double d2) {
        switch (this.a) {
            case 20:
                return Math.max(d, d2);
            default:
                return Math.min(d, d2);
        }
    }

    public Object g(TemporalAccessor temporalAccessor) {
        int i = this.a;
        a aVar = j$.time.temporal.o.a;
        switch (i) {
            case 0:
                ZoneId zoneId = (ZoneId) temporalAccessor.m(aVar);
                if (zoneId == null || (zoneId instanceof ZoneOffset)) {
                    return null;
                }
                return zoneId;
            case 1:
            default:
                j$.time.temporal.a aVar2 = j$.time.temporal.a.NANO_OF_DAY;
                if (temporalAccessor.d(aVar2)) {
                    return LocalTime.E(temporalAccessor.s(aVar2));
                }
                return null;
            case 2:
                return (ZoneId) temporalAccessor.m(aVar);
            case 3:
                return (j$.time.chrono.a) temporalAccessor.m(j$.time.temporal.o.b);
            case 4:
                return (j$.time.temporal.p) temporalAccessor.m(j$.time.temporal.o.c);
            case 5:
                j$.time.temporal.a aVar3 = j$.time.temporal.a.OFFSET_SECONDS;
                if (temporalAccessor.d(aVar3)) {
                    return ZoneOffset.ofTotalSeconds(temporalAccessor.h(aVar3));
                }
                return null;
            case 6:
                ZoneId zoneId2 = (ZoneId) temporalAccessor.m(aVar);
                return zoneId2 != null ? zoneId2 : (ZoneId) temporalAccessor.m(j$.time.temporal.o.d);
            case 7:
                j$.time.temporal.a aVar4 = j$.time.temporal.a.EPOCH_DAY;
                if (temporalAccessor.d(aVar4)) {
                    return LocalDate.M(temporalAccessor.s(aVar4));
                }
                return null;
        }
    }

    @Override // java.util.function.Supplier
    public Object get() {
        switch (this.a) {
            case 10:
                return new j$.util.u();
            case 11:
                return new j$.util.v();
            case 12:
                return new j$.util.x();
            case 13:
                return new LinkedHashSet();
            case 21:
                return new double[3];
            default:
                return new double[4];
        }
    }

    @Override // j$.time.temporal.l
    public Temporal k(Temporal temporal) {
        j$.time.temporal.a aVar = j$.time.temporal.a.DAY_OF_MONTH;
        return temporal.b(temporal.j(aVar).d, aVar);
    }

    public /* synthetic */ Predicate negate() {
        return Predicate$CC.$default$negate(this);
    }

    public /* synthetic */ Predicate or(Predicate predicate) {
        return Predicate$CC.$default$or(this, predicate);
    }

    @Override // java.util.function.Predicate
    public boolean test(Object obj) {
        return ((j$.util.y) obj).a;
    }

    public String toString() {
        switch (this.a) {
            case 2:
                return "ZoneId";
            case 3:
                return "Chronology";
            case 4:
                return "Precision";
            case 5:
                return "ZoneOffset";
            case 6:
                return "Zone";
            case 7:
                return "LocalDate";
            case 8:
                return "LocalTime";
            default:
                return super.toString();
        }
    }

    @Override // java.util.function.DoubleFunction
    public Object apply(double d) {
        return Double.valueOf(d);
    }

    @Override // java.util.function.ToDoubleFunction
    public double applyAsDouble(Object obj) {
        return ((Double) obj).doubleValue();
    }

    @Override // java.util.function.ObjDoubleConsumer
    public void accept(Object obj, double d) {
        switch (this.a) {
            case 22:
                double[] dArr = (double[]) obj;
                j$.util.stream.j.a(dArr, d);
                dArr[2] = dArr[2] + d;
                break;
            case 26:
                double[] dArr2 = (double[]) obj;
                dArr2[2] = dArr2[2] + 1.0d;
                j$.util.stream.j.a(dArr2, d);
                dArr2[3] = dArr2[3] + d;
                break;
            default:
                ((j$.util.u) obj).accept(d);
                break;
        }
    }
}
