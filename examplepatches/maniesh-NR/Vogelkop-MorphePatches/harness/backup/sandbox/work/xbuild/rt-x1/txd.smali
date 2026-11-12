.class public final Ltxd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Luya;
.implements Lbk9;


# instance fields
.field public final a:Ljava/lang/Object;

.field public final b:Lsb4;

.field public c:I

.field public final d:Lkqd;

.field public e:Z

.field public final f:Lrn9;

.field public g:Ltya;

.field public h:Ljava/util/concurrent/Executor;

.field public final i:Landroid/util/LongSparseArray;

.field public final j:Landroid/util/LongSparseArray;

.field public k:I

.field public final l:Ljava/util/ArrayList;

.field public final m:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(IIII)V
    .registers 6

    new-instance v0, Lrn9;

    invoke-static {p1, p2, p3, p4}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object p1

    invoke-direct {v0, p1}, Lrn9;-><init>(Landroid/media/ImageReader;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltxd;->a:Ljava/lang/Object;

    new-instance p1, Lsb4;

    const/4 p2, 0x2

    invoke-direct {p1, p0, p2}, Lsb4;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Ltxd;->b:Lsb4;

    const/4 p1, 0x0

    iput p1, p0, Ltxd;->c:I

    new-instance p2, Lkqd;

    const/4 p3, 0x1

    invoke-direct {p2, p0, p3}, Lkqd;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Ltxd;->d:Lkqd;

    iput-boolean p1, p0, Ltxd;->e:Z

    new-instance p2, Landroid/util/LongSparseArray;

    invoke-direct {p2}, Landroid/util/LongSparseArray;-><init>()V

    iput-object p2, p0, Ltxd;->i:Landroid/util/LongSparseArray;

    new-instance p2, Landroid/util/LongSparseArray;

    invoke-direct {p2}, Landroid/util/LongSparseArray;-><init>()V

    iput-object p2, p0, Ltxd;->j:Landroid/util/LongSparseArray;

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Ltxd;->m:Ljava/util/ArrayList;

    iput-object v0, p0, Ltxd;->f:Lrn9;

    iput p1, p0, Ltxd;->k:I

    new-instance p1, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ltxd;->q()I

    move-result p2

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Ltxd;->l:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final a(Lck9;)V
    .registers 3

    iget-object v0, p0, Ltxd;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    invoke-virtual {p0, p1}, Ltxd;->b(Lck9;)V

    monitor-exit v0

    return-void

    :goto_8
    monitor-exit v0
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_a

    throw p0

    :catchall_a
    move-exception p0

    goto :goto_8
.end method

.method public final b(Lck9;)V
    .registers 5

    iget-object v0, p0, Ltxd;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Ltxd;->l:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    if-ltz v1, :cond_18

    iget-object v2, p0, Ltxd;->l:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    iget v2, p0, Ltxd;->k:I

    if-gt v1, v2, :cond_18

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Ltxd;->k:I

    :cond_18
    iget-object v1, p0, Ltxd;->m:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget p1, p0, Ltxd;->c:I

    if-lez p1, :cond_26

    iget-object p1, p0, Ltxd;->f:Lrn9;

    invoke-virtual {p0, p1}, Ltxd;->d(Luya;)V

    :cond_26
    monitor-exit v0

    return-void

    :goto_28
    monitor-exit v0
    :try_end_29
    .catchall {:try_start_3 .. :try_end_29} :catchall_2a

    throw p0

    :catchall_2a
    move-exception p0

    goto :goto_28
.end method

.method public final c(Ld5j;)V
    .registers 5

    iget-object v0, p0, Ltxd;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Ltxd;->l:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {p0}, Ltxd;->q()I

    move-result v2

    if-ge v1, v2, :cond_1c

    invoke-virtual {p1, p0}, Lck9;->h(Lbk9;)V

    iget-object v1, p0, Ltxd;->l:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Ltxd;->g:Ltya;

    iget-object v1, p0, Ltxd;->h:Ljava/util/concurrent/Executor;

    goto :goto_21

    :cond_1c
    invoke-virtual {p1}, Lck9;->close()V

    const/4 p1, 0x0

    move-object v1, p1

    :goto_21
    monitor-exit v0
    :try_end_22
    .catchall {:try_start_3 .. :try_end_22} :catchall_36

    if-eqz p1, :cond_33

    if-eqz v1, :cond_30

    new-instance v0, Lhpd;

    const/4 v2, 0x5

    invoke-direct {v0, p0, p1, v2}, Lhpd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :cond_30
    invoke-interface {p1, p0}, Ltya;->o(Luya;)V

    :cond_33
    return-void

    :goto_34
    :try_start_34
    monitor-exit v0
    :try_end_35
    .catchall {:try_start_34 .. :try_end_35} :catchall_36

    throw p0

    :catchall_36
    move-exception p0

    goto :goto_34
.end method

.method public final close()V
    .registers 6

    iget-object v0, p0, Ltxd;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-boolean v1, p0, Ltxd;->e:Z

    if-eqz v1, :cond_9

    monitor-exit v0

    return-void

    :cond_9
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Ltxd;->l:Ljava/util/ArrayList;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_15
    if-ge v3, v2, :cond_23

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Lqya;

    invoke-interface {v4}, Ljava/lang/AutoCloseable;->close()V

    goto :goto_15

    :cond_23
    iget-object v1, p0, Ltxd;->l:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    iget-object v1, p0, Ltxd;->f:Lrn9;

    invoke-virtual {v1}, Lrn9;->close()V

    const/4 v1, 0x1

    iput-boolean v1, p0, Ltxd;->e:Z

    monitor-exit v0

    return-void

    :goto_32
    monitor-exit v0
    :try_end_33
    .catchall {:try_start_3 .. :try_end_33} :catchall_34

    throw p0

    :catchall_34
    move-exception p0

    goto :goto_32
.end method

.method public final d(Luya;)V
    .registers 8

    iget-object v0, p0, Ltxd;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-boolean v1, p0, Ltxd;->e:Z

    if-eqz v1, :cond_9

    monitor-exit v0

    return-void

    :cond_9
    iget-object v1, p0, Ltxd;->j:Landroid/util/LongSparseArray;

    invoke-virtual {v1}, Landroid/util/LongSparseArray;->size()I

    move-result v1

    iget-object v2, p0, Ltxd;->l:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/2addr v1, v2

    invoke-interface {p1}, Luya;->q()I

    move-result v2

    if-lt v1, v2, :cond_1e

    monitor-exit v0
    :try_end_1d
    .catchall {:try_start_3 .. :try_end_1d} :catchall_50

    return-void

    :cond_1e
    :try_start_1e
    invoke-interface {p1}, Luya;->y()Lqya;

    move-result-object v2
    :try_end_22
    .catch Ljava/lang/IllegalStateException; {:try_start_1e .. :try_end_22} :catch_3f
    .catchall {:try_start_1e .. :try_end_22} :catchall_3d

    if-eqz v2, :cond_40

    :try_start_24
    iget v3, p0, Ltxd;->c:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Ltxd;->c:I

    add-int/lit8 v1, v1, 0x1

    iget-object v3, p0, Ltxd;->j:Landroid/util/LongSparseArray;

    invoke-interface {v2}, Lqya;->h1()Lsxa;

    move-result-object v4

    invoke-interface {v4}, Lsxa;->e()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5, v2}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    invoke-virtual {p0}, Ltxd;->f()V

    goto :goto_40

    :catchall_3d
    move-exception p0

    throw p0

    :catch_3f
    const/4 v2, 0x0

    :cond_40
    :goto_40
    if-eqz v2, :cond_4c

    iget v2, p0, Ltxd;->c:I

    if-lez v2, :cond_4c

    invoke-interface {p1}, Luya;->q()I

    move-result v2

    if-lt v1, v2, :cond_1e

    :cond_4c
    monitor-exit v0

    return-void

    :goto_4e
    monitor-exit v0
    :try_end_4f
    .catchall {:try_start_24 .. :try_end_4f} :catchall_50

    throw p0

    :catchall_50
    move-exception p0

    goto :goto_4e
