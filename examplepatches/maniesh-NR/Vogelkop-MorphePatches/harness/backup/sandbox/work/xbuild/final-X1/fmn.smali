.class public final synthetic Lfmn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 12
    iput-byte p3, p0, Lfmn;->a:B

    iput-object p1, p0, Lfmn;->b:Ljava/lang/Object;

    iput-object p2, p0, Lfmn;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lwci;Ljava/io/File;I)V
    .registers 4

    const/16 p3, 0x9

    iput-byte p3, p0, Lfmn;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfmn;->b:Ljava/lang/Object;

    iput-object p2, p0, Lfmn;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 18

    move-object/from16 v0, p0

    iget-byte v1, v0, Lfmn;->a:B

    const/4 v2, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x7

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    packed-switch v1, :pswitch_data_53e

    iget-object v1, v0, Lfmn;->b:Ljava/lang/Object;

    move-object v3, v1

    check-cast v3, Lads_mobile_sdk/wt0;

    iget-object v0, v0, Lfmn;->c:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Lc5j;

    iget-object v0, v3, Lads_mobile_sdk/wt0;->c:Ljjc;

    new-instance v2, Lukp;

    const/4 v8, 0x1

    const/4 v5, 0x1

    const-wide/16 v6, 0x0

    invoke-direct/range {v2 .. v8}, Lukp;-><init>(Lads_mobile_sdk/wt0;Lc5j;IJB)V

    invoke-interface {v0, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :pswitch_26
    iget-object v1, v0, Lfmn;->b:Ljava/lang/Object;

    check-cast v1, Li7c;

    iget-object v0, v0, Lfmn;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Runnable;

    invoke-virtual {v1}, Li7c;->a()Ljava/lang/Object;

    if-eqz v0, :cond_36

    invoke-static {v0}, Lgxo;->c(Ljava/lang/Runnable;)V

    :cond_36
    return-void

    :pswitch_37
    iget-object v1, v0, Lfmn;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    iget-object v0, v0, Lfmn;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Runnable;

    new-instance v2, Lqqo;

    const/4 v3, 0x4

    invoke-direct {v2, v1, v3}, Lqqo;-><init>(Ljava/lang/Object;B)V

    invoke-static {v2}, Lads_mobile_sdk/xu0;->a(Lkotlin/jvm/functions/Function0;)V

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1}, Landroid/os/Process;->setThreadPriority(I)V

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_53
    iget-object v1, v0, Lfmn;->b:Ljava/lang/Object;

    check-cast v1, Lg94;

    iget-object v0, v0, Lfmn;->c:Ljava/lang/Object;

    check-cast v0, Lqio;

    invoke-interface {v1, v0}, Lg94;->l(Ljava/lang/Object;)V

    return-void

    :pswitch_5f
    iget-object v1, v0, Lfmn;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v0, v0, Lfmn;->c:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lg94;

    invoke-static {v1}, Lvtp;->t(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_161

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_161

    sget-object v3, Lvtp;->l:Ljava/lang/Object;

    monitor-enter v3

    :try_start_77
    invoke-static {v0}, Lmzg;->b(Ljava/io/File;)Ljava/lang/String;

    move-result-object v5

    monitor-exit v3
    :try_end_7c
    .catchall {:try_start_77 .. :try_end_7c} :catchall_15f

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_14d

    new-instance v3, Ljava/lang/String;

    invoke-static {v5, v6}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v5

    sget-object v6, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v3, v5, v6}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    :try_start_8d
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v3, "endTime"

    invoke-virtual {v5, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v13

    const-string v3, "expireTimestamp"

    invoke-virtual {v5, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v11

    const-wide/16 v8, 0x0

    cmp-long v3, v13, v8

    if-gtz v3, :cond_a6

    move-wide v8, v11

    goto :goto_a7

    :cond_a6
    move-wide v8, v13

    :goto_a7
    invoke-static {}, Lsjo;->o()J

    move-result-wide v15

    cmp-long v3, v15, v8

    if-ltz v3, :cond_dd

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    invoke-static {}, Lsjo;->n()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-static {v1}, Lvtp;->r(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {}, Lsjo;->n()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-static {v1}, Lvtp;->k(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    sget-object v0, Lbm;->j:Lbm;

    new-instance v1, Lzno;

    invoke-direct {v1, v0}, Lzno;-><init>(Lbm;)V

    new-instance v0, Llio;

    invoke-direct {v0, v1}, Llio;-><init>(Ljava/lang/Exception;)V

    goto :goto_135

    :cond_dd
    sget-object v0, Ldro;->c:Ldro;

    invoke-static {v5, v0}, Lpoo;->b(Lorg/json/JSONObject;Ldro;)Llho;

    move-result-object v1

    if-nez v1, :cond_f2

    sget-object v0, Lbm;->l:Lbm;

    new-instance v1, Lzno;

    invoke-direct {v1, v0}, Lzno;-><init>(Lbm;)V

    new-instance v0, Llio;

    invoke-direct {v0, v1}, Llio;-><init>(Ljava/lang/Exception;)V

    goto :goto_135

    :cond_f2
    const-string v3, "placementId"

    invoke-virtual {v5, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget-object v5, v1, Llho;->a:Lxho;

    iget-object v9, v5, Lxho;->a:Lw06;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v5, v9, Ln06;

    if-nez v5, :cond_113

    sget-object v0, Lbm;->k:Lbm;

    new-instance v1, Lzno;

    invoke-direct {v1, v0}, Lzno;-><init>(Lbm;)V

    new-instance v0, Llio;

    invoke-direct {v0, v1}, Llio;-><init>(Ljava/lang/Exception;)V

    invoke-virtual {v9}, Ljava/lang/Enum;->name()Ljava/lang/String;

    goto :goto_135

    :cond_113
    new-instance v8, Lvho;

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10

    new-instance v1, Lpqo;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-byte v4, v1, Lpqo;->e:B

    iput-boolean v7, v1, Lpqo;->f:Z

    iput-object v3, v1, Lpqo;->a:Ljava/lang/String;

    iput-object v0, v1, Lpqo;->d:Ldro;

    new-instance v15, Lpqo;

    invoke-direct {v15, v1}, Lpqo;-><init>(Lpqo;)V

    const/16 v16, 0x0

    invoke-direct/range {v8 .. v16}, Lvho;-><init>(Lw06;Ljava/util/List;JJLpqo;Lfio;)V

    new-instance v0, Lmio;

    invoke-direct {v0, v8}, Lmio;-><init>(Ljava/lang/Object;)V

    :goto_135
    invoke-static {v2, v0}, Lvtp;->m(Lg94;Lqio;)V
    :try_end_138
    .catch Lorg/json/JSONException; {:try_start_8d .. :try_end_138} :catch_139

    goto :goto_16e

    :catch_139
    move-exception v0

    sget-object v1, Lbm;->l:Lbm;

    new-instance v3, Lzno;

    invoke-direct {v3, v1}, Lzno;-><init>(Lbm;)V

    new-instance v1, Llio;

    invoke-direct {v1, v3}, Llio;-><init>(Ljava/lang/Exception;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    invoke-static {v2, v1}, Lvtp;->m(Lg94;Lqio;)V

    goto :goto_16e

    :cond_14d
    sget-object v0, Lbm;->i:Lbm;

    new-instance v1, Lzno;

    invoke-direct {v1, v0}, Lzno;-><init>(Lbm;)V

    new-instance v0, Llio;

    invoke-direct {v0, v1}, Llio;-><init>(Ljava/lang/Exception;)V

    :goto_159
    invoke-static {v2, v0}, Lvtp;->m(Lg94;Lqio;)V

    goto :goto_16e

    :goto_15d
    :try_start_15d
    monitor-exit v3
    :try_end_15e
    .catchall {:try_start_15d .. :try_end_15e} :catchall_15f

    throw v0

    :catchall_15f
    move-exception v0

    goto :goto_15d

    :cond_161
    sget-object v0, Lbm;->i:Lbm;

    new-instance v1, Lzno;

    invoke-direct {v1, v0}, Lzno;-><init>(Lbm;)V

    new-instance v0, Llio;

    invoke-direct {v0, v1}, Llio;-><init>(Ljava/lang/Exception;)V

    goto :goto_159

    :goto_16e
    return-void

    :pswitch_16f
    iget-object v1, v0, Lfmn;->b:Ljava/lang/Object;

    check-cast v1, Lads_mobile_sdk/g43;

    iget-object v0, v0, Lfmn;->c:Ljava/lang/Object;

    check-cast v0, Lads_mobile_sdk/xk2;

    iget-object v2, v1, Lads_mobile_sdk/g43;->a:Lads_mobile_sdk/vn3;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v4, v2, Lads_mobile_sdk/vn3;->c:Lads_mobile_sdk/z6;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    :try_start_182
    invoke-virtual {v2, v0}, Lads_mobile_sdk/vn3;->a(Lads_mobile_sdk/xk2;)Lads_mobile_sdk/cm1;

    move-result-object v7

    invoke-virtual {v2, v7}, Lads_mobile_sdk/vn3;->a(Lads_mobile_sdk/cm1;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    sub-long v11, v7, v5

    iget-object v9, v4, Lads_mobile_sdk/z6;->a:Lads_mobile_sdk/qm1;

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/16 v10, 0xbb8

    invoke-virtual/range {v9 .. v14}, Lads_mobile_sdk/qm1;->a(IJLjava/lang/Throwable;Ljava/lang/String;)V

    new-instance v2, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v2}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, v7}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    invoke-virtual {v2}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;
    :try_end_1a5
    .catch Lads_mobile_sdk/tn3; {:try_start_182 .. :try_end_1a5} :catch_1cb
    .catch Ljava/lang/Exception; {:try_start_182 .. :try_end_1a5} :catch_1bf

    iget-object v1, v1, Lads_mobile_sdk/g43;->f:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "2.945319811."

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, v0, Lads_mobile_sdk/xk2;->a:Lads_mobile_sdk/kl2;

    invoke-virtual {v0}, Lads_mobile_sdk/kl2;->r()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    return-void

    :catch_1bf
    move-exception v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    sub-long/2addr v1, v5

    const/16 v5, 0xfaa

    invoke-virtual {v4, v5, v1, v2, v0}, Lads_mobile_sdk/z6;->a(IJLjava/lang/Exception;)V

    goto :goto_1d6

    :catch_1cb
    move-exception v0

    iget-short v1, v0, Lads_mobile_sdk/tn3;->a:S

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    sub-long/2addr v7, v5

    invoke-virtual {v4, v1, v7, v8, v0}, Lads_mobile_sdk/z6;->a(IJLjava/lang/Exception;)V

    :goto_1d6
    new-instance v0, Le22;

    invoke-direct {v0, v3}, Le22;-><init>(I)V

    throw v0

    :pswitch_1dc
    iget-object v1, v0, Lfmn;->b:Ljava/lang/Object;

    check-cast v1, Lg94;

    iget-object v0, v0, Lfmn;->c:Ljava/lang/Object;

    invoke-interface {v1, v0}, Lg94;->l(Ljava/lang/Object;)V

    return-void

    :pswitch_1e6
    iget-object v1, v0, Lfmn;->b:Ljava/lang/Object;

    check-cast v1, Lads_mobile_sdk/ew1;

    iget-object v0, v0, Lfmn;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    monitor-enter v1

    :try_start_1ef
    iget-object v2, v1, Lads_mobile_sdk/ew1;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2
    :try_end_1f5
    .catchall {:try_start_1ef .. :try_end_1f5} :catchall_219

    if-eqz v2, :cond_1f9

    monitor-exit v1

    goto :goto_218

    :cond_1f9
    :try_start_1f9
    iget-object v2, v1, Lads_mobile_sdk/ew1;->c:Landroid/widget/FrameLayout;

    if-eqz v2, :cond_217

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    if-eqz v3, :cond_217

    new-instance v4, Landroid/widget/FrameLayout;

    invoke-direct {v4, v3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v6, -0x1

    invoke-direct {v5, v6, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {v3, v4, v0}, Lxug;->d(Landroid/content/Context;Landroid/view/View;Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V
    :try_end_217
    .catchall {:try_start_1f9 .. :try_end_217} :catchall_219

    :cond_217
    monitor-exit v1

    :goto_218
    return-void

    :catchall_219
    move-exception v0

    monitor-exit v1

    throw v0

    :pswitch_21c
    iget-object v1, v0, Lfmn;->b:Ljava/lang/Object;

    check-cast v1, Lev4;

    iget-object v0, v0, Lfmn;->c:Ljava/lang/Object;

    check-cast v0, Ljro;

    iget-object v1, v1, Lev4;->f:Ljava/lang/Object;

    check-cast v1, Lpjo;

    iget-object v2, v1, Lpjo;->c:Ljava/util/concurrent/Semaphore;

    iget-object v3, v0, Ljro;->b:Ljava/lang/String;

    iget-object v4, v0, Ljro;->f:Ljava/io/File;

    if-eqz v4, :cond_252

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_240

    iget-object v0, v0, Ljro;->e:Lwci;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v7}, Lwci;->n(Ljava/lang/String;Z)V

    goto :goto_252

    :cond_240
    :try_start_240
    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->acquire()V

    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v3

    invoke-virtual {v1, v3, v0, v4}, Lpjo;->b(Ljava/net/URLConnection;Ljro;Ljava/io/File;)V
    :try_end_24f
    .catchall {:try_start_240 .. :try_end_24f} :catchall_24f

    :catchall_24f
    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V

    :cond_252
    :goto_252
    return-void

    :pswitch_253
    iget-object v1, v0, Lfmn;->b:Ljava/lang/Object;

    check-cast v1, Lroj;

    iget-object v0, v0, Lfmn;->c:Ljava/lang/Object;

    check-cast v0, Ljava/io/File;

    invoke-virtual {v1, v0}, Lroj;->l(Ljava/lang/Object;)V

    return-void

    :pswitch_25f
    iget-object v1, v0, Lfmn;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v0, v0, Lfmn;->c:Ljava/lang/Object;

    check-cast v0, Lroj;

    invoke-static {v7, v1}, Lsjo;->c(ILjava/lang/String;)Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_277

    new-instance v2, Lfmn;

    const/16 v3, 0xe

    invoke-direct {v2, v0, v1, v3}, Lfmn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2}, Lgxo;->c(Ljava/lang/Runnable;)V

    :cond_277
    return-void

    :pswitch_278
    iget-object v1, v0, Lfmn;->b:Ljava/lang/Object;

    check-cast v1, Liro;

    iget-object v0, v0, Lfmn;->c:Ljava/lang/Object;

    check-cast v0, Ljava/io/IOException;

    iget-object v1, v1, Liro;->b:Lrii;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    iget-object v0, v1, Lrii;->b:Ljava/lang/Object;

    check-cast v0, Lyhp;

    iget-object v1, v0, Lyhp;->a:Laip;

    iput v4, v1, Laip;->e:I

    iget v2, v1, Laip;->i:I

    add-int/2addr v2, v7

    iput v2, v1, Laip;->i:I

    invoke-virtual {v0}, Lyhp;->a()V

    return-void

    :pswitch_296
    iget-object v1, v0, Lfmn;->b:Ljava/lang/Object;

    check-cast v1, Lhoo;

    iget-object v0, v0, Lfmn;->c:Ljava/lang/Object;

    check-cast v0, Lqio;

    iget-object v2, v1, Lhoo;->d:Lmjo;

    invoke-interface {v2, v0}, Lmjo;->d(Lqio;)V

    iget-object v0, v1, Lhoo;->c:Landroid/os/Handler;

    iget-object v1, v1, Lhoo;->b:Lssi;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void

    :pswitch_2ab
    iget-object v1, v0, Lfmn;->b:Ljava/lang/Object;

    check-cast v1, Liro;

    iget-object v0, v0, Lfmn;->c:Ljava/lang/Object;

    check-cast v0, [B

    iget-object v1, v1, Liro;->b:Lrii;

    iget-object v1, v1, Lrii;->b:Ljava/lang/Object;

    check-cast v1, Lyhp;

    iget-object v2, v1, Lyhp;->a:Laip;

    iput-object v0, v2, Laip;->j:[B

    if-nez v0, :cond_2c8

    const/4 v0, 0x6

    iput v0, v2, Laip;->e:I

    iget v0, v2, Laip;->i:I

    add-int/2addr v0, v7

    iput v0, v2, Laip;->i:I

    goto :goto_2d2

    :cond_2c8
    iput v7, v2, Laip;->e:I

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    iget-object v0, v1, Lyhp;->a:Laip;

    iget-object v0, v0, Laip;->j:[B

    array-length v0, v0

    :goto_2d2
    invoke-virtual {v1}, Lyhp;->a()V

    return-void

    :pswitch_2d6
    iget-object v1, v0, Lfmn;->b:Ljava/lang/Object;

    check-cast v1, Lwci;

    iget-object v0, v0, Lfmn;->c:Ljava/lang/Object;

    check-cast v0, Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v6}, Lwci;->n(Ljava/lang/String;Z)V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    return-void

    :pswitch_2e9
    iget-object v1, v0, Lfmn;->b:Ljava/lang/Object;

    check-cast v1, Lr22;

    iget-object v0, v0, Lfmn;->c:Ljava/lang/Object;

    check-cast v0, Livo;

    iget-object v3, v1, Lr22;->d:Ljava/lang/Object;

    check-cast v3, Lwtm;

    iget-object v1, v1, Lr22;->a:Ljava/lang/Object;

    check-cast v1, Lpro;

    new-instance v4, Lkgo;

    invoke-direct {v4, v0, v6}, Lkgo;-><init>(Ljava/lang/Object;B)V

    iget-object v0, v3, Lwtm;->c:Ljava/lang/Object;

    check-cast v0, Lrgh;

    new-instance v6, Lvdi;

    const/16 v7, 0x11

    invoke-direct {v6, v3, v1, v4, v7}, Lvdi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object v3, Loxo;->a:Loxo;

    iget-object v3, v0, Lrgh;->a:Ljava/lang/Object;

    move-object v13, v3

    check-cast v13, Landroid/content/Context;

    iget-object v15, v1, Lpro;->e:Ljava/lang/String;

    iget-object v8, v1, Lpro;->b:Lsm;

    iget-object v3, v1, Lpro;->a:Ljava/lang/String;

    iget-object v9, v1, Lpro;->c:Leq;

    iget-object v11, v1, Lpro;->d:Lwjo;

    iget-object v14, v1, Lpro;->f:Ljava/lang/Boolean;

    new-instance v12, Lako;

    new-instance v4, Livg;

    iget-object v0, v0, Lrgh;->b:Ljava/lang/Object;

    check-cast v0, Lqro;

    const/16 v7, 0x10

    invoke-direct {v4, v0, v1, v7}, Livg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v12, v6, v4}, Lako;-><init>(Lvdi;Livg;)V

    sget-object v0, Lw2p;->a:La64;

    new-instance v7, Laxo;

    const/4 v10, 0x0

    move-object/from16 v16, v3

    invoke-direct/range {v7 .. v16}, Laxo;-><init>(Lsm;Leq;Lmt5;Lwjo;Lako;Landroid/content/Context;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, v5, v5, v7, v2}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void

    :pswitch_33a
    iget-object v1, v0, Lfmn;->b:Ljava/lang/Object;

    check-cast v1, Laco;

    iget-object v0, v0, Lfmn;->c:Ljava/lang/Object;

    check-cast v0, Lw7j;

    invoke-virtual {v1, v5, v7}, Laco;->m(Ljava/lang/Integer;Z)V

    iget-object v2, v1, Laco;->a:Landroid/content/Context;

    invoke-virtual {v0, v2}, Lw7j;->h(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_397

    iget-object v0, v1, Laco;->k:Lw7j;

    iget-object v0, v0, Lw7j;->b:Ljava/lang/Object;

    iget-object v3, v1, Laco;->b:Lz4k;

    iget-object v4, v1, Laco;->c:Lzv9;

    iget-object v8, v1, Laco;->d:Ljg8;

    const-string v9, "createStateBuilder"

    const-class v10, Landroid/content/Context;

    const-class v11, Lffn;

    const-class v12, Lzv9;

    const-class v13, Ldx5;

    filled-new-array {v10, v11, v12, v13}, [Ljava/lang/Class;

    move-result-object v10

    filled-new-array {v2, v3, v4, v8}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v9, v10, v2}, Lmzg;->j(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgfn;

    iput-object v0, v1, Laco;->e:Lgfn;

    iget v2, v1, Laco;->f:I

    if-eqz v2, :cond_37a

    invoke-interface {v0, v2}, Lgfn;->c(I)Lgfn;

    iput v6, v1, Laco;->f:I

    :cond_37a
    iget-object v0, v1, Laco;->g:Lzbo;

    if-eqz v0, :cond_38b

    iget-object v2, v1, Laco;->e:Lgfn;

    iget-object v3, v0, Lzbo;->a:Ljava/lang/String;

    iget-object v4, v0, Lzbo;->b:Ljava/lang/String;

    iget-wide v8, v0, Lzbo;->c:J

    invoke-interface {v2, v8, v9, v3, v4}, Lgfn;->a(JLjava/lang/String;Ljava/lang/String;)Lgfn;

    iput-object v5, v1, Laco;->g:Lzbo;

    :cond_38b
    iget-boolean v0, v1, Laco;->i:Z

    if-eqz v0, :cond_3a1

    iget-object v0, v1, Laco;->e:Lgfn;

    invoke-interface {v0, v7}, Lgfn;->setEnabled(Z)Lgfn;

    iput-boolean v6, v1, Laco;->i:Z

    goto :goto_3a1

    :cond_397
    new-instance v0, Lq6;

    const-string v2, "cannot load implementation"

    invoke-direct {v0, v2}, Lq6;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Laco;->p(Ljava/lang/Throwable;)V

    :cond_3a1
    :goto_3a1
    return-void

    :pswitch_3a2
    iget-object v1, v0, Lfmn;->b:Ljava/lang/Object;

    check-cast v1, Lw7o;

    iget-object v0, v0, Lfmn;->c:Ljava/lang/Object;

    check-cast v0, Ltcc;

    iget-boolean v2, v1, Lw7o;->c:Z

    if-nez v2, :cond_3b3

    iput-object v0, v1, Lw7o;->d:Ltcc;

    invoke-virtual {v0, v1}, Ltcc;->a(Lmdc;)V

    :cond_3b3
    return-void

    :pswitch_3b4
    iget-object v1, v0, Lfmn;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/api/Callback;

    iget-object v0, v0, Lfmn;->c:Ljava/lang/Object;

    check-cast v0, Lwyn;

    new-instance v2, Lvyn;

    invoke-static {}, Ltz5;->b()Ljava/lang/String;

    move-result-object v3

    iget-object v4, v0, Lwyn;->a:Ldj9;

    invoke-virtual {v4}, Lno7;->i()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcj9;

    iget-object v4, v4, Lcj9;->a:Ljava/lang/String;

    if-nez v4, :cond_3d0

    const-string v4, ""

    :cond_3d0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v5

    iget-object v6, v0, Lwyn;->b:Lhv1;

    invoke-virtual {v6}, Lhv1;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    iget-object v0, v0, Lwyn;->c:Lhv1;

    invoke-virtual {v0}, Lhv1;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Ljava/lang/String;

    invoke-direct/range {v2 .. v7}, Lvyn;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_3f0
    iget-object v1, v0, Lfmn;->b:Ljava/lang/Object;

    check-cast v1, Landroidx/webkit/WebViewCompat$WebViewStartUpCallback;

    iget-object v0, v0, Lfmn;->c:Ljava/lang/Object;

    check-cast v0, Landroidx/webkit/WebViewStartUpResult;

    sget-object v2, Landroidx/webkit/WebViewCompat;->a:Landroid/net/Uri;

    invoke-interface {v1, v0}, Landroidx/webkit/WebViewCompat$WebViewStartUpCallback;->onSuccess(Landroidx/webkit/WebViewStartUpResult;)V

    return-void

    :pswitch_3fe
    iget-object v1, v0, Lfmn;->b:Ljava/lang/Object;

    check-cast v1, Lztn;

    iget-object v0, v0, Lfmn;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/history/g;

    iget-object v0, v0, Lcom/opera/android/history/g;->b:Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    invoke-interface {v0}, Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;->getId()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Long;

    move-result-object v0

    invoke-static {v0}, Lj95;->j([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v1, v0}, Lztn;->L(Ljava/util/List;)V

    return-void

    :pswitch_41c
    iget-object v1, v0, Lfmn;->b:Ljava/lang/Object;

    check-cast v1, Lztn;

    iget-object v0, v0, Lfmn;->c:Ljava/lang/Object;

    check-cast v0, Lwtn;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, v0, Lwtn;->f:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    :goto_42f
    if-ge v6, v3, :cond_445

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v6, v6, 0x1

    check-cast v4, Lvtn;

    invoke-virtual {v4}, Lvtn;->c()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_42f

    :cond_445
    invoke-virtual {v1, v2}, Lztn;->L(Ljava/util/List;)V

    return-void

    :pswitch_449
    iget-object v1, v0, Lfmn;->b:Ljava/lang/Object;

    check-cast v1, Ljmn;

    iget-object v0, v0, Lfmn;->c:Ljava/lang/Object;

    check-cast v0, Lw0a;

    sget-object v3, Lhjm;->b:Lhjm;

    invoke-virtual {v0, v3, v2}, Lo93;->b(Lhjm;I)V

    iput-boolean v6, v1, Ljmn;->N:Z

    iget-boolean v0, v1, Ljmn;->O:Z

    if-eqz v0, :cond_461

    iput-boolean v6, v1, Ljmn;->O:Z

    invoke-virtual {v1}, Ljmn;->g0()V

    :cond_461
    return-void

    :pswitch_462
    const-string v1, "lock_screen_wallpaper_id"

    const-string v2, "home_screen_wallpaper_id"

    iget-object v4, v0, Lfmn;->b:Ljava/lang/Object;

    check-cast v4, Ljmn;

    iget-object v0, v0, Lfmn;->c:Ljava/lang/Object;

    check-cast v0, Lkkn;

    iget-object v8, v4, Ljmn;->v:Landroid/graphics/Bitmap;

    iget-object v9, v4, Ljmn;->s:Lonn;

    :try_start_472
    iget-object v10, v4, Ljmn;->A:Lw6j;

    new-instance v11, Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v12

    invoke-static {v12}, Lr9n;->o(Landroidx/fragment/app/r;)I

    move-result v12

    invoke-virtual {v4}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v13

    invoke-static {v13}, Lr9n;->m(Landroidx/fragment/app/r;)I

    move-result v13

    invoke-direct {v11, v6, v6, v12, v13}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v12

    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v13

    invoke-virtual {v10, v11, v12, v13}, Lw6j;->g(Landroid/graphics/Rect;II)Landroid/graphics/Rect;

    move-result-object v10

    iget-object v11, v4, Ljmn;->A:Lw6j;

    iget-object v11, v11, Lw6j;->a:Ljava/lang/Object;

    check-cast v11, Lzjn;

    iget v11, v11, Lzjn;->a:F

    const/high16 v12, 0x3f800000    # 1.0f

    cmpl-float v11, v11, v12

    if-lez v11, :cond_4a4

    move v6, v7

    :cond_4a4
    invoke-virtual {v4}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v11

    invoke-static {v11, v8, v0, v10, v6}, Lr9n;->P(Landroid/content/Context;Landroid/graphics/Bitmap;Lkkn;Landroid/graphics/Rect;Z)I

    move-result v6

    if-lez v6, :cond_535

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v8

    if-eqz v8, :cond_503

    if-eq v8, v7, :cond_4ef

    if-ne v8, v3, :cond_516

    invoke-virtual {v4}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v6

    invoke-virtual {v6, v7}, Landroid/app/WallpaperManager;->getWallpaperId(I)I

    move-result v8

    invoke-virtual {v6, v3}, Landroid/app/WallpaperManager;->getWallpaperId(I)I

    move-result v6

    iget-object v10, v9, Lonn;->b:Lb59;

    invoke-virtual {v10}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/content/SharedPreferences;

    invoke-interface {v10}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v10

    invoke-interface {v10, v2, v8}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object v2, v9, Lonn;->b:Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2, v1, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_516

    :cond_4ef
    iget-object v2, v9, Lonn;->b:Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2, v1, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_516

    :cond_503
    iget-object v1, v9, Lonn;->b:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v2, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_516
    :goto_516
    iget-object v1, v4, Ljmn;->x:Laln;

    invoke-virtual {v4}, Ljmn;->H0()I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_52c

    if-eq v0, v7, :cond_529

    if-ne v0, v3, :cond_52e

    sget-object v5, Liu0;->e:Liu0;

    goto :goto_52e

    :cond_529
    sget-object v5, Liu0;->c:Liu0;

    goto :goto_52e

    :cond_52c
    sget-object v5, Liu0;->d:Liu0;

    :cond_52e
    :goto_52e
    invoke-virtual {v9, v1, v2, v5}, Lonn;->c(Laln;ILiu0;)V

    invoke-virtual {v9}, Lonn;->a()V

    goto :goto_53c

    :cond_535
    invoke-virtual {v4}, Ljmn;->L0()V
    :try_end_538
    .catch Ljava/lang/Exception; {:try_start_472 .. :try_end_538} :catch_539

    goto :goto_53c

    :catch_539
    invoke-virtual {v4}, Ljmn;->L0()V

    :goto_53c
    return-void

    nop

    :pswitch_data_53e
    .packed-switch 0x0
        :pswitch_462
        :pswitch_449
        :pswitch_41c
        :pswitch_3fe
        :pswitch_3f0
        :pswitch_3b4
        :pswitch_3a2
        :pswitch_33a
        :pswitch_2e9
        :pswitch_2d6
        :pswitch_2ab
        :pswitch_296
        :pswitch_278
        :pswitch_25f
        :pswitch_253
        :pswitch_21c
        :pswitch_1e6
        :pswitch_1dc
        :pswitch_16f
        :pswitch_5f
        :pswitch_53
        :pswitch_37
        :pswitch_26
    .end packed-switch
.end method
