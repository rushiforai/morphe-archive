package kotlin.reflect.jvm.internal.impl.name;

import b70.k;
import b70.n;
import fq.c;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class StandardClassIds {

    @NotNull
    private static final ClassId Annotation;

    @NotNull
    private static final ClassId AnnotationRetention;

    @NotNull
    private static final ClassId AnnotationTarget;

    @NotNull
    private static final ClassId Any;

    @NotNull
    private static final ClassId Array;

    @NotNull
    private static final FqName BASE_ANNOTATION_PACKAGE;

    @NotNull
    private static final FqName BASE_COLLECTIONS_PACKAGE;

    @NotNull
    private static final FqName BASE_CONCURRENT_PACKAGE;

    @NotNull
    private static final FqName BASE_CONTRACTS_PACKAGE;

    @NotNull
    private static final FqName BASE_COROUTINES_PACKAGE;

    @NotNull
    private static final FqName BASE_ENUMS_PACKAGE;

    @NotNull
    private static final FqName BASE_INTERNAL_IR_PACKAGE;

    @NotNull
    private static final FqName BASE_INTERNAL_PACKAGE;

    @NotNull
    private static final FqName BASE_JVM_INTERNAL_PACKAGE;

    @NotNull
    private static final FqName BASE_JVM_PACKAGE;

    @NotNull
    private static final FqName BASE_KOTLIN_PACKAGE;

    @NotNull
    private static final FqName BASE_RANGES_PACKAGE;

    @NotNull
    private static final FqName BASE_REFLECT_PACKAGE;

    @NotNull
    private static final FqName BASE_TEST_PACKAGE;

    @NotNull
    private static final ClassId Boolean;

    @NotNull
    private static final ClassId Byte;

    @NotNull
    private static final ClassId Char;

    @NotNull
    private static final ClassId CharIterator;

    @NotNull
    private static final ClassId CharRange;

    @NotNull
    private static final ClassId CharSequence;

    @NotNull
    private static final ClassId Cloneable;

    @NotNull
    private static final ClassId Collection;

    @NotNull
    private static final ClassId Comparable;

    @NotNull
    private static final ClassId Continuation;

    @NotNull
    private static final ClassId DeprecationLevel;

    @NotNull
    private static final ClassId Double;

    @NotNull
    private static final ClassId Enum;

    @NotNull
    private static final ClassId EnumEntries;

    @NotNull
    private static final ClassId Float;

    @NotNull
    private static final ClassId Function;

    @NotNull
    public static final StandardClassIds INSTANCE = new StandardClassIds();

    @NotNull
    private static final ClassId Int;

    @NotNull
    private static final ClassId IntRange;

    @NotNull
    private static final ClassId Iterable;

    @NotNull
    private static final ClassId Iterator;

    @NotNull
    private static final ClassId KCallable;

    @NotNull
    private static final ClassId KClass;

    @NotNull
    private static final ClassId KFunction;

    @NotNull
    private static final ClassId KMutableProperty;

    @NotNull
    private static final ClassId KMutableProperty0;

    @NotNull
    private static final ClassId KMutableProperty1;

    @NotNull
    private static final ClassId KMutableProperty2;

    @NotNull
    private static final ClassId KProperty;

    @NotNull
    private static final ClassId KProperty0;

    @NotNull
    private static final ClassId KProperty1;

    @NotNull
    private static final ClassId KProperty2;

    @NotNull
    private static final ClassId KType;

    @NotNull
    private static final ClassId List;

    @NotNull
    private static final ClassId ListIterator;

    @NotNull
    private static final ClassId Long;

    @NotNull
    private static final ClassId LongRange;

    @NotNull
    private static final ClassId Map;

    @NotNull
    private static final ClassId MapEntry;

    @NotNull
    private static final ClassId MutableCollection;

    @NotNull
    private static final ClassId MutableIterable;

    @NotNull
    private static final ClassId MutableIterator;

    @NotNull
    private static final ClassId MutableList;

    @NotNull
    private static final ClassId MutableListIterator;

    @NotNull
    private static final ClassId MutableMap;

    @NotNull
    private static final ClassId MutableMapEntry;

    @NotNull
    private static final ClassId MutableSet;

    @NotNull
    private static final ClassId Nothing;

    @NotNull
    private static final ClassId Number;

    @NotNull
    private static final ClassId Result;

    @NotNull
    private static final ClassId Set;

    @NotNull
    private static final ClassId Short;

    @NotNull
    private static final ClassId String;

    @NotNull
    private static final ClassId Throwable;

    @NotNull
    private static final ClassId UByte;

    @NotNull
    private static final ClassId UInt;

    @NotNull
    private static final ClassId ULong;

    @NotNull
    private static final ClassId UShort;

    @NotNull
    private static final ClassId Unit;

    @NotNull
    private static final Set<FqName> builtInsPackages;

    @NotNull
    private static final Set<ClassId> constantAllowedTypes;

    @NotNull
    private static final Map<ClassId, ClassId> elementTypeByPrimitiveArrayType;

    @NotNull
    private static final Map<ClassId, ClassId> elementTypeByUnsignedArrayType;

    @NotNull
    private static final Map<ClassId, ClassId> primitiveArrayTypeByElementType;

    @NotNull
    private static final Set<ClassId> primitiveTypes;

    @NotNull
    private static final Map<ClassId, ClassId> unsignedArrayTypeByElementType;

    @NotNull
    private static final Set<ClassId> unsignedTypes;

    static {
        FqName fqName = new FqName("kotlin");
        BASE_KOTLIN_PACKAGE = fqName;
        FqName fqNameN = c.n("reflect", fqName, "child(...)");
        BASE_REFLECT_PACKAGE = fqNameN;
        FqName fqNameN2 = c.n("collections", fqName, "child(...)");
        BASE_COLLECTIONS_PACKAGE = fqNameN2;
        FqName fqNameN3 = c.n("ranges", fqName, "child(...)");
        BASE_RANGES_PACKAGE = fqNameN3;
        FqName fqNameN4 = c.n("jvm", fqName, "child(...)");
        BASE_JVM_PACKAGE = fqNameN4;
        BASE_JVM_INTERNAL_PACKAGE = c.n("internal", fqNameN4, "child(...)");
        FqName fqNameN5 = c.n("annotation", fqName, "child(...)");
        BASE_ANNOTATION_PACKAGE = fqNameN5;
        FqName fqNameN6 = c.n("internal", fqName, "child(...)");
        BASE_INTERNAL_PACKAGE = fqNameN6;
        BASE_INTERNAL_IR_PACKAGE = c.n("ir", fqNameN6, "child(...)");
        FqName fqNameN7 = c.n("coroutines", fqName, "child(...)");
        BASE_COROUTINES_PACKAGE = fqNameN7;
        BASE_ENUMS_PACKAGE = c.n("enums", fqName, "child(...)");
        BASE_CONTRACTS_PACKAGE = c.n("contracts", fqName, "child(...)");
        BASE_CONCURRENT_PACKAGE = c.n("concurrent", fqName, "child(...)");
        BASE_TEST_PACKAGE = c.n("test", fqName, "child(...)");
        builtInsPackages = kotlin.collections.c.f1(new FqName[]{fqName, fqNameN2, fqNameN3, fqNameN5, fqNameN, fqNameN6, fqNameN7});
        Nothing = StandardClassIdsKt.baseId("Nothing");
        Unit = StandardClassIdsKt.baseId("Unit");
        Any = StandardClassIdsKt.baseId("Any");
        Enum = StandardClassIdsKt.baseId("Enum");
        Annotation = StandardClassIdsKt.baseId("Annotation");
        Array = StandardClassIdsKt.baseId("Array");
        ClassId classIdBaseId = StandardClassIdsKt.baseId("Boolean");
        Boolean = classIdBaseId;
        ClassId classIdBaseId2 = StandardClassIdsKt.baseId("Char");
        Char = classIdBaseId2;
        ClassId classIdBaseId3 = StandardClassIdsKt.baseId("Byte");
        Byte = classIdBaseId3;
        ClassId classIdBaseId4 = StandardClassIdsKt.baseId("Short");
        Short = classIdBaseId4;
        ClassId classIdBaseId5 = StandardClassIdsKt.baseId("Int");
        Int = classIdBaseId5;
        ClassId classIdBaseId6 = StandardClassIdsKt.baseId("Long");
        Long = classIdBaseId6;
        ClassId classIdBaseId7 = StandardClassIdsKt.baseId("Float");
        Float = classIdBaseId7;
        ClassId classIdBaseId8 = StandardClassIdsKt.baseId("Double");
        Double = classIdBaseId8;
        UByte = StandardClassIdsKt.unsignedId(classIdBaseId3);
        UShort = StandardClassIdsKt.unsignedId(classIdBaseId4);
        UInt = StandardClassIdsKt.unsignedId(classIdBaseId5);
        ULong = StandardClassIdsKt.unsignedId(classIdBaseId6);
        CharSequence = StandardClassIdsKt.baseId("CharSequence");
        String = StandardClassIdsKt.baseId("String");
        Throwable = StandardClassIdsKt.baseId("Throwable");
        Cloneable = StandardClassIdsKt.baseId("Cloneable");
        KProperty = StandardClassIdsKt.reflectId("KProperty");
        KMutableProperty = StandardClassIdsKt.reflectId("KMutableProperty");
        KProperty0 = StandardClassIdsKt.reflectId("KProperty0");
        KMutableProperty0 = StandardClassIdsKt.reflectId("KMutableProperty0");
        KProperty1 = StandardClassIdsKt.reflectId("KProperty1");
        KMutableProperty1 = StandardClassIdsKt.reflectId("KMutableProperty1");
        KProperty2 = StandardClassIdsKt.reflectId("KProperty2");
        KMutableProperty2 = StandardClassIdsKt.reflectId("KMutableProperty2");
        KFunction = StandardClassIdsKt.reflectId("KFunction");
        KClass = StandardClassIdsKt.reflectId("KClass");
        KCallable = StandardClassIdsKt.reflectId("KCallable");
        KType = StandardClassIdsKt.reflectId("KType");
        Comparable = StandardClassIdsKt.baseId("Comparable");
        Number = StandardClassIdsKt.baseId("Number");
        Function = StandardClassIdsKt.baseId("Function");
        Set<ClassId> setF1 = kotlin.collections.c.f1(new ClassId[]{classIdBaseId, classIdBaseId2, classIdBaseId3, classIdBaseId4, classIdBaseId5, classIdBaseId6, classIdBaseId7, classIdBaseId8});
        primitiveTypes = setF1;
        Set<ClassId> set = setF1;
        int iD0 = k.d0(b70.c.u0(set, 10));
        if (iD0 < 16) {
            iD0 = 16;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
        for (Object obj : set) {
            Name shortClassName = ((ClassId) obj).getShortClassName();
            Intrinsics.f(shortClassName, "getShortClassName(...)");
            linkedHashMap.put(obj, StandardClassIdsKt.primitiveArrayId(shortClassName));
        }
        primitiveArrayTypeByElementType = linkedHashMap;
        elementTypeByPrimitiveArrayType = StandardClassIdsKt.inverseMap(linkedHashMap);
        Set<ClassId> setF12 = kotlin.collections.c.f1(new ClassId[]{UByte, UShort, UInt, ULong});
        unsignedTypes = setF12;
        Set<ClassId> set2 = setF12;
        int iD02 = k.d0(b70.c.u0(set2, 10));
        LinkedHashMap linkedHashMap2 = new LinkedHashMap(iD02 >= 16 ? iD02 : 16);
        for (Object obj2 : set2) {
            Name shortClassName2 = ((ClassId) obj2).getShortClassName();
            Intrinsics.f(shortClassName2, "getShortClassName(...)");
            linkedHashMap2.put(obj2, StandardClassIdsKt.primitiveArrayId(shortClassName2));
        }
        unsignedArrayTypeByElementType = linkedHashMap2;
        elementTypeByUnsignedArrayType = StandardClassIdsKt.inverseMap(linkedHashMap2);
        constantAllowedTypes = n.c0(n.b0(primitiveTypes, unsignedTypes), String);
        Continuation = StandardClassIdsKt.coroutinesId("Continuation");
        Iterator = StandardClassIdsKt.collectionsId("Iterator");
        Iterable = StandardClassIdsKt.collectionsId("Iterable");
        Collection = StandardClassIdsKt.collectionsId("Collection");
        List = StandardClassIdsKt.collectionsId("List");
        ListIterator = StandardClassIdsKt.collectionsId("ListIterator");
        Set = StandardClassIdsKt.collectionsId("Set");
        ClassId classIdCollectionsId = StandardClassIdsKt.collectionsId("Map");
        Map = classIdCollectionsId;
        MutableIterator = StandardClassIdsKt.collectionsId("MutableIterator");
        CharIterator = StandardClassIdsKt.collectionsId("CharIterator");
        MutableIterable = StandardClassIdsKt.collectionsId("MutableIterable");
        MutableCollection = StandardClassIdsKt.collectionsId("MutableCollection");
        MutableList = StandardClassIdsKt.collectionsId("MutableList");
        MutableListIterator = StandardClassIdsKt.collectionsId("MutableListIterator");
        MutableSet = StandardClassIdsKt.collectionsId("MutableSet");
        ClassId classIdCollectionsId2 = StandardClassIdsKt.collectionsId("MutableMap");
        MutableMap = classIdCollectionsId2;
        ClassId classIdCreateNestedClassId = classIdCollectionsId.createNestedClassId(Name.identifier("Entry"));
        Intrinsics.f(classIdCreateNestedClassId, "createNestedClassId(...)");
        MapEntry = classIdCreateNestedClassId;
        ClassId classIdCreateNestedClassId2 = classIdCollectionsId2.createNestedClassId(Name.identifier("MutableEntry"));
        Intrinsics.f(classIdCreateNestedClassId2, "createNestedClassId(...)");
        MutableMapEntry = classIdCreateNestedClassId2;
        Result = StandardClassIdsKt.baseId("Result");
        IntRange = StandardClassIdsKt.rangesId("IntRange");
        LongRange = StandardClassIdsKt.rangesId("LongRange");
        CharRange = StandardClassIdsKt.rangesId("CharRange");
        AnnotationRetention = StandardClassIdsKt.annotationId("AnnotationRetention");
        AnnotationTarget = StandardClassIdsKt.annotationId("AnnotationTarget");
        DeprecationLevel = StandardClassIdsKt.baseId("DeprecationLevel");
        EnumEntries = StandardClassIdsKt.enumsId("EnumEntries");
    }

    private StandardClassIds() {
    }

    @NotNull
    public final ClassId getArray() {
        return Array;
    }

    @NotNull
    public final FqName getBASE_ANNOTATION_PACKAGE() {
        return BASE_ANNOTATION_PACKAGE;
    }

    @NotNull
    public final FqName getBASE_COLLECTIONS_PACKAGE() {
        return BASE_COLLECTIONS_PACKAGE;
    }

    @NotNull
    public final FqName getBASE_COROUTINES_PACKAGE() {
        return BASE_COROUTINES_PACKAGE;
    }

    @NotNull
    public final FqName getBASE_ENUMS_PACKAGE() {
        return BASE_ENUMS_PACKAGE;
    }

    @NotNull
    public final FqName getBASE_KOTLIN_PACKAGE() {
        return BASE_KOTLIN_PACKAGE;
    }

    @NotNull
    public final FqName getBASE_RANGES_PACKAGE() {
        return BASE_RANGES_PACKAGE;
    }

    @NotNull
    public final FqName getBASE_REFLECT_PACKAGE() {
        return BASE_REFLECT_PACKAGE;
    }

    @NotNull
    public final ClassId getEnumEntries() {
        return EnumEntries;
    }

    @NotNull
    public final ClassId getKClass() {
        return KClass;
    }

    @NotNull
    public final ClassId getKFunction() {
        return KFunction;
    }

    @NotNull
    public final ClassId getMutableList() {
        return MutableList;
    }

    @NotNull
    public final ClassId getMutableMap() {
        return MutableMap;
    }

    @NotNull
    public final ClassId getMutableSet() {
        return MutableSet;
    }
}
