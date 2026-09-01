package defpackage;

import java.util.ArrayList;
import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pva {
    public final f33 a;
    public final ad b;
    public final Object c = new Object();

    public pva(f33 f33Var, ad adVar) {
        this.a = f33Var;
        this.b = adVar;
    }

    public final void a() {
        synchronized (this.c) {
            ((uva) this.a.c).g(-1L);
            ad adVar = this.b;
            adVar.b = 0;
            ((LinkedHashMap) adVar.c).clear();
        }
    }

    public final dx7 b(cx7 cx7Var) {
        dx7 dx7Var;
        synchronized (this.c) {
            try {
                tva tvaVar = (tva) ((LinkedHashMap) ((uva) this.a.c).c).get(cx7Var);
                dx7 dx7Var2 = null;
                dx7Var = tvaVar != null ? new dx7(tvaVar.a, tvaVar.b) : null;
                if (dx7Var == null) {
                    ad adVar = this.b;
                    ArrayList arrayList = (ArrayList) ((LinkedHashMap) adVar.c).get(cx7Var);
                    if (arrayList != null) {
                        int size = arrayList.size();
                        int i = 0;
                        while (true) {
                            if (i >= size) {
                                break;
                            }
                            wva wvaVar = (wva) arrayList.get(i);
                            ew5 ew5Var = (ew5) wvaVar.a.get();
                            dx7 dx7Var3 = ew5Var != null ? new dx7(ew5Var, wvaVar.b) : null;
                            if (dx7Var3 != null) {
                                dx7Var2 = dx7Var3;
                                break;
                            }
                            i++;
                        }
                        adVar.f();
                    }
                    dx7Var = dx7Var2;
                }
                if (dx7Var != null && !dx7Var.a.c()) {
                    d(cx7Var);
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return dx7Var;
    }

    public final long c() {
        long jC;
        synchronized (this.c) {
            jC = ((uva) this.a.c).c();
        }
        return jC;
    }

    public final void d(cx7 cx7Var) {
        synchronized (this.c) {
            uva uvaVar = (uva) this.a.c;
            Object objRemove = ((LinkedHashMap) uvaVar.c).remove(cx7Var);
            if (objRemove != null) {
                uvaVar.b = uvaVar.c() - uvaVar.f(cx7Var, objRemove);
                uvaVar.a(cx7Var, objRemove, null);
            }
            if (objRemove != null) {
            }
            if (((LinkedHashMap) this.b.c).remove(cx7Var) != null) {
            }
        }
    }

    public final void e(long j) {
        synchronized (this.c) {
            uva uvaVar = (uva) this.a.c;
            uvaVar.a = j;
            uvaVar.g(j);
        }
    }

    public final void f(long j) {
        synchronized (this.c) {
            ((uva) this.a.c).g(j);
        }
    }
}
