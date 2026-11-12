.class public final Lbr8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lgq8;
.implements Lxr8;


# instance fields
.field public final a:Lhq8;

.field public final b:Lyr8;

.field public c:I

.field public final synthetic d:Lcr8;


# direct methods
.method public constructor <init>(Lcr8;Lhq8;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbr8;->d:Lcr8;

    iput-object p2, p0, Lbr8;->a:Lhq8;

    new-instance v0, Lyr8;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v3, p1, Lfr8;->a:Lgjf;

    iget v4, p1, Lfr8;->b:I

    iget-object v5, p1, Lcr8;->w:Lzzj;

    move-object v2, p0

    invoke-direct/range {v0 .. v5}, Lyr8;-><init>(Landroid/content/Context;Lxr8;Lgjf;ILzzj;)V

    iput-object v0, v2, Lbr8;->b:Lyr8;

    iput-object p2, v0, Lyr8;->f:Lhq8;

    const/4 p0, 0x0

    iput p0, v0, Lyr8;->j:I

    invoke-virtual {v0}, Lyr8;->e()V

    const/4 p0, 0x0

    iput-object p0, v0, Lyr8;->k:Ljava/lang/String;

    iput-object p0, v0, Lyr8;->l:Lvmj;

    iget p0, p1, Lfr8;->f:I

    if-nez p0, :cond_38

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const p1, 0x7f04047f

    const v0, 0x7f06063b

    invoke-static {p1, p0, v0}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    :cond_38
    iput p0, v2, Lbr8;->c:I

    invoke-virtual {p2, v2}, Lhq8;->b(Lgq8;)V

    return-void
.end method


# virtual methods
.method public final Q(Lhq8;)V
    .registers 2

    return-void
.end method

.method public final c()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final h()V
    .registers 1

    return-void
.end method

.method public final i()I
    .registers 1

    iget p0, p0, Lbr8;->c:I

    return p0
.end method

.method public final invalidate()V
    .registers 1

    iget-object p0, p0, Lbr8;->d:Lcr8;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final k(Ljava/lang/String;)Lvmj;
    .registers 9

    iget-object p0, p0, Lbr8;->d:Lcr8;

    iget v3, p0, Lfr8;->c:I

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v5, Lna5;->b:Lna5;

    sget p0, Lvmj;->g:I

    sget-object v2, Lumj;->b:Lumj;

    const/4 v6, 0x1

    move v4, v3

    move-object v1, p1

    invoke-static/range {v0 .. v6}, Ltmj;->l(Landroid/content/Context;Ljava/lang/String;Lumj;IILna5;Z)Lvmj;

    move-result-object p0

    return-object p0
.end method

.method public final l()V
    .registers 1

    return-void
.end method

.method public final p()Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Lbr8;->a:Lhq8;

    sget-object v0, Lp6l;->a:Lp6l;

    invoke-virtual {p0, v0}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final r(ILhq8;)V
    .registers 3

    const/4 p2, 0x7

    if-eq p1, p2, :cond_7

    const/4 p2, 0x5

    if-eq p1, p2, :cond_7

    return-void

    :cond_7
    const/4 p1, 0x1

    iget-object p0, p0, Lbr8;->b:Lyr8;

    invoke-virtual {p0, p1}, Lyr8;->f(Z)V

    return-void
.end method

.method public final s()I
    .registers 1

    iget-object p0, p0, Lbr8;->d:Lcr8;

    iget p0, p0, Lfr8;->c:I

    return p0
.end method

.method public final v()I
    .registers 1

    iget-object p0, p0, Lbr8;->d:Lcr8;

    iget p0, p0, Lfr8;->c:I

    return p0
.end method
