.class public final Laf3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;


# instance fields
.field public final a:Lhjf;

.field public final b:Lumi;

.field public c:Lcf3;

.field public final d:Ljava/util/ArrayList;

.field public final e:Ljava/util/ArrayList;

.field public final f:Ljava/lang/Object;

.field private g:Ldf3;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation
.end field

.field public h:Z

.field private final i:Lfbh;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lhjf;Lumi;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Laf3;->d:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Laf3;->e:Ljava/util/ArrayList;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Laf3;->f:Ljava/lang/Object;

    new-instance v0, Lte3;

    invoke-direct {v0, p0}, Lte3;-><init>(Laf3;)V

    iput-object v0, p0, Laf3;->i:Lfbh;

    iput-object p1, p0, Laf3;->a:Lhjf;

    iput-object p2, p0, Laf3;->b:Lumi;

    invoke-virtual {p0}, Laf3;->c()Lcf3;

    move-result-object p2

    iput-object p2, p0, Laf3;->c:Lcf3;

    invoke-virtual {p1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object p2

    invoke-virtual {p2, p0}, Ltcc;->a(Lmdc;)V

    invoke-virtual {p1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object p1

    check-cast p1, Lqdc;

    iget-object p1, p1, Lqdc;->i:Lqcc;

    sget-object p2, Lqcc;->d:Lqcc;

    invoke-virtual {p1, p2}, Lqcc;->d(Lqcc;)Z

    move-result p1

    iput-boolean p1, p0, Laf3;->h:Z

    return-void
.end method

.method public static bridge synthetic a(Laf3;)Ldf3;
    .registers 1

    iget-object p0, p0, Laf3;->g:Ldf3;

    return-object p0
.end method

.method public static bridge synthetic b(Laf3;)V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Laf3;->g:Ldf3;

    return-void
.end method


# virtual methods
.method public final c()Lcf3;
    .registers 5

    iget-object v0, p0, Laf3;->a:Lhjf;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Lbf3;

    invoke-direct {v1, v0}, Lbf3;-><init>(Landroid/content/Context;)V

    new-instance v2, Lhr5;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, v1, Lbf3;->a:Lhr5;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lbf3;->d:Z

    new-instance v2, Lye3;

    iget-object p0, p0, Laf3;->i:Lfbh;

    invoke-direct {v2, p0}, Lye3;-><init>(Lfbh;)V

    iput-object v2, v1, Lbf3;->c:Lye3;

    const/4 p0, 0x0

    if-eqz v0, :cond_66

    iget-object v2, v1, Lbf3;->c:Lye3;

    if-eqz v2, :cond_60

    iget-object v2, v1, Lbf3;->a:Lhr5;

    if-eqz v2, :cond_5a

    iget-object p0, v1, Lbf3;->a:Lhr5;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, v1, Lbf3;->c:Lye3;

    iget-object v2, v1, Lbf3;->a:Lhr5;

    if-eqz p0, :cond_48

    iget-object p0, v1, Lbf3;->c:Lye3;

    invoke-virtual {v1}, Lbf3;->a()Z

    move-result v3

    if-eqz v3, :cond_42

    new-instance v3, Lmrp;

    invoke-direct {v3, v2, v0, p0, v1}, Lmrp;-><init>(Lhr5;Landroid/content/Context;Lye3;Lbf3;)V

    return-object v3

    :cond_42
    new-instance v3, Lcf3;

    invoke-direct {v3, v2, v0, p0, v1}, Lcf3;-><init>(Lhr5;Landroid/content/Context;Lye3;Lbf3;)V

    return-object v3

    :cond_48
    invoke-virtual {v1}, Lbf3;->a()Z

    move-result p0

    if-eqz p0, :cond_54

    new-instance p0, Lmrp;

    invoke-direct {p0, v2, v0, v1}, Lmrp;-><init>(Lhr5;Landroid/content/Context;Lbf3;)V

    return-object p0

    :cond_54
    new-instance p0, Lcf3;

    invoke-direct {p0, v2, v0, v1}, Lcf3;-><init>(Lhr5;Landroid/content/Context;Lbf3;)V

    return-object p0

    :cond_5a
    const-string v0, "Pending purchases for one-time products must be supported."

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    return-object p0

    :cond_60
    const-string v0, "Please provide a valid listener for purchases updates."

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    return-object p0

    :cond_66
    const-string v0, "Please provide a valid Context."

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    return-object p0
.end method

.method public final d(Lcom/opera/api/Callback;)V
    .registers 6

    iget-boolean v0, p0, Laf3;->h:Z

    if-nez v0, :cond_14

    new-instance p0, Lyah;

    new-instance v0, Lzah;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sget-object v1, Lcbh;->b:Lcbh;

    invoke-direct {p0, v0, v1}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {p1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_14
    new-instance v0, Ldz8;

    new-instance v1, Lb94;

    iget-object v2, p0, Laf3;->b:Lumi;

    const/4 v3, 0x0

    invoke-direct {v1, v2, p1, v3}, Lb94;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v0, v1, v3}, Ldz8;-><init>(Lcom/opera/api/Callback;B)V

    invoke-virtual {p0, v0}, Laf3;->e(Lbg1;)V

    return-void
.end method

.method public final e(Lbg1;)V
    .registers 5

    iget-object v0, p0, Laf3;->f:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Laf3;->c:Lcf3;

    iget-boolean v2, v1, Lcf3;->z:Z

    if-eqz v2, :cond_b

    const/4 v1, 0x1

    goto :goto_f

    :cond_b
    invoke-virtual {v1}, Lcf3;->v()Z

    move-result v1

    :goto_f
    if-eqz v1, :cond_14

    iget-object v1, p0, Laf3;->c:Lcf3;

    goto :goto_15

    :cond_14
    const/4 v1, 0x0

    :goto_15
    monitor-exit v0
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_43

    if-eqz v1, :cond_1c

    invoke-interface {p1, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_1c
    iget-object v1, p0, Laf3;->f:Ljava/lang/Object;

    monitor-enter v1

    :try_start_1f
    iget-object v0, p0, Laf3;->d:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Laf3;->g:Ldf3;

    if-eqz p1, :cond_2a

    monitor-exit v1

    return-void

    :cond_2a
    new-instance p1, Lve3;

    invoke-direct {p1, p0}, Lve3;-><init>(Laf3;)V

    iput-object p1, p0, Laf3;->g:Ldf3;

    iget-object p0, p0, Laf3;->c:Lcf3;

    new-instance v0, Lve3;

    invoke-direct {v0, p1}, Lve3;-><init>(Lve3;)V

    invoke-virtual {p0, v0}, Lcf3;->d(Lve3;)V

    monitor-exit v1

    return-void

    :goto_3d
    monitor-exit v1
    :try_end_3e
    .catchall {:try_start_1f .. :try_end_3e} :catchall_3f

    throw p0

    :catchall_3f
    move-exception p0

    goto :goto_3d

    :goto_41
    :try_start_41
    monitor-exit v0
    :try_end_42
    .catchall {:try_start_41 .. :try_end_42} :catchall_43

    throw p0

    :catchall_43
    move-exception p0

    goto :goto_41
.end method

.method public final onDestroy(Lndc;)V
    .registers 3

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Laf3;->f:Ljava/lang/Object;

    monitor-enter p1

    :try_start_a
    iget-object v0, p0, Laf3;->c:Lcf3;

    invoke-virtual {v0}, Lcf3;->a()V

    const/4 v0, 0x0

    iput-object v0, p0, Laf3;->g:Ldf3;

    monitor-exit p1

    return-void

    :goto_14
    monitor-exit p1
    :try_end_15
    .catchall {:try_start_a .. :try_end_15} :catchall_16

    throw p0

    :catchall_16
    move-exception p0

    goto :goto_14
.end method

.method public final onStart(Lndc;)V
    .registers 2

    const/4 p1, 0x1

    iput-boolean p1, p0, Laf3;->h:Z

    return-void
.end method

.method public final onStop(Lndc;)V
    .registers 2

    const/4 p1, 0x0

    iput-boolean p1, p0, Laf3;->h:Z

    return-void
.end method
