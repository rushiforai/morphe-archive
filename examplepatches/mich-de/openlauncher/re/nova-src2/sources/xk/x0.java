package xk;

import java.io.Serializable;
import java.util.Collection;
import java.util.Map;
import java.util.Set;
import java.util.SortedMap;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public abstract class x0 implements Map, Serializable {

    /* renamed from: a, reason: collision with root package name */
    public transient d1 f96052a;

    /* renamed from: b, reason: collision with root package name */
    public transient d1 f96053b;

    /* renamed from: c, reason: collision with root package name */
    public transient q0 f96054c;

    public static c30.c a() {
        return new c30.c(4);
    }

    public static c30.c b(int i5) {
        w20.e.e(i5, "expectedSize");
        return new c30.c(i5);
    }

    public static x0 c(Map map) {
        if ((map instanceof x0) && !(map instanceof SortedMap)) {
            x0 x0Var = (x0) map;
            if (!x0Var.h()) {
                return x0Var;
            }
        }
        Set setEntrySet = map.entrySet();
        c30.c cVar = new c30.c(setEntrySet instanceof Collection ? setEntrySet.size() : 4);
        cVar.q(setEntrySet);
        return cVar.c(true);
    }

    @Override // java.util.Map
    public final void clear() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    public final boolean containsKey(Object obj) {
        return get(obj) != null;
    }

    @Override // java.util.Map
    public final boolean containsValue(Object obj) {
        return values().contains(obj);
    }

    public abstract d1 d();

    public abstract d1 e();

    @Override // java.util.Map
    public final boolean equals(Object obj) {
        return vm.d.f(obj, this);
    }

    public abstract q0 f();

    @Override // java.util.Map, java.util.SortedMap
    /* renamed from: g, reason: merged with bridge method [inline-methods] */
    public d1 entrySet() {
        d1 d1Var = this.f96052a;
        if (d1Var != null) {
            return d1Var;
        }
        d1 d1VarD = d();
        this.f96052a = d1VarD;
        return d1VarD;
    }

    @Override // java.util.Map
    public abstract Object get(Object obj);

    @Override // java.util.Map
    public final Object getOrDefault(Object obj, Object obj2) {
        Object obj3 = get(obj);
        return obj3 != null ? obj3 : obj2;
    }

    public abstract boolean h();

    @Override // java.util.Map
    public final int hashCode() {
        return w.l(entrySet());
    }

    @Override // java.util.Map, java.util.SortedMap
    /* renamed from: i, reason: merged with bridge method [inline-methods] */
    public d1 keySet() {
        d1 d1Var = this.f96053b;
        if (d1Var != null) {
            return d1Var;
        }
        d1 d1VarE = e();
        this.f96053b = d1VarE;
        return d1VarE;
    }

    @Override // java.util.Map
    public final boolean isEmpty() {
        return size() == 0;
    }

    @Override // java.util.Map, java.util.SortedMap
    /* renamed from: j, reason: merged with bridge method [inline-methods] */
    public q0 values() {
        q0 q0Var = this.f96054c;
        if (q0Var != null) {
            return q0Var;
        }
        q0 q0VarF = f();
        this.f96054c = q0VarF;
        return q0VarF;
    }

    @Override // java.util.Map
    public final Object put(Object obj, Object obj2) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    public final void putAll(Map map) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    public final Object remove(Object obj) {
        throw new UnsupportedOperationException();
    }

    public final String toString() {
        StringBuilder sbV = w.v(size());
        sbV.append(AbstractJsonLexerKt.BEGIN_OBJ);
        boolean z11 = true;
        for (Map.Entry entry : entrySet()) {
            if (!z11) {
                sbV.append(", ");
            }
            sbV.append(entry.getKey());
            sbV.append('=');
            sbV.append(entry.getValue());
            z11 = false;
        }
        sbV.append(AbstractJsonLexerKt.END_OBJ);
        return sbV.toString();
    }
}
