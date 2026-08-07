.class public Ll/bhw;
.super Ll/wgw;
.source "SourceFile"

# interfaces
.implements Ll/lpy;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/wgw<",
        "Ll/kzq;",
        "Ll/u3d0<",
        "*>;>;",
        "Ll/lpy;"
    }
.end annotation


# instance fields
.field private e:Ll/lpy$a;


# direct methods
.method public constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/wgw;-><init>(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .line 1
    const/16 v0, 0x28

    .line 2
    .line 3
    if-lt p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wgw;->b()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/16 v0, 0x14

    .line 10
    .line 11
    if-ge p1, v0, :cond_2

    .line 12
    .line 13
    const/16 v0, 0xf

    .line 14
    .line 15
    if-ne p1, v0, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    return-void

    .line 19
    :cond_2
    :goto_0
    invoke-virtual {p0}, Ll/wgw;->h()J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    const-wide/16 v2, 0x2

    .line 24
    .line 25
    div-long/2addr v0, v2

    .line 26
    invoke-virtual {p0, v0, v1}, Ll/wgw;->m(J)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public c(Ll/lpy$a;)V
    .locals 0
    .param p1    # Ll/lpy$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/bhw;->e:Ll/lpy$a;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic d(Ll/kzq;Ll/u3d0;)Ll/u3d0;
    .locals 0
    .param p1    # Ll/kzq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/u3d0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Ll/wgw;->k(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/u3d0;

    .line 6
    .line 7
    return-object p0
.end method

.method public bridge synthetic e(Ll/kzq;)Ll/u3d0;
    .locals 0
    .param p1    # Ll/kzq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0, p1}, Ll/wgw;->l(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/u3d0;

    .line 6
    .line 7
    return-object p0
.end method

.method public bridge synthetic i(Ljava/lang/Object;)I
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    check-cast p1, Ll/u3d0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/bhw;->n(Ll/u3d0;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic j(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    check-cast p1, Ll/kzq;

    .line 2
    .line 3
    check-cast p2, Ll/u3d0;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/bhw;->o(Ll/kzq;Ll/u3d0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public n(Ll/u3d0;)I
    .locals 0
    .param p1    # Ll/u3d0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/u3d0<",
            "*>;)I"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-super {p0, p1}, Ll/wgw;->i(Ljava/lang/Object;)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-interface {p1}, Ll/u3d0;->getSize()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public o(Ll/kzq;Ll/u3d0;)V
    .locals 0
    .param p1    # Ll/kzq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/u3d0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/kzq;",
            "Ll/u3d0<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bhw;->e:Ll/lpy$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p2}, Ll/lpy$a;->c(Ll/u3d0;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
