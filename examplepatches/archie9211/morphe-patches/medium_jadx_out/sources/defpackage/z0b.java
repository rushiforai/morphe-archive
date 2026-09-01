package defpackage;

import java.lang.annotation.Annotation;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.Member;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class z0b extends y0b implements x96 {
    public final Method a;

    public z0b(Method method) {
        this.a = method;
    }

    @Override // defpackage.y0b
    public final Member b() {
        return this.a;
    }

    public final d1b f() {
        Type genericReturnType = this.a.getGenericReturnType();
        genericReturnType.getClass();
        boolean z = genericReturnType instanceof Class;
        if (z) {
            Class cls = (Class) genericReturnType;
            if (cls.isPrimitive()) {
                return new b1b(cls);
            }
        }
        return ((genericReturnType instanceof GenericArrayType) || (z && ((Class) genericReturnType).isArray())) ? new j0b(genericReturnType) : genericReturnType instanceof WildcardType ? new g1b((WildcardType) genericReturnType) : new s0b(genericReturnType);
    }

    public final List g() {
        Method method = this.a;
        Type[] genericParameterTypes = method.getGenericParameterTypes();
        genericParameterTypes.getClass();
        Annotation[][] parameterAnnotations = method.getParameterAnnotations();
        parameterAnnotations.getClass();
        return d(genericParameterTypes, parameterAnnotations, method.isVarArgs());
    }

    @Override // defpackage.x96
    public final ArrayList getTypeParameters() {
        TypeVariable<Method>[] typeParameters = this.a.getTypeParameters();
        typeParameters.getClass();
        ArrayList arrayList = new ArrayList(typeParameters.length);
        for (TypeVariable<Method> typeVariable : typeParameters) {
            arrayList.add(new e1b(typeVariable));
        }
        return arrayList;
    }
}
