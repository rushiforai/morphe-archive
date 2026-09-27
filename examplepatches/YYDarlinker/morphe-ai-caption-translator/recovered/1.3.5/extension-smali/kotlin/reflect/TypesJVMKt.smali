.class public final Lkotlin/reflect/TypesJVMKt;
.super Ljava/lang/Object;
.source "TypesJVM.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/reflect/TypesJVMKt$WhenMappings;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nTypesJVM.kt\nKotlin\n*S Kotlin\n*F\n+ 1 TypesJVM.kt\nkotlin/reflect/TypesJVMKt\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n+ 4 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,244:1\n1#2:245\n3054#3,12:246\n1739#4:258\n1814#4,3:259\n1739#4:262\n1814#4,3:263\n1739#4:266\n1814#4,3:267\n*S KotlinDebug\n*F\n+ 1 TypesJVM.kt\nkotlin/reflect/TypesJVMKt\n*L\n42#1:246,12\n73#1:258\n73#1:259,3\n75#1:262\n75#1:263,3\n81#1:266\n81#1:267,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000D\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\u001a\u001c\u0010\u000c\u001a\u00020\u0001*\u00020\u00022\u0008\u0008\u0002\u0010\r\u001a\u00020\u000eH\u0083\u0080\u0004b\u0002\u0008\n\u001a(\u0010\u000f\u001a\u00020\u00012\n\u0010\u0010\u001a\u0006\u0012\u0002\u0008\u00030\u00112\u000c\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00020\u00140\u0013H\u0083\u0080\u0004b\u0002\u0008\n\u001a\u0012\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u0001H\u0082\u0080\u0004\"5\u0010\u0000\u001a\u00020\u0001*\u00020\u00028FX\u0087\u0084\u0008r\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\tr\u0002\u0008\nr\u0002\u0008\u000b\u00a2\u0006\u000c\u0012\u0004\u0008\u0003\u0010\u0004\u001a\u0004\u0008\u0005\u0010\u0006\"#\u0010\u0000\u001a\u00020\u0001*\u00020\u00148BX\u0083\u0084\u0008r\u0002\u0008\n\u00a2\u0006\u000c\u0012\u0004\u0008\u0003\u0010\u0015\u001a\u0004\u0008\u0005\u0010\u0016\u00a8\u0006\u001a"
    }
    d2 = {
        "javaType",
        "Ljava/lang/reflect/Type;",
        "Lkotlin/reflect/KType;",
        "getJavaType$annotations",
        "(Lkotlin/reflect/KType;)V",
        "getJavaType",
        "(Lkotlin/reflect/KType;)Ljava/lang/reflect/Type;",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.4",
        "Lkotlin/ExperimentalStdlibApi;",
        "Lkotlin/internal/LowPriorityInOverloadResolution;",
        "computeJavaType",
        "forceWrapper",
        "",
        "createPossiblyInnerType",
        "jClass",
        "Ljava/lang/Class;",
        "arguments",
        "",
        "Lkotlin/reflect/KTypeProjection;",
        "(Lkotlin/reflect/KTypeProjection;)V",
        "(Lkotlin/reflect/KTypeProjection;)Ljava/lang/reflect/Type;",
        "typeToString",
        "",
        "type",
        "kotlin-stdlib"
    }
    k = 0x2
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final synthetic access$computeJavaType(Lkotlin/reflect/KType;Z)Ljava/lang/reflect/Type;
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lkotlin/reflect/TypesJVMKt;->computeJavaType(Lkotlin/reflect/KType;Z)Ljava/lang/reflect/Type;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$typeToString(Ljava/lang/reflect/Type;)Ljava/lang/String;
    .registers 1

    .line 1
    invoke-static {p0}, Lkotlin/reflect/TypesJVMKt;->typeToString(Ljava/lang/reflect/Type;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static final computeJavaType(Lkotlin/reflect/KType;Z)Ljava/lang/reflect/Type;
    .registers 10

    .line 36
    invoke-interface {p0}, Lkotlin/reflect/KType;->getClassifier()Lkotlin/reflect/KClassifier;

    move-result-object v0

    .line 37
    instance-of v1, v0, Lkotlin/reflect/KTypeParameter;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v1, :cond_79

    .line 38
    instance-of p1, v0, Lkotlin/jvm/internal/KTypeParameterBase;

    if-nez p1, :cond_19

    new-instance p0, Lkotlin/reflect/ObsoleteFallbackTypeVariableImpl;

    check-cast v0, Lkotlin/reflect/KTypeParameter;

    invoke-direct {p0, v0}, Lkotlin/reflect/ObsoleteFallbackTypeVariableImpl;-><init>(Lkotlin/reflect/KTypeParameter;)V

    check-cast p0, Ljava/lang/reflect/Type;

    return-object p0

    .line 40
    :cond_19
    check-cast v0, Lkotlin/jvm/internal/KTypeParameterBase;

    invoke-virtual {v0}, Lkotlin/jvm/internal/KTypeParameterBase;->getJavaContainingDeclaration$kotlin_stdlib()Ljava/lang/reflect/GenericDeclaration;

    move-result-object p1

    if-eqz p1, :cond_65

    .line 42
    invoke-interface {p1}, Ljava/lang/reflect/GenericDeclaration;->getTypeParameters()[Ljava/lang/reflect/TypeVariable;

    move-result-object p0

    const-string p1, "getTypeParameters(...)"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p0, [Ljava/lang/Object;

    .line 248
    array-length p1, p0

    move v1, v3

    :goto_2e
    if-ge v3, p1, :cond_53

    aget-object v5, p0, v3

    .line 249
    move-object v6, v5

    check-cast v6, Ljava/lang/reflect/TypeVariable;

    .line 42
    invoke-interface {v6}, Ljava/lang/reflect/TypeVariable;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0}, Lkotlin/jvm/internal/KTypeParameterBase;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_50

    if-nez v1, :cond_48

    move v1, v4

    move-object v2, v5

    goto :goto_50

    .line 250
    :cond_48
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Array contains more than one matching element."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_50
    :goto_50
    add-int/lit8 v3, v3, 0x1

    goto :goto_2e

    :cond_53
    if-eqz v1, :cond_5d

    .line 42
    const-string p0, "single(...)"

    invoke-static {v2, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v2, Ljava/lang/reflect/Type;

    return-object v2

    .line 255
    :cond_5d
    new-instance p0, Ljava/util/NoSuchElementException;

    const-string p1, "Array contains no element matching the predicate."

    invoke-direct {p0, p1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 41
    :cond_65
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "javaType is not supported for this type: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 44
    :cond_79
    instance-of v1, v0, Lkotlin/reflect/KClass;

    if-eqz v1, :cond_10a

    .line 45
    check-cast v0, Lkotlin/reflect/KClass;

    if-eqz p1, :cond_86

    invoke-static {v0}, Lkotlin/jvm/JvmClassMappingKt;->getJavaObjectType(Lkotlin/reflect/KClass;)Ljava/lang/Class;

    move-result-object p1

    goto :goto_8a

    :cond_86
    invoke-static {v0}, Lkotlin/jvm/JvmClassMappingKt;->getJavaClass(Lkotlin/reflect/KClass;)Ljava/lang/Class;

    move-result-object p1

    .line 46
    :goto_8a
    invoke-interface {p0}, Lkotlin/reflect/KType;->getArguments()Ljava/util/List;

    move-result-object v0

    .line 47
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_97

    check-cast p1, Ljava/lang/reflect/Type;

    return-object p1

    .line 49
    :cond_97
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_105

    .line 50
    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v1

    if-eqz v1, :cond_aa

    check-cast p1, Ljava/lang/reflect/Type;

    return-object p1

    .line 52
    :cond_aa
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->singleOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlin/reflect/KTypeProjection;

    if-eqz v0, :cond_f1

    invoke-virtual {v0}, Lkotlin/reflect/KTypeProjection;->component1()Lkotlin/reflect/KVariance;

    move-result-object p0

    invoke-virtual {v0}, Lkotlin/reflect/KTypeProjection;->component2()Lkotlin/reflect/KType;

    move-result-object v0

    const/4 v1, -0x1

    if-nez p0, :cond_bf

    move p0, v1

    goto :goto_c7

    .line 54
    :cond_bf
    sget-object v5, Lkotlin/reflect/TypesJVMKt$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p0}, Lkotlin/reflect/KVariance;->ordinal()I

    move-result p0

    aget p0, v5, p0

    :goto_c7
    if-eq p0, v1, :cond_ee

    if-eq p0, v4, :cond_ee

    const/4 v1, 0x2

    if-eq p0, v1, :cond_d8

    const/4 v1, 0x3

    if-ne p0, v1, :cond_d2

    goto :goto_d8

    :cond_d2
    new-instance p0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p0

    .line 58
    :cond_d8
    :goto_d8
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-static {v0, v3, v4, v2}, Lkotlin/reflect/TypesJVMKt;->computeJavaType$default(Lkotlin/reflect/KType;ZILjava/lang/Object;)Ljava/lang/reflect/Type;

    move-result-object p0

    .line 59
    instance-of v0, p0, Ljava/lang/Class;

    if-eqz v0, :cond_e6

    check-cast p1, Ljava/lang/reflect/Type;

    return-object p1

    :cond_e6
    new-instance p1, Lkotlin/reflect/GenericArrayTypeImpl;

    invoke-direct {p1, p0}, Lkotlin/reflect/GenericArrayTypeImpl;-><init>(Ljava/lang/reflect/Type;)V

    check-cast p1, Ljava/lang/reflect/Type;

    return-object p1

    .line 56
    :cond_ee
    check-cast p1, Ljava/lang/reflect/Type;

    return-object p1

    .line 53
    :cond_f1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "kotlin.Array must have exactly one type argument: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 64
    :cond_105
    invoke-static {p1, v0}, Lkotlin/reflect/TypesJVMKt;->createPossiblyInnerType(Ljava/lang/Class;Ljava/util/List;)Ljava/lang/reflect/Type;

    move-result-object p0

    return-object p0

    .line 66
    :cond_10a
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unsupported type classifier: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic computeJavaType$default(Lkotlin/reflect/KType;ZILjava/lang/Object;)Ljava/lang/reflect/Type;
    .registers 4

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_5

    const/4 p1, 0x0

    .line 35
    :cond_5
    invoke-static {p0, p1}, Lkotlin/reflect/TypesJVMKt;->computeJavaType(Lkotlin/reflect/KType;Z)Ljava/lang/reflect/Type;

    move-result-object p0

    return-object p0
.end method

.method private static final createPossiblyInnerType(Ljava/lang/Class;Ljava/util/List;)Ljava/lang/reflect/Type;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/util/List<",
            "Lkotlin/reflect/KTypeProjection;",
            ">;)",
            "Ljava/lang/reflect/Type;"
        }
    .end annotation

    .line 72
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    const/16 v1, 0xa

    if-nez v0, :cond_38

    .line 73
    check-cast p1, Ljava/lang/Iterable;

    .line 258
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {p1, v1}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v0, Ljava/util/Collection;

    .line 259
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_19
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2d

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 260
    check-cast v1, Lkotlin/reflect/KTypeProjection;

    .line 73
    invoke-static {v1}, Lkotlin/reflect/TypesJVMKt;->getJavaType(Lkotlin/reflect/KTypeProjection;)Ljava/lang/reflect/Type;

    move-result-object v1

    .line 260
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_19

    .line 261
    :cond_2d
    check-cast v0, Ljava/util/List;

    .line 73
    new-instance p1, Lkotlin/reflect/ParameterizedTypeImpl;

    const/4 v1, 0x0

    invoke-direct {p1, p0, v1, v0}, Lkotlin/reflect/ParameterizedTypeImpl;-><init>(Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/util/List;)V

    check-cast p1, Ljava/lang/reflect/Type;

    return-object p1

    .line 74
    :cond_38
    invoke-virtual {p0}, Ljava/lang/Class;->getModifiers()I

    move-result v2

    invoke-static {v2}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v2

    if-eqz v2, :cond_73

    .line 75
    check-cast v0, Ljava/lang/reflect/Type;

    check-cast p1, Ljava/lang/Iterable;

    .line 262
    new-instance v2, Ljava/util/ArrayList;

    invoke-static {p1, v1}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v2, Ljava/util/Collection;

    .line 263
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_55
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_69

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 264
    check-cast v1, Lkotlin/reflect/KTypeProjection;

    .line 75
    invoke-static {v1}, Lkotlin/reflect/TypesJVMKt;->getJavaType(Lkotlin/reflect/KTypeProjection;)Ljava/lang/reflect/Type;

    move-result-object v1

    .line 264
    invoke-interface {v2, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_55

    .line 265
    :cond_69
    check-cast v2, Ljava/util/List;

    .line 75
    new-instance p1, Lkotlin/reflect/ParameterizedTypeImpl;

    invoke-direct {p1, p0, v0, v2}, Lkotlin/reflect/ParameterizedTypeImpl;-><init>(Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/util/List;)V

    check-cast p1, Ljava/lang/reflect/Type;

    return-object p1

    .line 77
    :cond_73
    invoke-virtual {p0}, Ljava/lang/Class;->getTypeParameters()[Ljava/lang/reflect/TypeVariable;

    move-result-object v2

    array-length v2, v2

    .line 80
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    invoke-interface {p1, v2, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v3

    invoke-static {v0, v3}, Lkotlin/reflect/TypesJVMKt;->createPossiblyInnerType(Ljava/lang/Class;Ljava/util/List;)Ljava/lang/reflect/Type;

    move-result-object v0

    const/4 v3, 0x0

    .line 81
    invoke-interface {p1, v3, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    .line 266
    new-instance v2, Ljava/util/ArrayList;

    invoke-static {p1, v1}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v2, Ljava/util/Collection;

    .line 267
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_9a
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_ae

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 268
    check-cast v1, Lkotlin/reflect/KTypeProjection;

    .line 81
    invoke-static {v1}, Lkotlin/reflect/TypesJVMKt;->getJavaType(Lkotlin/reflect/KTypeProjection;)Ljava/lang/reflect/Type;

    move-result-object v1

    .line 268
    invoke-interface {v2, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_9a

    .line 269
    :cond_ae
    check-cast v2, Ljava/util/List;

    .line 78
    new-instance p1, Lkotlin/reflect/ParameterizedTypeImpl;

    invoke-direct {p1, p0, v0, v2}, Lkotlin/reflect/ParameterizedTypeImpl;-><init>(Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/util/List;)V

    check-cast p1, Ljava/lang/reflect/Type;

    return-object p1
.end method

.method public static final getJavaType(Lkotlin/reflect/KType;)Ljava/lang/reflect/Type;
    .registers 4

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 26
    instance-of v0, p0, Lkotlin/jvm/internal/KTypeBase;

    if-eqz v0, :cond_13

    .line 28
    move-object v0, p0

    check-cast v0, Lkotlin/jvm/internal/KTypeBase;

    invoke-interface {v0}, Lkotlin/jvm/internal/KTypeBase;->getJavaType()Ljava/lang/reflect/Type;

    move-result-object v0

    if-eqz v0, :cond_13

    return-object v0

    :cond_13
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 31
    invoke-static {p0, v2, v0, v1}, Lkotlin/reflect/TypesJVMKt;->computeJavaType$default(Lkotlin/reflect/KType;ZILjava/lang/Object;)Ljava/lang/reflect/Type;

    move-result-object p0

    return-object p0
.end method

.method private static final getJavaType(Lkotlin/reflect/KTypeProjection;)Ljava/lang/reflect/Type;
    .registers 5

    .line 88
    invoke-virtual {p0}, Lkotlin/reflect/KTypeProjection;->getVariance()Lkotlin/reflect/KVariance;

    move-result-object v0

    if-nez v0, :cond_f

    sget-object p0, Lkotlin/reflect/WildcardTypeImpl;->Companion:Lkotlin/reflect/WildcardTypeImpl$Companion;

    invoke-virtual {p0}, Lkotlin/reflect/WildcardTypeImpl$Companion;->getSTAR()Lkotlin/reflect/WildcardTypeImpl;

    move-result-object p0

    check-cast p0, Ljava/lang/reflect/Type;

    return-object p0

    .line 89
    :cond_f
    invoke-virtual {p0}, Lkotlin/reflect/KTypeProjection;->getType()Lkotlin/reflect/KType;

    move-result-object p0

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 91
    sget-object v1, Lkotlin/reflect/TypesJVMKt$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v0}, Lkotlin/reflect/KVariance;->ordinal()I

    move-result v0

    aget v0, v1, v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_3f

    const/4 v3, 0x2

    if-eq v0, v3, :cond_3a

    const/4 v3, 0x3

    if-ne v0, v3, :cond_34

    .line 97
    new-instance v0, Lkotlin/reflect/WildcardTypeImpl;

    invoke-static {p0, v2}, Lkotlin/reflect/TypesJVMKt;->computeJavaType(Lkotlin/reflect/KType;Z)Ljava/lang/reflect/Type;

    move-result-object p0

    invoke-direct {v0, p0, v1}, Lkotlin/reflect/WildcardTypeImpl;-><init>(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)V

    check-cast v0, Ljava/lang/reflect/Type;

    return-object v0

    .line 91
    :cond_34
    new-instance p0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p0

    .line 94
    :cond_3a
    invoke-static {p0, v2}, Lkotlin/reflect/TypesJVMKt;->computeJavaType(Lkotlin/reflect/KType;Z)Ljava/lang/reflect/Type;

    move-result-object p0

    return-object p0

    .line 96
    :cond_3f
    new-instance v0, Lkotlin/reflect/WildcardTypeImpl;

    invoke-static {p0, v2}, Lkotlin/reflect/TypesJVMKt;->computeJavaType(Lkotlin/reflect/KType;Z)Ljava/lang/reflect/Type;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Lkotlin/reflect/WildcardTypeImpl;-><init>(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)V

    check-cast v0, Ljava/lang/reflect/Type;

    return-object v0
.end method

.method public static synthetic getJavaType$annotations(Lkotlin/reflect/KType;)V
    .registers 1

    return-void
.end method

.method private static synthetic getJavaType$annotations(Lkotlin/reflect/KTypeProjection;)V
    .registers 1

    return-void
.end method

.method private static final typeToString(Ljava/lang/reflect/Type;)Ljava/lang/String;
    .registers 3

    .line 238
    instance-of v0, p0, Ljava/lang/Class;

    if-eqz v0, :cond_45

    .line 239
    move-object v0, p0

    check-cast v0, Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_3b

    .line 240
    sget-object v0, Lkotlin/reflect/TypesJVMKt$typeToString$unwrap$1;->INSTANCE:Lkotlin/reflect/TypesJVMKt$typeToString$unwrap$1;

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-static {p0, v0}, Lkotlin/sequences/SequencesKt;->generateSequence(Ljava/lang/Object;Lkotlin/jvm/functions/Function1;)Lkotlin/sequences/Sequence;

    move-result-object p0

    .line 241
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lkotlin/sequences/SequencesKt;->last(Lkotlin/sequences/Sequence;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "[]"

    check-cast v1, Ljava/lang/CharSequence;

    invoke-static {p0}, Lkotlin/sequences/SequencesKt;->count(Lkotlin/sequences/Sequence;)I

    move-result p0

    invoke-static {v1, p0}, Lkotlin/text/StringsKt;->repeat(Ljava/lang/CharSequence;I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 242
    :cond_3b
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    const-string v0, "getName(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0

    .line 243
    :cond_45
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
