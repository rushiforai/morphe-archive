.class public final Lcdn;
.super Llim;
.source "SourceFile"


# instance fields
.field public final a:Lh7f;

.field public final b:Lgzg;

.field public final c:Lq6l;

.field public d:Lf6l;

.field public e:Lrle;

.field public final f:Landroid/content/Context;

.field public final g:Lk6l;

.field public final h:Leej;

.field public i:Z

.field public j:I

.field public k:I

.field public l:I

.field public final m:Ltvk;

.field public final n:Lssi;

.field public o:Lddn;

.field public final p:Ldcl;

.field public q:Lcom/opera/android/browser/chromium/NetworkTester$NonProxiedTest;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lk6l;Leej;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcdn;->a:Lh7f;

    new-instance v0, Lgzg;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lgzg;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lcdn;->b:Lgzg;

    new-instance v0, Lq6l;

    const/4 v1, 0x5

    invoke-direct {v0, p0, v1}, Lq6l;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lcdn;->c:Lq6l;

    const/4 v0, 0x1

    iput v0, p0, Lcdn;->k:I

    iput v0, p0, Lcdn;->l:I

    new-instance v0, Ltvk;

    invoke-direct {v0, p0}, Ltvk;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcdn;->m:Ltvk;

    new-instance v0, Lssi;

    const/16 v1, 0x16

    invoke-direct {v0, p0, v1}, Lssi;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lcdn;->n:Lssi;

    new-instance v0, Ldcl;

    invoke-direct {v0, p0}, Ldcl;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcdn;->p:Ldcl;

    iput-object p1, p0, Lcdn;->f:Landroid/content/Context;

    iput-object p2, p0, Lcdn;->g:Lk6l;

    iput-object p3, p0, Lcdn;->h:Leej;

    return-void
.end method


# virtual methods
.method public final R()Lydn;
    .registers 2

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lcdn;->f:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object p0

    return-object p0
.end method

.method public final S()V
    .registers 13

    iget-object v0, p0, Lcdn;->g:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    if-eqz v0, :cond_be

    iget-boolean v1, p0, Lcdn;->i:Z

    const-wide/16 v2, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x2

    if-eqz v1, :cond_70

    invoke-virtual {p0}, Lcdn;->R()Lydn;

    move-result-object v1

    check-cast v0, Ld7l;

    iget-object v6, v0, Ld7l;->j:Le7l;

    invoke-interface {v6}, Lb9l;->m()Z

    move-result v6

    if-eqz v6, :cond_21

    invoke-virtual {v1}, Lydn;->q()I

    move-result v1

    goto :goto_25

    :cond_21
    invoke-virtual {v1}, Lydn;->r()I

    move-result v1

    :goto_25
    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->isLoading()Z

    move-result v0

    const-wide/16 v6, 0x80

    const/4 v8, 0x3

    const/4 v9, 0x5

    iget-object v10, p0, Lcdn;->f:Landroid/content/Context;

    if-eqz v0, :cond_4b

    const/4 v0, 0x4

    if-eq v1, v0, :cond_38

    if-ne v1, v8, :cond_4b

    :cond_38
    invoke-static {v10}, Lufn;->t(Landroid/content/Context;)Lufn;

    move-result-object v0

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltfn;

    iget-wide v0, v0, Ltfn;->a:J

    and-long/2addr v0, v6

    cmp-long v0, v0, v2

    if-nez v0, :cond_62

    move v8, v5

    goto :goto_71

    :cond_4b
    if-eq v1, v4, :cond_64

    iget v0, p0, Lcdn;->j:I

    if-eqz v0, :cond_64

    invoke-static {v10}, Lufn;->t(Landroid/content/Context;)Lufn;

    move-result-object v0

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltfn;

    iget-wide v10, v0, Ltfn;->a:J

    and-long/2addr v10, v6

    cmp-long v0, v10, v2

    if-eqz v0, :cond_64

    :cond_62
    move v8, v9

    goto :goto_71

    :cond_64
    if-eq v1, v4, :cond_70

    iget v0, p0, Lcdn;->j:I

    const/16 v1, -0x6f

    if-eq v0, v1, :cond_71

    const/16 v1, 0x1f6

    if-eq v0, v1, :cond_71

    :cond_70
    move v8, v4

    :cond_71
    :goto_71
    iget v0, p0, Lcdn;->l:I

    iget-object v1, p0, Lcdn;->n:Lssi;

    if-eq v8, v0, :cond_7c

    invoke-static {v1}, Lvml;->a(Ljava/lang/Runnable;)V

    iput v4, p0, Lcdn;->l:I

    :cond_7c
    iget-object v0, p0, Lcdn;->o:Lddn;

    if-eqz v0, :cond_8d

    invoke-interface {v0}, Lddn;->a()I

    move-result v0

    if-eq v0, v8, :cond_8d

    iget-object v0, p0, Lcdn;->o:Lddn;

    if-eqz v0, :cond_8d

    invoke-interface {v0}, Lddn;->cancel()V

    :cond_8d
    if-eq v8, v4, :cond_a0

    iget v0, p0, Lcdn;->l:I

    if-ne v0, v4, :cond_a0

    iget-object v0, p0, Lcdn;->o:Lddn;

    if-nez v0, :cond_a0

    iput v8, p0, Lcdn;->l:I

    if-ne v8, v5, :cond_9d

    const-wide/16 v2, 0x1f40

    :cond_9d
    invoke-static {v1, v2, v3}, Lvml;->d(Ljava/lang/Runnable;J)V

    :cond_a0
    iget v0, p0, Lcdn;->k:I

    if-eq v8, v0, :cond_be

    iput v8, p0, Lcdn;->k:I

    iget-object p0, p0, Lcdn;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_ac
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_be

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lxcn;

    iget-object v0, v0, Lxcn;->a:Lbdn;

    invoke-virtual {v0}, Lbdn;->c()V

    goto :goto_ac

    :cond_be
    return-void
.end method

.method public final W(Lndc;)V
    .registers 3

    invoke-virtual {p0}, Lcdn;->R()Lydn;

    move-result-object p1

    iget-object v0, p0, Lcdn;->b:Lgzg;

    invoke-virtual {p1, v0}, Lydn;->b(Ltdn;)V

    iget-object p1, p0, Lcdn;->g:Lk6l;

    iget-object v0, p0, Lcdn;->c:Lq6l;

    invoke-virtual {p1, v0}, Lk6l;->a(La2l;)Lf6l;

    move-result-object p1

    iput-object p1, p0, Lcdn;->d:Lf6l;

    invoke-static {}, Lsle;->d()Z

    move-result p1

    iput-boolean p1, p0, Lcdn;->i:Z

    new-instance p1, Lfpk;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lfpk;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lsle;->a(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)Lrle;

    move-result-object p1

    iput-object p1, p0, Lcdn;->e:Lrle;

    invoke-virtual {p0}, Lcdn;->S()V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 3

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Lcdn;->e:Lrle;

    iget-object p1, p1, Lrle;->a:Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;

    invoke-static {p1}, Lorg/chromium/net/NetworkChangeNotifier;->removeConnectionTypeObserver(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcdn;->e:Lrle;

    iget-object p1, p0, Lcdn;->g:Lk6l;

    iget-object v0, p0, Lcdn;->d:Lf6l;

    invoke-virtual {p1, v0}, Lk6l;->x(Lj6l;)V

    invoke-virtual {p0}, Lcdn;->R()Lydn;

    move-result-object p1

    iget-object p0, p0, Lcdn;->b:Lgzg;

    invoke-virtual {p1, p0}, Lydn;->A(Ltdn;)V

    return-void
.end method
