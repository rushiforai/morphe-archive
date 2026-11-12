.class public final Lwr9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLjava/lang/Object;Ljava/lang/Object;Z)V
    .registers 5

    .line 24
    iput-byte p1, p0, Lwr9;->a:B

    iput-object p3, p0, Lwr9;->b:Ljava/lang/Object;

    iput-object p2, p0, Lwr9;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(La2j;)V
    .registers 3

    const/16 v0, 0x12

    iput-byte v0, p0, Lwr9;->a:B

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwr9;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lbl9;Landroidx/fragment/app/Fragment;)V
    .registers 4

    const/16 v0, 0xb

    iput-byte v0, p0, Lwr9;->a:B

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lwr9;->b:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lwr9;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/api/Callback;)V
    .registers 3

    const/16 v0, 0xa

    iput-byte v0, p0, Lwr9;->a:B

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lwr9;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcwk;Z)V
    .registers 4

    const/16 v0, 0x14

    iput-byte v0, p0, Lwr9;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwr9;->c:Ljava/lang/Object;

    if-eqz p2, :cond_e

    iget-object p1, p1, Lcwk;->m:Lb2l;

    goto :goto_f

    :cond_e
    const/4 p1, 0x0

    :goto_f
    iput-object p1, p0, Lwr9;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Li5o;Lr9i;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lwr9;->a:B

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lwr9;->b:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lwr9;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 18
    iput-byte p3, p0, Lwr9;->a:B

    iput-object p1, p0, Lwr9;->b:Ljava/lang/Object;

    iput-object p2, p0, Lwr9;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ls9i;Lxoi;)V
    .registers 4

    const/16 v0, 0xc

    iput-byte v0, p0, Lwr9;->a:B

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lwr9;->b:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lwr9;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 11

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    :try_start_2
    iget-object v2, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast v2, La2j;

    iget-object v2, v2, La2j;->b:Ljava/util/ArrayDeque;

    monitor-enter v2
    :try_end_9
    .catchall {:try_start_2 .. :try_end_9} :catchall_7b

    const/4 v3, 0x1

    if-nez v0, :cond_23

    :try_start_c
    iget-object v0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast v0, La2j;

    iget v4, v0, La2j;->c:I

    const/4 v5, 0x4

    if-ne v4, v5, :cond_19

    monitor-exit v2

    if-eqz v1, :cond_43

    goto :goto_3c

    :cond_19
    iget-wide v6, v0, La2j;->d:J

    const-wide/16 v8, 0x1

    add-long/2addr v6, v8

    iput-wide v6, v0, La2j;->d:J

    iput v5, v0, La2j;->c:I

    move v0, v3

    :cond_23
    iget-object v4, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast v4, La2j;

    iget-object v4, v4, La2j;->b:Ljava/util/ArrayDeque;

    invoke-virtual {v4}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Runnable;

    iput-object v4, p0, Lwr9;->b:Ljava/lang/Object;

    if-nez v4, :cond_44

    iget-object p0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast p0, La2j;

    iput v3, p0, La2j;->c:I

    monitor-exit v2
    :try_end_3a
    .catchall {:try_start_c .. :try_end_3a} :catchall_79

    if-eqz v1, :cond_43

    :goto_3c
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    :cond_43
    return-void

    :cond_44
    :try_start_44
    monitor-exit v2
    :try_end_45
    .catchall {:try_start_44 .. :try_end_45} :catchall_79

    :try_start_45
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v2
    :try_end_49
    .catchall {:try_start_45 .. :try_end_49} :catchall_7b

    or-int/2addr v1, v2

    const/4 v2, 0x0

    :try_start_4b
    iget-object v3, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Runnable;

    invoke-interface {v3}, Ljava/lang/Runnable;->run()V
    :try_end_52
    .catch Ljava/lang/RuntimeException; {:try_start_4b .. :try_end_52} :catch_53
    .catchall {:try_start_4b .. :try_end_52} :catchall_73

    goto :goto_70

    :catch_53
    move-exception v3

    :try_start_54
    sget-object v4, La2j;->f:Ljava/util/logging/Logger;

    sget-object v5, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Exception while executing runnable "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast v7, Ljava/lang/Runnable;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6, v3}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_70
    .catchall {:try_start_54 .. :try_end_70} :catchall_73

    :goto_70
    :try_start_70
    iput-object v2, p0, Lwr9;->b:Ljava/lang/Object;

    goto :goto_2

    :catchall_73
    move-exception v0

    iput-object v2, p0, Lwr9;->b:Ljava/lang/Object;

    throw v0
    :try_end_77
    .catchall {:try_start_70 .. :try_end_77} :catchall_7b

    :goto_77
    :try_start_77
    monitor-exit v2
    :try_end_78
    .catchall {:try_start_77 .. :try_end_78} :catchall_79

    :try_start_78
    throw p0
    :try_end_79
    .catchall {:try_start_78 .. :try_end_79} :catchall_7b

    :catchall_79
    move-exception p0

    goto :goto_77

    :catchall_7b
    move-exception p0

    if-eqz v1, :cond_85

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    :cond_85
    throw p0
