package defpackage;

import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class b4 implements Runnable {
    public final /* synthetic */ e4 a;
    public final /* synthetic */ w3 b;
    public final /* synthetic */ AtomicBoolean c;
    public final /* synthetic */ HashSet d;
    public final /* synthetic */ HashSet e;
    public final /* synthetic */ HashSet f;
    public final /* synthetic */ iq1 g;

    public /* synthetic */ b4(e4 e4Var, w3 w3Var, AtomicBoolean atomicBoolean, HashSet hashSet, HashSet hashSet2, HashSet hashSet3, iq1 iq1Var) {
        this.a = e4Var;
        this.b = w3Var;
        this.c = atomicBoolean;
        this.d = hashSet;
        this.e = hashSet2;
        this.f = hashSet3;
        this.g = iq1Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        long j;
        Date date;
        w3 w3Var = this.b;
        AtomicBoolean atomicBoolean = this.c;
        AtomicBoolean atomicBoolean2 = (AtomicBoolean) this.g.e;
        e4 e4Var = this.a;
        String str = (String) e4Var.a;
        int i = e4Var.c;
        Long l = (Long) e4Var.e;
        String str2 = (String) e4Var.b;
        try {
            y3b y3bVar = iq1.i;
            if (((w3) y3bVar.t().d) != null) {
                w3 w3Var2 = (w3) y3bVar.t().d;
                if ((w3Var2 != null ? w3Var2.i : null) == w3Var.i) {
                    if (!atomicBoolean.get() && str == null && i == 0) {
                        atomicBoolean2.set(false);
                        return;
                    }
                    Date date2 = w3Var.a;
                    if (e4Var.c != 0) {
                        date = new Date(((long) e4Var.c) * 1000);
                        j = 1000;
                    } else {
                        if (e4Var.d != 0) {
                            j = 1000;
                            date2 = new Date((((long) e4Var.d) * 1000) + new Date().getTime());
                        } else {
                            j = 1000;
                        }
                        date = date2;
                    }
                    if (str == null) {
                        str = w3Var.e;
                    }
                    String str3 = str;
                    String str4 = w3Var.h;
                    String str5 = w3Var.i;
                    Collection collection = atomicBoolean.get() ? this.d : w3Var.b;
                    Collection collection2 = atomicBoolean.get() ? this.e : w3Var.c;
                    Collection collection3 = atomicBoolean.get() ? this.f : w3Var.d;
                    h4 h4Var = w3Var.f;
                    Date date3 = new Date();
                    Date date4 = l != null ? new Date(l.longValue() * j) : w3Var.j;
                    if (str2 == null) {
                        str2 = w3Var.k;
                    }
                    y3bVar.t().R(new w3(str3, str4, str5, collection, collection2, collection3, h4Var, date, date3, date4, str2), true);
                    atomicBoolean2.set(false);
                }
            }
        } finally {
            atomicBoolean2.set(false);
        }
    }
}
