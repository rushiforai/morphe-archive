.class public Lorg/junit/experimental/theories/internal/Assignments;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final assigned:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/junit/experimental/theories/PotentialAssignment;",
            ">;"
        }
    .end annotation
.end field

.field private final clazz:Lorg/junit/runners/model/TestClass;

.field private final unassigned:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/junit/experimental/theories/ParameterSignature;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/util/List;Ljava/util/List;Lorg/junit/runners/model/TestClass;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/junit/experimental/theories/PotentialAssignment;",
            ">;",
            "Ljava/util/List<",
            "Lorg/junit/experimental/theories/ParameterSignature;",
            ">;",
            "Lorg/junit/runners/model/TestClass;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lorg/junit/experimental/theories/internal/Assignments;->unassigned:Ljava/util/List;

    .line 5
    .line 6
    iput-object p1, p0, Lorg/junit/experimental/theories/internal/Assignments;->assigned:Ljava/util/List;

    .line 7
    .line 8
    iput-object p3, p0, Lorg/junit/experimental/theories/internal/Assignments;->clazz:Lorg/junit/runners/model/TestClass;

    .line 9
    .line 10
    return-void
.end method

.method public static allUnassigned(Ljava/lang/reflect/Method;Lorg/junit/runners/model/TestClass;)Lorg/junit/experimental/theories/internal/Assignments;
    .locals 2

    .line 1
    invoke-virtual {p1}, Lorg/junit/runners/model/TestClass;->getOnlyConstructor()Ljava/lang/reflect/Constructor;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lorg/junit/experimental/theories/ParameterSignature;->signatures(Ljava/lang/reflect/Constructor;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p0}, Lorg/junit/experimental/theories/ParameterSignature;->signatures(Ljava/lang/reflect/Method;)Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {v0, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    new-instance p0, Lorg/junit/experimental/theories/internal/Assignments;

    .line 17
    .line 18
    new-instance v1, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0, v1, v0, p1}, Lorg/junit/experimental/theories/internal/Assignments;-><init>(Ljava/util/List;Ljava/util/List;Lorg/junit/runners/model/TestClass;)V

    .line 24
    .line 25
    .line 26
    return-object p0
.end method

.method private buildParameterSupplierFromClass(Ljava/lang/Class;)Lorg/junit/experimental/theories/ParameterSupplier;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lorg/junit/experimental/theories/ParameterSupplier;",
            ">;)",
            "Lorg/junit/experimental/theories/ParameterSupplier;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Class;->getConstructors()[Ljava/lang/reflect/Constructor;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const/4 v2, 0x0

    .line 7
    move v3, v2

    .line 8
    :goto_0
    if-ge v3, v1, :cond_1

    .line 9
    .line 10
    aget-object v4, v0, v3

    .line 11
    .line 12
    invoke-virtual {v4}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v5

    .line 16
    array-length v6, v5

    .line 17
    const/4 v7, 0x1

    .line 18
    if-ne v6, v7, :cond_0

    .line 19
    .line 20
    aget-object v5, v5, v2

    .line 21
    .line 22
    const-class v6, Lorg/junit/runners/model/TestClass;

    .line 23
    .line 24
    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v5

    .line 28
    if-eqz v5, :cond_0

    .line 29
    .line 30
    iget-object p0, p0, Lorg/junit/experimental/theories/internal/Assignments;->clazz:Lorg/junit/runners/model/TestClass;

    .line 31
    .line 32
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Lorg/junit/experimental/theories/ParameterSupplier;

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    check-cast p0, Lorg/junit/experimental/theories/ParameterSupplier;

    .line 51
    .line 52
    return-object p0
.end method

.method private generateAssignmentsFromTypeAlone(Lorg/junit/experimental/theories/ParameterSignature;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/experimental/theories/ParameterSignature;",
            ")",
            "Ljava/util/List<",
            "Lorg/junit/experimental/theories/PotentialAssignment;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lorg/junit/experimental/theories/ParameterSignature;->getType()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Class;->isEnum()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Lorg/junit/experimental/theories/internal/EnumSupplier;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lorg/junit/experimental/theories/internal/EnumSupplier;-><init>(Ljava/lang/Class;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Lorg/junit/experimental/theories/internal/EnumSupplier;->getValueSources(Lorg/junit/experimental/theories/ParameterSignature;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    const-class v0, Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_2

    .line 28
    .line 29
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_2
    :goto_0
    new-instance p0, Lorg/junit/experimental/theories/internal/BooleanSupplier;

    .line 42
    .line 43
    invoke-direct {p0}, Lorg/junit/experimental/theories/internal/BooleanSupplier;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p1}, Lorg/junit/experimental/theories/internal/BooleanSupplier;->getValueSources(Lorg/junit/experimental/theories/ParameterSignature;)Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method

