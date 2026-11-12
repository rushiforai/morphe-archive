.class public abstract Lcej;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Loim;


# instance fields
.field private mFinished:Z

.field private mRequestDismisser:Lkjm;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# virtual methods
.method public final create(Landroid/content/Context;Lb2l;)Ldej;
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lb2l;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    invoke-virtual {p0, p1}, Lcej;->createSheetHost(Landroid/content/Context;)Lmej;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lcej;->createSheet(Lmej;Lb2l;)Ldej;

    move-result-object p1

    new-instance p2, Lof;

    const/4 v0, 0x3

    invoke-direct {p2, p0, v0}, Lof;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p1, Ldej;->a:Li7f;

    invoke-virtual {p0, p2}, Li7f;->b(Ljava/lang/Object;)Z

    return-object p1
.end method

.method public createSheet(Lmej;Lb2l;)Ldej;
    .registers 4

    new-instance p0, Le8g;

    invoke-interface {p1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p2

    const v0, 0x7f1413a7

    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lyrf;-><init>(Lmej;Ljava/lang/String;Z)V

    return-object p0
.end method

.method public createSheetHost(Landroid/content/Context;)Lmej;
    .registers 2

    new-instance p0, Lvq3;

    invoke-direct {p0, p1}, Lvq3;-><init>(Landroid/content/Context;)V

    return-object p0
.end method

.method public final finish(Lhjm;)V
    .registers 3
    .param p1    # Lhjm;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-boolean v0, p0, Lcej;->mFinished:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcej;->mFinished:Z

    invoke-virtual {p0, p1}, Lcej;->onFinished(Lhjm;)V

    iget-object v0, p0, Lcej;->mRequestDismisser:Lkjm;

    invoke-interface {v0, p0, p1}, Lkjm;->o(Ljjm;Lhjm;)V

    return-void
.end method

.method public isAllowed(Lb2l;)Z
    .registers 2

    const/4 p0, 0x1

    return p0
.end method

.method public isFinished()Z
    .registers 1

    iget-boolean p0, p0, Lcej;->mFinished:Z

    return p0
.end method

.method public onFinished(Lhjm;)V
    .registers 2
    .param p1    # Lhjm;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public final setRequestDismisser(Lkjm;)V
    .registers 2
    .param p1    # Lkjm;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iput-object p1, p0, Lcej;->mRequestDismisser:Lkjm;

    return-void
.end method
