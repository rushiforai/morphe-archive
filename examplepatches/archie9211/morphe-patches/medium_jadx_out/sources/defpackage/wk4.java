package defpackage;

import j$.util.DesugarCollections;
import java.util.LinkedHashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wk4 {
    public static final wk4 a = new wk4();
    public static final Map b = DesugarCollections.synchronizedMap(new LinkedHashMap());

    public static uk4 a(k1c k1cVar) {
        Map map = b;
        map.getClass();
        Object obj = map.get(k1cVar);
        if (obj != null) {
            return (uk4) obj;
        }
        rd6.w("Cannot get dependency ", k1cVar, ". Dependencies should be added at class load time.");
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0065  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x00a7  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x00ac  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x00b4 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:20:0x009b -> B:21:0x009c). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(defpackage.p92 r10) {
        /*
            r9 = this;
            boolean r0 = r10 instanceof defpackage.vk4
            if (r0 == 0) goto L13
            r0 = r10
            vk4 r0 = (defpackage.vk4) r0
            int r1 = r0.i
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.i = r1
            goto L18
        L13:
            vk4 r0 = new vk4
            r0.<init>(r9, r10)
        L18:
            java.lang.Object r9 = r0.g
            tb2 r10 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r0.i
            r2 = 0
            r3 = 1
            if (r1 == 0) goto L3e
            if (r1 != r3) goto L38
            java.lang.Object r1 = r0.f
            java.util.Map r4 = r0.e
            java.util.Map r4 = (java.util.Map) r4
            k1c r5 = r0.d
            java.util.Iterator r6 = r0.c
            java.util.Iterator r6 = (java.util.Iterator) r6
            java.util.Map r7 = r0.b
            java.util.Map r7 = (java.util.Map) r7
            defpackage.br7.v(r9)
            goto L9c
        L38:
            java.lang.String r9 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r9)
            return r2
        L3e:
            defpackage.br7.v(r9)
            java.util.Map r9 = defpackage.wk4.b
            r9.getClass()
            java.util.LinkedHashMap r1 = new java.util.LinkedHashMap
            int r4 = r9.size()
            int r4 = defpackage.ei7.P(r4)
            r1.<init>(r4)
            java.util.Set r9 = r9.entrySet()
            java.lang.Iterable r9 = (java.lang.Iterable) r9
            java.util.Iterator r9 = r9.iterator()
            r6 = r9
            r4 = r1
        L5f:
            boolean r9 = r6.hasNext()
            if (r9 == 0) goto Lb4
            java.lang.Object r9 = r6.next()
            java.util.Map$Entry r9 = (java.util.Map.Entry) r9
            java.lang.Object r1 = r9.getKey()
            java.lang.Object r5 = r9.getKey()
            k1c r5 = (defpackage.k1c) r5
            java.lang.Object r9 = r9.getValue()
            uk4 r9 = (defpackage.uk4) r9
            nh2 r7 = new nh2
            r8 = 29
            r7.<init>(r8, r9)
            r9 = r4
            java.util.Map r9 = (java.util.Map) r9
            r0.b = r9
            r8 = r6
            java.util.Iterator r8 = (java.util.Iterator) r8
            r0.c = r8
            r0.d = r5
            r0.e = r9
            r0.f = r1
            r0.i = r3
            java.lang.Object r9 = defpackage.flb.x0(r7, r0)
            if (r9 != r10) goto L9b
            return r10
        L9b:
            r7 = r4
        L9c:
            r5.getClass()
            uk4 r9 = a(r5)
            gc2 r9 = r9.b
            if (r9 == 0) goto Lac
            r4.put(r1, r9)
            r4 = r7
            goto L5f
        Lac:
            java.lang.String r9 = "Subscriber "
            java.lang.String r10 = " has not been registered."
            defpackage.rd6.w(r9, r5, r10)
            return r2
        Lb4:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wk4.b(p92):java.lang.Object");
    }
}
