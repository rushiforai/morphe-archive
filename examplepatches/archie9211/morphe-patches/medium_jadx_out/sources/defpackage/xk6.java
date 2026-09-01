package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class xk6 {
    public static final hx4 a = hx4.d1("k");

    public static ArrayList a(id6 id6Var, bc7 bc7Var, float f, mqe mqeVar, boolean z) {
        id6 id6Var2;
        bc7 bc7Var2;
        float f2;
        mqe mqeVar2;
        boolean z2;
        ArrayList arrayList = new ArrayList();
        if (id6Var.I() == ed6.STRING) {
            bc7Var.a("Lottie doesn't support expressions.");
            return arrayList;
        }
        id6Var.m();
        while (id6Var.hasNext()) {
            if (id6Var.N(a) != 0) {
                id6Var.v();
            } else if (id6Var.I() == ed6.BEGIN_ARRAY) {
                id6Var.f();
                if (id6Var.I() == ed6.NUMBER) {
                    id6 id6Var3 = id6Var;
                    bc7 bc7Var3 = bc7Var;
                    float f3 = f;
                    mqe mqeVar3 = mqeVar;
                    boolean z3 = z;
                    uk6 uk6VarB = wk6.b(id6Var3, bc7Var3, f3, mqeVar3, false, z3);
                    id6Var2 = id6Var3;
                    bc7Var2 = bc7Var3;
                    f2 = f3;
                    mqeVar2 = mqeVar3;
                    z2 = z3;
                    arrayList.add(uk6VarB);
                } else {
                    id6Var2 = id6Var;
                    bc7Var2 = bc7Var;
                    f2 = f;
                    mqeVar2 = mqeVar;
                    z2 = z;
                    while (id6Var2.hasNext()) {
                        arrayList.add(wk6.b(id6Var2, bc7Var2, f2, mqeVar2, true, z2));
                    }
                }
                id6Var2.p();
                id6Var = id6Var2;
                bc7Var = bc7Var2;
                f = f2;
                mqeVar = mqeVar2;
                z = z2;
            } else {
                id6 id6Var4 = id6Var;
                arrayList.add(wk6.b(id6Var4, bc7Var, f, mqeVar, false, z));
                id6Var = id6Var4;
            }
        }
        id6Var.B();
        b(arrayList);
        return arrayList;
    }

    public static void b(ArrayList arrayList) {
        int i;
        Object obj;
        int size = arrayList.size();
        int i2 = 0;
        while (true) {
            i = size - 1;
            if (i2 >= i) {
                break;
            }
            uk6 uk6Var = (uk6) arrayList.get(i2);
            i2++;
            uk6 uk6Var2 = (uk6) arrayList.get(i2);
            uk6Var.h = Float.valueOf(uk6Var2.g);
            if (uk6Var.c == null && (obj = uk6Var2.b) != null) {
                uk6Var.c = obj;
                if (uk6Var instanceof m59) {
                    ((m59) uk6Var).d();
                }
            }
        }
        uk6 uk6Var3 = (uk6) arrayList.get(i);
        if ((uk6Var3.b == null || uk6Var3.c == null) && arrayList.size() > 1) {
            arrayList.remove(uk6Var3);
        }
    }
}
