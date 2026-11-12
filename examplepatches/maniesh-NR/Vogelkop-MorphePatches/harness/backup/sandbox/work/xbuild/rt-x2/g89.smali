.class public final Lg89;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lx5f;

.field public final b:Lesg;

.field public final c:Lydj;

.field public final d:Lrsp;

.field public e:Lcom/google/android/gms/tasks/Task;

.field public f:Le89;

.field public g:Lfu1;

.field public h:Lcom/google/android/play/core/install/zza;

.field public i:Z

.field public final j:Lode;

.field public final k:Ljava/lang/Object;

.field public l:Z

.field public m:Lf89;

.field public n:Ljava/lang/Integer;

.field public final o:Ljdj;

.field public final p:Lplh;


# direct methods
.method public constructor <init>(Lx5f;Lnv1;Lesg;Lov1;Lydj;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lg89;->a:Lx5f;

    iput-object p3, p0, Lg89;->b:Lesg;

    iput-object p5, p0, Lg89;->c:Lydj;

    invoke-virtual {p2}, Lnv1;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lrsp;

    iput-object p1, p0, Lg89;->d:Lrsp;

    new-instance p1, Lode;

    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lg89;->j:Lode;

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lg89;->k:Ljava/lang/Object;

    sget-object p1, Lf89;->a:Lf89;

    iput-object p1, p0, Lg89;->m:Lf89;

    const/16 p1, 0x10

    sget-object p2, Lh04;->a:Lh04;

    const/4 p4, 0x0

    invoke-static {p4, p1, p2}, Lipe;->b(IILh04;)Ljdj;

    move-result-object p1

    iput-object p1, p0, Lg89;->o:Ljdj;

    invoke-static {p1}, La26;->i(Ljdj;)Lplh;

    move-result-object p1

    iput-object p1, p0, Lg89;->p:Lplh;

    new-instance p1, Lbn7;

    const/16 p2, 0x1c

    invoke-direct {p1, p0, p2}, Lbn7;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p3, Lesg;->b:Ljava/lang/Object;

    check-cast p0, Lumi;

    new-instance p2, Lbi2;

    const/16 p4, 0xf

    invoke-direct {p2, p3, p1, p4}, Lbi2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {p0, p2}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method


# virtual methods
.method public final a(Lt5d;)V
    .registers 8

    iget-object v0, p0, Lg89;->c:Lydj;

    iget-object v0, v0, Lydj;->a:Lru9;

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "update.flexible.dialog_shown"

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/32 v4, 0x240c8400

    add-long/2addr v0, v4

    cmp-long v0, v0, v2

    if-gez v0, :cond_1e

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lg89;->b(Lt5d;Z)V

    :cond_1e
    return-void
.end method

.method public final b(Lt5d;Z)V
    .registers 16

    iget-object v0, p0, Lg89;->g:Lfu1;

    iget-object v1, p0, Lg89;->j:Lode;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7a

    if-eqz v0, :cond_7a

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-object v2, p0, Lg89;->c:Lydj;

    iget-object v2, v2, Lydj;->a:Lru9;

    invoke-virtual {v2}, Lru9;->b()Lnv6;

    move-result-object v2

    iget-object v6, v2, Lnv6;->a:Ljava/lang/Object;

    check-cast v6, Landroid/content/SharedPreferences$Editor;

    const-string v7, "update.flexible.dialog_shown"

    invoke-interface {v6, v7, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v2}, Lnv6;->w()V

    sget-object v2, Lmdb;->b:Ljava/util/Random;

    invoke-virtual {v2}, Ljava/util/Random;->nextInt()I

    move-result v2

    const v4, 0xffff

    and-int v7, v2, v4

    invoke-virtual {v1, v3}, Lekc;->r(Ljava/lang/Object;)V

    const/4 v2, 0x0

    iput-object v2, p0, Lg89;->g:Lfu1;

    iput-object v2, p0, Lg89;->h:Lcom/google/android/play/core/install/zza;

    new-instance v3, Ld89;

    invoke-direct {v3, p0, p2}, Ld89;-><init>(Lg89;Z)V

    iget-object p2, p1, Lhjf;->c:Ljava/util/HashMap;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p2, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :try_start_4b
    iget-object p2, p0, Lg89;->d:Lrsp;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p2, v0, Lfu1;->d:Landroid/app/PendingIntent;

    if-eqz p2, :cond_56

    move-object v3, p2

    goto :goto_57

    :cond_56
    move-object v3, v2

    :goto_57
    if-eqz v3, :cond_7f

    iget-boolean v3, v0, Lfu1;->e:Z

    if-nez v3, :cond_7f

    const/4 v3, 0x1

    iput-boolean v3, v0, Lfu1;->e:Z

    if-eqz p2, :cond_63

    move-object v2, p2

    :cond_63
    invoke-virtual {v2}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object v6

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v5, p1

    invoke-virtual/range {v5 .. v12}, Lxd5;->startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;IIILandroid/os/Bundle;)V
    :try_end_70
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_4b .. :try_end_70} :catch_71

    return-void

    :catch_71
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, p1}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lg89;->c()V

    return-void

    :cond_7a
    if-nez v0, :cond_7f

    invoke-virtual {p0}, Lg89;->c()V

    :cond_7f
    return-void
