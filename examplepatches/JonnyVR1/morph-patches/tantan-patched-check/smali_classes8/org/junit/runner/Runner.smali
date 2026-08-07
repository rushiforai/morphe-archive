.class public abstract Lorg/junit/runner/Runner;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/junit/runner/Describable;


# direct methods
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
.method public abstract getDescription()Lorg/junit/runner/Description;
.end method

.method public abstract run(Lorg/junit/runner/notification/RunNotifier;)V
.end method

.method public testCount()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/junit/runner/Runner;->getDescription()Lorg/junit/runner/Description;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lorg/junit/runner/Description;->testCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
