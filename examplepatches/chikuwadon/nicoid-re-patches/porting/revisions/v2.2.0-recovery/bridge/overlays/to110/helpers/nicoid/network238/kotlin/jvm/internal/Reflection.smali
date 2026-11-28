.class public Lnicoid/network238/kotlin/jvm/internal/Reflection;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final EMPTY_K_CLASS_ARRAY:[Lnicoid/network238/kotlin/reflect/KClass;

.field static final REFLECTION_NOT_AVAILABLE:Ljava/lang/String; = " (Kotlin reflection is not available)"

.field private static final factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 26
    :try_start_0
    const-string v0, "nicoid.network238.kotlin.reflect.jvm.internal.ReflectionFactoryImpl"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0

    :catch_2
    move-exception v0

    goto :goto_0

    :catch_3
    move-exception v0

    :goto_0
    const/4 v0, 0x0

    :goto_1
    if-eqz v0, :cond_0

    goto :goto_2

    .line 34
    :cond_0
    new-instance v0, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-direct {v0}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;-><init>()V

    :goto_2
    sput-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    .line 39
    const/4 v0, 0x0

    new-array v0, v0, [Lnicoid/network238/kotlin/reflect/KClass;

    sput-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->EMPTY_K_CLASS_ARRAY:[Lnicoid/network238/kotlin/reflect/KClass;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createKotlinClass(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KClass;
    .registers 2

    .line 42
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-virtual {v0, p0}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->createKotlinClass(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KClass;

    move-result-object p0

    return-object p0
.end method

.method public static createKotlinClass(Ljava/lang/Class;Ljava/lang/String;)Lnicoid/network238/kotlin/reflect/KClass;
    .registers 3

    .line 46
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->createKotlinClass(Ljava/lang/Class;Ljava/lang/String;)Lnicoid/network238/kotlin/reflect/KClass;

    move-result-object p0

    return-object p0
.end method

.method public static function(Lnicoid/network238/kotlin/jvm/internal/FunctionReference;)Lnicoid/network238/kotlin/reflect/KFunction;
    .registers 2

    .line 90
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-virtual {v0, p0}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->function(Lnicoid/network238/kotlin/jvm/internal/FunctionReference;)Lnicoid/network238/kotlin/reflect/KFunction;

    const/4 p0, 0x0

    return-object p0
.end method

.method public static getOrCreateKotlinClass(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KClass;
    .registers 2

    .line 60
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-virtual {v0, p0}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->getOrCreateKotlinClass(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KClass;

    move-result-object p0

    return-object p0
.end method

.method public static getOrCreateKotlinClass(Ljava/lang/Class;Ljava/lang/String;)Lnicoid/network238/kotlin/reflect/KClass;
    .registers 3

    .line 64
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->getOrCreateKotlinClass(Ljava/lang/Class;Ljava/lang/String;)Lnicoid/network238/kotlin/reflect/KClass;

    move-result-object p0

    return-object p0
.end method

.method public static getOrCreateKotlinClasses([Ljava/lang/Class;)[Lnicoid/network238/kotlin/reflect/KClass;
    .registers 5

    .line 68
    array-length v0, p0

    if-nez v0, :cond_0

    .line 69
    sget-object p0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->EMPTY_K_CLASS_ARRAY:[Lnicoid/network238/kotlin/reflect/KClass;

    return-object p0

    .line 70
    :cond_0
    new-array v1, v0, [Lnicoid/network238/kotlin/reflect/KClass;

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    .line 72
    aget-object v3, p0, v2

    invoke-static {v3}, Lnicoid/network238/kotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KClass;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v1
.end method

.method public static getOrCreateKotlinPackage(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KDeclarationContainer;
    .registers 3

    .line 51
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    const-string v1, ""

    invoke-virtual {v0, p0, v1}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->getOrCreateKotlinPackage(Ljava/lang/Class;Ljava/lang/String;)Lnicoid/network238/kotlin/reflect/KDeclarationContainer;

    move-result-object p0

    return-object p0
.end method

.method public static getOrCreateKotlinPackage(Ljava/lang/Class;Ljava/lang/String;)Lnicoid/network238/kotlin/reflect/KDeclarationContainer;
    .registers 3

    .line 56
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->getOrCreateKotlinPackage(Ljava/lang/Class;Ljava/lang/String;)Lnicoid/network238/kotlin/reflect/KDeclarationContainer;

    move-result-object p0

    return-object p0
.end method

.method public static mutableCollectionType(Lnicoid/network238/kotlin/reflect/KType;)Lnicoid/network238/kotlin/reflect/KType;
    .registers 2

    .line 197
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-virtual {v0, p0}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->mutableCollectionType(Lnicoid/network238/kotlin/reflect/KType;)Lnicoid/network238/kotlin/reflect/KType;

    move-result-object p0

    return-object p0
.end method

.method public static mutableProperty0(Lnicoid/network238/kotlin/jvm/internal/MutablePropertyReference0;)Lnicoid/network238/kotlin/reflect/KMutableProperty0;
    .registers 2

    .line 100
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-virtual {v0, p0}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->mutableProperty0(Lnicoid/network238/kotlin/jvm/internal/MutablePropertyReference0;)Lnicoid/network238/kotlin/reflect/KMutableProperty0;

    const/4 p0, 0x0

    return-object p0
.end method

.method public static mutableProperty1(Lnicoid/network238/kotlin/jvm/internal/MutablePropertyReference1;)Lnicoid/network238/kotlin/reflect/KMutableProperty1;
    .registers 2

    .line 108
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-virtual {v0, p0}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->mutableProperty1(Lnicoid/network238/kotlin/jvm/internal/MutablePropertyReference1;)Lnicoid/network238/kotlin/reflect/KMutableProperty1;

    const/4 p0, 0x0

    return-object p0
.end method

.method public static mutableProperty2(Lnicoid/network238/kotlin/jvm/internal/MutablePropertyReference2;)Lnicoid/network238/kotlin/reflect/KMutableProperty2;
    .registers 2

    .line 116
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-virtual {v0, p0}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->mutableProperty2(Lnicoid/network238/kotlin/jvm/internal/MutablePropertyReference2;)Lnicoid/network238/kotlin/reflect/KMutableProperty2;

    const/4 p0, 0x0

    return-object p0
.end method

.method public static nothingType(Lnicoid/network238/kotlin/reflect/KType;)Lnicoid/network238/kotlin/reflect/KType;
    .registers 2

    .line 202
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-virtual {v0, p0}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->nothingType(Lnicoid/network238/kotlin/reflect/KType;)Lnicoid/network238/kotlin/reflect/KType;

    move-result-object p0

    return-object p0
.end method

.method public static nullableTypeOf(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KType;
    .registers 4

    .line 153
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-static {p0}, Lnicoid/network238/kotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KClass;

    move-result-object p0

    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    const/4 v2, 0x1

    invoke-virtual {v0, p0, v1, v2}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->typeOf(Lnicoid/network238/kotlin/reflect/KClassifier;Ljava/util/List;Z)Lnicoid/network238/kotlin/reflect/KType;

    move-result-object p0

    return-object p0
.end method

.method public static nullableTypeOf(Ljava/lang/Class;Lnicoid/network238/kotlin/reflect/KTypeProjection;)Lnicoid/network238/kotlin/reflect/KType;
    .registers 4

    .line 158
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-static {p0}, Lnicoid/network238/kotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KClass;

    move-result-object p0

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    const/4 v1, 0x1

    invoke-virtual {v0, p0, p1, v1}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->typeOf(Lnicoid/network238/kotlin/reflect/KClassifier;Ljava/util/List;Z)Lnicoid/network238/kotlin/reflect/KType;

    move-result-object p0

    return-object p0
.end method

.method public static nullableTypeOf(Ljava/lang/Class;Lnicoid/network238/kotlin/reflect/KTypeProjection;Lnicoid/network238/kotlin/reflect/KTypeProjection;)Lnicoid/network238/kotlin/reflect/KType;
    .registers 6

    .line 163
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-static {p0}, Lnicoid/network238/kotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KClass;

    move-result-object p0

    const/4 v1, 0x2

    new-array v1, v1, [Lnicoid/network238/kotlin/reflect/KTypeProjection;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 p1, 0x1

    aput-object p2, v1, p1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    invoke-virtual {v0, p0, p2, p1}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->typeOf(Lnicoid/network238/kotlin/reflect/KClassifier;Ljava/util/List;Z)Lnicoid/network238/kotlin/reflect/KType;

    move-result-object p0

    return-object p0
.end method

.method public static varargs nullableTypeOf(Ljava/lang/Class;[Lnicoid/network238/kotlin/reflect/KTypeProjection;)Lnicoid/network238/kotlin/reflect/KType;
    .registers 4

    .line 168
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-static {p0}, Lnicoid/network238/kotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KClass;

    move-result-object p0

    invoke-static {p1}, Lnicoid/network238/kotlin/collections/ArraysKt;->toList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    const/4 v1, 0x1

    invoke-virtual {v0, p0, p1, v1}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->typeOf(Lnicoid/network238/kotlin/reflect/KClassifier;Ljava/util/List;Z)Lnicoid/network238/kotlin/reflect/KType;

    move-result-object p0

    return-object p0
.end method

.method public static nullableTypeOf(Lnicoid/network238/kotlin/reflect/KClassifier;)Lnicoid/network238/kotlin/reflect/KType;
    .registers 4

    .line 148
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    const/4 v2, 0x1

    invoke-virtual {v0, p0, v1, v2}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->typeOf(Lnicoid/network238/kotlin/reflect/KClassifier;Ljava/util/List;Z)Lnicoid/network238/kotlin/reflect/KType;

    move-result-object p0

    return-object p0
.end method

.method public static platformType(Lnicoid/network238/kotlin/reflect/KType;Lnicoid/network238/kotlin/reflect/KType;)Lnicoid/network238/kotlin/reflect/KType;
    .registers 3

    .line 192
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->platformType(Lnicoid/network238/kotlin/reflect/KType;Lnicoid/network238/kotlin/reflect/KType;)Lnicoid/network238/kotlin/reflect/KType;

    move-result-object p0

    return-object p0
.end method

.method public static property0(Lnicoid/network238/kotlin/jvm/internal/PropertyReference0;)Lnicoid/network238/kotlin/reflect/KProperty0;
    .registers 2

    .line 96
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-virtual {v0, p0}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->property0(Lnicoid/network238/kotlin/jvm/internal/PropertyReference0;)Lnicoid/network238/kotlin/reflect/KProperty0;

    const/4 p0, 0x0

    return-object p0
.end method

.method public static property1(Lnicoid/network238/kotlin/jvm/internal/PropertyReference1;)Lnicoid/network238/kotlin/reflect/KProperty1;
    .registers 2

    .line 104
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-virtual {v0, p0}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->property1(Lnicoid/network238/kotlin/jvm/internal/PropertyReference1;)Lnicoid/network238/kotlin/reflect/KProperty1;

    const/4 p0, 0x0

    return-object p0
.end method

.method public static property2(Lnicoid/network238/kotlin/jvm/internal/PropertyReference2;)Lnicoid/network238/kotlin/reflect/KProperty2;
    .registers 2

    .line 112
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-virtual {v0, p0}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->property2(Lnicoid/network238/kotlin/jvm/internal/PropertyReference2;)Lnicoid/network238/kotlin/reflect/KProperty2;

    const/4 p0, 0x0

    return-object p0
.end method

.method public static renderLambdaToString(Lnicoid/network238/kotlin/jvm/internal/FunctionBase;)Ljava/lang/String;
    .registers 2

    .line 84
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-virtual {v0, p0}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->renderLambdaToString(Lnicoid/network238/kotlin/jvm/internal/FunctionBase;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static renderLambdaToString(Lnicoid/network238/kotlin/jvm/internal/Lambda;)Ljava/lang/String;
    .registers 2

    .line 79
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-virtual {v0, p0}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->renderLambdaToString(Lnicoid/network238/kotlin/jvm/internal/Lambda;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static setUpperBounds(Lnicoid/network238/kotlin/reflect/KTypeParameter;Lnicoid/network238/kotlin/reflect/KType;)V
    .registers 3

    .line 180
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->setUpperBounds(Lnicoid/network238/kotlin/reflect/KTypeParameter;Ljava/util/List;)V

    return-void
.end method

.method public static varargs setUpperBounds(Lnicoid/network238/kotlin/reflect/KTypeParameter;[Lnicoid/network238/kotlin/reflect/KType;)V
    .registers 3

    .line 185
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-static {p1}, Lnicoid/network238/kotlin/collections/ArraysKt;->toList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->setUpperBounds(Lnicoid/network238/kotlin/reflect/KTypeParameter;Ljava/util/List;)V

    return-void
.end method

.method public static typeOf(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KType;
    .registers 4

    .line 128
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-static {p0}, Lnicoid/network238/kotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KClass;

    move-result-object p0

    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    const/4 v2, 0x0

    invoke-virtual {v0, p0, v1, v2}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->typeOf(Lnicoid/network238/kotlin/reflect/KClassifier;Ljava/util/List;Z)Lnicoid/network238/kotlin/reflect/KType;

    move-result-object p0

    return-object p0
.end method

.method public static typeOf(Ljava/lang/Class;Lnicoid/network238/kotlin/reflect/KTypeProjection;)Lnicoid/network238/kotlin/reflect/KType;
    .registers 4

    .line 133
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-static {p0}, Lnicoid/network238/kotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KClass;

    move-result-object p0

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {v0, p0, p1, v1}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->typeOf(Lnicoid/network238/kotlin/reflect/KClassifier;Ljava/util/List;Z)Lnicoid/network238/kotlin/reflect/KType;

    move-result-object p0

    return-object p0
.end method

.method public static typeOf(Ljava/lang/Class;Lnicoid/network238/kotlin/reflect/KTypeProjection;Lnicoid/network238/kotlin/reflect/KTypeProjection;)Lnicoid/network238/kotlin/reflect/KType;
    .registers 6

    .line 138
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-static {p0}, Lnicoid/network238/kotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KClass;

    move-result-object p0

    const/4 v1, 0x2

    new-array v1, v1, [Lnicoid/network238/kotlin/reflect/KTypeProjection;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 p1, 0x1

    aput-object p2, v1, p1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {v0, p0, p1, v2}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->typeOf(Lnicoid/network238/kotlin/reflect/KClassifier;Ljava/util/List;Z)Lnicoid/network238/kotlin/reflect/KType;

    move-result-object p0

    return-object p0
.end method

.method public static varargs typeOf(Ljava/lang/Class;[Lnicoid/network238/kotlin/reflect/KTypeProjection;)Lnicoid/network238/kotlin/reflect/KType;
    .registers 4

    .line 143
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-static {p0}, Lnicoid/network238/kotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KClass;

    move-result-object p0

    invoke-static {p1}, Lnicoid/network238/kotlin/collections/ArraysKt;->toList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {v0, p0, p1, v1}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->typeOf(Lnicoid/network238/kotlin/reflect/KClassifier;Ljava/util/List;Z)Lnicoid/network238/kotlin/reflect/KType;

    move-result-object p0

    return-object p0
.end method

.method public static typeOf(Lnicoid/network238/kotlin/reflect/KClassifier;)Lnicoid/network238/kotlin/reflect/KType;
    .registers 4

    .line 123
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    const/4 v2, 0x0

    invoke-virtual {v0, p0, v1, v2}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->typeOf(Lnicoid/network238/kotlin/reflect/KClassifier;Ljava/util/List;Z)Lnicoid/network238/kotlin/reflect/KType;

    move-result-object p0

    return-object p0
.end method

.method public static typeParameter(Ljava/lang/Object;Ljava/lang/String;Lnicoid/network238/kotlin/reflect/KVariance;Z)Lnicoid/network238/kotlin/reflect/KTypeParameter;
    .registers 5

    .line 175
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/Reflection;->factory:Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;

    invoke-virtual {v0, p0, p1, p2, p3}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->typeParameter(Ljava/lang/Object;Ljava/lang/String;Lnicoid/network238/kotlin/reflect/KVariance;Z)Lnicoid/network238/kotlin/reflect/KTypeParameter;

    move-result-object p0

    return-object p0
.end method
