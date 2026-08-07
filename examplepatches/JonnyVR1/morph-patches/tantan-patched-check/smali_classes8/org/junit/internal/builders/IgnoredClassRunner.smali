.class public Lorg/junit/internal/builders/IgnoredClassRunner;
.super Lorg/junit/runner/Runner;
.source "SourceFile"


# instance fields
.field private final clazz:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lorg/junit/runner/Runner;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/junit/internal/builders/IgnoredClassRunner;->clazz:Ljava/lang/Class;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getDescription()Lorg/junit/runner/Description;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/junit/internal/builders/IgnoredClassRunner;->clazz:Ljava/lang/Class;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/junit/runner/Description;->createSuiteDescription(Ljava/lang/Class;)Lorg/junit/runner/Description;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public run(Lorg/junit/runner/notification/RunNotifier;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/junit/internal/builders/IgnoredClassRunner;->getDescription()Lorg/junit/runner/Description;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Lorg/junit/runner/notification/RunNotifier;->fireTestIgnored(Lorg/junit/runner/Description;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
