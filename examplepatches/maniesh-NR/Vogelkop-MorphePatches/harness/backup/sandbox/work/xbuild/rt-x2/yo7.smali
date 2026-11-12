.class public final synthetic Lyo7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lafe;Ljava/util/ArrayList;Ljava/util/List;Z)V
    .registers 5

    .line 13
    const/4 p4, 0x7

    iput-byte p4, p0, Lyo7;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyo7;->b:Ljava/lang/Object;

    iput-object p2, p0, Lyo7;->c:Ljava/lang/Object;

    iput-object p3, p0, Lyo7;->d:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    .line 14
    iput-byte p4, p0, Lyo7;->a:B

    iput-object p1, p0, Lyo7;->b:Ljava/lang/Object;

    iput-object p2, p0, Lyo7;->c:Ljava/lang/Object;

    iput-object p3, p0, Lyo7;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lr9a;Ljava/lang/String;Ljava/lang/String;Lhsg;)V
    .registers 5

    const/4 p1, 0x5

    iput-byte p1, p0, Lyo7;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lyo7;->b:Ljava/lang/Object;

    iput-object p3, p0, Lyo7;->c:Ljava/lang/Object;

    iput-object p4, p0, Lyo7;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 29

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Lyo7;->a:B

    const/16 v3, 0x17

    const/4 v4, -0x1

    const/16 v5, 0x98b

    const/4 v6, 0x2

    const/4 v7, 0x0

    const/4 v8, 0x3

    const/4 v9, 0x1

    const/4 v10, 0x0

    iget-object v11, v0, Lyo7;->d:Ljava/lang/Object;

    iget-object v12, v0, Lyo7;->c:Ljava/lang/Object;

    iget-object v0, v0, Lyo7;->b:Ljava/lang/Object;

    packed-switch v2, :pswitch_data_99a

    check-cast v0, Luji;

    check-cast v11, Lyji;

    check-cast v1, Lvb7;

    iget-object v1, v0, Luji;->b:Lsee;

    invoke-virtual {v1, v12}, Lsee;->b(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_35

    iget-object v2, v0, Luji;->a:Ljava/util/Map;

    invoke-interface {v2, v12}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v12, v11}, Lsee;->m(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v7, Li9;

    invoke-direct {v7, v0, v12, v11, v8}, Li9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    goto :goto_3c

    :cond_35
    const-string v0, "Key "

    const-string v1, " was used multiple times "

    invoke-static {v12, v1, v0}, Lj9h;->t(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V

    :goto_3c
    return-object v7

    :pswitch_3d
    check-cast v0, Llqh;

    check-cast v12, Lx2l;

    check-cast v11, La83;

    check-cast v1, Lpg;

    sget-object v2, Lng;->a:Lng;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_57

    iget-boolean v1, v0, Llqh;->a:Z

    if-nez v1, :cond_68

    iput-boolean v9, v0, Llqh;->a:Z

    invoke-virtual {v12, v11}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    goto :goto_68

    :cond_57
    sget-object v2, Log;->a:Log;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6b

    iget-boolean v1, v0, Llqh;->a:Z

    if-eqz v1, :cond_68

    iput-boolean v10, v0, Llqh;->a:Z

    invoke-virtual {v12, v11}, Landroidx/recyclerview/widget/d;->unregisterAdapterDataObserver(Lgph;)V

    :cond_68
    :goto_68
    sget-object v7, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_6e

    :cond_6b
    invoke-static {}, Lh9o;->p()V

    :goto_6e
    return-object v7

    :pswitch_6f
    check-cast v0, Lcom/opera/api/Callback;

    check-cast v12, Lvjh;

    check-cast v11, Lqjh;

    check-cast v1, Lnjh;

    new-instance v2, Lpjh;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v1, v12, Lvjh;->b:Ljava/lang/Integer;

    invoke-direct {v2, v7, v7, v7, v1}, Lpjh;-><init>(Lee0;Leo0;Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-interface {v0, v2}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    iget-object v0, v11, Lqjh;->c:Lgw3;

    new-instance v1, Lglj;

    const v2, 0x7f14076b

    const/16 v3, 0x1388

    invoke-direct {v1, v2, v3}, Lglj;-><init>(II)V

    invoke-virtual {v0, v1}, Lgw3;->f(Lo93;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_96
    check-cast v0, Lu22;

    check-cast v12, Lzvf;

    check-cast v11, Lqz0;

    check-cast v1, Lo3c;

    invoke-virtual {v0}, Lu22;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbpj;

    iget-wide v2, v0, Lbpj;->a:J

    const/16 v0, 0x20

    shr-long v4, v2, v0

    long-to-int v4, v4

    invoke-static {v4}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v4

    const/4 v5, 0x0

    cmpl-float v6, v4, v5

    if-lez v6, :cond_146

    const/high16 v6, 0x40800000    # 4.0f

    invoke-virtual {v1, v6}, Lo3c;->o0(F)F

    move-result v6

    iget-object v7, v1, Lo3c;->a:Luh4;

    invoke-virtual {v1}, Lo3c;->getLayoutDirection()Ld2c;

    move-result-object v8

    invoke-virtual {v12, v8}, Lzvf;->b(Ld2c;)F

    move-result v8

    invoke-virtual {v1, v8}, Lo3c;->o0(F)F

    move-result v8

    invoke-virtual {v1}, Lo3c;->getLayoutDirection()Ld2c;

    move-result-object v9

    invoke-virtual {v12, v9}, Lzvf;->c(Ld2c;)F

    move-result v9

    invoke-virtual {v1, v9}, Lo3c;->o0(F)F

    move-result v9

    invoke-static {v4}, Lzed;->b(F)I

    move-result v10

    invoke-interface {v7}, Lmk7;->e()J

    move-result-wide v12

    shr-long/2addr v12, v0

    long-to-int v12, v12

    invoke-static {v12}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v12

    sub-float/2addr v12, v8

    sub-float/2addr v12, v9

    invoke-static {v12}, Lzed;->b(F)I

    move-result v9

    invoke-virtual {v1}, Lo3c;->getLayoutDirection()Ld2c;

    move-result-object v12

    invoke-interface {v11, v10, v9, v12}, Lqz0;->a(IILd2c;)I

    move-result v9

    int-to-float v9, v9

    add-float/2addr v9, v8

    const/high16 v8, 0x40000000    # 2.0f

    div-float/2addr v4, v8

    add-float/2addr v9, v4

    sub-float v10, v9, v4

    sub-float/2addr v10, v6

    cmpg-float v11, v10, v5

    if-gez v11, :cond_ff

    move v13, v5

    goto :goto_100

    :cond_ff
    move v13, v10

    :goto_100
    add-float/2addr v9, v4

    add-float/2addr v9, v6

    invoke-interface {v7}, Lmk7;->e()J

    move-result-wide v4

    shr-long/2addr v4, v0

    long-to-int v0, v4

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    cmpl-float v4, v9, v0

    if-lez v4, :cond_112

    move v15, v0

    goto :goto_113

    :cond_112
    move v15, v9

    :goto_113
    const-wide v4, 0xffffffffL

    and-long/2addr v2, v4

    long-to-int v0, v2

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    neg-float v2, v0

    div-float v14, v2, v8

    div-float v16, v0, v8

    iget-object v2, v7, Luh4;->b:Ld5o;

    invoke-virtual {v2}, Ld5o;->D()J

    move-result-wide v3

    invoke-virtual {v2}, Ld5o;->A()Lsh4;

    move-result-object v0

    invoke-interface {v0}, Lsh4;->j()V

    :try_start_130
    iget-object v0, v2, Ld5o;->a:Ljava/lang/Object;

    move-object v12, v0

    check-cast v12, Lwth;

    const/16 v17, 0x0

    invoke-virtual/range {v12 .. v17}, Lwth;->q(FFFFI)V

    invoke-virtual {v1}, Lo3c;->a()V
    :try_end_13d
    .catchall {:try_start_130 .. :try_end_13d} :catchall_141

    invoke-static {v2, v3, v4}, Lam2;->w(Ld5o;J)V

    goto :goto_149

    :catchall_141
    move-exception v0

    invoke-static {v2, v3, v4}, Lam2;->w(Ld5o;J)V

    throw v0

    :cond_146
    invoke-virtual {v1}, Lo3c;->a()V

    :goto_149
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_14c
    check-cast v0, Ljava/lang/String;

    check-cast v12, Ljava/lang/String;

    check-cast v11, Lme0;

    check-cast v1, Lak0;

    iget-object v1, v1, Lak0;->c:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrb0;

    iget-object v2, v1, Lrb0;->a:Lob0;

    invoke-virtual {v2, v10, v0}, Lob0;->x(ILjava/lang/String;)V

    iget-object v0, v1, Lrb0;->a:Lob0;

    invoke-virtual {v0, v9, v12}, Lob0;->x(ILjava/lang/String;)V

    invoke-virtual {v0, v6, v9, v11}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_16c
    check-cast v0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;

    check-cast v12, Li2g;

    check-cast v11, Lkotlin/jvm/functions/Function1;

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    sget v2, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->i:I

    if-nez v1, :cond_1a3

    iget-object v1, v12, Lj2g;->a:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->u()Lxu2;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    iget-object v2, v2, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v2, v2, Lxv1;->m:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ltv1;

    new-instance v4, La32;

    invoke-direct {v4, v0, v1, v11, v3}, La32;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lx77;

    invoke-direct {v2, v0, v1, v4}, Lx77;-><init>(Landroid/content/Context;Ljava/lang/String;La32;)V

    iget-object v0, v2, Lx77;->d:Ljava/lang/Object;

    check-cast v0, Lbz0;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    goto :goto_1a8

    :cond_1a3
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v11, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1a8
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1ab
    check-cast v0, Lbo0;

    check-cast v12, Lep0;

    check-cast v11, Ldp0;

    check-cast v1, Ltd0;

    iget-object v2, v1, Ltd0;->a:Lzpa;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lco0;

    invoke-direct {v2, v5, v4, v8}, Ljf0;-><init>(III)V

    iget-object v1, v1, Ltd0;->b:Lqd0;

    const/16 v3, 0x1d

    invoke-virtual {v1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    if-eqz v4, :cond_1d5

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1d5

    new-instance v5, Lhf0;

    invoke-direct {v5, v1, v3, v4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_1de

    :cond_1d5
    invoke-static {v1, v3, v9}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v4

    new-instance v5, Lhf0;

    invoke-direct {v5, v1, v3, v4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_1de
    invoke-virtual {v5, v2}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v2, v10, v9, v0}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v2, v9, v9, v12}, Ljf0;->q(IILjava/lang/Object;)V

    if-nez v11, :cond_1ea

    move v9, v10

    :cond_1ea
    invoke-virtual {v2, v6, v9, v11}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1f0
    check-cast v0, Lc3b;

    check-cast v12, Lv2b;

    check-cast v11, Leb0;

    check-cast v1, Lag0;

    iget-object v0, v0, Lc3b;->a:Ljava/lang/String;

    iget-object v2, v1, Lag0;->a:Lzpa;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lbg0;

    invoke-direct {v2, v5, v4, v9}, Ljf0;-><init>(III)V

    iget-object v1, v1, Lag0;->b:Lzf0;

    invoke-virtual {v1, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    if-eqz v3, :cond_21a

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_21a

    new-instance v6, Lif0;

    invoke-direct {v6, v1, v10, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_227

    :cond_21a
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v1, v10, v9, v3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v6, Lif0;

    invoke-direct {v6, v1, v10, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_227
    invoke-virtual {v6, v0, v2}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v12, Lv2b;->a:Ljava/lang/String;

    new-instance v1, Lcg0;

    invoke-direct {v1, v5, v4, v9}, Ljf0;-><init>(III)V

    invoke-virtual {v2, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    if-eqz v3, :cond_245

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_245

    new-instance v4, Lif0;

    invoke-direct {v4, v2, v10, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_252

    :cond_245
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v2, v10, v9, v3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v4, Lif0;

    invoke-direct {v4, v2, v10, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_252
    invoke-virtual {v4, v0, v1}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v10, v9, v11}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_25b
    check-cast v0, Ljava/util/List;

    check-cast v12, Ljava/util/List;

    check-cast v11, Ljava/util/List;

    check-cast v1, Lck0;

    invoke-virtual {v1}, Lck0;->g()Lqp0;

    move-result-object v1

    iget-object v2, v1, Lqp0;->a:Lzpa;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzpa;->g()Lw50;

    move-result-object v3

    iget-object v1, v1, Lqp0;->b:Lb66;

    const/16 v4, 0x54

    invoke-virtual {v1, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    if-eqz v5, :cond_288

    invoke-interface {v5}, Ljava/util/Map;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_288

    new-instance v6, Lif0;

    invoke-direct {v6, v1, v4, v5}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_295

    :cond_288
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v1, v4, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v6, Lif0;

    invoke-direct {v6, v1, v4, v5}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_295
    const-string v5, "recommended"

    invoke-virtual {v6, v5, v3}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v3, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    if-eqz v5, :cond_2ae

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_2ae

    new-instance v6, Lhf0;

    invoke-direct {v6, v3, v10, v5}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_2bb

    :cond_2ae
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v3, v10, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v6, Lhf0;

    invoke-direct {v6, v3, v10, v5}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_2bb
    check-cast v0, Ljava/util/Collection;

    invoke-virtual {v6, v0}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzpa;->g()Lw50;

    move-result-object v0

    invoke-virtual {v1, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    if-eqz v2, :cond_2db

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2db

    new-instance v3, Lif0;

    invoke-direct {v3, v1, v4, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_2e8

    :cond_2db
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v1, v4, v9, v2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v3, Lif0;

    invoke-direct {v3, v1, v4, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_2e8
    const-string v2, "other"

    invoke-virtual {v3, v2, v0}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_301

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_301

    new-instance v3, Lhf0;

    invoke-direct {v3, v0, v10, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_30e

    :cond_301
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v10, v9, v2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v3, Lhf0;

    invoke-direct {v3, v0, v10, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_30e
    check-cast v12, Ljava/util/Collection;

    invoke-virtual {v3, v12}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    invoke-static {}, Lzpa;->g()Lw50;

    move-result-object v0

    invoke-virtual {v1, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    if-eqz v2, :cond_32b

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_32b

    new-instance v3, Lif0;

    invoke-direct {v3, v1, v4, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_338

    :cond_32b
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v1, v4, v9, v2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v3, Lif0;

    invoke-direct {v3, v1, v4, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_338
    const-string v1, "regional"

    invoke-virtual {v3, v1, v0}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, v10}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-eqz v1, :cond_351

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_351

    new-instance v2, Lhf0;

    invoke-direct {v2, v0, v10, v1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_35e

    :cond_351
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v10, v9, v1}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v2, Lhf0;

    invoke-direct {v2, v0, v10, v1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_35e
    check-cast v11, Ljava/util/Collection;

    invoke-virtual {v2, v11}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_366
    check-cast v0, Lzr0;

    check-cast v12, Las0;

    check-cast v11, Lkf0;

    check-cast v1, Ltd0;

    iget-object v2, v1, Ltd0;->a:Lzpa;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lxr0;

    invoke-direct {v2, v5, v4, v8}, Ljf0;-><init>(III)V

    iget-object v1, v1, Ltd0;->b:Lqd0;

    const/16 v3, 0x3b

    invoke-virtual {v1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    if-eqz v4, :cond_390

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_390

    new-instance v5, Lhf0;

    invoke-direct {v5, v1, v3, v4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_399

    :cond_390
    invoke-static {v1, v3, v9}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v4

    new-instance v5, Lhf0;

    invoke-direct {v5, v1, v3, v4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_399
    invoke-virtual {v5, v2}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v2, v10, v9, v0}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v2, v9, v9, v12}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v2, v6, v9, v11}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3a8
    check-cast v0, Ljava/util/Set;

    check-cast v12, Lice;

    check-cast v11, Lpqh;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_428

    iget-object v0, v12, Lice;->c:Lsee;

    invoke-virtual {v0, v1}, Lsee;->g(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_428

    instance-of v1, v0, Ltee;

    if-eqz v1, :cond_414

    check-cast v0, Ltee;

    iget-object v1, v0, Ltee;->b:[Ljava/lang/Object;

    iget-object v0, v0, Ltee;->a:[J

    array-length v2, v0

    sub-int/2addr v2, v6

    if-ltz v2, :cond_428

    move v3, v10

    :goto_3cb
    aget-wide v4, v0, v3

    not-long v6, v4

    const/4 v8, 0x7

    shl-long/2addr v6, v8

    and-long/2addr v6, v4

    const-wide v8, -0x7f7f7f7f7f7f7f80L    # -2.937446524422997E-306

    and-long/2addr v6, v8

    cmp-long v6, v6, v8

    if-eqz v6, :cond_40f

    sub-int v6, v3, v2

    not-int v6, v6

    ushr-int/lit8 v6, v6, 0x1f

    const/16 v7, 0x8

    rsub-int/lit8 v6, v6, 0x8

    move v8, v10

    :goto_3e5
    if-ge v8, v6, :cond_40d

    const-wide/16 v12, 0xff

    and-long/2addr v12, v4

    const-wide/16 v14, 0x80

    cmp-long v9, v12, v14

    if-gez v9, :cond_409

    shl-int/lit8 v9, v3, 0x3

    add-int/2addr v9, v8

    aget-object v9, v1, v9

    check-cast v9, Lc1j;

    iget-object v12, v11, Lpqh;->a:Ljava/lang/Object;

    if-nez v12, :cond_402

    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    iput-object v12, v11, Lpqh;->a:Ljava/lang/Object;

    :cond_402
    iget-object v12, v11, Lpqh;->a:Ljava/lang/Object;

    check-cast v12, Ljava/util/List;

    invoke-interface {v12, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_409
    shr-long/2addr v4, v7

    add-int/lit8 v8, v8, 0x1

    goto :goto_3e5

    :cond_40d
    if-ne v6, v7, :cond_428

    :cond_40f
    if-eq v3, v2, :cond_428

    add-int/lit8 v3, v3, 0x1

    goto :goto_3cb

    :cond_414
    check-cast v0, Lc1j;

    iget-object v1, v11, Lpqh;->a:Ljava/lang/Object;

    if-nez v1, :cond_421

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v11, Lpqh;->a:Ljava/lang/Object;

    :cond_421
    iget-object v1, v11, Lpqh;->a:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_428
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_42b
    check-cast v0, Lnx5;

    check-cast v12, Lpej;

    check-cast v11, Lkotlin/jvm/functions/Function0;

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    new-instance v2, Lkg5;

    invoke-direct {v2, v12, v1, v7}, Lkg5;-><init>(Lpej;FLmt5;)V

    invoke-static {v0, v7, v7, v2, v8}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object v0

    new-instance v1, Lx6e;

    invoke-direct {v1, v12, v11, v9}, Lx6e;-><init>(Lpej;Lkotlin/jvm/functions/Function0;B)V

    invoke-virtual {v0, v1}, Lxob;->s(Lkotlin/jvm/functions/Function1;)Lxb7;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_44b
    check-cast v0, Lq6e;

    move-object v15, v12

    check-cast v15, Ljava/lang/String;

    move-object v14, v11

    check-cast v14, Ljava/lang/String;

    move-object/from16 v16, v1

    check-cast v16, Ljava/lang/String;

    new-instance v13, Lj6e;

    const/16 v18, 0x5

    iget-object v1, v0, Lq6e;->h:Lk6e;

    const/16 v17, 0x0

    move-object/from16 v19, v1

    invoke-direct/range {v13 .. v19}, Lj6e;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILk6e;)V

    iget-object v1, v0, Lq6e;->c:Lwzg;

    iget-object v2, v13, Lj6e;->a:Ll6e;

    iput-object v1, v2, Ll6e;->i:Lwzg;

    iget-object v1, v0, Lq6e;->m:Lp1;

    iput-object v1, v2, Ll6e;->g:Lpqk;

    iget-object v1, v0, Lq6e;->l:Lqie;

    iget-object v2, v0, Lq6e;->k:Lumi;

    new-instance v3, Low3;

    invoke-direct {v3, v0, v13, v8}, Low3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v2, v3}, Ltcl;->b(Lesk;)Lnml;

    move-result-object v3

    new-instance v4, Lm6e;

    invoke-direct {v4, v0, v6}, Lm6e;-><init>(Lq6e;B)V

    invoke-virtual {v2, v4}, Lumi;->f(Ln5o;)Lnml;

    move-result-object v0

    invoke-virtual {v3, v0}, Lnml;->b(Lnml;)V

    new-instance v0, Loml;

    invoke-direct {v0, v3}, Loml;-><init>(Lnml;)V

    invoke-virtual {v1, v0, v7}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_492
    check-cast v0, Lm0e;

    check-cast v12, Landroid/view/GestureDetector;

    check-cast v11, Ll0e;

    check-cast v1, Landroid/view/MotionEvent;

    invoke-virtual {v1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    if-nez v2, :cond_4d6

    iget-object v2, v0, Lm0e;->g:Lcom/opera/android/tabui2/TabUiRootFrameLayout;

    invoke-virtual {v1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {v1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    new-instance v5, Lj0e;

    invoke-direct {v5, v0, v10}, Lj0e;-><init>(Lm0e;B)V

    invoke-static {v2, v3, v4, v5}, Lcqp;->Q(Landroid/view/View;FFLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    if-eqz v3, :cond_4d6

    invoke-virtual {v1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {v1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    new-instance v5, Lj0e;

    invoke-direct {v5, v0, v9}, Lj0e;-><init>(Lm0e;B)V

    invoke-static {v2, v3, v4, v5}, Lcqp;->Q(Landroid/view/View;FFLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    if-eqz v2, :cond_4d4

    iget-object v3, v0, Lm0e;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {v3, v2}, Lq9n;->w(Landroid/view/ViewGroup;Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_4d6

    :cond_4d4
    iput-boolean v9, v0, Lm0e;->i:Z

    :cond_4d6
    iget-boolean v2, v0, Lm0e;->i:Z

    if-eqz v2, :cond_50a

    invoke-virtual {v12, v1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-virtual {v1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    if-eq v2, v9, :cond_4e9

    invoke-virtual {v1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-ne v1, v8, :cond_50b

    :cond_4e9
    iput-boolean v10, v0, Lm0e;->i:Z

    iget-object v0, v11, Ll0e;->e:Lm0e;

    iget-boolean v1, v11, Ll0e;->d:Z

    if-eqz v1, :cond_4f8

    iput-boolean v10, v11, Ll0e;->d:Z

    iget-object v1, v0, Lm0e;->c:Lcom/opera/android/tabui2/FadeoutRecyclerView;

    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView;->stopNestedScroll()V

    :cond_4f8
    iget-object v0, v0, Lm0e;->d:Lyhe;

    iget-object v0, v0, Lyhe;->b:Ljava/lang/Object;

    check-cast v0, Lz5l;

    iget-object v0, v0, Lz5l;->z:Lzc3;

    invoke-virtual {v0}, Lzc3;->y()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_50b

    invoke-virtual {v0, v1, v9}, Lzc3;->z(Landroid/view/View;Z)V

    goto :goto_50b

    :cond_50a
    move v9, v10

    :cond_50b
    :goto_50b
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_510
    check-cast v0, Lekc;

    check-cast v12, Lndc;

    check-cast v11, Lafe;

    check-cast v1, Lvb7;

    new-instance v1, Lks6;

    invoke-direct {v1, v11, v3}, Lks6;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v12, v1}, Lekc;->j(Lndc;Lf7f;)V

    new-instance v2, Lrz2;

    invoke-direct {v2, v0, v1, v8}, Lrz2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v2

    :pswitch_526
    check-cast v0, Ltjc;

    check-cast v12, Lr3g;

    check-cast v11, Lhu5;

    check-cast v1, Lkotlin/Unit;

    invoke-interface {v12}, Lr3g;->R0()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v12}, Lr3g;->o()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2, v9, v11}, Ltjc;->e(Ljava/lang/String;Ljava/lang/String;ZLcom/opera/api/Callback;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_53c
    check-cast v0, Ltjc;

    check-cast v12, Lq3g;

    check-cast v11, Ltu;

    check-cast v1, Lkotlin/Unit;

    invoke-virtual {v0, v12, v11}, Ltjc;->f(Lq3g;Ltu;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_54a
    check-cast v0, Ltjc;

    check-cast v12, Ls3g;

    check-cast v11, Lve9;

    check-cast v1, Lkotlin/Unit;

    invoke-virtual {v0, v12, v11}, Ltjc;->h(Ls3g;Lve9;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_558
    check-cast v0, Lndc;

    check-cast v12, Lvdc;

    check-cast v11, Lkotlin/jvm/functions/Function1;

    check-cast v1, Lvb7;

    new-instance v1, Lpqh;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    new-instance v2, Lgdc;

    invoke-direct {v2, v12, v1, v11, v10}, Lgdc;-><init>(Ljava/lang/Object;Ljava/io/Serializable;Ljava/lang/Object;B)V

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v3

    invoke-virtual {v3, v2}, Ltcc;->a(Lmdc;)V

    new-instance v3, Li9;

    invoke-direct {v3, v0, v2, v1}, Li9;-><init>(Lndc;Lgdc;Lpqh;)V

    return-object v3

    :pswitch_577
    check-cast v0, Lp12;

    check-cast v12, Lwg4;

    check-cast v11, Landroid/content/Context;

    check-cast v1, Ljava/lang/Void;

    invoke-static {v11}, Lgt5;->a(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0, v12, v2}, Lp12;->k(Lwg4;Landroid/content/Context;)V

    return-object v1

    :pswitch_587
    check-cast v0, Ljava/lang/Long;

    check-cast v12, Ljava/lang/Long;

    check-cast v11, Ljava/lang/Long;

    check-cast v1, Lwa1;

    invoke-interface {v1, v10, v0}, Lwa1;->x(ILjava/lang/Long;)V

    invoke-interface {v1, v9, v12}, Lwa1;->x(ILjava/lang/Long;)V

    invoke-interface {v1, v6, v11}, Lwa1;->x(ILjava/lang/Long;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_59b
    check-cast v0, Ltcc;

    check-cast v11, Lkotlin/jvm/functions/Function0;

    check-cast v1, Lw6f;

    invoke-static {v1, v0, v12, v11}, Laib;->A(Lw6f;Ltcc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5a7
    check-cast v0, Lafe;

    check-cast v12, Ljava/util/ArrayList;

    check-cast v11, Ljava/util/List;

    check-cast v1, Lp1d;

    iput-boolean v9, v1, Lp1d;->a:Z

    invoke-interface {v12}, Ljava/util/Collection;->size()I

    move-result v2

    move v3, v10

    :goto_5b6
    if-ge v3, v2, :cond_5c4

    invoke-interface {v12, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ln6c;

    invoke-virtual {v4, v1}, Ln6c;->c(Lp1d;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_5b6

    :cond_5c4
    move-object v2, v11

    check-cast v2, Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v2

    move v3, v10

    :goto_5cc
    if-ge v3, v2, :cond_5da

    invoke-interface {v11, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ln6c;

    invoke-virtual {v4, v1}, Ln6c;->c(Lp1d;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_5cc

    :cond_5da
    iput-boolean v10, v1, Lp1d;->a:Z

    invoke-interface {v0}, Liak;->getValue()Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5e2
    move-object v2, v0

    check-cast v2, Lo3c;

    iget-object v3, v2, Lo3c;->a:Luh4;

    check-cast v12, Llk7;

    check-cast v11, Lrkc;

    move-object v0, v1

    check-cast v0, Lmk7;

    iget-object v1, v2, Lo3c;->b:Llk7;

    iput-object v12, v2, Lo3c;->b:Llk7;

    :try_start_5f2
    invoke-interface {v0}, Lmk7;->s0()Ld5o;

    move-result-object v4

    iget-object v4, v4, Ld5o;->c:Ljava/lang/Object;

    check-cast v4, Luh4;

    iget-object v4, v4, Luh4;->a:Lth4;

    iget-object v4, v4, Lth4;->a:Ln27;

    invoke-interface {v0}, Lmk7;->s0()Ld5o;

    move-result-object v5

    iget-object v5, v5, Ld5o;->c:Ljava/lang/Object;

    check-cast v5, Luh4;

    iget-object v5, v5, Luh4;->a:Lth4;

    iget-object v5, v5, Lth4;->b:Ld2c;

    invoke-interface {v0}, Lmk7;->s0()Ld5o;

    move-result-object v6

    invoke-virtual {v6}, Ld5o;->A()Lsh4;

    move-result-object v6

    invoke-interface {v0}, Lmk7;->s0()Ld5o;

    move-result-object v7

    invoke-virtual {v7}, Ld5o;->D()J

    move-result-wide v7

    invoke-interface {v0}, Lmk7;->s0()Ld5o;

    move-result-object v0

    iget-object v0, v0, Ld5o;->b:Ljava/lang/Object;

    check-cast v0, Lq3a;

    iget-object v9, v3, Luh4;->b:Ld5o;

    iget-object v10, v9, Ld5o;->c:Ljava/lang/Object;

    check-cast v10, Luh4;

    iget-object v10, v10, Luh4;->a:Lth4;

    iget-object v12, v10, Lth4;->a:Ln27;

    iget-object v10, v10, Lth4;->b:Ld2c;

    invoke-virtual {v9}, Ld5o;->A()Lsh4;

    move-result-object v9

    iget-object v13, v3, Luh4;->b:Ld5o;

    invoke-virtual {v13}, Ld5o;->D()J

    move-result-wide v13

    iget-object v15, v3, Luh4;->b:Ld5o;
    :try_end_63a
    .catchall {:try_start_5f2 .. :try_end_63a} :catchall_68b

    move-object/from16 v16, v1

    :try_start_63c
    iget-object v1, v15, Ld5o;->b:Ljava/lang/Object;

    check-cast v1, Lq3a;

    invoke-virtual {v15, v4}, Ld5o;->I(Ln27;)V

    invoke-virtual {v15, v5}, Ld5o;->J(Ld2c;)V

    invoke-virtual {v15, v6}, Ld5o;->H(Lsh4;)V

    invoke-virtual {v15, v7, v8}, Ld5o;->K(J)V

    iput-object v0, v15, Ld5o;->b:Ljava/lang/Object;

    invoke-interface {v6}, Lsh4;->j()V
    :try_end_651
    .catchall {:try_start_63c .. :try_end_651} :catchall_687

    :try_start_651
    invoke-virtual {v11, v2}, Lrkc;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_654
    .catchall {:try_start_651 .. :try_end_654} :catchall_66e

    :try_start_654
    invoke-interface {v6}, Lsh4;->f()V

    iget-object v0, v3, Luh4;->b:Ld5o;

    invoke-virtual {v0, v12}, Ld5o;->I(Ln27;)V

    invoke-virtual {v0, v10}, Ld5o;->J(Ld2c;)V

    invoke-virtual {v0, v9}, Ld5o;->H(Lsh4;)V

    invoke-virtual {v0, v13, v14}, Ld5o;->K(J)V

    iput-object v1, v0, Ld5o;->b:Ljava/lang/Object;
    :try_end_667
    .catchall {:try_start_654 .. :try_end_667} :catchall_687

    move-object/from16 v4, v16

    iput-object v4, v2, Lo3c;->b:Llk7;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :catchall_66e
    move-exception v0

    move-object/from16 v4, v16

    :try_start_671
    invoke-interface {v6}, Lsh4;->f()V

    iget-object v3, v3, Luh4;->b:Ld5o;

    invoke-virtual {v3, v12}, Ld5o;->I(Ln27;)V

    invoke-virtual {v3, v10}, Ld5o;->J(Ld2c;)V

    invoke-virtual {v3, v9}, Ld5o;->H(Lsh4;)V

    invoke-virtual {v3, v13, v14}, Ld5o;->K(J)V

    iput-object v1, v3, Ld5o;->b:Ljava/lang/Object;

    throw v0
    :try_end_685
    .catchall {:try_start_671 .. :try_end_685} :catchall_685

    :catchall_685
    move-exception v0

    goto :goto_68d

    :catchall_687
    move-exception v0

    move-object/from16 v4, v16

    goto :goto_68d

    :catchall_68b
    move-exception v0

    move-object v4, v1

    :goto_68d
    iput-object v4, v2, Lo3c;->b:Llk7;

    throw v0

    :pswitch_690
    check-cast v0, Ljava/lang/String;

    check-cast v12, Ljava/lang/String;

    check-cast v11, Lhsg;

    check-cast v1, Llee;

    const-wide/16 v2, 0x0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    sget-object v3, Lr9a;->d:Lhsg;

    invoke-virtual {v1, v3}, Llee;->c(Lhsg;)Ljava/lang/Object;

    move-result-object v4

    const-string v5, ""

    if-nez v4, :cond_6a9

    move-object v4, v5

    :cond_6a9
    check-cast v4, Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6e0

    invoke-static {v1, v0}, Lr9a;->c(Llee;Ljava/lang/String;)Lhsg;

    move-result-object v2

    if-eqz v2, :cond_6bf

    iget-object v2, v2, Lhsg;->a:Ljava/lang/String;

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6c3

    :cond_6bf
    :goto_6bf
    move-object/from16 v18, v7

    goto/16 :goto_7a2

    :cond_6c3
    invoke-static {v1, v0}, Lr9a;->d(Llee;Ljava/lang/String;)V

    new-instance v2, Ljava/util/HashSet;

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v1, v11}, Llee;->c(Lhsg;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_6d4

    move-object v3, v4

    :cond_6d4
    check-cast v3, Ljava/util/Collection;

    invoke-direct {v2, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v2, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1, v11, v2}, Llee;->d(Lhsg;Ljava/lang/Object;)V

    goto :goto_6bf

    :cond_6e0
    sget-object v4, Lr9a;->c:Lhsg;

    invoke-virtual {v1, v4}, Llee;->c(Lhsg;)Ljava/lang/Object;

    move-result-object v6

    if-nez v6, :cond_6e9

    move-object v6, v2

    :cond_6e9
    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    const-wide/16 v12, 0x1

    add-long v14, v8, v12

    const-wide/16 v16, 0x1e

    cmp-long v6, v14, v16

    if-nez v6, :cond_77c

    invoke-virtual {v1, v4}, Llee;->c(Lhsg;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_700

    move-object v2, v6

    :cond_700
    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v1}, Llee;->a()Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    move-object v10, v7

    :goto_718
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_761

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/Map$Entry;

    invoke-interface {v14}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v15

    instance-of v15, v15, Ljava/util/Set;

    if-eqz v15, :cond_75c

    invoke-interface {v14}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/util/Set;

    invoke-interface {v15}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_736
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_75c

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v18, v7

    move-object/from16 v7, v17

    check-cast v7, Ljava/lang/String;

    if-eqz v10, :cond_74e

    invoke-virtual {v10, v7}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v17

    if-lez v17, :cond_759

    :cond_74e
    invoke-interface {v14}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lhsg;

    iget-object v2, v2, Lhsg;->a:Ljava/lang/String;

    move-object v5, v2

    move-object v10, v7

    move-object v2, v15

    :cond_759
    move-object/from16 v7, v18

    goto :goto_736

    :cond_75c
    move-object/from16 v18, v7

    move-object/from16 v7, v18

    goto :goto_718

    :cond_761
    move-object/from16 v18, v7

    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v6, v10}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    new-instance v2, Lhsg;

    invoke-direct {v2, v5}, Lhsg;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2, v6}, Llee;->d(Lhsg;Ljava/lang/Object;)V

    sub-long/2addr v8, v12

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v4, v2}, Llee;->d(Lhsg;Ljava/lang/Object;)V

    goto :goto_77e

    :cond_77c
    move-object/from16 v18, v7

    :goto_77e
    new-instance v2, Ljava/util/HashSet;

    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v1, v11}, Llee;->c(Lhsg;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_78c

    move-object v5, v6

    :cond_78c
    check-cast v5, Ljava/util/Collection;

    invoke-direct {v2, v5}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v2, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    add-long/2addr v8, v12

    invoke-virtual {v1, v11, v2}, Llee;->d(Lhsg;Ljava/lang/Object;)V

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v4, v2}, Llee;->d(Lhsg;Ljava/lang/Object;)V

    invoke-virtual {v1, v3, v0}, Llee;->d(Lhsg;Ljava/lang/Object;)V

    :goto_7a2
    return-object v18

    :pswitch_7a3
    move-object v6, v0

    check-cast v6, Ltah;

    move-object v8, v12

    check-cast v8, Ljava/lang/String;

    check-cast v11, Ljava/io/File;

    move-object v0, v1

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_7e8

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v7, Lzz9;

    sget-object v0, Lo29;->k:Lo29;

    invoke-direct {v7, v0, v11, v8}, Lzz9;-><init>(Lo29;Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Ltah;->c(Lzz9;)V

    new-instance v9, Ljava/io/File;

    iget-object v0, v6, Ltah;->i:Ljava/lang/Object;

    check-cast v0, Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    invoke-virtual {v11}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "p"

    invoke-static {v2, v1}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v9, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v0, Lu12;

    invoke-direct {v0, v11, v9}, Lu12;-><init>(Ljava/io/File;Ljava/io/File;)V

    new-instance v5, Ld0a;

    const/4 v10, 0x0

    invoke-direct/range {v5 .. v10}, Ld0a;-><init>(Ltah;Lzz9;Ljava/lang/String;Ljava/io/File;B)V

    invoke-virtual {v6, v0, v5}, Ltah;->B(Lo0g;Lkotlin/jvm/functions/Function1;)V

    :cond_7e8
    iget-object v0, v6, Ltah;->j:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashSet;

    invoke-interface {v0, v11}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_7f2
    check-cast v0, Lkotlin/jvm/functions/Function1;

    check-cast v12, Ltah;

    check-cast v11, Lo0g;

    check-cast v1, Lt12;

    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v12, Ltah;->j:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashSet;

    invoke-virtual {v11}, Lo0g;->V()Ljava/io/File;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_80e
    move-object/from16 v18, v7

    check-cast v0, Lvg9;

    check-cast v12, Lgg9;

    check-cast v11, Lkotlin/jvm/functions/Function1;

    check-cast v1, Lvg9;

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_830

    iget-object v0, v12, Lgg9;->c:Lvg9;

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_835

    invoke-interface {v11, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    :cond_830
    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    goto :goto_83c

    :cond_835
    const-string v0, "Focus search landed at the root."

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    move-object/from16 v7, v18

    :goto_83c
    return-object v7

    :pswitch_83d
    check-cast v0, Lm39;

    check-cast v12, Lk2g;

    check-cast v11, Lj2g;

    check-cast v1, Ljava/util/List;

    iget-object v2, v0, Lm39;->f:Landroid/os/CancellationSignal;

    iget-object v3, v0, Lm39;->a:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/os/CancellationSignal;->isCanceled()Z

    move-result v2

    if-eqz v2, :cond_853

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto/16 :goto_94e

    :cond_853
    check-cast v1, Ljava/lang/Iterable;

    invoke-static {v1, v6}, Lkotlin/collections/CollectionsKt;->e0(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    new-instance v2, Ljava/util/ArrayList;

    const/16 v4, 0xa

    invoke-static {v1, v4}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_86a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_885

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lr3g;

    move-object v5, v12

    check-cast v5, Ld16;

    invoke-virtual {v0}, Lm39;->c()Landroid/widget/inline/InlinePresentationSpec;

    move-result-object v6

    invoke-virtual {v5, v3, v4, v6, v10}, Ld16;->c(Landroid/content/Context;Lr3g;Landroid/widget/inline/InlinePresentationSpec;Z)Landroid/service/autofill/Dataset;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_86a

    :cond_885
    check-cast v12, Ld16;

    new-instance v1, Landroid/service/autofill/FillResponse$Builder;

    invoke-direct {v1}, Landroid/service/autofill/FillResponse$Builder;-><init>()V

    invoke-virtual {v0}, Lm39;->b()Ls45;

    move-result-object v4

    iget-object v4, v4, Ls45;->a:Landroid/os/Bundle;

    invoke-virtual {v1, v4}, Landroid/service/autofill/FillResponse$Builder;->setClientState(Landroid/os/Bundle;)Landroid/service/autofill/FillResponse$Builder;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_8b7

    invoke-virtual {v0}, Lm39;->c()Landroid/widget/inline/InlinePresentationSpec;

    move-result-object v2

    invoke-virtual {v12, v3, v2}, Ld16;->d(Landroid/content/Context;Landroid/widget/inline/InlinePresentationSpec;)Ljava/lang/Iterable;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_8a7
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_927

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/service/autofill/Dataset;

    invoke-virtual {v1, v3}, Landroid/service/autofill/FillResponse$Builder;->addDataset(Landroid/service/autofill/Dataset;)Landroid/service/autofill/FillResponse$Builder;

    goto :goto_8a7

    :cond_8b7
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    :goto_8bb
    if-ge v10, v4, :cond_8c9

    invoke-virtual {v2, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v10, v10, 0x1

    check-cast v5, Landroid/service/autofill/Dataset;

    invoke-virtual {v1, v5}, Landroid/service/autofill/FillResponse$Builder;->addDataset(Landroid/service/autofill/Dataset;)Landroid/service/autofill/FillResponse$Builder;

    goto :goto_8bb

    :cond_8c9
    invoke-virtual {v0}, Lm39;->c()Landroid/widget/inline/InlinePresentationSpec;

    move-result-object v2

    invoke-virtual {v12, v3, v2}, Ld16;->d(Landroid/content/Context;Landroid/widget/inline/InlinePresentationSpec;)Ljava/lang/Iterable;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_8d5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8e5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/service/autofill/Dataset;

    invoke-virtual {v1, v4}, Landroid/service/autofill/FillResponse$Builder;->addDataset(Landroid/service/autofill/Dataset;)Landroid/service/autofill/FillResponse$Builder;

    goto :goto_8d5

    :cond_8e5
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x21

    if-lt v2, v4, :cond_927

    invoke-virtual {v0}, Lm39;->b()Ls45;

    move-result-object v2

    iget-boolean v2, v2, Ls45;->b:Z

    if-nez v2, :cond_927

    new-instance v2, Landroid/widget/RemoteViews;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const v5, 0x7f0d02ad

    invoke-direct {v2, v4, v5}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v4

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/content/pm/PackageItemInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    const v5, 0x7f1402ae

    invoke-virtual {v3, v5, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f0a06c5

    invoke-virtual {v2, v4, v3}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    iget-object v3, v12, Lk2g;->b:Lzyk;

    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Landroid/view/autofill/AutofillId;

    invoke-static {v1, v2, v3}, Lt8;->e0(Landroid/service/autofill/FillResponse$Builder;Landroid/widget/RemoteViews;[Landroid/view/autofill/AutofillId;)V

    :cond_927
    instance-of v2, v11, Lh2g;

    if-eqz v2, :cond_937

    check-cast v11, Lh2g;

    iget-object v2, v11, Lh2g;->d:Lsq2;

    iget-boolean v2, v2, Lsq2;->c:Z

    if-eqz v2, :cond_93a

    invoke-virtual {v0, v1, v12}, Lm39;->a(Landroid/service/autofill/FillResponse$Builder;Ld16;)V

    goto :goto_93a

    :cond_937
    invoke-virtual {v0, v1, v12}, Lm39;->a(Landroid/service/autofill/FillResponse$Builder;Ld16;)V

    :cond_93a
    :goto_93a
    iget-object v2, v0, Lm39;->d:Lvu2;

    iget-object v2, v2, Lvu2;->a:Lx5f;

    const/16 v3, 0x16

    invoke-virtual {v2, v3}, Lx5f;->S(I)V

    iget-object v0, v0, Lm39;->g:Landroid/service/autofill/FillCallback;

    invoke-virtual {v1}, Landroid/service/autofill/FillResponse$Builder;->build()Landroid/service/autofill/FillResponse;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/service/autofill/FillCallback;->onSuccess(Landroid/service/autofill/FillResponse;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_94e
    return-object v0

    :pswitch_94f
    move-object/from16 v18, v7

    check-cast v0, Lrz;

    check-cast v12, Lua7;

    move-object/from16 v20, v11

    check-cast v20, Lr0k;

    check-cast v1, Ljava/lang/Integer;

    iget-object v0, v0, Lrz;->b:Ljava/lang/Object;

    check-cast v0, Lxd5;

    if-eqz v0, :cond_976

    sget-object v2, Lmdb;->b:Ljava/util/Random;

    invoke-virtual {v2}, Ljava/util/Random;->nextInt()I

    move-result v2

    const v3, 0xffff

    and-int v10, v2, v3

    new-instance v7, Lxm5;

    invoke-direct {v7, v0}, Lxm5;-><init>(Ljava/lang/Object;)V

    move-object/from16 v22, v7

    :goto_973
    move/from16 v24, v10

    goto :goto_979

    :cond_976
    move-object/from16 v22, v18

    goto :goto_973

    :goto_979
    iget-object v2, v12, Lua7;->b:Ljava/lang/Object;

    move-object/from16 v19, v2

    check-cast v19, Landroid/content/Context;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v21

    new-instance v1, Lbn7;

    invoke-direct {v1, v12, v8}, Lbn7;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Ldg7;

    invoke-direct {v2, v12, v8}, Ldg7;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v23, v0

    move-object/from16 v25, v1

    move-object/from16 v26, v2

    invoke-static/range {v19 .. v26}, Lu85;->d(Landroid/content/Context;Lr0k;ILgdb;Lndc;ILjava/lang/Runnable;Lcom/opera/api/Callback;)Lu85;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_99a
    .packed-switch 0x0
        :pswitch_94f
        :pswitch_83d
        :pswitch_80e
        :pswitch_7f2
        :pswitch_7a3
        :pswitch_690
        :pswitch_5e2
        :pswitch_5a7
        :pswitch_59b
        :pswitch_587
        :pswitch_577
        :pswitch_558
        :pswitch_54a
        :pswitch_53c
        :pswitch_526
        :pswitch_510
        :pswitch_492
        :pswitch_44b
        :pswitch_42b
        :pswitch_3a8
        :pswitch_366
        :pswitch_25b
        :pswitch_1f0
        :pswitch_1ab
        :pswitch_16c
        :pswitch_14c
        :pswitch_96
        :pswitch_6f
        :pswitch_3d
    .end packed-switch
.end method
