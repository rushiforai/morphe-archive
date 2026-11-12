.class public final Lklk;
.super Lekc;
.source "SourceFile"


# instance fields
.field public final synthetic l:B

.field public final m:Ljava/lang/Object;

.field public final n:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ldb;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lklk;->l:B

    .line 30
    invoke-direct {p0}, Lekc;-><init>()V

    .line 31
    new-instance v0, Lnj2;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lnj2;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lklk;->n:Ljava/lang/Object;

    .line 32
    iput-object p1, p0, Lklk;->m:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lydn;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lklk;->l:B

    invoke-direct {p0}, Lekc;-><init>()V

    new-instance v0, Lnlk;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lnlk;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lklk;->n:Ljava/lang/Object;

    iput-object p1, p0, Lklk;->m:Ljava/lang/Object;

    iget-object p1, p1, Lydn;->c:Lgfn;

    invoke-interface {p1}, Lgfn;->isEnabled()Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final l()V
    .registers 4

    iget-byte v0, p0, Lklk;->l:B

    iget-object v1, p0, Lklk;->n:Ljava/lang/Object;

    iget-object v2, p0, Lklk;->m:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_2a

    check-cast v2, Lydn;

    check-cast v1, Lnlk;

    invoke-virtual {v2, v1}, Lydn;->b(Ltdn;)V

    iget-object v0, v2, Lydn;->c:Lgfn;

    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_1e
    invoke-virtual {p0}, Lklk;->s()V

    check-cast v2, Ldb;

    check-cast v1, Lnj2;

    invoke-virtual {v2, v1}, Ldb;->a(Lcb;)V

    return-void

    nop

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_1e
    .end packed-switch
.end method

.method public final m()V
    .registers 2

    iget-byte v0, p0, Lklk;->l:B

    packed-switch v0, :pswitch_data_1e

    iget-object v0, p0, Lklk;->m:Ljava/lang/Object;

    check-cast v0, Lydn;

    iget-object p0, p0, Lklk;->n:Ljava/lang/Object;

    check-cast p0, Lnlk;

    invoke-virtual {v0, p0}, Lydn;->A(Ltdn;)V

    return-void

    :pswitch_11
    iget-object v0, p0, Lklk;->m:Ljava/lang/Object;

    check-cast v0, Ldb;

    iget-object p0, p0, Lklk;->n:Ljava/lang/Object;

    check-cast p0, Lnj2;

    invoke-virtual {v0, p0}, Ldb;->h(Lcb;)V

    return-void

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method

.method public final s()V
    .registers 3

    iget-object v0, p0, Lklk;->m:Ljava/lang/Object;

    check-cast v0, Ldb;

    invoke-virtual {v0}, Ldb;->f()Z

    move-result v1

    if-eqz v1, :cond_12

    invoke-virtual {v0}, Ldb;->d()Z

    move-result v0

    if-nez v0, :cond_12

    const/4 v0, 0x1

    goto :goto_13

    :cond_12
    const/4 v0, 0x0

    :goto_13
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_22

    return-void

    :cond_22
    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
