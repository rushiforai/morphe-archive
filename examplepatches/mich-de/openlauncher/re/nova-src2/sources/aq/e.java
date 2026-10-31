package aq;

import b.u4;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Set;

/* loaded from: classes4.dex */
public final class e implements q {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f15448a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f15449b;

    public e(ArrayList arrayList, ArrayList arrayList2) {
        this.f15448a = arrayList;
        this.f15449b = arrayList2;
    }

    public static d b(ArrayList arrayList, Type type, Set set) {
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            d dVar = (d) arrayList.get(i5);
            if (m0.b(dVar.f15432a, type) && dVar.f15433b.equals(set)) {
                return dVar;
            }
        }
        return null;
    }

    @Override // aq.q
    public final r a(Type type, Set set, h0 h0Var) {
        d dVarB = b(this.f15448a, type, set);
        d dVarB2 = b(this.f15449b, type, set);
        r rVarC = null;
        if (dVarB == null && dVarB2 == null) {
            return null;
        }
        if (dVarB == null || dVarB2 == null) {
            try {
                rVarC = h0Var.c(this, type, set);
            } catch (IllegalArgumentException e3) {
                StringBuilder sbK = u4.k("No ", dVarB == null ? "@ToJson" : "@FromJson", " adapter for ");
                sbK.append(bq.e.j(type, set));
                throw new IllegalArgumentException(sbK.toString(), e3);
            }
        }
        r rVar = rVarC;
        if (dVarB != null) {
            dVarB.a(h0Var, this);
        }
        if (dVarB2 != null) {
            dVarB2.a(h0Var, this);
        }
        return new a(dVarB, rVar, h0Var, dVarB2, set, type);
    }
}
