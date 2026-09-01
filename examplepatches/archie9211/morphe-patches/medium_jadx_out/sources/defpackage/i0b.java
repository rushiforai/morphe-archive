package defpackage;

import java.lang.annotation.Annotation;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class i0b extends g0b {
    public final Object[] b;

    public i0b(n98 n98Var, Object[] objArr) {
        super(n98Var);
        this.b = objArr;
    }

    public final ArrayList a() {
        Object[] objArr = this.b;
        ArrayList arrayList = new ArrayList(objArr.length);
        for (Object obj : objArr) {
            obj.getClass();
            Class<?> cls = obj.getClass();
            List list = e0b.a;
            arrayList.add(Enum.class.isAssignableFrom(cls) ? new v0b(null, (Enum) obj) : obj instanceof Annotation ? new h0b(null, (Annotation) obj) : obj instanceof Object[] ? new i0b(null, (Object[]) obj) : obj instanceof Class ? new r0b(null, (Class) obj) : new x0b(null, obj));
        }
        return arrayList;
    }
}
