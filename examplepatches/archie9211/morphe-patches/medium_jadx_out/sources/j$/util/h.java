package j$.util;

import j$.util.Map;
import j$.util.concurrent.ConcurrentHashMap;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.concurrent.ConcurrentMap;
import java.util.function.BiConsumer;
import java.util.function.BiFunction;
import java.util.function.Function;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class h implements java.util.Map, Serializable, Map {
    private static final long serialVersionUID = 1978198479659022715L;
    public final java.util.Map a;
    public final h b = this;
    public transient i c;
    public transient i d;
    public transient g e;

    public h(java.util.Map map) {
        this.a = (java.util.Map) Objects.requireNonNull(map);
    }

    private void writeObject(ObjectOutputStream objectOutputStream) {
        synchronized (this.b) {
            objectOutputStream.defaultWriteObject();
        }
    }

    @Override // java.util.Map
    public final void clear() {
        synchronized (this.b) {
            this.a.clear();
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x002f, code lost:
    
        r3 = r2;
     */
    @Override // java.util.Map, j$.util.Map
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object compute(java.lang.Object r4, java.util.function.BiFunction r5) {
        /*
            r3 = this;
            j$.util.h r0 = r3.b
            monitor-enter(r0)
            java.util.Map r3 = r3.a     // Catch: java.lang.Throwable -> L41
            boolean r1 = r3 instanceof j$.util.Map     // Catch: java.lang.Throwable -> L41
            if (r1 == 0) goto L10
            j$.util.Map r3 = (j$.util.Map) r3     // Catch: java.lang.Throwable -> L41
            java.lang.Object r3 = r3.compute(r4, r5)     // Catch: java.lang.Throwable -> L41
            goto L3f
        L10:
            boolean r1 = r3 instanceof java.util.concurrent.ConcurrentMap     // Catch: java.lang.Throwable -> L41
            if (r1 == 0) goto L3b
            java.util.concurrent.ConcurrentMap r3 = (java.util.concurrent.ConcurrentMap) r3     // Catch: java.lang.Throwable -> L41
        L16:
            java.lang.Object r1 = r3.get(r4)     // Catch: java.lang.Throwable -> L41
        L1a:
            java.lang.Object r2 = r5.apply(r4, r1)     // Catch: java.lang.Throwable -> L41
            if (r2 == 0) goto L31
            if (r1 == 0) goto L29
            boolean r1 = r3.replace(r4, r1, r2)     // Catch: java.lang.Throwable -> L41
            if (r1 == 0) goto L16
            goto L2f
        L29:
            java.lang.Object r1 = r3.putIfAbsent(r4, r2)     // Catch: java.lang.Throwable -> L41
            if (r1 != 0) goto L1a
        L2f:
            r3 = r2
            goto L3f
        L31:
            if (r1 == 0) goto L39
            boolean r1 = r3.remove(r4, r1)     // Catch: java.lang.Throwable -> L41
            if (r1 == 0) goto L16
        L39:
            r3 = 0
            goto L3f
        L3b:
            java.lang.Object r3 = j$.util.Map.CC.$default$compute(r3, r4, r5)     // Catch: java.lang.Throwable -> L41
        L3f:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L41
            return r3
        L41:
            r3 = move-exception
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L41
            throw r3
        */
        throw new UnsupportedOperationException("Method not decompiled: j$.util.h.compute(java.lang.Object, java.util.function.BiFunction):java.lang.Object");
    }

    @Override // java.util.Map, j$.util.Map
    public final Object computeIfAbsent(Object obj, Function function) {
        Object obj$default$computeIfAbsent;
        Object objApply;
        synchronized (this.b) {
            java.util.Map map = this.a;
            if (map instanceof Map) {
                obj$default$computeIfAbsent = ((Map) map).computeIfAbsent(obj, function);
            } else if (map instanceof ConcurrentMap) {
                ConcurrentMap concurrentMap = (ConcurrentMap) map;
                Objects.requireNonNull(function);
                Object obj2 = concurrentMap.get(obj);
                if (obj2 != null || (objApply = function.apply(obj)) == null) {
                    obj$default$computeIfAbsent = obj2;
                } else {
                    obj$default$computeIfAbsent = concurrentMap.putIfAbsent(obj, objApply);
                    if (obj$default$computeIfAbsent == null) {
                        obj$default$computeIfAbsent = objApply;
                    }
                }
            } else {
                obj$default$computeIfAbsent = Map.CC.$default$computeIfAbsent(map, obj, function);
            }
        }
        return obj$default$computeIfAbsent;
    }

    @Override // java.util.Map, j$.util.Map
    public final Object computeIfPresent(Object obj, BiFunction biFunction) {
        Object obj$default$computeIfPresent;
        Object objApply;
        synchronized (this.b) {
            java.util.Map map = this.a;
            if (map instanceof Map) {
                obj$default$computeIfPresent = ((Map) map).computeIfPresent(obj, biFunction);
            } else if (map instanceof ConcurrentMap) {
                ConcurrentMap concurrentMap = (ConcurrentMap) map;
                Objects.requireNonNull(biFunction);
                while (true) {
                    Object obj2 = concurrentMap.get(obj);
                    if (obj2 == null) {
                        obj$default$computeIfPresent = null;
                        break;
                    }
                    objApply = biFunction.apply(obj, obj2);
                    if (objApply == null) {
                        if (concurrentMap.remove(obj, obj2)) {
                            break;
                        }
                    } else if (concurrentMap.replace(obj, obj2, objApply)) {
                        break;
                    }
                }
                obj$default$computeIfPresent = objApply;
            } else {
                obj$default$computeIfPresent = Map.CC.$default$computeIfPresent(map, obj, biFunction);
            }
        }
        return obj$default$computeIfPresent;
    }

    @Override // java.util.Map
    public final boolean containsKey(Object obj) {
        boolean zContainsKey;
        synchronized (this.b) {
            zContainsKey = this.a.containsKey(obj);
        }
        return zContainsKey;
    }

    @Override // java.util.Map
    public final boolean containsValue(Object obj) {
        boolean zContainsValue;
        synchronized (this.b) {
            zContainsValue = this.a.containsValue(obj);
        }
        return zContainsValue;
    }

    @Override // java.util.Map
    public final java.util.Set entrySet() {
        i iVar;
        synchronized (this.b) {
            try {
                iVar = this.d;
                if (iVar == null) {
                    iVar = new i(this.a.entrySet(), this.b);
                    this.d = iVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return iVar;
    }

    @Override // java.util.Map
    public final boolean equals(Object obj) {
        boolean zEquals;
        if (this == obj) {
            return true;
        }
        synchronized (this.b) {
            zEquals = this.a.equals(obj);
        }
        return zEquals;
    }

    @Override // java.util.Map, j$.util.Map
    public final void forEach(BiConsumer biConsumer) {
        synchronized (this.b) {
            Map.EL.a(this.a, biConsumer);
        }
    }

    @Override // java.util.Map
    public final Object get(Object obj) {
        Object obj2;
        synchronized (this.b) {
            obj2 = this.a.get(obj);
        }
        return obj2;
    }

    @Override // java.util.Map, j$.util.Map
    public final Object getOrDefault(Object obj, Object obj2) {
        Object orDefault;
        synchronized (this.b) {
            orDefault = Map.EL.getOrDefault(this.a, obj, obj2);
        }
        return orDefault;
    }

    @Override // java.util.Map
    public final int hashCode() {
        int iHashCode;
        synchronized (this.b) {
            iHashCode = this.a.hashCode();
        }
        return iHashCode;
    }

    @Override // java.util.Map
    public final boolean isEmpty() {
        boolean zIsEmpty;
        synchronized (this.b) {
            zIsEmpty = this.a.isEmpty();
        }
        return zIsEmpty;
    }

    @Override // java.util.Map
    public final java.util.Set keySet() {
        i iVar;
        synchronized (this.b) {
            try {
                iVar = this.c;
                if (iVar == null) {
                    iVar = new i(this.a.keySet(), this.b);
                    this.c = iVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return iVar;
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0022, code lost:
    
        r2 = r6.apply(r1, r5);
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x0026, code lost:
    
        if (r2 == null) goto L32;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x002c, code lost:
    
        if (r3.replace(r4, r1, r2) == false) goto L38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x002e, code lost:
    
        r5 = r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0034, code lost:
    
        if (r3.remove(r4, r1) == false) goto L37;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0036, code lost:
    
        r5 = null;
     */
    @Override // java.util.Map, j$.util.Map
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object merge(java.lang.Object r4, java.lang.Object r5, java.util.function.BiFunction r6) {
        /*
            r3 = this;
            j$.util.h r0 = r3.b
            monitor-enter(r0)
            java.util.Map r3 = r3.a     // Catch: java.lang.Throwable -> L45
            boolean r1 = r3 instanceof j$.util.Map     // Catch: java.lang.Throwable -> L45
            if (r1 == 0) goto L10
            j$.util.Map r3 = (j$.util.Map) r3     // Catch: java.lang.Throwable -> L45
            java.lang.Object r5 = r3.merge(r4, r5, r6)     // Catch: java.lang.Throwable -> L45
            goto L43
        L10:
            boolean r1 = r3 instanceof java.util.concurrent.ConcurrentMap     // Catch: java.lang.Throwable -> L45
            if (r1 == 0) goto L3f
            java.util.concurrent.ConcurrentMap r3 = (java.util.concurrent.ConcurrentMap) r3     // Catch: java.lang.Throwable -> L45
            j$.util.Objects.requireNonNull(r6)     // Catch: java.lang.Throwable -> L45
            j$.util.Objects.requireNonNull(r5)     // Catch: java.lang.Throwable -> L45
        L1c:
            java.lang.Object r1 = r3.get(r4)     // Catch: java.lang.Throwable -> L45
        L20:
            if (r1 == 0) goto L38
            java.lang.Object r2 = r6.apply(r1, r5)     // Catch: java.lang.Throwable -> L45
            if (r2 == 0) goto L30
            boolean r1 = r3.replace(r4, r1, r2)     // Catch: java.lang.Throwable -> L45
            if (r1 == 0) goto L1c
            r5 = r2
            goto L43
        L30:
            boolean r1 = r3.remove(r4, r1)     // Catch: java.lang.Throwable -> L45
            if (r1 == 0) goto L1c
            r5 = 0
            goto L43
        L38:
            java.lang.Object r1 = r3.putIfAbsent(r4, r5)     // Catch: java.lang.Throwable -> L45
            if (r1 != 0) goto L20
            goto L43
        L3f:
            java.lang.Object r5 = j$.util.Map.CC.$default$merge(r3, r4, r5, r6)     // Catch: java.lang.Throwable -> L45
        L43:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L45
            return r5
        L45:
            r3 = move-exception
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L45
            throw r3
        */
        throw new UnsupportedOperationException("Method not decompiled: j$.util.h.merge(java.lang.Object, java.lang.Object, java.util.function.BiFunction):java.lang.Object");
    }

    @Override // java.util.Map
    public final Object put(Object obj, Object obj2) {
        Object objPut;
        synchronized (this.b) {
            objPut = this.a.put(obj, obj2);
        }
        return objPut;
    }

    @Override // java.util.Map
    public final void putAll(java.util.Map map) {
        synchronized (this.b) {
            this.a.putAll(map);
        }
    }

    @Override // java.util.Map, j$.util.Map
    public final Object putIfAbsent(Object obj, Object obj2) {
        Object objB;
        synchronized (this.b) {
            objB = Map.EL.b(this.a, obj, obj2);
        }
        return objB;
    }

    @Override // java.util.Map, j$.util.Map
    public final boolean remove(Object obj, Object obj2) {
        boolean zRemove;
        synchronized (this.b) {
            java.util.Map map = this.a;
            zRemove = map instanceof Map ? ((Map) map).remove(obj, obj2) : Map.CC.$default$remove(map, obj, obj2);
        }
        return zRemove;
    }

    @Override // java.util.Map, j$.util.Map
    public final boolean replace(Object obj, Object obj2, Object obj3) {
        boolean zReplace;
        synchronized (this.b) {
            java.util.Map map = this.a;
            zReplace = map instanceof Map ? ((Map) map).replace(obj, obj2, obj3) : Map.CC.$default$replace(map, obj, obj2, obj3);
        }
        return zReplace;
    }

    @Override // java.util.Map, j$.util.Map
    public final void replaceAll(BiFunction biFunction) {
        synchronized (this.b) {
            java.util.Map map = this.a;
            if (map instanceof Map) {
                ((Map) map).replaceAll(biFunction);
            } else if (map instanceof ConcurrentMap) {
                ConcurrentMap concurrentMap = (ConcurrentMap) map;
                Objects.requireNonNull(biFunction);
                j$.time.format.v vVar = new j$.time.format.v(1, concurrentMap, biFunction);
                if (concurrentMap instanceof ConcurrentHashMap) {
                    ((ConcurrentHashMap) concurrentMap).forEach(vVar);
                } else {
                    j$.time.a.k(concurrentMap, vVar);
                }
            } else {
                Map.CC.$default$replaceAll(map, biFunction);
            }
        }
    }

    @Override // java.util.Map
    public final int size() {
        int size;
        synchronized (this.b) {
            size = this.a.size();
        }
        return size;
    }

    public final String toString() {
        String string;
        synchronized (this.b) {
            string = this.a.toString();
        }
        return string;
    }

    @Override // java.util.Map
    public final java.util.Collection values() {
        g gVar;
        synchronized (this.b) {
            try {
                gVar = this.e;
                if (gVar == null) {
                    gVar = new g(this.a.values(), this.b);
                    this.e = gVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return gVar;
    }

    @Override // java.util.Map
    public final Object remove(Object obj) {
        Object objRemove;
        synchronized (this.b) {
            objRemove = this.a.remove(obj);
        }
        return objRemove;
    }

    @Override // java.util.Map, j$.util.Map
    public final Object replace(Object obj, Object obj2) {
        Object objReplace;
        synchronized (this.b) {
            java.util.Map map = this.a;
            objReplace = map instanceof Map ? ((Map) map).replace(obj, obj2) : Map.CC.$default$replace(map, obj, obj2);
        }
        return objReplace;
    }
}
