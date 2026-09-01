package defpackage;

import j$.util.Map;
import java.util.Collection;
import java.util.Set;
import java.util.function.BiConsumer;
import java.util.function.BiFunction;
import java.util.function.Function;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class m89 extends t1 implements Map {
    public no3 a;
    public zsd b;
    public Object c;
    public int d;
    public int e;

    @Override // defpackage.t1
    public final Set a() {
        return new o89(0, this);
    }

    @Override // defpackage.t1
    public final Set b() {
        return new o89(1, this);
    }

    @Override // defpackage.t1
    public final int c() {
        return this.e;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final void clear() {
        this.b = zsd.e;
        f(0);
    }

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

    @Override // java.util.AbstractMap, java.util.Map
    public boolean containsKey(Object obj) {
        return this.b.d(obj != null ? obj.hashCode() : 0, 0, obj);
    }

    @Override // defpackage.t1
    public final Collection d() {
        return new fh7(1, this);
    }

    public final void f(int i) {
        this.e = i;
        this.d++;
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ void forEach(BiConsumer biConsumer) {
        Map.CC.$default$forEach(this, biConsumer);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public Object get(Object obj) {
        return this.b.g(obj != null ? obj.hashCode() : 0, 0, obj);
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ Object getOrDefault(Object obj, Object obj2) {
        return Map.CC.$default$getOrDefault(this, obj, obj2);
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ Object merge(Object obj, Object obj2, BiFunction biFunction) {
        return Map.CC.$default$merge(this, obj, obj2, biFunction);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object put(Object obj, Object obj2) {
        this.c = null;
        this.b = this.b.l(obj != null ? obj.hashCode() : 0, obj, obj2, 0, this);
        return this.c;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final void putAll(java.util.Map map) {
        k89 k89VarH = null;
        k89 k89Var = map instanceof k89 ? (k89) map : null;
        if (k89Var == null) {
            m89 m89Var = map instanceof m89 ? (m89) map : null;
            if (m89Var != null) {
                k89VarH = ((h89) m89Var).h();
            }
        } else {
            k89VarH = k89Var;
        }
        if (k89VarH == null) {
            super.putAll(map);
            return;
        }
        b73 b73Var = new b73();
        b73Var.a = 0;
        int i = this.e;
        zsd zsdVar = this.b;
        zsd zsdVar2 = k89VarH.a;
        zsdVar2.getClass();
        this.b = zsdVar.m(zsdVar2, 0, b73Var, this);
        int i2 = (k89VarH.b + i) - b73Var.a;
        if (i != i2) {
            f(i2);
        }
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ Object putIfAbsent(Object obj, Object obj2) {
        return Map.CC.$default$putIfAbsent(this, obj, obj2);
    }

    @Override // java.util.Map, j$.util.Map
    public final boolean remove(Object obj, Object obj2) {
        int iC = c();
        zsd zsdVarO = this.b.o(obj != null ? obj.hashCode() : 0, obj, obj2, 0, this);
        if (zsdVarO == null) {
            zsdVarO = zsd.e;
        }
        this.b = zsdVarO;
        return iC != c();
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ Object replace(Object obj, Object obj2) {
        return Map.CC.$default$replace(this, obj, obj2);
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ void replaceAll(BiFunction biFunction) {
        Map.CC.$default$replaceAll(this, biFunction);
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ boolean replace(Object obj, Object obj2, Object obj3) {
        return Map.CC.$default$replace(this, obj, obj2, obj3);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public Object remove(Object obj) {
        this.c = null;
        zsd zsdVarN = this.b.n(obj != null ? obj.hashCode() : 0, obj, 0, this);
        if (zsdVarN == null) {
            zsdVarN = zsd.e;
        }
        this.b = zsdVarN;
        return this.c;
    }
}
