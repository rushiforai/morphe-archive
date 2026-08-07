.class public Ll/clq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/mqi0;
.implements Lorg/junit/runner/Describable;


# instance fields
.field private final a:Lorg/junit/runner/Description;


# direct methods
.method public constructor <init>(Lorg/junit/runner/Description;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/clq;->a:Lorg/junit/runner/Description;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/tqi0;)V
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/RuntimeException;

    .line 2
    .line 3
    const-string p1, "This test stub created only for informational purposes."

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method

.method public b()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public getDescription()Lorg/junit/runner/Description;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/clq;->a:Lorg/junit/runner/Description;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/clq;->getDescription()Lorg/junit/runner/Description;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lorg/junit/runner/Description;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
