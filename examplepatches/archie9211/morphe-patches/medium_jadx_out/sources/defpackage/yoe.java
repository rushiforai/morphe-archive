package defpackage;

import j$.util.DesugarCollections;
import java.lang.annotation.Annotation;
import java.lang.reflect.Constructor;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.WildcardType;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class yoe {
    public static final Set a = Collections.EMPTY_SET;
    public static final Type[] b = new Type[0];
    public static final Class c;

    static {
        Class<?> cls;
        try {
            cls = Class.forName(getKotlinMetadataClassName());
        } catch (ClassNotFoundException unused) {
            cls = null;
        }
        c = cls;
        LinkedHashMap linkedHashMap = new LinkedHashMap(16);
        linkedHashMap.put(Boolean.TYPE, Boolean.class);
        linkedHashMap.put(Byte.TYPE, Byte.class);
        linkedHashMap.put(Character.TYPE, Character.class);
        linkedHashMap.put(Double.TYPE, Double.class);
        linkedHashMap.put(Float.TYPE, Float.class);
        linkedHashMap.put(Integer.TYPE, Integer.class);
        linkedHashMap.put(Long.TYPE, Long.class);
        linkedHashMap.put(Short.TYPE, Short.class);
        linkedHashMap.put(Void.TYPE, Void.class);
        DesugarCollections.unmodifiableMap(linkedHashMap);
    }

    public static Type a(Type type) {
        if (type instanceof Class) {
            Class cls = (Class) type;
            return cls.isArray() ? new voe(a(cls.getComponentType())) : cls;
        }
        if (type instanceof ParameterizedType) {
            if (type instanceof woe) {
                return type;
            }
            ParameterizedType parameterizedType = (ParameterizedType) type;
            return new woe(parameterizedType.getOwnerType(), parameterizedType.getRawType(), parameterizedType.getActualTypeArguments());
        }
        if (type instanceof GenericArrayType) {
            return type instanceof voe ? type : new voe(((GenericArrayType) type).getGenericComponentType());
        }
        if (!(type instanceof WildcardType) || (type instanceof xoe)) {
            return type;
        }
        WildcardType wildcardType = (WildcardType) type;
        return new xoe(wildcardType.getUpperBounds(), wildcardType.getLowerBounds());
    }

    public static void b(Type type) {
        if ((type instanceof Class) && ((Class) type).isPrimitive()) {
            rd6.s("Unexpected primitive ", type, ". Use the boxed type.");
        }
    }

    public static rl8 c(x38 x38Var, Type type, Class cls) {
        Class<?> cls2;
        Constructor<?> declaredConstructor;
        Object[] objArr;
        sb6 sb6Var = (sb6) cls.getAnnotation(sb6.class);
        if (sb6Var != null && sb6Var.generateAdapter()) {
            try {
                try {
                    cls2 = Class.forName(cls.getName().replace("$", "_") + "JsonAdapter", true, cls.getClassLoader());
                    try {
                        if (type instanceof ParameterizedType) {
                            Type[] actualTypeArguments = ((ParameterizedType) type).getActualTypeArguments();
                            try {
                                declaredConstructor = cls2.getDeclaredConstructor(x38.class, Type[].class);
                                objArr = new Object[]{x38Var, actualTypeArguments};
                            } catch (NoSuchMethodException unused) {
                                declaredConstructor = cls2.getDeclaredConstructor(Type[].class);
                                objArr = new Object[]{actualTypeArguments};
                            }
                        } else {
                            try {
                                declaredConstructor = cls2.getDeclaredConstructor(x38.class);
                                objArr = new Object[]{x38Var};
                            } catch (NoSuchMethodException unused2) {
                                declaredConstructor = cls2.getDeclaredConstructor(null);
                                objArr = new Object[0];
                            }
                        }
                        declaredConstructor.setAccessible(true);
                        return ((jb6) declaredConstructor.newInstance(objArr)).c();
                    } catch (NoSuchMethodException e) {
                        e = e;
                        if ((type instanceof ParameterizedType) || cls2.getTypeParameters().length == 0) {
                            ywb.k("Failed to find the generated JsonAdapter constructor for ", type, e);
                            return null;
                        }
                        StringBuilder sb = new StringBuilder("Failed to find the generated JsonAdapter constructor for '");
                        sb.append(type);
                        String canonicalName = cls2.getCanonicalName();
                        sb.append("'. Suspiciously, the type was not parameterized but the target class '");
                        sb.append(canonicalName);
                        sb.append("' is generic. Consider using Types#newParameterizedType() to define these missing type variables.");
                        throw new RuntimeException(sb.toString(), e);
                    }
                } catch (NoSuchMethodException e2) {
                    e = e2;
                    cls2 = null;
                }
            } catch (ClassNotFoundException e3) {
                ywb.k("Failed to find the generated JsonAdapter class for ", type, e3);
            } catch (IllegalAccessException e4) {
                ywb.k("Failed to access the generated JsonAdapter for ", type, e4);
                return null;
            } catch (InstantiationException e5) {
                ywb.k("Failed to instantiate the generated JsonAdapter for ", type, e5);
                return null;
            } catch (InvocationTargetException e6) {
                i(e6);
                throw null;
            }
        }
        return null;
    }

    public static Type d(Type type, Class cls, Class cls2) {
        if (cls2 == cls) {
            return type;
        }
        if (cls2.isInterface()) {
            Class<?>[] interfaces = cls.getInterfaces();
            int length = interfaces.length;
            for (int i = 0; i < length; i++) {
                Class<?> cls3 = interfaces[i];
                if (cls3 == cls2) {
                    return cls.getGenericInterfaces()[i];
                }
                if (cls2.isAssignableFrom(cls3)) {
                    return d(cls.getGenericInterfaces()[i], interfaces[i], cls2);
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
                    return d(cls.getGenericSuperclass(), superclass, cls2);
                }
                cls = superclass;
            }
        }
        return cls2;
    }

    public static boolean e(Class cls) {
        String name = cls.getName();
        return name.startsWith("android.") || name.startsWith("androidx.") || name.startsWith("java.") || name.startsWith("javax.") || name.startsWith("kotlin.") || name.startsWith("kotlinx.") || name.startsWith("scala.");
    }

    public static Set f(Annotation[] annotationArr) {
        LinkedHashSet linkedHashSet = null;
        for (Annotation annotation : annotationArr) {
            if (annotation.annotationType().isAnnotationPresent(bd6.class)) {
                if (linkedHashSet == null) {
                    linkedHashSet = new LinkedHashSet();
                }
                linkedHashSet.add(annotation);
            }
        }
        return linkedHashSet != null ? DesugarCollections.unmodifiableSet(linkedHashSet) : a;
    }

    public static Type g(Type type) {
        if (!(type instanceof WildcardType)) {
            return type;
        }
        WildcardType wildcardType = (WildcardType) type;
        if (wildcardType.getLowerBounds().length != 0) {
            return type;
        }
        Type[] upperBounds = wildcardType.getUpperBounds();
        if (upperBounds.length == 1) {
            return upperBounds[0];
        }
        lg8.r();
        return null;
    }

    private static String getKotlinMetadataClassName() {
        return "kotlin.Metadata";
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0049  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.reflect.Type h(java.lang.reflect.Type r8, java.lang.Class r9, java.lang.reflect.Type r10, java.util.LinkedHashSet r11) {
        /*
            Method dump skipped, instruction units count: 290
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yoe.h(java.lang.reflect.Type, java.lang.Class, java.lang.reflect.Type, java.util.LinkedHashSet):java.lang.reflect.Type");
    }

    public static void i(InvocationTargetException invocationTargetException) {
        Throwable targetException = invocationTargetException.getTargetException();
        if (targetException instanceof RuntimeException) {
            throw ((RuntimeException) targetException);
        }
        if (!(targetException instanceof Error)) {
            throw new RuntimeException(targetException);
        }
        throw ((Error) targetException);
    }

    public static String j(Type type, Set set) {
        String str;
        StringBuilder sb = new StringBuilder();
        sb.append(type);
        if (set.isEmpty()) {
            str = " (with no annotations)";
        } else {
            str = " annotated " + set;
        }
        sb.append(str);
        return sb.toString();
    }

    public static String k(Type type) {
        return type instanceof Class ? ((Class) type).getName() : type.toString();
    }
}
