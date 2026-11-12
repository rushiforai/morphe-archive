.class public final synthetic Loz2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLjava/lang/Object;Z)V
    .registers 4

    iput-byte p1, p0, Loz2;->a:B

    iput-object p2, p0, Loz2;->c:Ljava/lang/Object;

    iput-boolean p3, p0, Loz2;->b:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 21

    move-object/from16 v0, p0

    iget-byte v1, v0, Loz2;->a:B

    const/4 v2, 0x1

    const/4 v3, 0x0

    iget-boolean v4, v0, Loz2;->b:Z

    iget-object v5, v0, Loz2;->c:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_146

    move-object v13, v5

    check-cast v13, Lp10;

    move-object/from16 v1, p1

    check-cast v1, Lcom/opera/android/startup/WelcomeActivity;

    invoke-virtual {v1}, Lcom/opera/android/startup/WelcomeActivity;->T()V

    invoke-virtual {v1, v3}, Lcom/opera/android/startup/WelcomeActivity;->V(Z)V

    sget-object v7, Lvml;->d:Lumi;

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->h()Lr65;

    move-result-object v8

    iget-object v9, v1, Lhjf;->a:Ldll;

    new-instance v10, Lqfl;

    const/16 v2, 0x1c

    invoke-direct {v10, v1, v2}, Lqfl;-><init>(Ljava/lang/Object;B)V

    new-instance v11, Ltzn;

    const/4 v2, 0x3

    invoke-direct {v11, v1, v2}, Ltzn;-><init>(Lcom/opera/android/startup/WelcomeActivity;B)V

    new-instance v6, Lx65;

    const/4 v12, 0x1

    const/4 v14, 0x0

    const/4 v15, 0x1

    const/16 v16, 0x0

    iget-boolean v0, v0, Loz2;->b:Z

    const/16 v18, 0x0

    move/from16 v17, v0

    invoke-direct/range {v6 .. v18}, Lx65;-><init>(Lumi;Lr65;Ldll;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;ZLp10;ZZZZZ)V

    return-object v6

    :pswitch_48
    check-cast v5, Ldc0;

    move-object/from16 v0, p1

    check-cast v0, Lck0;

    invoke-virtual {v0}, Lck0;->d()Ltd0;

    move-result-object v0

    iget-object v0, v0, Ltd0;->c:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lyb0;

    iget-object v1, v0, Lyb0;->a:Lzpa;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lcc0;

    const/4 v6, -0x1

    const/4 v7, 0x2

    const/16 v8, 0x98b

    invoke-direct {v1, v8, v6, v7}, Ljf0;-><init>(III)V

    iget-object v0, v0, Lyb0;->b:Lxb0;

    const/16 v6, 0x2f

    invoke-virtual {v0, v6}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    if-eqz v7, :cond_80

    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_80

    new-instance v8, Lhf0;

    invoke-direct {v8, v0, v6, v7}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_89

    :cond_80
    invoke-static {v0, v6, v2}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v7

    new-instance v8, Lhf0;

    invoke-direct {v8, v0, v6, v7}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_89
    invoke-virtual {v8, v1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1, v3, v2, v5}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v1, v2, v2, v4}, Ljf0;->r(IIZ)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_95
    check-cast v5, Lrq8;

    iget-object v0, v5, Lrq8;->b:Lg77;

    move-object/from16 v1, p1

    check-cast v1, Lnq8;

    iget-object v6, v5, Lrq8;->g:Lrb;

    iget-object v6, v6, Lrb;->a:Lb59;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    const/16 v9, 0x17

    if-eqz v4, :cond_bb

    new-instance v2, Lqq8;

    invoke-direct {v2, v7, v8, v5, v1}, Lqq8;-><init>(JLjava/lang/Object;Ljava/lang/Object;)V

    iget-object v3, v0, Lg77;->c:Ljava/lang/Object;

    check-cast v3, Lk5o;

    new-instance v4, Lsu;

    invoke-direct {v4, v0, v1, v2, v9}, Lsu;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, v4}, Lk5o;->k(Lcom/opera/api/Callback;)V

    goto :goto_10d

    :cond_bb
    invoke-virtual {v1}, Lnq8;->a()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/content/SharedPreferences;

    const-string v11, "cached_request_hash"

    const/4 v12, 0x0

    invoke-interface {v10, v11, v12}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v4, v10}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    sget-object v10, Lpn7;->b:Lon7;

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/SharedPreferences;

    const-string v10, "cache_max_age_millis"

    const-wide/16 v11, 0x0

    invoke-interface {v6, v10, v11, v12}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v10

    sget-object v6, Lun7;->d:Lun7;

    invoke-static {v10, v11, v6}, Lcs5;->y0(JLun7;)J

    move-result-wide v10

    invoke-static {v10, v11}, Lpn7;->f(J)J

    move-result-wide v10

    cmp-long v6, v7, v10

    if-lez v6, :cond_f0

    move v6, v2

    goto :goto_f1

    :cond_f0
    move v6, v3

    :goto_f1
    if-eqz v4, :cond_f9

    if-nez v6, :cond_f9

    invoke-virtual {v5, v1, v2}, Lrq8;->a(Lnq8;Z)V

    goto :goto_10d

    :cond_f9
    invoke-virtual {v5, v1, v3}, Lrq8;->a(Lnq8;Z)V

    new-instance v2, Lqq8;

    invoke-direct {v2, v7, v8, v5, v1}, Lqq8;-><init>(JLjava/lang/Object;Ljava/lang/Object;)V

    iget-object v3, v0, Lg77;->c:Ljava/lang/Object;

    check-cast v3, Lk5o;

    new-instance v4, Lsu;

    invoke-direct {v4, v0, v1, v2, v9}, Lsu;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, v4}, Lk5o;->k(Lcom/opera/api/Callback;)V

    :goto_10d
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_110
    check-cast v5, Lrj4;

    move-object/from16 v0, p1

    check-cast v0, Lx61;

    new-instance v1, Llj4;

    invoke-direct {v1, v0, v5}, Llj4;-><init>(Lx61;Lrj4;)V

    new-instance v2, Luj4;

    iget-object v3, v5, Lrj4;->n:Lwi4;

    iget-object v0, v0, Lx61;->a:Landroid/hardware/camera2/CaptureResult;

    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureResult;->getFrameNumber()J

    invoke-direct {v2, v3, v1}, Luj4;-><init>(Lowh;Lgo9;)V

    invoke-static {v2, v4}, Lsu5;->a(Luj4;Z)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_130
    check-cast v5, Lqf5;

    move-object/from16 v0, p1

    check-cast v0, Lvdc;

    iget-object v1, v5, Lqf5;->a:Lxt2;

    invoke-virtual {v1, v4}, Lgcf;->setEnabled(Z)V

    iget-object v1, v5, Lqf5;->b:Llz2;

    invoke-virtual {v1, v4}, Lzje;->f(Z)V

    new-instance v1, Lqz2;

    invoke-direct {v1, v0, v5}, Lqz2;-><init>(Lvdc;Lqf5;)V

    return-object v1

    :pswitch_data_146
    .packed-switch 0x0
        :pswitch_130
        :pswitch_110
        :pswitch_95
        :pswitch_48
    .end packed-switch
.end method
