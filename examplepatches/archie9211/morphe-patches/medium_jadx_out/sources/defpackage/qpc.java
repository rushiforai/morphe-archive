package defpackage;

import java.util.ArrayList;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qpc {
    public o19 a;
    public boolean b = true;
    public final HashMap c;
    public final HashMap d;
    public final HashMap e;
    public final c62 f;
    public int g;
    public final ArrayList h;
    public final ArrayList i;
    public boolean j;
    public final m73 k;
    public long l;

    public qpc(m73 m73Var) {
        HashMap map = new HashMap();
        this.c = map;
        this.d = new HashMap();
        this.e = new HashMap();
        c62 c62Var = new c62(this);
        this.f = c62Var;
        this.g = 0;
        this.h = new ArrayList();
        this.i = new ArrayList();
        this.j = true;
        c62Var.a = 0;
        map.put(0, c62Var);
        this.k = m73Var;
        this.l = h72.b(0, 0, 0, 0, 15);
        this.a = new o19(9, this);
    }

    public final void a(Object obj) {
        this.h.add(obj);
        this.j = true;
    }

    public final c62 b(Object obj) {
        HashMap map = this.c;
        sya syaVar = (sya) map.get(obj);
        Object obj2 = syaVar;
        if (syaVar == null) {
            c62 c62Var = new c62(this);
            map.put(obj, c62Var);
            c62Var.a = obj;
            obj2 = c62Var;
        }
        if (obj2 instanceof c62) {
            return (c62) obj2;
        }
        return null;
    }

    public final int c(Float f) {
        return Math.round(f.floatValue());
    }

    public final uh5 d(int i, String str) {
        c62 c62VarB = b(str);
        u84 u84Var = c62VarB.c;
        if (u84Var == null || !(u84Var instanceof uh5)) {
            uh5 uh5Var = new uh5(this);
            uh5Var.b = i;
            uh5Var.g = str;
            c62VarB.c = uh5Var;
            c62VarB.a(uh5Var.b());
        }
        return (uh5) c62VarB.c;
    }

    public final hj5 e(opc opcVar) {
        hj5 ir5Var;
        StringBuilder sb = new StringBuilder("__HELPER_KEY_");
        int i = this.g;
        this.g = i + 1;
        String strH = ho2.H(sb, i, "__");
        HashMap map = this.d;
        hj5 hj5Var = (hj5) map.get(strH);
        hj5 hj5Var2 = hj5Var;
        if (hj5Var == null) {
            switch (opcVar.ordinal()) {
                case 0:
                    ir5Var = new ir5(this, opc.HORIZONTAL_CHAIN);
                    break;
                case 1:
                    ir5Var = new xse(this, opc.VERTICAL_CHAIN);
                    break;
                case 2:
                    ud udVar = new ud(this, opc.ALIGN_VERTICALLY, 0);
                    udVar.o0 = 0.5f;
                    ir5Var = udVar;
                    break;
                case 3:
                    ud udVar2 = new ud(this, opc.ALIGN_VERTICALLY, 1);
                    udVar2.o0 = 0.5f;
                    ir5Var = udVar2;
                    break;
                case 4:
                    ir5Var = new dn0(this);
                    break;
                case 5:
                default:
                    ir5Var = new hj5(this, opcVar);
                    break;
                case 6:
                case 7:
                    ir5Var = new eq4(this, opcVar);
                    break;
                case 8:
                case 9:
                case 10:
                    ir5Var = new rg5(this, opcVar);
                    break;
            }
            ir5Var.a = strH;
            map.put(strH, ir5Var);
            hj5Var2 = ir5Var;
        }
        return hj5Var2;
    }
}
