package eb0;

import b.c9;
import b.u4;
import com.google.android.gms.internal.measurement.k2;
import java.lang.annotation.Annotation;
import java.lang.invoke.MethodHandles;
import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.GenericDeclaration;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;
import java.util.Arrays;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Objects;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import t70.y0;

/* loaded from: classes5.dex */
public abstract class w0 {

    /* renamed from: a, reason: collision with root package name */
    public static final Type[] f52662a = new Type[0];

    /* renamed from: b, reason: collision with root package name */
    public static boolean f52663b = true;

    /* renamed from: c, reason: collision with root package name */
    public static Constructor f52664c;

    public static final Object b(d dVar, Continuation continuation) {
        t70.m mVar = new t70.m(1, IntrinsicsKt.b(continuation));
        mVar.t();
        mVar.v(new t(dVar, 0));
        dVar.s(new as.d0(1, mVar));
        Object objS = mVar.s();
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        return objS;
    }

    public static final Object c(d dVar, Continuation continuation) {
        t70.m mVar = new t70.m(1, IntrinsicsKt.b(continuation));
        mVar.t();
        mVar.v(new t(dVar, 1));
        dVar.s(new as.d0(2, mVar));
        Object objS = mVar.s();
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        return objS;
    }

    public static void d(Type type) {
        if ((type instanceof Class) && ((Class) type).isPrimitive()) {
            throw new IllegalArgumentException();
        }
    }

    public static boolean e(Type type, Type type2) {
        if (type == type2) {
            return true;
        }
        if (type instanceof Class) {
            return type.equals(type2);
        }
        if (type instanceof ParameterizedType) {
            if (!(type2 instanceof ParameterizedType)) {
                return false;
            }
            ParameterizedType parameterizedType = (ParameterizedType) type;
            ParameterizedType parameterizedType2 = (ParameterizedType) type2;
            Type ownerType = parameterizedType.getOwnerType();
            Type ownerType2 = parameterizedType2.getOwnerType();
            return (ownerType == ownerType2 || (ownerType != null && ownerType.equals(ownerType2))) && parameterizedType.getRawType().equals(parameterizedType2.getRawType()) && Arrays.equals(parameterizedType.getActualTypeArguments(), parameterizedType2.getActualTypeArguments());
        }
        if (type instanceof GenericArrayType) {
            if (type2 instanceof GenericArrayType) {
                return e(((GenericArrayType) type).getGenericComponentType(), ((GenericArrayType) type2).getGenericComponentType());
            }
            return false;
        }
        if (type instanceof WildcardType) {
            if (!(type2 instanceof WildcardType)) {
                return false;
            }
            WildcardType wildcardType = (WildcardType) type;
            WildcardType wildcardType2 = (WildcardType) type2;
            return Arrays.equals(wildcardType.getUpperBounds(), wildcardType2.getUpperBounds()) && Arrays.equals(wildcardType.getLowerBounds(), wildcardType2.getLowerBounds());
        }
        if (!(type instanceof TypeVariable) || !(type2 instanceof TypeVariable)) {
            return false;
        }
        TypeVariable typeVariable = (TypeVariable) type;
        TypeVariable typeVariable2 = (TypeVariable) type2;
        return typeVariable.getGenericDeclaration() == typeVariable2.getGenericDeclaration() && typeVariable.getName().equals(typeVariable2.getName());
    }

    public static Type f(Type type, Class cls, Class cls2) {
        if (cls2 == cls) {
            return type;
        }
        if (cls2.isInterface()) {
            Class<?>[] interfaces = cls.getInterfaces();
            int length = interfaces.length;
            for (int i5 = 0; i5 < length; i5++) {
                Class<?> cls3 = interfaces[i5];
                if (cls3 == cls2) {
                    return cls.getGenericInterfaces()[i5];
                }
                if (cls2.isAssignableFrom(cls3)) {
                    return f(cls.getGenericInterfaces()[i5], interfaces[i5], cls2);
                }
            }
        }
        if (!cls.isInterface()) {
            while (cls != Object.class) {
                Class<?> superclass = cls.getSuperclass();
                if (superclass == cls2) {
                    return cls.getGenericSuperclass();
                }
                if (cls2.isAssignableFrom(superclass)) {
                    return f(cls.getGenericSuperclass(), superclass, cls2);
                }
                cls = superclass;
            }
        }
        return cls2;
    }

