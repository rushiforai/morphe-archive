.class public abstract Lorg/junit/validator/AnnotationValidator;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final NO_VALIDATION_ERRORS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Exception;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 2
    .line 3
    sput-object v0, Lorg/junit/validator/AnnotationValidator;->NO_VALIDATION_ERRORS:Ljava/util/List;

    .line 4
    .line 5
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
.method public validateAnnotatedClass(Lorg/junit/runners/model/TestClass;)Ljava/util/List;
    .locals 0
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
    sget-object p0, Lorg/junit/validator/AnnotationValidator;->NO_VALIDATION_ERRORS:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public validateAnnotatedField(Lorg/junit/runners/model/FrameworkField;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runners/model/FrameworkField;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Exception;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lorg/junit/validator/AnnotationValidator;->NO_VALIDATION_ERRORS:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public validateAnnotatedMethod(Lorg/junit/runners/model/FrameworkMethod;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runners/model/FrameworkMethod;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Exception;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lorg/junit/validator/AnnotationValidator;->NO_VALIDATION_ERRORS:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method
