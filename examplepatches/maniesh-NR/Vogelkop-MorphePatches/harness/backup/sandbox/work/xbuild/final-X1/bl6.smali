.class public final synthetic Lbl6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lbl6;->a:B

    iput-object p1, p0, Lbl6;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 14

    iget-byte v0, p0, Lbl6;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    iget-object p0, p0, Lbl6;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_3b6

    check-cast p0, Lym7;

    iget-object v0, p0, Lym7;->h:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->isPopupShowing()Z

    move-result v0

    invoke-virtual {p0, v0}, Lym7;->s(Z)V

    iput-boolean v0, p0, Lym7;->m:Z

    return-void

    :pswitch_18
    check-cast p0, Lac1;

    iput-object v1, p0, Lac1;->d:Ljava/lang/Object;

    iget-object v0, p0, Lac1;->e:Ljava/lang/Object;

    check-cast v0, Lvi7;

    iget-object v1, p0, Lac1;->c:Ljava/lang/Object;

    check-cast v1, Lui7;

    iget v2, p0, Lac1;->a:I

    iget p0, p0, Lac1;->b:I

    invoke-virtual {v0, v1, v2, p0}, Lvi7;->w(Lti7;II)V

    return-void

    :pswitch_2c
    check-cast p0, Lgi7;

    iput-boolean v3, p0, Lgi7;->a:Z

    iget-object p0, p0, Lgi7;->b:Lhi7;

    iget-object v0, p0, Lhi7;->i:Lni7;

    iget-object v1, p0, Lhi7;->e:Ligi;

    iget-object v1, v1, Ligi;->c:Ljava/lang/Object;

    check-cast v1, Landroid/widget/FrameLayout;

    invoke-static {v1}, Lq9n;->r(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v1

    iget-object v4, p0, Lhi7;->c:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    invoke-static {v4}, Lq9n;->r(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v5

    new-instance v6, Lg6n;

    invoke-direct {v6, v4}, Lg6n;-><init>(Landroid/view/ViewGroup;)V

    invoke-virtual {v6}, Lg6n;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_4d
    :goto_4d
    move-object v6, v4

    check-cast v6, Lh6n;

    invoke-virtual {v6}, Lh6n;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_76

    invoke-virtual {v6}, Lh6n;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/View;

    invoke-static {v6}, Lgi7;->x(Landroid/view/View;)Z

    move-result v7

    if-eqz v7, :cond_4d

    invoke-virtual {v6}, Landroid/view/View;->isLaidOut()Z

    move-result v7

    if-eqz v7, :cond_4d

    iget v7, v1, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v6}, Landroid/view/View;->getTop()I

    move-result v6

    iget v8, v5, Landroid/graphics/Rect;->top:I

    add-int/2addr v6, v8

    sub-int/2addr v7, v6

    if-ge v3, v7, :cond_4d

    move v3, v7

    goto :goto_4d

    :cond_76
    iget-object p0, p0, Lhi7;->n:Landroid/graphics/Point;

    iget v1, v0, Lni7;->y:I

    iget-object v4, v0, Lni7;->x:Lji7;

    if-eq v1, v3, :cond_b6

    iput v3, v0, Lni7;->y:I

    iget-object v1, v0, Lni7;->t:Landroid/view/VelocityTracker;

    if-nez v1, :cond_b6

    iget-object v1, v4, Lji7;->c:Landroid/animation/ValueAnimator;

    if-eqz v1, :cond_91

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v1

    if-ne v1, v2, :cond_91

    iget-object v1, v4, Lji7;->b:Lmi7;

    goto :goto_93

    :cond_91
    sget-object v1, Lmi7;->a:Lmi7;

    :goto_93
    sget-object v2, Lmi7;->a:Lmi7;

    if-ne v1, v2, :cond_b6

    iget v1, p0, Landroid/graphics/Point;->x:I

    invoke-virtual {v0, v1}, Lni7;->c(I)I

    move-result v1

    int-to-float v1, v1

    iget p0, p0, Landroid/graphics/Point;->y:I

    invoke-virtual {v0, p0}, Lni7;->d(I)I

    move-result p0

    int-to-float p0, p0

    invoke-virtual {v4, v1, p0}, Lji7;->c(FF)V

    iget-object v5, v0, Lni7;->x:Lji7;

    sget-object v6, Lmi7;->d:Lmi7;

    sget-wide v7, Lni7;->B:J

    const/4 v11, 0x0

    const/16 v12, 0x1c

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-static/range {v5 .. v12}, Lji7;->b(Lji7;Lmi7;JLli7;Lwg5;Lkotlin/jvm/functions/Function0;I)V

    :cond_b6
    return-void

    :pswitch_b7
    check-cast p0, Lk5o;

    iget-object p0, p0, Lk5o;->c:Ljava/lang/Object;

    check-cast p0, Lqg7;

    iget-object v0, p0, Lqg7;->p:Lre7;

    invoke-virtual {p0, v0}, Lqg7;->m0(Lre7;)V

    return-void

    :pswitch_c3
    check-cast p0, Lev4;

    iput-boolean v2, p0, Lev4;->b:Z

    iget-object v0, p0, Lev4;->d:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "ctrl_init["

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lev4;->f(Landroid/content/Context;)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/opera/android/downloads/DownloadService;->e(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {p0}, Lev4;->q()Z

    move-result v0

    iput-boolean v0, p0, Lev4;->c:Z

    invoke-virtual {p0, v0}, Lev4;->d(Z)V

    return-void

    :pswitch_ef
    check-cast p0, Leg7;

    iget-object p0, p0, Leg7;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/downloads/DownloadService;

    sget-boolean v0, Lcom/opera/android/downloads/DownloadService;->e:Z

    invoke-virtual {p0}, Lcom/opera/android/downloads/DownloadService;->f()V

    return-void

    :pswitch_fb
    check-cast p0, Lwt2;

    iget-object p0, p0, Lwt2;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/downloads/DownloadService;

    sget-boolean v0, Lcom/opera/android/downloads/DownloadService;->e:Z

    invoke-static {p0}, Lev4;->f(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_147

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object v0

    iget-object v1, v0, Lsf7;->a:Lrf7;

    invoke-virtual {v1}, Lrf7;->v()V

    :try_start_11a
    iget-object v0, v1, Lrf7;->c:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_124
    :goto_124
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_144

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lre7;

    invoke-virtual {v2}, Lre7;->p()Z

    move-result v4

    if-eqz v4, :cond_124

    invoke-virtual {v2}, Lre7;->m()Z

    move-result v4

    if-nez v4, :cond_124

    iget-boolean v4, v2, Lre7;->w:Z

    if-eqz v4, :cond_124

    invoke-virtual {v2}, Lre7;->u()V
    :try_end_143
    .catchall {:try_start_11a .. :try_end_143} :catchall_16b

    goto :goto_124

    :cond_144
    invoke-virtual {v1}, Lrf7;->w()V

    :cond_147
    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    if-eqz v0, :cond_16a

    new-instance v1, Leg7;

    invoke-direct {v1, p0, v3}, Leg7;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Lcom/opera/android/downloads/DownloadService;->d:Leg7;

    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->registerDefaultNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_167

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-nez v0, :cond_16a

    :cond_167
    invoke-virtual {p0}, Lcom/opera/android/downloads/DownloadService;->f()V

    :cond_16a
    return-void

    :catchall_16b
    move-exception v0

    move-object p0, v0

    invoke-virtual {v1}, Lrf7;->w()V

    throw p0

    :pswitch_171
    check-cast p0, Lyf7;

    iput-boolean v3, p0, Lyf7;->g:Z

    iget-object p0, p0, Lyf7;->e:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_17b
    if-ge v3, v0, :cond_189

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v3, v3, 0x1

    check-cast v1, Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_17b

    :cond_189
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    return-void

    :pswitch_18d
    check-cast p0, Lqq6;

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lru9;

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "download_notification_permission_rationale.shown.count"

    invoke-interface {p0, v1, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    add-int/2addr p0, v2

    iget-object v2, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v2, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v2, v1, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const-string p0, "download_notification_permission_rationale.last_shown.timestamp"

    invoke-interface {v2, p0, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    return-void

    :pswitch_1b4
    check-cast p0, Lcom/opera/android/downloads/DownloadJobService;

    iget-object v0, p0, Lcom/opera/android/downloads/DownloadJobService;->b:Landroid/app/job/JobParameters;

    if-eqz v0, :cond_1f8

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object p0

    iget-object p0, p0, Lsf7;->a:Lrf7;

    invoke-virtual {p0}, Lrf7;->v()V

    :try_start_1cb
    iget-object v0, p0, Lrf7;->c:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1d5
    :goto_1d5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1f5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lre7;

    invoke-virtual {v1}, Lre7;->p()Z

    move-result v2

    if-eqz v2, :cond_1d5

    invoke-virtual {v1}, Lre7;->m()Z

    move-result v2

    if-nez v2, :cond_1d5

    iget-boolean v2, v1, Lre7;->w:Z

    if-eqz v2, :cond_1d5

    invoke-virtual {v1}, Lre7;->u()V
    :try_end_1f4
    .catchall {:try_start_1cb .. :try_end_1f4} :catchall_1f9

    goto :goto_1d5

    :cond_1f5
    invoke-virtual {p0}, Lrf7;->w()V

    :cond_1f8
    return-void

    :catchall_1f9
    move-exception v0

    invoke-virtual {p0}, Lrf7;->w()V

    throw v0

    :pswitch_1fe
    check-cast p0, La21;

    invoke-virtual {p0}, La21;->f()V

    return-void

    :pswitch_204
    check-cast p0, Lua7;

    iget-object v0, p0, Lua7;->c:Ljava/lang/Object;

    check-cast v0, Lumi;

    iget-object v1, p0, Lua7;->d:Ljava/lang/Object;

    check-cast v1, Lrf7;

    iget-object v1, v1, Lrf7;->c:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    new-instance v3, Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_221
    :goto_221
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_25b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lre7;

    invoke-virtual {v4}, Lre7;->o()Z

    move-result v5

    if-nez v5, :cond_221

    invoke-virtual {v4}, Lre7;->g()Landroid/net/Uri;

    move-result-object v5

    if-eqz v5, :cond_221

    sget-object v6, Ls29;->a:Ljava/util/HashSet;

    const-string v6, "file"

    invoke-virtual {v5}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_221

    new-instance v6, Lte7;

    iget-wide v7, v4, Lre7;->o:J

    new-instance v4, Ljava/io/File;

    invoke-virtual {v5}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v6, v7, v8, v4}, Lte7;-><init>(JLjava/io/File;)V

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_221

    :cond_25b
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_265

    invoke-virtual {p0, v2}, Lua7;->q(Z)V

    goto :goto_27f

    :cond_265
    new-instance v1, Ln57;

    invoke-direct {v1, p0}, Ln57;-><init>(Lua7;)V

    invoke-virtual {v0, v1}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v1

    new-instance v2, Luk6;

    const/16 v4, 0xb

    invoke-direct {v2, p0, v4}, Luk6;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {v1, p0}, Lnml;->b(Lnml;)V

    invoke-virtual {v1, v3}, Lnml;->a(Ljava/lang/Object;)Loml;

    :goto_27f
    return-void

    :pswitch_280
    check-cast p0, Lre7;

    iget-object v0, p0, Lre7;->a:Lxf7;

    iget-object v0, v0, Lxf7;->b:Lcom/opera/android/downloads/DownloadPauseManager;

    iget-object p0, p0, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    invoke-interface {p0}, Lcom/opera/android/downloads/DownloadItem;->getId()J

    move-result-wide v1

    iget-wide v3, v0, Lcom/opera/android/downloads/DownloadPauseManager;->a:J

    invoke-static {v3, v4, v1, v2}, LJ/N;->MCe2yFpu(JJ)V

    return-void

    :pswitch_292
    check-cast p0, Lkd7;

    iget-object v0, p0, Lkd7;->l:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p0, v0}, Lldk;->g(Ljava/lang/Object;)V

    return-void

    :pswitch_29f
    check-cast p0, Lorg/chromium/content/browser/androidoverlay/DialogOverlayImpl;

    iget-object v0, p0, Lorg/chromium/content/browser/androidoverlay/DialogOverlayImpl;->c:Lx77;

    if-eqz v0, :cond_2ab

    invoke-virtual {p0}, Lorg/chromium/content/browser/androidoverlay/DialogOverlayImpl;->l()V

    invoke-virtual {p0}, Lorg/chromium/content/browser/androidoverlay/DialogOverlayImpl;->k()V

    :cond_2ab
    return-void

    :pswitch_2ac
    check-cast p0, Lc47;

    new-instance v0, Lvr3;

    new-instance v1, Ltu;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v2}, Ltu;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v1}, Lvr3;-><init>(Lcom/opera/api/Callback;)V

    iget-object v1, p0, Lc47;->c:Ld5o;

    invoke-virtual {v0}, Lvr3;->b()Ltt2;

    move-result-object v2

    new-instance v4, Ld47;

    invoke-direct {v4, v2, v3}, Ld47;-><init>(Ltt2;B)V

    invoke-virtual {v1, v4}, Ld5o;->y(Lkotlin/jvm/functions/Function1;)V

    iget-object v1, p0, Lc47;->d:Ld5o;

    invoke-virtual {v0}, Lvr3;->b()Ltt2;

    move-result-object v2

    new-instance v4, Ld47;

    invoke-direct {v4, v2, v3}, Ld47;-><init>(Ltt2;B)V

    invoke-virtual {v1, v4}, Ld5o;->y(Lkotlin/jvm/functions/Function1;)V

    iget-object v1, p0, Lc47;->e:Lwu5;

    invoke-virtual {v0}, Lvr3;->b()Ltt2;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/app/ActivityManager;->isUserAMonkey()Z

    move-result v1

    if-eqz v1, :cond_2e7

    sget-object v1, Lz37;->b:Lz37;

    goto :goto_2e9

    :cond_2e7
    sget-object v1, Lz37;->a:Lz37;

    :goto_2e9
    invoke-virtual {v2, v1}, Ltt2;->run(Ljava/lang/Object;)V

    iget-object p0, p0, Lc47;->f:Ld5o;

    invoke-virtual {v0}, Lvr3;->b()Ltt2;

    move-result-object v1

    new-instance v2, Ld47;

    invoke-direct {v2, v1, v3}, Ld47;-><init>(Ltt2;B)V

    invoke-virtual {p0, v2}, Ld5o;->y(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0}, Lvr3;->d()V

    return-void

    :pswitch_2fe
    check-cast p0, Lay6;

    iget-object p0, p0, Lay6;->h:Lo4n;

    invoke-interface {p0}, Lo4n;->d()V

    return-void

    :pswitch_306
    check-cast p0, Luw6;

    invoke-virtual {p0, v3}, Luw6;->f(Z)V

    return-void

    :pswitch_30c
    check-cast p0, Low6;

    iput-boolean v2, p0, Low6;->j:Z

    invoke-virtual {p0}, Low6;->d()V

    return-void

    :pswitch_314
    check-cast p0, Lvtk;

    invoke-virtual {p0}, Lvtk;->close()V

    return-void

    :pswitch_31a
    check-cast p0, Ll94;

    new-instance v0, Ljava/lang/Exception;

    const-string v1, "Failed to snapshot: OpenGLRenderer not ready."

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ll94;->d(Ljava/lang/Throwable;)Z

    return-void

    :pswitch_327
    check-cast p0, Landroidx/fragment/app/g;

    iget-object v0, p0, Landroidx/fragment/app/g;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    :goto_32f
    if-ge v3, v1, :cond_33f

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v3, v3, 0x1

    check-cast v2, Lew6;

    iget-object v2, v2, Landroidx/fragment/app/f;->a:Landroidx/fragment/app/c0;

    invoke-virtual {v2, p0}, Landroidx/fragment/app/c0;->c(Lhyj;)V

    goto :goto_32f

    :cond_33f
    return-void

    :pswitch_340
    check-cast p0, Lpqh;

    iget-object p0, p0, Lpqh;->a:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function0;

    if-eqz p0, :cond_34b

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    :cond_34b
    return-void

    :pswitch_34c
    check-cast p0, Lqs6;

    iget-object p0, p0, Lqs6;->f:Lup6;

    if-eqz p0, :cond_355

    invoke-virtual {p0}, Lup6;->run()V

    :cond_355
    return-void

    :pswitch_356
    check-cast p0, Lgs6;

    iget-object p0, p0, Lgs6;->a:Lxoc;

    sget-object v0, Ltg0;->b:Ltg0;

    invoke-virtual {p0, v0}, Lxoc;->a(Ltg0;)V

    return-void

    :pswitch_360
    check-cast p0, Ltn6;

    invoke-virtual {p0, v1}, Ltn6;->d(Lam7;)V

    return-void

    :pswitch_366
    check-cast p0, Lvn6;

    iget-boolean v0, p0, Lvn6;->c:Z

    if-nez v0, :cond_37e

    iget-object v0, p0, Lvn6;->b:Lxl7;

    if-eqz v0, :cond_375

    iget-object v1, p0, Lvn6;->a:Lam7;

    invoke-interface {v0, v1}, Lxl7;->d(Lam7;)V

    :cond_375
    iget-object v0, p0, Lvn6;->d:Lwn6;

    iget-object v0, v0, Lwn6;->n:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iput-boolean v2, p0, Lvn6;->c:Z

    :cond_37e
    return-void

    :pswitch_37f
    check-cast p0, Lmm6;

    invoke-virtual {p0}, Lmm6;->i()V

    return-void

    :pswitch_385
    check-cast p0, Lll6;

    iget-wide v0, p0, Lll6;->a0:J

    const-wide/32 v3, 0x493e0

    cmp-long v0, v0, v3

    if-ltz v0, :cond_39c

    iget-object v0, p0, Lll6;->n:Lqq6;

    iget-object v0, v0, Lqq6;->b:Ljava/lang/Object;

    check-cast v0, Lkgd;

    iput-boolean v2, v0, Lkgd;->O0:Z

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lll6;->a0:J

    :cond_39c
    return-void

    :pswitch_39d
    check-cast p0, Lel6;

    invoke-virtual {p0}, Lel6;->Q()Ld11;

    move-result-object v0

    new-instance v1, Lzk6;

    const/16 v2, 0x10

    invoke-direct {v1, v2}, Lzk6;-><init>(B)V

    const/16 v2, 0x404

    invoke-virtual {p0, v0, v2, v1}, Lel6;->V(Ld11;ILfjc;)V

    iget-object p0, p0, Lel6;->f:Lijc;

    invoke-virtual {p0}, Lijc;->e()V

    return-void

    nop

    :pswitch_data_3b6
    .packed-switch 0x0
        :pswitch_39d
        :pswitch_385
        :pswitch_37f
        :pswitch_366
        :pswitch_360
        :pswitch_356
        :pswitch_34c
        :pswitch_340
        :pswitch_327
        :pswitch_31a
        :pswitch_314
        :pswitch_30c
        :pswitch_306
        :pswitch_2fe
        :pswitch_2ac
        :pswitch_29f
        :pswitch_292
        :pswitch_280
        :pswitch_204
        :pswitch_1fe
        :pswitch_1b4
        :pswitch_18d
        :pswitch_171
        :pswitch_fb
        :pswitch_ef
        :pswitch_c3
        :pswitch_b7
        :pswitch_2c
        :pswitch_18
    .end packed-switch
.end method