    public static Type g(int i5, ParameterizedType parameterizedType) {
        Type[] actualTypeArguments = parameterizedType.getActualTypeArguments();
        if (i5 >= 0 && i5 < actualTypeArguments.length) {
            Type type = actualTypeArguments[i5];
            return type instanceof WildcardType ? ((WildcardType) type).getUpperBounds()[0] : type;
        }
        StringBuilder sbJ = u4.j(i5, "Index ", " not in range [0,");
        sbJ.append(actualTypeArguments.length);
        sbJ.append(") for ");
        sbJ.append(parameterizedType);
        throw new IllegalArgumentException(sbJ.toString());
    }

    public static Class h(Type type) {
        Objects.requireNonNull(type, "type == null");
        if (type instanceof Class) {
            return (Class) type;
        }
        if (type instanceof ParameterizedType) {
            Type rawType = ((ParameterizedType) type).getRawType();
            if (rawType instanceof Class) {
                return (Class) rawType;
            }
            throw new IllegalArgumentException();
        }
        if (type instanceof GenericArrayType) {
            return Array.newInstance((Class<?>) h(((GenericArrayType) type).getGenericComponentType()), 0).getClass();
        }
        if (type instanceof TypeVariable) {
            return Object.class;
        }
        if (type instanceof WildcardType) {
            return h(((WildcardType) type).getUpperBounds()[0]);
        }
        throw new IllegalArgumentException("Expected a Class, ParameterizedType, or GenericArrayType, but <" + type + "> is of type " + type.getClass().getName());
    }

    public static Type i(Type type, Class cls) {
        if (Map.class.isAssignableFrom(cls)) {
            return q(type, cls, f(type, cls, Map.class));
        }
        throw new IllegalArgumentException();
    }

    public static boolean j(Type type) {
        if (type instanceof Class) {
            return false;
        }
        if (type instanceof ParameterizedType) {
            for (Type type2 : ((ParameterizedType) type).getActualTypeArguments()) {
                if (j(type2)) {
                    return true;
                }
            }
            return false;
        }
        if (type instanceof GenericArrayType) {
            return j(((GenericArrayType) type).getGenericComponentType());
        }
        if ((type instanceof TypeVariable) || (type instanceof WildcardType)) {
            return true;
        }
        throw new IllegalArgumentException("Expected a Class, ParameterizedType, or GenericArrayType, but <" + type + "> is of type " + (type == null ? AbstractJsonLexerKt.NULL : type.getClass().getName()));
    }

    public static Object k(Method method, Class cls, Object obj, Object[] objArr) throws NoSuchMethodException, SecurityException {
        Constructor declaredConstructor = f52664c;
        if (declaredConstructor == null) {
            declaredConstructor = MethodHandles.Lookup.class.getDeclaredConstructor(Class.class, Integer.TYPE);
            declaredConstructor.setAccessible(true);
            f52664c = declaredConstructor;
        }
        return ((MethodHandles.Lookup) declaredConstructor.newInstance(cls, -1)).unreflectSpecial(method, cls).bindTo(obj).invokeWithArguments(objArr);
    }

    public static boolean l(Annotation[] annotationArr, Class cls) {
        for (Annotation annotation : annotationArr) {
            if (cls.isInstance(annotation)) {
                return true;
            }
        }
        return false;
    }

    public static boolean m(Type type) {
        return f52663b && type == Unit.class;
    }

    public static IllegalArgumentException n(Method method, Exception exc, String str, Object... objArr) {
        StringBuilder sbK = k2.k(String.format(str, objArr), "\n    for method ");
        sbK.append(method.getDeclaringClass().getSimpleName());
        sbK.append(".");
        sbK.append(method.getName());
        return new IllegalArgumentException(sbK.toString(), exc);
    }

    public static IllegalArgumentException o(Method method, int i5, String str, Object... objArr) {
        return n(method, null, a80.m.h(str, " (", j0.f52571b.c(method, i5), ")"), objArr);
    }

