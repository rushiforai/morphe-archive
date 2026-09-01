package j$.util;

import j$.util.function.Function$CC;
import j$.util.function.Predicate$CC;
import j$.util.stream.IntStream;
import j$.util.stream.Stream;
import j$.util.stream.c8;
import j$.util.stream.j7;
import j$.util.stream.l5;
import j$.util.stream.l7;
import j$.util.stream.n7;
import j$.util.stream.w6;
import j$.util.stream.x6;
import java.util.ArrayList;
import java.util.EnumMap;
import java.util.Map;
import java.util.function.BooleanSupplier;
import java.util.function.Consumer;
import java.util.function.DoubleFunction;
import java.util.function.Function;
import java.util.function.LongFunction;
import java.util.function.Predicate;
import java.util.function.Supplier;
import java.util.stream.DoubleStream;
import java.util.stream.LongStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final /* synthetic */ class n implements Consumer, Predicate, Supplier, DoubleFunction, Function, LongFunction, BooleanSupplier {
    public final /* synthetic */ int a;
    public Object b;

    public /* synthetic */ n(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    public void a(x6 x6Var) {
        ((EnumMap) ((java.util.Map) this.b)).put(x6Var, 1);
    }

    @Override // java.util.function.Consumer
    public void accept(Object obj) {
        switch (this.a) {
            case 0:
                ((Consumer) this.b).accept(new o((Map.Entry) obj));
                break;
            case 7:
                ((l5) this.b).accept(obj);
                break;
            default:
                ((ArrayList) ((java.util.List) this.b)).add(obj);
                break;
        }
    }

    public /* synthetic */ Predicate and(Predicate predicate) {
        return Predicate$CC.$default$and(this, predicate);
    }

    public /* synthetic */ Consumer andThen(Consumer consumer) {
        switch (this.a) {
            case 0:
                break;
            case 7:
                break;
        }
        return j$.time.a.d(this, consumer);
    }

    @Override // java.util.function.Function
    public Object apply(Object obj) {
        Object objApply = ((Function) this.b).apply(obj);
        if (objApply == null) {
            return null;
        }
        if (objApply instanceof Stream) {
            return Stream.Wrapper.convert((Stream) objApply);
        }
        if (objApply instanceof java.util.stream.Stream) {
            return w6.h((java.util.stream.Stream) objApply);
        }
        if (objApply instanceof IntStream) {
            return IntStream.Wrapper.convert((IntStream) objApply);
        }
        if (objApply instanceof java.util.stream.IntStream) {
            return IntStream.VivifiedWrapper.convert((java.util.stream.IntStream) objApply);
        }
        if (objApply instanceof j$.util.stream.c0) {
            return j$.util.stream.b0.h((j$.util.stream.c0) objApply);
        }
        if (objApply instanceof DoubleStream) {
            return j$.util.stream.a0.h((DoubleStream) objApply);
        }
        if (objApply instanceof j$.util.stream.l1) {
            return j$.util.stream.k1.h((j$.util.stream.l1) objApply);
        }
        if (objApply instanceof LongStream) {
            return j$.util.stream.j1.h((LongStream) objApply);
        }
        f.a(objApply.getClass(), "java.util.stream.*Stream");
        throw null;
    }

    public /* synthetic */ Function compose(Function function) {
        return Function$CC.$default$compose(this, function);
    }

    @Override // java.util.function.Supplier
    public Object get() {
        switch (this.a) {
            case 2:
                return ((j$.util.stream.a) this.b).O(0);
            default:
                return (Spliterator) this.b;
        }
    }

    @Override // java.util.function.BooleanSupplier
    public boolean getAsBoolean() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 10:
                j7 j7Var = (j7) obj;
                return j7Var.d.tryAdvance(j7Var.e);
            case 11:
                l7 l7Var = (l7) obj;
                return l7Var.d.tryAdvance(l7Var.e);
            case 12:
                n7 n7Var = (n7) obj;
                return n7Var.d.tryAdvance(n7Var.e);
            default:
                c8 c8Var = (c8) obj;
                return c8Var.d.tryAdvance(c8Var.e);
        }
    }

    public /* synthetic */ Predicate negate() {
        return Predicate$CC.$default$negate(this);
    }

    public /* synthetic */ Predicate or(Predicate predicate) {
        return Predicate$CC.$default$or(this, predicate);
    }

    @Override // java.util.function.Predicate
    public boolean test(Object obj) {
        return !((Predicate) this.b).test(obj);
    }

    public /* synthetic */ n(int i) {
        this.a = i;
    }

    public /* synthetic */ Function andThen(Function function) {
        return Function$CC.$default$andThen(this, function);
    }

    @Override // java.util.function.DoubleFunction
    public Object apply(double d) {
        Object objApply = ((DoubleFunction) this.b).apply(d);
        if (objApply == null) {
            return null;
        }
        if (objApply instanceof j$.util.stream.c0) {
            return j$.util.stream.b0.h((j$.util.stream.c0) objApply);
        }
        if (objApply instanceof DoubleStream) {
            return j$.util.stream.a0.h((DoubleStream) objApply);
        }
        f.a(objApply.getClass(), "java.util.stream.DoubleStream");
        throw null;
    }

    @Override // java.util.function.LongFunction
    public Object apply(long j) {
        Object objApply = ((LongFunction) this.b).apply(j);
        if (objApply == null) {
            return null;
        }
        if (objApply instanceof j$.util.stream.l1) {
            return j$.util.stream.k1.h((j$.util.stream.l1) objApply);
        }
        if (objApply instanceof LongStream) {
            return j$.util.stream.j1.h((LongStream) objApply);
        }
        f.a(objApply.getClass(), "java.util.stream.LongStream");
        throw null;
    }
}
