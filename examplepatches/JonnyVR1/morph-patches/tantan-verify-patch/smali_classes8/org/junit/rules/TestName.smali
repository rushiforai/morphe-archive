.class public Lorg/junit/rules/TestName;
.super Lorg/junit/rules/TestWatcher;
.source "SourceFile"


# instance fields
.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/junit/rules/TestWatcher;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getMethodName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/junit/rules/TestName;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public starting(Lorg/junit/runner/Description;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lorg/junit/runner/Description;->getMethodName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lorg/junit/rules/TestName;->name:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method
