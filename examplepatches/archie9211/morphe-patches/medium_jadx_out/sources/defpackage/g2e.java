package defpackage;

import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g2e extends j2e {
    public final /* synthetic */ Method b;
    public final /* synthetic */ int c;

    public g2e(int i, Method method) {
        this.b = method;
        this.c = i;
    }

    @Override // defpackage.j2e
    public final Object a(Class cls) {
        String strB = o72.b(cls);
        if (strB == null) {
            return this.b.invoke(null, cls, Integer.valueOf(this.c));
        }
        ay0.d("UnsafeAllocator is used for non-instantiable type: ".concat(strB));
        return null;
    }
}
