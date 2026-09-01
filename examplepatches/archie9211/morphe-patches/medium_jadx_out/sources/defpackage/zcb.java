package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class zcb<T> {
    public final adb a;
    public final Object b;
    public final fdb c;

    public zcb(adb adbVar, Object obj, edb edbVar) {
        this.a = adbVar;
        this.b = obj;
        this.c = edbVar;
    }

    public static zcb a(Object obj) {
        edb edbVar = fdb.b;
        ArrayList arrayList = new ArrayList(20);
        c8a c8aVar = c8a.HTTP_1_1;
        c8aVar.getClass();
        iq1 iq1Var = new iq1(14);
        iq1Var.U("http://localhost/");
        return b(obj, new adb(new kbb(iq1Var), c8aVar, "OK", 200, null, new yi5((String[]) arrayList.toArray(new String[0])), edbVar, null, null, null, null, 0L, 0L, null, erd.i0));
    }

    public static zcb b(Object obj, adb adbVar) {
        if (adbVar.q) {
            return new zcb(adbVar, obj, null);
        }
        ay0.e("rawResponse must be successful response");
        return null;
    }

    public final String toString() {
        return this.a.toString();
    }
}
