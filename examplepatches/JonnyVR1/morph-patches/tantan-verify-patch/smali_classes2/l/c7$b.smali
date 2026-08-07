.class public Ll/c7$b;
.super Ll/o2j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/c7;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<INFO:",
        "Ljava/lang/Object;",
        ">",
        "Ll/o2j<",
        "TINFO;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o2j;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static j(Ll/v36;Ll/v36;)Ll/c7$b;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<INFO:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/v36<",
            "-TINFO;>;",
            "Ll/v36<",
            "-TINFO;>;)",
            "Ll/c7$b<",
            "TINFO;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/i9j;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "AbstractDraweeController#createInternal"

    .line 8
    .line 9
    invoke-static {v0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    new-instance v0, Ll/c7$b;

    .line 13
    .line 14
    invoke-direct {v0}, Ll/c7$b;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ll/o2j;->g(Ll/v36;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ll/o2j;->g(Ll/v36;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/i9j;->d()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    invoke-static {}, Ll/i9j;->b()V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-object v0
.end method
