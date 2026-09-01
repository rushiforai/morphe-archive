package defpackage;

import java.util.ArrayList;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public enum y83 {
    VISIBILITY(true),
    MODALITY(true),
    OVERRIDE(true),
    ANNOTATIONS(false),
    INNER(true),
    MEMBER_KIND(true),
    DATA(true),
    INLINE(true),
    EXPECT(true),
    ACTUAL(true),
    CONST(true),
    LATEINIT(true),
    FUN(true),
    VALUE(true);

    public static final Set<y83> ALL;
    public static final Set<y83> ALL_EXCEPT_ANNOTATIONS;
    public static final x83 Companion = new x83();
    public final boolean a;

    static {
        y83[] y83VarArrValues = values();
        ArrayList arrayList = new ArrayList();
        for (y83 y83Var : y83VarArrValues) {
            if (y83Var.a) {
                arrayList.add(y83Var);
            }
        }
        ALL_EXCEPT_ANNOTATIONS = bu1.q1(arrayList);
        ALL = k80.S0(values());
    }

    y83(boolean z) {
        this.a = z;
    }
}
