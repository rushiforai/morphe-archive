.class public final Lcg;
.super Ln14;
.source "SourceFile"


# instance fields
.field public final g:Ljava/util/HashSet;

.field public final h:Lag;

.field public final i:Lbg;

.field public j:J

.field public k:Z


# direct methods
.method public constructor <init>(Landroid/app/Service;Lcom/opera/api/Callback;)V
    .registers 9

    const v3, 0x7f0a02ed

    const v4, 0x1080081

    const-string v2, "downloads_active"

    move-object v0, p0

    move-object v1, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Ln14;-><init>(Landroid/content/Context;Ljava/lang/String;IILcom/opera/api/Callback;)V

    new-instance p0, Ljava/util/HashSet;

    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    iput-object p0, v0, Lcg;->g:Ljava/util/HashSet;

    new-instance p0, Lag;

    const/4 p1, 0x0

    invoke-direct {p0, v0, p1}, Lag;-><init>(Ljava/lang/Object;B)V

    iput-object p0, v0, Lcg;->h:Lag;

    new-instance p0, Lbg;

    invoke-direct {p0, v0, p1}, Lbg;-><init>(Ljava/lang/Object;B)V

    iput-object p0, v0, Lcg;->i:Lbg;

    iget-object p0, v0, Ln14;->c:Lua7;

    const/4 p2, 0x1

    invoke-virtual {p0, p2}, Lua7;->R(Z)V

    iget-object p0, v0, Ln14;->c:Lua7;

    iget-object p0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast p0, Ll1f;

    invoke-virtual {p0, p1}, Ll1f;->d(Z)V

    return-void
.end method


# virtual methods
.method public final b(J)Lyhe;
    .registers 4

    iget-boolean v0, p0, Lcg;->k:Z

    if-eqz v0, :cond_9

    invoke-super {p0, p1, p2}, Ln14;->b(J)Lyhe;

    move-result-object p0

    return-object p0

    :cond_9
    iget-object p0, p0, Ln14;->b:Landroid/content/Context;

    invoke-static {p0}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p1

    const/high16 p2, 0xc000000

    const/4 v0, 0x0

    invoke-static {p0, v0, p1, p2, v0}, Lyhe;->f(Landroid/content/Context;ILandroid/content/Intent;IZ)Lyhe;

    move-result-object p0

    return-object p0
.end method

.method public final f(Ljava/util/List;)V
    .registers 24

    move-object/from16 v0, p0

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/opera/android/downloads/DownloadNotifierReceiver;

    iget-object v3, v0, Ln14;->b:Landroid/content/Context;

    invoke-direct {v1, v3, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "com.opera.android.action.PAUSE_ACTIVE_DOWNLOADS"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v2, 0x4000000

    const/4 v4, 0x0

    invoke-static {v3, v4, v1, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    const v2, 0x7f1405c7

    invoke-virtual {v0, v2, v1}, Ln14;->e(ILandroid/app/PendingIntent;)V

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    const v6, 0x7f12002a

    invoke-virtual {v2, v6, v1, v5}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, v0, Ln14;->e:Landroid/widget/RemoteViews;

    const v5, 0x7f0a069d

    invoke-virtual {v2, v5, v1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    iget-object v2, v0, Ln14;->f:Landroid/widget/RemoteViews;

    invoke-virtual {v2, v5, v1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    iget-object v1, v0, Lcg;->g:Ljava/util/HashSet;

    move-object/from16 v2, p1

    invoke-virtual {v1, v2}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    iget-wide v5, v0, Lcg;->j:J

    sget-object v7, Llg7;->a:[[I

    invoke-virtual {v1}, Ljava/util/HashSet;->isEmpty()Z

    move-result v7

    const/4 v8, 0x1

    if-eqz v7, :cond_5c

    move-wide/from16 v20, v5

    const-wide/16 v4, 0x0

    const-wide/16 v13, 0x0

    const-wide/16 v15, 0x0

    goto :goto_9a

    :cond_5c
    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    move v7, v4

    const-wide/16 v9, 0x0

    const-wide/16 v13, 0x0

    const-wide/16 v15, 0x0

    :goto_67
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_88

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v11, v17

    check-cast v11, Lre7;

    move-wide/from16 v20, v5

    iget-wide v4, v11, Lre7;->i:J

    add-long/2addr v13, v4

    invoke-virtual {v11}, Lre7;->i()Z

    move-result v4

    if-nez v4, :cond_84

    move v7, v8

    :goto_81
    move-wide/from16 v5, v20

    goto :goto_67

    :cond_84
    iget-wide v4, v11, Lre7;->j:J

    add-long/2addr v9, v4

    goto :goto_81

    :cond_88
    move-wide/from16 v20, v5

    const-wide/16 v18, 0x0

    if-eqz v7, :cond_91

    const-wide/high16 v4, -0x4010000000000000L    # -1.0

    goto :goto_9a

    :cond_91
    cmp-long v1, v9, v18

    if-gtz v1, :cond_97

    move-wide v4, v15

    goto :goto_9a

    :cond_97
    long-to-double v4, v13

    long-to-double v6, v9

    div-double/2addr v4, v6

    :goto_9a
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v1

    iget-object v4, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Double;

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    cmpg-double v1, v4, v15

    if-gez v1, :cond_c4

    sget-object v1, Llg7;->a:[[I

    invoke-static {v6, v7, v3}, Laik;->i(JLandroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    :goto_c0
    move-wide/from16 v6, v20

    const/4 v12, 0x0

    goto :goto_dc

    :cond_c4
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-wide/high16 v6, 0x4059000000000000L    # 100.0

    mul-double/2addr v6, v4

    double-to-int v6, v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    const v7, 0x7f1405cf

    invoke-virtual {v1, v7, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_c0

    :goto_dc
    invoke-static {v3, v6, v7, v12}, Llg7;->c(Landroid/content/Context;JZ)Ljava/lang/CharSequence;

    move-result-object v3

    iget-object v6, v0, Ln14;->e:Landroid/widget/RemoteViews;

    invoke-static {v6, v4, v5, v1, v3}, Ln14;->d(Landroid/widget/RemoteViews;DLjava/lang/String;Ljava/lang/CharSequence;)V

    iget-object v6, v0, Ln14;->f:Landroid/widget/RemoteViews;

    invoke-static {v6, v4, v5, v1, v3}, Ln14;->d(Landroid/widget/RemoteViews;DLjava/lang/String;Ljava/lang/CharSequence;)V

    iput-boolean v12, v0, Lcg;->k:Z

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_f0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_104

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lre7;

    invoke-virtual {v2}, Lre7;->q()Z

    move-result v2

    if-eqz v2, :cond_f0

    iput-boolean v8, v0, Lcg;->k:Z

    :cond_104
    return-void
.end method

.method public final g()Landroid/app/Notification;
    .registers 2

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, p0, Ln14;->b:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object v0

    iget-object v0, v0, Lsf7;->a:Lrf7;

    invoke-virtual {v0}, Lrf7;->l()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Ln14;->a(Ljava/util/List;)Landroid/app/Notification;

    move-result-object p0

    return-object p0
.end method

.method public final h()V
    .registers 4

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, p0, Ln14;->b:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object v0

    iget-object v1, v0, Lsf7;->a:Lrf7;

    iget-object v2, p0, Lcg;->h:Lag;

    invoke-virtual {v1, v2}, Lrf7;->u(Lqf7;)V

    iget-object v0, v0, Lsf7;->c:Lfg7;

    iget-object v0, v0, Lfg7;->b:Ljava/util/ArrayList;

    iget-object p0, p0, Lcg;->i:Lbg;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method
