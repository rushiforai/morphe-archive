package defpackage;

import j$.util.Map;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.function.BiConsumer;
import java.util.function.BiFunction;
import java.util.function.Function;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y70 extends aec implements Map, j$.util.Map {
    public s70 d;
    public u70 e;
    public w70 f;

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ Object compute(Object obj, BiFunction biFunction) {
        return Map.CC.$default$compute(this, obj, biFunction);
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ Object computeIfAbsent(Object obj, Function function) {
        return Map.CC.$default$computeIfAbsent(this, obj, function);
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ Object computeIfPresent(Object obj, BiFunction biFunction) {
        return Map.CC.$default$computeIfPresent(this, obj, biFunction);
    }

    @Override // java.util.Map
    public final Set entrySet() {
        s70 s70Var = this.d;
        if (s70Var != null) {
            return s70Var;
        }
        s70 s70Var2 = new s70(0, this);
        this.d = s70Var2;
        return s70Var2;
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ void forEach(BiConsumer biConsumer) {
        Map.CC.$default$forEach(this, biConsumer);
    }

    public final boolean j(Collection collection) {
        Iterator it2 = collection.iterator();
        while (it2.hasNext()) {
            if (!super.containsKey(it2.next())) {
                return false;
            }
        }
        return true;
    }

    public final boolean k(Collection collection) {
        int i = this.c;
        Iterator it2 = collection.iterator();
        while (it2.hasNext()) {
            super.remove(it2.next());
        }
        return i != this.c;
    }

    @Override // java.util.Map
    public final Set keySet() {
        u70 u70Var = this.e;
        if (u70Var != null) {
            return u70Var;
        }
        u70 u70Var2 = new u70(this);
        this.e = u70Var2;
        return u70Var2;
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ Object merge(Object obj, Object obj2, BiFunction biFunction) {
        return Map.CC.$default$merge(this, obj, obj2, biFunction);
    }

    @Override // java.util.Map
    public final void putAll(java.util.Map map) {
        int size = map.size() + this.c;
        int i = this.c;
        int[] iArr = this.a;
        if (iArr.length < size) {
            this.a = Arrays.copyOf(iArr, size);
            this.b = Arrays.copyOf(this.b, size * 2);
        }
        if (this.c != i) {
            z10.g();
        }
        for (Map.Entry entry : map.entrySet()) {
            put(entry.getKey(), entry.getValue());
        }
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ void replaceAll(BiFunction biFunction) {
        Map.CC.$default$replaceAll(this, biFunction);
    }

    @Override // java.util.Map
    public final Collection values() {
        w70 w70Var = this.f;
        if (w70Var != null) {
            return w70Var;
        }
        w70 w70Var2 = new w70(this);
        this.f = w70Var2;
        return w70Var2;
    }
}
