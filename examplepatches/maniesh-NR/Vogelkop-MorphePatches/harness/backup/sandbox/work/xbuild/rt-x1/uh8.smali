.class public abstract Luh8;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/concurrent/locks/ReentrantLock;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    sput-object v0, Luh8;->a:Ljava/util/concurrent/locks/ReentrantLock;

    return-void
.end method

.method public static final a(Landroid/content/Context;Landroid/app/ActivityManager;Lq56;)V
    .registers 21

    const-string v0, "last_exit_reason_timestamp"

    sget-object v1, Luh8;->a:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->tryLock()Z

    move-result v2

    if-nez v2, :cond_b

    return-void

    :cond_b
    :try_start_b
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "osp_exit_reason_prefs"

    const/4 v4, 0x0

    move-object/from16 v5, p0

    invoke-virtual {v5, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    const-wide/16 v5, 0x0

    invoke-interface {v3, v0, v5, v6}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    move-object/from16 v7, p1

    invoke-virtual {v7, v2, v4, v4}, Landroid/app/ActivityManager;->getHistoricalProcessExitReasons(Ljava/lang/String;II)Ljava/util/List;

    move-result-object v7

    invoke-virtual/range {p2 .. p2}, Lq56;->z()Lhf0;

    move-result-object v8

    new-instance v9, Lr1i;

    invoke-direct {v9, v7}, Lr1i;-><init>(Ljava/util/List;)V

    invoke-virtual {v9}, Lr1i;->iterator()Ljava/util/Iterator;

    move-result-object v7

    move-wide v9, v5

    :goto_32
    move-object v11, v7

    check-cast v11, Lq1i;

    iget-object v11, v11, Lq1i;->b:Ljava/lang/Object;

    check-cast v11, Ljava/util/ListIterator;

    invoke-interface {v11}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v11

    if-eqz v11, :cond_bd

    move-object v11, v7

    check-cast v11, Lq1i;

    iget-object v11, v11, Lq1i;->b:Ljava/lang/Object;

    check-cast v11, Ljava/util/ListIterator;

    invoke-interface {v11}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/app/ApplicationExitInfo;

    invoke-virtual {v11}, Landroid/app/ApplicationExitInfo;->getTimestamp()J

    move-result-wide v12

    cmp-long v12, v12, v5

    if-lez v12, :cond_b5

    invoke-virtual {v11}, Landroid/app/ApplicationExitInfo;->getReason()I

    move-result v12

    const/4 v13, 0x6

    const/4 v14, 0x2

    const/4 v15, 0x1

    if-eq v12, v13, :cond_80

    const/16 v13, 0x9

    if-eq v12, v13, :cond_7a

    const/16 v13, 0xd

    const/16 v16, 0x0

    if-ne v12, v13, :cond_84

    invoke-virtual {v11}, Landroid/app/ApplicationExitInfo;->getDescription()Ljava/lang/String;

    move-result-object v12

    if-eqz v12, :cond_84

    const-string v13, "MemoryLimiter:AnonSwap"

    invoke-static {v12, v13, v4}, Lkotlin/text/StringsKt;->E(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v12

    if-ne v12, v15, :cond_84

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    goto :goto_84

    :cond_7a
    const/4 v12, 0x3

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    goto :goto_84

    :cond_80
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    :cond_84
    :goto_84
    if-eqz v16, :cond_b5

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v12

    invoke-virtual {v11}, Landroid/app/ApplicationExitInfo;->getProcessName()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13, v2}, Luh8;->b(Ljava/lang/String;Ljava/lang/String;)Lgn0;

    move-result-object v13

    new-instance v4, Lm70;
    :try_end_94
    .catch Ljava/lang/RuntimeException; {:try_start_b .. :try_end_94} :catch_d7
    .catchall {:try_start_b .. :try_end_94} :catchall_d0

    const/16 v15, 0x98b

    move-object/from16 v17, v1

    const/4 v1, -0x1

    :try_start_99
    invoke-direct {v4, v15, v1, v14}, Ljf0;-><init>(III)V

    const/4 v1, 0x1

    const/4 v14, 0x0

    invoke-virtual {v4, v14, v1, v13}, Ljf0;->q(IILjava/lang/Object;)V

    int-to-long v12, v12

    invoke-virtual {v4, v1, v1, v12, v13}, Ljf0;->p(IIJ)V

    invoke-virtual {v8, v4}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v11}, Landroid/app/ApplicationExitInfo;->getTimestamp()J

    move-result-wide v12

    cmp-long v1, v12, v9

    if-lez v1, :cond_b8

    invoke-virtual {v11}, Landroid/app/ApplicationExitInfo;->getTimestamp()J

    move-result-wide v9

    goto :goto_b8

    :cond_b5
    move-object/from16 v17, v1

    move v14, v4

    :cond_b8
    :goto_b8
    move v4, v14

    move-object/from16 v1, v17

    goto/16 :goto_32

    :cond_bd
    move-object/from16 v17, v1

    cmp-long v1, v9, v5

    if-lez v1, :cond_d9

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v0, v9, v10}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_cd
    .catch Ljava/lang/RuntimeException; {:try_start_99 .. :try_end_cd} :catch_d9
    .catchall {:try_start_99 .. :try_end_cd} :catchall_ce

    goto :goto_d9

    :catchall_ce
    move-exception v0

    goto :goto_d3

    :catchall_d0
    move-exception v0

    move-object/from16 v17, v1

    :goto_d3
    invoke-virtual/range {v17 .. v17}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0

    :catch_d7
    move-object/from16 v17, v1

    :catch_d9
    :cond_d9
    :goto_d9
    invoke-virtual/range {v17 .. v17}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return-void
.end method

.method public static b(Ljava/lang/String;Ljava/lang/String;)Lgn0;
    .registers 4

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    sget-object p0, Lgn0;->b:Lgn0;

    return-object p0

    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ":sandboxed_process"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_24

    sget-object p0, Lgn0;->c:Lgn0;

    return-object p0

    :cond_24
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ":privileged_process"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v1}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_3e

    sget-object p0, Lgn0;->d:Lgn0;

    return-object p0

    :cond_3e
    sget-object p0, Lgn0;->e:Lgn0;

    return-object p0
.end method
