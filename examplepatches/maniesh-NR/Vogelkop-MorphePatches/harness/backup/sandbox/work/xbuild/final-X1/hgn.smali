.class public final Lhgn;
.super Llim;
.source "SourceFile"

# interfaces
.implements Ltdn;


# instance fields
.field public final a:Lydn;

.field public final b:Lx5f;


# direct methods
.method public constructor <init>(Lydn;Lx5f;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhgn;->a:Lydn;

    iput-object p2, p0, Lhgn;->b:Lx5f;

    return-void
.end method


# virtual methods
.method public final R()V
    .registers 6

    iget-object v0, p0, Lhgn;->a:Lydn;

    invoke-virtual {v0}, Lydn;->i()Lfdn;

    move-result-object v0

    iget-object v0, v0, Lfdn;->d:Lpt0;

    iget-object p0, p0, Lhgn;->b:Lx5f;

    iget-boolean v1, p0, Lx5f;->h:Z

    if-nez v1, :cond_f

    return-void

    :cond_f
    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    invoke-virtual {v2, v1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v3, 0x32

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v4, v0}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v2}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final S()V
    .registers 8

    iget-object v0, p0, Lhgn;->a:Lydn;

    invoke-virtual {v0}, Lydn;->p()Lwdn;

    move-result-object v1

    iget-boolean v1, v1, Lwdn;->a:Z

    iget-object v2, v0, Lydn;->d:Lvdn;

    iget-boolean v3, v2, Lvdn;->a:Z

    invoke-virtual {v2}, Lvdn;->b()Z

    move-result v2

    iget-boolean v0, v0, Lydn;->B:Z

    iget-object p0, p0, Lhgn;->b:Lx5f;

    iget-boolean v4, p0, Lx5f;->h:Z

    if-eqz v4, :cond_1c

    iget-object v4, p0, Lx5f;->d:Lzpa;

    if-nez v1, :cond_1d

    :cond_1c
    return-void

    :cond_1d
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    invoke-virtual {v1, v4}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v4

    const/16 v5, 0x2f

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6, v3}, Ljf0;->r(IIZ)V

    if-eqz v3, :cond_37

    const/16 v3, 0x30

    invoke-virtual {v4, v3, v6, v2}, Ljf0;->r(IIZ)V

    const/16 v2, 0x31

    invoke-virtual {v4, v2, v6, v0}, Ljf0;->r(IIZ)V

    :cond_37
    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final W(Lndc;)V
    .registers 2

    iget-object p1, p0, Lhgn;->a:Lydn;

    invoke-virtual {p1, p0}, Lydn;->b(Ltdn;)V

    invoke-virtual {p0}, Lhgn;->S()V

    invoke-virtual {p0}, Lhgn;->R()V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Lhgn;->a:Lydn;

    invoke-virtual {p1, p0}, Lydn;->A(Ltdn;)V

    return-void
.end method

.method public final s()V
    .registers 1

    invoke-virtual {p0}, Lhgn;->S()V

    return-void
.end method

.method public final t()V
    .registers 1

    invoke-virtual {p0}, Lhgn;->R()V

    return-void
.end method
