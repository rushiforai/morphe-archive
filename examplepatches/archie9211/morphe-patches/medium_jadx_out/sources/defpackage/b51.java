package defpackage;

import java.lang.reflect.Field;
import java.lang.reflect.Type;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class b51 extends l51 {
    /* JADX WARN: Illegal instructions before constructor call */
    public b51(Field field, boolean z) {
        Type genericType = field.getGenericType();
        genericType.getClass();
        super(field, genericType, z ? field.getDeclaringClass() : null, new Type[0]);
    }

    @Override // defpackage.v41
    public Object call(Object[] objArr) {
        objArr.getClass();
        d(objArr);
        return ((Field) this.a).get(this.c != null ? k80.t0(objArr) : null);
    }
}
