.class public final Lcom/opera/android/sync/NativeSyncManager;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a()Lzwk;
    .registers 2

    sget-object v0, Lt8;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->N()Lzwk;

    move-result-object v0

    return-object v0
.end method

.method public static addToSet(Ljava/util/Set;ILjava/lang/String;)V
    .registers 4
    .param p0    # Ljava/util/Set;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lne6;",
            ">;I",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    new-instance v0, Lne6;

    invoke-direct {v0, p1, p2}, Lne6;-><init>(ILjava/lang/String;)V

    invoke-interface {p0, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static dataTypeConfigurationChanged()V
    .registers 3

    invoke-static {}, Lcom/opera/android/sync/NativeSyncManager;->a()Lzwk;

    move-result-object v0

    iget-object v0, v0, Lzwk;->a:Lh7f;

    new-instance v1, Lg7f;

    invoke-direct {v1, v0}, Lg7f;-><init>(Lh7f;)V

    :goto_b
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1c

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lywk;

    const/4 v2, 0x1

    invoke-interface {v0, v2}, Lywk;->e(Z)V

    goto :goto_b

    :cond_1c
    return-void
.end method

.method public static onIsReady()V
    .registers 2

    invoke-static {}, Lcom/opera/android/sync/NativeSyncManager;->a()Lzwk;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lzwk;->b:Z

    iget-object v0, v0, Lzwk;->a:Lh7f;

    new-instance v1, Lg7f;

    invoke-direct {v1, v0}, Lg7f;-><init>(Lh7f;)V

    :goto_e
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1e

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lywk;

    invoke-interface {v0}, Lywk;->B()V

    goto :goto_e

    :cond_1e
    return-void
.end method

.method public static statusChanged(I)V
    .registers 3

    invoke-static {}, Lcom/opera/android/sync/NativeSyncManager;->a()Lzwk;

    move-result-object v0

    const/4 v1, 0x6

    if-ne p0, v1, :cond_11

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzwk;->i()Z

    move-result v1

    if-nez v1, :cond_11

    const/4 p0, 0x2

    :cond_11
    iget-object v0, v0, Lzwk;->a:Lh7f;

    new-instance v1, Lg7f;

    invoke-direct {v1, v0}, Lg7f;-><init>(Lh7f;)V

    :goto_18
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_28

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lywk;

    invoke-interface {v0, p0}, Lywk;->G(I)V

    goto :goto_18

    :cond_28
    return-void
.end method

.method public static syncCycleCompleted()V
    .registers 2

    invoke-static {}, Lcom/opera/android/sync/NativeSyncManager;->a()Lzwk;

    move-result-object v0

    iget-object v0, v0, Lzwk;->a:Lh7f;

    new-instance v1, Lg7f;

    invoke-direct {v1, v0}, Lg7f;-><init>(Lh7f;)V

    :goto_b
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1b

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lywk;

    invoke-interface {v0}, Lywk;->c0()V

    goto :goto_b

    :cond_1b
    return-void
.end method
