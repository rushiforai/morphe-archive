package kotlin.reflect.jvm.internal.impl.builtins.jvm;

import b.c0;
import java.lang.annotation.Annotation;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.jvm.internal.impl.builtins.CompanionObjectMapping;
import kotlin.reflect.jvm.internal.impl.builtins.PrimitiveType;
import kotlin.reflect.jvm.internal.impl.builtins.StandardNames;
import kotlin.reflect.jvm.internal.impl.builtins.functions.FunctionTypeKind;
import kotlin.reflect.jvm.internal.impl.name.ClassId;
import kotlin.reflect.jvm.internal.impl.name.FqName;
import kotlin.reflect.jvm.internal.impl.name.FqNameUnsafe;
import kotlin.reflect.jvm.internal.impl.name.FqNamesUtilKt;
import kotlin.reflect.jvm.internal.impl.name.Name;
import kotlin.reflect.jvm.internal.impl.name.SpecialNames;
import kotlin.reflect.jvm.internal.impl.name.StandardClassIds;
import kotlin.reflect.jvm.internal.impl.resolve.jvm.JvmPrimitiveType;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.i;
import r70.k;
import ul.b;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class JavaToKotlinClassMap {

    @NotNull
    private static final ClassId CLASS_CLASS_ID;

    @NotNull
    private static final ClassId FUNCTION_N_CLASS_ID;

    @NotNull
    private static final FqName FUNCTION_N_FQ_NAME;

    @NotNull
    public static final JavaToKotlinClassMap INSTANCE;

    @NotNull
    private static final ClassId K_CLASS_CLASS_ID;

    @NotNull
    private static final ClassId K_FUNCTION_CLASS_ID;

    @NotNull
    private static final String NUMBERED_FUNCTION_PREFIX;

    @NotNull
    private static final String NUMBERED_K_FUNCTION_PREFIX;

    @NotNull
    private static final String NUMBERED_K_SUSPEND_FUNCTION_PREFIX;

    @NotNull
    private static final String NUMBERED_SUSPEND_FUNCTION_PREFIX;

    @NotNull
    private static final HashMap<FqNameUnsafe, ClassId> javaToKotlin;

    @NotNull
    private static final HashMap<FqNameUnsafe, ClassId> kotlinToJava;

    @NotNull
    private static final List<PlatformMutabilityMapping> mutabilityMappings;

    @NotNull
    private static final HashMap<FqNameUnsafe, FqName> mutableToReadOnly;

    @NotNull
    private static final HashMap<ClassId, ClassId> mutableToReadOnlyClassId;

    @NotNull
    private static final HashMap<FqNameUnsafe, FqName> readOnlyToMutable;

    @NotNull
    private static final HashMap<ClassId, ClassId> readOnlyToMutableClassId;

    public static final class PlatformMutabilityMapping {

        @NotNull
        private final ClassId javaClass;

        @NotNull
        private final ClassId kotlinMutable;

        @NotNull
        private final ClassId kotlinReadOnly;

        public PlatformMutabilityMapping(@NotNull ClassId javaClass, @NotNull ClassId kotlinReadOnly, @NotNull ClassId kotlinMutable) {
            Intrinsics.g(javaClass, "javaClass");
            Intrinsics.g(kotlinReadOnly, "kotlinReadOnly");
            Intrinsics.g(kotlinMutable, "kotlinMutable");
            this.javaClass = javaClass;
            this.kotlinReadOnly = kotlinReadOnly;
            this.kotlinMutable = kotlinMutable;
        }

        @NotNull
        public final ClassId component1() {
            return this.javaClass;
        }

        @NotNull
        public final ClassId component2() {
            return this.kotlinReadOnly;
        }

        @NotNull
        public final ClassId component3() {
            return this.kotlinMutable;
        }

        public boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof PlatformMutabilityMapping)) {
                return false;
            }
            PlatformMutabilityMapping platformMutabilityMapping = (PlatformMutabilityMapping) obj;
            return Intrinsics.b(this.javaClass, platformMutabilityMapping.javaClass) && Intrinsics.b(this.kotlinReadOnly, platformMutabilityMapping.kotlinReadOnly) && Intrinsics.b(this.kotlinMutable, platformMutabilityMapping.kotlinMutable);
        }

        @NotNull
        public final ClassId getJavaClass() {
            return this.javaClass;
        }

        public int hashCode() {
            return this.kotlinMutable.hashCode() + ((this.kotlinReadOnly.hashCode() + (this.javaClass.hashCode() * 31)) * 31);
        }

        @NotNull
        public String toString() {
            return "PlatformMutabilityMapping(javaClass=" + this.javaClass + ", kotlinReadOnly=" + this.kotlinReadOnly + ", kotlinMutable=" + this.kotlinMutable + ')';
        }
    }

    static {
        JavaToKotlinClassMap javaToKotlinClassMap = new JavaToKotlinClassMap();
        INSTANCE = javaToKotlinClassMap;
        StringBuilder sb2 = new StringBuilder();
        FunctionTypeKind.Function function = FunctionTypeKind.Function.INSTANCE;
        sb2.append(function.getPackageFqName().toString());
        sb2.append('.');
        sb2.append(function.getClassNamePrefix());
        NUMBERED_FUNCTION_PREFIX = sb2.toString();
        StringBuilder sb3 = new StringBuilder();
        FunctionTypeKind.KFunction kFunction = FunctionTypeKind.KFunction.INSTANCE;
        sb3.append(kFunction.getPackageFqName().toString());
        sb3.append('.');
        sb3.append(kFunction.getClassNamePrefix());
        NUMBERED_K_FUNCTION_PREFIX = sb3.toString();
        StringBuilder sb4 = new StringBuilder();
        FunctionTypeKind.SuspendFunction suspendFunction = FunctionTypeKind.SuspendFunction.INSTANCE;
        sb4.append(suspendFunction.getPackageFqName().toString());
        sb4.append('.');
        sb4.append(suspendFunction.getClassNamePrefix());
        NUMBERED_SUSPEND_FUNCTION_PREFIX = sb4.toString();
        StringBuilder sb5 = new StringBuilder();
        FunctionTypeKind.KSuspendFunction kSuspendFunction = FunctionTypeKind.KSuspendFunction.INSTANCE;
        sb5.append(kSuspendFunction.getPackageFqName().toString());
        sb5.append('.');
        sb5.append(kSuspendFunction.getClassNamePrefix());
        NUMBERED_K_SUSPEND_FUNCTION_PREFIX = sb5.toString();
        ClassId classId = ClassId.topLevel(new FqName("kotlin.jvm.functions.FunctionN"));
        Intrinsics.f(classId, "topLevel(...)");
        FUNCTION_N_CLASS_ID = classId;
        FqName fqNameAsSingleFqName = classId.asSingleFqName();
        Intrinsics.f(fqNameAsSingleFqName, "asSingleFqName(...)");
        FUNCTION_N_FQ_NAME = fqNameAsSingleFqName;
        StandardClassIds standardClassIds = StandardClassIds.INSTANCE;
        K_FUNCTION_CLASS_ID = standardClassIds.getKFunction();
        K_CLASS_CLASS_ID = standardClassIds.getKClass();
        CLASS_CLASS_ID = javaToKotlinClassMap.classId(Class.class);
        javaToKotlin = new HashMap<>();
        kotlinToJava = new HashMap<>();
        mutableToReadOnly = new HashMap<>();
        readOnlyToMutable = new HashMap<>();
        mutableToReadOnlyClassId = new HashMap<>();
        readOnlyToMutableClassId = new HashMap<>();
        ClassId classId2 = ClassId.topLevel(StandardNames.FqNames.iterable);
        Intrinsics.f(classId2, "topLevel(...)");
        FqName fqName = StandardNames.FqNames.mutableIterable;
        FqName packageFqName = classId2.getPackageFqName();
        FqName packageFqName2 = classId2.getPackageFqName();
        Intrinsics.f(packageFqName2, "getPackageFqName(...)");
        PlatformMutabilityMapping platformMutabilityMapping = new PlatformMutabilityMapping(javaToKotlinClassMap.classId(Iterable.class), classId2, new ClassId(packageFqName, FqNamesUtilKt.tail(fqName, packageFqName2), false));
        ClassId classId3 = ClassId.topLevel(StandardNames.FqNames.iterator);
        Intrinsics.f(classId3, "topLevel(...)");
        FqName fqName2 = StandardNames.FqNames.mutableIterator;
        FqName packageFqName3 = classId3.getPackageFqName();
        FqName packageFqName4 = classId3.getPackageFqName();
        Intrinsics.f(packageFqName4, "getPackageFqName(...)");
        PlatformMutabilityMapping platformMutabilityMapping2 = new PlatformMutabilityMapping(javaToKotlinClassMap.classId(Iterator.class), classId3, new ClassId(packageFqName3, FqNamesUtilKt.tail(fqName2, packageFqName4), false));
        ClassId classId4 = ClassId.topLevel(StandardNames.FqNames.collection);
        Intrinsics.f(classId4, "topLevel(...)");
        FqName fqName3 = StandardNames.FqNames.mutableCollection;
        FqName packageFqName5 = classId4.getPackageFqName();
        FqName packageFqName6 = classId4.getPackageFqName();
        Intrinsics.f(packageFqName6, "getPackageFqName(...)");
        PlatformMutabilityMapping platformMutabilityMapping3 = new PlatformMutabilityMapping(javaToKotlinClassMap.classId(Collection.class), classId4, new ClassId(packageFqName5, FqNamesUtilKt.tail(fqName3, packageFqName6), false));
        ClassId classId5 = ClassId.topLevel(StandardNames.FqNames.list);
        Intrinsics.f(classId5, "topLevel(...)");
        FqName fqName4 = StandardNames.FqNames.mutableList;
        FqName packageFqName7 = classId5.getPackageFqName();
        FqName packageFqName8 = classId5.getPackageFqName();
        Intrinsics.f(packageFqName8, "getPackageFqName(...)");
        PlatformMutabilityMapping platformMutabilityMapping4 = new PlatformMutabilityMapping(javaToKotlinClassMap.classId(List.class), classId5, new ClassId(packageFqName7, FqNamesUtilKt.tail(fqName4, packageFqName8), false));
        ClassId classId6 = ClassId.topLevel(StandardNames.FqNames.set);
        Intrinsics.f(classId6, "topLevel(...)");
        FqName fqName5 = StandardNames.FqNames.mutableSet;
        FqName packageFqName9 = classId6.getPackageFqName();
        FqName packageFqName10 = classId6.getPackageFqName();
        Intrinsics.f(packageFqName10, "getPackageFqName(...)");
        PlatformMutabilityMapping platformMutabilityMapping5 = new PlatformMutabilityMapping(javaToKotlinClassMap.classId(Set.class), classId6, new ClassId(packageFqName9, FqNamesUtilKt.tail(fqName5, packageFqName10), false));
        ClassId classId7 = ClassId.topLevel(StandardNames.FqNames.listIterator);
        Intrinsics.f(classId7, "topLevel(...)");
        FqName fqName6 = StandardNames.FqNames.mutableListIterator;
        FqName packageFqName11 = classId7.getPackageFqName();
        FqName packageFqName12 = classId7.getPackageFqName();
        Intrinsics.f(packageFqName12, "getPackageFqName(...)");
        PlatformMutabilityMapping platformMutabilityMapping6 = new PlatformMutabilityMapping(javaToKotlinClassMap.classId(ListIterator.class), classId7, new ClassId(packageFqName11, FqNamesUtilKt.tail(fqName6, packageFqName12), false));
        FqName fqName7 = StandardNames.FqNames.map;
        ClassId classId8 = ClassId.topLevel(fqName7);
        Intrinsics.f(classId8, "topLevel(...)");
        FqName fqName8 = StandardNames.FqNames.mutableMap;
        FqName packageFqName13 = classId8.getPackageFqName();
        FqName packageFqName14 = classId8.getPackageFqName();
        Intrinsics.f(packageFqName14, "getPackageFqName(...)");
        PlatformMutabilityMapping platformMutabilityMapping7 = new PlatformMutabilityMapping(javaToKotlinClassMap.classId(Map.class), classId8, new ClassId(packageFqName13, FqNamesUtilKt.tail(fqName8, packageFqName14), false));
        ClassId classIdCreateNestedClassId = ClassId.topLevel(fqName7).createNestedClassId(StandardNames.FqNames.mapEntry.shortName());
        Intrinsics.f(classIdCreateNestedClassId, "createNestedClassId(...)");
        FqName fqName9 = StandardNames.FqNames.mutableMapEntry;
        FqName packageFqName15 = classIdCreateNestedClassId.getPackageFqName();
        FqName packageFqName16 = classIdCreateNestedClassId.getPackageFqName();
        Intrinsics.f(packageFqName16, "getPackageFqName(...)");
        FqName fqNameTail = FqNamesUtilKt.tail(fqName9, packageFqName16);
        List<PlatformMutabilityMapping> listQ = b.Q(platformMutabilityMapping, platformMutabilityMapping2, platformMutabilityMapping3, platformMutabilityMapping4, platformMutabilityMapping5, platformMutabilityMapping6, platformMutabilityMapping7, new PlatformMutabilityMapping(javaToKotlinClassMap.classId(Map.Entry.class), classIdCreateNestedClassId, new ClassId(packageFqName15, fqNameTail, false)));
        mutabilityMappings = listQ;
        javaToKotlinClassMap.addTopLevel(Object.class, StandardNames.FqNames.any);
        javaToKotlinClassMap.addTopLevel(String.class, StandardNames.FqNames.string);
        javaToKotlinClassMap.addTopLevel(CharSequence.class, StandardNames.FqNames.charSequence);
        javaToKotlinClassMap.addTopLevel(Throwable.class, StandardNames.FqNames.throwable);
        javaToKotlinClassMap.addTopLevel(Cloneable.class, StandardNames.FqNames.cloneable);
        javaToKotlinClassMap.addTopLevel(Number.class, StandardNames.FqNames.number);
        javaToKotlinClassMap.addTopLevel(Comparable.class, StandardNames.FqNames.comparable);
        javaToKotlinClassMap.addTopLevel(Enum.class, StandardNames.FqNames._enum);
        javaToKotlinClassMap.addTopLevel(Annotation.class, StandardNames.FqNames.annotation);
        Iterator<PlatformMutabilityMapping> it = listQ.iterator();
        while (it.hasNext()) {
            INSTANCE.addMapping(it.next());
        }
        for (JvmPrimitiveType jvmPrimitiveType : JvmPrimitiveType.values()) {
            JavaToKotlinClassMap javaToKotlinClassMap2 = INSTANCE;
            ClassId classId9 = ClassId.topLevel(jvmPrimitiveType.getWrapperFqName());
            Intrinsics.f(classId9, "topLevel(...)");
            PrimitiveType primitiveType = jvmPrimitiveType.getPrimitiveType();
            Intrinsics.f(primitiveType, "getPrimitiveType(...)");
            ClassId classId10 = ClassId.topLevel(StandardNames.getPrimitiveFqName(primitiveType));
            Intrinsics.f(classId10, "topLevel(...)");
            javaToKotlinClassMap2.add(classId9, classId10);
        }
        for (ClassId classId11 : CompanionObjectMapping.INSTANCE.allClassesWithIntrinsicCompanions()) {
            JavaToKotlinClassMap javaToKotlinClassMap3 = INSTANCE;
            ClassId classId12 = ClassId.topLevel(new FqName("kotlin.jvm.internal." + classId11.getShortClassName().asString() + "CompanionObject"));
            Intrinsics.f(classId12, "topLevel(...)");
            ClassId classIdCreateNestedClassId2 = classId11.createNestedClassId(SpecialNames.DEFAULT_NAME_FOR_COMPANION_OBJECT);
            Intrinsics.f(classIdCreateNestedClassId2, "createNestedClassId(...)");
            javaToKotlinClassMap3.add(classId12, classIdCreateNestedClassId2);
        }
        for (int i5 = 0; i5 < 23; i5++) {
            JavaToKotlinClassMap javaToKotlinClassMap4 = INSTANCE;
            ClassId classId13 = ClassId.topLevel(new FqName(c0.h(i5, "kotlin.jvm.functions.Function")));
            Intrinsics.f(classId13, "topLevel(...)");
            javaToKotlinClassMap4.add(classId13, StandardNames.getFunctionClassId(i5));
            javaToKotlinClassMap4.addKotlinToJava(new FqName(c0.p(new StringBuilder(), NUMBERED_K_FUNCTION_PREFIX, i5)), K_FUNCTION_CLASS_ID);
        }
        for (int i11 = 0; i11 < 22; i11++) {
            FunctionTypeKind.KSuspendFunction kSuspendFunction2 = FunctionTypeKind.KSuspendFunction.INSTANCE;
            INSTANCE.addKotlinToJava(new FqName((kSuspendFunction2.getPackageFqName().toString() + '.' + kSuspendFunction2.getClassNamePrefix()) + i11), K_FUNCTION_CLASS_ID);
        }
        JavaToKotlinClassMap javaToKotlinClassMap5 = INSTANCE;
        FqName safe = StandardNames.FqNames.nothing.toSafe();
        Intrinsics.f(safe, "toSafe(...)");
        javaToKotlinClassMap5.addKotlinToJava(safe, javaToKotlinClassMap5.classId(Void.class));
    }

    private JavaToKotlinClassMap() {
    }

    private final void add(ClassId classId, ClassId classId2) {
        addJavaToKotlin(classId, classId2);
        FqName fqNameAsSingleFqName = classId2.asSingleFqName();
        Intrinsics.f(fqNameAsSingleFqName, "asSingleFqName(...)");
        addKotlinToJava(fqNameAsSingleFqName, classId);
    }

    private final void addJavaToKotlin(ClassId classId, ClassId classId2) {
        HashMap<FqNameUnsafe, ClassId> map = javaToKotlin;
        FqNameUnsafe unsafe = classId.asSingleFqName().toUnsafe();
        Intrinsics.f(unsafe, "toUnsafe(...)");
        map.put(unsafe, classId2);
    }

    private final void addKotlinToJava(FqName fqName, ClassId classId) {
        HashMap<FqNameUnsafe, ClassId> map = kotlinToJava;
        FqNameUnsafe unsafe = fqName.toUnsafe();
        Intrinsics.f(unsafe, "toUnsafe(...)");
        map.put(unsafe, classId);
    }

    private final void addMapping(PlatformMutabilityMapping platformMutabilityMapping) {
        ClassId classIdComponent1 = platformMutabilityMapping.component1();
        ClassId classIdComponent2 = platformMutabilityMapping.component2();
        ClassId classIdComponent3 = platformMutabilityMapping.component3();
        add(classIdComponent1, classIdComponent2);
        FqName fqNameAsSingleFqName = classIdComponent3.asSingleFqName();
        Intrinsics.f(fqNameAsSingleFqName, "asSingleFqName(...)");
        addKotlinToJava(fqNameAsSingleFqName, classIdComponent1);
        mutableToReadOnlyClassId.put(classIdComponent3, classIdComponent2);
        readOnlyToMutableClassId.put(classIdComponent2, classIdComponent3);
        FqName fqNameAsSingleFqName2 = classIdComponent2.asSingleFqName();
        Intrinsics.f(fqNameAsSingleFqName2, "asSingleFqName(...)");
        FqName fqNameAsSingleFqName3 = classIdComponent3.asSingleFqName();
        Intrinsics.f(fqNameAsSingleFqName3, "asSingleFqName(...)");
        HashMap<FqNameUnsafe, FqName> map = mutableToReadOnly;
        FqNameUnsafe unsafe = classIdComponent3.asSingleFqName().toUnsafe();
        Intrinsics.f(unsafe, "toUnsafe(...)");
        map.put(unsafe, fqNameAsSingleFqName2);
        HashMap<FqNameUnsafe, FqName> map2 = readOnlyToMutable;
        FqNameUnsafe unsafe2 = fqNameAsSingleFqName2.toUnsafe();
        Intrinsics.f(unsafe2, "toUnsafe(...)");
        map2.put(unsafe2, fqNameAsSingleFqName3);
    }

    private final void addTopLevel(Class<?> cls, FqNameUnsafe fqNameUnsafe) {
        FqName safe = fqNameUnsafe.toSafe();
        Intrinsics.f(safe, "toSafe(...)");
        addTopLevel(cls, safe);
    }

    private final ClassId classId(Class<?> cls) {
        if (!cls.isPrimitive()) {
            cls.isArray();
        }
        Class<?> declaringClass = cls.getDeclaringClass();
        if (declaringClass == null) {
            ClassId classId = ClassId.topLevel(new FqName(cls.getCanonicalName()));
            Intrinsics.f(classId, "topLevel(...)");
            return classId;
        }
        ClassId classIdCreateNestedClassId = classId(declaringClass).createNestedClassId(Name.identifier(cls.getSimpleName()));
        Intrinsics.f(classIdCreateNestedClassId, "createNestedClassId(...)");
        return classIdCreateNestedClassId;
    }

    private final boolean isKotlinFunctionWithBigArity(FqNameUnsafe fqNameUnsafe, String str) {
        Integer numU0;
        String strAsString = fqNameUnsafe.asString();
        Intrinsics.f(strAsString, "asString(...)");
        String strM1 = k.m1(strAsString, str, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        return strM1.length() > 0 && !k.k1(strM1, '0') && (numU0 = i.u0(strM1)) != null && numU0.intValue() >= 23;
    }

    @NotNull
    public final FqName getFUNCTION_N_FQ_NAME() {
        return FUNCTION_N_FQ_NAME;
    }

    @NotNull
    public final List<PlatformMutabilityMapping> getMutabilityMappings() {
        return mutabilityMappings;
    }

    public final boolean isMutable(@Nullable FqNameUnsafe fqNameUnsafe) {
        return mutableToReadOnly.containsKey(fqNameUnsafe);
    }

    public final boolean isReadOnly(@Nullable FqNameUnsafe fqNameUnsafe) {
        return readOnlyToMutable.containsKey(fqNameUnsafe);
    }

    @Nullable
    public final ClassId mapJavaToKotlin(@NotNull FqName fqName) {
        Intrinsics.g(fqName, "fqName");
        return javaToKotlin.get(fqName.toUnsafe());
    }

    @Nullable
    public final ClassId mapKotlinToJava(@NotNull FqNameUnsafe kotlinFqName) {
        Intrinsics.g(kotlinFqName, "kotlinFqName");
        if (!isKotlinFunctionWithBigArity(kotlinFqName, NUMBERED_FUNCTION_PREFIX) && !isKotlinFunctionWithBigArity(kotlinFqName, NUMBERED_SUSPEND_FUNCTION_PREFIX)) {
            if (!isKotlinFunctionWithBigArity(kotlinFqName, NUMBERED_K_FUNCTION_PREFIX) && !isKotlinFunctionWithBigArity(kotlinFqName, NUMBERED_K_SUSPEND_FUNCTION_PREFIX)) {
                return kotlinToJava.get(kotlinFqName);
            }
            return K_FUNCTION_CLASS_ID;
        }
        return FUNCTION_N_CLASS_ID;
    }

    @Nullable
    public final FqName mutableToReadOnly(@Nullable FqNameUnsafe fqNameUnsafe) {
        return mutableToReadOnly.get(fqNameUnsafe);
    }

    @Nullable
    public final FqName readOnlyToMutable(@Nullable FqNameUnsafe fqNameUnsafe) {
        return readOnlyToMutable.get(fqNameUnsafe);
    }

    private final void addTopLevel(Class<?> cls, FqName fqName) {
        ClassId classId = classId(cls);
        ClassId classId2 = ClassId.topLevel(fqName);
        Intrinsics.f(classId2, "topLevel(...)");
        add(classId, classId2);
    }
}
