.class public final Lkwk;
.super Landroid/content/AbstractThreadedSyncAdapter;
.source "SourceFile"


# static fields
.field public static final synthetic b:I


# instance fields
.field public final a:Lb59;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/content/AbstractThreadedSyncAdapter;-><init>(Landroid/content/Context;Z)V

    sget-object v1, Lvml;->d:Lumi;

    const-string v2, "sync_ping"

    new-array v0, v0, [Lbg1;

    invoke-static {p1, v1, v2, v0}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lkwk;->a:Lb59;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/SyncResult;Llkk;I)V
    .registers 7

    const/4 v0, 0x1

    if-eqz p2, :cond_47

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_3d

    if-eq p1, v0, :cond_33

    const/4 p2, 0x2

    if-eq p1, p2, :cond_29

    const/4 p2, 0x3

    if-eq p1, p2, :cond_1f

    const/4 p2, 0x4

    if-eq p1, p2, :cond_15

    return-void

    :cond_15
    sget-object p1, Lbe7;->j:Lbe7;

    invoke-virtual {p0}, Landroid/content/AbstractThreadedSyncAdapter;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p1, p0, v0}, Lz43;->D(Landroid/content/Context;Z)Z

    return-void

    :cond_1f
    sget-object p1, Lcef;->j:Lcef;

    invoke-virtual {p0}, Landroid/content/AbstractThreadedSyncAdapter;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p1, p0, v0}, Lz43;->D(Landroid/content/Context;Z)Z

    return-void

    :cond_29
    sget-object p1, Ltc3;->j:Ltc3;

    invoke-virtual {p0}, Landroid/content/AbstractThreadedSyncAdapter;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p1, p0, v0}, Lz43;->D(Landroid/content/Context;Z)Z

    return-void

    :cond_33
    sget-object p1, Laxh;->j:Laxh;

    invoke-virtual {p0}, Landroid/content/AbstractThreadedSyncAdapter;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p1, p0, v0}, Lz43;->D(Landroid/content/Context;Z)Z

    return-void

    :cond_3d
    sget-object p1, Lh11;->j:Lh11;

    invoke-virtual {p0}, Landroid/content/AbstractThreadedSyncAdapter;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p1, p0, v0}, Lz43;->D(Landroid/content/Context;Z)Z

    return-void

    :cond_47
    sget-object p2, Lh11;->j:Lh11;

    invoke-virtual {p0}, Landroid/content/AbstractThreadedSyncAdapter;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p2, v1, v0}, Lz43;->D(Landroid/content/Context;Z)Z

    move-result p2

    sget-object v1, Laxh;->j:Laxh;

    invoke-virtual {p0}, Landroid/content/AbstractThreadedSyncAdapter;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lz43;->D(Landroid/content/Context;Z)Z

    sget-object v1, Ltc3;->j:Ltc3;

    invoke-virtual {p0}, Landroid/content/AbstractThreadedSyncAdapter;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lz43;->D(Landroid/content/Context;Z)Z

    sget-object v1, Lcef;->j:Lcef;

    invoke-virtual {p0}, Landroid/content/AbstractThreadedSyncAdapter;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lz43;->D(Landroid/content/Context;Z)Z

    sget-object v1, Lbe7;->j:Lbe7;

    invoke-virtual {p0}, Landroid/content/AbstractThreadedSyncAdapter;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lz43;->D(Landroid/content/Context;Z)Z

    const-string v1, "ui.retry"

    iget-object p0, p0, Lkwk;->a:Lb59;

    if-nez p2, :cond_9d

    add-int/2addr p3, v0

    const/4 p2, 0x5

    if-ge p3, p2, :cond_9d

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, v1, p3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p2

    const-wide/16 v0, 0x3e8

    div-long/2addr p2, v0

    const-wide/16 v0, 0x1

    add-long/2addr p2, v0

    iput-wide p2, p1, Landroid/content/SyncResult;->delayUntil:J

    return-void

    :cond_9d
    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-static {p0, v1}, Lcom/appsflyer/internal/j;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    return-void
.end method

