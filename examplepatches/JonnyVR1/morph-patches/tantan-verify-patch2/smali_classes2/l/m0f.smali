.class public Ll/m0f;
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

.method public static a(Ll/a7h0;Ll/gqy;Ll/mpy$a;)Ll/hsb;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a7h0<",
            "Ll/npy;",
            ">;",
            "Ll/gqy;",
            "Ll/mpy$a;",
            ")",
            "Ll/hsb<",
            "Ll/by3;",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v1, Ll/m0f$a;

    .line 2
    .line 3
    invoke-direct {v1}, Ll/m0f$a;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/zgw;

    .line 7
    .line 8
    const/4 v5, 0x0

    .line 9
    const/4 v6, 0x0

    .line 10
    const/4 v4, 0x0

    .line 11
    move-object v3, p0

    .line 12
    move-object v2, p2

    .line 13
    invoke-direct/range {v0 .. v6}, Ll/zgw;-><init>(Ll/x0l0;Ll/mpy$a;Ll/a7h0;Ll/hsb$b;ZZ)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p1, v0}, Ll/gqy;->a(Ll/fqy;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method
