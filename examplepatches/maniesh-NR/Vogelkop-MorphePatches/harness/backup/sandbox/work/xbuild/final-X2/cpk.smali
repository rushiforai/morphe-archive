.class public final Lcpk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lsq8;


# instance fields
.field public final a:Lepk;

.field public final b:Lzzh;

.field public final c:Lh7f;

.field public final d:Lyzj;

.field public e:Ltq8;

.field public f:Z


# direct methods
.method public constructor <init>(Lepk;Lzzh;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lyzj;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lyzj;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lcpk;->d:Lyzj;

    iput-object p1, p0, Lcpk;->a:Lepk;

    iput-object p2, p0, Lcpk;->b:Lzzh;

    new-instance p1, Lh7f;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcpk;->c:Lh7f;

    new-instance p1, Lzzh;

    const/16 v0, 0xe

    invoke-direct {p1, p0, v0}, Lzzh;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1}, Lzzh;->run(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final B(ILhq8;)V
    .registers 3

    invoke-virtual {p2}, Lhq8;->j()Z

    move-result p1

    if-eqz p1, :cond_7

    return-void

    :cond_7
    invoke-virtual {p0}, Lcpk;->a()V

    return-void
.end method

.method public final a()V
    .registers 2

    iget-object p0, p0, Lcpk;->c:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_6
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public final u(ILhq8;)V
    .registers 3

    return-void
.end method

.method public final w(Lhq8;)V
    .registers 3

    invoke-virtual {p1}, Lhq8;->j()Z

    move-result v0

    if-eqz v0, :cond_c

    check-cast p1, Ltq8;

    invoke-virtual {p1, p0}, Ltq8;->t(Lsq8;)V

    return-void

    :cond_c
    invoke-virtual {p0}, Lcpk;->a()V

    invoke-virtual {p1}, Lhq8;->g()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1e

    iget-object p0, p0, Lcpk;->d:Lyzj;

    invoke-virtual {p1, p0}, Lhq8;->b(Lgq8;)V

    :cond_1e
    return-void
.end method
