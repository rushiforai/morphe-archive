package defpackage;

import java.lang.reflect.Type;
import java.util.Collection;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class b1b extends d1b {
    public final Class a;

    public b1b(Class cls) {
        this.a = cls;
    }

    @Override // defpackage.d1b
    public final Type b() {
        return this.a;
    }

    @Override // defpackage.o86
    public final Collection getAnnotations() {
        return ey3.a;
    }
}
