package defpackage;

import j$.util.Map;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.function.BiConsumer;
import java.util.function.BiFunction;
import java.util.function.Function;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class cn6 extends t1 implements Map {
    public final List a;
    public final Object[] b;

    public cn6(List list, Object[] objArr) {
        list.getClass();
        this.a = list;
        this.b = objArr;
    }

    @Override // defpackage.t1
    public final Set a() {
        List list = this.a;
        ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
        int i = 0;
        for (Object obj : list) {
            int i2 = i + 1;
            if (i < 0) {
                d46.i0();
                throw null;
            }
            arrayList.add(new AbstractMap.SimpleEntry((ri6) obj, this.b[i]));
            i = i2;
        }
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        for (Object obj2 : arrayList) {
            if (((AbstractMap.SimpleEntry) obj2).getValue() != sgg.k) {
                linkedHashSet.add(obj2);
            }
        }
        return linkedHashSet;
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
    public final boolean containsKey(Object obj) {
        return (obj instanceof ri6) && this.b[((ri6) obj).b] != sgg.k;
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ void forEach(BiConsumer biConsumer) {
        Map.CC.$default$forEach(this, biConsumer);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object get(Object obj) {
        Object obj2;
        if ((obj instanceof ri6) && (obj2 = this.b[((ri6) obj).b]) != sgg.k) {
            return obj2;
        }
        return null;
    }

    @Override // java.util.Map, j$.util.Map
    public final /* bridge */ Object getOrDefault(Object obj, Object obj2) {
        return !(obj instanceof ri6) ? obj2 : Map.CC.$default$getOrDefault(this, (ri6) obj, obj2);
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ Object merge(Object obj, Object obj2, BiFunction biFunction) {
        return Map.CC.$default$merge(this, obj, obj2, biFunction);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object put(Object obj, Object obj2) {
        ((ri6) obj).getClass();
        return null;
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ Object putIfAbsent(Object obj, Object obj2) {
        return Map.CC.$default$putIfAbsent(this, obj, obj2);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final /* bridge */ Object remove(Object obj) {
        if (obj instanceof ri6) {
            return super.remove((ri6) obj);
        }
        return null;
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

    @Override // java.util.Map, j$.util.Map
    public final /* bridge */ boolean remove(Object obj, Object obj2) {
        if (obj instanceof ri6) {
            return Map.CC.$default$remove(this, (ri6) obj, obj2);
        }
        return false;
    }
}
