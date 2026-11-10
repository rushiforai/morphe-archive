.class public final synthetic Landroidx/activity/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    iput p1, p0, Landroidx/activity/d;->a:I

    iput-object p2, p0, Landroidx/activity/d;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 19

    move-object/from16 v1, p0

    const/4 v0, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x1

    iget v4, v1, Landroidx/activity/d;->a:I

    packed-switch v4, :pswitch_data_0

    iget-object v0, v1, Landroidx/activity/d;->b:Ljava/lang/Object;

    check-cast v0, Li/U;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void

    :pswitch_0
    iget-object v4, v1, Landroidx/activity/d;->b:Ljava/lang/Object;

    check-cast v4, Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->isFinishing()Z

    move-result v5

    if-nez v5, :cond_a

    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x1c

    if-lt v5, v6, :cond_0

    sget-object v0, Lo/d;->a:Ljava/lang/Class;

    invoke-virtual {v4}, Landroid/app/Activity;->recreate()V

    goto/16 :goto_6

    :cond_0
    sget-object v6, Lo/d;->a:Ljava/lang/Class;

    const/16 v6, 0x1b

    const/16 v7, 0x1a

    if-eq v5, v7, :cond_2

    if-ne v5, v6, :cond_1

    goto :goto_0

    :cond_1
    move v8, v0

    goto :goto_1

    :cond_2
    :goto_0
    move v8, v3

    :goto_1
    sget-object v9, Lo/d;->f:Ljava/lang/reflect/Method;

    if-eqz v8, :cond_3

    if-nez v9, :cond_3

    goto/16 :goto_5

    :cond_3
    sget-object v8, Lo/d;->e:Ljava/lang/reflect/Method;

    if-nez v8, :cond_4

    sget-object v8, Lo/d;->d:Ljava/lang/reflect/Method;

    if-nez v8, :cond_4

    goto/16 :goto_5

    :cond_4
    :try_start_0
    sget-object v8, Lo/d;->c:Ljava/lang/reflect/Field;

    invoke-virtual {v8, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    if-nez v10, :cond_5

    goto/16 :goto_5

    :cond_5
    sget-object v8, Lo/d;->b:Ljava/lang/reflect/Field;

    invoke-virtual {v8, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-nez v8, :cond_6

    goto :goto_5

    :cond_6
    invoke-virtual {v4}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v11

    new-instance v12, Lo/c;

    invoke-direct {v12, v4}, Lo/c;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v11, v12}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    sget-object v13, Lo/d;->g:Landroid/os/Handler;

    :try_start_1
    new-instance v14, LQ/c;

    invoke-direct {v14, v12, v3, v10}, LQ/c;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    invoke-virtual {v13, v14}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    if-eq v5, v7, :cond_8

    if-ne v5, v6, :cond_7

    goto :goto_2

    :cond_7
    move v3, v0

    :cond_8
    :goto_2
    if-eqz v3, :cond_9

    move-object v3, v13

    :try_start_2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    sget-object v14, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-object v5, v11

    const/4 v11, 0x0

    move-object v6, v12

    const/4 v12, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-object/from16 v17, v14

    move-object/from16 v18, v14

    :try_start_3
    filled-new-array/range {v10 .. v18}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v9, v8, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    :catchall_0
    move-exception v0

    goto :goto_4

    :catchall_1
    move-exception v0

    move-object v5, v11

    move-object v6, v12

    goto :goto_4

    :cond_9
    move-object v5, v11

    move-object v6, v12

    move-object v3, v13

    invoke-virtual {v4}, Landroid/app/Activity;->recreate()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_3
    :try_start_4
    new-instance v0, LQ/c;

    invoke-direct {v0, v5, v2, v6}, LQ/c;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    invoke-virtual {v3, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_6

    :goto_4
    new-instance v7, LQ/c;

    invoke-direct {v7, v5, v2, v6}, LQ/c;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    invoke-virtual {v3, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :catchall_2
    :goto_5
    invoke-virtual {v4}, Landroid/app/Activity;->recreate()V

    :cond_a
    :goto_6
    return-void

    :pswitch_1
    iget-object v0, v1, Landroidx/activity/d;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/lifecycle/x;

    const-string v2, "this$0"

    invoke-static {v0, v2}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    iget v2, v0, Landroidx/lifecycle/x;->b:I

    iget-object v4, v0, Landroidx/lifecycle/x;->f:Landroidx/lifecycle/s;

    if-nez v2, :cond_b

    iput-boolean v3, v0, Landroidx/lifecycle/x;->c:Z

    sget-object v2, Landroidx/lifecycle/k;->ON_PAUSE:Landroidx/lifecycle/k;

    invoke-virtual {v4, v2}, Landroidx/lifecycle/s;->d(Landroidx/lifecycle/k;)V

    :cond_b
    iget v2, v0, Landroidx/lifecycle/x;->a:I

    if-nez v2, :cond_c

    iget-boolean v2, v0, Landroidx/lifecycle/x;->c:Z

    if-eqz v2, :cond_c

    sget-object v2, Landroidx/lifecycle/k;->ON_STOP:Landroidx/lifecycle/k;

    invoke-virtual {v4, v2}, Landroidx/lifecycle/s;->d(Landroidx/lifecycle/k;)V

    iput-boolean v3, v0, Landroidx/lifecycle/x;->d:Z

    :cond_c
    return-void

    :pswitch_2
    iget-object v3, v1, Landroidx/activity/d;->b:Ljava/lang/Object;

    check-cast v3, Landroidx/emoji2/text/r;

    const-string v4, "fetchFonts result is not OK. ("

    iget-object v5, v3, Landroidx/emoji2/text/r;->d:Ljava/lang/Object;

    monitor-enter v5

    :try_start_5
    iget-object v6, v3, Landroidx/emoji2/text/r;->h:LD/g;

    if-nez v6, :cond_d

    monitor-exit v5

    goto/16 :goto_c

    :catchall_3
    move-exception v0

    goto/16 :goto_e

    :cond_d
    monitor-exit v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    :try_start_6
    invoke-virtual {v3}, Landroidx/emoji2/text/r;->b()Lv/g;

    move-result-object v5

    iget v6, v5, Lv/g;->e:I

    if-ne v6, v2, :cond_e

    iget-object v2, v3, Landroidx/emoji2/text/r;->d:Ljava/lang/Object;

    monitor-enter v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_5

    :try_start_7
    monitor-exit v2

    goto :goto_7

    :catchall_4
    move-exception v0

    monitor-exit v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    :try_start_8
    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_5

    :catchall_5
    move-exception v0

    goto/16 :goto_a

    :cond_e
    :goto_7
    if-nez v6, :cond_11

    :try_start_9
    const-string v2, "EmojiCompat.FontRequestEmojiCompatConfig.buildTypeface"

    sget v4, Lu/e;->a:I

    invoke-static {v2}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    iget-object v2, v3, Landroidx/emoji2/text/r;->c:LF/d;

    iget-object v4, v3, Landroidx/emoji2/text/r;->a:Landroid/content/Context;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    filled-new-array {v5}, [Lv/g;

    move-result-object v2

    sget-object v6, Lr/f;->a:LD/g;

    invoke-virtual {v6, v4, v2, v0}, LD/g;->k(Landroid/content/Context;[Lv/g;I)Landroid/graphics/Typeface;

    move-result-object v0

    iget-object v2, v3, Landroidx/emoji2/text/r;->a:Landroid/content/Context;

    iget-object v4, v5, Lv/g;->a:Landroid/net/Uri;

    invoke-static {v2, v4}, LD/g;->B(Landroid/content/Context;Landroid/net/Uri;)Ljava/nio/MappedByteBuffer;

    move-result-object v2
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_8

    if-eqz v2, :cond_10

    if-eqz v0, :cond_10

    :try_start_a
    const-string v4, "EmojiCompat.MetadataRepo.create"

    invoke-static {v4}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    new-instance v4, LQ/t;

    invoke-static {v2}, LD/g;->M(Ljava/nio/MappedByteBuffer;)LF/b;

    move-result-object v2

    invoke-direct {v4, v0, v2}, LQ/t;-><init>(Landroid/graphics/Typeface;LF/b;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_7

    :try_start_b
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_8

    :try_start_c
    invoke-static {}, Landroid/os/Trace;->endSection()V

    iget-object v2, v3, Landroidx/emoji2/text/r;->d:Ljava/lang/Object;

    monitor-enter v2
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_5

    :try_start_d
    iget-object v0, v3, Landroidx/emoji2/text/r;->h:LD/g;

    if-eqz v0, :cond_f

    invoke-virtual {v0, v4}, LD/g;->F(LQ/t;)V

    goto :goto_8

    :catchall_6
    move-exception v0

    goto :goto_9

    :cond_f
    :goto_8
    monitor-exit v2
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_6

    :try_start_e
    invoke-virtual {v3}, Landroidx/emoji2/text/r;->a()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_5

    goto :goto_c

    :goto_9
    :try_start_f
    monitor-exit v2
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_6

    :try_start_10
    throw v0
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_5

    :catchall_7
    move-exception v0

    :try_start_11
    sget v2, Lu/e;->a:I

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw v0

    :cond_10
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v2, "Unable to open file."

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_8

    :catchall_8
    move-exception v0

    :try_start_12
    sget v2, Lu/e;->a:I

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw v0

    :cond_11
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ")"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_5

    :goto_a
    iget-object v2, v3, Landroidx/emoji2/text/r;->d:Ljava/lang/Object;

    monitor-enter v2

    :try_start_13
    iget-object v4, v3, Landroidx/emoji2/text/r;->h:LD/g;

    if-eqz v4, :cond_12

    invoke-virtual {v4, v0}, LD/g;->E(Ljava/lang/Throwable;)V

    goto :goto_b

    :catchall_9
    move-exception v0

    goto :goto_d

    :cond_12
    :goto_b
    monitor-exit v2
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_9

    invoke-virtual {v3}, Landroidx/emoji2/text/r;->a()V

    :goto_c
    return-void

    :goto_d
    :try_start_14
    monitor-exit v2
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_9

    throw v0

    :goto_e
    :try_start_15
    monitor-exit v5
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_3

    throw v0

    :pswitch_3
    iget-object v0, v1, Landroidx/activity/d;->b:Ljava/lang/Object;

    check-cast v0, Le/g;

    invoke-static {v0}, Le/g;->b(Le/g;)V

    return-void

    :pswitch_4
    iget-object v0, v1, Landroidx/activity/d;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/activity/k;

    iget-object v2, v0, Landroidx/activity/k;->b:Ljava/lang/Runnable;

    if-eqz v2, :cond_13

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    const/4 v2, 0x0

    iput-object v2, v0, Landroidx/activity/k;->b:Ljava/lang/Runnable;

    :cond_13
    return-void

    :pswitch_5
    iget-object v0, v1, Landroidx/activity/d;->b:Ljava/lang/Object;

    check-cast v0, Le/i;

    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
