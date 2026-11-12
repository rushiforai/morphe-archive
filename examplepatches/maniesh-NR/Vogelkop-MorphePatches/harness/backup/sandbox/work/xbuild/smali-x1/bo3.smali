.class public final synthetic Lbo3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lbo3;->a:B

    iput-object p1, p0, Lbo3;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 40

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Lbo3;->a:B

    const/16 v3, 0x8

    const/4 v4, 0x5

    const/4 v5, 0x2

    sget-object v6, Log;->a:Log;

    sget-object v7, Lng;->a:Lng;

    const/4 v8, 0x3

    const/4 v9, 0x1

    const/4 v10, 0x0

    const/4 v11, 0x0

    iget-object v0, v0, Lbo3;->b:Ljava/lang/Object;

    packed-switch v2, :pswitch_data_69c

    check-cast v0, Landroid/os/CancellationSignal;

    check-cast v1, Ljava/lang/Throwable;

    if-eqz v1, :cond_20

    invoke-virtual {v0}, Landroid/os/CancellationSignal;->cancel()V

    :cond_20
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_23
    check-cast v0, Lfe5;

    check-cast v1, Lpg;

    invoke-static {v1, v7}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_38

    iget-object v1, v0, Lfe5;->a:Lpde;

    iget-object v2, v0, Lfe5;->c:Lk9;

    invoke-virtual {v1, v2}, Lekc;->k(Lf7f;)V

    invoke-virtual {v0}, Lfe5;->b()V

    goto :goto_4f

    :cond_38
    invoke-static {v1, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_52

    iget-object v1, v0, Lfe5;->b:Lqdc;

    iget-object v1, v1, Lqdc;->i:Lqcc;

    sget-object v2, Lqcc;->c:Lqcc;

    invoke-virtual {v1, v2}, Lqcc;->d(Lqcc;)Z

    move-result v1

    if-eqz v1, :cond_4f

    iput-boolean v9, v0, Lfe5;->d:Z

    invoke-virtual {v0}, Lfe5;->b()V

    :cond_4f
    :goto_4f
    sget-object v11, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_55

    :cond_52
    invoke-static {}, Lh9o;->p()V

    :goto_55
    return-object v11

    :pswitch_56
    check-cast v0, Lr65;

    check-cast v1, Lfwm;

    const/16 v2, 0x14

    invoke-static {v1}, Lwf8;->b(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lr65;->j(ILjava/lang/String;)V

    invoke-virtual {v0, v11, v11, v1}, Lr65;->i(Lcom/usercentrics/sdk/UsercentricsReadyStatus;Lcom/usercentrics/sdk/UsercentricsOptions;Lfwm;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_69
    check-cast v0, Lj55;

    check-cast v1, Ljava/lang/Boolean;

    new-instance v1, Llb4;

    const/16 v2, 0x12

    invoke-direct {v1, v0, v2}, Llb4;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1}, Lvml;->c(Ljava/lang/Runnable;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_7a
    check-cast v0, Lae5;

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-interface {v0}, Lae5;->a()Lnrl;

    move-result-object v0

    iget-object v2, v0, Lnrl;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/HashMap;

    const-string v3, "DefaultChildStack"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lbbb;

    if-nez v2, :cond_9a

    invoke-interface {v1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lbbb;

    invoke-virtual {v0, v3, v2}, Lnrl;->J(Ljava/lang/Object;Lbbb;)V

    :cond_9a
    return-object v2

    :pswitch_9b
    check-cast v0, Ls14;

    new-instance v2, Lrje;

    invoke-direct {v2, v1}, Lrje;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Ls14;->r(Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_a8
    check-cast v0, Lbo3;

    check-cast v1, Lr2k;

    iget-object v1, v1, Lr2k;->a:Ljava/util/List;

    invoke-virtual {v0, v1}, Lbo3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lk2j;

    return-object v0

    :pswitch_b5
    check-cast v0, Lkotlinx/serialization/KSerializer;

    check-cast v1, Ljava/util/List;

    if-eqz v0, :cond_cf

    new-instance v2, Lk72;

    invoke-direct {v2, v0, v10}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    new-instance v0, Lk2j;

    invoke-direct {v0, v11}, Lk2j;-><init>([B)V

    new-instance v3, Ln9h;

    invoke-direct {v3, v8, v1, v2, v10}, Ln9h;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    iput-object v3, v0, Lk2j;->b:Ln9h;

    iput-object v11, v0, Lk2j;->a:[B

    move-object v11, v0

    :cond_cf
    return-object v11

    :pswitch_d0
    check-cast v0, Lfx4;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v2, v0, Lfx4;->b:Ljava/util/List;

    invoke-static {v1, v2}, Lkotlin/collections/CollectionsKt;->M(ILjava/util/List;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnv4;

    if-nez v1, :cond_e4

    iget-object v1, v0, Lfx4;->a:Lnv4;

    :cond_e4
    return-object v1

    :pswitch_e5
    check-cast v0, Ldx4;

    check-cast v1, Lr6j;

    new-instance v2, Lhx4;

    iget-char v3, v0, Lv6j;->a:C

    iget-object v1, v1, Lr6j;->j:Lo6j;

    iget-object v1, v1, Lo6j;->a:Ljava/util/Set;

    invoke-direct {v2, v3, v1}, Lhx4;-><init>(ILjava/util/Set;)V

    invoke-interface {v0, v2}, Lt6j;->b(Lhx4;)Lix4;

    move-result-object v0

    return-object v0

    :pswitch_f9
    check-cast v0, Lcx4;

    check-cast v1, Lr6j;

    iget-object v0, v0, Lcx4;->g:Lkak;

    iget-object v1, v1, Lr6j;->j:Lo6j;

    iget-object v1, v1, Lo6j;->a:Ljava/util/Set;

    check-cast v1, Ljava/lang/Iterable;

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->m0(Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object v1

    iget-object v2, v0, Lkak;->b:Lekc;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_122

    iget-object v3, v0, Lkak;->c:Ljak;

    invoke-interface {v3}, Ljak;->k()Ls6j;

    move-result-object v3

    new-instance v4, Lhx4;

    iget-char v0, v0, Lkak;->a:C

    invoke-direct {v4, v0, v1}, Lhx4;-><init>(ILjava/util/Set;)V

    invoke-interface {v3, v4, v2}, Ls6j;->a(Lhx4;Ljava/lang/Object;)Lix4;

    move-result-object v11

    :cond_122
    return-object v11

    :pswitch_123
    check-cast v0, Lvu4;

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0}, Lmqk;->e()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_12d
    check-cast v0, Lon4;

    check-cast v1, Lwa1;

    iget-object v2, v0, Lon4;->a:Ljava/lang/String;

    invoke-interface {v1, v10, v2}, Lwa1;->w(ILjava/lang/String;)V

    iget-object v2, v0, Lon4;->b:Ljava/lang/String;

    invoke-interface {v1, v9, v2}, Lwa1;->w(ILjava/lang/String;)V

    iget-object v2, v0, Lon4;->c:Ljava/lang/String;

    invoke-interface {v1, v5, v2}, Lwa1;->w(ILjava/lang/String;)V

    iget-object v2, v0, Lon4;->d:Ljava/lang/String;

    invoke-interface {v1, v8, v2}, Lwa1;->w(ILjava/lang/String;)V

    iget-object v0, v0, Lon4;->e:Ljava/lang/String;

    const/4 v2, 0x4

    invoke-interface {v1, v2, v0}, Lwa1;->w(ILjava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_14e
    check-cast v0, Lp12;

    check-cast v1, Laf4;

    iget-object v1, v1, Laf4;->a:Lp12;

    if-eq v1, v0, :cond_157

    move v9, v10

    :cond_157
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_15c
    check-cast v0, Ld7k;

    check-cast v1, Lo3c;

    invoke-virtual {v0, v1}, Ld7k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1}, Lo3c;->a()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_169
    check-cast v0, Lu34;

    check-cast v1, Ljava/lang/Throwable;

    if-eqz v1, :cond_178

    invoke-virtual {v0}, Lu34;->n()Z

    move-result v2

    if-nez v2, :cond_178

    invoke-virtual {v0, v1}, Lu34;->d(Ljava/lang/Throwable;)V

    :cond_178
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_17b
    check-cast v0, Ld44;

    check-cast v1, Ljava/lang/Throwable;

    if-eqz v1, :cond_184

    invoke-interface {v0, v1}, Ld44;->d(Ljava/lang/Throwable;)V

    :cond_184
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_187
    check-cast v0, Lw04;

    check-cast v1, Lpg;

    invoke-static {v1, v7}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1b0

    invoke-static {v1, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1ac

    iput-boolean v10, v0, Lw04;->c:Z

    iget-object v1, v0, Lw04;->d:Lfv2;

    invoke-static {v1}, Lvml;->a(Ljava/lang/Runnable;)V

    iget-object v0, v0, Lw04;->b:Lx05;

    iget-object v1, v0, Lx05;->d:Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/Animator;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_1b0

    invoke-virtual {v0}, Lx05;->stop()V

    goto :goto_1b0

    :cond_1ac
    invoke-static {}, Lh9o;->p()V

    goto :goto_1b2

    :cond_1b0
    :goto_1b0
    sget-object v11, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_1b2
    return-object v11

    :pswitch_1b3
    check-cast v0, Lvy3;

    check-cast v1, Ljava/lang/String;

    iget-object v0, v0, Lvy3;->o:Lg9;

    if-nez v1, :cond_1bd

    const-string v1, ""

    :cond_1bd
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Lg9;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1c5
    check-cast v0, Liy3;

    check-cast v1, Ln6j;

    sget-object v2, Lhy3;->a:[Lhy3;

    const/4 v6, 0x0

    const/16 v7, 0x38

    const/4 v2, 0x1

    const v3, 0x7f140fc1

    const v4, 0x7f0a09ba

    const/4 v5, 0x0

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v2, 0x2

    const v3, 0x7f1410ac

    const v4, 0x7f0a09fe

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v2, 0x3

    const v3, 0x7f1410bb

    const v4, 0x7f0a09da

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v2, 0x4

    const v3, 0x7f140889

    const v4, 0x7f0a09cd

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const v2, 0x7f14124f

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    const/16 v7, 0x18

    const/4 v2, 0x5

    const v3, 0x7f141250

    const v4, 0x7f0a0a07

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v6, 0x0

    const/16 v7, 0x38

    const/4 v2, 0x6

    const v3, 0x7f140a39

    const v4, 0x7f0a09ec

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    iget-object v0, v0, Liy3;->f:Lg1c;

    iget-char v0, v0, Lv6j;->a:C

    invoke-virtual {v1, v0}, Ln6j;->a(I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_225
    check-cast v0, Lhx3;

    check-cast v1, Ljava/lang/String;

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v0, Lhx3;->b:Ldx3;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    iget-boolean v2, v0, Lx5f;->h:Z

    if-eqz v2, :cond_24f

    iget-object v2, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    invoke-virtual {v3, v2}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v2

    const/16 v4, 0x1a

    invoke-virtual {v2, v4, v1}, Lb66;->D(ILjava/lang/String;)V

    invoke-virtual {v0, v3}, Lx5f;->U0(Lx56;)V

    :cond_24f
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_252
    check-cast v0, Lr02;

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_264

    invoke-virtual {v0}, Lr02;->i()V

    iget-object v0, v0, Lr02;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V

    :cond_264
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_267
    check-cast v0, Lqb7;

    check-cast v1, Lndc;

    new-instance v1, Ljava/util/GregorianCalendar;

    invoke-direct {v1}, Ljava/util/GregorianCalendar;-><init>()V

    new-instance v2, Lnt3;

    invoke-virtual {v1, v9}, Ljava/util/Calendar;->get(I)I

    move-result v3

    invoke-virtual {v1, v5}, Ljava/util/Calendar;->get(I)I

    move-result v5

    invoke-virtual {v1, v4}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-direct {v2, v3, v5, v1}, Lnt3;-><init>(III)V

    invoke-virtual {v0, v2}, Lqb7;->x(Lnt3;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_287
    check-cast v0, Lns3;

    check-cast v1, Lvoh;

    iget-boolean v2, v0, Lb8e;->n:Z

    if-eqz v2, :cond_29d

    invoke-virtual {v0}, Lb8e;->H0()Lnx5;

    move-result-object v2

    new-instance v3, Lr3;

    const/16 v4, 0x9

    invoke-direct {v3, v0, v1, v11, v4}, Lr3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v2, v11, v11, v3, v8}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :cond_29d
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2a0
    check-cast v0, Lhq3;

    check-cast v1, Ljava/lang/Boolean;

    invoke-static {v0, v1}, Lhq3;->o(Lhq3;Ljava/lang/Boolean;)Lkotlin/Unit;

    move-result-object v0

    return-object v0

    :pswitch_2a9
    check-cast v0, Ltah;

    check-cast v1, Ljava/lang/Boolean;

    iget-object v0, v0, Ltah;->j:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_2b8

    move v3, v10

    :cond_2b8
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2be
    check-cast v0, Lrt3;

    check-cast v1, Lkp3;

    invoke-virtual {v0, v1}, Lrt3;->accept(Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2c8
    check-cast v0, Lbp3;

    check-cast v1, Lq8l;

    invoke-virtual {v0, v10}, Lbp3;->i(Z)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2d2
    check-cast v0, Lnp1;

    check-cast v1, Lndc;

    iget-boolean v1, v0, Lnp1;->a:Z

    if-nez v1, :cond_2e8

    iget-boolean v1, v0, Lnp1;->b:Z

    if-nez v1, :cond_2e8

    iget-boolean v1, v0, Lnp1;->c:Z

    if-nez v1, :cond_2e8

    sget-object v1, Lvb0;->c:Lvb0;

    invoke-virtual {v0, v1}, Lnp1;->c(Lvb0;)V

    goto :goto_2f8

    :cond_2e8
    iget-object v1, v0, Lnp1;->e:Ljava/lang/Object;

    check-cast v1, Lorm;

    const/16 v2, 0xf

    check-cast v1, Lx5f;

    invoke-virtual {v1, v2}, Lx5f;->S(I)V

    sget-object v1, Lvb0;->b:Lvb0;

    invoke-virtual {v0, v1}, Lnp1;->c(Lvb0;)V

    :goto_2f8
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2fb
    check-cast v0, Leo3;

    check-cast v1, Lg74;

    iget v2, v0, Leo3;->r:F

    invoke-virtual {v1}, Lg74;->b()F

    move-result v5

    mul-float/2addr v5, v2

    const/4 v2, 0x0

    cmpl-float v5, v5, v2

    if-ltz v5, :cond_68f

    iget-object v5, v1, Lg74;->a:Le14;

    invoke-interface {v5}, Le14;->e()J

    move-result-wide v5

    invoke-static {v5, v6}, Lbpj;->c(J)F

    move-result v5

    cmpl-float v5, v5, v2

    if-lez v5, :cond_68f

    iget v5, v0, Leo3;->r:F

    invoke-static {v5, v2}, Lgh7;->b(FF)Z

    move-result v2

    const/high16 v5, 0x3f800000    # 1.0f

    if-eqz v2, :cond_325

    move v2, v5

    goto :goto_332

    :cond_325
    iget v2, v0, Leo3;->r:F

    invoke-virtual {v1}, Lg74;->b()F

    move-result v6

    mul-float/2addr v6, v2

    float-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    double-to-float v2, v6

    :goto_332
    iget-object v6, v1, Lg74;->a:Le14;

    invoke-interface {v6}, Le14;->e()J

    move-result-wide v6

    invoke-static {v6, v7}, Lbpj;->c(J)F

    move-result v6

    const/high16 v7, 0x40000000    # 2.0f

    div-float/2addr v6, v7

    float-to-double v12, v6

    invoke-static {v12, v13}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v12

    double-to-float v6, v12

    invoke-static {v2, v6}, Ljava/lang/Math;->min(FF)F

    move-result v15

    div-float v2, v15, v7

    invoke-static {v2}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v6

    int-to-long v12, v6

    invoke-static {v2}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v6

    move/from16 p0, v7

    int-to-long v7, v6

    const/16 v6, 0x20

    shl-long/2addr v12, v6

    const-wide v16, 0xffffffffL

    and-long v7, v7, v16

    or-long v19, v12, v7

    iget-object v7, v1, Lg74;->a:Le14;

    invoke-interface {v7}, Le14;->e()J

    move-result-wide v7

    shr-long/2addr v7, v6

    long-to-int v7, v7

    invoke-static {v7}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v7

    sub-float/2addr v7, v15

    iget-object v8, v1, Lg74;->a:Le14;

    invoke-interface {v8}, Le14;->e()J

    move-result-wide v12

    and-long v12, v12, v16

    long-to-int v8, v12

    invoke-static {v8}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v8

    sub-float/2addr v8, v15

    invoke-static {v7}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v7

    int-to-long v12, v7

    invoke-static {v8}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v7

    int-to-long v7, v7

    shl-long/2addr v12, v6

    and-long v7, v7, v16

    or-long v21, v12, v7

    mul-float v26, v15, p0

    iget-object v7, v1, Lg74;->a:Le14;

    invoke-interface {v7}, Le14;->e()J

    move-result-wide v7

    invoke-static {v7, v8}, Lbpj;->c(J)F

    move-result v7

    cmpl-float v7, v26, v7

    if-lez v7, :cond_39f

    move v7, v9

    goto :goto_3a0

    :cond_39f
    move v7, v10

    :goto_3a0
    iget-object v8, v0, Leo3;->t:Lpaj;

    iget-object v12, v1, Lg74;->a:Le14;

    invoke-interface {v12}, Le14;->e()J

    move-result-wide v12

    iget-object v14, v1, Lg74;->a:Le14;

    invoke-interface {v14}, Le14;->getLayoutDirection()Ld2c;

    move-result-object v14

    invoke-interface {v8, v12, v13, v14, v1}, Lpaj;->a(JLd2c;Ln27;)Lw7d;

    move-result-object v8

    instance-of v12, v8, Lltf;

    if-eqz v12, :cond_5c8

    iget-object v2, v0, Leo3;->s:Lnvj;

    check-cast v8, Lltf;

    iget-object v12, v8, Lltf;->k:Ld91;

    if-eqz v7, :cond_3c9

    new-instance v0, Lcv2;

    invoke-direct {v0, v8, v2, v3}, Lcv2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v0}, Lg74;->a(Lkotlin/jvm/functions/Function1;)Lqe6;

    move-result-object v11

    goto/16 :goto_69a

    :cond_3c9
    if-eqz v2, :cond_3d8

    iget-wide v13, v2, Lnvj;->a:J

    invoke-static {v13, v14, v5}, Lu95;->b(JF)J

    move-result-wide v13

    new-instance v3, Lkh3;

    invoke-direct {v3, v13, v14, v4}, Lkh3;-><init>(JI)V

    move v4, v9

    goto :goto_3da

    :cond_3d8
    move v4, v10

    move-object v3, v11

    :goto_3da
    invoke-virtual {v12}, Ld91;->d()Lvoh;

    move-result-object v7

    iget v13, v7, Lvoh;->b:F

    iget v14, v7, Lvoh;->a:F

    iget-object v15, v0, Leo3;->q:Lxn3;

    if-nez v15, :cond_3ed

    new-instance v15, Lxn3;

    invoke-direct {v15}, Lxn3;-><init>()V

    iput-object v15, v0, Leo3;->q:Lxn3;

    :cond_3ed
    move/from16 p0, v5

    iget-object v5, v15, Lxn3;->d:Ld91;

    if-nez v5, :cond_3f9

    invoke-static {}, Lf91;->a()Ld91;

    move-result-object v5

    iput-object v5, v15, Lxn3;->d:Ld91;

    :cond_3f9
    invoke-virtual {v5}, Ld91;->g()V

    invoke-static {v5, v7}, Ld91;->b(Ld91;Lvoh;)V

    invoke-virtual {v5, v5, v12, v10}, Ld91;->f(Ld91;Ld91;I)Z

    new-instance v12, Lpqh;

    invoke-direct {v12}, Ljava/lang/Object;-><init>()V

    iget v15, v7, Lvoh;->c:F

    sub-float/2addr v15, v14

    float-to-double v9, v15

    invoke-static {v9, v10}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v9

    double-to-float v9, v9

    float-to-int v9, v9

    iget v10, v7, Lvoh;->d:F

    sub-float/2addr v10, v13

    move/from16 p1, v6

    move-object/from16 v19, v7

    float-to-double v6, v10

    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    double-to-float v6, v6

    float-to-int v6, v6

    int-to-long v9, v9

    shl-long v9, v9, p1

    int-to-long v6, v6

    and-long v6, v6, v16

    or-long v21, v9, v6

    iget-object v0, v0, Leo3;->q:Lxn3;

    iget-object v6, v0, Lxn3;->a:Lj71;

    iget-object v7, v0, Lxn3;->b:La31;

    if-eqz v6, :cond_439

    invoke-virtual {v6}, Lj71;->a()I

    move-result v9

    new-instance v10, Lxva;

    invoke-direct {v10, v9}, Lxva;-><init>(I)V

    goto :goto_43a

    :cond_439
    move-object v10, v11

    :goto_43a
    if-eqz v10, :cond_440

    iget v9, v10, Lxva;->a:I

    if-eqz v9, :cond_453

    :cond_440
    if-eqz v6, :cond_44b

    invoke-virtual {v6}, Lj71;->a()I

    move-result v9

    new-instance v11, Lxva;

    invoke-direct {v11, v9}, Lxva;-><init>(I)V

    :cond_44b
    if-eqz v11, :cond_451

    iget v9, v11, Lxva;->a:I

    if-eq v4, v9, :cond_453

    :cond_451
    const/4 v9, 0x0

    goto :goto_454

    :cond_453
    const/4 v9, 0x1

    :goto_454
    if-eqz v6, :cond_48c

    if-eqz v7, :cond_48c

    iget-object v10, v1, Lg74;->a:Le14;

    invoke-interface {v10}, Le14;->e()J

    move-result-wide v10

    shr-long v10, v10, p1

    long-to-int v10, v10

    invoke-static {v10}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v10

    iget-object v11, v6, Lj71;->a:Landroid/graphics/Bitmap;

    invoke-virtual {v11}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v15

    int-to-float v15, v15

    cmpl-float v10, v10, v15

    if-gtz v10, :cond_48c

    iget-object v10, v1, Lg74;->a:Le14;

    invoke-interface {v10}, Le14;->e()J

    move-result-wide v23

    move-object/from16 v29, v2

    move-object v10, v3

    and-long v2, v23, v16

    long-to-int v2, v2

    invoke-static {v2}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v2

    invoke-virtual {v11}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    int-to-float v3, v3

    cmpl-float v2, v2, v3

    if-gtz v2, :cond_48f

    if-nez v9, :cond_4b1

    goto :goto_48f

    :cond_48c
    move-object/from16 v29, v2

    move-object v10, v3

    :cond_48f
    :goto_48f
    shr-long v2, v21, p1

    long-to-int v2, v2

    and-long v6, v21, v16

    long-to-int v3, v6

    const/16 v6, 0x18

    invoke-static {v2, v3, v4, v6}, Lrm5;->d(IIII)Lj71;

    move-result-object v6

    iput-object v6, v0, Lxn3;->a:Lj71;

    sget-object v2, Lb31;->a:Landroid/graphics/Canvas;

    new-instance v7, La31;

    invoke-direct {v7}, La31;-><init>()V

    new-instance v2, Landroid/graphics/Canvas;

    invoke-static {v6}, Loup;->L(Lj71;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v2, v7, La31;->a:Landroid/graphics/Canvas;

    iput-object v7, v0, Lxn3;->b:La31;

    :cond_4b1
    iget-object v2, v0, Lxn3;->c:Luh4;

    if-nez v2, :cond_4bc

    new-instance v2, Luh4;

    invoke-direct {v2}, Luh4;-><init>()V

    iput-object v2, v0, Lxn3;->c:Luh4;

    :cond_4bc
    iget-object v3, v2, Luh4;->b:Ld5o;

    iget-object v0, v2, Luh4;->a:Lth4;

    move-object v9, v5

    invoke-static/range {v21 .. v22}, Lfr3;->g0(J)J

    move-result-wide v4

    iget-object v11, v1, Lg74;->a:Le14;

    invoke-interface {v11}, Le14;->getLayoutDirection()Ld2c;

    move-result-object v11

    iget-object v15, v0, Lth4;->a:Ln27;

    move-object/from16 v30, v2

    iget-object v2, v0, Lth4;->b:Ld2c;

    move-object/from16 v18, v9

    iget-object v9, v0, Lth4;->c:Lsh4;

    move-object/from16 v37, v9

    move-object/from16 v20, v10

    iget-wide v9, v0, Lth4;->d:J

    iput-object v1, v0, Lth4;->a:Ln27;

    iput-object v11, v0, Lth4;->b:Ld2c;

    iput-object v7, v0, Lth4;->c:Lsh4;

    iput-wide v4, v0, Lth4;->d:J

    invoke-virtual {v7}, La31;->j()V

    sget-wide v31, Lu95;->b:J

    const/16 v35, 0x0

    const/16 v36, 0x3a

    move-wide/from16 v33, v4

    invoke-static/range {v30 .. v36}, Lmk7;->z0(Lmk7;JJFI)V

    neg-float v4, v14

    neg-float v5, v13

    iget-object v11, v3, Ld5o;->a:Ljava/lang/Object;

    check-cast v11, Lwth;

    invoke-virtual {v11, v4, v5}, Lwth;->P(FF)V

    :try_start_4fa
    iget-object v8, v8, Lltf;->k:Ld91;

    new-instance v31, Lqik;

    const/16 v25, 0x0

    const/16 v28, 0x1e

    const/16 v27, 0x0

    const/16 v24, 0x0

    move-object/from16 v23, v31

    invoke-direct/range {v23 .. v28}, Lqik;-><init>(IIFFI)V

    const/16 v32, 0x34

    move-object/from16 v27, v30

    const/16 v30, 0x0

    move-object/from16 v28, v8

    invoke-static/range {v27 .. v32}, Lmk7;->m0(Lmk7;Ld91;Ldz3;FLnk7;I)V

    move-object/from16 v30, v27

    invoke-interface/range {v30 .. v30}, Lmk7;->e()J

    move-result-wide v13

    shr-long v13, v13, p1

    long-to-int v8, v13

    invoke-static {v8}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v8

    add-float v8, v8, p0

    invoke-interface/range {v30 .. v30}, Lmk7;->e()J

    move-result-wide v13

    shr-long v13, v13, p1

    long-to-int v11, v13

    invoke-static {v11}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v11

    div-float/2addr v8, v11

    invoke-interface/range {v30 .. v30}, Lmk7;->e()J

    move-result-wide v13

    and-long v13, v13, v16

    long-to-int v11, v13

    invoke-static {v11}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v11

    add-float v11, v11, p0

    invoke-interface/range {v30 .. v30}, Lmk7;->e()J

    move-result-wide v13

    and-long v13, v13, v16

    long-to-int v13, v13

    invoke-static {v13}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v13

    div-float/2addr v11, v13

    invoke-interface/range {v30 .. v30}, Lmk7;->w0()J

    move-result-wide v13

    move-object/from16 v16, v6

    move-object/from16 v17, v7

    invoke-virtual {v3}, Ld5o;->D()J

    move-result-wide v6

    invoke-virtual {v3}, Ld5o;->A()Lsh4;

    move-result-object v23

    invoke-interface/range {v23 .. v23}, Lsh4;->j()V
    :try_end_55d
    .catchall {:try_start_4fa .. :try_end_55d} :catchall_5bd

    move-object/from16 p0, v1

    :try_start_55f
    iget-object v1, v3, Ld5o;->a:Ljava/lang/Object;

    check-cast v1, Lwth;

    invoke-virtual {v1, v8, v11, v13, v14}, Lwth;->N(FFJ)V

    const/16 v31, 0x0

    const/16 v32, 0x1c

    move-object/from16 v27, v30

    const/16 v30, 0x0

    move-object/from16 v28, v18

    invoke-static/range {v27 .. v32}, Lmk7;->m0(Lmk7;Ld91;Ldz3;FLnk7;I)V
    :try_end_573
    .catchall {:try_start_55f .. :try_end_573} :catchall_5b1

    :try_start_573
    invoke-virtual {v3}, Ld5o;->A()Lsh4;

    move-result-object v1

    invoke-interface {v1}, Lsh4;->f()V

    invoke-virtual {v3, v6, v7}, Ld5o;->K(J)V
    :try_end_57d
    .catchall {:try_start_573 .. :try_end_57d} :catchall_5bd

    iget-object v1, v3, Ld5o;->a:Ljava/lang/Object;

    check-cast v1, Lwth;

    neg-float v3, v4

    neg-float v4, v5

    invoke-virtual {v1, v3, v4}, Lwth;->P(FF)V

    invoke-virtual/range {v17 .. v17}, La31;->f()V

    iput-object v15, v0, Lth4;->a:Ln27;

    iput-object v2, v0, Lth4;->b:Ld2c;

    move-object/from16 v1, v37

    iput-object v1, v0, Lth4;->c:Lsh4;

    iput-wide v9, v0, Lth4;->d:J

    move-object/from16 v6, v16

    iget-object v0, v6, Lj71;->a:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->prepareToDraw()V

    iput-object v6, v12, Lpqh;->a:Ljava/lang/Object;

    new-instance v18, Ldo3;

    const/16 v24, 0x0

    move-object/from16 v23, v20

    move-object/from16 v20, v12

    invoke-direct/range {v18 .. v24}, Ldo3;-><init>(Ljava/lang/Object;Ljava/lang/Object;JLjava/lang/Object;B)V

    move-object/from16 v1, p0

    move-object/from16 v0, v18

    invoke-virtual {v1, v0}, Lg74;->a(Lkotlin/jvm/functions/Function1;)Lqe6;

    move-result-object v11

    goto/16 :goto_69a

    :catchall_5b1
    move-exception v0

    :try_start_5b2
    invoke-virtual {v3}, Ld5o;->A()Lsh4;

    move-result-object v1

    invoke-interface {v1}, Lsh4;->f()V

    invoke-virtual {v3, v6, v7}, Ld5o;->K(J)V

    throw v0
    :try_end_5bd
    .catchall {:try_start_5b2 .. :try_end_5bd} :catchall_5bd

    :catchall_5bd
    move-exception v0

    iget-object v1, v3, Ld5o;->a:Ljava/lang/Object;

    check-cast v1, Lwth;

    neg-float v2, v4

    neg-float v3, v5

    invoke-virtual {v1, v2, v3}, Lwth;->P(FF)V

    throw v0

    :cond_5c8
    instance-of v3, v8, Lntf;

    if-eqz v3, :cond_65b

    iget-object v3, v0, Leo3;->s:Lnvj;

    check-cast v8, Lntf;

    iget-object v4, v8, Lntf;->k:Lh8i;

    invoke-static {v4}, Lioh;->s(Lh8i;)Z

    move-result v5

    if-eqz v5, :cond_5f9

    iget-wide v4, v4, Lh8i;->e:J

    new-instance v23, Lqik;

    const/4 v14, 0x0

    const/16 v17, 0x1e

    const/4 v13, 0x0

    const/16 v16, 0x0

    move-object/from16 v12, v23

    invoke-direct/range {v12 .. v17}, Lqik;-><init>(IIFFI)V

    new-instance v12, Lco3;

    move/from16 v17, v2

    move-object v14, v3

    move v13, v7

    move/from16 v18, v15

    move-wide v15, v4

    invoke-direct/range {v12 .. v23}, Lco3;-><init>(ZLnvj;JFFJJLqik;)V

    invoke-virtual {v1, v12}, Lg74;->a(Lkotlin/jvm/functions/Function1;)Lqe6;

    move-result-object v11

    goto/16 :goto_69a

    :cond_5f9
    move-object v2, v3

    move v13, v7

    iget-object v3, v0, Leo3;->q:Lxn3;

    if-nez v3, :cond_606

    new-instance v3, Lxn3;

    invoke-direct {v3}, Lxn3;-><init>()V

    iput-object v3, v0, Leo3;->q:Lxn3;

    :cond_606
    iget-object v0, v3, Lxn3;->d:Ld91;

    if-nez v0, :cond_610

    invoke-static {}, Lf91;->a()Ld91;

    move-result-object v0

    iput-object v0, v3, Lxn3;->d:Ld91;

    :cond_610
    invoke-virtual {v0}, Ld91;->g()V

    invoke-static {v0, v4}, Ld91;->c(Ld91;Lh8i;)V

    if-nez v13, :cond_650

    invoke-static {}, Lf91;->a()Ld91;

    move-result-object v3

    iget v5, v4, Lh8i;->c:F

    iget v6, v4, Lh8i;->a:F

    sub-float/2addr v5, v6

    sub-float/2addr v5, v15

    iget v6, v4, Lh8i;->d:F

    iget v7, v4, Lh8i;->b:F

    sub-float/2addr v6, v7

    sub-float v16, v6, v15

    iget-wide v6, v4, Lh8i;->e:J

    invoke-static {v6, v7, v15}, Llcp;->H(JF)J

    move-result-wide v17

    iget-wide v6, v4, Lh8i;->f:J

    invoke-static {v6, v7, v15}, Llcp;->H(JF)J

    move-result-wide v19

    iget-wide v6, v4, Lh8i;->h:J

    invoke-static {v6, v7, v15}, Llcp;->H(JF)J

    move-result-wide v23

    iget-wide v6, v4, Lh8i;->g:J

    invoke-static {v6, v7, v15}, Llcp;->H(JF)J

    move-result-wide v21

    new-instance v12, Lh8i;

    move v14, v15

    move v13, v15

    move v15, v5

    invoke-direct/range {v12 .. v24}, Lh8i;-><init>(FFFFJJJJ)V

    invoke-static {v3, v12}, Ld91;->c(Ld91;Lh8i;)V

    const/4 v4, 0x0

    invoke-virtual {v0, v0, v3, v4}, Ld91;->f(Ld91;Ld91;I)Z

    :cond_650
    new-instance v3, Lcv2;

    const/4 v4, 0x7

    invoke-direct {v3, v0, v2, v4}, Lcv2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v3}, Lg74;->a(Lkotlin/jvm/functions/Function1;)Lqe6;

    move-result-object v11

    goto :goto_69a

    :cond_65b
    move v13, v7

    instance-of v2, v8, Lmtf;

    if-eqz v2, :cond_68b

    iget-object v4, v0, Leo3;->s:Lnvj;

    if-eqz v13, :cond_674

    iget-object v0, v1, Lg74;->a:Le14;

    invoke-interface {v0}, Le14;->e()J

    move-result-wide v21

    const-wide/16 v19, 0x0

    sget-object v0, La39;->a:La39;

    move-object v9, v0

    :goto_66f
    move-wide/from16 v5, v19

    move-wide/from16 v7, v21

    goto :goto_681

    :cond_674
    new-instance v12, Lqik;

    const/4 v14, 0x0

    const/16 v17, 0x1e

    const/4 v13, 0x0

    const/16 v16, 0x0

    invoke-direct/range {v12 .. v17}, Lqik;-><init>(IIFFI)V

    move-object v9, v12

    goto :goto_66f

    :goto_681
    new-instance v3, Lao3;

    invoke-direct/range {v3 .. v9}, Lao3;-><init>(Lnvj;JJLnk7;)V

    invoke-virtual {v1, v3}, Lg74;->a(Lkotlin/jvm/functions/Function1;)Lqe6;

    move-result-object v11

    goto :goto_69a

    :cond_68b
    invoke-static {}, Lh9o;->p()V

    goto :goto_69a

    :cond_68f
    new-instance v0, Lf32;

    const/16 v2, 0x1b

    invoke-direct {v0, v2}, Lf32;-><init>(B)V

    invoke-virtual {v1, v0}, Lg74;->a(Lkotlin/jvm/functions/Function1;)Lqe6;

    move-result-object v11

    :goto_69a
    return-object v11

    nop

    :pswitch_data_69c
    .packed-switch 0x0
        :pswitch_2fb
        :pswitch_2d2
        :pswitch_2c8
        :pswitch_2be
        :pswitch_2a9
        :pswitch_2a0
        :pswitch_287
        :pswitch_267
        :pswitch_252
        :pswitch_225
        :pswitch_1c5
        :pswitch_1b3
        :pswitch_187
        :pswitch_17b
        :pswitch_169
        :pswitch_15c
        :pswitch_14e
        :pswitch_12d
        :pswitch_123
        :pswitch_f9
        :pswitch_e5
        :pswitch_d0
        :pswitch_b5
        :pswitch_a8
        :pswitch_9b
        :pswitch_7a
        :pswitch_69
        :pswitch_56
        :pswitch_23
    .end packed-switch
.end method
