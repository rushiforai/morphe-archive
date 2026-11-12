.class public Ltsd;
.super Lpde;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final l:Lh42;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3

    invoke-direct {p0, p1}, Lekc;-><init>(Ljava/lang/Object;)V

    new-instance v0, Lh42;

    invoke-direct {v0}, Lh42;-><init>()V

    iput-object v0, p0, Ltsd;->l:Lh42;

    invoke-virtual {v0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 2

    invoke-super {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public l()V
    .registers 2

    iget-object v0, p0, Ltsd;->l:Lh42;

    invoke-virtual {v0, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method

.method public m()V
    .registers 2

    iget-object v0, p0, Ltsd;->l:Lh42;

    invoke-virtual {v0, p0}, Lekc;->p(Lf7f;)V

    return-void
.end method

.method public final n(Ljava/lang/Object;)V
    .registers 2

    const/4 p0, 0x0

    throw p0
.end method

.method public final r(Ljava/lang/Object;)V
    .registers 3

    iget-object v0, p0, Ltsd;->l:Lh42;

    invoke-virtual {v0, p1}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lekc;->h()Z

    move-result v0

    if-nez v0, :cond_e

    invoke-super {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    :cond_e
    return-void
.end method

.method public s(Lekc;Lf7f;)V
    .registers 3

    iget-object p0, p0, Ltsd;->l:Lh42;

    invoke-virtual {p0, p1, p2}, Lh42;->s(Lekc;Lf7f;)V

    return-void
.end method
