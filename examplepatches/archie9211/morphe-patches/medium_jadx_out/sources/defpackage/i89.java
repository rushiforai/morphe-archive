package defpackage;

import j$.util.Map;
import java.util.function.BiConsumer;
import java.util.function.BiFunction;
import java.util.function.Function;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i89 extends k89 implements w22, t22, Map {
    public static final i89 d = new i89(zsd.e, 0);

    public final i89 b(d8a d8aVar, gqe gqeVar) {
        ad adVarU = this.a.u(d8aVar, d8aVar.hashCode(), gqeVar, 0);
        return adVarU == null ? this : new i89((zsd) adVarU.c, this.b + adVarU.b);
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

    @Override // defpackage.k89, java.util.Map
    public final /* bridge */ boolean containsKey(Object obj) {
        if (obj instanceof d8a) {
            return super.containsKey((d8a) obj);
        }
        return false;
    }

    @Override // defpackage.k89, java.util.Map
    public final /* bridge */ boolean containsValue(Object obj) {
        if (obj instanceof gqe) {
            return super.containsValue((gqe) obj);
        }
        return false;
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ void forEach(BiConsumer biConsumer) {
        Map.CC.$default$forEach(this, biConsumer);
    }

    @Override // defpackage.k89, java.util.Map
    public final /* bridge */ Object get(Object obj) {
        if (obj instanceof d8a) {
            return (gqe) super.get((d8a) obj);
        }
        return null;
    }

    @Override // java.util.Map, j$.util.Map
    public final /* bridge */ Object getOrDefault(Object obj, Object obj2) {
        return !(obj instanceof d8a) ? obj2 : (gqe) Map.CC.$default$getOrDefault(this, (d8a) obj, (gqe) obj2);
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ Object merge(Object obj, Object obj2, BiFunction biFunction) {
        return Map.CC.$default$merge(this, obj, obj2, biFunction);
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ Object putIfAbsent(Object obj, Object obj2) {
        return Map.CC.$default$putIfAbsent(this, obj, obj2);
    }

    @Override // java.util.Map, j$.util.Map
    public /* synthetic */ boolean remove(Object obj, Object obj2) {
        return Map.CC.$default$remove(this, obj, obj2);
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
}
