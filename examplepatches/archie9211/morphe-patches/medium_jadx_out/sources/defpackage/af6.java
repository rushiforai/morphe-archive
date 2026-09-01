package defpackage;

import java.lang.reflect.Constructor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class af6 extends g01 {
    public final Constructor z;

    public af6(Constructor constructor) {
        this.z = constructor;
    }

    @Override // defpackage.g01
    public final String J() {
        Class<?>[] parameterTypes = this.z.getParameterTypes();
        parameterTypes.getClass();
        return k80.D0(parameterTypes, "", "<init>(", ")V", h06.h, 24);
    }
}