    public static IllegalArgumentException p(Method method, Exception exc, int i5, String str, Object... objArr) {
        return n(method, exc, a80.m.h(str, " (", j0.f52571b.c(method, i5), ")"), objArr);
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x003f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Type q(Type type, Class cls, Type type2) {
        Type type3;
        Type type4 = type2;
        while (true) {
            int i5 = 0;
            if (!(type4 instanceof TypeVariable)) {
                if (type4 instanceof Class) {
                    Class cls2 = (Class) type4;
                    if (cls2.isArray()) {
                        Class<?> componentType = cls2.getComponentType();
                        Type typeQ = q(type, cls, componentType);
                        return componentType == typeQ ? cls2 : new t0(typeQ);
                    }
                }
                if (type4 instanceof GenericArrayType) {
                    GenericArrayType genericArrayType = (GenericArrayType) type4;
                    Type genericComponentType = genericArrayType.getGenericComponentType();
                    Type typeQ2 = q(type, cls, genericComponentType);
                    return genericComponentType == typeQ2 ? genericArrayType : new t0(typeQ2);
                }
                if (type4 instanceof ParameterizedType) {
                    ParameterizedType parameterizedType = (ParameterizedType) type4;
                    Type ownerType = parameterizedType.getOwnerType();
                    Type typeQ3 = q(type, cls, ownerType);
                    boolean z11 = typeQ3 != ownerType;
                    Type[] actualTypeArguments = parameterizedType.getActualTypeArguments();
                    int length = actualTypeArguments.length;
                    while (i5 < length) {
                        Type typeQ4 = q(type, cls, actualTypeArguments[i5]);
                        if (typeQ4 != actualTypeArguments[i5]) {
                            if (!z11) {
                                actualTypeArguments = (Type[]) actualTypeArguments.clone();
                                z11 = true;
                            }
                            actualTypeArguments[i5] = typeQ4;
                        }
                        i5++;
                    }
                    return z11 ? new u0(typeQ3, parameterizedType.getRawType(), actualTypeArguments) : parameterizedType;
                }
                boolean z12 = type4 instanceof WildcardType;
                Type type5 = type4;
                if (z12) {
                    WildcardType wildcardType = (WildcardType) type4;
                    Type[] lowerBounds = wildcardType.getLowerBounds();
                    Type[] upperBounds = wildcardType.getUpperBounds();
                    if (lowerBounds.length == 1) {
                        Type typeQ5 = q(type, cls, lowerBounds[0]);
                        type5 = wildcardType;
                        if (typeQ5 != lowerBounds[0]) {
                            return new v0(new Type[]{Object.class}, new Type[]{typeQ5});
                        }
                    } else {
                        type5 = wildcardType;
                        if (upperBounds.length == 1) {
                            Type typeQ6 = q(type, cls, upperBounds[0]);
                            type5 = wildcardType;
                            if (typeQ6 != upperBounds[0]) {
                                return new v0(new Type[]{typeQ6}, f52662a);
                            }
                        }
                    }
                }
                return type5;
            }
            TypeVariable typeVariable = (TypeVariable) type4;
            GenericDeclaration genericDeclaration = typeVariable.getGenericDeclaration();
            Class cls3 = genericDeclaration instanceof Class ? (Class) genericDeclaration : null;
            if (cls3 == null) {
                type3 = typeVariable;
            } else {
                Type typeF = f(type, cls, cls3);
                if (typeF instanceof ParameterizedType) {
                    TypeVariable[] typeParameters = cls3.getTypeParameters();
                    while (i5 < typeParameters.length) {
                        if (typeVariable.equals(typeParameters[i5])) {
                            type3 = ((ParameterizedType) typeF).getActualTypeArguments()[i5];
                        } else {
                            i5++;
                        }
                    }
                    throw new NoSuchElementException();
                }
            }
            if (type3 == typeVariable) {
                return type3;
            }
            type4 = type3;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void r(Throwable th2, Continuation continuation) {
        u uVar;
        if (continuation instanceof u) {
            uVar = (u) continuation;
            int i5 = uVar.f52651u;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                uVar.f52651u = i5 - Integer.MIN_VALUE;
            } else {
                uVar = new u(continuation);
            }
        }
        Object obj = uVar.f52650t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = uVar.f52651u;
        if (i11 != 0) {
            if (i11 == 1) {
                throw c9.o(obj);
            }
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        ResultKt.b(obj);
        uVar.f52651u = 1;
        y0.f88884a.c0(uVar.getContext(), new ab.z(uVar, th2, false, 17));
    }

    public static void s(Throwable th2) {
        if (th2 instanceof VirtualMachineError) {
            throw ((VirtualMachineError) th2);
        }
        if (th2 instanceof ThreadDeath) {
            throw ((ThreadDeath) th2);
        }
        if (th2 instanceof LinkageError) {
            throw ((LinkageError) th2);
        }
    }

    public static String t(Type type) {
        return type instanceof Class ? ((Class) type).getName() : type.toString();
    }

    public abstract void a(m0 m0Var, Object obj);
}
