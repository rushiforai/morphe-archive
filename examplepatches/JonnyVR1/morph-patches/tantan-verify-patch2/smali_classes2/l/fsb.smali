.class public Ll/fsb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/m23;


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
.method public a(Ll/a7h0;Ll/gqy;Ll/mpy$a;ZZLl/hsb$b;)Ll/hsb;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a7h0<",
            "Ll/npy;",
            ">;",
            "Ll/gqy;",
            "Ll/mpy$a;",
            "ZZ",
            "Ll/hsb$b<",
            "Ll/by3;",
            ">;)",
            "Ll/hsb<",
            "Ll/by3;",
            "Ll/db5;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v1, Ll/fsb$a;

    .line 2
    .line 3
    invoke-direct {v1, p0}, Ll/fsb$a;-><init>(Ll/fsb;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/zgw;

    .line 7
    .line 8
    move-object v3, p1

    .line 9
    move-object v2, p3

    .line 10
    move v5, p4

    .line 11
    move v6, p5

    .line 12
    move-object v4, p6

    .line 13
    invoke-direct/range {v0 .. v6}, Ll/zgw;-><init>(Ll/x0l0;Ll/mpy$a;Ll/a7h0;Ll/hsb$b;ZZ)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p2, v0}, Ll/gqy;->a(Ll/fqy;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method
