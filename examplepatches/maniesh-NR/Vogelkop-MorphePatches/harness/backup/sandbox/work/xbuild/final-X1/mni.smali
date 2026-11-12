.class public final synthetic Lmni;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lmni;->a:B

    iput-object p1, p0, Lmni;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 22

    move-object/from16 v0, p0

    iget-byte v1, v0, Lmni;->a:B

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    iget-object v0, v0, Lmni;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_470

    check-cast v0, Lm59;

    iput-object v4, v0, Lm59;->e:Ljava/lang/Object;

    iget-object v0, v0, Lm59;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_18
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_28

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_18

    :cond_28
    return-void

    :pswitch_29
    move-object v1, v0

    check-cast v1, Lkdk;

    const/4 v2, 0x3

    :try_start_2d
    iget-object v0, v1, Lkdk;->d:Lldk;

    iget-object v3, v1, Lkdk;->c:Ljava/lang/Object;

    invoke-virtual {v0, v3}, Lldk;->b(Ljava/lang/Object;)V
    :try_end_34
    .catch Ljava/io/IOException; {:try_start_2d .. :try_end_34} :catch_63
    .catchall {:try_start_2d .. :try_end_34} :catchall_6a

    iget-object v0, v1, Lkdk;->d:Lldk;

    iget-object v0, v0, Lldk;->b:Lr16;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lngh;->c:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_47

    :try_start_3f
    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v4, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_46
    .catch Ljava/lang/IllegalAccessException; {:try_start_3f .. :try_end_46} :catch_4c
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_3f .. :try_end_46} :catch_4c

    goto :goto_4c

    :cond_47
    sget-object v0, Lngh;->d:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove(Ljava/lang/Object;)Z

    :catch_4c
    :goto_4c
    iget-object v0, v1, Lkdk;->a:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    iget-object v0, v1, Lkdk;->d:Lldk;

    iget-object v3, v0, Lldk;->d:Ljava/lang/Object;

    monitor-enter v3

    :try_start_56
    iget-object v0, v1, Lkdk;->d:Lldk;

    iput v2, v0, Lldk;->h:I

    invoke-virtual {v0}, Lldk;->e()V

    monitor-exit v3

    return-void

    :goto_5f
    monitor-exit v3
    :try_end_60
    .catchall {:try_start_56 .. :try_end_60} :catchall_61

    throw v0

    :catchall_61
    move-exception v0

    goto :goto_5f

    :catch_63
    move-exception v0

    :try_start_64
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
    :try_end_6a
    .catchall {:try_start_64 .. :try_end_6a} :catchall_6a

    :catchall_6a
    move-exception v0

    iget-object v3, v1, Lkdk;->d:Lldk;

    iget-object v3, v3, Lldk;->b:Lr16;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Lngh;->c:Ljava/lang/reflect/Method;

    if-eqz v3, :cond_7e

    :try_start_76
    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7d
    .catch Ljava/lang/IllegalAccessException; {:try_start_76 .. :try_end_7d} :catch_83
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_76 .. :try_end_7d} :catch_83

    goto :goto_83

    :cond_7e
    sget-object v3, Lngh;->d:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v3, v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove(Ljava/lang/Object;)Z

    :catch_83
    :goto_83
    iget-object v3, v1, Lkdk;->a:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v3}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    iget-object v3, v1, Lkdk;->d:Lldk;

    iget-object v4, v3, Lldk;->d:Ljava/lang/Object;

    monitor-enter v4

    :try_start_8d
    iget-object v1, v1, Lkdk;->d:Lldk;

    iput v2, v1, Lldk;->h:I

    invoke-virtual {v1}, Lldk;->e()V

    monitor-exit v4
    :try_end_95
    .catchall {:try_start_8d .. :try_end_95} :catchall_98

    throw v0

    :goto_96
    :try_start_96
    monitor-exit v4
    :try_end_97
    .catchall {:try_start_96 .. :try_end_97} :catchall_98

    throw v0

    :catchall_98
    move-exception v0

    goto :goto_96

    :pswitch_9a
    move-object v4, v0

    check-cast v4, Lev7;

    iput-boolean v2, v4, Lev7;->c:Z

    iget-object v0, v4, Lev7;->j:Ljava/lang/Object;

    check-cast v0, Loji;

    iget-object v0, v0, Loji;->a:Ljava/lang/Object;

    check-cast v0, Lc5l;

    iget-object v1, v4, Lev7;->g:Ljava/lang/Object;

    check-cast v1, Lpde;

    iget-object v5, v4, Lev7;->f:Ljava/lang/Object;

    move-object v11, v5

    check-cast v11, Landroidx/recyclerview/widget/RecyclerView;

    iget-object v5, v4, Lev7;->b:Ljava/lang/Object;

    move-object v12, v5

    check-cast v12, Ljava/util/LinkedHashMap;

    invoke-virtual {v12}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v5

    check-cast v5, Ljava/lang/Iterable;

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_bf
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    const/4 v13, 0x0

    if-eqz v6, :cond_d4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lsck;

    iget-object v7, v6, Lsck;->b:Landroid/graphics/Rect;

    invoke-virtual {v7}, Landroid/graphics/Rect;->setEmpty()V

    iput v13, v6, Lsck;->c:F

    goto :goto_bf

    :cond_d4
    invoke-virtual {v11}, Landroid/view/View;->getLayoutDirection()I

    move-result v5

    if-eq v5, v3, :cond_db

    move v3, v2

    :cond_db
    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Leyj;

    iget-object v14, v5, Leyj;->j:Loxj;

    new-instance v5, Lg6n;

    invoke-direct {v5, v11}, Lg6n;-><init>(Landroid/view/ViewGroup;)V

    invoke-virtual {v5}, Lg6n;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :cond_ec
    :goto_ec
    move-object v5, v15

    check-cast v5, Lh6n;

    invoke-virtual {v5}, Lh6n;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1a8

    invoke-virtual {v5}, Lh6n;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    invoke-virtual {v11, v5}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v6

    instance-of v7, v6, Lpkb;

    if-eqz v7, :cond_ec

    instance-of v7, v6, Lh5l;

    if-nez v7, :cond_116

    iget-object v8, v0, Lc5l;->w:Ljava/util/LinkedHashSet;

    invoke-interface {v8, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_116

    iget-object v8, v6, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getTranslationX()F

    move-result v8

    goto :goto_117

    :cond_116
    move v8, v13

    :goto_117
    invoke-static {v8}, Lzed;->b(F)I

    move-result v16

    if-nez v7, :cond_12c

    iget-object v7, v0, Lc5l;->w:Ljava/util/LinkedHashSet;

    invoke-interface {v7, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_12c

    iget-object v7, v6, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getTranslationY()F

    move-result v7

    goto :goto_12d

    :cond_12c
    move v7, v13

    :goto_12d
    invoke-static {v7}, Lzed;->b(F)I

    move-result v17

    move-object/from16 v18, v6

    check-cast v18, Lpkb;

    move-object v6, v5

    invoke-interface/range {v18 .. v18}, Lpkb;->getGroupId()I

    move-result v5

    if-eqz v5, :cond_17d

    invoke-interface/range {v18 .. v18}, Lpkb;->d()Z

    move-result v7

    if-nez v7, :cond_17d

    iget-object v7, v14, Loxj;->b:Lsxj;

    invoke-virtual {v7, v3}, Lsxj;->a(Z)I

    move-result v8

    invoke-virtual {v7, v3}, Lsxj;->b(Z)I

    move-result v9

    iget v10, v7, Lsxj;->b:I

    iget v7, v7, Lsxj;->d:I

    invoke-virtual {v6}, Landroid/view/View;->getLeft()I

    move-result v19

    sub-int v19, v19, v8

    add-int v19, v19, v16

    invoke-virtual {v6}, Landroid/view/View;->getTop()I

    move-result v8

    sub-int/2addr v8, v10

    add-int v8, v8, v17

    invoke-virtual {v6}, Landroid/view/View;->getRight()I

    move-result v10

    add-int/2addr v10, v9

    add-int v10, v10, v16

    invoke-virtual {v6}, Landroid/view/View;->getBottom()I

    move-result v9

    add-int/2addr v9, v7

    add-int v9, v9, v17

    move v7, v8

    move v8, v10

    invoke-virtual {v6}, Landroid/view/View;->getAlpha()F

    move-result v10

    move/from16 v20, v19

    move-object/from16 v19, v6

    move/from16 v6, v20

    invoke-virtual/range {v4 .. v10}, Lev7;->g(IIIIIF)V

    goto :goto_17f

    :cond_17d
    move-object/from16 v19, v6

    :goto_17f
    if-eqz v5, :cond_ec

    invoke-interface/range {v18 .. v18}, Lpkb;->n()Z

    move-result v6

    if-eqz v6, :cond_ec

    invoke-virtual/range {v19 .. v19}, Landroid/view/View;->getLeft()I

    move-result v6

    add-int v6, v6, v16

    invoke-virtual/range {v19 .. v19}, Landroid/view/View;->getTop()I

    move-result v7

    add-int v7, v7, v17

    invoke-virtual/range {v19 .. v19}, Landroid/view/View;->getRight()I

    move-result v8

    add-int v8, v8, v16

    invoke-virtual/range {v19 .. v19}, Landroid/view/View;->getBottom()I

    move-result v9

    add-int v9, v9, v17

    invoke-virtual/range {v19 .. v19}, Landroid/view/View;->getAlpha()F

    move-result v10

    invoke-virtual/range {v4 .. v10}, Lev7;->g(IIIIIF)V

    goto/16 :goto_ec

    :cond_1a8
    invoke-virtual {v12}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    new-instance v3, Ln6k;

    const/16 v5, 0xa

    invoke-direct {v3, v4, v5}, Ln6k;-><init>(Ljava/lang/Object;B)V

    new-instance v5, Lzx1;

    const/16 v6, 0x11

    invoke-direct {v5, v3, v6}, Lzx1;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v0, v5}, Ljava/util/Collection;->removeIf(Ljava/util/function/Predicate;)Z

    iget-object v0, v4, Lev7;->k:Ljava/lang/Object;

    check-cast v0, Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Leyj;

    iget-object v1, v1, Leyj;->i:Lj7h;

    instance-of v3, v1, Lwxj;

    if-nez v3, :cond_216

    instance-of v3, v1, Lxxj;

    if-nez v3, :cond_216

    sget-object v3, Lyxj;->b:Lyxj;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_212

    iget-object v1, v4, Lev7;->l:Ljava/lang/Object;

    check-cast v1, Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1e7
    :goto_1e7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_20c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Luck;

    iget-object v4, v3, Luck;->a:Ln4l;

    iget-object v4, v4, Ln4l;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v4}, Landroid/view/View;->getBottom()I

    move-result v4

    if-ge v2, v4, :cond_1fe

    move v2, v4

    :cond_1fe
    iget-object v3, v3, Luck;->a:Ln4l;

    iget-object v3, v3, Ln4l;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v3}, Landroid/view/View;->getAlpha()F

    move-result v3

    cmpg-float v4, v13, v3

    if-gez v4, :cond_1e7

    move v13, v3

    goto :goto_1e7

    :cond_20c
    new-instance v1, Lfvl;

    invoke-direct {v1, v2, v13}, Lfvl;-><init>(IF)V

    goto :goto_218

    :cond_212
    invoke-static {}, Lh9o;->p()V

    goto :goto_21b

    :cond_216
    sget-object v1, Lfvl;->c:Lfvl;

    :goto_218
    invoke-static {v0, v1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    :goto_21b
    return-void

    :pswitch_21c
    check-cast v0, Lwzg;

    iput-object v4, v0, Lwzg;->c:Ljava/lang/Object;

    return-void

    :pswitch_221
    check-cast v0, Lo9k;

    iget-boolean v1, v0, Lo9k;->k:Z

    if-eqz v1, :cond_27a

    iget-object v1, v0, Lo9k;->g:Lor2;

    if-nez v1, :cond_22c

    move-object v1, v4

    :cond_22c
    iget-object v1, v1, Lor2;->b:Ljava/lang/Object;

    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    iget-object v3, v0, Lo9k;->g:Lor2;

    if-nez v3, :cond_239

    move-object v3, v4

    :cond_239
    iget-object v3, v3, Lor2;->e:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v3

    iget-object v5, v0, Lo9k;->g:Lor2;

    if-nez v5, :cond_246

    move-object v5, v4

    :cond_246
    iget-object v5, v5, Lor2;->e:Ljava/lang/Object;

    check-cast v5, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    instance-of v6, v5, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v6, :cond_255

    check-cast v5, Landroid/view/ViewGroup$MarginLayoutParams;

    goto :goto_256

    :cond_255
    move-object v5, v4

    :goto_256
    if-eqz v5, :cond_25a

    iget v2, v5, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    :cond_25a
    sub-int/2addr v3, v2

    sub-int/2addr v1, v3

    int-to-float v1, v1

    const/high16 v2, 0x40400000    # 3.0f

    div-float/2addr v1, v2

    sget-object v2, Ld0n;->j:Landroid/view/animation/PathInterpolator;

    iget-object v2, v0, Lo9k;->g:Lor2;

    if-nez v2, :cond_267

    move-object v2, v4

    :cond_267
    iget-object v2, v2, Lor2;->e:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-static {v2, v1}, Luyg;->c(Landroid/view/View;F)V

    iget-object v0, v0, Lo9k;->g:Lor2;

    if-eqz v0, :cond_273

    move-object v4, v0

    :cond_273
    iget-object v0, v4, Lor2;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/startup/ContentWrapperLayout;

    invoke-static {v0, v1}, Luyg;->c(Landroid/view/View;F)V

    :cond_27a
    return-void

    :pswitch_27b
    check-cast v0, Lm9k;

    iput-object v4, v0, Lm9k;->h:Loml;

    invoke-virtual {v0, v3}, Lm9k;->R(Z)V

    return-void

    :pswitch_283
    check-cast v0, Lj9k;

    invoke-virtual {v0}, Lj9k;->d()Z

    move-result v1

    if-nez v1, :cond_2d3

    iget-object v1, v0, Lj9k;->a:Landroid/app/Activity;

    const/4 v2, 0x6

    invoke-static {v3, v1}, Lvtp;->G(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Loup;->a0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2a6

    invoke-static {v1}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2a6

    invoke-static {v1}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    :cond_2a6
    if-nez v4, :cond_2d0

    invoke-virtual {v0}, Lj9k;->d()Z

    move-result v1

    if-nez v1, :cond_2d3

    new-instance v1, Li9k;

    invoke-direct {v1, v0}, Li9k;-><init>(Lj9k;)V

    iput-object v1, v0, Lj9k;->e:Li9k;

    sget-object v0, Lxw1;->b:Lvzk;

    iget-object v2, v0, Lvzk;->b:Ljava/lang/Object;

    check-cast v2, Li7f;

    invoke-virtual {v2, v1}, Li7f;->b(Ljava/lang/Object;)Z

    iget-object v2, v0, Lvzk;->c:Ljava/lang/Object;

    monitor-enter v2

    :try_start_2c1
    iget-object v0, v0, Lvzk;->d:Ljava/lang/Object;

    check-cast v0, Lpw1;

    monitor-exit v2
    :try_end_2c6
    .catchall {:try_start_2c1 .. :try_end_2c6} :catchall_2ce

    if-eqz v0, :cond_2d3

    invoke-virtual {v1, v0}, Li9k;->a(Lpw1;)V

    goto :goto_2d3

    :goto_2cc
    :try_start_2cc
    monitor-exit v2
    :try_end_2cd
    .catchall {:try_start_2cc .. :try_end_2cd} :catchall_2ce

    throw v0

    :catchall_2ce
    move-exception v0

    goto :goto_2cc

    :cond_2d0
    invoke-virtual {v0, v4}, Lj9k;->e(Ljava/lang/String;)V

    :cond_2d3
    :goto_2d3
    return-void

    :pswitch_2d4
    check-cast v0, Lx4k;

    iget-object v1, v0, Lx4k;->e:Lc5k;

    iget-object v1, v1, Lc5k;->B:Lcom/opera/android/feed/FeedViewPager;

    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->removeOnPageChangeListener(Le8n;)V

    return-void

    :pswitch_2de
    check-cast v0, Lc5k;

    invoke-virtual {v0}, Lc5k;->m()V

    return-void

    :pswitch_2e4
    check-cast v0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;

    iget-object v1, v0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;->K0:Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;

    if-eqz v1, :cond_2f8

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget v2, v1, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;->f:I

    new-instance v3, Lv1k;

    invoke-direct {v3, v2, v0, v1}, Lv1k;-><init>(ILandroid/content/Context;Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;)V

    invoke-virtual {v1, v3}, Landroidx/recyclerview/widget/f;->startSmoothScroll(Luph;)V

    :cond_2f8
    return-void

    :pswitch_2f9
    check-cast v0, Lg0k;

    sget v1, Lg0k;->l:I

    iget-object v1, v0, Lg0k;->h:Landroid/view/Surface;

    if-eqz v1, :cond_319

    iget-object v2, v0, Lg0k;->a:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_307
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_319

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmi8;

    iget-object v3, v3, Lmi8;->a:Lqi8;

    invoke-virtual {v3, v4}, Lqi8;->R0(Ljava/lang/Object;)V

    goto :goto_307

    :cond_319
    iget-object v2, v0, Lg0k;->g:Landroid/graphics/SurfaceTexture;

    if-eqz v2, :cond_320

    invoke-virtual {v2}, Landroid/graphics/SurfaceTexture;->release()V

    :cond_320
    if-eqz v1, :cond_325

    invoke-virtual {v1}, Landroid/view/Surface;->release()V

    :cond_325
    iput-object v4, v0, Lg0k;->g:Landroid/graphics/SurfaceTexture;

    iput-object v4, v0, Lg0k;->h:Landroid/view/Surface;

    return-void

    :pswitch_32a
    check-cast v0, Lw6j;

    invoke-virtual {v0}, Lw6j;->b()V

    return-void

    :pswitch_330
    check-cast v0, Luyj;

    iget-object v0, v0, Luyj;->e:Lkotlin/jvm/functions/Function0;

    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_338
    check-cast v0, Lzfe;

    iget-object v0, v0, Lzfe;->c:Ljava/lang/Object;

    check-cast v0, Ljuj;

    iget v1, v0, Ljuj;->y:I

    add-int/2addr v1, v3

    iput v1, v0, Ljuj;->y:I

    return-void

    :pswitch_344
    check-cast v0, Lxnj;

    invoke-virtual {v0, v4}, Lxnj;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_34a
    check-cast v0, Lghf;

    iget-object v1, v0, Lghf;->d:Ljava/lang/Object;

    check-cast v1, Lnya;

    if-eqz v1, :cond_355

    invoke-static {v1}, Loya;->a(Lnya;)V

    :cond_355
    iget-object v0, v0, Lghf;->c:Ljava/lang/Object;

    check-cast v0, Lbnj;

    invoke-interface {v0, v3}, Lbnj;->f(Z)V

    return-void

    :pswitch_35d
    check-cast v0, Loq3;

    iput-boolean v2, v0, Loq3;->c:Z

    iget-object v1, v0, Loq3;->e:Lnv5;

    check-cast v1, Lcom/google/android/material/sidesheet/SideSheetBehavior;

    iget-object v2, v1, Lcom/google/android/material/sidesheet/SideSheetBehavior;->i:Lx5n;

    if-eqz v2, :cond_375

    invoke-virtual {v2}, Lx5n;->f()Z

    move-result v2

    if-eqz v2, :cond_375

    iget-byte v1, v0, Loq3;->b:B

    invoke-virtual {v0, v1}, Loq3;->a(I)V

    goto :goto_37f

    :cond_375
    iget v2, v1, Lcom/google/android/material/sidesheet/SideSheetBehavior;->h:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_37f

    iget-byte v0, v0, Loq3;->b:B

    invoke-virtual {v1, v0}, Lcom/google/android/material/sidesheet/SideSheetBehavior;->y(I)V

    :cond_37f
    :goto_37f
    return-void

    :pswitch_380
    check-cast v0, Lshf;

    iget-object v1, v0, Lshf;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayDeque;

    monitor-enter v1

    :try_start_387
    iget-object v2, v0, Lshf;->a:Ljava/lang/Object;

    check-cast v2, Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "topic_operation_queue"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, v0, Lshf;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_39e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3b3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_39e

    :cond_3b3
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v3, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    monitor-exit v1

    return-void

    :goto_3c0
    monitor-exit v1
    :try_end_3c1
    .catchall {:try_start_387 .. :try_end_3c1} :catchall_3c2

    throw v0

    :catchall_3c2
    move-exception v0

    goto :goto_3c0

    :pswitch_3c4
    check-cast v0, Ltmi;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ltmi;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_3cc
    check-cast v0, Lnrl;

    invoke-virtual {v0}, Lnrl;->K()V

    return-void

    :pswitch_3d2
    check-cast v0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    sget-object v1, Lc9j;->w:[Lxtb;

    sget-object v1, Lq9n;->c:Ll5b;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lq9n;->G(Landroid/content/Context;Landroid/view/View;)Z

    return-void

    :pswitch_3e0
    check-cast v0, Lj6j;

    iget-object v1, v0, Lj6j;->c:Lk6j;

    sget-object v3, Lk6j;->x:[Lxtb;

    invoke-virtual {v1}, Lryl;->i0()Z

    move-result v3

    if-eqz v3, :cond_3fc

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v1}, Lk6j;->H0()Lpm9;

    move-result-object v1

    iget-object v1, v1, Lpm9;->c:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v1, v2}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    :cond_3fc
    iput v2, v0, Lj6j;->a:I

    return-void

    :pswitch_3ff
    check-cast v0, Lm59;

    invoke-virtual {v0}, Lm59;->k()V

    return-void

    :pswitch_405
    check-cast v0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    invoke-virtual {v0}, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->w()I

    move-result v1

    if-eqz v1, :cond_41f

    if-ne v1, v3, :cond_422

    iget-object v1, v0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->H:Ld06;

    if-eqz v1, :cond_422

    iget-object v2, v1, Ld06;->a:Ljava/lang/Object;

    check-cast v2, Landroid/widget/PopupWindow;

    if-eqz v2, :cond_422

    invoke-virtual {v2}, Landroid/widget/PopupWindow;->dismiss()V

    iput-object v4, v1, Ld06;->a:Ljava/lang/Object;

    goto :goto_422

    :cond_41f
    invoke-virtual {v0}, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->e()V

    :cond_422
    :goto_422
    iput-object v4, v0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->P:Lorg/chromium/ui/listmenu/MenuModelBridge;

    return-void

    :pswitch_425
    check-cast v0, Ltn;

    iget-boolean v1, v0, Ltn;->a:Z

    if-eqz v1, :cond_436

    iput-boolean v2, v0, Ltn;->a:Z

    iget-object v0, v0, Ltn;->b:Ljava/lang/Object;

    check-cast v0, Lwci;

    sget-object v1, Lrjf;->c:Lrjf;

    invoke-virtual {v0, v1}, Lwci;->o(Lrjf;)V

    :cond_436
    return-void

    :pswitch_437
    check-cast v0, Lyyi;

    invoke-virtual {v0}, Lyyi;->I0()V

    iget-object v0, v0, Lltl;->m:Lse;

    if-eqz v0, :cond_443

    invoke-virtual {v0}, Lse;->g()V

    :cond_443
    return-void

    :pswitch_444
    check-cast v0, Lcan;

    invoke-virtual {v0}, Lcan;->d()V

    return-void

    :pswitch_44a
    check-cast v0, Ls4f;

    invoke-virtual {v0}, Ls4f;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_450
    check-cast v0, Lorg/chromium/base/ScreenStateReceiver;

    sget-object v1, Lorg/chromium/base/ScreenStateReceiver;->c:Lorg/chromium/base/ScreenStateReceiver;

    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    const-string v2, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v2, "android.intent.action.SCREEN_ON"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    sget-object v2, Lt8;->a:Landroid/content/Context;

    invoke-static {v2, v0, v1}, Lt8;->Q(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void

    :pswitch_469
    check-cast v0, Lorg/chromium/content_public/browser/media/capture/ScreenCapture;

    sget-object v1, Lorg/chromium/content_public/browser/media/capture/ScreenCapture;->d:Ljava/util/concurrent/atomic/AtomicReference;

    iput-object v4, v0, Lorg/chromium/content_public/browser/media/capture/ScreenCapture;->c:Landroid/content/Context;

    return-void

    :pswitch_data_470
    .packed-switch 0x0
        :pswitch_469
        :pswitch_450
        :pswitch_44a
        :pswitch_444
        :pswitch_437
        :pswitch_425
        :pswitch_405
        :pswitch_3ff
        :pswitch_3e0
        :pswitch_3d2
        :pswitch_3cc
        :pswitch_3c4
        :pswitch_380
        :pswitch_35d
        :pswitch_34a
        :pswitch_344
        :pswitch_338
        :pswitch_330
        :pswitch_32a
        :pswitch_2f9
        :pswitch_2e4
        :pswitch_2de
        :pswitch_2d4
        :pswitch_283
        :pswitch_27b
        :pswitch_221
        :pswitch_21c
        :pswitch_9a
        :pswitch_29
    .end packed-switch
.end method
