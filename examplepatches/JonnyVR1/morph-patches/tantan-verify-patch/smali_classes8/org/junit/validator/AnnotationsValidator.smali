.class public final Lorg/junit/validator/AnnotationsValidator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/junit/validator/TestClassValidator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/junit/validator/AnnotationsValidator$FieldValidator;,
        Lorg/junit/validator/AnnotationsValidator$MethodValidator;,
        Lorg/junit/validator/AnnotationsValidator$ClassValidator;,
        Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator;
    }
.end annotation


# static fields
.field private static final VALIDATORS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator<",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lorg/junit/validator/AnnotationsValidator$ClassValidator;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lorg/junit/validator/AnnotationsValidator$ClassValidator;-><init>(Lorg/junit/validator/AnnotationsValidator$1;)V

    .line 5
    .line 6
    .line 7
    new-instance v2, Lorg/junit/validator/AnnotationsValidator$MethodValidator;

    .line 8
    .line 9
    invoke-direct {v2, v1}, Lorg/junit/validator/AnnotationsValidator$MethodValidator;-><init>(Lorg/junit/validator/AnnotationsValidator$1;)V

    .line 10
    .line 11
    .line 12
    new-instance v3, Lorg/junit/validator/AnnotationsValidator$FieldValidator;

    .line 13
    .line 14
    invoke-direct {v3, v1}, Lorg/junit/validator/AnnotationsValidator$FieldValidator;-><init>(Lorg/junit/validator/AnnotationsValidator$1;)V

    .line 15
    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    new-array v1, v1, [Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator;

    .line 19
    .line 20
    const/4 v4, 0x0

    .line 21
    aput-object v0, v1, v4

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    aput-object v2, v1, v0

    .line 25
    .line 26
    const/4 v0, 0x2

    .line 27
    aput-object v3, v1, v0

    .line 28
    .line 29
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sput-object v0, Lorg/junit/validator/AnnotationsValidator;->VALIDATORS:Ljava/util/List;

    .line 34
    .line 35
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public validateTestClass(Lorg/junit/runners/model/TestClass;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runners/model/TestClass;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Exception;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lorg/junit/validator/AnnotationsValidator;->VALIDATORS:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator;

    .line 23
    .line 24
    invoke-virtual {v1, p1}, Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator;->validateTestClass(Lorg/junit/runners/model/TestClass;)Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-interface {p0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-object p0
.end method
