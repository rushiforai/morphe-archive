.class public final Lve3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldf3;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Laf3;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Lve3;->a:B

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lve3;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lve3;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lve3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lve3;->b:Ljava/lang/Object;

    return-void
.end method

.method private final c()V
    .registers 1

    return-void
.end method


# virtual methods
.method public final a(Lmf3;)V
    .registers 5

    iget-byte v0, p0, Lve3;->a:B

    packed-switch v0, :pswitch_data_56

    iget-object p0, p0, Lve3;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldf3;

    if-eqz p0, :cond_14

    invoke-interface {p0, p1}, Ldf3;->a(Lmf3;)V

    :cond_14
    return-void

    :pswitch_15
    iget-object v0, p0, Lve3;->b:Ljava/lang/Object;

    check-cast v0, Laf3;

    iget-object v0, v0, Laf3;->f:Ljava/lang/Object;

    monitor-enter v0

    :try_start_1c
    iget-object v1, p0, Lve3;->b:Ljava/lang/Object;

    check-cast v1, Laf3;

    iget-object v1, v1, Laf3;->c:Lcf3;

    iget p1, p1, Lmf3;->a:I

    if-eqz p1, :cond_29

    invoke-virtual {p0}, Lve3;->d()V

    :cond_29
    new-instance p1, Ljava/util/ArrayList;

    iget-object v2, p0, Lve3;->b:Ljava/lang/Object;

    check-cast v2, Laf3;

    iget-object v2, v2, Laf3;->d:Ljava/util/ArrayList;

    invoke-direct {p1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object p0, p0, Lve3;->b:Ljava/lang/Object;

    check-cast p0, Laf3;

    iget-object p0, p0, Laf3;->d:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    monitor-exit v0
    :try_end_3e
    .catchall {:try_start_1c .. :try_end_3e} :catchall_54

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p0

    const/4 v0, 0x0

    :goto_43
    if-ge v0, p0, :cond_51

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v0, v0, 0x1

    check-cast v2, Lbg1;

    invoke-interface {v2, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_43

    :cond_51
    return-void

    :goto_52
    :try_start_52
    monitor-exit v0
    :try_end_53
    .catchall {:try_start_52 .. :try_end_53} :catchall_54

    throw p0

    :catchall_54
    move-exception p0

    goto :goto_52

    :pswitch_data_56
    .packed-switch 0x0
        :pswitch_15
    .end packed-switch
.end method

.method public final b()V
    .registers 2

    iget-byte v0, p0, Lve3;->a:B

    packed-switch v0, :pswitch_data_16

    iget-object p0, p0, Lve3;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldf3;

    if-eqz p0, :cond_14

    invoke-interface {p0}, Ldf3;->b()V

    :cond_14
    :pswitch_14
    return-void

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method

.method public final d()V
    .registers 3

    iget-object v0, p0, Lve3;->b:Ljava/lang/Object;

    check-cast v0, Laf3;

    iget-object v0, v0, Laf3;->f:Ljava/lang/Object;

    monitor-enter v0

    :try_start_7
    iget-object v1, p0, Lve3;->b:Ljava/lang/Object;

    check-cast v1, Laf3;

    invoke-static {v1}, Laf3;->a(Laf3;)Ldf3;

    move-result-object v1

    if-nez v1, :cond_13

    monitor-exit v0

    return-void

    :cond_13
    iget-object v1, p0, Lve3;->b:Ljava/lang/Object;

    check-cast v1, Laf3;

    invoke-static {v1}, Laf3;->b(Laf3;)V

    iget-object v1, p0, Lve3;->b:Ljava/lang/Object;

    check-cast v1, Laf3;

    iget-object v1, v1, Laf3;->c:Lcf3;

    invoke-virtual {v1}, Lcf3;->a()V

    iget-object p0, p0, Lve3;->b:Ljava/lang/Object;

    check-cast p0, Laf3;

    invoke-virtual {p0}, Laf3;->c()Lcf3;

    move-result-object v1

    iput-object v1, p0, Laf3;->c:Lcf3;

    monitor-exit v0

    return-void

    :goto_2f
    monitor-exit v0
    :try_end_30
    .catchall {:try_start_7 .. :try_end_30} :catchall_31

    throw p0

    :catchall_31
    move-exception p0

    goto :goto_2f
.end method
