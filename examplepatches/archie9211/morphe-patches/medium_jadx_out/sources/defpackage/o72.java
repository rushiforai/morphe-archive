package defpackage;

import java.lang.reflect.Modifier;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o72 implements nn6 {
    public final /* synthetic */ int a;
    public boolean b;
    public Object c;
    public Object d;

    public o72(int i) {
        this.a = i;
        switch (i) {
            case 7:
                this.c = new Object();
                break;
            default:
                this.c = new ArrayList();
                this.d = new HashMap();
                this.b = false;
                break;
        }
    }

    public static String b(Class cls) {
        int modifiers = cls.getModifiers();
        if (Modifier.isInterface(modifiers)) {
            return "Interfaces can't be instantiated! Register an InstanceCreator or a TypeAdapter for this type. Interface name: ".concat(cls.getName());
        }
        if (!Modifier.isAbstract(modifiers)) {
            return null;
        }
        return "Abstract classes can't be instantiated! Adjust the R8 configuration or register an InstanceCreator or a TypeAdapter for this type. Class name: " + cls.getName() + "\nSee " + "https://github.com/google/gson/blob/main/Troubleshooting.md#".concat("r8-abstract-class");
    }

    public boolean a(long j) {
        Object obj;
        ArrayList arrayList = (ArrayList) ((gg5) this.d).b;
        int size = arrayList.size();
        int i = 0;
        while (true) {
            if (i >= size) {
                obj = null;
                break;
            }
            obj = arrayList.get(i);
            if (br7.q(((tb9) obj).a, j)) {
                break;
            }
            i++;
        }
        tb9 tb9Var = (tb9) obj;
        if (tb9Var != null) {
            return tb9Var.h;
        }
        return false;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00bd  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0144  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public defpackage.km8 c(defpackage.kxd r10, boolean r11) {
        /*
            Method dump skipped, instruction units count: 512
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.o72.c(kxd, boolean):km8");
    }

    public gj2 d() {
        ym0 ym0Var = (ym0) this.d;
        int i = ym0Var.b;
        int i2 = ym0Var.c;
        return i < i2 ? gj2.NOT_CROSSED : i > i2 ? gj2.CROSSED : gj2.COLLAPSED;
    }

    @Override // defpackage.nn6
    public boolean e(zvd zvdVar, zvd zvdVar2) {
        boolean z = this.b;
        c41 c41Var = (c41) this.c;
        c41 c41Var2 = (c41) this.d;
        if (zvdVar.equals(zvdVar2)) {
            return true;
        }
        co1 co1VarA = zvdVar.a();
        co1 co1VarA2 = zvdVar2.a();
        if ((co1VarA instanceof swd) && (co1VarA2 instanceof swd)) {
            return h1c.e.P0((swd) co1VarA, (swd) co1VarA2, z, new kd(c41Var, 4, c41Var2));
        }
        return false;
    }

    public void f() {
        if (this.b) {
            ((lid) this.d).n((bkd) this.c);
        }
    }

    public long g(uid uidVar, long j, boolean z, ywb ywbVar) {
        lid lidVar = (lid) this.d;
        long jV = lidVar.v(uidVar, j, z, false, ywbVar, false, null);
        if (!bkd.a(jV, (bkd) this.c)) {
            this.b = false;
        }
        lidVar.r(bkd.c(jV) ? ci5.Cursor : ci5.Selection);
        return jV;
    }

    public void h(tig tigVar) {
        synchronized (this.c) {
            try {
                ArrayDeque arrayDeque = (ArrayDeque) this.d;
                if (arrayDeque == null) {
                    arrayDeque = new ArrayDeque();
                    this.d = arrayDeque;
                }
                arrayDeque.add(tigVar);
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public void i(jrg jrgVar) {
        tig tigVar;
        synchronized (this.c) {
            if (((ArrayDeque) this.d) != null && !this.b) {
                this.b = true;
                while (true) {
                    synchronized (this.c) {
                        try {
                            tigVar = (tig) ((ArrayDeque) this.d).poll();
                            if (tigVar == null) {
                                this.b = false;
                                return;
                            }
                        } finally {
                        }
                    }
                    tigVar.b(jrgVar);
                }
            }
        }
    }

    public String toString() {
        switch (this.a) {
            case 0:
                return ((Map) this.c).toString();
            case 1:
            case 2:
            default:
                return super.toString();
            case 3:
                return "JavaTypeEnhancementState(jsr305=" + ((be6) this.c) + ", getReportLevelForAnnotation=" + ((z) this.d) + ')';
            case 4:
                return "SingleSelectionLayout(isStartHandle=" + this.b + ", crossed=" + d() + ", info=\n\t" + ((ym0) this.d) + ')';
        }
    }

    public o72(be6 be6Var, z zVar) {
        this.a = 3;
        this.c = be6Var;
        this.d = zVar;
        this.b = be6Var.d || zVar.invoke(h96.a) == h5b.IGNORE;
    }

    public o72(ab7 ab7Var, gg5 gg5Var) {
        this.a = 2;
        this.c = ab7Var;
        this.d = gg5Var;
    }

    public o72(Map map, boolean z, List list) {
        this.a = 0;
        this.c = map;
        this.b = z;
        this.d = list;
    }

    public /* synthetic */ o72(Object obj, Object obj2, boolean z, int i) {
        this.a = i;
        this.b = z;
        this.c = obj;
        this.d = obj2;
    }

    public o72(lid lidVar) {
        this.a = 5;
        this.d = lidVar;
        this.b = true;
    }
}
