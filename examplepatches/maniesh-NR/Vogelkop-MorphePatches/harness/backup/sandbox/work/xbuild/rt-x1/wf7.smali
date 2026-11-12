.class public final Lwf7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public a:Z

.field public b:J

.field public final c:Ljava/util/ArrayList;

.field public final d:Ljava/util/ArrayList;

.field public final synthetic e:Ligi;


# direct methods
.method public constructor <init>(Ligi;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwf7;->e:Ligi;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lwf7;->c:Ljava/util/ArrayList;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lwf7;->d:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final a(Lre7;Z)V
    .registers 5

    invoke-virtual {p1}, Lre7;->p()Z

    move-result v0

    if-eqz v0, :cond_17

    if-nez p2, :cond_e

    iget-object p2, p0, Lwf7;->c:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_13

    :cond_e
    iget-object p2, p0, Lwf7;->d:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_13
    iget-boolean p1, p0, Lwf7;->a:Z

    if-eqz p1, :cond_18

    :cond_17
    return-void

    :cond_18
    const/4 p1, 0x1

    iput-boolean p1, p0, Lwf7;->a:Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iget-wide v0, p0, Lwf7;->b:J

    sub-long/2addr p1, v0

    const-wide/16 v0, 0x3e8

    sub-long/2addr v0, p1

    const-wide/16 p1, 0x0

    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    long-to-int p1, p1

    int-to-long p1, p1

    invoke-static {p0, p1, p2}, Lvml;->d(Ljava/lang/Runnable;J)V

    return-void
.end method

.method public final run()V
    .registers 22

    move-object/from16 v0, p0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, v0, Lwf7;->b:J

    iget-object v1, v0, Lwf7;->e:Ligi;

    iget-object v2, v1, Ligi;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/HashMap;

    iget-object v3, v1, Ligi;->b:Ljava/lang/Object;

    check-cast v3, Ljava/util/HashMap;

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    iget-object v5, v0, Lwf7;->c:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v8, 0x0

    :cond_1e
    :goto_1e
    sget-object v13, Lvf7;->c:Lvf7;

    sget-object v18, Lvf7;->b:Lvf7;

    const/16 v20, 0x0

    if-ge v8, v6, :cond_7f

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v8, v8, 0x1

    check-cast v9, Lre7;

    invoke-static {}, Lvf7;->values()[Lvf7;

    move-result-object v10

    array-length v11, v10

    const/4 v12, 0x0

    :goto_34
    if-ge v12, v11, :cond_47

    aget-object v14, v10, v12

    invoke-virtual {v3, v14}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/util/List;

    invoke-interface {v15, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_49

    add-int/lit8 v12, v12, 0x1

    goto :goto_34

    :cond_47
    move-object/from16 v14, v20

    :cond_49
    invoke-virtual {v9}, Lre7;->p()Z

    move-result v10

    if-eqz v10, :cond_5b

    iget v10, v9, Lre7;->f:I

    invoke-static {v10}, Lvep;->A(I)I

    move-result v10

    const/4 v11, 0x2

    if-eq v10, v11, :cond_60

    const/4 v11, 0x3

    if-eq v10, v11, :cond_5e

    :cond_5b
    move-object/from16 v13, v20

    goto :goto_60

    :cond_5e
    move-object/from16 v13, v18

    :cond_60
    :goto_60
    if-eq v14, v13, :cond_1e

    if-eqz v14, :cond_70

    invoke-virtual {v4, v14}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v3, v14}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/List;

    invoke-interface {v10, v9}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    :cond_70
    if-eqz v13, :cond_1e

    invoke-virtual {v4, v13}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v3, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/List;

    invoke-interface {v10, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1e

    :cond_7f
    iget-object v6, v0, Lwf7;->d:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v8

    const/4 v9, 0x0

    :cond_86
    :goto_86
    if-ge v9, v8, :cond_af

    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    add-int/lit8 v9, v9, 0x1

    check-cast v10, Lre7;

    invoke-static {}, Lvf7;->values()[Lvf7;

    move-result-object v11

    array-length v12, v11

    const/4 v14, 0x0

    :goto_96
    if-ge v14, v12, :cond_86

    aget-object v15, v11, v14

    invoke-virtual {v3, v15}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v7, v16

    check-cast v7, Ljava/util/List;

    invoke-interface {v7, v10}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_ac

    invoke-virtual {v4, v15}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_86

    :cond_ac
    add-int/lit8 v14, v14, 0x1

    goto :goto_96

    :cond_af
    invoke-virtual {v4}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_b3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_125

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lvf7;

    invoke-virtual {v3, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_cf

    invoke-virtual {v1, v7}, Ligi;->q(Lvf7;)V

    goto :goto_b3

    :cond_cf
    invoke-virtual {v2, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ln14;

    if-nez v9, :cond_105

    iget-object v9, v1, Ligi;->d:Ljava/lang/Object;

    move-object v15, v9

    check-cast v15, Landroid/content/Context;

    invoke-virtual {v7}, Ljava/lang/Enum;->ordinal()I

    move-result v9

    if-eqz v9, :cond_f5

    const/4 v10, 0x1

    if-eq v9, v10, :cond_e8

    move-object/from16 v9, v20

    goto :goto_102

    :cond_e8
    new-instance v9, Luf7;

    const-string v12, "downloads_active"

    const/4 v14, 0x0

    const v11, 0x7f12002e

    move-object v10, v15

    invoke-direct/range {v9 .. v14}, Luf7;-><init>(Landroid/content/Context;ILjava/lang/String;Lvf7;B)V

    goto :goto_102

    :cond_f5
    new-instance v14, Luf7;

    const-string v17, "downloads_finished"

    const/16 v19, 0x1

    const v16, 0x7f12002f

    invoke-direct/range {v14 .. v19}, Luf7;-><init>(Landroid/content/Context;ILjava/lang/String;Lvf7;B)V

    move-object v9, v14

    :goto_102
    invoke-virtual {v2, v7, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_105
    iget-object v7, v9, Ln14;->d:Lcom/opera/api/Callback;

    if-nez v7, :cond_11d

    iget-object v7, v9, Ln14;->b:Landroid/content/Context;

    const-string v10, "notification"

    invoke-virtual {v7, v10}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/app/NotificationManager;

    iget v10, v9, Ln14;->a:I

    invoke-virtual {v9, v8}, Ln14;->a(Ljava/util/List;)Landroid/app/Notification;

    move-result-object v8

    invoke-virtual {v7, v10, v8}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto :goto_b3

    :cond_11d
    invoke-virtual {v9, v8}, Ln14;->a(Ljava/util/List;)Landroid/app/Notification;

    move-result-object v8

    invoke-interface {v7, v8}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_b3

    :cond_125
    const/4 v7, 0x0

    iput-boolean v7, v0, Lwf7;->a:Z

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    return-void
.end method
