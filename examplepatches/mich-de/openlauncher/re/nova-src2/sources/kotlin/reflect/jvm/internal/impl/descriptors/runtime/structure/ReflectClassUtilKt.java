package kotlin.reflect.jvm.internal.impl.descriptors.runtime.structure;

import b70.c;
import h6.c1;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Function;
import kotlin.Pair;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.jvm.JvmClassMappingKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function10;
import kotlin.jvm.functions.Function11;
import kotlin.jvm.functions.Function12;
import kotlin.jvm.functions.Function13;
import kotlin.jvm.functions.Function14;
import kotlin.jvm.functions.Function15;
import kotlin.jvm.functions.Function16;
import kotlin.jvm.functions.Function17;
import kotlin.jvm.functions.Function18;
import kotlin.jvm.functions.Function19;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function20;
import kotlin.jvm.functions.Function21;
import kotlin.jvm.functions.Function22;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.functions.Function5;
import kotlin.jvm.functions.Function6;
import kotlin.jvm.functions.Function7;
import kotlin.jvm.functions.Function8;
import kotlin.jvm.functions.Function9;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.ReflectionFactory;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.KClass;
import kotlin.reflect.jvm.internal.impl.name.ClassId;
import kotlin.reflect.jvm.internal.impl.name.FqName;
import kotlin.reflect.jvm.internal.impl.name.Name;
import kotlin.sequences.Sequence;
import kotlin.sequences.SequencesKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import q70.d;
import r70.j;
import ul.b;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class ReflectClassUtilKt {

    @NotNull
    private static final Map<Class<? extends Function<?>>, Integer> FUNCTION_CLASSES;

    @NotNull
    private static final List<KClass<? extends Object>> PRIMITIVE_CLASSES;

    @NotNull
    private static final Map<Class<? extends Object>, Class<? extends Object>> PRIMITIVE_TO_WRAPPER;

    @NotNull
    private static final Map<Class<? extends Object>, Class<? extends Object>> WRAPPER_TO_PRIMITIVE;

    static {
        ReflectionFactory reflectionFactory = Reflection.f71864a;
        int i5 = 0;
        List<KClass<? extends Object>> listQ = b.Q(reflectionFactory.getOrCreateKotlinClass(Boolean.TYPE), reflectionFactory.getOrCreateKotlinClass(Byte.TYPE), reflectionFactory.getOrCreateKotlinClass(Character.TYPE), reflectionFactory.getOrCreateKotlinClass(Double.TYPE), reflectionFactory.getOrCreateKotlinClass(Float.TYPE), reflectionFactory.getOrCreateKotlinClass(Integer.TYPE), reflectionFactory.getOrCreateKotlinClass(Long.TYPE), reflectionFactory.getOrCreateKotlinClass(Short.TYPE));
        PRIMITIVE_CLASSES = listQ;
        List<KClass<? extends Object>> list = listQ;
        ArrayList arrayList = new ArrayList(c.u0(list, 10));
        Iterator<T> it = list.iterator();
        while (it.hasNext()) {
            KClass kClass = (KClass) it.next();
            arrayList.add(new Pair(JvmClassMappingKt.c(kClass), JvmClassMappingKt.d(kClass)));
        }
        WRAPPER_TO_PRIMITIVE = MapsKt.r0(arrayList);
        List<KClass<? extends Object>> list2 = PRIMITIVE_CLASSES;
        ArrayList arrayList2 = new ArrayList(c.u0(list2, 10));
        Iterator<T> it2 = list2.iterator();
        while (it2.hasNext()) {
            KClass kClass2 = (KClass) it2.next();
            arrayList2.add(new Pair(JvmClassMappingKt.d(kClass2), JvmClassMappingKt.c(kClass2)));
        }
        PRIMITIVE_TO_WRAPPER = MapsKt.r0(arrayList2);
        List listQ2 = b.Q(Function0.class, Function1.class, Function2.class, Function3.class, Function4.class, Function5.class, Function6.class, Function7.class, Function8.class, Function9.class, Function10.class, Function11.class, Function12.class, Function13.class, Function14.class, Function15.class, Function16.class, Function17.class, Function18.class, Function19.class, Function20.class, Function21.class, Function22.class);
        ArrayList arrayList3 = new ArrayList(c.u0(listQ2, 10));
        for (Object obj : listQ2) {
            int i11 = i5 + 1;
            if (i5 < 0) {
                b.e0();
                throw null;
            }
            arrayList3.add(new Pair((Class) obj, Integer.valueOf(i5)));
            i5 = i11;
        }
        FUNCTION_CLASSES = MapsKt.r0(arrayList3);
    }

    @NotNull
    public static final ClassId getClassId(@NotNull Class<?> cls) {
        ClassId classIdCreateNestedClassId;
        ClassId classId;
        Intrinsics.g(cls, "<this>");
        if (cls.isPrimitive()) {
            throw new IllegalArgumentException(c1.r(cls, "Can't compute ClassId for primitive type: "));
        }
        if (cls.isArray()) {
            throw new IllegalArgumentException(c1.r(cls, "Can't compute ClassId for array type: "));
        }
        if (cls.getEnclosingMethod() != null || cls.getEnclosingConstructor() != null || cls.getSimpleName().length() == 0) {
            FqName fqName = new FqName(cls.getName());
            return new ClassId(fqName.parent(), FqName.topLevel(fqName.shortName()), true);
        }
        Class<?> declaringClass = cls.getDeclaringClass();
        if (declaringClass == null || (classId = getClassId(declaringClass)) == null || (classIdCreateNestedClassId = classId.createNestedClassId(Name.identifier(cls.getSimpleName()))) == null) {
            classIdCreateNestedClassId = ClassId.topLevel(new FqName(cls.getName()));
        }
        Intrinsics.d(classIdCreateNestedClassId);
        return classIdCreateNestedClassId;
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue
    java.lang.NullPointerException: Cannot invoke "java.util.List.iterator()" because the return value of "jadx.core.dex.visitors.regions.SwitchOverStringVisitor$SwitchData.getNewCases()" is null
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.restoreSwitchOverString(SwitchOverStringVisitor.java:109)
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visitRegion(SwitchOverStringVisitor.java:66)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:77)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:82)
     */
    @NotNull
    public static final String getDesc(@NotNull Class<?> cls) {
        Intrinsics.g(cls, "<this>");
        if (!cls.isPrimitive()) {
            if (cls.isArray()) {
                return j.E0(cls.getName(), '.', '/');
            }
            return "L" + j.E0(cls.getName(), '.', '/') + ';';
        }
        String name = cls.getName();
        switch (name.hashCode()) {
            case -1325958191:
                if (name.equals("double")) {
                    return "D";
                }
                break;
            case 104431:
                if (name.equals("int")) {
                    return "I";
                }
                break;
            case 3039496:
                if (name.equals("byte")) {
                    return "B";
                }
                break;
            case 3052374:
                if (name.equals("char")) {
                    return "C";
                }
                break;
            case 3327612:
                if (name.equals("long")) {
                    return "J";
                }
                break;
            case 3625364:
                if (name.equals("void")) {
                    return "V";
                }
                break;
            case 64711720:
                if (name.equals("boolean")) {
                    return "Z";
                }
                break;
            case 97526364:
                if (name.equals("float")) {
                    return "F";
                }
                break;
            case 109413500:
                if (name.equals("short")) {
                    return "S";
                }
                break;
        }
        throw new IllegalArgumentException(c1.r(cls, "Unsupported primitive type: "));
    }

    @Nullable
    public static final Integer getFunctionClassArity(@NotNull Class<?> cls) {
        Intrinsics.g(cls, "<this>");
        return FUNCTION_CLASSES.get(cls);
    }

    @NotNull
    public static final List<Type> getParameterizedTypeArguments(@NotNull Type type) {
        Intrinsics.g(type, "<this>");
        if (!(type instanceof ParameterizedType)) {
            return EmptyList.f71733a;
        }
        ParameterizedType parameterizedType = (ParameterizedType) type;
        if (parameterizedType.getOwnerType() != null) {
            return SequencesKt.A0(SequencesKt.w0(d.p0(type, new Function1<ParameterizedType, ParameterizedType>() { // from class: kotlin.reflect.jvm.internal.impl.descriptors.runtime.structure.ReflectClassUtilKt$parameterizedTypeArguments$1
                @Override // kotlin.jvm.functions.Function1
                @Nullable
                public final ParameterizedType invoke(@NotNull ParameterizedType it) {
                    Intrinsics.g(it, "it");
                    Type ownerType = it.getOwnerType();
                    if (ownerType instanceof ParameterizedType) {
                        return (ParameterizedType) ownerType;
                    }
                    return null;
                }
            }), new Function1<ParameterizedType, Sequence<? extends Type>>() { // from class: kotlin.reflect.jvm.internal.impl.descriptors.runtime.structure.ReflectClassUtilKt$parameterizedTypeArguments$2
                @Override // kotlin.jvm.functions.Function1
                @NotNull
                public final Sequence<Type> invoke(@NotNull ParameterizedType it) {
                    Intrinsics.g(it, "it");
                    Type[] actualTypeArguments = it.getActualTypeArguments();
                    Intrinsics.f(actualTypeArguments, "getActualTypeArguments(...)");
                    return kotlin.collections.c.n0(actualTypeArguments);
                }
            }));
        }
        Type[] actualTypeArguments = parameterizedType.getActualTypeArguments();
        Intrinsics.f(actualTypeArguments, "getActualTypeArguments(...)");
        return kotlin.collections.c.b1(actualTypeArguments);
    }

    @Nullable
    public static final Class<?> getPrimitiveByWrapper(@NotNull Class<?> cls) {
        Intrinsics.g(cls, "<this>");
        return WRAPPER_TO_PRIMITIVE.get(cls);
    }

    @NotNull
    public static final ClassLoader getSafeClassLoader(@NotNull Class<?> cls) {
        Intrinsics.g(cls, "<this>");
        ClassLoader classLoader = cls.getClassLoader();
        if (classLoader != null) {
            return classLoader;
        }
        ClassLoader systemClassLoader = ClassLoader.getSystemClassLoader();
        Intrinsics.f(systemClassLoader, "getSystemClassLoader(...)");
        return systemClassLoader;
    }

    @Nullable
    public static final Class<?> getWrapperByPrimitive(@NotNull Class<?> cls) {
        Intrinsics.g(cls, "<this>");
        return PRIMITIVE_TO_WRAPPER.get(cls);
    }

    public static final boolean isEnumClassOrSpecializedEnumEntryClass(@NotNull Class<?> cls) {
        Intrinsics.g(cls, "<this>");
        return Enum.class.isAssignableFrom(cls);
    }
}
