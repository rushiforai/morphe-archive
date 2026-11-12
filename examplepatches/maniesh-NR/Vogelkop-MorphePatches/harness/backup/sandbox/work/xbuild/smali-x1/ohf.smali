.class public final Lohf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhpf;
.implements Lqdb;


# instance fields
.field public final a:Lx5f;


# direct methods
.method public constructor <init>(Lx5f;)V
    .registers 2

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lohf;->a:Lx5f;

    return-void
.end method

.method public constructor <init>(Lxb;Lx5f;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lohf;->a:Lx5f;

    iget-object p1, p1, Lxb;->e:Ljze;

    new-instance p2, Lt77;

    const/4 v0, 0x6

    invoke-direct {p2, p0, v0}, Lt77;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lekc;->k(Lf7f;)V

    return-void
.end method


# virtual methods
.method public final I(Lfpf;)V
    .registers 2

    iget-object p0, p0, Lohf;->a:Lx5f;

    sget-object p1, Lpl0;->b:Lpl0;

    invoke-virtual {p0, p1}, Lx5f;->j0(Lpl0;)V

    return-void
.end method

.method public final a(Lpdb;)V
    .registers 2

    return-void
.end method

.method public final b(Lvr0;)V
    .registers 6

    iget-object p0, p0, Lohf;->a:Lx5f;

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

    const/4 v3, 0x0

    invoke-direct {v0, p1, v3}, Lt5f;-><init>(Lvr0;B)V

    invoke-virtual {v2, v0}, Lck0;->b(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final h(Lcpf;)V
    .registers 2

    iget-object p0, p0, Lohf;->a:Lx5f;

    sget-object p1, Lpl0;->c:Lpl0;

    invoke-virtual {p0, p1}, Lx5f;->j0(Lpl0;)V

    return-void
.end method

.method public final n(Lepf;)V
    .registers 2

    return-void
.end method

.method public final r(Lgpf;)V
    .registers 2

    iget-object p0, p0, Lohf;->a:Lx5f;

    sget-object p1, Lpl0;->d:Lpl0;

    invoke-virtual {p0, p1}, Lx5f;->j0(Lpl0;)V

    return-void
.end method