.end method

.method public final run()V
    .registers 16

    iget-byte v0, p0, Lwr9;->a:B

    const/4 v1, 0x3

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x5

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    packed-switch v0, :pswitch_data_540

    iget-object v0, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast v0, Lplk;

    iget-object p0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast p0, Lwmb;

    iget-object v1, v0, Lplk;->a:Ljava/lang/Object;

    check-cast v1, Landroid/webkit/WebView;

    iget-object v0, v0, Lplk;->d:Ljava/lang/Object;

    check-cast v0, Lcom/google/ads/interactivemedia/v3/internal/zzei;

    if-nez v0, :cond_29

    invoke-virtual {p0}, Lwmb;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "Attempted to send bridge message after cleanup: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_76

    :cond_29
    new-instance v2, Lcom/google/ads/interactivemedia/v3/internal/zzpw;

    invoke-direct {v2}, Lcom/google/ads/interactivemedia/v3/internal/zzpw;-><init>()V

    const-string v3, "type"

    iget-object v4, p0, Lwmb;->d:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;

    invoke-virtual {v2, v3, v4}, Lcom/google/ads/interactivemedia/v3/internal/zzpw;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    const-string v3, "sid"

    iget-object v4, p0, Lwmb;->c:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lcom/google/ads/interactivemedia/v3/internal/zzpw;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v3, p0, Lwmb;->b:Ljava/lang/Object;

    if-eqz v3, :cond_45

    const-string v4, "data"

    invoke-virtual {v2, v4, v3}, Lcom/google/ads/interactivemedia/v3/internal/zzpw;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_45
    invoke-virtual {v2}, Lcom/google/ads/interactivemedia/v3/internal/zzpw;->b()Lcom/google/ads/interactivemedia/v3/internal/zzpx;

    move-result-object v2

    iget-object v3, p0, Lwmb;->a:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgChannel;

    iget-object v0, v0, Lcom/google/ads/interactivemedia/v3/internal/zzei;->a:Lcom/google/ads/interactivemedia/v3/internal/zzts;

    invoke-virtual {v0, v2}, Lcom/google/ads/interactivemedia/v3/internal/zzts;->d(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "javascript:adsense.mobileads.afmanotify.receiveMessage(\'"

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, "\', "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ");"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lwmb;->toString()Ljava/lang/String;

    :try_start_6f
    invoke-virtual {v1, v0, v7}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_72
    .catch Ljava/lang/IllegalStateException; {:try_start_6f .. :try_end_72} :catch_73

    goto :goto_76

    :catch_73
    invoke-virtual {v1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    :goto_76
    return-void

    :pswitch_77
    iget-object v0, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast v0, Lcf3;

    iget-object p0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast p0, Lmf3;

    iget-object v1, v0, Lcf3;->f:Li9c;

    iget-object v1, v1, Li9c;->d:Ljava/lang/Object;

    check-cast v1, Lye3;

    iget-object v0, v0, Lcf3;->f:Li9c;

    if-eqz v1, :cond_91

    iget-object v0, v0, Li9c;->d:Ljava/lang/Object;

    check-cast v0, Lye3;

    invoke-virtual {v0, p0, v7}, Lye3;->a(Lmf3;Ljava/util/List;)V

    goto :goto_98

    :cond_91
    const-string p0, "BillingClient"

    const-string v0, "No valid listener is set in BroadcastManager"

    invoke-static {p0, v0}, Lcom/google/android/gms/internal/play_billing/zzc;->zzo(Ljava/lang/String;Ljava/lang/String;)V

    :goto_98
    return-void

    :pswitch_99
    iget-object v0, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast v0, Lrop;

    iget-object v0, v0, Lrop;->c:Ljava/lang/Object;

    check-cast v0, Lgpp;

    iget-object v0, v0, Lgpp;->c:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object p0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_ab
    iget-object v0, p0, Lwr9;->b:Ljava/lang/Object;

    invoke-static {v0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    iget-object p0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast p0, Lzcf;

    if-nez v0, :cond_bb

    invoke-interface {p0}, Lzcf;->onSuccess()V

    goto :goto_cc

    :cond_bb
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcm;

    if-nez v0, :cond_c5

    const-string v0, "Sdk initialization error."

    :cond_c5
    const/4 v2, 0x6

    invoke-direct {v1, v2, v0, v6}, Lcm;-><init>(ILjava/lang/String;B)V

    invoke-interface {p0, v1}, Lzcf;->a(Lcm;)V

    :goto_cc
    return-void

    :pswitch_cd
    iget-object v0, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast v0, La3p;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "mraid.setPlacementType(\'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v2, v0, La3p;->k:Z

    if-eqz v2, :cond_df

    const-string v2, "interstitial"

    goto :goto_e1

    :cond_df
    const-string v2, "inline"

    :goto_e1
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\');"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, La3p;->g(Ljava/lang/String;)V

    iget-object p0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast p0, Landroid/webkit/WebView;

    sget-object v1, Lito;->a:[Lito;

    const-string v1, "mraid.logLevel = mraid.LogLevelEnum.NONE;"

    new-instance v2, Lz4d;

    invoke-direct {v2, v3}, Lz4d;-><init>(B)V

    invoke-virtual {p0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    invoke-virtual {v0}, La3p;->y()V

    invoke-virtual {v0}, La3p;->w()V

    invoke-virtual {v0}, La3p;->r()V

    const-string p0, "mraid.fireReadyEvent();"

    invoke-virtual {v0, p0}, La3p;->g(Ljava/lang/String;)V

    iget-boolean p0, v0, La3p;->w:Z

    if-eqz p0, :cond_115

    invoke-virtual {v0}, La3p;->s()V

    :cond_115
    return-void

    :pswitch_116
    iget-object v0, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast v0, Ln1p;

    sget-object v1, Lt0i;->b:Lp0i;

    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Downloading in progress: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast p0, Ljava/io/File;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    new-instance p0, Lq0i;

    invoke-direct {p0, v1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    new-instance v1, Lt0i;

    invoke-direct {v1, p0}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ln1p;->invoke(Ljava/lang/Object;)V

    return-void

    :pswitch_141
    iget-object p0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast p0, Lmrn;

    iget-object p0, p0, Lmrn;->m:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    sget-wide v0, Lmrn;->A:J

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    sget-object v0, Llf1;->d:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v5}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    return-void

    :pswitch_16f
    iget-object v0, p0, Lwr9;->c:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lnh4;

    iget-object p0, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast p0, Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-interface {p0}, Ljava/util/concurrent/Future;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_182

    invoke-virtual {v1, v7}, Lnh4;->d(Ljava/lang/Throwable;)Z

    goto :goto_19c

    :cond_182
    :try_start_182
    sget-object v0, Lt0i;->b:Lp0i;

    invoke-static {p0}, Lx6;->g(Ljava/util/concurrent/Future;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v1, p0}, Lnh4;->resumeWith(Ljava/lang/Object;)V
    :try_end_18b
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_182 .. :try_end_18b} :catch_18c

    goto :goto_19c

    :catch_18c
    move-exception v0

    move-object p0, v0

    sget-object v0, Lt0i;->b:Lp0i;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    new-instance v0, Lq0i;

    invoke-direct {v0, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {v1, v0}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    :goto_19c
    return-void

    :pswitch_19d
    iget-object v0, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast v0, Lb2l;

    iget-object p0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast p0, Lk6l;

    iget-object v1, p0, Lk6l;->o:Lb2l;

    if-eq v0, v1, :cond_1b6

    iget-object p0, p0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1b6

    check-cast v0, Ld7l;

    invoke-virtual {v0}, Ld7l;->dispose()V

    :cond_1b6
    return-void

    :pswitch_1b7
    iget-object v0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast v0, Lcwk;

    iget-object v2, v0, Lcwk;->g:Lqsh;

    iget-object v3, v2, Lqsh;->b:Ljava/lang/Object;

    check-cast v3, Landroid/view/View;

    invoke-virtual {v3, v5}, Landroid/view/View;->setTranslationX(F)V

    iget-object v2, v2, Lqsh;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/browser/chromium/ChromiumContainerView;

    invoke-virtual {v2, v5}, Landroid/view/View;->setTranslationX(F)V

    iget-object v2, v0, Lcwk;->c:Landroid/view/View;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, v0, Lcwk;->a:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-virtual {v2, v3}, Lcom/opera/android/StatusBarDrawingFrameLayout;->setVisibility(I)V

    iget-object p0, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast p0, Lb2l;

    if-eqz p0, :cond_230

    move-object v2, p0

    check-cast v2, Ld7l;

    iget-boolean v3, v2, Ld7l;->m:Z

    if-nez v3, :cond_230

    iget-object v3, v0, Lcwk;->b:Landroid/view/View;

    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V

    new-instance v3, Ls03;

    iget-object v5, v0, Lcwk;->d:Lxt3;

    new-instance v6, Lbwk;

    invoke-direct {v6, v0, v4}, Lbwk;-><init>(Lcwk;B)V

    invoke-direct {v3, v5, v6}, Ls03;-><init>(Lxt3;Lbwk;)V

    iput-object v3, v0, Lcwk;->o:Ls03;

    iget-boolean v4, v2, Ld7l;->m:Z

    if-nez v4, :cond_211

    invoke-virtual {v2}, Ld7l;->n0()Z

    move-result v4

    if-nez v4, :cond_211

    iget-object v2, v2, Ld7l;->j:Le7l;

    invoke-interface {v2}, Lb9l;->c0()Z

    move-result v2

    if-nez v2, :cond_211

    invoke-virtual {v5, v3}, Lxt3;->run(Ljava/lang/Object;)V

    const-wide/16 v4, 0x1388

    invoke-static {v3, v4, v5}, Lvml;->d(Ljava/lang/Runnable;J)V

    goto :goto_214

    :cond_211
    invoke-virtual {v3}, Ls03;->run()V

    :goto_214
    iget-object v2, v0, Lcwk;->h:Lwt3;

    invoke-virtual {v2}, Lwt3;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lk6l;

    invoke-virtual {v2, p0, v1}, Lk6l;->C(Lb2l;I)V

    iget-object p0, v0, Lcwk;->i:Lwv1;

    iget-object p0, p0, Lwv1;->b:Lb6h;

    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorm;

    sget-object v0, Lkr0;->c:Lkr0;

    check-cast p0, Lx5f;

    invoke-virtual {p0, v0}, Lx5f;->L0(Lkr0;)V

    :cond_230
    return-void

    :pswitch_231
    iget-object v0, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast v0, Lshf;

    iget-object v1, p0, Lwr9;->c:Ljava/lang/Object;

    iput-object v1, v0, Lshf;->a:Ljava/lang/Object;

    iget-object v0, v0, Lshf;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/atomic/AtomicReference;

    :cond_23d
    invoke-virtual {v0, p0, v7}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_249

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-eq v1, p0, :cond_23d

    :cond_249
    return-void

    :pswitch_24a
    :try_start_24a
    invoke-virtual {p0}, Lwr9;->a()V
    :try_end_24d
    .catch Ljava/lang/Error; {:try_start_24a .. :try_end_24d} :catch_24e

    return-void

    :catch_24e
    move-exception v0

    iget-object v1, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast v1, La2j;

    iget-object v1, v1, La2j;->b:Ljava/util/ArrayDeque;

    monitor-enter v1

    :try_start_256
    iget-object p0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast p0, La2j;

    iput v4, p0, La2j;->c:I

    monitor-exit v1
    :try_end_25d
    .catchall {:try_start_256 .. :try_end_25d} :catchall_260

    throw v0

    :goto_25e
    :try_start_25e
    monitor-exit v1
    :try_end_25f
    .catchall {:try_start_25e .. :try_end_25f} :catchall_260

    throw p0

    :catchall_260
    move-exception v0

    move-object p0, v0

    goto :goto_25e

    :pswitch_263
    iget-object v0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast v0, Lnh4;

    iget-object p0, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast p0, Ljg8;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0, v1}, Lnh4;->F(Ldx5;Lkotlin/Unit;)V

    return-void

    :pswitch_271
    iget-object v0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast v0, Ls28;

    iget-object v1, v0, Ls28;->e:Ljava/lang/Object;

    check-cast v1, Ll76;

    invoke-virtual {v1}, Ljava/util/AbstractCollection;->clear()V

    invoke-virtual {v0}, Ls28;->d()V

    iget-object p0, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_287
    iget-object v0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast v0, Ls28;

    iget-object v1, v0, Ls28;->e:Ljava/lang/Object;

    check-cast v1, Ll76;

    iget-object p0, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_29c

    invoke-virtual {v1, p0}, Ljava/util/AbstractCollection;->remove(Ljava/lang/Object;)Z

    :cond_29c
    invoke-virtual {v1, p0}, Ll76;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Ls28;->d()V

    return-void

    :pswitch_2a3
    iget-object v0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast v0, Lie2;

    iget-object p0, p0, Lwr9;->b:Ljava/lang/Object;

    iget-object v2, v0, Lie2;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    iget-object v3, v0, Lie2;->f:Lje2;

    if-eqz v2, :cond_2b7

    invoke-virtual {v3, v0, p0}, Lje2;->dispatchOnCancelled(Lie2;Ljava/lang/Object;)V

    goto :goto_2ba

    :cond_2b7
    invoke-virtual {v3, v0, p0}, Lje2;->dispatchOnLoadComplete(Lie2;Ljava/lang/Object;)V

    :goto_2ba
    iput v1, v0, Lie2;->b:I

    return-void

    :pswitch_2bd
    iget-object v0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast v0, Lzdb;

    iget-object v0, v0, Lzdb;->b:Laeb;

    iget-object p0, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast p0, Lksc;

    iget-object v0, v0, Laeb;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v1

    if-nez v1, :cond_2e6

    new-instance v1, Lcom/opera/android/browser/chromium/OperaBrowserContext;

    iget-boolean v1, v0, Lcom/opera/android/browser/chromium/ChromiumContent;->t:Z

    iget-object v2, p0, Lksc;->a:Ljava/lang/String;

    invoke-static {v1, v2}, LJ/N;->MWaTX$e6(ZLjava/lang/Object;)I

    move-result v1

    iput v1, p0, Lksc;->h:I

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    invoke-interface {v0}, Lorg/chromium/content_public/browser/WebContents;->q()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object v0

    invoke-interface {v0, p0}, Lorg/chromium/content_public/browser/NavigationController;->r(Lksc;)Lorg/chromium/content_public/browser/NavigationHandle;

    :cond_2e6
    return-void

    :pswitch_2e7
    iget-object v0, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast v0, Lxoi;

    iget-object p0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast p0, Ls9i;

    const-wide/16 v1, 0x1770

    invoke-virtual {p0, v0, v1, v2}, Ls9i;->S(Lxoi;J)V

    return-void

    :pswitch_2f5
    iget-object v0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast v0, Lbl9;

    iget-object v1, v0, Lbl9;->c:Ljava/lang/Object;

    check-cast v1, Landroidx/fragment/app/w;

    invoke-static {v1, v1}, Lu35;->f(Landroidx/fragment/app/w;Landroidx/fragment/app/w;)Landroidx/fragment/app/a;

    move-result-object v1

    iget-object p0, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/fragment/app/Fragment;

    invoke-virtual {v1, p0}, Landroidx/fragment/app/a;->m(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/a;

    invoke-virtual {v0, v1}, Lbl9;->a(Landroidx/fragment/app/a;)V

    return-void

    :pswitch_30c
    iget-object v0, p0, Lwr9;->c:Ljava/lang/Object;

    iput-object v7, p0, Lwr9;->c:Ljava/lang/Object;

    if-eqz v0, :cond_319

    iget-object p0, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_319
    return-void

    :pswitch_31a
    iget-object v0, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast v0, Lzlj;

    iget-object v1, v0, Lzlj;->a:Labk;

    invoke-virtual {v1}, Labk;->a()V

    iget-object v1, v0, Lzlj;->b:Ljava/lang/Object;

    monitor-enter v1

    :try_start_326
    iget-object v0, p0, Lwr9;->c:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lr38;

    monitor-enter v2
    :try_end_32c
    .catchall {:try_start_326 .. :try_end_32c} :catchall_371

    :try_start_32c
    iget-object v0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast v0, Lr38;

    iget-object v0, v0, Lr38;->a:Lq38;

    iget-object v4, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast v4, Lzlj;

    iget-object v0, v0, Lq38;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    new-instance v5, Lp38;

    sget-object v6, Lpg8;->b:Ln97;

    invoke-direct {v5, v4, v6}, Lp38;-><init>(Lzlj;Ljava/util/concurrent/Executor;)V

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_360

    iget-object v0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast v0, Lr38;

    iget-object v4, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast v4, Lzlj;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_352
    .catchall {:try_start_32c .. :try_end_352} :catchall_36c

    :try_start_352
    iget-object v0, v0, Lr38;->p:Lty9;

    invoke-virtual {v4, v0, v3}, Lzlj;->g(Lty9;I)V
    :try_end_357
    .catchall {:try_start_352 .. :try_end_357} :catchall_358

    goto :goto_360

    :catchall_358
    move-exception v0

    move-object p0, v0

    :try_start_35a
    new-instance v0, Lh94;

    invoke-direct {v0, p0}, Lh94;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :cond_360
    :goto_360
    iget-object p0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast p0, Lr38;

    invoke-virtual {p0}, Lr38;->b()V

    monitor-exit v2
    :try_end_368
    .catchall {:try_start_35a .. :try_end_368} :catchall_36c

    :try_start_368
    monitor-exit v1
    :try_end_369
    .catchall {:try_start_368 .. :try_end_369} :catchall_371

    return-void

    :goto_36a
    :try_start_36a
    monitor-exit v2
    :try_end_36b
    .catchall {:try_start_36a .. :try_end_36b} :catchall_36c

    :try_start_36b
    throw p0

    :catchall_36c
    move-exception v0

    move-object p0, v0

    goto :goto_36a

    :goto_36f
    monitor-exit v1
    :try_end_370
    .catchall {:try_start_36b .. :try_end_370} :catchall_371

    throw p0

    :catchall_371
    move-exception v0

    move-object p0, v0

    goto :goto_36f

    :pswitch_374
    iget-object p0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0, v5}, Landroid/view/View;->setTranslationX(F)V

    invoke-virtual {p0, v5}, Landroid/view/View;->setTranslationY(F)V

    return-void

    :pswitch_37f
    invoke-static {}, Lqs7;->x()Lqs7;

    move-result-object v0

    sget v1, Le17;->d:I

    iget-object v1, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast v1, Lh5o;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast p0, Le17;

    iget-object p0, p0, Le17;->a:Lz3a;

    filled-new-array {v1}, [Lh5o;

    move-result-object v0

    invoke-virtual {p0, v0}, Lz3a;->c([Lh5o;)V

    return-void

    :pswitch_39a
    iget-object v0, p0, Lwr9;->c:Ljava/lang/Object;

    move-object v9, v0

    check-cast v9, Lxr6;

    iget-object p0, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :cond_3a7
    :goto_3a7
    if-ge v6, v0, :cond_427

    invoke-virtual {p0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v6, v6, 0x1

    move-object v10, v1

    check-cast v10, Lvr6;

    iget-object v1, v9, Lxr6;->r:Ljava/util/ArrayList;

    iget-object v3, v10, Lvr6;->a:Landroidx/recyclerview/widget/i;

    if-nez v3, :cond_3ba

    move-object v12, v7

    goto :goto_3bd

    :cond_3ba
    iget-object v3, v3, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    move-object v12, v3

    :goto_3bd
    iget-object v3, v10, Lvr6;->b:Landroidx/recyclerview/widget/i;

    if-eqz v3, :cond_3c4

    iget-object v3, v3, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    goto :goto_3c5

    :cond_3c4
    move-object v3, v7

    :goto_3c5
    if-eqz v12, :cond_3fa

    invoke-virtual {v12}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    iget-short v8, v9, Landroidx/recyclerview/widget/e;->f:S

    int-to-long v13, v8

    invoke-virtual {v4, v13, v14}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v11

    iget-object v4, v10, Lvr6;->a:Landroidx/recyclerview/widget/i;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget v4, v10, Lvr6;->e:I

    iget v8, v10, Lvr6;->c:I

    sub-int/2addr v4, v8

    int-to-float v4, v4

    invoke-virtual {v11, v4}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    iget v4, v10, Lvr6;->f:I

    iget v8, v10, Lvr6;->d:I

    sub-int/2addr v4, v8

    int-to-float v4, v4

    invoke-virtual {v11, v4}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    invoke-virtual {v11, v5}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    new-instance v8, Lur6;

    const/4 v13, 0x0

    invoke-direct/range {v8 .. v13}, Lur6;-><init>(Lxr6;Lvr6;Landroid/view/ViewPropertyAnimator;Landroid/view/View;B)V

    invoke-virtual {v4, v8}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_3fa
    if-eqz v3, :cond_3a7

    invoke-virtual {v3}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v11

    iget-object v4, v10, Lvr6;->b:Landroidx/recyclerview/widget/i;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v11, v5}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    iget-short v4, v9, Landroidx/recyclerview/widget/e;->f:S

    int-to-long v12, v4

    invoke-virtual {v1, v12, v13}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    new-instance v8, Lur6;

    const/4 v13, 0x1

    move-object v12, v3

    invoke-direct/range {v8 .. v13}, Lur6;-><init>(Lxr6;Lvr6;Landroid/view/ViewPropertyAnimator;Landroid/view/View;B)V

    invoke-virtual {v1, v8}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_3a7

    :cond_427
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, v9, Lxr6;->n:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void

    :pswitch_430
    iget-object v0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast v0, Lk5o;

    iget-object v0, v0, Lk5o;->c:Ljava/lang/Object;

    check-cast v0, Luv4;

    iget-object p0, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast p0, Liw4;

    invoke-virtual {v0, p0}, Luv4;->d(Liw4;)V

    iget-object p0, v0, Luv4;->b:Ljava/util/ArrayDeque;

    invoke-virtual {p0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_45d

    invoke-virtual {p0}, Ljava/util/ArrayDeque;->remove()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    invoke-virtual {p0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_45d

    iget-object p0, v0, Luv4;->a:Lrl;

    if-eqz p0, :cond_45d

    invoke-virtual {p0}, Lrl;->run()V

    :cond_45d
    return-void

    :pswitch_45e
    :try_start_45e
    iget-object v0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast v0, Lfr4;

    iget-object v1, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast v1, Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-static {v1}, Lk1g;->F(Ljava/util/concurrent/Future;)Ljava/lang/Object;

    move-result-object v1

    iget-object v0, v0, Lsr9;->b:Ll94;

    if-eqz v0, :cond_48a

    invoke-virtual {v0, v1}, Ll94;->b(Ljava/lang/Object;)Z
    :try_end_471
    .catch Ljava/util/concurrent/CancellationException; {:try_start_45e .. :try_end_471} :catch_483
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_45e .. :try_end_471} :catch_472
    .catchall {:try_start_45e .. :try_end_471} :catchall_491

    goto :goto_48a

    :catch_472
    move-exception v0

    :try_start_473
    iget-object v1, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast v1, Lfr4;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    iget-object v1, v1, Lsr9;->b:Ll94;

    if-eqz v1, :cond_48a

    invoke-virtual {v1, v0}, Ll94;->d(Ljava/lang/Throwable;)Z

    goto :goto_48a

    :catch_483
    iget-object v0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast v0, Lfr4;

    invoke-virtual {v0, v6}, Lfr4;->cancel(Z)Z
    :try_end_48a
    .catchall {:try_start_473 .. :try_end_48a} :catchall_491

    :cond_48a
    :goto_48a
    iget-object p0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast p0, Lfr4;

    iput-object v7, p0, Lfr4;->g:Lcom/google/common/util/concurrent/ListenableFuture;

    return-void

    :catchall_491
    move-exception v0

    iget-object p0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast p0, Lfr4;

    iput-object v7, p0, Lfr4;->g:Lcom/google/common/util/concurrent/ListenableFuture;

    throw v0

    :pswitch_499
    iget-object v0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/content/browser/BrowserStartupControllerImpl;

    iget-boolean v0, v0, Lorg/chromium/content/browser/BrowserStartupControllerImpl;->g:Z

    iget-object p0, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast p0, Lqy3;

    if-eqz v0, :cond_4a9

    invoke-virtual {p0}, Lqy3;->c()V

    goto :goto_4ac

    :cond_4a9
    invoke-virtual {p0}, Lqy3;->a()V

    :goto_4ac
    return-void

    :pswitch_4ad
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Filter "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast v2, Lqzj;

    invoke-virtual {v2}, Lqzj;->key()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " crashed with exception."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object p0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/RuntimeException;

    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :pswitch_4d2
    iget-object v0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast v0, Li5o;

    iget-object v1, v0, Li5o;->b:Ljava/lang/Object;

    check-cast v1, Ljy;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lt9f;

    iget-object v1, v0, Li5o;->j:Ljava/lang/Object;

    check-cast v1, Lsy;

    invoke-virtual {v1}, Lsy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lk5o;

    iget-object v1, v1, Lk5o;->b:Ljava/lang/Object;

    move-object v3, v1

    check-cast v3, Landroid/net/Uri;

    iget-object p0, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast p0, Lr9i;

    iget-object v1, p0, Lr9i;->b:Ljava/lang/Object;

    move-object v4, v1

    check-cast v4, Ljava/lang/String;

    iget-object v1, p0, Lr9i;->c:Ljava/lang/Object;

    move-object v6, v1

    check-cast v6, Ljava/lang/String;

    const-string v7, ""

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    move-object v8, p0

    check-cast v8, Ljava/lang/String;

    iget-object p0, v0, Li5o;->k:Ljava/lang/Object;

    check-cast p0, Lnz;

    if-eqz p0, :cond_50f

    iget-object p0, p0, Lnz;->o:Ljava/lang/String;

    :goto_50d
    move-object v9, p0

    goto :goto_512

    :cond_50f
    const-string p0, ""

    goto :goto_50d

    :goto_512
    const/4 v10, 0x0

    move-object v5, v4

    invoke-static/range {v2 .. v10}, Ljz;->a(Lt9f;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lez;)V

    return-void

    :pswitch_518
    iget-object v0, p0, Lwr9;->c:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lrr9;

    :try_start_51d
    iget-object p0, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast p0, Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-static {p0}, Lk1g;->v(Lcom/google/common/util/concurrent/ListenableFuture;)Ljava/lang/Object;

    move-result-object p0
    :try_end_525
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_51d .. :try_end_525} :catch_52f
    .catch Ljava/lang/RuntimeException; {:try_start_51d .. :try_end_525} :catch_529
    .catch Ljava/lang/Error; {:try_start_51d .. :try_end_525} :catch_529

    invoke-interface {v1, p0}, Lrr9;->onSuccess(Ljava/lang/Object;)V

    goto :goto_53e

    :catch_529
    move-exception v0

    move-object p0, v0

    invoke-interface {v1, p0}, Lrr9;->onFailure(Ljava/lang/Throwable;)V

    goto :goto_53e

    :catch_52f
    move-exception v0

    move-object p0, v0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-nez v0, :cond_53b

    invoke-interface {v1, p0}, Lrr9;->onFailure(Ljava/lang/Throwable;)V

    goto :goto_53e

    :cond_53b
    invoke-interface {v1, v0}, Lrr9;->onFailure(Ljava/lang/Throwable;)V

    :goto_53e
    return-void

    nop

    :pswitch_data_540
    .packed-switch 0x0
        :pswitch_518
        :pswitch_4d2
        :pswitch_4ad
        :pswitch_499
        :pswitch_45e
        :pswitch_430
        :pswitch_39a
        :pswitch_37f
        :pswitch_374
        :pswitch_31a
        :pswitch_30c
        :pswitch_2f5
        :pswitch_2e7
        :pswitch_2bd
        :pswitch_2a3
        :pswitch_287
        :pswitch_271
        :pswitch_263
        :pswitch_24a
        :pswitch_231
        :pswitch_1b7
        :pswitch_19d
        :pswitch_16f
        :pswitch_141
        :pswitch_116
        :pswitch_cd
        :pswitch_ab
        :pswitch_99
        :pswitch_77
    .end packed-switch
.end method

.method public final toString()Ljava/lang/String;
    .registers 4

    iget-byte v0, p0, Lwr9;->a:B

    sparse-switch v0, :sswitch_data_72

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :sswitch_a
    iget-object v0, p0, Lwr9;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Runnable;

    const-string v1, "}"

    if-eqz v0, :cond_24

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v2, "SequentialExecutorWorker{running="

    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_55

    :cond_24
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "SequentialExecutorWorker{state="

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast p0, La2j;

    iget p0, p0, La2j;->c:I

    const/4 v2, 0x1

    if-eq p0, v2, :cond_49

    const/4 v2, 0x2

    if-eq p0, v2, :cond_46

    const/4 v2, 0x3

    if-eq p0, v2, :cond_43

    const/4 v2, 0x4

    if-eq p0, v2, :cond_40

    const-string p0, "null"

    goto :goto_4b

    :cond_40
    const-string p0, "RUNNING"

    goto :goto_4b

    :cond_43
    const-string p0, "QUEUED"

    goto :goto_4b

    :cond_46
    const-string p0, "QUEUING"

    goto :goto_4b

    :cond_49
    const-string p0, "IDLE"

    :goto_4b
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_55
    return-object p0

    :sswitch_56
    new-instance v0, Ljava/lang/StringBuilder;

    const-class v1, Lwr9;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lwr9;->c:Ljava/lang/Object;

    check-cast p0, Lrr9;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :sswitch_data_72
    .sparse-switch
        0x0 -> :sswitch_56
        0x12 -> :sswitch_a
    .end sparse-switch
.end method
