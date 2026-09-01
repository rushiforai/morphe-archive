package defpackage;

import j$.util.concurrent.ConcurrentHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class v4g {
    public static final ConcurrentHashMap a = new ConcurrentHashMap();

    public static final void a(int i, long j) {
        Integer numValueOf = Integer.valueOf(i);
        ConcurrentHashMap concurrentHashMap = a;
        Object o4gVar = concurrentHashMap.get(numValueOf);
        if (o4gVar == null) {
            o4gVar = new o4g();
        }
        o4g o4gVar2 = (o4g) o4gVar;
        o4gVar2.a++;
        o4gVar2.b += j;
        o4gVar2.c = Math.max(j, o4gVar2.c);
        concurrentHashMap.put(numValueOf, o4gVar2);
    }
}
