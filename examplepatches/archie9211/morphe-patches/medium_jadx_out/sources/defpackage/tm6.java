package defpackage;

import java.util.Arrays;
import java.util.EnumMap;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class tm6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ vm6 b;

    public /* synthetic */ tm6(vm6 vm6Var, int i) {
        this.a = i;
        this.b = vm6Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        vm6 vm6Var = this.b;
        switch (i) {
            case 0:
                return Arrays.asList(vm6Var.l().X(mnc.k), vm6Var.l().X(mnc.m), vm6Var.l().X(mnc.n), vm6Var.l().X(mnc.l));
            default:
                EnumMap enumMap = new EnumMap(x0a.class);
                HashMap map = new HashMap();
                HashMap map2 = new HashMap();
                for (x0a x0aVar : x0a.values()) {
                    String strB = x0aVar.getTypeName().b();
                    if (strB == null) {
                        vm6.a(47);
                        throw null;
                    }
                    hec hecVarT = vm6Var.k(strB).T();
                    if (hecVarT == null) {
                        vm6.a(48);
                        throw null;
                    }
                    String strB2 = x0aVar.getArrayTypeName().b();
                    if (strB2 == null) {
                        vm6.a(47);
                        throw null;
                    }
                    hec hecVarT2 = vm6Var.k(strB2).T();
                    if (hecVarT2 == null) {
                        vm6.a(48);
                        throw null;
                    }
                    enumMap.put(x0aVar, hecVarT2);
                    map.put(hecVarT, hecVarT2);
                    map2.put(hecVarT2, hecVarT);
                }
                return new um6(enumMap, map, map2);
        }
    }
}