.end method

.method public final e()Lqya;
    .registers 7

    iget-object v0, p0, Ltxd;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Ltxd;->l:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_e

    const/4 p0, 0x0

    monitor-exit v0

    return-object p0

    :cond_e
    iget v1, p0, Ltxd;->k:I

    iget-object v2, p0, Ltxd;->l:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_70

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    move v3, v2

    :goto_1f
    iget-object v4, p0, Ltxd;->l:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ge v3, v4, :cond_45

    iget-object v4, p0, Ltxd;->m:Ljava/util/ArrayList;

    iget-object v5, p0, Ltxd;->l:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_42

    iget-object v4, p0, Ltxd;->l:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lqya;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_42
    add-int/lit8 v3, v3, 0x1

    goto :goto_1f

    :cond_45
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    :goto_49
    if-ge v2, v3, :cond_57

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v2, v2, 0x1

    check-cast v4, Lqya;

    invoke-interface {v4}, Ljava/lang/AutoCloseable;->close()V

    goto :goto_49

    :cond_57
    iget-object v1, p0, Ltxd;->l:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v2, v1, -0x1

    iget-object v3, p0, Ltxd;->l:Ljava/util/ArrayList;

    iput v1, p0, Ltxd;->k:I

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqya;

    iget-object p0, p0, Ltxd;->m:Ljava/util/ArrayList;

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v0

    return-object v1

    :cond_70
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v1, "Maximum image number reached."

    invoke-direct {p0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :goto_78
    monitor-exit v0
    :try_end_79
    .catchall {:try_start_3 .. :try_end_79} :catchall_7a

    throw p0

    :catchall_7a
    move-exception p0

    goto :goto_78
.end method

.method public final f()V
    .registers 8

    iget-object v0, p0, Ltxd;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Ltxd;->i:Landroid/util/LongSparseArray;

    invoke-virtual {v1}, Landroid/util/LongSparseArray;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_b
    if-ltz v1, :cond_39

    iget-object v2, p0, Ltxd;->i:Landroid/util/LongSparseArray;

    invoke-virtual {v2, v1}, Landroid/util/LongSparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lsxa;

    invoke-interface {v2}, Lsxa;->e()J

    move-result-wide v3

    iget-object v5, p0, Ltxd;->j:Landroid/util/LongSparseArray;

    invoke-virtual {v5, v3, v4}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lqya;

    if-eqz v5, :cond_36

    iget-object v6, p0, Ltxd;->j:Landroid/util/LongSparseArray;

    invoke-virtual {v6, v3, v4}, Landroid/util/LongSparseArray;->remove(J)V

    iget-object v3, p0, Ltxd;->i:Landroid/util/LongSparseArray;

    invoke-virtual {v3, v1}, Landroid/util/LongSparseArray;->removeAt(I)V

    new-instance v3, Ld5j;

    const/4 v4, 0x0

    invoke-direct {v3, v5, v4, v2}, Ld5j;-><init>(Lqya;Landroid/util/Size;Lsxa;)V

    invoke-virtual {p0, v3}, Ltxd;->c(Ld5j;)V

    :cond_36
    add-int/lit8 v1, v1, -0x1

    goto :goto_b

    :cond_39
    invoke-virtual {p0}, Ltxd;->g()V

    monitor-exit v0

    return-void

    :goto_3e
    monitor-exit v0
    :try_end_3f
    .catchall {:try_start_3 .. :try_end_3f} :catchall_40

    throw p0

    :catchall_40
    move-exception p0

    goto :goto_3e
.end method

.method public final g()V
    .registers 8

    iget-object v0, p0, Ltxd;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Ltxd;->j:Landroid/util/LongSparseArray;

    invoke-virtual {v1}, Landroid/util/LongSparseArray;->size()I

    move-result v1

    if-eqz v1, :cond_7a

    iget-object v1, p0, Ltxd;->i:Landroid/util/LongSparseArray;

    invoke-virtual {v1}, Landroid/util/LongSparseArray;->size()I

    move-result v1

    if-eqz v1, :cond_7a

    iget-object v1, p0, Ltxd;->j:Landroid/util/LongSparseArray;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/util/LongSparseArray;->keyAt(I)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iget-object v5, p0, Ltxd;->i:Landroid/util/LongSparseArray;

    invoke-virtual {v5, v2}, Landroid/util/LongSparseArray;->keyAt(I)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    invoke-static {v1}, Ljpo;->j(Z)V

    cmp-long v1, v5, v3

    if-lez v1, :cond_5c

    iget-object v1, p0, Ltxd;->j:Landroid/util/LongSparseArray;

    invoke-virtual {v1}, Landroid/util/LongSparseArray;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_3d
    if-ltz v1, :cond_78

    iget-object v2, p0, Ltxd;->j:Landroid/util/LongSparseArray;

    invoke-virtual {v2, v1}, Landroid/util/LongSparseArray;->keyAt(I)J

    move-result-wide v2

    cmp-long v2, v2, v5

    if-gez v2, :cond_59

    iget-object v2, p0, Ltxd;->j:Landroid/util/LongSparseArray;

    invoke-virtual {v2, v1}, Landroid/util/LongSparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lqya;

    invoke-interface {v2}, Ljava/lang/AutoCloseable;->close()V

    iget-object v2, p0, Ltxd;->j:Landroid/util/LongSparseArray;

    invoke-virtual {v2, v1}, Landroid/util/LongSparseArray;->removeAt(I)V

    :cond_59
    add-int/lit8 v1, v1, -0x1

    goto :goto_3d

    :cond_5c
    iget-object v1, p0, Ltxd;->i:Landroid/util/LongSparseArray;

    invoke-virtual {v1}, Landroid/util/LongSparseArray;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_64
    if-ltz v1, :cond_78

    iget-object v2, p0, Ltxd;->i:Landroid/util/LongSparseArray;

    invoke-virtual {v2, v1}, Landroid/util/LongSparseArray;->keyAt(I)J

    move-result-wide v5

    cmp-long v2, v5, v3

    if-gez v2, :cond_75

    iget-object v2, p0, Ltxd;->i:Landroid/util/LongSparseArray;

    invoke-virtual {v2, v1}, Landroid/util/LongSparseArray;->removeAt(I)V

    :cond_75
    add-int/lit8 v1, v1, -0x1

    goto :goto_64

    :cond_78
    monitor-exit v0

    return-void

    :cond_7a
    monitor-exit v0

    return-void

    :goto_7c
    monitor-exit v0
    :try_end_7d
    .catchall {:try_start_3 .. :try_end_7d} :catchall_7e

    throw p0

    :catchall_7e
    move-exception p0

    goto :goto_7c
.end method

.method public final getHeight()I
    .registers 2

    iget-object v0, p0, Ltxd;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Ltxd;->f:Lrn9;

    invoke-virtual {p0}, Lrn9;->getHeight()I

    move-result p0

    monitor-exit v0

    return p0

    :goto_b
    monitor-exit v0
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_d

    throw p0

    :catchall_d
    move-exception p0

    goto :goto_b
.end method

.method public final getSurface()Landroid/view/Surface;
    .registers 2

    iget-object v0, p0, Ltxd;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Ltxd;->f:Lrn9;

    invoke-virtual {p0}, Lrn9;->getSurface()Landroid/view/Surface;

    move-result-object p0

    monitor-exit v0

    return-object p0

    :goto_b
    monitor-exit v0
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_d

    throw p0

    :catchall_d
    move-exception p0

    goto :goto_b
.end method

.method public final getWidth()I
    .registers 2

    iget-object v0, p0, Ltxd;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Ltxd;->f:Lrn9;

    invoke-virtual {p0}, Lrn9;->getWidth()I

    move-result p0

    monitor-exit v0

    return p0

    :goto_b
    monitor-exit v0
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_d

    throw p0

    :catchall_d
    move-exception p0

    goto :goto_b
.end method

.method public final i()I
    .registers 2

    iget-object v0, p0, Ltxd;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Ltxd;->f:Lrn9;

    invoke-virtual {p0}, Lrn9;->i()I

    move-result p0

    monitor-exit v0

    return p0

    :goto_b
    monitor-exit v0
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_d

    throw p0

    :catchall_d
    move-exception p0

    goto :goto_b
.end method

.method public final l()V
    .registers 3

    iget-object v0, p0, Ltxd;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Ltxd;->f:Lrn9;

    invoke-virtual {v1}, Lrn9;->l()V

    const/4 v1, 0x0

    iput-object v1, p0, Ltxd;->g:Ltya;

    iput-object v1, p0, Ltxd;->h:Ljava/util/concurrent/Executor;

    const/4 v1, 0x0

    iput v1, p0, Ltxd;->c:I

    monitor-exit v0

    return-void

    :goto_12
    monitor-exit v0
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_14

    throw p0

    :catchall_14
    move-exception p0

    goto :goto_12
.end method

.method public final q()I
    .registers 2

    iget-object v0, p0, Ltxd;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Ltxd;->f:Lrn9;

    invoke-virtual {p0}, Lrn9;->q()I

    move-result p0

    monitor-exit v0

    return p0

    :goto_b
    monitor-exit v0
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_d

    throw p0

    :catchall_d
    move-exception p0

    goto :goto_b
.end method

.method public final w(Ltya;Ljava/util/concurrent/Executor;)V
    .registers 4

    iget-object v0, p0, Ltxd;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Ltxd;->g:Ltya;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p2, p0, Ltxd;->h:Ljava/util/concurrent/Executor;

    iget-object p1, p0, Ltxd;->f:Lrn9;

    iget-object p0, p0, Ltxd;->d:Lkqd;

    invoke-virtual {p1, p0, p2}, Lrn9;->w(Ltya;Ljava/util/concurrent/Executor;)V

    monitor-exit v0

    return-void

    :goto_16
    monitor-exit v0
    :try_end_17
    .catchall {:try_start_3 .. :try_end_17} :catchall_18

    throw p0

    :catchall_18
    move-exception p0

    goto :goto_16
.end method

.method public final y()Lqya;
    .registers 5

    iget-object v0, p0, Ltxd;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Ltxd;->l:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_e

    const/4 p0, 0x0

    monitor-exit v0

    return-object p0

    :cond_e
    iget v1, p0, Ltxd;->k:I

    iget-object v2, p0, Ltxd;->l:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_2d

    iget-object v1, p0, Ltxd;->l:Ljava/util/ArrayList;

    iget v2, p0, Ltxd;->k:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Ltxd;->k:I

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqya;

    iget-object p0, p0, Ltxd;->m:Ljava/util/ArrayList;

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v0

    return-object v1

    :cond_2d
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v1, "Maximum image number reached."

    invoke-direct {p0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :goto_35
    monitor-exit v0
    :try_end_36
    .catchall {:try_start_3 .. :try_end_36} :catchall_37

    throw p0

    :catchall_37
    move-exception p0

    goto :goto_35
.end method