.method public final b(J)V
    .registers 10

    iget-object v0, p0, Lkwk;->a:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-wide/16 v2, -0x1

    const-string v4, "avro.last.ping"

    invoke-interface {v1, v4, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    const-wide/16 v5, 0x0

    cmp-long v3, v1, v5

    if-gez v3, :cond_28

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, v4, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void

    :cond_28
    cmp-long v3, p1, v1

    if-ltz v3, :cond_36

    sub-long v1, p1, v1

    const-wide/32 v5, 0x1499700

    cmp-long v1, v1, v5

    if-gez v1, :cond_36

    return-void

    :cond_36
    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, v4, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    sget-object p1, Lh11;->j:Lh11;

    invoke-virtual {p0}, Landroid/content/AbstractThreadedSyncAdapter;->getContext()Landroid/content/Context;

    move-result-object p0

    const/4 p2, 0x0

    invoke-virtual {p1, p0, p2}, Lz43;->D(Landroid/content/Context;Z)Z

    return-void
.end method

.method public final onPerformSync(Landroid/accounts/Account;Landroid/os/Bundle;Ljava/lang/String;Landroid/content/ContentProviderClient;Landroid/content/SyncResult;)V
    .registers 22

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p5

    const-string v3, "op"

    const-string v4, "unknown"

    invoke-virtual {v1, v3, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Landroid/content/AbstractThreadedSyncAdapter;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lsfe;->g0(Landroid/content/Context;)Z

    move-result v6

    const-string v7, "ping"

    const-wide/16 v8, 0x1

    if-eqz v6, :cond_2a

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_29

    iget-object v0, v2, Landroid/content/SyncResult;->stats:Landroid/content/SyncStats;

    iget-wide v1, v0, Landroid/content/SyncStats;->numIoExceptions:J

    add-long/2addr v1, v8

    iput-wide v1, v0, Landroid/content/SyncStats;->numIoExceptions:J

    :cond_29
    return-void

    :cond_2a
    invoke-virtual {v1, v3, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v4

    const-string v6, "periodic"

    const-string v10, "ui"

    const/4 v11, 0x2

    const/4 v13, -0x1

    sparse-switch v4, :sswitch_data_1a6

    goto :goto_55

    :sswitch_3f
    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_55

    move v3, v11

    goto :goto_58

    :sswitch_47
    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_55

    const/4 v3, 0x1

    goto :goto_58

    :sswitch_4f
    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_57

    :cond_55
    :goto_55
    move v3, v13

    goto :goto_58

    :cond_57
    const/4 v3, 0x0

    :goto_58
    packed-switch v3, :pswitch_data_1b4

    sget-object v3, Lnr0;->e:Lnr0;

    goto :goto_66

    :pswitch_5e
    sget-object v3, Lnr0;->b:Lnr0;

    goto :goto_66

    :pswitch_61
    sget-object v3, Lnr0;->c:Lnr0;

    goto :goto_66

    :pswitch_64
    sget-object v3, Lnr0;->d:Lnr0;

    :goto_66
    invoke-virtual {v0}, Landroid/content/AbstractThreadedSyncAdapter;->getContext()Landroid/content/Context;

    move-result-object v4

    sget-object v15, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v4

    iget-object v4, v4, Ld6j;->c:Lx5f;

    move-wide/from16 p3, v8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    iget-boolean v15, v4, Lx5f;->h:Z

    if-nez v15, :cond_84

    const/4 v9, 0x1

    goto :goto_cc

    :cond_84
    iget-object v15, v4, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v12

    new-instance v14, Lmr0;

    const/16 v2, 0x98b

    invoke-direct {v14, v2, v13, v11}, Ljf0;-><init>(III)V

    const/4 v2, 0x1

    const/4 v11, 0x0

    invoke-virtual {v14, v11, v2, v8, v9}, Ljf0;->p(IIJ)V

    invoke-virtual {v14, v2, v2, v3}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v12, v15}, Lx56;->z(Lzpa;)Lq56;

    move-result-object v2

    invoke-virtual {v2, v15}, Lq56;->y(Lzpa;)Ln56;

    move-result-object v2

    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    if-eqz v8, :cond_b8

    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_b8

    new-instance v9, Lhf0;

    invoke-direct {v9, v2, v3, v8}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    move-object v11, v9

    const/4 v9, 0x1

    goto :goto_c6

    :cond_b8
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    const/4 v9, 0x1

    invoke-virtual {v2, v3, v9, v8}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v11, Lhf0;

    invoke-direct {v11, v2, v3, v8}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_c6
    invoke-virtual {v11, v14}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v4, v12}, Lx5f;->U0(Lx56;)V

    :goto_cc
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_1be

    goto :goto_ed

    :sswitch_d7
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_ed

    const/4 v11, 0x2

    goto :goto_f0

    :sswitch_df
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_ed

    move v11, v9

    goto :goto_f0

    :sswitch_e7
    invoke-virtual {v5, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_ef

    :cond_ed
    :goto_ed
    move v11, v13

    goto :goto_f0

    :cond_ef
    const/4 v11, 0x0

    :goto_f0
    const-wide/16 v2, 0x0

    const/4 v4, 0x0

    packed-switch v11, :pswitch_data_1cc

    goto/16 :goto_16e

    :pswitch_f8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-virtual {v0, v5, v6}, Lkwk;->b(J)V

    goto :goto_16e

    :pswitch_100
    const-string v5, "ts"

    invoke-virtual {v1, v5}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;)J

    move-result-wide v5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    iget-object v1, v0, Lkwk;->a:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v9, "ping.maxts"

    invoke-interface {v1, v9, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v10

    const-string v12, "ui.retry"

    invoke-interface {v1, v12, v13}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v12

    cmp-long v10, v5, v10

    if-lez v10, :cond_12e

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v10

    invoke-interface {v10, v9, v5, v6}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_130

    :cond_12e
    if-ltz v10, :cond_16e

    :goto_130
    move-object/from16 v5, p5

    if-lez v12, :cond_138

    invoke-virtual {v0, v5, v4, v12}, Lkwk;->a(Landroid/content/SyncResult;Llkk;I)V

    goto :goto_13b

    :cond_138
    invoke-virtual {v0, v7, v8}, Lkwk;->b(J)V

    :goto_13b
    iget-object v6, v5, Landroid/content/SyncResult;->stats:Landroid/content/SyncStats;

    iget-wide v9, v6, Landroid/content/SyncStats;->numIoExceptions:J

    add-long v9, v9, p3

    iput-wide v9, v6, Landroid/content/SyncStats;->numIoExceptions:J

    if-gez v12, :cond_16e

    const-string v6, "avro.last.ping"

    const-wide/16 v9, -0x1

    invoke-interface {v1, v6, v9, v10}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v9

    const-wide/16 v11, 0x3e8

    div-long/2addr v9, v11

    const-wide/16 v13, 0x5460

    add-long/2addr v9, v13

    div-long/2addr v7, v11

    const-wide/16 v11, 0x1c20

    add-long/2addr v7, v11

    invoke-static {v9, v10, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    iput-wide v6, v5, Landroid/content/SyncResult;->delayUntil:J

    goto :goto_16e

    :pswitch_15e
    move-object/from16 v5, p5

    const-string v6, "sub"

    invoke-virtual {v1, v6, v13}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v1}, Llkk;->d(I)Llkk;

    move-result-object v1

    const/4 v11, 0x0

    invoke-virtual {v0, v5, v1, v11}, Lkwk;->a(Landroid/content/SyncResult;Llkk;I)V

    :cond_16e
    :goto_16e
    invoke-virtual {v0}, Landroid/content/AbstractThreadedSyncAdapter;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lhd;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v5, "npt_unsent_token_track_events"

    invoke-interface {v1, v5, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_185

    invoke-static {v0}, Lcom/opera/android/news/newsfeed/internal/NewsPushTokenUploaderWorker;->d(Landroid/content/Context;)V

    :cond_185
    const-string v1, "news_push_tracker"

    const/4 v11, 0x0

    invoke-virtual {v0, v1, v11}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v5, "npt_unsent_push_track_events"

    invoke-interface {v1, v5, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_19b

    invoke-static {v0}, Lcom/opera/android/news/newsfeed/internal/NewsPushTrackEventsUploaderWorker;->d(Landroid/content/Context;)V

    :cond_19b
    sget-object v0, Lks3;->k:Lks3;

    iget-object v0, v0, Lks3;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    invoke-static {v2, v3, v0}, Lcom/opera/android/crashhandler/CrashReportProcessingService;->c(JLandroid/content/Context;)V

    return-void

    nop

    :sswitch_data_1a6
    .sparse-switch
        0xe94 -> :sswitch_4f
        0x348172 -> :sswitch_47
        0x19dd169b -> :sswitch_3f
    .end sparse-switch

    :pswitch_data_1b4
    .packed-switch 0x0
        :pswitch_64
        :pswitch_61
        :pswitch_5e
    .end packed-switch

    :sswitch_data_1be
    .sparse-switch
        0xe94 -> :sswitch_e7
        0x348172 -> :sswitch_df
        0x19dd169b -> :sswitch_d7
    .end sparse-switch

    :pswitch_data_1cc
    .packed-switch 0x0
        :pswitch_15e
        :pswitch_100
        :pswitch_f8
    .end packed-switch
.end method

.method public final onSyncCanceled()V
    .registers 2

    invoke-super {p0}, Landroid/content/AbstractThreadedSyncAdapter;->onSyncCanceled()V

    invoke-virtual {p0}, Landroid/content/AbstractThreadedSyncAdapter;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lxf8;->E(Landroid/content/Context;Z)V

    return-void
.end method
