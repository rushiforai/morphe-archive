.class public final Lj53;
.super Lgph;
.source "SourceFile"


# instance fields
.field public a:Z

.field public final synthetic b:Lxm3;


# direct methods
.method public constructor <init>(Lxm3;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lj53;->b:Lxm3;

    return-void
.end method


# virtual methods
.method public final f(II)V
    .registers 3

    invoke-virtual {p0}, Lj53;->j()V

    return-void
.end method

.method public final h(II)V
    .registers 3

    iget-object p1, p0, Lj53;->b:Lxm3;

    iget-object p1, p1, Lxm3;->e:Lxvj;

    iget p1, p1, Lxvj;->h:I

    if-nez p1, :cond_b

    const/4 p1, 0x0

    iput-boolean p1, p0, Lj53;->a:Z

    :cond_b
    invoke-virtual {p0}, Lj53;->j()V

    return-void
.end method

.method public final j()V
    .registers 10

    iget-object v0, p0, Lj53;->b:Lxm3;

    iget-object v1, v0, Lxm3;->h:Lqhc;

    iget-object v2, v0, Lxm3;->c:Lml3;

    const/4 v3, 0x3

    if-eqz v2, :cond_f

    invoke-interface {v2}, Lml3;->h()Z

    move-result v2

    if-nez v2, :cond_1b

    :cond_f
    iget v2, v0, Lxm3;->i:I

    if-ne v2, v3, :cond_1b

    iget-object v2, v0, Lxm3;->l:Lgn3;

    invoke-virtual {v2}, Lgn3;->e()Z

    move-result v2

    if-eqz v2, :cond_57

    :cond_1b
    iget-object v2, v0, Lxm3;->e:Lxvj;

    iget v2, v2, Lxvj;->h:I

    const/4 v4, 0x1

    sub-int/2addr v2, v4

    if-ltz v2, :cond_57

    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Lxm3;->H(I)Lqhc;

    move-result-object v6

    invoke-virtual {v0, v2}, Lxm3;->H(I)Lqhc;

    move-result-object v2

    invoke-virtual {v6}, Lqhc;->c()I

    move-result v7

    const/4 v8, 0x6

    if-eq v7, v8, :cond_3a

    invoke-virtual {v6}, Lqhc;->c()I

    move-result v6

    const/4 v7, 0x2

    if-ne v6, v7, :cond_4c

    :cond_3a
    invoke-virtual {v2}, Lqhc;->c()I

    move-result v2

    if-ne v2, v3, :cond_4c

    iget-boolean v2, p0, Lj53;->a:Z

    if-nez v2, :cond_57

    iput-boolean v4, p0, Lj53;->a:Z

    iget-object p0, v0, Lxm3;->e:Lxvj;

    invoke-virtual {p0, v1}, Lxvj;->a(Ljava/lang/Object;)I

    return-void

    :cond_4c
    iget-boolean v2, p0, Lj53;->a:Z

    if-eqz v2, :cond_57

    iput-boolean v5, p0, Lj53;->a:Z

    iget-object p0, v0, Lxm3;->e:Lxvj;

    invoke-virtual {p0, v1}, Lxvj;->g(Ljava/lang/Object;)V

    :cond_57
    return-void
.end method
