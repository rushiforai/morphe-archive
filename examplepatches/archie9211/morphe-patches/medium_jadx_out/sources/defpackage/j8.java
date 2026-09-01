package defpackage;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class j8 implements ib6 {
    public final ArrayList a;
    public final ArrayList b;

    public j8(ArrayList arrayList, ArrayList arrayList2) {
        this.a = arrayList;
        this.b = arrayList2;
    }

    public static i8 b(ArrayList arrayList, Type type, Set set) {
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            i8 i8Var = (i8) arrayList.get(i);
            if (vn7.u(i8Var.a, type) && i8Var.b.equals(set)) {
                return i8Var;
            }
        }
        return null;
    }

    @Override // defpackage.ib6
    public final jb6 a(Type type, Set set, x38 x38Var) {
        i8 i8VarB = b(this.a, type, set);
        i8 i8VarB2 = b(this.b, type, set);
        jb6 jb6VarC = null;
        if (i8VarB == null && i8VarB2 == null) {
            return null;
        }
        if (i8VarB == null || i8VarB2 == null) {
            try {
                jb6VarC = x38Var.c(this, type, set);
            } catch (IllegalArgumentException e) {
                StringBuilder sbU = lv8.u("No ", i8VarB == null ? "@ToJson" : "@FromJson", " adapter for ");
                sbU.append(yoe.j(type, set));
                throw new IllegalArgumentException(sbU.toString(), e);
            }
        }
        jb6 jb6Var = jb6VarC;
        if (i8VarB != null) {
            i8VarB.a(x38Var, this);
        }
        if (i8VarB2 != null) {
            i8VarB2.a(x38Var, this);
        }
        return new f8(i8VarB, jb6Var, x38Var, i8VarB2, set, type);
    }
}
