.class public Ll/iym;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a(Ll/mpy;Ll/mhm;)Ll/hym;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/mpy<",
            "Ll/by3;",
            "Ll/db5;",
            ">;",
            "Ll/mhm;",
            ")",
            "Ll/hym<",
            "Ll/by3;",
            "Ll/db5;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-interface {p1, p0}, Ll/mhm;->e(Ll/mpy;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/iym$a;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/iym$a;-><init>(Ll/mhm;)V

    .line 7
    .line 8
    .line 9
    new-instance p1, Ll/hym;

    .line 10
    .line 11
    invoke-direct {p1, p0, v0}, Ll/hym;-><init>(Ll/mpy;Ll/opy;)V

    .line 12
    .line 13
    .line 14
    return-object p1
.end method
