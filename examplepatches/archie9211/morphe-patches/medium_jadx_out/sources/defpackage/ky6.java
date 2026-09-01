package defpackage;

import android.os.Looper;
import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ky6 extends wx6 {
    public final boolean b;
    public v94 c;
    public vx6 d;
    public final WeakReference e;
    public int f;
    public boolean g;
    public boolean h;
    public final ArrayList i;
    public final xpc j;

    public ky6(iy6 iy6Var, boolean z) {
        this.a = new zg7(11);
        this.b = z;
        this.c = new v94();
        vx6 vx6Var = vx6.INITIALIZED;
        this.d = vx6Var;
        this.i = new ArrayList();
        this.e = new WeakReference(iy6Var);
        this.j = vv2.j(vx6Var);
    }

    @Override // defpackage.wx6
    public final void a(hy6 hy6Var) {
        cy6 h03Var;
        iy6 iy6Var;
        hy6Var.getClass();
        d("addObserver");
        vx6 vx6Var = this.d;
        vx6 vx6Var2 = vx6.DESTROYED;
        if (vx6Var != vx6Var2) {
            vx6Var2 = vx6.INITIALIZED;
        }
        vx6Var2.getClass();
        jy6 jy6Var = new jy6();
        HashMap map = ty6.a;
        boolean z = hy6Var instanceof cy6;
        boolean z2 = hy6Var instanceof f03;
        Object obj = null;
        if (z && z2) {
            h03Var = new h03((f03) hy6Var, i, (cy6) hy6Var);
        } else if (z2) {
            h03Var = new h03((f03) hy6Var, i, obj);
        } else if (z) {
            h03Var = (cy6) hy6Var;
        } else {
            Class<?> cls = hy6Var.getClass();
            int i = 2;
            if (ty6.b(cls) == 2) {
                Object obj2 = ty6.b.get(cls);
                obj2.getClass();
                List list = (List) obj2;
                if (list.size() == 1) {
                    ty6.a((Constructor) list.get(0), hy6Var);
                    throw null;
                }
                int size = list.size();
                y65[] y65VarArr = new y65[size];
                if (size > 0) {
                    ty6.a((Constructor) list.get(0), hy6Var);
                    throw null;
                }
                h03Var = new ywa(i, y65VarArr);
            } else {
                h03Var = new h03(hy6Var);
            }
        }
        jy6Var.b = h03Var;
        jy6Var.a = vx6Var2;
        v94 v94Var = this.c;
        mnb mnbVarD = v94Var.d(hy6Var);
        if (mnbVarD != null) {
            obj = mnbVarD.b;
        } else {
            HashMap map2 = v94Var.e;
            mnb mnbVar = new mnb(hy6Var, jy6Var);
            v94Var.d++;
            mnb mnbVar2 = v94Var.b;
            if (mnbVar2 == null) {
                v94Var.a = mnbVar;
                v94Var.b = mnbVar;
            } else {
                mnbVar2.c = mnbVar;
                mnbVar.d = mnbVar2;
                v94Var.b = mnbVar;
            }
            map2.put(hy6Var, mnbVar);
        }
        if (((jy6) obj) == null && (iy6Var = (iy6) this.e.get()) != null) {
            i = (this.f != 0 || this.g) ? 1 : 0;
            vx6 vx6VarC = c(hy6Var);
            this.f++;
            while (jy6Var.a.compareTo(vx6VarC) < 0 && this.c.e.containsKey(hy6Var)) {
                vx6 vx6Var3 = jy6Var.a;
                ArrayList arrayList = this.i;
                arrayList.add(vx6Var3);
                sx6 sx6Var = ux6.Companion;
                vx6 vx6Var4 = jy6Var.a;
                sx6Var.getClass();
                ux6 ux6VarB = sx6.b(vx6Var4);
                if (ux6VarB == null) {
                    rd6.g("no event up from ", jy6Var.a);
                    return;
                } else {
                    jy6Var.a(iy6Var, ux6VarB);
                    arrayList.remove(arrayList.size() - 1);
                    vx6VarC = c(hy6Var);
                }
            }
            if (i == 0) {
                h();
            }
            this.f--;
        }
    }

    @Override // defpackage.wx6
    public final void b(hy6 hy6Var) {
        hy6Var.getClass();
        d("removeObserver");
        this.c.e(hy6Var);
    }

    public final vx6 c(hy6 hy6Var) {
        HashMap map = this.c.e;
        mnb mnbVar = map.containsKey(hy6Var) ? ((mnb) map.get(hy6Var)).d : null;
        vx6 vx6Var = mnbVar != null ? ((jy6) mnbVar.b).a : null;
        ArrayList arrayList = this.i;
        vx6 vx6Var2 = arrayList.isEmpty() ? null : (vx6) y30.m(1, arrayList);
        vx6 vx6Var3 = this.d;
        vx6Var3.getClass();
        if (vx6Var == null || vx6Var.compareTo(vx6Var3) >= 0) {
            vx6Var = vx6Var3;
        }
        return (vx6Var2 == null || vx6Var2.compareTo(vx6Var) >= 0) ? vx6Var : vx6Var2;
    }

    public final void d(String str) {
        if (this.b) {
            j23 j23Var = c70.N().f;
            if (Looper.getMainLooper().getThread() == Thread.currentThread()) {
                return;
            }
            lg8.i(ev6.x("Method ", str, " must be called on the main thread"));
        }
    }

    public void e(ux6 ux6Var) {
        ux6Var.getClass();
        d("handleLifecycleEvent");
        f(ux6Var.getTargetState());
    }

    public final void f(vx6 vx6Var) {
        if (this.d == vx6Var) {
            return;
        }
        iy6 iy6Var = (iy6) this.e.get();
        vx6 vx6Var2 = this.d;
        vx6Var2.getClass();
        vx6Var.getClass();
        if (vx6Var2 == vx6.INITIALIZED && vx6Var == vx6.DESTROYED) {
            throw new IllegalStateException(("State must be at least '" + vx6.CREATED + "' to be moved to '" + vx6Var + "' in component " + iy6Var).toString());
        }
        vx6 vx6Var3 = vx6.DESTROYED;
        if (vx6Var2 == vx6Var3 && vx6Var2 != vx6Var) {
            throw new IllegalStateException(("State is '" + vx6Var3 + "' and cannot be moved to `" + vx6Var + "` in component " + iy6Var).toString());
        }
        this.d = vx6Var;
        if (this.g || this.f != 0) {
            this.h = true;
            return;
        }
        this.g = true;
        h();
        this.g = false;
        if (this.d == vx6Var3) {
            this.c = new v94();
        }
    }

    public final void g(vx6 vx6Var) {
        vx6Var.getClass();
        d("setCurrentState");
        f(vx6Var);
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0030, code lost:
    
        r8.h = false;
        r8.j.l(r8.d);
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0039, code lost:
    
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void h() {
        /*
            Method dump skipped, instruction units count: 334
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ky6.h():void");
    }
}
