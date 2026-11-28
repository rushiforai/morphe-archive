.class public Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createKotlinClass(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KClass;
    .registers 3

    .line 18
    new-instance v0, Lnicoid/network238/kotlin/jvm/internal/ClassReference;

    invoke-direct {v0, p1}, Lnicoid/network238/kotlin/jvm/internal/ClassReference;-><init>(Ljava/lang/Class;)V

    return-object v0
.end method

.method public createKotlinClass(Ljava/lang/Class;Ljava/lang/String;)Lnicoid/network238/kotlin/reflect/KClass;
    .registers 3

    .line 22
    new-instance p2, Lnicoid/network238/kotlin/jvm/internal/ClassReference;

    invoke-direct {p2, p1}, Lnicoid/network238/kotlin/jvm/internal/ClassReference;-><init>(Ljava/lang/Class;)V

    return-object p2
.end method

.method public function(Lnicoid/network238/kotlin/jvm/internal/FunctionReference;)Lnicoid/network238/kotlin/reflect/KFunction;
    .registers 2

    return-object p1
.end method

.method public getOrCreateKotlinClass(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KClass;
    .registers 3

    .line 30
    new-instance v0, Lnicoid/network238/kotlin/jvm/internal/ClassReference;

    invoke-direct {v0, p1}, Lnicoid/network238/kotlin/jvm/internal/ClassReference;-><init>(Ljava/lang/Class;)V

    return-object v0
.end method

.method public getOrCreateKotlinClass(Ljava/lang/Class;Ljava/lang/String;)Lnicoid/network238/kotlin/reflect/KClass;
    .registers 3

    .line 34
    new-instance p2, Lnicoid/network238/kotlin/jvm/internal/ClassReference;

    invoke-direct {p2, p1}, Lnicoid/network238/kotlin/jvm/internal/ClassReference;-><init>(Ljava/lang/Class;)V

    return-object p2
.end method

.method public getOrCreateKotlinPackage(Ljava/lang/Class;Ljava/lang/String;)Lnicoid/network238/kotlin/reflect/KDeclarationContainer;
    .registers 4

    .line 26
    new-instance v0, Lnicoid/network238/kotlin/jvm/internal/PackageReference;

    invoke-direct {v0, p1, p2}, Lnicoid/network238/kotlin/jvm/internal/PackageReference;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    return-object v0
.end method

.method public mutableCollectionType(Lnicoid/network238/kotlin/reflect/KType;)Lnicoid/network238/kotlin/reflect/KType;
    .registers 6

    .line 107
    move-object v0, p1

    check-cast v0, Lnicoid/network238/kotlin/jvm/internal/TypeReference;

    .line 108
    new-instance v1, Lnicoid/network238/kotlin/jvm/internal/TypeReference;

    .line 109
    invoke-interface {p1}, Lnicoid/network238/kotlin/reflect/KType;->getClassifier()Lnicoid/network238/kotlin/reflect/KClassifier;

    move-result-object v2

    invoke-interface {p1}, Lnicoid/network238/kotlin/reflect/KType;->getArguments()Ljava/util/List;

    move-result-object p1

    invoke-virtual {v0}, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->getPlatformTypeUpperBound$kotlin_stdlib()Lnicoid/network238/kotlin/reflect/KType;

    move-result-object v3

    .line 110
    invoke-virtual {v0}, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->getFlags$kotlin_stdlib()I

    move-result v0

    or-int/lit8 v0, v0, 0x2

    invoke-direct {v1, v2, p1, v3, v0}, Lnicoid/network238/kotlin/jvm/internal/TypeReference;-><init>(Lnicoid/network238/kotlin/reflect/KClassifier;Ljava/util/List;Lnicoid/network238/kotlin/reflect/KType;I)V

    return-object v1
.end method

.method public mutableProperty0(Lnicoid/network238/kotlin/jvm/internal/MutablePropertyReference0;)Lnicoid/network238/kotlin/reflect/KMutableProperty0;
    .registers 2

    return-object p1
.end method

.method public mutableProperty1(Lnicoid/network238/kotlin/jvm/internal/MutablePropertyReference1;)Lnicoid/network238/kotlin/reflect/KMutableProperty1;
    .registers 2

    return-object p1
.end method

.method public mutableProperty2(Lnicoid/network238/kotlin/jvm/internal/MutablePropertyReference2;)Lnicoid/network238/kotlin/reflect/KMutableProperty2;
    .registers 2

    return-object p1
.end method

.method public nothingType(Lnicoid/network238/kotlin/reflect/KType;)Lnicoid/network238/kotlin/reflect/KType;
    .registers 6

    .line 116
    move-object v0, p1

    check-cast v0, Lnicoid/network238/kotlin/jvm/internal/TypeReference;

    .line 117
    new-instance v1, Lnicoid/network238/kotlin/jvm/internal/TypeReference;

    .line 118
    invoke-interface {p1}, Lnicoid/network238/kotlin/reflect/KType;->getClassifier()Lnicoid/network238/kotlin/reflect/KClassifier;

    move-result-object v2

    invoke-interface {p1}, Lnicoid/network238/kotlin/reflect/KType;->getArguments()Ljava/util/List;

    move-result-object p1

    invoke-virtual {v0}, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->getPlatformTypeUpperBound$kotlin_stdlib()Lnicoid/network238/kotlin/reflect/KType;

    move-result-object v3

    .line 119
    invoke-virtual {v0}, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->getFlags$kotlin_stdlib()I

    move-result v0

    or-int/lit8 v0, v0, 0x4

    invoke-direct {v1, v2, p1, v3, v0}, Lnicoid/network238/kotlin/jvm/internal/TypeReference;-><init>(Lnicoid/network238/kotlin/reflect/KClassifier;Ljava/util/List;Lnicoid/network238/kotlin/reflect/KType;I)V

    return-object v1
.end method

.method public platformType(Lnicoid/network238/kotlin/reflect/KType;Lnicoid/network238/kotlin/reflect/KType;)Lnicoid/network238/kotlin/reflect/KType;
    .registers 6

    .line 99
    new-instance v0, Lnicoid/network238/kotlin/jvm/internal/TypeReference;

    .line 100
    invoke-interface {p1}, Lnicoid/network238/kotlin/reflect/KType;->getClassifier()Lnicoid/network238/kotlin/reflect/KClassifier;

    move-result-object v1

    invoke-interface {p1}, Lnicoid/network238/kotlin/reflect/KType;->getArguments()Ljava/util/List;

    move-result-object v2

    check-cast p1, Lnicoid/network238/kotlin/jvm/internal/TypeReference;

    .line 101
    invoke-virtual {p1}, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->getFlags$kotlin_stdlib()I

    move-result p1

    invoke-direct {v0, v1, v2, p2, p1}, Lnicoid/network238/kotlin/jvm/internal/TypeReference;-><init>(Lnicoid/network238/kotlin/reflect/KClassifier;Ljava/util/List;Lnicoid/network238/kotlin/reflect/KType;I)V

    return-object v0
.end method

.method public property0(Lnicoid/network238/kotlin/jvm/internal/PropertyReference0;)Lnicoid/network238/kotlin/reflect/KProperty0;
    .registers 2

    return-object p1
.end method

.method public property1(Lnicoid/network238/kotlin/jvm/internal/PropertyReference1;)Lnicoid/network238/kotlin/reflect/KProperty1;
    .registers 2

    return-object p1
.end method

.method public property2(Lnicoid/network238/kotlin/jvm/internal/PropertyReference2;)Lnicoid/network238/kotlin/reflect/KProperty2;
    .registers 2

    return-object p1
.end method

.method public renderLambdaToString(Lnicoid/network238/kotlin/jvm/internal/FunctionBase;)Ljava/lang/String;
    .registers 3

    .line 44
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getGenericInterfaces()[Ljava/lang/reflect/Type;

    move-result-object p1

    const/4 v0, 0x0

    aget-object p1, p1, v0

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 45
    const-string v0, "nicoid.network238.kotlin.jvm.functions."

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x15

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    :cond_0
    return-object p1
.end method

.method public renderLambdaToString(Lnicoid/network238/kotlin/jvm/internal/Lambda;)Ljava/lang/String;
    .registers 2

    .line 39
    invoke-virtual {p0, p1}, Lnicoid/network238/kotlin/jvm/internal/ReflectionFactory;->renderLambdaToString(Lnicoid/network238/kotlin/jvm/internal/FunctionBase;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public setUpperBounds(Lnicoid/network238/kotlin/reflect/KTypeParameter;Ljava/util/List;)V
    .registers 3

    .line 94
    check-cast p1, Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference;

    invoke-virtual {p1, p2}, Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference;->setUpperBounds(Ljava/util/List;)V

    return-void
.end method

.method public typeOf(Lnicoid/network238/kotlin/reflect/KClassifier;Ljava/util/List;Z)Lnicoid/network238/kotlin/reflect/KType;
    .registers 5

    .line 84
    new-instance v0, Lnicoid/network238/kotlin/jvm/internal/TypeReference;

    invoke-direct {v0, p1, p2, p3}, Lnicoid/network238/kotlin/jvm/internal/TypeReference;-><init>(Lnicoid/network238/kotlin/reflect/KClassifier;Ljava/util/List;Z)V

    return-object v0
.end method

.method public typeParameter(Ljava/lang/Object;Ljava/lang/String;Lnicoid/network238/kotlin/reflect/KVariance;Z)Lnicoid/network238/kotlin/reflect/KTypeParameter;
    .registers 6

    .line 89
    new-instance v0, Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference;

    invoke-direct {v0, p1, p2, p3, p4}, Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference;-><init>(Ljava/lang/Object;Ljava/lang/String;Lnicoid/network238/kotlin/reflect/KVariance;Z)V

    return-object v0
.end method
