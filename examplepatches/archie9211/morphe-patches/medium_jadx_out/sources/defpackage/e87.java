package defpackage;

import j$.util.concurrent.ConcurrentHashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e87 {
    public final x77 a;
    public final ConcurrentHashMap b = new ConcurrentHashMap();
    public final CopyOnWriteArraySet c = new CopyOnWriteArraySet();

    public e87(x77 x77Var) {
        this.a = x77Var;
    }

    public static void b(e87 e87Var, int i, String str, Throwable th, LinkedHashMap linkedHashMap) {
        str.getClass();
        LinkedHashMap linkedHashMap2 = new LinkedHashMap();
        linkedHashMap2.putAll(e87Var.b);
        linkedHashMap2.putAll(linkedHashMap);
        e87Var.a.i(i, str, th, linkedHashMap2, new HashSet(e87Var.c));
    }

    public final void a(String str, Object obj) {
        ConcurrentHashMap concurrentHashMap = this.b;
        if (obj == null) {
            concurrentHashMap.put(str, s42.g);
        } else {
            concurrentHashMap.put(str, obj);
        }
    }
}
