package defpackage;

import java.net.InetAddress;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vlb implements oi3 {
    public static final long e;
    public final oi3 a;
    public final long b;
    public final rv8 c;
    public final LinkedHashMap d;

    static {
        int i = in3.d;
        e = hlg.T(30, mn3.MINUTES);
    }

    public vlb(rv8 rv8Var) {
        rv8Var.getClass();
        this.a = oi3.c0;
        this.b = e;
        this.c = rv8Var;
        this.d = new LinkedHashMap();
    }

    public static List a(List list) {
        List listM1;
        synchronized (list) {
            listM1 = bu1.m1(list);
        }
        return listM1;
    }

    @Override // defpackage.oi3
    public final List b(String str) {
        str.getClass();
        ulb ulbVar = (ulb) this.d.get(str);
        if (ulbVar != null) {
            this.c.getClass();
            long jNanoTime = System.nanoTime();
            int i = in3.d;
            if (in3.c(hlg.U(jNanoTime - ulbVar.c, mn3.NANOSECONDS), this.b) < 0 && !ulbVar.b.isEmpty()) {
                synchronized (ulbVar.b) {
                    ArrayList arrayList = ulbVar.b;
                    InetAddress inetAddress = (InetAddress) (arrayList.isEmpty() ? null : arrayList.remove(0));
                    if (inetAddress != null) {
                        ulbVar.b.add(inetAddress);
                    }
                }
                return a(ulbVar.b);
            }
        }
        List listB = this.a.b(str);
        LinkedHashMap linkedHashMap = this.d;
        ArrayList arrayList2 = new ArrayList(listB);
        this.c.getClass();
        linkedHashMap.put(str, new ulb(str, arrayList2, System.nanoTime()));
        return a(listB);
    }
}
