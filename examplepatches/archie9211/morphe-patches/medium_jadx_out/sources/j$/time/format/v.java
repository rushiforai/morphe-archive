package j$.time.format;

import j$.util.Spliterator;
import j$.util.concurrent.ConcurrentHashMap;
import j$.util.stream.e8;
import j$.util.stream.h7;
import j$.util.stream.n1;
import j$.util.stream.r1;
import j$.util.stream.s1;
import j$.util.stream.t1;
import j$.util.stream.y6;
import j$.util.stream.z6;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.function.BiConsumer;
import java.util.function.BiFunction;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.function.Supplier;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class v implements BiConsumer, BiFunction, Consumer, Supplier, e8 {
    public final /* synthetic */ int a;
    public final Object b;
    public final Object c;

    public v(Map map) {
        this.a = 0;
        this.b = map;
        HashMap map2 = new HashMap();
        ArrayList arrayList = new ArrayList();
        for (Map.Entry entry : map.entrySet()) {
            HashMap map3 = new HashMap();
            for (Map.Entry entry2 : ((Map) entry.getValue()).entrySet()) {
                String str = (String) entry2.getValue();
                String str2 = (String) entry2.getValue();
                Long l = (Long) entry2.getKey();
                u uVar = b.b;
                map3.put(str, new AbstractMap.SimpleImmutableEntry(str2, l));
            }
            ArrayList arrayList2 = new ArrayList(map3.values());
            Collections.sort(arrayList2, b.b);
            map2.put((a0) entry.getKey(), arrayList2);
            arrayList.addAll(arrayList2);
            map2.put(null, arrayList);
        }
        Collections.sort(arrayList, b.b);
        this.c = map2;
    }

    @Override // j$.util.stream.e8
    public Object a(j$.util.stream.a aVar, Spliterator spliterator) {
        r1 r1Var = (r1) ((Supplier) this.c).get();
        aVar.R(spliterator, r1Var);
        return Boolean.valueOf(r1Var.b);
    }

    @Override // java.util.function.Consumer
    public void accept(Object obj) {
        int i = this.a;
        Object obj2 = this.c;
        Object obj3 = this.b;
        switch (i) {
            case 4:
                ((Consumer) obj3).accept(obj);
                ((Consumer) obj2).accept(obj);
                break;
            case 5:
                AtomicBoolean atomicBoolean = (AtomicBoolean) obj3;
                ConcurrentHashMap concurrentHashMap = (ConcurrentHashMap) obj2;
                if (obj != null) {
                    concurrentHashMap.putIfAbsent(obj, Boolean.TRUE);
                } else {
                    atomicBoolean.set(true);
                }
                break;
            case 6:
            case 7:
            default:
                Consumer consumer = (Consumer) obj2;
                if (((h7) obj3).b.putIfAbsent(obj != null ? obj : h7.d, Boolean.TRUE) == null) {
                    consumer.accept(obj);
                }
                break;
            case 8:
                ((BiConsumer) obj3).accept(obj2, obj);
                break;
        }
    }

    public /* synthetic */ Consumer andThen(Consumer consumer) {
        switch (this.a) {
        }
        return j$.time.a.d(this, consumer);
    }

    @Override // java.util.function.BiFunction
    public Object apply(Object obj, Object obj2) {
        return ((Function) this.c).apply(((BiFunction) this.b).apply(obj, obj2));
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // j$.util.stream.e8
    public Object b(j$.util.stream.a aVar, Spliterator spliterator) {
        return (Boolean) new t1(this, aVar, spliterator).invoke();
    }

    @Override // j$.util.stream.e8
    public int f() {
        return y6.u | y6.r;
    }

    public String g(long j, a0 a0Var) {
        Map map = (Map) ((Map) this.b).get(a0Var);
        if (map != null) {
            return (String) map.get(Long.valueOf(j));
        }
        return null;
    }

    @Override // java.util.function.Supplier
    public Object get() {
        return new n1((s1) this.b, (Predicate) this.c);
    }

    public /* synthetic */ BiFunction andThen(Function function) {
        return j$.time.a.c(this, function);
    }

    public /* synthetic */ BiConsumer andThen(BiConsumer biConsumer) {
        switch (this.a) {
        }
        return j$.time.a.b(this, biConsumer);
    }

    @Override // java.util.function.BiConsumer
    public void accept(Object obj, Object obj2) {
        int i = this.a;
        Object obj3 = this.c;
        Object obj4 = this.b;
        switch (i) {
            case 1:
                ConcurrentMap concurrentMap = (ConcurrentMap) obj4;
                BiFunction biFunction = (BiFunction) obj3;
                while (!concurrentMap.replace(obj, obj2, biFunction.apply(obj, obj2)) && (obj2 = concurrentMap.get(obj)) != null) {
                }
                break;
            default:
                ((BiConsumer) obj4).accept(obj, obj2);
                ((BiConsumer) obj3).accept(obj, obj2);
                break;
        }
    }

    public v(z6 z6Var, s1 s1Var, Supplier supplier) {
        this.a = 7;
        this.b = s1Var;
        this.c = supplier;
    }

    public /* synthetic */ v(int i, Object obj, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }
}
