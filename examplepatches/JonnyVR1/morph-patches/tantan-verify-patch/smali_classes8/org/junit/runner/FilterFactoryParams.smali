.class public final Lorg/junit/runner/FilterFactoryParams;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final args:Ljava/lang/String;

.field private final topLevelDescription:Lorg/junit/runner/Description;


# direct methods
.method public constructor <init>(Lorg/junit/runner/Description;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iput-object p1, p0, Lorg/junit/runner/FilterFactoryParams;->topLevelDescription:Lorg/junit/runner/Description;

    .line 9
    .line 10
    iput-object p2, p0, Lorg/junit/runner/FilterFactoryParams;->args:Ljava/lang/String;

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    throw p0
.end method


# virtual methods
.method public getArgs()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/junit/runner/FilterFactoryParams;->args:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTopLevelDescription()Lorg/junit/runner/Description;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/junit/runner/FilterFactoryParams;->topLevelDescription:Lorg/junit/runner/Description;

    .line 2
    .line 3
    return-object p0
.end method
