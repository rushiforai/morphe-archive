.class public final synthetic Lnqi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 10
    iput-byte p2, p0, Lnqi;->a:B

    iput-object p1, p0, Lnqi;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lsjl;I)V
    .registers 3

    const/16 p2, 0xf

    iput-byte p2, p0, Lnqi;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnqi;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 40

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    iget-byte v3, v0, Lnqi;->a:B

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    iget-object v0, v0, Lnqi;->b:Ljava/lang/Object;

    packed-switch v3, :pswitch_data_770

    check-cast v0, Ltd3;

    check-cast v1, Lgcb;

    move-object v6, v2

    check-cast v6, Ld2c;

    const-wide/16 v2, 0x0

    iget-wide v4, v1, Lgcb;->a:J

    move-object v1, v0

    invoke-virtual/range {v1 .. v6}, Ltd3;->a(JJLd2c;)J

    move-result-wide v0

    new-instance v2, Lybb;

    invoke-direct {v2, v0, v1}, Lybb;-><init>(J)V

    return-object v2

    :pswitch_27
    check-cast v0, Lsd3;

    check-cast v1, Lgcb;

    check-cast v2, Ld2c;

    iget-wide v1, v1, Lgcb;->a:J

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    long-to-int v1, v1

    invoke-virtual {v0, v7, v1}, Lsd3;->a(II)I

    move-result v0

    int-to-long v0, v0

    and-long/2addr v0, v3

    new-instance v2, Lybb;

    invoke-direct {v2, v0, v1}, Lybb;-><init>(J)V

    return-object v2

    :pswitch_42
    check-cast v0, Lxol;

    check-cast v1, Landroid/content/Context;

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v0, Lxol;->c:Ljava/lang/Object;

    check-cast v0, Lk7o;

    if-eqz v0, :cond_56

    iget-object v0, v0, Lk7o;->h:Loyj;

    invoke-virtual {v0, v1, v2}, Loyj;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_56
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_59
    check-cast v0, Lcom/opera/android/startup/WelcomeActivity;

    check-cast v1, Ljava/lang/String;

    check-cast v2, Llqm;

    sget v2, Lcom/opera/android/startup/WelcomeActivity;->w:I

    const-string v2, ""

    new-instance v3, Lqxh;

    invoke-direct {v3, v2}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-static {v0, v1, v3}, Lcom/opera/android/FullscreenWebActivity;->z0(Landroid/content/Context;Ljava/lang/String;Lpxh;)V

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0

    :pswitch_6e
    check-cast v0, Lmyn;

    check-cast v1, Lih5;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    and-int/lit8 v3, v2, 0x3

    if-eq v3, v5, :cond_7d

    move v7, v6

    :cond_7d
    and-int/2addr v2, v6

    check-cast v1, Lvt9;

    invoke-virtual {v1, v2, v7}, Lvt9;->N(IZ)Z

    move-result v2

    if-eqz v2, :cond_b8

    iget-object v0, v0, Lmyn;->d:Lt0g;

    invoke-virtual {v0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_92

    const-string v0, ""

    :cond_92
    move-object v8, v0

    const/16 v28, 0x6180

    const v29, 0x3affe

    const/4 v9, 0x0

    const-wide/16 v10, 0x0

    const-wide/16 v12, 0x0

    const/4 v14, 0x0

    const-wide/16 v15, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const-wide/16 v19, 0x0

    const/16 v21, 0x2

    const/16 v22, 0x0

    const/16 v23, 0x1

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v27, 0x0

    move-object/from16 v26, v1

    invoke-static/range {v8 .. v29}, Lijl;->b(Ljava/lang/String;Lc8e;JJLki9;JLbgl;Lpel;JIZIILikl;Lih5;III)V

    goto :goto_bd

    :cond_b8
    move-object/from16 v26, v1

    invoke-virtual/range {v26 .. v26}, Lvt9;->Q()V

    :goto_bd
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_c0
    check-cast v0, Lmqn;

    check-cast v1, Ljava/lang/Runnable;

    check-cast v2, Lpn7;

    iget-object v0, v0, Llqn;->I:Lp8f;

    if-eqz v0, :cond_d7

    iget-object v0, v0, Lp8f;->b:Ljava/lang/Object;

    check-cast v0, Lzll;

    iget-wide v2, v2, Lpn7;->a:J

    invoke-static {v2, v3}, Lpn7;->f(J)J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    :cond_d7
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_da
    check-cast v0, Laaf;

    check-cast v1, Ljava/lang/String;

    check-cast v2, Ljava/util/List;

    const-string v3, "Content-Length"

    invoke-virtual {v3, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_eb

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_135

    :cond_eb
    const-string v3, "Content-Type"

    invoke-virtual {v3, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_f6

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_135

    :cond_f6
    sget-object v3, Ljzm;->a:Ljava/util/Set;

    invoke-interface {v3, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_114

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_104
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_133

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Laaf;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_104

    :cond_114
    const-string v3, "Cookie"

    invoke-virtual {v3, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_120

    const-string v3, "; "

    :goto_11e
    move-object v5, v3

    goto :goto_123

    :cond_120
    const-string v3, ","

    goto :goto_11e

    :goto_123
    move-object v4, v2

    check-cast v4, Ljava/lang/Iterable;

    const/4 v9, 0x0

    const/16 v10, 0x3e

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static/range {v4 .. v10}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Laaf;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_133
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_135
    return-object v0

    :pswitch_136
    check-cast v0, Ltgm;

    check-cast v1, Ljava/lang/String;

    check-cast v2, Ljava/util/List;

    iget-object v0, v0, Ltgm;->i:Ld0g;

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v0, v1, v2}, Ldik;->e(Ljava/lang/String;Ljava/lang/Iterable;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_146
    check-cast v0, Lsjl;

    check-cast v1, Lih5;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v6}, Laoh;->m(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lsjl;->a(Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_159
    check-cast v0, Landroid/app/RemoteAction;

    check-cast v1, Lih5;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    check-cast v1, Lvt9;

    const v2, -0x520d2714

    invoke-virtual {v1, v2}, Lvt9;->W(I)V

    invoke-virtual {v0}, Landroid/app/RemoteAction;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v7}, Lvt9;->p(Z)V

    return-object v0

    :pswitch_176
    check-cast v0, Landroid/view/textclassifier/TextClassification;

    check-cast v1, Lih5;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    check-cast v1, Lvt9;

    const v2, 0x38a0c7d5

    invoke-virtual {v1, v2}, Lvt9;->W(I)V

    invoke-virtual {v0}, Landroid/view/textclassifier/TextClassification;->getLabel()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v7}, Lvt9;->p(Z)V

    return-object v0

    :pswitch_193
    check-cast v0, Lr9l;

    check-cast v1, Lpn7;

    check-cast v2, Lpn7;

    iget-object v0, v0, Lr9l;->g:Ljo3;

    iget-wide v3, v1, Lpn7;->a:J

    iget-wide v1, v2, Lpn7;->a:J

    iget-object v5, v0, Ljo3;->a:Lcom/opera/android/bar/BottomBar;

    invoke-virtual {v5}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v5

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-virtual {v5, v6}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v5

    invoke-static {v3, v4}, Lpn7;->f(J)J

    move-result-wide v3

    sget-wide v6, Ljo3;->b:J

    invoke-static {v6, v7}, Lpn7;->f(J)J

    move-result-wide v6

    sub-long/2addr v3, v6

    const-wide/16 v6, 0x0

    cmp-long v8, v3, v6

    if-gez v8, :cond_1bd

    move-wide v3, v6

    :cond_1bd
    invoke-virtual {v5, v3, v4}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    invoke-static {v1, v2}, Lpn7;->f(J)J

    move-result-wide v1

    invoke-virtual {v3, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    new-instance v2, Lfv2;

    const/16 v3, 0x11

    invoke-direct {v2, v0, v3}, Lfv2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1da
    check-cast v0, Lmrk;

    check-cast v1, Lkqk;

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iget-object v3, v0, Lmrk;->J:Lcom/opera/android/suggestion/SuggestionManagerBridge;

    iget-wide v3, v3, Lcom/opera/android/suggestion/SuggestionManagerBridge;->a:J

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    invoke-static {v3, v4, v1, v2}, LJ/N;->MBRDh_KB(JIZ)V

    invoke-virtual {v0}, Lmrk;->g()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1f5
    check-cast v0, Leik;

    check-cast v1, Ljava/lang/String;

    check-cast v2, Ljava/util/List;

    check-cast v2, Ljava/lang/Iterable;

    invoke-virtual {v0, v1, v2}, Leik;->e(Ljava/lang/String;Ljava/lang/Iterable;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_203
    check-cast v0, Lt1k;

    check-cast v1, Lih5;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    and-int/lit8 v3, v2, 0x3

    if-eq v3, v5, :cond_213

    move v3, v6

    goto :goto_214

    :cond_213
    move v3, v7

    :goto_214
    and-int/2addr v2, v6

    check-cast v1, Lvt9;

    invoke-virtual {v1, v2, v3}, Lvt9;->N(IZ)Z

    move-result v2

    if-eqz v2, :cond_260

    const v2, -0x66ead076

    invoke-virtual {v1, v2}, Lvt9;->W(I)V

    iget-object v0, v0, Lt1k;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_237

    sget-object v0, Ldhk;->o:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lshk;

    invoke-static {v0, v1}, Luyg;->q(Lshk;Lih5;)Ljava/lang/String;

    move-result-object v0

    :cond_237
    move-object v8, v0

    invoke-virtual {v1, v7}, Lvt9;->p(Z)V

    const/16 v28, 0x0

    const v29, 0x3fffe

    const/4 v9, 0x0

    const-wide/16 v10, 0x0

    const-wide/16 v12, 0x0

    const/4 v14, 0x0

    const-wide/16 v15, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const-wide/16 v19, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v27, 0x0

    move-object/from16 v26, v1

    invoke-static/range {v8 .. v29}, Lijl;->b(Ljava/lang/String;Lc8e;JJLki9;JLbgl;Lpel;JIZIILikl;Lih5;III)V

    goto :goto_265

    :cond_260
    move-object/from16 v26, v1

    invoke-virtual/range {v26 .. v26}, Lvt9;->Q()V

    :goto_265
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_268
    check-cast v0, Ltuj;

    check-cast v1, Ljava/util/Set;

    check-cast v2, Lttj;

    iget-object v2, v0, Ltuj;->e:Ljava/lang/Object;

    check-cast v2, Ljava/util/concurrent/atomic/AtomicReference;

    :goto_272
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_27c

    move-object v8, v1

    check-cast v8, Ljava/util/Collection;

    goto :goto_29e

    :cond_27c
    instance-of v8, v3, Ljava/util/Set;

    if-eqz v8, :cond_28d

    new-array v8, v5, [Ljava/util/Set;

    aput-object v3, v8, v7

    aput-object v1, v8, v6

    invoke-static {v8}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    check-cast v8, Ljava/util/Collection;

    goto :goto_29e

    :cond_28d
    instance-of v8, v3, Ljava/util/List;

    if-eqz v8, :cond_2c0

    move-object v8, v3

    check-cast v8, Ljava/util/Collection;

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    check-cast v9, Ljava/lang/Iterable;

    invoke-static {v9, v8}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v8

    :cond_29e
    :goto_29e
    invoke-virtual {v2, v3, v8}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2b9

    invoke-virtual {v0}, Ltuj;->d()Z

    move-result v1

    if-eqz v1, :cond_2b6

    iget-object v1, v0, Ltuj;->d:Ljava/lang/Object;

    check-cast v1, Lkotlin/jvm/functions/Function1;

    new-instance v2, Ldnj;

    invoke-direct {v2, v0, v6}, Ldnj;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v1, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2b6
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_2c8

    :cond_2b9
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v9

    if-eq v9, v3, :cond_29e

    goto :goto_272

    :cond_2c0
    const-string v0, "Unexpected notification"

    invoke-static {v0}, Lmh5;->b(Ljava/lang/String;)Ljava/lang/Void;

    invoke-static {}, Lt3p;->v()V

    :goto_2c8
    return-object v4

    :pswitch_2c9
    check-cast v0, Lemj;

    check-cast v1, Ljava/util/Set;

    check-cast v2, Lttj;

    iget-object v2, v0, La7f;->b:Ljava/lang/Object;

    monitor-enter v2

    :try_start_2d2
    iget-object v3, v0, Lemj;->e:Ltee;

    if-nez v3, :cond_2e3

    check-cast v1, Ljava/lang/Iterable;

    iget-object v3, v0, Lemj;->c:Ljava/lang/Object;

    invoke-static {v1, v3}, Lkotlin/collections/CollectionsKt;->E(Ljava/lang/Iterable;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_32a

    iget-object v4, v0, Lemj;->g:Lor4;

    goto :goto_32a

    :cond_2e3
    iget-object v6, v3, Ltee;->b:[Ljava/lang/Object;

    iget-object v3, v3, Ltee;->a:[J

    array-length v8, v3

    sub-int/2addr v8, v5

    if-ltz v8, :cond_32a

    move v5, v7

    :goto_2ec
    aget-wide v9, v3, v5

    not-long v11, v9

    const/4 v13, 0x7

    shl-long/2addr v11, v13

    and-long/2addr v11, v9

    const-wide v13, -0x7f7f7f7f7f7f7f80L    # -2.937446524422997E-306

    and-long/2addr v11, v13

    cmp-long v11, v11, v13

    if-eqz v11, :cond_325

    sub-int v11, v5, v8

    not-int v11, v11

    ushr-int/lit8 v11, v11, 0x1f

    const/16 v12, 0x8

    rsub-int/lit8 v11, v11, 0x8

    move v13, v7

    :goto_306
    if-ge v13, v11, :cond_323

    const-wide/16 v14, 0xff

    and-long/2addr v14, v9

    const-wide/16 v16, 0x80

    cmp-long v14, v14, v16

    if-gez v14, :cond_31f

    shl-int/lit8 v14, v5, 0x3

    add-int/2addr v14, v13

    aget-object v14, v6, v14

    invoke-interface {v1, v14}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_31f

    iget-object v4, v0, Lemj;->g:Lor4;
    :try_end_31e
    .catchall {:try_start_2d2 .. :try_end_31e} :catchall_335

    goto :goto_32a

    :cond_31f
    shr-long/2addr v9, v12

    add-int/lit8 v13, v13, 0x1

    goto :goto_306

    :cond_323
    if-ne v11, v12, :cond_32a

    :cond_325
    if-eq v5, v8, :cond_32a

    add-int/lit8 v5, v5, 0x1

    goto :goto_2ec

    :cond_32a
    :goto_32a
    monitor-exit v2

    if-eqz v4, :cond_332

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-interface {v4, v0}, Lc1j;->b(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_332
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :catchall_335
    move-exception v0

    monitor-exit v2

    throw v0

    :pswitch_338
    check-cast v0, Lqjj;

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iget-object v0, v0, Lqjj;->b:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_346
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_36f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le9f;

    iget-object v4, v3, Le9f;->a:Lt5h;

    iget-object v4, v4, Lt5h;->a:Loee;

    invoke-interface {v4, v1}, Lwtb;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    iget-object v3, v3, Le9f;->a:Lt5h;

    if-eq v2, v4, :cond_366

    move v4, v6

    goto :goto_367

    :cond_366
    move v4, v7

    :goto_367
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v3, v1, v4}, Lt5h;->q(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_346

    :cond_36f
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_372
    check-cast v0, Lgcj;

    check-cast v1, Landroid/net/Uri;

    check-cast v2, Ljava/lang/String;

    sget-object v3, Lgcj;->y:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {v0}, Lryl;->g0()V

    iget-object v3, v0, Lgcj;->v:Lysj;

    new-instance v4, Lcf7;

    invoke-direct {v4, v0, v2, v1}, Lcf7;-><init>(Lgcj;Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {v3, v4, v0}, Lr22;->b(Ljjm;Lijm;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_38f
    check-cast v0, La21;

    check-cast v1, Ljava/util/List;

    move-object v1, v2

    check-cast v1, Ljava/util/List;

    check-cast v1, Ljava/lang/Iterable;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_3a1
    :goto_3a1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3dc

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lomh;

    iget-object v5, v0, La21;->f:Ljava/lang/Object;

    check-cast v5, Lami;

    iget v3, v3, Lomh;->a:I

    iget-object v6, v5, Lami;->f:Ljava/lang/Object;

    check-cast v6, Landroid/util/SparseIntArray;

    invoke-virtual {v6, v3}, Landroid/util/SparseIntArray;->get(I)I

    move-result v6

    iget-object v7, v5, Lami;->e:Ljava/lang/Object;

    check-cast v7, Ljava/util/ArrayList;

    invoke-static {v6, v7}, Lkotlin/collections/CollectionsKt;->M(ILjava/util/List;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ll6j;

    if-eqz v6, :cond_3d5

    iget v7, v6, Ll6j;->a:I

    if-ne v7, v3, :cond_3d5

    iget-boolean v7, v6, Ll6j;->g:Z

    if-eqz v7, :cond_3d5

    invoke-virtual {v5, v3}, Lami;->i(I)Z

    move-result v3

    if-nez v3, :cond_3d6

    :cond_3d5
    move-object v6, v4

    :cond_3d6
    if-eqz v6, :cond_3a1

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3a1

    :cond_3dc
    return-object v2

    :pswitch_3dd
    check-cast v0, Loqh;

    check-cast v1, Llmg;

    check-cast v2, Ly8f;

    invoke-virtual {v1}, Llmg;->a()V

    iget-wide v1, v2, Ly8f;->a:J

    iput-wide v1, v0, Loqh;->a:J

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3ed
    move-object v10, v0

    check-cast v10, Lisi;

    move-object v0, v1

    check-cast v0, Lih5;

    move-object v1, v2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sget-object v2, Lhh5;->a:Lzpa;

    and-int/lit8 v3, v1, 0x3

    if-eq v3, v5, :cond_401

    move v7, v6

    :cond_401
    and-int/2addr v1, v6

    check-cast v0, Lvt9;

    invoke-virtual {v0, v1, v7}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_74d

    invoke-virtual {v10}, Lisi;->o0()Lqsi;

    move-result-object v1

    iget-object v1, v1, Lqsi;->e:Lrlh;

    invoke-static {v1, v0}, Ldyg;->h(Llak;Lih5;)Lafe;

    move-result-object v1

    invoke-interface {v1}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmsi;

    invoke-virtual {v0, v10}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v3

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v4

    if-nez v3, :cond_426

    if-ne v4, v2, :cond_439

    :cond_426
    new-instance v8, Le6g;

    const-class v11, Lisi;

    const-string v12, "close"

    const-string v13, "close()V"

    const/4 v14, 0x0

    const/16 v15, 0x14

    const/4 v9, 0x0

    invoke-direct/range {v8 .. v15}, Le6g;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v0, v8}, Lvt9;->g0(Ljava/lang/Object;)V

    move-object v4, v8

    :cond_439
    check-cast v4, Lmtb;

    move-object v12, v4

    check-cast v12, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v10}, Lisi;->o0()Lqsi;

    move-result-object v15

    invoke-virtual {v0, v15}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v3

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v4

    if-nez v3, :cond_44e

    if-ne v4, v2, :cond_462

    :cond_44e
    new-instance v13, Le6g;

    const-class v16, Lqsi;

    const-string v17, "onSearchClick"

    const-string v18, "onSearchClick()V"

    const/16 v19, 0x0

    const/16 v20, 0x15

    const/4 v14, 0x0

    invoke-direct/range {v13 .. v20}, Le6g;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v0, v13}, Lvt9;->g0(Ljava/lang/Object;)V

    move-object v4, v13

    :cond_462
    check-cast v4, Lmtb;

    move-object v13, v4

    check-cast v13, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v10}, Lisi;->o0()Lqsi;

    move-result-object v3

    invoke-virtual {v0, v3}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v5

    if-nez v4, :cond_477

    if-ne v5, v2, :cond_48d

    :cond_477
    new-instance v14, Le6g;

    const-class v17, Lqsi;

    const-string v18, "onDefaultSearchEngineClicked"

    const-string v19, "onDefaultSearchEngineClicked()V"

    const/16 v20, 0x0

    const/16 v21, 0x16

    const/4 v15, 0x0

    move-object/from16 v16, v3

    invoke-direct/range {v14 .. v21}, Le6g;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v0, v14}, Lvt9;->g0(Ljava/lang/Object;)V

    move-object v5, v14

    :cond_48d
    check-cast v5, Lmtb;

    move-object v14, v5

    check-cast v14, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v10}, Lisi;->o0()Lqsi;

    move-result-object v3

    invoke-virtual {v0, v3}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v5

    if-nez v4, :cond_4a2

    if-ne v5, v2, :cond_4b9

    :cond_4a2
    new-instance v15, Lldh;

    const-class v18, Lqsi;

    const-string v19, "onGoogleAIModeSwitchChanged"

    const-string v20, "onGoogleAIModeSwitchChanged(Z)V"

    const/16 v21, 0x0

    const/16 v22, 0x16

    const/16 v16, 0x1

    move-object/from16 v17, v3

    invoke-direct/range {v15 .. v22}, Lldh;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v0, v15}, Lvt9;->g0(Ljava/lang/Object;)V

    move-object v5, v15

    :cond_4b9
    check-cast v5, Lmtb;

    move-object v15, v5

    check-cast v15, Lkotlin/jvm/functions/Function1;

    invoke-virtual {v10}, Lisi;->o0()Lqsi;

    move-result-object v3

    invoke-virtual {v0, v3}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v5

    if-nez v4, :cond_4ce

    if-ne v5, v2, :cond_4e6

    :cond_4ce
    new-instance v16, Le6g;

    const-class v19, Lqsi;

    const-string v20, "onAiSearchClicked"

    const-string v21, "onAiSearchClicked()V"

    const/16 v22, 0x0

    const/16 v23, 0x17

    const/16 v17, 0x0

    move-object/from16 v18, v3

    invoke-direct/range {v16 .. v23}, Le6g;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v5, v16

    invoke-virtual {v0, v5}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_4e6
    check-cast v5, Lmtb;

    move-object/from16 v16, v5

    check-cast v16, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v10}, Lisi;->o0()Lqsi;

    move-result-object v3

    invoke-virtual {v0, v3}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v5

    if-nez v4, :cond_4fc

    if-ne v5, v2, :cond_514

    :cond_4fc
    new-instance v17, Le6g;

    const-class v20, Lqsi;

    const-string v21, "onSearchWidgetClicked"

    const-string v22, "onSearchWidgetClicked()V"

    const/16 v23, 0x0

    const/16 v24, 0x18

    const/16 v18, 0x0

    move-object/from16 v19, v3

    invoke-direct/range {v17 .. v24}, Le6g;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v5, v17

    invoke-virtual {v0, v5}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_514
    check-cast v5, Lmtb;

    move-object/from16 v17, v5

    check-cast v17, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v10}, Lisi;->o0()Lqsi;

    move-result-object v3

    invoke-virtual {v0, v3}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v5

    if-nez v4, :cond_52a

    if-ne v5, v2, :cond_542

    :cond_52a
    new-instance v18, Lldh;

    const-class v21, Lqsi;

    const-string v22, "onRecommendationsSwitchChanged"

    const-string v23, "onRecommendationsSwitchChanged(Z)V"

    const/16 v24, 0x0

    const/16 v25, 0x17

    const/16 v19, 0x1

    move-object/from16 v20, v3

    invoke-direct/range {v18 .. v25}, Lldh;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v5, v18

    invoke-virtual {v0, v5}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_542
    check-cast v5, Lmtb;

    move-object/from16 v18, v5

    check-cast v18, Lkotlin/jvm/functions/Function1;

    invoke-virtual {v10}, Lisi;->o0()Lqsi;

    move-result-object v3

    invoke-virtual {v0, v3}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v5

    if-nez v4, :cond_558

    if-ne v5, v2, :cond_570

    :cond_558
    new-instance v19, Lldh;

    const-class v22, Lqsi;

    const-string v23, "onSuggestAiPromptsSwitchChanged"

    const-string v24, "onSuggestAiPromptsSwitchChanged(Z)V"

    const/16 v25, 0x0

    const/16 v26, 0x18

    const/16 v20, 0x1

    move-object/from16 v21, v3

    invoke-direct/range {v19 .. v26}, Lldh;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v5, v19

    invoke-virtual {v0, v5}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_570
    check-cast v5, Lmtb;

    move-object/from16 v19, v5

    check-cast v19, Lkotlin/jvm/functions/Function1;

    invoke-virtual {v10}, Lisi;->o0()Lqsi;

    move-result-object v3

    invoke-virtual {v0, v3}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v5

    if-nez v4, :cond_586

    if-ne v5, v2, :cond_59e

    :cond_586
    new-instance v20, Lldh;

    const-class v23, Lqsi;

    const-string v24, "onSuggestedSpeedDialsSwitchChanged"

    const-string v25, "onSuggestedSpeedDialsSwitchChanged(Z)V"

    const/16 v26, 0x0

    const/16 v27, 0x19

    const/16 v21, 0x1

    move-object/from16 v22, v3

    invoke-direct/range {v20 .. v27}, Lldh;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v5, v20

    invoke-virtual {v0, v5}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_59e
    check-cast v5, Lmtb;

    move-object/from16 v20, v5

    check-cast v20, Lkotlin/jvm/functions/Function1;

    invoke-virtual {v10}, Lisi;->o0()Lqsi;

    move-result-object v3

    invoke-virtual {v0, v3}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v5

    if-nez v4, :cond_5b4

    if-ne v5, v2, :cond_5cc

    :cond_5b4
    new-instance v21, Lldh;

    const-class v24, Lqsi;

    const-string v25, "onTrendingSearchesSwitchChanged"

    const-string v26, "onTrendingSearchesSwitchChanged(Z)V"

    const/16 v27, 0x0

    const/16 v28, 0xd

    const/16 v22, 0x1

    move-object/from16 v23, v3

    invoke-direct/range {v21 .. v28}, Lldh;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v5, v21

    invoke-virtual {v0, v5}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_5cc
    check-cast v5, Lmtb;

    move-object/from16 v21, v5

    check-cast v21, Lkotlin/jvm/functions/Function1;

    invoke-virtual {v10}, Lisi;->o0()Lqsi;

    move-result-object v3

    invoke-virtual {v0, v3}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v5

    if-nez v4, :cond_5e2

    if-ne v5, v2, :cond_5fa

    :cond_5e2
    new-instance v22, Lldh;

    const-class v25, Lqsi;

    const-string v26, "onProductSuggestionsSwitchChanged"

    const-string v27, "onProductSuggestionsSwitchChanged(Z)V"

    const/16 v28, 0x0

    const/16 v29, 0xe

    const/16 v23, 0x1

    move-object/from16 v24, v3

    invoke-direct/range {v22 .. v29}, Lldh;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v5, v22

    invoke-virtual {v0, v5}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_5fa
    check-cast v5, Lmtb;

    move-object/from16 v22, v5

    check-cast v22, Lkotlin/jvm/functions/Function1;

    invoke-virtual {v10}, Lisi;->o0()Lqsi;

    move-result-object v3

    invoke-virtual {v0, v3}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v5

    if-nez v4, :cond_610

    if-ne v5, v2, :cond_628

    :cond_610
    new-instance v23, Lldh;

    const-class v26, Lqsi;

    const-string v27, "onFrequentlyVisitedSitesSwitchChanged"

    const-string v28, "onFrequentlyVisitedSitesSwitchChanged(Z)V"

    const/16 v29, 0x0

    const/16 v30, 0xf

    const/16 v24, 0x1

    move-object/from16 v25, v3

    invoke-direct/range {v23 .. v30}, Lldh;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v5, v23

    invoke-virtual {v0, v5}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_628
    check-cast v5, Lmtb;

    move-object/from16 v23, v5

    check-cast v23, Lkotlin/jvm/functions/Function1;

    invoke-virtual {v10}, Lisi;->o0()Lqsi;

    move-result-object v3

    invoke-virtual {v0, v3}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v5

    if-nez v4, :cond_63e

    if-ne v5, v2, :cond_656

    :cond_63e
    new-instance v24, Lldh;

    const-class v27, Lqsi;

    const-string v28, "onRecentSearchesSwitchChanged"

    const-string v29, "onRecentSearchesSwitchChanged(Z)V"

    const/16 v30, 0x0

    const/16 v31, 0x10

    const/16 v25, 0x1

    move-object/from16 v26, v3

    invoke-direct/range {v24 .. v31}, Lldh;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v5, v24

    invoke-virtual {v0, v5}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_656
    check-cast v5, Lmtb;

    move-object/from16 v24, v5

    check-cast v24, Lkotlin/jvm/functions/Function1;

    invoke-virtual {v10}, Lisi;->o0()Lqsi;

    move-result-object v3

    invoke-virtual {v0, v3}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v5

    if-nez v4, :cond_66c

    if-ne v5, v2, :cond_684

    :cond_66c
    new-instance v25, Lldh;

    const-class v28, Lqsi;

    const-string v29, "onRecentAiActivitySwitchChanged"

    const-string v30, "onRecentAiActivitySwitchChanged(Z)V"

    const/16 v31, 0x0

    const/16 v32, 0x11

    const/16 v26, 0x1

    move-object/from16 v27, v3

    invoke-direct/range {v25 .. v32}, Lldh;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v5, v25

    invoke-virtual {v0, v5}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_684
    check-cast v5, Lmtb;

    move-object/from16 v25, v5

    check-cast v25, Lkotlin/jvm/functions/Function1;

    invoke-virtual {v10}, Lisi;->o0()Lqsi;

    move-result-object v3

    invoke-virtual {v0, v3}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v5

    if-nez v4, :cond_69a

    if-ne v5, v2, :cond_6b2

    :cond_69a
    new-instance v26, Lldh;

    const-class v29, Lqsi;

    const-string v30, "onClipboardSwitchChanged"

    const-string v31, "onClipboardSwitchChanged(Z)V"

    const/16 v32, 0x0

    const/16 v33, 0x12

    const/16 v27, 0x1

    move-object/from16 v28, v3

    invoke-direct/range {v26 .. v33}, Lldh;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v5, v26

    invoke-virtual {v0, v5}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_6b2
    check-cast v5, Lmtb;

    move-object/from16 v26, v5

    check-cast v26, Lkotlin/jvm/functions/Function1;

    invoke-virtual {v10}, Lisi;->o0()Lqsi;

    move-result-object v3

    invoke-virtual {v0, v3}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v5

    if-nez v4, :cond_6c8

    if-ne v5, v2, :cond_6e0

    :cond_6c8
    new-instance v27, Lldh;

    const-class v30, Lqsi;

    const-string v31, "onHistoryOpenTabsSwitchChanged"

    const-string v32, "onHistoryOpenTabsSwitchChanged(Z)V"

    const/16 v33, 0x0

    const/16 v34, 0x13

    const/16 v28, 0x1

    move-object/from16 v29, v3

    invoke-direct/range {v27 .. v34}, Lldh;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v5, v27

    invoke-virtual {v0, v5}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_6e0
    check-cast v5, Lmtb;

    move-object/from16 v27, v5

    check-cast v27, Lkotlin/jvm/functions/Function1;

    invoke-virtual {v10}, Lisi;->o0()Lqsi;

    move-result-object v3

    invoke-virtual {v0, v3}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v5

    if-nez v4, :cond_6f6

    if-ne v5, v2, :cond_70e

    :cond_6f6
    new-instance v28, Lldh;

    const-class v31, Lqsi;

    const-string v32, "onBookmarksSpeedDialsSwitchChanged"

    const-string v33, "onBookmarksSpeedDialsSwitchChanged(Z)V"

    const/16 v34, 0x0

    const/16 v35, 0x14

    const/16 v29, 0x1

    move-object/from16 v30, v3

    invoke-direct/range {v28 .. v35}, Lldh;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v5, v28

    invoke-virtual {v0, v5}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_70e
    check-cast v5, Lmtb;

    move-object/from16 v28, v5

    check-cast v28, Lkotlin/jvm/functions/Function1;

    invoke-virtual {v10}, Lisi;->o0()Lqsi;

    move-result-object v3

    invoke-virtual {v0, v3}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v5

    if-nez v4, :cond_724

    if-ne v5, v2, :cond_73c

    :cond_724
    new-instance v29, Lldh;

    const-class v32, Lqsi;

    const-string v33, "onAutocompleteSwitchChanged"

    const-string v34, "onAutocompleteSwitchChanged(Z)V"

    const/16 v35, 0x0

    const/16 v36, 0x15

    const/16 v30, 0x1

    move-object/from16 v31, v3

    invoke-direct/range {v29 .. v36}, Lldh;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v5, v29

    invoke-virtual {v0, v5}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_73c
    check-cast v5, Lmtb;

    move-object/from16 v29, v5

    check-cast v29, Lkotlin/jvm/functions/Function1;

    const/16 v30, 0x0

    const/16 v32, 0x8

    move-object/from16 v31, v0

    move-object v11, v1

    invoke-static/range {v11 .. v32}, Lr9h;->e(Lmsi;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lc8e;Lih5;I)V

    goto :goto_752

    :cond_74d
    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lvt9;->Q()V

    :goto_752
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_755
    check-cast v0, Landroid/content/SharedPreferences$Editor;

    check-cast v1, Ljava/lang/String;

    check-cast v2, Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_761
    check-cast v0, Ljava/util/LinkedHashMap;

    check-cast v1, Ljava/lang/String;

    instance-of v3, v2, Ljava/lang/String;

    if-eqz v3, :cond_76c

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_76c
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_770
    .packed-switch 0x0
        :pswitch_761
        :pswitch_755
        :pswitch_3ed
        :pswitch_3dd
        :pswitch_38f
        :pswitch_372
        :pswitch_338
        :pswitch_2c9
        :pswitch_268
        :pswitch_203
        :pswitch_1f5
        :pswitch_1da
        :pswitch_193
        :pswitch_176
        :pswitch_159
        :pswitch_146
        :pswitch_136
        :pswitch_da
        :pswitch_c0
        :pswitch_6e
        :pswitch_59
        :pswitch_42
        :pswitch_27
    .end packed-switch
.end method
