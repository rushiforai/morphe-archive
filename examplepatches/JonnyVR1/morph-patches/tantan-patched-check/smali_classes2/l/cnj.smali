.class public Ll/cnj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y4d0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y4d0<",
        "Ll/bnj;",
        "[B>;"
    }
.end annotation


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
.method public a(Ll/u3d0;Ll/u560;)Ll/u3d0;
    .locals 0
    .param p1    # Ll/u3d0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/u560;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/u3d0<",
            "Ll/bnj;",
            ">;",
            "Ll/u560;",
            ")",
            "Ll/u3d0<",
            "[B>;"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/u3d0;->get()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/bnj;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/bnj;->c()Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance p1, Ll/wr3;

    .line 12
    .line 13
    invoke-static {p0}, Ll/er3;->e(Ljava/nio/ByteBuffer;)[B

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-direct {p1, p0}, Ll/wr3;-><init>([B)V

    .line 18
    .line 19
    .line 20
    return-object p1
.end method