.method private getConstructorParameterCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/junit/experimental/theories/internal/Assignments;->clazz:Lorg/junit/runners/model/TestClass;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/junit/runners/model/TestClass;->getOnlyConstructor()Ljava/lang/reflect/Constructor;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lorg/junit/experimental/theories/ParameterSignature;->signatures(Ljava/lang/reflect/Constructor;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private getSupplier(Lorg/junit/experimental/theories/ParameterSignature;)Lorg/junit/experimental/theories/ParameterSupplier;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const-class v0, Lorg/junit/experimental/theories/ParametersSuppliedBy;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lorg/junit/experimental/theories/ParameterSignature;->findDeepAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lorg/junit/experimental/theories/ParametersSuppliedBy;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Lorg/junit/experimental/theories/ParametersSuppliedBy;->value()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-direct {p0, p1}, Lorg/junit/experimental/theories/internal/Assignments;->buildParameterSupplierFromClass(Ljava/lang/Class;)Lorg/junit/experimental/theories/ParameterSupplier;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    new-instance p1, Lorg/junit/experimental/theories/internal/AllMembersSupplier;

    .line 21
    .line 22
    iget-object p0, p0, Lorg/junit/experimental/theories/internal/Assignments;->clazz:Lorg/junit/runners/model/TestClass;

    .line 23
    .line 24
    invoke-direct {p1, p0}, Lorg/junit/experimental/theories/internal/AllMembersSupplier;-><init>(Lorg/junit/runners/model/TestClass;)V

    .line 25
    .line 26
    .line 27
    return-object p1
.end method


# virtual methods
.method public assignNext(Lorg/junit/experimental/theories/PotentialAssignment;)Lorg/junit/experimental/theories/internal/Assignments;
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/junit/experimental/theories/internal/Assignments;->assigned:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    new-instance p1, Lorg/junit/experimental/theories/internal/Assignments;

    .line 12
    .line 13
    iget-object v1, p0, Lorg/junit/experimental/theories/internal/Assignments;->unassigned:Ljava/util/List;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    invoke-interface {v1, v2, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object p0, p0, Lorg/junit/experimental/theories/internal/Assignments;->clazz:Lorg/junit/runners/model/TestClass;

    .line 25
    .line 26
    invoke-direct {p1, v0, v1, p0}, Lorg/junit/experimental/theories/internal/Assignments;-><init>(Ljava/util/List;Ljava/util/List;Lorg/junit/runners/model/TestClass;)V

    .line 27
    .line 28
    .line 29
    return-object p1
.end method

.method public getActualValues(II)[Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/experimental/theories/PotentialAssignment$CouldNotGenerateValueException;
        }
    .end annotation

    .line 1
    sub-int v0, p2, p1

    .line 2
    .line 3
    new-array v0, v0, [Ljava/lang/Object;

    .line 4
    .line 5
    move v1, p1

    .line 6
    :goto_0
    if-ge v1, p2, :cond_0

    .line 7
    .line 8
    sub-int v2, v1, p1

    .line 9
    .line 10
    iget-object v3, p0, Lorg/junit/experimental/theories/internal/Assignments;->assigned:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    check-cast v3, Lorg/junit/experimental/theories/PotentialAssignment;

    .line 17
    .line 18
    invoke-virtual {v3}, Lorg/junit/experimental/theories/PotentialAssignment;->getValue()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    aput-object v3, v0, v2

    .line 23
    .line 24
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-object v0
.end method

.method public getAllArguments()[Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/experimental/theories/PotentialAssignment$CouldNotGenerateValueException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/junit/experimental/theories/internal/Assignments;->assigned:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v1, v0}, Lorg/junit/experimental/theories/internal/Assignments;->getActualValues(II)[Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public getArgumentStrings(Z)[Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/experimental/theories/PotentialAssignment$CouldNotGenerateValueException;
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lorg/junit/experimental/theories/internal/Assignments;->assigned:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    new-array v0, p1, [Ljava/lang/Object;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    :goto_0
    if-ge v1, p1, :cond_0

    .line 11
    .line 12
    iget-object v2, p0, Lorg/junit/experimental/theories/internal/Assignments;->assigned:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Lorg/junit/experimental/theories/PotentialAssignment;

    .line 19
    .line 20
    invoke-virtual {v2}, Lorg/junit/experimental/theories/PotentialAssignment;->getDescription()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    aput-object v2, v0, v1

    .line 25
    .line 26
    add-int/lit8 v1, v1, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-object v0
.end method

.method public getConstructorArguments()[Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/experimental/theories/PotentialAssignment$CouldNotGenerateValueException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0}, Lorg/junit/experimental/theories/internal/Assignments;->getConstructorParameterCount()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    invoke-virtual {p0, v0, v1}, Lorg/junit/experimental/theories/internal/Assignments;->getActualValues(II)[Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public getMethodArguments()[Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/experimental/theories/PotentialAssignment$CouldNotGenerateValueException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lorg/junit/experimental/theories/internal/Assignments;->getConstructorParameterCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lorg/junit/experimental/theories/internal/Assignments;->assigned:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {p0, v0, v1}, Lorg/junit/experimental/theories/internal/Assignments;->getActualValues(II)[Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public isComplete()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/junit/experimental/theories/internal/Assignments;->unassigned:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public nextUnassigned()Lorg/junit/experimental/theories/ParameterSignature;
    .locals 1

    .line 1
    iget-object p0, p0, Lorg/junit/experimental/theories/internal/Assignments;->unassigned:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lorg/junit/experimental/theories/ParameterSignature;

    .line 9
    .line 10
    return-object p0
.end method

.method public potentialsForNextUnassigned()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lorg/junit/experimental/theories/PotentialAssignment;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/junit/experimental/theories/internal/Assignments;->nextUnassigned()Lorg/junit/experimental/theories/ParameterSignature;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Lorg/junit/experimental/theories/internal/Assignments;->getSupplier(Lorg/junit/experimental/theories/ParameterSignature;)Lorg/junit/experimental/theories/ParameterSupplier;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1, v0}, Lorg/junit/experimental/theories/ParameterSupplier;->getValueSources(Lorg/junit/experimental/theories/ParameterSignature;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    invoke-direct {p0, v0}, Lorg/junit/experimental/theories/internal/Assignments;->generateAssignmentsFromTypeAlone(Lorg/junit/experimental/theories/ParameterSignature;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    return-object v1
.end method
