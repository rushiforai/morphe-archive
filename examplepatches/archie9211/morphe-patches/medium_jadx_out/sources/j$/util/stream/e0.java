package j$.util.stream;

import j$.util.Optional;
import j$.util.function.Predicate$CC;
import java.util.function.BiConsumer;
import java.util.function.IntBinaryOperator;
import java.util.function.IntFunction;
import java.util.function.LongBinaryOperator;
import java.util.function.LongFunction;
import java.util.function.ObjIntConsumer;
import java.util.function.ObjLongConsumer;
import java.util.function.Predicate;
import java.util.function.Supplier;
import java.util.function.ToIntFunction;
import java.util.function.ToLongFunction;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final /* synthetic */ class e0 implements Supplier, Predicate, IntFunction, IntBinaryOperator, ObjIntConsumer, BiConsumer, ToIntFunction, ObjLongConsumer, LongFunction, LongBinaryOperator, ToLongFunction {
    public final /* synthetic */ int a;

    public /* synthetic */ e0(int i) {
        this.a = i;
    }

    @Override // java.util.function.BiConsumer
    public void accept(Object obj, Object obj2) {
        switch (this.a) {
            case 11:
                ((j$.util.v) obj).a((j$.util.v) obj2);
                break;
            case 16:
                long[] jArr = (long[]) obj;
                long[] jArr2 = (long[]) obj2;
                jArr[0] = jArr[0] + jArr2[0];
                jArr[1] = jArr[1] + jArr2[1];
                break;
            case 20:
                ((j$.util.x) obj).a((j$.util.x) obj2);
                break;
            default:
                long[] jArr3 = (long[]) obj;
                long[] jArr4 = (long[]) obj2;
                jArr3[0] = jArr3[0] + jArr4[0];
                jArr3[1] = jArr3[1] + jArr4[1];
                break;
        }
    }

    public /* synthetic */ Predicate and(Predicate predicate) {
        switch (this.a) {
        }
        return Predicate$CC.$default$and(this, predicate);
    }

    public /* synthetic */ BiConsumer andThen(BiConsumer biConsumer) {
        switch (this.a) {
            case 11:
                break;
            case 16:
                break;
            case 20:
                break;
        }
        return j$.time.a.b(this, biConsumer);
    }

    @Override // java.util.function.IntFunction
    public Object apply(int i) {
        switch (this.a) {
            case 7:
                return new Object[i];
            case 8:
                return new Integer[i];
            case 18:
                return Integer.valueOf(i);
            default:
                return new Long[i];
        }
    }

    @Override // java.util.function.IntBinaryOperator
    public int applyAsInt(int i, int i2) {
        switch (this.a) {
            case 9:
                return Math.min(i, i2);
            case 12:
                return i + i2;
            default:
                return Math.max(i, i2);
        }
    }

    @Override // java.util.function.LongBinaryOperator
    public long applyAsLong(long j, long j2) {
        switch (this.a) {
            case 26:
                return Math.max(j, j2);
            case 27:
                return j + j2;
            default:
                return Math.min(j, j2);
        }
    }

    @Override // java.util.function.Supplier
    public Object get() {
        switch (this.a) {
            case 0:
                return new f0();
            case 2:
                return new g0();
            case 4:
                return new h0();
            case 6:
                return new i0();
            case 14:
                return new long[2];
            default:
                return new long[2];
        }
    }

    public /* synthetic */ Predicate negate() {
        switch (this.a) {
        }
        return Predicate$CC.$default$negate(this);
    }

    public /* synthetic */ Predicate or(Predicate predicate) {
        switch (this.a) {
        }
        return Predicate$CC.$default$or(this, predicate);
    }

    @Override // java.util.function.Predicate
    public boolean test(Object obj) {
        switch (this.a) {
            case 1:
                return ((j$.util.z) obj).a;
            case 2:
            default:
                return ((Optional) obj).isPresent();
            case 3:
                return ((j$.util.a0) obj).a;
        }
    }

    @Override // java.util.function.ToIntFunction
    public int applyAsInt(Object obj) {
        return ((Integer) obj).intValue();
    }

    @Override // java.util.function.ToLongFunction
    public long applyAsLong(Object obj) {
        return ((Long) obj).longValue();
    }

    @Override // java.util.function.LongFunction
    public Object apply(long j) {
        return Long.valueOf(j);
    }

    @Override // java.util.function.ObjLongConsumer
    public void accept(Object obj, long j) {
        switch (this.a) {
            case 19:
                ((j$.util.x) obj).accept(j);
                break;
            default:
                long[] jArr = (long[]) obj;
                jArr[0] = jArr[0] + 1;
                jArr[1] = jArr[1] + j;
                break;
        }
    }

    @Override // java.util.function.ObjIntConsumer
    public void accept(Object obj, int i) {
        switch (this.a) {
            case 10:
                ((j$.util.v) obj).accept(i);
                break;
            default:
                long[] jArr = (long[]) obj;
                jArr[0] = jArr[0] + 1;
                jArr[1] = jArr[1] + ((long) i);
                break;
        }
    }
}
