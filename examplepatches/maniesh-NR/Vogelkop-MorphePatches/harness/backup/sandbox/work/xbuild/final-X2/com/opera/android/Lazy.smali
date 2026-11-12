.class public abstract Lcom/opera/android/Lazy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# static fields
.field public static final c:Lsz5;

.field public static final d:Ljava/lang/Object;


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public volatile b:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lsz5;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lsz5;-><init>(B)V

    sput-object v0, Lcom/opera/android/Lazy;->c:Lsz5;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/opera/android/Lazy;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/opera/android/Lazy;->a:Ljava/util/ArrayList;

    sget-object v0, Lcom/opera/android/Lazy;->d:Ljava/lang/Object;

    iput-object v0, p0, Lcom/opera/android/Lazy;->b:Ljava/lang/Object;

    return-void
.end method

.method public static e(Lcom/opera/android/Lazy;Lumi;)V
    .registers 4

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->c()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    new-instance v0, Lvx;

    const/16 v1, 0x14

    invoke-direct {v0, p0, v1}, Lvx;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p1, v0}, Ltcl;->b(Lesk;)Lnml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method


# virtual methods
.method public a(Lbg1;)V
    .registers 6

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->c()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    invoke-interface {p1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_e
    iget-object v0, p0, Lcom/opera/android/Lazy;->a:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_11
    invoke-virtual {p0}, Lcom/opera/android/Lazy;->c()Z

    move-result v1

    if-eqz v1, :cond_19

    monitor-exit v0

    goto :goto_2c

    :cond_19
    iget-object v1, p0, Lcom/opera/android/Lazy;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_34

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lcom/opera/android/Lazy;->c:Lsz5;

    if-ne v1, v2, :cond_34

    monitor-exit v0
    :try_end_2c
    .catchall {:try_start_11 .. :try_end_2c} :catchall_3d

    :goto_2c
    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    invoke-interface {p1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_34
    :try_start_34
    iget-object p0, p0, Lcom/opera/android/Lazy;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :goto_3b
    monitor-exit v0
    :try_end_3c
    .catchall {:try_start_34 .. :try_end_3c} :catchall_3d

    throw p0

    :catchall_3d
    move-exception p0

    goto :goto_3b
.end method

.method public b(Lbg1;)V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/Lazy;->a:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lcom/opera/android/Lazy;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :goto_a
    monitor-exit v0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_c

    throw p0

    :catchall_c
    move-exception p0

    goto :goto_a
.end method

.method public c()Z
    .registers 2

    iget-object p0, p0, Lcom/opera/android/Lazy;->b:Ljava/lang/Object;

    sget-object v0, Lcom/opera/android/Lazy;->d:Ljava/lang/Object;

    if-eq p0, v0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public abstract d()Ljava/lang/Object;
.end method

.method public final f()Ljava/lang/Object;
    .registers 2

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->c()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_b
    const/4 p0, 0x0

    return-object p0
.end method

.method public g(Ljava/lang/Object;)V
    .registers 2

    return-void
.end method

.method public final get()Ljava/lang/Object;
    .registers 7

    iget-object v0, p0, Lcom/opera/android/Lazy;->b:Ljava/lang/Object;

    sget-object v1, Lcom/opera/android/Lazy;->d:Ljava/lang/Object;

    if-eq v0, v1, :cond_9

    iget-object p0, p0, Lcom/opera/android/Lazy;->b:Ljava/lang/Object;

    return-object p0

    :cond_9
    monitor-enter p0

    :try_start_a
    iget-object v0, p0, Lcom/opera/android/Lazy;->b:Ljava/lang/Object;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_17

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->d()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/Lazy;->b:Ljava/lang/Object;

    const/4 v0, 0x1

    goto :goto_18

    :cond_17
    move v0, v2

    :goto_18
    monitor-exit p0
    :try_end_19
    .catchall {:try_start_a .. :try_end_19} :catchall_52

    if-eqz v0, :cond_4d

    iget-object v0, p0, Lcom/opera/android/Lazy;->b:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lcom/opera/android/Lazy;->g(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/opera/android/Lazy;->a:Ljava/util/ArrayList;

    monitor-enter v1

    :try_start_23
    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/opera/android/Lazy;->a:Ljava/util/ArrayList;

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object v4, p0, Lcom/opera/android/Lazy;->a:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    iget-object v4, p0, Lcom/opera/android/Lazy;->a:Ljava/util/ArrayList;

    sget-object v5, Lcom/opera/android/Lazy;->c:Lsz5;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v1
    :try_end_37
    .catchall {:try_start_23 .. :try_end_37} :catchall_4b

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v1

    :goto_3b
    if-ge v2, v1, :cond_4d

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v2, v2, 0x1

    check-cast v4, Lcom/opera/api/Callback;

    invoke-interface {v4, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_3b

    :goto_49
    :try_start_49
    monitor-exit v1
    :try_end_4a
    .catchall {:try_start_49 .. :try_end_4a} :catchall_4b

    throw p0

    :catchall_4b
    move-exception p0

    goto :goto_49

    :cond_4d
    iget-object p0, p0, Lcom/opera/android/Lazy;->b:Ljava/lang/Object;

    return-object p0

    :goto_50
    :try_start_50
    monitor-exit p0
    :try_end_51
    .catchall {:try_start_50 .. :try_end_51} :catchall_52

    throw v0

    :catchall_52
    move-exception v0

    goto :goto_50
.end method
