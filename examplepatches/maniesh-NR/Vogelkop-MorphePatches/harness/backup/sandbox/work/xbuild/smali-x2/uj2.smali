.class public final synthetic Luj2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lvj2;

.field public final synthetic c:Lcom/opera/api/Callback;

.field public final synthetic d:[B

.field public final synthetic e:Lcom/opera/api/Callback;


# direct methods
.method public synthetic constructor <init>(Lvj2;Lcom/opera/api/Callback;[BLcom/opera/api/Callback;B)V
    .registers 6

    .line 15
    iput-byte p5, p0, Luj2;->a:B

    iput-object p1, p0, Luj2;->b:Lvj2;

    iput-object p2, p0, Luj2;->c:Lcom/opera/api/Callback;

    iput-object p3, p0, Luj2;->d:[B

    iput-object p4, p0, Luj2;->e:Lcom/opera/api/Callback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lvj2;[BLcom/opera/api/Callback;Lcom/opera/api/Callback;)V
    .registers 6

    const/4 v0, 0x2

    iput-byte v0, p0, Luj2;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Luj2;->b:Lvj2;

    iput-object p2, p0, Luj2;->d:[B

    iput-object p3, p0, Luj2;->c:Lcom/opera/api/Callback;

    iput-object p4, p0, Luj2;->e:Lcom/opera/api/Callback;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 11

    iget-byte v0, p0, Luj2;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_d2

    iget-object v0, p0, Luj2;->b:Lvj2;

    iget-object v1, p0, Luj2;->d:[B

    iget-object v3, p0, Luj2;->c:Lcom/opera/api/Callback;

    iget-object p0, p0, Luj2;->e:Lcom/opera/api/Callback;

    iget-object v4, v0, Lvj2;->d:Lt1;

    invoke-virtual {v4}, Lt1;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lc36;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, Ly26;->b([B)Ly26;

    move-result-object v1

    if-eqz v1, :cond_50

    iget-object v5, v1, Ly26;->b:[B

    array-length v6, v5

    if-lez v6, :cond_50

    const/4 v6, 0x0

    aget-byte v5, v5, v6

    const/16 v6, 0x80

    and-int/2addr v5, v6

    if-ne v5, v6, :cond_50

    iget-object v4, v4, Lc36;->b:Lii;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lz26;

    if-eqz v4, :cond_50

    iget-object v5, v4, Lz26;->b:Ljava/lang/Object;

    monitor-enter v5

    :try_start_3a
    iget-object v4, v4, Lz26;->a:Ljava/security/KeyStore;
    :try_end_3c
    .catchall {:try_start_3a .. :try_end_3c} :catchall_4d

    :try_start_3c
    iget-object v6, v1, Ly26;->a:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/security/KeyStore;->containsAlias(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_49

    iget-object v1, v1, Ly26;->a:Ljava/lang/String;

    invoke-virtual {v4, v1}, Ljava/security/KeyStore;->deleteEntry(Ljava/lang/String;)V
    :try_end_49
    .catch Ljava/security/KeyStoreException; {:try_start_3c .. :try_end_49} :catch_49
    .catchall {:try_start_3c .. :try_end_49} :catchall_4d

    :catch_49
    :cond_49
    :try_start_49
    monitor-exit v5

    goto :goto_50

    :goto_4b
    monitor-exit v5
    :try_end_4c
    .catchall {:try_start_49 .. :try_end_4c} :catchall_4d

    throw p0

    :catchall_4d
    move-exception v0

    move-object p0, v0

    goto :goto_4b

    :cond_50
    :goto_50
    iget-object v0, v0, Lvj2;->c:Ljjn;

    invoke-virtual {v0}, Ljjn;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldjn;

    sget-object v1, Lvml;->a:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v1, Ldz8;

    invoke-direct {v1, v3, v2}, Ldz8;-><init>(Lcom/opera/api/Callback;B)V

    new-instance v3, Ldz8;

    invoke-direct {v3, p0, v2}, Ldz8;-><init>(Lcom/opera/api/Callback;B)V

    invoke-interface {v0, v1, v3}, Ldjn;->a(Lcom/opera/api/Callback;Lcom/opera/api/Callback;)V

    return-void

    :pswitch_68
    iget-object v0, p0, Luj2;->b:Lvj2;

    iget-object v3, p0, Luj2;->c:Lcom/opera/api/Callback;

    iget-object v4, p0, Luj2;->d:[B

    iget-object p0, p0, Luj2;->e:Lcom/opera/api/Callback;

    sget-object v5, Lvml;->a:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v5, Ldz8;

    invoke-direct {v5, v3, v2}, Ldz8;-><init>(Lcom/opera/api/Callback;B)V

    new-instance v3, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v3}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iget-object v6, v0, Lvj2;->d:Lt1;

    invoke-virtual {v6}, Lt1;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lc36;

    invoke-virtual {v6, v4, v3}, Lc36;->c([BLjava/util/concurrent/atomic/AtomicBoolean;)[B

    move-result-object v4

    if-eqz v4, :cond_8f

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v4}, Ljava/lang/String;-><init>([B)V

    :cond_8f
    if-eqz v1, :cond_95

    invoke-virtual {v5, v1}, Ldz8;->run(Ljava/lang/Object;)V

    goto :goto_b8

    :cond_95
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_a1

    sget-object v0, Lfsb;->a:Lfsb;

    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_b8

    :cond_a1
    iget-object v0, v0, Lvj2;->c:Ljjn;

    invoke-virtual {v0}, Ljjn;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldjn;

    new-instance v1, Lab;

    const/16 v3, 0x17

    invoke-direct {v1, v5, v3}, Lab;-><init>(Ljava/lang/Object;B)V

    new-instance v3, Ldz8;

    invoke-direct {v3, p0, v2}, Ldz8;-><init>(Lcom/opera/api/Callback;B)V

    invoke-interface {v0, v1, v3}, Ldjn;->a(Lcom/opera/api/Callback;Lcom/opera/api/Callback;)V

    :goto_b8
    return-void

    :pswitch_b9
    iget-object v5, p0, Luj2;->b:Lvj2;

    iget-object v6, p0, Luj2;->c:Lcom/opera/api/Callback;

    iget-object v7, p0, Luj2;->d:[B

    iget-object v8, p0, Luj2;->e:Lcom/opera/api/Callback;

    iget-object p0, v5, Lvj2;->a:Lumi;

    new-instance v4, Luj2;

    const/4 v9, 0x1

    invoke-direct/range {v4 .. v9}, Luj2;-><init>(Lvj2;Lcom/opera/api/Callback;[BLcom/opera/api/Callback;B)V

    invoke-interface {p0, v4}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    invoke-virtual {p0, v1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void

    nop

    :pswitch_data_d2
    .packed-switch 0x0
        :pswitch_b9
        :pswitch_68
    .end packed-switch
.end method
