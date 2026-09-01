package defpackage;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Type;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class f51 extends l51 {
    public final /* synthetic */ int e = 0;
    public final boolean f;

    /* JADX WARN: Illegal instructions before constructor call */
    public f51(Field field, boolean z, boolean z2) {
        Class cls = Void.TYPE;
        cls.getClass();
        Class<?> declaringClass = z2 ? field.getDeclaringClass() : null;
        Type genericType = field.getGenericType();
        genericType.getClass();
        super(field, cls, declaringClass, new Type[]{genericType});
        this.f = z;
    }

    @Override // defpackage.v41
    public Object call(Object[] objArr) throws IllegalAccessException {
        objArr.getClass();
        d(objArr);
        ((Field) this.a).set(this.c != null ? k80.t0(objArr) : null, k80.E0(objArr));
        return c1e.a;
    }

    @Override // defpackage.l51
    public void d(Object[] objArr) {
        switch (this.e) {
            case 0:
                objArr.getClass();
                super.d(objArr);
                if (this.f && k80.E0(objArr) == null) {
                    ay0.e("null is not allowed as a value for this property.");
                    break;
                }
                break;
            default:
                super.d(objArr);
                break;
        }
    }

    public Object f(Object obj, Object[] objArr) {
        objArr.getClass();
        return this.f ? c1e.a : ((Method) this.a).invoke(obj, Arrays.copyOf(objArr, objArr.length));
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public f51(Method method, boolean z, Type[] typeArr) {
        Type genericReturnType = method.getGenericReturnType();
        genericReturnType.getClass();
        super(method, genericReturnType, z ? method.getDeclaringClass() : null, typeArr);
        this.f = g76.L(genericReturnType, Void.TYPE);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ f51(Method method, boolean z, int i) {
        z = (i & 2) != 0 ? !Modifier.isStatic(method.getModifiers()) : z;
        Type[] genericParameterTypes = method.getGenericParameterTypes();
        genericParameterTypes.getClass();
        this(method, z, genericParameterTypes);
    }
}
