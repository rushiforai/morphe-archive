.class public final Lolk;
.super Lize;
.source "SourceFile"


# instance fields
.field public final l:Lydn;

.field public final m:Lnlk;


# direct methods
.method public constructor <init>(Lydn;)V
    .registers 5

    new-instance v0, Lmlk;

    iget-object v1, p1, Lydn;->d:Lvdn;

    iget-boolean v1, v1, Lvdn;->a:Z

    iget-object v2, p1, Lydn;->c:Lgfn;

    invoke-interface {v2}, Lgfn;->isEnabled()Z

    move-result v2

    invoke-direct {v0, v1, v2}, Lmlk;-><init>(ZZ)V

    invoke-direct {p0, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    new-instance v0, Lnlk;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lnlk;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lolk;->m:Lnlk;

    iput-object p1, p0, Lolk;->l:Lydn;

    return-void
.end method


# virtual methods
.method public final l()V
    .registers 2

    invoke-virtual {p0}, Lolk;->s()V

    iget-object v0, p0, Lolk;->l:Lydn;

    iget-object p0, p0, Lolk;->m:Lnlk;

    invoke-virtual {v0, p0}, Lydn;->b(Ltdn;)V

    return-void
.end method

.method public final m()V
    .registers 2

    iget-object v0, p0, Lolk;->l:Lydn;

    iget-object p0, p0, Lolk;->m:Lnlk;

    invoke-virtual {v0, p0}, Lydn;->A(Ltdn;)V

    return-void
.end method

.method public final s()V
    .registers 4

    new-instance v0, Lmlk;

    iget-object v1, p0, Lolk;->l:Lydn;

    iget-object v2, v1, Lydn;->d:Lvdn;

    iget-boolean v2, v2, Lvdn;->a:Z

    iget-object v1, v1, Lydn;->c:Lgfn;

    invoke-interface {v1}, Lgfn;->isEnabled()Z

    move-result v1

    invoke-direct {v0, v2, v1}, Lmlk;-><init>(ZZ)V

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lmlk;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1c

    return-void

    :cond_1c
    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
