package a2;

import java.util.ArrayList;
import p1.s0;

/* loaded from: classes2.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f106a = new ArrayList();

    public final boolean a(s0 s0Var, Object obj) {
        ArrayList arrayList = s0Var.f81547a;
        if (arrayList == null) {
            return true;
        }
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            Object obj2 = arrayList.get(i5);
            if (obj2 instanceof p1.a) {
                if (obj2.equals(obj)) {
                    return true;
                }
            } else {
                if (!(obj2 instanceof s0)) {
                    throw new IllegalStateException(("Unexpected child source info " + obj2).toString());
                }
                if (a((s0) obj2, obj)) {
                    return true;
                }
            }
        }
        return false;
    }

    public final void b(s0 s0Var, Object obj) {
    }
}
