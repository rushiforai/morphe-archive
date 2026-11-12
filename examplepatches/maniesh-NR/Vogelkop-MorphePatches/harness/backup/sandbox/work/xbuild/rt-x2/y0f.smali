.class public final Ly0f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lfd2;


# instance fields
.field public final a:Lx5f;


# direct methods
.method public synthetic constructor <init>(Lx5f;)V
    .registers 2

    iput-object p1, p0, Ly0f;->a:Lx5f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lmsh;)V
    .registers 7

    iget-object p0, p0, Ly0f;->a:Lx5f;

    iget-object v0, p0, Lx5f;->d:Lzpa;

    iget-boolean v1, p0, Lx5f;->h:Z

    if-eqz v1, :cond_1b

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    invoke-virtual {v1, v0}, Lx56;->E(Lzpa;)Lfi0;

    move-result-object v2

    invoke-virtual {v2, v0}, Lfi0;->z(Lzpa;)Llj0;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljf0;->e(I)V

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    :cond_1b
    iget-object p1, p1, Lmsh;->B:Lnb8;

    if-eqz p1, :cond_3c

    iget-object p1, p1, Lnb8;->i:Ljava/lang/String;

    iget-boolean v1, p0, Lx5f;->h:Z

    if-eqz v1, :cond_3c

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    new-instance v2, Lck0;

    invoke-direct {v2, v0, v1}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance v0, Lj5f;

    sget-object v3, Lod0;->b:Lod0;

    const/4 v4, 0x5

    invoke-direct {v0, p1, v3, v4}, Lj5f;-><init>(Ljava/lang/String;Lod0;I)V

    invoke-virtual {v2, v0}, Lck0;->j(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    :cond_3c
    return-void
.end method

.method public final b(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Landroid/app/NotificationManager;

    :try_start_2
    sget-object p0, Lt0i;->b:Lp0i;

    invoke-virtual {p1}, Landroid/app/NotificationManager;->getNotificationChannels()Ljava/util/List;

    move-result-object p0
    :try_end_8
    .catchall {:try_start_2 .. :try_end_8} :catchall_9

    goto :goto_12

    :catchall_9
    move-exception p0

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Lq0i;

    invoke-direct {p1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object p0, p1

    :goto_12
    instance-of p1, p0, Lq0i;

    if-nez p1, :cond_20

    check-cast p0, Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    :cond_20
    new-instance p1, Lt0i;

    invoke-direct {p1, p0}, Lt0i;-><init>(Ljava/lang/Object;)V

    return-object p1
.end method

.method public final c(Lrs0;)V
    .registers 8

    iget-object p0, p0, Ly0f;->a:Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lx5f;->d:Lzpa;

    new-instance v1, Lqs0;

    const/16 v2, 0x98b

    const/4 v3, -0x1

    const/4 v4, 0x1

    invoke-direct {v1, v2, v3, v4}, Ljf0;-><init>(III)V

    const/4 v2, 0x0

    if-nez p1, :cond_17

    move v3, v2

    goto :goto_18

    :cond_17
    move v3, v4

    :goto_18
    invoke-virtual {v1, v2, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    invoke-virtual {p1, v0}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v0

    const/16 v2, 0x28

    invoke-virtual {v0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_39

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_39

    new-instance v4, Lhf0;

    invoke-direct {v4, v0, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_42

    :cond_39
    invoke-static {v0, v2, v4}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v4, Lhf0;

    invoke-direct {v4, v0, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_42
    invoke-virtual {v4, v1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final onResult(Ljava/lang/Object;)V
    .registers 7

    check-cast p1, Lt0i;

    iget-object p1, p1, Lt0i;->a:Ljava/lang/Object;

    invoke-static {p1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    if-nez v0, :cond_25

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    int-to-long v0, p1

    iget-object p0, p0, Ly0f;->a:Lx5f;

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    invoke-virtual {v2, p1}, Lx56;->N(Lzpa;)Lzs0;

    move-result-object p1

    const/4 v3, 0x6

    const/4 v4, 0x1

    invoke-virtual {p1, v3, v4, v0, v1}, Ljf0;->p(IIJ)V

    invoke-virtual {p0, v2}, Lx5f;->U0(Lx56;)V

    :cond_25
    return-void
.end method
