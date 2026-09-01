package defpackage;

import java.util.Arrays;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ze6 extends g01 {
    public final List z;

    public ze6(Class cls) {
        Object[] declaredMethods = cls.getDeclaredMethods();
        declaredMethods.getClass();
        js4 js4Var = new js4(21);
        if (declaredMethods.length != 0) {
            declaredMethods = Arrays.copyOf(declaredMethods, declaredMethods.length);
            if (declaredMethods.length > 1) {
                Arrays.sort(declaredMethods, js4Var);
            }
        }
        List listAsList = Arrays.asList(declaredMethods);
        listAsList.getClass();
        this.z = listAsList;
    }

    @Override // defpackage.g01
    public final String J() {
        return bu1.F0(this.z, "", "<init>(", ")V", h06.g, 24);
    }
}
