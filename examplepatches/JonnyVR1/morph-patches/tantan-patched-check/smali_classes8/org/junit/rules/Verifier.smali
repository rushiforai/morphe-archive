.class public abstract Lorg/junit/rules/Verifier;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/junit/rules/TestRule;


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
.method public apply(Lorg/junit/runners/model/Statement;Lorg/junit/runner/Description;)Lorg/junit/runners/model/Statement;
    .locals 0

    .line 1
    new-instance p2, Lorg/junit/rules/Verifier$1;

    .line 2
    .line 3
    invoke-direct {p2, p0, p1}, Lorg/junit/rules/Verifier$1;-><init>(Lorg/junit/rules/Verifier;Lorg/junit/runners/model/Statement;)V

    .line 4
    .line 5
    .line 6
    return-object p2
.end method

.method public verify()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    return-void
.end method
