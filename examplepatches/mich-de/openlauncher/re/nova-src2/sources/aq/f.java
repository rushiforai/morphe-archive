package aq;

import io.sentry.e3;
import java.io.ObjectInputStream;
import java.io.ObjectStreamClass;
import java.lang.annotation.Annotation;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.TreeMap;
import kotlin.Metadata;
import kotlin.jvm.JvmClassMappingKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;
import kotlin.reflect.KClass;
import kotlin.reflect.KClassifier;
import kotlin.reflect.KFunction;
import kotlin.reflect.KMutableProperty1;
import kotlin.reflect.KParameter;
import kotlin.reflect.KProperty1;
import kotlin.reflect.KType;
import kotlin.reflect.KTypeParameter;
import kotlin.reflect.KTypeProjection;
import kotlin.reflect.full.KClasses;
import kotlin.reflect.jvm.KCallablesJvm;
import kotlin.reflect.jvm.ReflectJvmMapping;

/* loaded from: classes4.dex */
public final class f implements q {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15452a;

    public /* synthetic */ f(int i5) {
        this.f15452a = i5;
    }

    public static void b(Type type, Class cls) {
        Class<?> clsD = m0.d(type);
        if (cls.isAssignableFrom(clsD)) {
            throw new IllegalArgumentException("No JsonAdapter for " + type + ", you should probably use " + cls.getSimpleName() + " instead of " + clsD.getSimpleName() + " (Moshi only supports the collection interfaces by default) or else register a custom JsonAdapter.");
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:109:0x0217  */
    /* JADX WARN: Removed duplicated region for block: B:112:0x0228  */
    /* JADX WARN: Removed duplicated region for block: B:129:0x02a2  */
    /* JADX WARN: Removed duplicated region for block: B:134:0x02d6  */
    /* JADX WARN: Removed duplicated region for block: B:136:0x02e1  */
    /* JADX WARN: Removed duplicated region for block: B:322:0x06f0  */
    @Override // aq.q
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final r a(Type type, Set annotations, h0 h0Var) throws NoSuchFieldException, NoSuchMethodException, SecurityException, ClassNotFoundException {
        int i5;
        m0 hVar;
        o oVar;
        Class clsD;
        Type[] actualTypeArguments;
        char c11;
        Object next;
        String name;
        KClassifier classifier;
        boolean z11;
        Type javaType;
        boolean z12;
        Type javaType2;
        Object next2;
        Type type2 = type;
        int i11 = this.f15452a;
        Class cls = Integer.TYPE;
        boolean z13 = true;
        switch (i11) {
            case 0:
                Type genericComponentType = type2 instanceof GenericArrayType ? ((GenericArrayType) type2).getGenericComponentType() : type2 instanceof Class ? ((Class) type2).getComponentType() : null;
                if (genericComponentType != null && annotations.isEmpty()) {
                    return new g(m0.d(genericComponentType), h0Var.b(genericComponentType, bq.e.f18422a, null)).c();
                }
                return null;
            case 1:
                if ((type2 instanceof Class) || (type2 instanceof ParameterizedType)) {
                    Class clsD2 = m0.d(type2);
                    if (!clsD2.isInterface() && !clsD2.isEnum() && annotations.isEmpty()) {
                        if (bq.e.e(clsD2)) {
                            b(type2, List.class);
                            b(type2, Set.class);
                            b(type2, Map.class);
                            b(type2, Collection.class);
                            String str = "Platform " + clsD2;
                            if (type2 instanceof ParameterizedType) {
                                str = str + " in " + type2;
                            }
                            throw new IllegalArgumentException(b.c0.E(str, " requires explicit JsonAdapter to be registered"));
                        }
                        if (clsD2.isAnonymousClass()) {
                            throw new IllegalArgumentException("Cannot serialize anonymous class ".concat(clsD2.getName()));
                        }
                        if (clsD2.isLocalClass()) {
                            throw new IllegalArgumentException("Cannot serialize local class ".concat(clsD2.getName()));
                        }
                        if (clsD2.getEnclosingClass() != null && !Modifier.isStatic(clsD2.getModifiers())) {
                            throw new IllegalArgumentException("Cannot serialize non-static nested class ".concat(clsD2.getName()));
                        }
                        if (Modifier.isAbstract(clsD2.getModifiers())) {
                            throw new IllegalArgumentException("Cannot serialize abstract class ".concat(clsD2.getName()));
                        }
                        Class<? extends Annotation> cls2 = bq.e.f18424c;
                        if (cls2 != null && clsD2.isAnnotationPresent(cls2)) {
                            throw new IllegalArgumentException("Cannot serialize Kotlin type " + clsD2.getName() + ". Reflective serialization of Kotlin classes without using kotlin-reflect has undefined and unexpected behavior. Please use KotlinJsonAdapterFactory from the moshi-kotlin artifact or use code gen from the moshi-kotlin-codegen artifact.");
                        }
                        try {
                            Constructor declaredConstructor = clsD2.getDeclaredConstructor(null);
                            declaredConstructor.setAccessible(true);
                            i5 = 0;
                            try {
                                hVar = new h(declaredConstructor, clsD2, i5);
                            } catch (NoSuchMethodException unused) {
                                try {
                                    try {
                                        try {
                                            Class<?> cls3 = Class.forName("sun.misc.Unsafe");
                                            Field declaredField = cls3.getDeclaredField("theUnsafe");
                                            declaredField.setAccessible(true);
                                            hVar = new i(cls3.getMethod("allocateInstance", Class.class), declaredField.get(null), clsD2);
                                        } catch (Exception unused2) {
                                            throw new IllegalArgumentException("cannot construct instances of ".concat(clsD2.getName()));
                                        }
                                    } catch (ClassNotFoundException | NoSuchFieldException | NoSuchMethodException unused3) {
                                        Method declaredMethod = ObjectStreamClass.class.getDeclaredMethod("getConstructorId", Class.class);
                                        declaredMethod.setAccessible(true);
                                        int iIntValue = ((Integer) declaredMethod.invoke(null, Object.class)).intValue();
                                        Method declaredMethod2 = ObjectStreamClass.class.getDeclaredMethod("newInstance", Class.class, cls);
                                        declaredMethod2.setAccessible(true);
                                        hVar = new j(declaredMethod2, clsD2, iIntValue);
                                    } catch (IllegalAccessException unused4) {
                                        throw new AssertionError();
                                    }
                                } catch (IllegalAccessException unused5) {
                                    throw new AssertionError();
                                } catch (NoSuchMethodException unused6) {
                                    Method declaredMethod3 = ObjectInputStream.class.getDeclaredMethod("newInstance", Class.class, Class.class);
                                    declaredMethod3.setAccessible(true);
                                    hVar = new h(declaredMethod3, clsD2, 1);
                                } catch (InvocationTargetException e3) {
                                    bq.e.i(e3);
                                    throw null;
                                }
                                TreeMap treeMap = new TreeMap();
                                while (type2 != Object.class) {
                                }
                                return new l(hVar, treeMap).c();
                            }
                        } catch (NoSuchMethodException unused7) {
                            i5 = 0;
                        }
                        TreeMap treeMap2 = new TreeMap();
                        while (type2 != Object.class) {
                            Class clsD3 = m0.d(type2);
                            boolean zE = bq.e.e(clsD3);
                            Field[] declaredFields = clsD3.getDeclaredFields();
                            int length = declaredFields.length;
                            for (int i12 = i5; i12 < length; i12++) {
                                Field field = declaredFields[i12];
                                int modifiers = field.getModifiers();
                                if (!Modifier.isStatic(modifiers) && !Modifier.isTransient(modifiers) && ((Modifier.isPublic(modifiers) || Modifier.isProtected(modifiers) || !zE) && ((oVar = (o) field.getAnnotation(o.class)) == null || !oVar.ignore()))) {
                                    Type typeH = bq.e.h(type2, clsD3, field.getGenericType(), new LinkedHashSet());
                                    Set setF = bq.e.f(field.getAnnotations());
                                    String name2 = field.getName();
                                    r rVarB = h0Var.b(typeH, setF, name2);
                                    field.setAccessible(true);
                                    if (oVar != null) {
                                        String strName = oVar.name();
                                        if (!"\u0000".equals(strName)) {
                                            name2 = strName;
                                        }
                                    }
                                    k kVar = (k) treeMap2.put(name2, new k(name2, field, rVarB));
                                    if (kVar != null) {
                                        throw new IllegalArgumentException("Conflicting fields:\n    " + kVar.f15482b + "\n    " + field);
                                    }
                                }
                            }
                            Class clsD4 = m0.d(type2);
                            type2 = bq.e.h(type2, clsD4, clsD4.getGenericSuperclass(), new LinkedHashSet());
                            i5 = 0;
                        }
                        return new l(hVar, treeMap2).c();
                    }
                }
                return null;
            case 2:
                Class clsD5 = m0.d(type2);
                if (annotations.isEmpty()) {
                    if (clsD5 == List.class || clsD5 == Collection.class) {
                        return new m(h0Var.b(m0.a(type2), bq.e.f18422a, null), 0).c();
                    }
                    if (clsD5 == Set.class) {
                        return new m(h0Var.b(m0.a(type2), bq.e.f18422a, null), 1).c();
                    }
                }
                return null;
            case 3:
                if (!annotations.isEmpty() || (clsD = m0.d(type2)) != Map.class) {
                    return null;
                }
                if (type2 == Properties.class) {
                    actualTypeArguments = new Type[]{String.class, String.class};
                } else {
                    if (!Map.class.isAssignableFrom(clsD)) {
                        throw new IllegalArgumentException();
                    }
                    Type typeH2 = bq.e.h(type2, clsD, bq.e.d(type2, clsD, Map.class), new LinkedHashSet());
                    if (!(typeH2 instanceof ParameterizedType)) {
                        c11 = 0;
                        actualTypeArguments = new Type[]{Object.class, Object.class};
                        return new g(h0Var, actualTypeArguments[c11], actualTypeArguments[1]).c();
                    }
                    actualTypeArguments = ((ParameterizedType) typeH2).getActualTypeArguments();
                }
                c11 = 0;
                return new g(h0Var, actualTypeArguments[c11], actualTypeArguments[1]).c();
            case 4:
                return null;
            case 5:
                if (annotations.isEmpty()) {
                    Class cls4 = Boolean.TYPE;
                    j0 j0Var = m0.f15503b;
                    if (type2 == cls4) {
                        return j0Var;
                    }
                    Class cls5 = Byte.TYPE;
                    j0 j0Var2 = m0.f15504c;
                    if (type2 == cls5) {
                        return j0Var2;
                    }
                    Class cls6 = Character.TYPE;
                    j0 j0Var3 = m0.f15505d;
                    if (type2 == cls6) {
                        return j0Var3;
                    }
                    Class cls7 = Double.TYPE;
                    j0 j0Var4 = m0.f15506e;
                    if (type2 == cls7) {
                        return j0Var4;
                    }
                    Class cls8 = Float.TYPE;
                    j0 j0Var5 = m0.f15507f;
                    if (type2 == cls8) {
                        return j0Var5;
                    }
                    j0 j0Var6 = m0.f15508g;
                    if (type2 == cls) {
                        return j0Var6;
                    }
                    Class cls9 = Long.TYPE;
                    j0 j0Var7 = m0.f15509h;
                    if (type2 == cls9) {
                        return j0Var7;
                    }
                    Class cls10 = Short.TYPE;
                    j0 j0Var8 = m0.f15510i;
                    if (type2 == cls10) {
                        return j0Var8;
                    }
                    if (type2 == Boolean.class) {
                        return j0Var.c();
                    }
                    if (type2 == Byte.class) {
                        return j0Var2.c();
                    }
                    if (type2 == Character.class) {
                        return j0Var3.c();
                    }
                    if (type2 == Double.class) {
                        return j0Var4.c();
                    }
                    if (type2 == Float.class) {
                        return j0Var5.c();
                    }
                    if (type2 == Integer.class) {
                        return j0Var6.c();
                    }
                    if (type2 == Long.class) {
                        return j0Var7.c();
                    }
                    if (type2 == Short.class) {
                        return j0Var8.c();
                    }
                    if (type2 == String.class) {
                        return m0.f15511j.c();
                    }
                    if (type2 == Object.class) {
                        return new l0(h0Var).c();
                    }
                    Class clsD6 = m0.d(type2);
                    bq.a aVarC = bq.e.c(h0Var, type2, clsD6);
                    if (aVarC != null) {
                        return aVarC;
                    }
                    if (clsD6.isEnum()) {
                        return new k0(clsD6).c();
                    }
                }
                return null;
            default:
                Intrinsics.g(type2, "type");
                Intrinsics.g(annotations, "annotations");
                if (annotations.isEmpty()) {
                    Class clsD7 = m0.d(type2);
                    Intrinsics.f(clsD7, "getRawType(this)");
                    if (!clsD7.isInterface() && !clsD7.isEnum() && clsD7.isAnnotationPresent(Metadata.class) && !bq.e.e(clsD7)) {
                        try {
                            bq.a aVarC2 = bq.e.c(h0Var, type2, clsD7);
                            if (aVarC2 != null) {
                                return aVarC2;
                            }
                        } catch (RuntimeException e11) {
                            if (!(e11.getCause() instanceof ClassNotFoundException)) {
                                throw e11;
                            }
                        }
                        if (clsD7.isLocalClass()) {
                            throw new IllegalArgumentException("Cannot serialize local class or object expression ".concat(clsD7.getName()).toString());
                        }
                        KClass kClassE = JvmClassMappingKt.e(clsD7);
                        if (kClassE.isAbstract()) {
                            throw new IllegalArgumentException("Cannot serialize abstract class ".concat(clsD7.getName()).toString());
                        }
                        if (kClassE.isInner()) {
                            throw new IllegalArgumentException("Cannot serialize inner class ".concat(clsD7.getName()).toString());
                        }
                        if (kClassE.getObjectInstance() != null) {
                            throw new IllegalArgumentException("Cannot serialize object declaration ".concat(clsD7.getName()).toString());
                        }
                        if (kClassE.isSealed()) {
                            throw new IllegalArgumentException(("Cannot reflectively serialize sealed class " + clsD7.getName() + ". Please register an adapter.").toString());
                        }
                        KFunction primaryConstructor = KClasses.getPrimaryConstructor(kClassE);
                        if (primaryConstructor != null) {
                            List<KParameter> parameters = primaryConstructor.getParameters();
                            int iD0 = b70.k.d0(b70.c.u0(parameters, 10));
                            if (iD0 < 16) {
                                iD0 = 16;
                            }
                            LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
                            for (Object obj : parameters) {
                                linkedHashMap.put(((KParameter) obj).getName(), obj);
                            }
                            KCallablesJvm.setAccessible(primaryConstructor, true);
                            LinkedHashMap linkedHashMap2 = new LinkedHashMap();
                            for (KProperty1 kProperty1 : KClasses.getMemberProperties(kClassE)) {
                                KParameter kParameter = (KParameter) linkedHashMap.get(kProperty1.getName());
                                KCallablesJvm.setAccessible(kProperty1, z13);
                                Iterator<T> it = kProperty1.getAnnotations().iterator();
                                while (true) {
                                    if (it.hasNext()) {
                                        next = it.next();
                                        if (((Annotation) next) instanceof o) {
                                        }
                                    } else {
                                        next = null;
                                    }
                                }
                                o oVar2 = (o) next;
                                ArrayList arrayListK1 = b70.g.K1(kProperty1.getAnnotations());
                                if (kParameter != null) {
                                    b70.d.z0(kParameter.getAnnotations(), arrayListK1);
                                    if (oVar2 == null) {
                                        Iterator<T> it2 = kParameter.getAnnotations().iterator();
                                        while (true) {
                                            if (it2.hasNext()) {
                                                next2 = it2.next();
                                                if (((Annotation) next2) instanceof o) {
                                                }
                                            } else {
                                                next2 = null;
                                            }
                                        }
                                        oVar2 = (o) next2;
                                    }
                                }
                                Field javaField = ReflectJvmMapping.getJavaField(kProperty1);
                                if (Modifier.isTransient(javaField != null ? javaField.getModifiers() : 0)) {
                                    if (kParameter != null && !kParameter.isOptional()) {
                                        throw new IllegalArgumentException(("No default value for transient constructor " + kParameter).toString());
                                    }
                                } else if (oVar2 == null || oVar2.ignore() != z13) {
                                    if (kParameter != null && !Intrinsics.b(kParameter.getType(), kProperty1.getReturnType())) {
                                        throw new IllegalArgumentException(("'" + kProperty1.getName() + "' has a constructor parameter of type " + kParameter.getType() + " but a property of type " + kProperty1.getReturnType() + '.').toString());
                                    }
                                    if ((kProperty1 instanceof KMutableProperty1) || kParameter != null) {
                                        if (oVar2 == null || (name = oVar2.name()) == null) {
                                            name = kProperty1.getName();
                                            String str2 = name;
                                            classifier = kProperty1.getReturnType().getClassifier();
                                            if (classifier instanceof KClass) {
                                                z11 = z13;
                                                if (!(classifier instanceof KTypeParameter)) {
                                                    throw new IllegalStateException("Not possible!");
                                                }
                                                javaType = ReflectJvmMapping.getJavaType(kProperty1.getReturnType());
                                            } else {
                                                KClass kClass = (KClass) classifier;
                                                if (kClass.isValue()) {
                                                    Class clsB = JvmClassMappingKt.b(kClass);
                                                    if (kProperty1.getReturnType().getArguments().isEmpty()) {
                                                        z11 = z13;
                                                        javaType = clsB;
                                                    } else {
                                                        List<KTypeProjection> arguments = kProperty1.getReturnType().getArguments();
                                                        ArrayList arrayList = new ArrayList();
                                                        Iterator<T> it3 = arguments.iterator();
                                                        while (it3.hasNext()) {
                                                            KType type3 = ((KTypeProjection) it3.next()).getType();
                                                            if (type3 != null) {
                                                                z12 = z13;
                                                                javaType2 = ReflectJvmMapping.getJavaType(type3);
                                                            } else {
                                                                z12 = z13;
                                                                javaType2 = null;
                                                            }
                                                            if (javaType2 != null) {
                                                                arrayList.add(javaType2);
                                                            }
                                                            z13 = z12;
                                                        }
                                                        z11 = z13;
                                                        Type[] typeArr = (Type[]) arrayList.toArray(new Type[0]);
                                                        javaType = m0.f(clsB, (Type[]) Arrays.copyOf(typeArr, typeArr.length));
                                                    }
                                                } else {
                                                    z11 = z13;
                                                    javaType = ReflectJvmMapping.getJavaType(kProperty1.getReturnType());
                                                }
                                            }
                                            linkedHashMap2.put(kProperty1.getName(), new cq.a(str2, h0Var.b(bq.e.h(type2, clsD7, javaType, new LinkedHashSet()), bq.e.f((Annotation[]) arrayListK1.toArray(new Annotation[0])), kProperty1.getName()), kProperty1, kParameter, kParameter == null ? kParameter.getIndex() : -1));
                                            z13 = z11;
                                        } else {
                                            if (name.equals("\u0000")) {
                                                name = null;
                                            }
                                            if (name == null) {
                                            }
                                            String str22 = name;
                                            classifier = kProperty1.getReturnType().getClassifier();
                                            if (classifier instanceof KClass) {
                                            }
                                            linkedHashMap2.put(kProperty1.getName(), new cq.a(str22, h0Var.b(bq.e.h(type2, clsD7, javaType, new LinkedHashSet()), bq.e.f((Annotation[]) arrayListK1.toArray(new Annotation[0])), kProperty1.getName()), kProperty1, kParameter, kParameter == null ? kParameter.getIndex() : -1));
                                            z13 = z11;
                                        }
                                    }
                                } else if (kParameter != null && !kParameter.isOptional()) {
                                    throw new IllegalArgumentException(("No default value for ignored constructor " + kParameter).toString());
                                }
                            }
                            ArrayList arrayList2 = new ArrayList();
                            for (KParameter kParameter2 : primaryConstructor.getParameters()) {
                                cq.a aVar = (cq.a) TypeIntrinsics.c(linkedHashMap2).remove(kParameter2.getName());
                                if (aVar == null && !kParameter2.isOptional()) {
                                    throw new IllegalArgumentException(("No property for required constructor " + kParameter2).toString());
                                }
                                arrayList2.add(aVar);
                            }
                            int size = arrayList2.size();
                            Iterator it4 = linkedHashMap2.entrySet().iterator();
                            int i13 = size;
                            while (it4.hasNext()) {
                                cq.a aVar2 = (cq.a) ((Map.Entry) it4.next()).getValue();
                                String jsonName = aVar2.f47789a;
                                r rVar = aVar2.f47790b;
                                KProperty1 kProperty12 = aVar2.f47791c;
                                KParameter kParameter3 = aVar2.f47792d;
                                Intrinsics.g(jsonName, "jsonName");
                                arrayList2.add(new cq.a(jsonName, rVar, kProperty12, kParameter3, i13));
                                i13++;
                            }
                            ArrayList arrayListU0 = b70.g.U0(arrayList2);
                            ArrayList arrayList3 = new ArrayList(b70.c.u0(arrayListU0, 10));
                            Iterator it5 = arrayListU0.iterator();
                            while (it5.hasNext()) {
                                arrayList3.add(((cq.a) it5.next()).f47789a);
                            }
                            String[] strArr = (String[]) arrayList3.toArray(new String[0]);
                            return new k0(primaryConstructor, arrayList2, arrayListU0, e3.r((String[]) Arrays.copyOf(strArr, strArr.length))).c();
                        }
                    }
                }
                return null;
        }
    }
}
