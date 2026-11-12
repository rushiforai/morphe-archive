.class public final Lcom/opera/android/permissions/PermissionBridge;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/opera/android/permissions/PermissionBridge$PermissionCallback;
    }
.end annotation


# direct methods
.method public static getPermissionStatus(ZILjava/lang/String;Ljava/lang/String;Z)I
    .registers 8
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Ls9g;->h:Ls9g;

    invoke-static {p1}, Llag;->d(I)Llag;

    move-result-object p1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Llag;->a:Llag;

    sget-object v2, Lkag;->c:Lkag;

    if-eq p1, v1, :cond_22

    invoke-static {p1, p2, p3, p4}, Ls9g;->k(Llag;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p4

    if-eqz p4, :cond_22

    sget-object p4, Llag;->b:Llag;

    if-eq p1, p4, :cond_1e

    sget-object p4, Llag;->h:Llag;

    if-eq p1, p4, :cond_1e

    move-object p2, p3

    :cond_1e
    invoke-virtual {v0, p1, p2, p0}, Ls9g;->h(Llag;Ljava/lang/String;Z)Lkag;

    move-result-object v2

    :cond_22
    iget-byte p0, v2, Lkag;->a:B

    return p0
.end method

.method public static requestPermissions(ZLcom/opera/android/browser/chromium/ChromiumContent;[ILjava/lang/String;Ljava/lang/String;ZLcom/opera/android/permissions/PermissionBridge$PermissionCallback;)I
    .registers 18
    .param p1    # Lcom/opera/android/browser/chromium/ChromiumContent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # [I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p6    # Lcom/opera/android/permissions/PermissionBridge$PermissionCallback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    array-length v0, p2

    new-array v4, v0, [Llag;

    const/4 v1, 0x0

    move v2, v1

    :goto_5
    array-length v3, p2

    if-ge v2, v3, :cond_13

    aget v3, p2, v2

    invoke-static {v3}, Llag;->d(I)Llag;

    move-result-object v3

    aput-object v3, v4, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_13
    sget-object p2, Ls9g;->h:Ls9g;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-array v5, v0, [Lcag;

    move v2, v1

    :goto_1b
    const/4 v3, 0x1

    if-ge v1, v0, :cond_56

    aget-object v7, v4, v1

    sget-object v8, Llag;->a:Llag;

    sget-object v9, Lkag;->c:Lkag;

    if-ne v7, v8, :cond_2f

    new-instance v3, Lcag;

    const/4 v7, 0x0

    invoke-direct {v3, v9, v7}, Lcag;-><init>(Lkag;Ldag;)V

    aput-object v3, v5, v1

    goto :goto_53

    :cond_2f
    move/from16 v10, p5

    invoke-static {v7, p3, p4, v10}, Ls9g;->k(Llag;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v7

    if-nez v7, :cond_40

    aget-object v3, v4, v1

    invoke-static {v3, v9}, Lf03;->l(Llag;Lkag;)Lcag;

    move-result-object v3

    aput-object v3, v5, v1

    goto :goto_53

    :cond_40
    aget-object v7, v4, v1

    invoke-virtual {p2, v7, p3, p0}, Ls9g;->h(Llag;Ljava/lang/String;Z)Lkag;

    move-result-object v7

    sget-object v9, Lkag;->d:Lkag;

    if-ne v7, v9, :cond_4b

    move v2, v3

    :cond_4b
    aget-object v3, v4, v1

    invoke-static {v3, v7}, Lf03;->l(Llag;Lkag;)Lcag;

    move-result-object v3

    aput-object v3, v5, v1

    :goto_53
    add-int/lit8 v1, v1, 0x1

    goto :goto_1b

    :cond_56
    move-object/from16 v9, p6

    if-nez v2, :cond_5f

    invoke-virtual {v9, v5}, Lcom/opera/android/permissions/PermissionBridge$PermissionCallback;->run(Ljava/lang/Object;)V

    const/4 p0, -0x1

    return p0

    :cond_5f
    new-instance v1, Lnrl;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-boolean p0, v1, Lnrl;->a:Z

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p2, v1, Lnrl;->b:Ljava/lang/Object;

    move v0, v3

    sget v3, Ls9g;->i:I

    add-int/lit8 v2, v3, 0x1

    sput v2, Ls9g;->i:I

    move v2, v0

    new-instance v0, Ljb;

    xor-int/2addr p0, v2

    move v8, p0

    move-object v2, p1

    move-object v6, p3

    move-object v7, p4

    invoke-direct/range {v0 .. v9}, Ljb;-><init>(Lnrl;Lcom/opera/android/browser/chromium/ChromiumContent;I[Llag;[Lcag;Ljava/lang/String;Ljava/lang/String;ZLcom/opera/android/permissions/PermissionBridge$PermissionCallback;)V

    iget-object p0, p2, Ls9g;->g:Ljava/util/HashMap;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Ljb;->f()V

    return v3
.end method

.method public static resetPermission(ZILjava/lang/String;)V
    .registers 4
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Ls9g;->h:Ls9g;

    invoke-static {p1}, Llag;->d(I)Llag;

    move-result-object p1

    invoke-virtual {v0, p1, p2, p0}, Ls9g;->b(Llag;Ljava/lang/String;Z)V

    return-void
.end method

.method public static subscribePermissionStatusChange(ZILjava/lang/String;Lcom/opera/android/permissions/PermissionBridge$PermissionCallback;)I
    .registers 8
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/opera/android/permissions/PermissionBridge$PermissionCallback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Ls9g;->h:Ls9g;

    invoke-static {p1}, Llag;->d(I)Llag;

    move-result-object p1

    sget-object v1, Lvml;->d:Lumi;

    new-instance v2, Lb94;

    const/4 v3, 0x0

    invoke-direct {v2, v1, p3, v3}, Lb94;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object p3, Llag;->a:Llag;

    if-ne p1, p3, :cond_16

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return v3

    :cond_16
    invoke-virtual {v0, p0}, Ls9g;->j(Z)Lvzk;

    move-result-object p0

    new-instance p3, Lb94;

    const/4 v0, 0x3

    invoke-direct {p3, p1, v2, v0}, Lb94;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_23
    iget-object p0, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast p0, Ly9g;

    new-instance v1, Lx9g;

    new-instance v2, Lw9g;

    invoke-direct {v2, p2, p1}, Lw9g;-><init>(Ljava/lang/String;Llag;)V

    invoke-direct {v1, v2, p3}, Lx9g;-><init>(Lw9g;Lb94;)V

    sget-object p1, Ly9g;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result p1

    iget-object p2, p0, Ly9g;->a:Landroid/util/SparseArray;

    invoke-virtual {p2, p1, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    iget-object p0, p0, Ly9g;->b:Lnce;

    invoke-virtual {p0, v2, v1}, Lnce;->u(Ljava/lang/Object;Ljava/lang/Object;)Z

    monitor-exit v0

    return p1

    :goto_43
    monitor-exit v0
    :try_end_44
    .catchall {:try_start_23 .. :try_end_44} :catchall_45

    throw p0

    :catchall_45
    move-exception p0

    goto :goto_43
.end method

.method public static unsubscribePermissionStatusChange(ZI)V
    .registers 6

    sget-object v0, Ls9g;->h:Ls9g;

    invoke-virtual {v0, p0}, Ls9g;->j(Z)Lvzk;

    move-result-object p0

    iget-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_9
    iget-object p0, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast p0, Ly9g;

    iget-object v1, p0, Ly9g;->a:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lx9g;

    if-eqz v2, :cond_46

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->remove(I)V

    iget-object p0, p0, Ly9g;->b:Lnce;

    iget-object p1, v2, Lx9g;->a:Lw9g;

    iget-object v1, p0, Lnce;->e:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Collection;

    if-nez p1, :cond_2b

    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto :goto_44

    :cond_2b
    invoke-virtual {p0}, Lnce;->s()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    iget v2, p0, Lnce;->f:I

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v3

    sub-int/2addr v2, v3

    iput v2, p0, Lnce;->f:I

    invoke-interface {p1}, Ljava/util/Collection;->clear()V

    check-cast v1, Ljava/util/List;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    :goto_44
    check-cast p0, Ljava/util/List;

    :cond_46
    monitor-exit v0

    return-void

    :goto_48
    monitor-exit v0
    :try_end_49
    .catchall {:try_start_9 .. :try_end_49} :catchall_4a

    throw p0

    :catchall_4a
    move-exception p0

    goto :goto_48
.end method