.end method

.method public final c()V
    .registers 13

    iget-boolean v0, p0, Lg89;->i:Z

    iget-object v1, p0, Lg89;->f:Le89;

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-nez v0, :cond_45

    if-eqz v1, :cond_30

    iget-object v4, p0, Lg89;->d:Lrsp;

    monitor-enter v4

    :try_start_d
    iget-object v5, v4, Lrsp;->b:Lerp;

    monitor-enter v5
    :try_end_10
    .catchall {:try_start_d .. :try_end_10} :catchall_2d

    :try_start_10
    iget-object v0, v5, Lerp;->a:Lr40;

    const-string v6, "unregisterListener"

    new-array v7, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v6, v7}, Lr40;->f(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, v5, Lerp;->d:Ljava/util/HashSet;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v5}, Lerp;->a()V
    :try_end_21
    .catchall {:try_start_10 .. :try_end_21} :catchall_28

    :try_start_21
    monitor-exit v5
    :try_end_22
    .catchall {:try_start_21 .. :try_end_22} :catchall_2d

    monitor-exit v4

    iput-object v3, p0, Lg89;->f:Le89;

    goto :goto_30

    :goto_26
    :try_start_26
    monitor-exit v5
    :try_end_27
    .catchall {:try_start_26 .. :try_end_27} :catchall_28

    :try_start_27
    throw p0

    :catchall_28
    move-exception v0

    move-object p0, v0

    goto :goto_26

    :goto_2b
    monitor-exit v4
    :try_end_2c
    .catchall {:try_start_27 .. :try_end_2c} :catchall_2d

    throw p0

    :catchall_2d
    move-exception v0

    move-object p0, v0

    goto :goto_2b

    :cond_30
    :goto_30
    iput-object v3, p0, Lg89;->g:Lfu1;

    iput-object v3, p0, Lg89;->h:Lcom/google/android/play/core/install/zza;

    iget-object v1, p0, Lg89;->k:Ljava/lang/Object;

    monitor-enter v1

    :try_start_37
    iput-boolean v2, p0, Lg89;->l:Z

    iput-object v3, p0, Lg89;->n:Ljava/lang/Integer;

    sget-object v0, Lf89;->a:Lf89;

    iput-object v0, p0, Lg89;->m:Lf89;
    :try_end_3f
    .catchall {:try_start_37 .. :try_end_3f} :catchall_41

    monitor-exit v1

    return-void

    :catchall_41
    move-exception v0

    move-object p0, v0

    monitor-exit v1

    throw p0

    :cond_45
    if-nez v1, :cond_53

    new-instance v0, Le89;

    invoke-direct {v0, p0}, Le89;-><init>(Lg89;)V

    iput-object v0, p0, Lg89;->f:Le89;

    iget-object v1, p0, Lg89;->d:Lrsp;

    invoke-virtual {v1, v0}, Lrsp;->a(Le89;)V

    :cond_53
    sget-object v0, Lf89;->a:Lf89;

    iget-object v1, p0, Lg89;->j:Lode;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    const/16 v4, 0xb

    const/16 v5, 0xa

    const/4 v6, 0x1

    if-eqz v1, :cond_6d

    sget-object v1, Lf89;->b:Lf89;

    :goto_6a
    move v2, v6

    goto/16 :goto_115

    :cond_6d
    iget-object v1, p0, Lg89;->g:Lfu1;

    if-nez v1, :cond_e4

    iget-object v0, p0, Lg89;->e:Lcom/google/android/gms/tasks/Task;

    if-nez v0, :cond_153

    iget-object v0, p0, Lg89;->d:Lrsp;

    iget-object v1, v0, Lrsp;->a:Ljup;

    iget-object v0, v0, Lrsp;->c:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    iget-object v7, v1, Ljup;->a:Lbvp;

    if-nez v7, :cond_ad

    sget-object v0, Ljup;->e:Lr40;

    const/16 v1, -0x9

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const-string v3, "onError(%d)"

    const-string v6, "PlayCore"

    const/4 v7, 0x6

    invoke-static {v6, v7}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_a0

    iget-object v0, v0, Lr40;->b:Ljava/lang/String;

    invoke-static {v0, v3, v2}, Lr40;->g(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    goto :goto_a3

    :cond_a0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_a3
    new-instance v0, Lgab;

    invoke-direct {v0, v1}, Lgab;-><init>(I)V

    invoke-static {v0}, Lcom/google/android/gms/tasks/Tasks;->forException(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    goto :goto_d4

    :cond_ad
    sget-object v2, Ljup;->e:Lr40;

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v3

    const-string v6, "requestUpdateInfo(%s)"

    invoke-virtual {v2, v6, v3}, Lr40;->f(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v8, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v8}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    new-instance v10, Lrtp;

    invoke-direct {v10, v1, v8, v0, v8}, Lrtp;-><init>(Ljup;Lcom/google/android/gms/tasks/TaskCompletionSource;Ljava/lang/String;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    new-instance v6, Lrtp;

    const/4 v11, 0x2

    move-object v9, v8

    invoke-direct/range {v6 .. v11}, Lrtp;-><init>(Ljava/lang/Object;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/android/gms/tasks/TaskCompletionSource;Ljava/lang/Object;B)V

    invoke-virtual {v7}, Lbvp;->a()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    invoke-virtual {v8}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    :goto_d4
    iput-object v0, p0, Lg89;->e:Lcom/google/android/gms/tasks/Task;

    new-instance v1, Ltu7;

    invoke-direct {v1, p0, v4}, Ltu7;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lbm8;

    invoke-direct {p0, v1, v5}, Lbm8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p0}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    return-void

    :cond_e4
    iget v7, v1, Lfu1;->b:I

    const/4 v8, 0x2

    if-eq v7, v8, :cond_104

    const/4 v8, 0x3

    if-ne v7, v8, :cond_114

    iget v2, v1, Lfu1;->a:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget v1, v1, Lfu1;->c:I

    if-eq v1, v5, :cond_111

    if-eq v1, v4, :cond_100

    packed-switch v1, :pswitch_data_158

    goto :goto_111

    :pswitch_fc
    sget-object v1, Lf89;->b:Lf89;

    goto/16 :goto_6a

    :cond_100
    sget-object v1, Lf89;->c:Lf89;

    goto/16 :goto_6a

    :cond_104
    iget-object v7, v1, Lfu1;->d:Landroid/app/PendingIntent;

    if-nez v7, :cond_109

    move-object v7, v3

    :cond_109
    if-eqz v7, :cond_114

    iget v1, v1, Lfu1;->a:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    :cond_111
    :goto_111
    :pswitch_111
    move-object v1, v0

    goto/16 :goto_6a

    :cond_114
    move-object v1, v0

    :goto_115
    iget-object v6, p0, Lg89;->h:Lcom/google/android/play/core/install/zza;

    if-eqz v2, :cond_12c

    if-eqz v6, :cond_12c

    iget v1, v6, Lcom/google/android/play/core/install/zza;->a:I

    if-eq v1, v5, :cond_12b

    if-eq v1, v4, :cond_128

    packed-switch v1, :pswitch_data_16a

    goto :goto_12b

    :pswitch_125
    sget-object v1, Lf89;->b:Lf89;

    goto :goto_12c

    :cond_128
    sget-object v1, Lf89;->c:Lf89;

    goto :goto_12c

    :cond_12b
    :goto_12b
    :pswitch_12b
    move-object v1, v0

    :cond_12c
    :goto_12c
    iget-object v4, p0, Lg89;->k:Ljava/lang/Object;

    monitor-enter v4

    :try_start_12f
    iget-object v5, p0, Lg89;->m:Lf89;

    iput-boolean v2, p0, Lg89;->l:Z

    iput-object v3, p0, Lg89;->n:Ljava/lang/Integer;

    iput-object v1, p0, Lg89;->m:Lf89;
    :try_end_137
    .catchall {:try_start_12f .. :try_end_137} :catchall_154

    monitor-exit v4

    if-eq v1, v5, :cond_153

    sget-object v2, Lf89;->c:Lf89;

    if-ne v1, v2, :cond_146

    iget-object p0, p0, Lg89;->o:Ljdj;

    sget-object v0, Lynm;->a:Lynm;

    invoke-virtual {p0, v0}, Ljdj;->i(Ljava/lang/Object;)Z

    return-void

    :cond_146
    if-ne v5, v0, :cond_153

    sget-object v0, Lf89;->b:Lf89;

    if-ne v1, v0, :cond_153

    iget-object p0, p0, Lg89;->o:Ljdj;

    sget-object v0, Lbom;->a:Lbom;

    invoke-virtual {p0, v0}, Ljdj;->i(Ljava/lang/Object;)Z

    :cond_153
    return-void

    :catchall_154
    move-exception v0

    move-object p0, v0

    monitor-exit v4

    throw p0

    :pswitch_data_158
    .packed-switch 0x0
        :pswitch_111
        :pswitch_fc
        :pswitch_fc
        :pswitch_fc
        :pswitch_111
        :pswitch_111
        :pswitch_111
    .end packed-switch

    :pswitch_data_16a
    .packed-switch 0x0
        :pswitch_12b
        :pswitch_125
        :pswitch_125
        :pswitch_125
        :pswitch_12b
        :pswitch_12b
        :pswitch_12b
    .end packed-switch
.end method
