.class public final Lzkk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqdb;


# instance fields
.field public final a:Lx5f;


# direct methods
.method public constructor <init>(Lpde;Lx5f;Lz9j;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lzkk;->a:Lx5f;

    new-instance p2, Lg9l;

    const/4 v0, 0x3

    invoke-direct {p2, p0, v0}, Lg9l;-><init>(Ljava/lang/Object;B)V

    invoke-static {p3, p1, p2}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method

.method public constructor <init>(Lx5f;)V
    .registers 2

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lzkk;->a:Lx5f;

    return-void
.end method


# virtual methods
.method public final a(Lpdb;)V
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    const/4 v0, 0x7

    const/16 v1, 0x98b

    const/16 v2, 0x16

    const/4 v3, 0x1

    iget-object p0, p0, Lzkk;->a:Lx5f;

    if-eqz p1, :cond_3d

    const/4 v4, 0x2

    if-eq p1, v3, :cond_17

    if-eq p1, v4, :cond_41

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_17
    iget-boolean p1, p0, Lx5f;->h:Z

    if-eqz p1, :cond_41

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lc66;

    if-nez v5, :cond_36

    new-instance v5, Lc66;

    invoke-direct {v5, v1, v3, v0}, Ljf0;-><init>(III)V

    invoke-virtual {p1, v2, v3, v5}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lc66;

    :cond_36
    invoke-virtual {v5, v4}, Ljf0;->e(I)V

    invoke-virtual {p0, p1}, Lx5f;->U0(Lx56;)V

    return-void

    :cond_3d
    iget-boolean p1, p0, Lx5f;->h:Z

    if-nez p1, :cond_42

    :cond_41
    return-void

    :cond_42
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lc66;

    if-nez v4, :cond_5d

    new-instance v4, Lc66;

    invoke-direct {v4, v1, v3, v0}, Ljf0;-><init>(III)V

    invoke-virtual {p1, v2, v3, v4}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lc66;

    :cond_5d
    const/4 v0, 0x3

    invoke-virtual {v4, v0}, Ljf0;->e(I)V

    invoke-virtual {p0, p1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final b(Lvr0;)V
    .registers 6

    iget-object p0, p0, Lzkk;->a:Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    new-instance v2, Lck0;

    invoke-direct {v2, v0, v1}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance v0, Lt5f;

    const/4 v3, 0x1

    invoke-direct {v0, p1, v3}, Lt5f;-><init>(Lvr0;B)V

    invoke-virtual {v2, v0}, Lck0;->b(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    return-void
.end method
