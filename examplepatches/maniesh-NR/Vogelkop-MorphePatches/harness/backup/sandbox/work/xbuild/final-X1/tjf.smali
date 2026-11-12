.class public Ltjf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lpz3;


# instance fields
.field public final a:Landroid/view/View;

.field public final b:I

.field public final c:Lx1p;

.field public final d:Lkotlin/jvm/functions/Function1;

.field public final e:Lsjf;

.field public f:Llz3;

.field public g:Z

.field public h:Z

.field public i:Lkjm;


# direct methods
.method public constructor <init>(Landroid/view/View;Lx1p;Lkotlin/jvm/functions/Function1;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltjf;->a:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const/high16 v0, 0x41000000    # 8.0f

    invoke-static {p1, v0}, Lz7h;->h(Landroid/content/Context;F)I

    move-result p1

    iput p1, p0, Ltjf;->b:I

    sget-object p1, Lk11;->a:Lk11;

    iput-object p2, p0, Ltjf;->c:Lx1p;

    iput-object p3, p0, Ltjf;->d:Lkotlin/jvm/functions/Function1;

    new-instance p1, Lsjf;

    invoke-direct {p1, p0}, Lsjf;-><init>(Ltjf;)V

    iput-object p1, p0, Ltjf;->e:Lsjf;

    const/4 p1, 0x1

    iput-boolean p1, p0, Ltjf;->h:Z

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 2

    if-eqz p1, :cond_5

    sget-object p1, Lrjf;->b:Lrjf;

    goto :goto_7

    :cond_5
    sget-object p1, Lrjf;->c:Lrjf;

    :goto_7
    invoke-virtual {p0, p1}, Ltjf;->i(Lrjf;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Ltjf;->g:Z

    iget-object p0, p0, Ltjf;->f:Llz3;

    if-eqz p0, :cond_16

    sget-object p1, Lhjm;->b:Lhjm;

    invoke-virtual {p0, p1}, Llz3;->b(Lhjm;)Z

    :cond_16
    return-void
.end method

.method public b()I
    .registers 1

    iget p0, p0, Ltjf;->b:I

    return p0
.end method

.method public final c(Landroid/view/ViewGroup;)Llz3;
    .registers 3

    new-instance v0, Lqjf;

    invoke-direct {v0, p1, p0}, Lqjf;-><init>(Landroid/view/ViewGroup;Ltjf;)V

    return-object v0
.end method

.method public d()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public e()Lk11;
    .registers 1

    sget-object p0, Lk11;->a:Lk11;

    return-object p0
.end method

.method public f()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final finish(Lhjm;)V
    .registers 3

    iget-object v0, p0, Ltjf;->i:Lkjm;

    if-eqz v0, :cond_7

    invoke-interface {v0, p0, p1}, Lkjm;->o(Ljjm;Lhjm;)V

    :cond_7
    return-void
.end method

.method public g()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public h()J
    .registers 3

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public final i(Lrjf;)V
    .registers 4

    iget-boolean v0, p0, Ltjf;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-virtual {p0}, Ltjf;->d()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_11

    sget-object v0, Lrjf;->d:Lrjf;

    if-ne p1, v0, :cond_11

    const/4 v1, 0x1

    :cond_11
    iput-boolean v1, p0, Ltjf;->h:Z

    iget-object p0, p0, Ltjf;->d:Lkotlin/jvm/functions/Function1;

    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final j(Landroid/view/ViewGroup;)V
    .registers 3

    new-instance v0, Lqjf;

    invoke-direct {v0, p1, p0}, Lqjf;-><init>(Landroid/view/ViewGroup;Ltjf;)V

    invoke-virtual {v0}, Llz3;->f()V

    return-void
.end method

.method public final setRequestDismisser(Lkjm;)V
    .registers 2

    iput-object p1, p0, Ltjf;->i:Lkjm;

    return-void
.end method
