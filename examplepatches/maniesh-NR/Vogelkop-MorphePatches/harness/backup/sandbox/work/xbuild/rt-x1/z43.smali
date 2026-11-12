.class public abstract Lz43;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public final f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;

.field public h:Ljava/lang/Object;

.field public final i:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lpt3;Lk6l;Lesk;Landroid/view/ViewGroup;Lysl;Lpde;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Lz43;->h:Ljava/lang/Object;

    iput-object p5, p0, Lz43;->b:Ljava/lang/Object;

    iput-object p3, p0, Lz43;->c:Ljava/lang/Object;

    iput-object p4, p0, Lz43;->d:Ljava/lang/Object;

    iget-byte p4, p2, Lpt3;->a:B

    iget-object p2, p2, Lpt3;->b:Lcom/opera/android/BrowserActivity;

    packed-switch p4, :pswitch_data_70

    sget p4, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p2, p0}, Lcom/opera/android/BrowserActivity;->r0(Lz43;)Lgbf;

    move-result-object p2

    goto :goto_39

    :pswitch_1e
    sget p4, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p2, p0}, Lcom/opera/android/BrowserActivity;->r0(Lz43;)Lgbf;

    move-result-object p2

    goto :goto_39

    :pswitch_25
    sget p4, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p2, p0}, Lcom/opera/android/BrowserActivity;->r0(Lz43;)Lgbf;

    move-result-object p2

    goto :goto_39

    :pswitch_2c
    sget p4, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p2, p0}, Lcom/opera/android/BrowserActivity;->r0(Lz43;)Lgbf;

    move-result-object p2

    goto :goto_39

    :pswitch_33
    sget p4, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p2, p0}, Lcom/opera/android/BrowserActivity;->r0(Lz43;)Lgbf;

    move-result-object p2

    :goto_39
    iput-object p2, p0, Lz43;->i:Ljava/lang/Object;

    iput-object p6, p0, Lz43;->e:Ljava/lang/Object;

    const p2, 0x7f0a04f5

    invoke-virtual {p5, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/opera/android/custom_views/ToolbarProgressBar;

    new-instance p4, Lv43;

    invoke-direct {p4, p0}, Lv43;-><init>(Lz43;)V

    iput-object p4, p0, Lz43;->f:Ljava/lang/Object;

    new-instance p6, Loc2;

    const/4 v0, 0x7

    invoke-direct {p6, p0, v0}, Loc2;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-static {p2, v0, p4, p6}, Laib;->A(Lw6f;Ltcc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    new-instance p2, Lw43;

    invoke-direct {p2, p1, p3, p7}, Lw43;-><init>(Lcom/opera/android/BrowserActivity;Lk6l;Lpde;)V

    iput-object p2, p0, Lz43;->g:Ljava/lang/Object;

    new-instance p1, Lll2;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lll2;-><init>(Ljava/lang/Object;B)V

    new-instance p3, Lol2;

    invoke-direct {p3, p0, p2}, Lol2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p5, p0, p1, p3}, Lp37;->A(Landroid/view/View;Ljava/lang/Object;Ldh4;Landroid/view/ViewTreeObserver$OnDrawListener;)V

    return-void

    :pswitch_data_70
    .packed-switch 0x5
        :pswitch_33
        :pswitch_2c
        :pswitch_25
        :pswitch_1e
    .end packed-switch
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    iput-object p1, p0, Lz43;->b:Ljava/lang/Object;

    .line 114
    iput-object p2, p0, Lz43;->c:Ljava/lang/Object;

    .line 115
    iput-object p3, p0, Lz43;->d:Ljava/lang/Object;

    .line 116
    new-instance p1, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {p1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object p1, p0, Lz43;->f:Ljava/lang/Object;

    .line 117
    new-instance p1, Lxbk;

    invoke-direct {p1, p0}, Lxbk;-><init>(Lz43;)V

    iput-object p1, p0, Lz43;->i:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public A(Lx43;)V
    .registers 2

    return-void
.end method

.method public B(Z)V
    .registers 2

    return-void
.end method

.method public final C(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    iget-object v0, p0, Lz43;->f:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    :try_start_7
    iget-boolean v1, p0, Lz43;->a:Z

    if-nez v1, :cond_3b

    const/4 v1, 0x0

    if-eqz p1, :cond_2d

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_2d

    iget-object v2, p0, Lz43;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_2e

    :cond_2d
    move-object p1, v1

    :goto_2e
    iput-object p1, p0, Lz43;->g:Ljava/lang/Object;

    if-eqz p2, :cond_38

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    if-nez p1, :cond_39

    :cond_38
    move-object p2, v1

    :cond_39
    iput-object p2, p0, Lz43;->h:Ljava/lang/Object;
    :try_end_3b
    .catchall {:try_start_7 .. :try_end_3b} :catchall_3f

    :cond_3b
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return-void

    :catchall_3f
    move-exception p0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw p0
.end method

.method public final D(Landroid/content/Context;Z)Z
    .registers 15

    iget-object v0, p0, Lz43;->f:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    :try_start_7
    iget-object v1, p0, Lz43;->g:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    if-nez v1, :cond_11

    iget-object v1, p0, Lz43;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    :cond_11
    iget-object v2, p0, Lz43;->h:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    if-nez v2, :cond_1b

    iget-object v2, p0, Lz43;->d:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;
    :try_end_1b
    .catchall {:try_start_7 .. :try_end_1b} :catchall_129

    :cond_1b
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    iget-object v0, p0, Lz43;->i:Ljava/lang/Object;

    check-cast v0, Lxbk;

    invoke-virtual {v0, p1}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzsf;

    iget-object p0, p0, Lz43;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    iget-object v3, v0, Lzsf;->g:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v3

    const/4 v6, 0x0

    if-eqz v3, :cond_ef

    :try_start_37
    iget-object v3, v0, Lzsf;->i:Ljava/lang/Object;

    monitor-enter v3
    :try_end_3a
    .catchall {:try_start_37 .. :try_end_3a} :catchall_122

    :try_start_3a
    iget-object v7, v0, Lzsf;->f:Li16;

    const-string v8, "AvroOspPending"

    iget-object v7, v7, Li16;->b:Ljava/lang/Object;

    check-cast v7, Landroid/content/SharedPreferences;

    invoke-interface {v7, v8}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4a

    monitor-exit v3

    goto :goto_53

    :cond_4a
    iget-object v7, v0, Lzsf;->h:Lrsf;

    invoke-interface {v7}, Lrsf;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_5a

    monitor-exit v3
    :try_end_53
    .catchall {:try_start_3a .. :try_end_53} :catchall_120

    :goto_53
    iget-object v3, v0, Lzsf;->g:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v3, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    goto/16 :goto_ef

    :cond_5a
    :try_start_5a
    monitor-exit v3
    :try_end_5b
    .catchall {:try_start_5a .. :try_end_5b} :catchall_120

    :try_start_5b
    iget-object v3, v0, Lzsf;->e:Lssf;

    invoke-interface {v3}, Lssf;->b()Lrsf;

    move-result-object v3

    iget-object v6, v0, Lzsf;->d:Ll45;

    invoke-virtual {v6}, Ll45;->y()Lvg;

    move-result-object v6

    iget-boolean v7, v6, Lvg;->a:Z

    iget v6, v6, Lvg;->b:I

    invoke-interface {v3, v6, v7}, Lrsf;->i(IZ)V

    iget-object v6, v0, Lzsf;->i:Ljava/lang/Object;

    monitor-enter v6
    :try_end_71
    .catchall {:try_start_5b .. :try_end_71} :catchall_122

    :try_start_71
    iget-object v7, v0, Lzsf;->h:Lrsf;

    invoke-virtual {v0}, Lzsf;->b()V

    invoke-interface {v7}, Lrsf;->f()Ljava/lang/String;

    move-result-object v8

    if-nez v8, :cond_a2

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v8

    const/16 v9, 0x10

    invoke-static {v9}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v9

    invoke-virtual {v8}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v10

    invoke-virtual {v9, v10, v11}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    move-result-object v9

    invoke-virtual {v8}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v10

    invoke-virtual {v9, v10, v11}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v8

    const/4 v9, 0x2

    invoke-static {v8, v9}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Lrsf;->j(Ljava/lang/String;)V

    :cond_a2
    invoke-interface {v3, v7}, Lrsf;->e(Lrsf;)Lrsf;

    move-result-object v3

    iget-object v7, v0, Lzsf;->h:Lrsf;

    invoke-interface {v3, v7}, Lrsf;->d(Lrsf;)V

    invoke-virtual {v0, v5}, Lzsf;->d(Z)V

    iget-object v7, v0, Lzsf;->f:Li16;

    const-string v8, "AvroOspPending"

    invoke-virtual {v7, v8, v3}, Li16;->z(Ljava/lang/String;Lrsf;)V

    iget-object v7, v0, Lzsf;->c:Lb59;

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/content/SharedPreferences;

    const-string v9, "StatsFiltered"

    invoke-interface {v8, v9}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_d5

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/content/SharedPreferences;

    invoke-interface {v8, v9, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    const-wide/16 v9, 0x1

    xor-int/2addr v8, v5

    invoke-virtual {v0, v9, v10, v8}, Lzsf;->f(JZ)V

    :cond_d5
    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/content/SharedPreferences;

    const-string v8, "Consents"

    const-wide/16 v9, 0x0

    invoke-interface {v7, v8, v9, v10}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v7

    new-instance v9, Lab9;

    invoke-direct {v9, v7, v8, v3}, Lab9;-><init>(JLrsf;)V

    monitor-exit v6
    :try_end_e9
    .catchall {:try_start_71 .. :try_end_e9} :catchall_11c

    iget-object v3, v0, Lzsf;->g:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v3, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    move-object v6, v9

    :cond_ef
    :goto_ef
    if-nez v6, :cond_f2

    return v4

    :cond_f2
    iget-object v3, v6, Lab9;->d:Ljava/lang/Object;

    check-cast v3, Lrsf;

    iget-wide v7, v6, Lab9;->a:J

    invoke-interface {v3, v7, v8, p2}, Lrsf;->b(JZ)V

    :try_start_fb
    new-instance p2, Lctf;

    invoke-direct {p2, p1, p0, v1, v2}, Lctf;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2, v6}, Lctf;->a(Lab9;)I

    move-result p0

    iput p0, v6, Lab9;->c:I

    iget p1, p2, Lctf;->d:I

    iput p1, v6, Lab9;->b:I
    :try_end_10a
    .catch Ljava/lang/Exception; {:try_start_fb .. :try_end_10a} :catch_10e
    .catchall {:try_start_fb .. :try_end_10a} :catchall_115

    if-ne p0, v5, :cond_111

    move v4, v5

    goto :goto_111

    :catch_10e
    const/4 p0, 0x4

    :try_start_10f
    iput p0, v6, Lab9;->c:I
    :try_end_111
    .catchall {:try_start_10f .. :try_end_111} :catchall_115

    :cond_111
    :goto_111
    invoke-virtual {v0, v6}, Lzsf;->c(Lab9;)V

    return v4

    :catchall_115
    move-exception p0

    invoke-virtual {v0, v6}, Lzsf;->c(Lab9;)V

    throw p0

    :goto_11a
    :try_start_11a
    monitor-exit v6
    :try_end_11b
    .catchall {:try_start_11a .. :try_end_11b} :catchall_11c

    :try_start_11b
    throw p0
    :try_end_11c
    .catchall {:try_start_11b .. :try_end_11c} :catchall_122

    :catchall_11c
    move-exception p0

    goto :goto_11a

    :goto_11e
    :try_start_11e
    monitor-exit v3
    :try_end_11f
    .catchall {:try_start_11e .. :try_end_11f} :catchall_120

    :try_start_11f
    throw p0
    :try_end_120
    .catchall {:try_start_11f .. :try_end_120} :catchall_122

    :catchall_120
    move-exception p0

    goto :goto_11e

    :catchall_122
    move-exception p0

    iget-object p1, v0, Lzsf;->g:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    throw p0

    :catchall_129
    move-exception p0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw p0
.end method

.method public a()Ljm7;
    .registers 3

    new-instance p0, Ljm7;

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Ljm7;-><init>(ZI)V

    return-object p0
.end method

.method public b(Lcom/opera/android/bar/OmniBoxRoot;Lydn;Lcom/opera/android/BrowserActivity;Llg;Lcom/opera/android/settings/SettingsManager;Lwth;Lin3;Lk5o;Likc;Lu0a;)Lv73;
    .registers 23

    new-instance v0, Lfq3;

    const/4 v11, 0x0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    invoke-direct/range {v0 .. v11}, Lfq3;-><init>(Lcom/opera/android/bar/OmniBoxRoot;Lydn;Lcom/opera/android/BrowserActivity;Llg;Lcom/opera/android/settings/SettingsManager;Lwth;Lin3;Lk5o;Likc;Lu0a;B)V

    return-object v0
.end method

.method public c(Landroid/content/Context;Lwv1;Ldu3;Lnue;Ldu3;Lnwf;)Ldbl;
    .registers 7

    const/4 p0, 0x0

    return-object p0
.end method

.method public final d()V
    .registers 4

    iget-object v0, p0, Lz43;->i:Ljava/lang/Object;

    check-cast v0, Lgbf;

    invoke-virtual {v0}, Lgbf;->n()V

    iget-object v0, p0, Lz43;->b:Ljava/lang/Object;

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/View;->isLaidOut()Z

    move-result v1

    if-nez v1, :cond_1c

    new-instance v1, Lva2;

    const/16 v2, 0xb

    invoke-direct {v1, p0, v2}, Lva2;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1, v0}, Lq9n;->d(Lm9n;Landroid/view/View;)V

    return-void

    :cond_1c
    invoke-virtual {p0}, Lz43;->v()V

    return-void
.end method

.method public abstract e()I
.end method

.method public f()Landroid/widget/ImageView;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public g(Lnje;)Landroid/view/View;
    .registers 2

    const/4 p0, 0x0

    return-object p0
.end method

.method public h()Landroid/view/View;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public i()Lbp;
    .registers 4

    iget-object p0, p0, Lz43;->i:Ljava/lang/Object;

    check-cast p0, Lgbf;

    invoke-virtual {p0}, Lgbf;->q()Lcom/opera/android/bar/OmniButtonView;

    move-result-object p0

    if-eqz p0, :cond_29

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    const/16 v1, 0x258

    if-lt v0, v1, :cond_29

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    new-instance v1, Lbp;

    const/high16 v2, 0x40a00000    # 5.0f

    invoke-static {v2, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v0

    neg-int v0, v0

    invoke-direct {v1, p0, v0}, Lbp;-><init>(Ljava/lang/Object;I)V

    return-object v1

    :cond_29
    const/4 p0, 0x0

    return-object p0
.end method

.method public j()J
    .registers 3

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public abstract k()Lx43;
.end method

.method public l()Landroid/view/View;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final m(Llkk;Lcom/opera/api/Callback;Lumi;)V
    .registers 4

    iput-object p3, p0, Lz43;->e:Ljava/lang/Object;

    new-instance p3, Lwbk;

    invoke-direct {p3, p0}, Lwbk;-><init>(Lz43;)V

    sget-object p0, Lcom/opera/android/osp/OspCollectorService;->g:Ljava/util/HashMap;

    invoke-virtual {p0, p1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lcom/opera/android/osp/OspCollectorService;->h:Ljava/util/HashMap;

    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public n()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public o()Z
    .registers 1

    instance-of p0, p0, Lmp3;

    return p0
.end method

.method public p()Z
    .registers 1

    instance-of p0, p0, Lhvl;

    return p0
.end method

.method public abstract q()Z
.end method

.method public abstract r(Landroid/content/Context;)Lzsf;
.end method

.method public s()V
    .registers 4

    iget-object v0, p0, Lz43;->d:Ljava/lang/Object;

    check-cast v0, Lesk;

    iget-object p0, p0, Lz43;->c:Ljava/lang/Object;

    check-cast p0, Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    if-eqz p0, :cond_3a

    check-cast p0, Ld7l;

    invoke-virtual {p0}, Ld7l;->n0()Z

    move-result p0

    if-eqz p0, :cond_3a

    invoke-interface {v0}, Lesk;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lru9;

    const/4 v1, 0x0

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v2, "startpage.omnibar_activated"

    invoke-interface {p0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-nez p0, :cond_3a

    invoke-interface {v0}, Lesk;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lru9;

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object v0, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    const/4 v1, 0x1

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    :cond_3a
    return-void
.end method

.method public t(Z)V
    .registers 2

    return-void
.end method

.method public u()V
    .registers 1

    return-void
.end method

.method public v()V
    .registers 1

    return-void
.end method

.method public abstract w(Z)V
.end method

.method public x()V
    .registers 1

    return-void
.end method

.method public y()V
    .registers 1

    return-void
.end method

.method public abstract z(Lb2l;)V
.end method
