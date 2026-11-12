.class public final Lsmi;
.super Ltsd;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public final m:Lknl;

.field public final n:Lj3i;


# direct methods
.method public constructor <init>(Lknl;Lj3i;)V
    .registers 4

    iget-object v0, p2, Lj3i;->b:Ljava/lang/Object;

    check-cast v0, Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, v0}, Ltsd;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lsmi;->m:Lknl;

    iput-object p2, p0, Lsmi;->n:Lj3i;

    new-instance p2, Lzu7;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Lzu7;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lknl;->a(Lzu7;)V

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lzu7;

    iget-object p0, p0, Lsmi;->m:Lknl;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, p1}, Lknl;->a(Lzu7;)V

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lzu7;

    iget-object p0, p0, Lsmi;->m:Lknl;

    invoke-virtual {p0, p1}, Lknl;->H(Ljava/lang/Object;)V

    return-void
.end method

.method public final l()V
    .registers 1

    invoke-super {p0}, Ltsd;->l()V

    iget-object p0, p0, Lsmi;->m:Lknl;

    invoke-virtual {p0}, Lknl;->c()V

    return-void
.end method

.method public final m()V
    .registers 1

    invoke-super {p0}, Ltsd;->m()V

    iget-object p0, p0, Lsmi;->m:Lknl;

    invoke-virtual {p0}, Lknl;->b()V

    return-void
.end method
