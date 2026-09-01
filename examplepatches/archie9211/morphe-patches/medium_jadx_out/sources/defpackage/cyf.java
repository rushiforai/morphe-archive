package defpackage;

import j$.util.Map;
import java.io.Serializable;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.function.BiConsumer;
import java.util.function.BiFunction;
import java.util.function.Function;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class cyf implements Map, Serializable, j$.util.Map {
    public transient syf a;
    public transient tyf b;
    public transient wyf c;

    @Override // java.util.Map
    public final void clear() {
        throw new UnsupportedOperationException();
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

    @Override // java.util.Map
    public final boolean containsKey(Object obj) {
        return get(obj) != null;
    }

    @Override // java.util.Map
    public final boolean containsValue(Object obj) {
        wyf wyfVar = this.c;
        if (wyfVar == null) {
            yyf yyfVar = (yyf) this;
            wyf wyfVar2 = new wyf(1, yyfVar.f, yyfVar.e);
            this.c = wyfVar2;
            wyfVar = wyfVar2;
        }
        return wyfVar.contains(obj);
    }

    @Override // java.util.Map
    public final Set entrySet() {
        syf syfVar = this.a;
        if (syfVar != null) {
            return syfVar;
        }
        yyf yyfVar = (yyf) this;
        syf syfVar2 = new syf(yyfVar, yyfVar.e, yyfVar.f);
        this.a = syfVar2;
        return syfVar2;
    }

    @Override // java.util.Map
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof java.util.Map) {
            return entrySet().equals(((java.util.Map) obj).entrySet());
        }
        return false;
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ void forEach(BiConsumer biConsumer) {
        Map.CC.$default$forEach(this, biConsumer);
    }

    @Override // java.util.Map
    public abstract Object get(Object obj);

    @Override // java.util.Map, j$.util.Map
    public final Object getOrDefault(Object obj, Object obj2) {
        Object obj3 = get(obj);
        return obj3 != null ? obj3 : obj2;
    }

    @Override // java.util.Map
    public final int hashCode() {
        syf syfVar = this.a;
        if (syfVar == null) {
            yyf yyfVar = (yyf) this;
            syf syfVar2 = new syf(yyfVar, yyfVar.e, yyfVar.f);
            this.a = syfVar2;
            syfVar = syfVar2;
        }
        Iterator it2 = syfVar.iterator();
        int iHashCode = 0;
        while (it2.hasNext()) {
            Object next = it2.next();
            iHashCode += next != null ? next.hashCode() : 0;
        }
        return iHashCode;
    }

    @Override // java.util.Map
    public final boolean isEmpty() {
        return ((yyf) this).size() == 0;
    }

    @Override // java.util.Map
    public final Set keySet() {
        tyf tyfVar = this.b;
        if (tyfVar != null) {
            return tyfVar;
        }
        yyf yyfVar = (yyf) this;
        tyf tyfVar2 = new tyf(yyfVar, new wyf(0, yyfVar.f, yyfVar.e));
        this.b = tyfVar2;
        return tyfVar2;
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ Object merge(Object obj, Object obj2, BiFunction biFunction) {
        return Map.CC.$default$merge(this, obj, obj2, biFunction);
    }

    @Override // java.util.Map
    public final Object put(Object obj, Object obj2) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    public final void putAll(java.util.Map map) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ Object putIfAbsent(Object obj, Object obj2) {
        return Map.CC.$default$putIfAbsent(this, obj, obj2);
    }

    @Override // java.util.Map
    public final Object remove(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ Object replace(Object obj, Object obj2) {
        return Map.CC.$default$replace(this, obj, obj2);
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ void replaceAll(BiFunction biFunction) {
        Map.CC.$default$replaceAll(this, biFunction);
    }

    public final String toString() {
        int i = ((yyf) this).f;
        if (i < 0) {
            ay0.e(b09.w(i, "size cannot be negative but was: "));
            return null;
        }
        StringBuilder sb = new StringBuilder((int) Math.min(((long) i) * 8, 1073741824L));
        sb.append('{');
        boolean z = true;
        for (Map.Entry entry : (syf) entrySet()) {
            if (!z) {
                sb.append(", ");
            }
            sb.append(entry.getKey());
            sb.append('=');
            sb.append(entry.getValue());
            z = false;
        }
        sb.append('}');
        return sb.toString();
    }

    @Override // java.util.Map
    public final Collection values() {
        wyf wyfVar = this.c;
        if (wyfVar != null) {
            return wyfVar;
        }
        yyf yyfVar = (yyf) this;
        wyf wyfVar2 = new wyf(1, yyfVar.f, yyfVar.e);
        this.c = wyfVar2;
        return wyfVar2;
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ boolean replace(Object obj, Object obj2, Object obj3) {
        return Map.CC.$default$replace(this, obj, obj2, obj3);
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ boolean remove(Object obj, Object obj2) {
        return Map.CC.$default$remove(this, obj, obj2);
    }
}
