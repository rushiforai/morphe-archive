.class public final Lw6j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lu9j;
.implements Llnk;
.implements Ll4c;
.implements Ljqo;


# instance fields
.field public final a:Ljava/lang/Object;

.field public b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(ILh1b;JLcom/opera/api/Callback;)V
    .registers 14

    .line 491
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 492
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lw6j;->c:Ljava/lang/Object;

    .line 493
    new-instance v0, Landroid/util/SparseBooleanArray;

    invoke-direct {v0}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object v0, p0, Lw6j;->d:Ljava/lang/Object;

    .line 494
    new-instance v0, Lmni;

    const/16 v1, 0x12

    invoke-direct {v0, p0, v1}, Lmni;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lw6j;->e:Ljava/lang/Object;

    .line 495
    iput-object p2, p0, Lw6j;->a:Ljava/lang/Object;

    .line 496
    iput-object p5, p0, Lw6j;->b:Ljava/lang/Object;

    .line 497
    invoke-static {v0, p3, p4}, Lvml;->d(Ljava/lang/Runnable;J)V

    .line 498
    new-instance p3, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p2}, Ljava/util/AbstractCollection;->size()I

    move-result p4

    invoke-direct {p3, p4}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    const/4 p4, 0x0

    .line 499
    invoke-virtual {p2, p4}, Lh1b;->u(I)La1b;

    move-result-object p2

    .line 500
    :goto_2f
    invoke-virtual {p2}, Lq4;->hasNext()Z

    move-result p5

    if-eqz p5, :cond_77

    invoke-virtual {p2}, Lq4;->next()Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Lozj;

    .line 501
    iget-object v0, p0, Lw6j;->d:Ljava/lang/Object;

    check-cast v0, Landroid/util/SparseBooleanArray;

    invoke-interface {p5}, Lozj;->b()I

    move-result v1

    invoke-virtual {v0, v1, p4}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 502
    invoke-interface {p5}, Lozj;->a()Ljava/lang/String;

    move-result-object v2

    new-instance v0, Ls2g;

    const/4 v1, 0x6

    invoke-direct {v0, p0, p5, p3, v1}, Ls2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    .line 503
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result p5

    if-nez p5, :cond_5e

    .line 504
    sget-object p5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, p5}, Ls2g;->run(Ljava/lang/Object;)V

    const/4 p5, 0x0

    move v3, p1

    goto :goto_6c

    .line 505
    :cond_5e
    new-instance v7, Lsok;

    invoke-direct {v7, v0}, Lsok;-><init>(Ls2g;)V

    const/4 v5, 0x0

    const/16 v6, 0xa

    move v4, p1

    move v3, p1

    .line 506
    invoke-static/range {v2 .. v7}, Loya;->b(Ljava/lang/String;IIIILmya;)Lnya;

    move-result-object p5

    :goto_6c
    if-eqz p5, :cond_75

    .line 507
    iget-object p1, p0, Lw6j;->c:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1, p5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_75
    move p1, v3

    goto :goto_2f

    :cond_77
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;Lqfl;Lp7l;)V
    .registers 5

    .line 449
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 450
    iput-object p1, p0, Lw6j;->a:Ljava/lang/Object;

    .line 451
    iput-object p2, p0, Lw6j;->b:Ljava/lang/Object;

    .line 452
    iput-object p3, p0, Lw6j;->c:Ljava/lang/Object;

    .line 453
    iput-object p4, p0, Lw6j;->d:Ljava/lang/Object;

    .line 454
    new-instance p3, Lqfl;

    const/16 p4, 0xe

    invoke-direct {p3, p0, p4}, Lqfl;-><init>(Ljava/lang/Object;B)V

    .line 455
    sget-object p0, Ljlm;->a:Lnx1;

    new-instance p4, Landroid/util/Pair;

    invoke-direct {p4, p1, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0, p4}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lhlm;

    .line 456
    iget-object p1, p0, Lhlm;->a:Ltcl;

    .line 457
    new-instance p2, Lrml;

    sget-object p4, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {p2, p4, p1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    .line 458
    new-instance p1, Lqfl;

    const/16 p4, 0x10

    invoke-direct {p1, p0, p4}, Lqfl;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    .line 459
    new-instance p1, Lqfl;

    const/16 p2, 0x11

    invoke-direct {p1, p3, p2}, Lqfl;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    .line 460
    invoke-virtual {p0}, Lplk;->l()Loml;

    return-void
.end method

.method public constructor <init>(Landroid/view/View;Lemn;)V
    .registers 7

    .line 471
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 472
    new-instance v0, Lzjn;

    invoke-direct {v0}, Lzjn;-><init>()V

    iput-object v0, p0, Lw6j;->a:Ljava/lang/Object;

    .line 473
    iput-object p2, p0, Lw6j;->b:Ljava/lang/Object;

    .line 474
    iput-object p1, p0, Lw6j;->c:Ljava/lang/Object;

    .line 475
    new-instance p2, Landroid/widget/OverScroller;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Llf1;->c:Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {p2, v0, v1}, Landroid/widget/OverScroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object p2, p0, Lw6j;->d:Ljava/lang/Object;

    .line 476
    new-instance p2, Landroid/view/ScaleGestureDetector;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Lakn;

    invoke-direct {v1, p0}, Lakn;-><init>(Lw6j;)V

    invoke-direct {p2, v0, v1}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    const/4 v0, 0x0

    .line 477
    invoke-virtual {p2, v0}, Landroid/view/ScaleGestureDetector;->setQuickScaleEnabled(Z)V

    .line 478
    new-instance v0, Landroid/view/GestureDetector;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lsgh;

    const/4 v3, 0x3

    invoke-direct {v2, p0, p2, v3}, Lsgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v0, v1, v2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 479
    new-instance p0, Lbmd;

    const/4 v1, 0x1

    invoke-direct {p0, p2, v0, v1}, Lbmd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;Landroid/view/View;Landroid/view/View;Lcom/opera/android/BrowserActivity;Lcom/opera/android/settings/SettingsManager;Lk6l;Lq6e;Lv3m;Loz3;Laal;Ly0f;La4m;Lpde;)V
    .registers 38

    move-object/from16 v0, p0

    move-object/from16 v2, p1

    move-object/from16 v11, p2

    move-object/from16 v4, p6

    move-object/from16 v6, p8

    move-object/from16 v12, p12

    move-object/from16 v13, p13

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v2, v0, Lw6j;->a:Ljava/lang/Object;

    iput-object v12, v0, Lw6j;->b:Ljava/lang/Object;

    new-instance v1, Lp8f;

    const/16 v3, 0xf

    move-object/from16 v5, p7

    invoke-direct {v1, v2, v4, v5, v3}, Lp8f;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v1, v0, Lw6j;->d:Ljava/lang/Object;

    new-instance v14, Lyg;

    invoke-direct {v14, v6, v4}, Lyg;-><init>(Lv3m;Lk6l;)V

    new-instance v3, Lr4m;

    new-instance v7, Lcbl;

    const/16 v5, 0x11

    invoke-direct {v7, v14, v5}, Lcbl;-><init>(Ljava/lang/Object;B)V

    new-instance v8, Lcbl;

    const/16 v5, 0x12

    invoke-direct {v8, v1, v5}, Lcbl;-><init>(Ljava/lang/Object;B)V

    new-instance v9, Lghf;

    invoke-virtual {v11}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/16 v5, 0x1c

    move-object/from16 v10, p10

    invoke-direct {v9, v4, v10, v1, v5}, Lghf;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    const v1, 0x7f040a4c

    const/4 v15, 0x0

    invoke-static {v1, v2, v15}, Lf03;->w(ILandroid/content/Context;I)I

    move-result v1

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-virtual {v2}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    invoke-static {v5, v10}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v5

    add-int v10, v5, v1

    move-object/from16 v5, p5

    move-object v1, v3

    move-object/from16 v3, p4

    invoke-direct/range {v1 .. v10}, Lr4m;-><init>(Lcom/opera/android/BrowserActivity;Lcom/opera/android/BrowserActivity;Lk6l;Lcom/opera/android/settings/SettingsManager;Lv3m;Lcbl;Lcbl;Lghf;I)V

    iput-object v1, v0, Lw6j;->e:Ljava/lang/Object;

    iget-object v2, v14, Lyg;->d:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;

    iget-object v4, v2, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->c:Lpje;

    iget-object v5, v2, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->e:Lkze;

    if-eqz v5, :cond_6d

    invoke-virtual {v5, v4}, Lekc;->p(Lf7f;)V

    :cond_6d
    iget-object v5, v1, Lr4m;->j:Lkze;

    iput-object v5, v2, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->e:Lkze;

    invoke-virtual {v5, v4}, Lekc;->k(Lf7f;)V

    iput-object v1, v14, Lyg;->e:Ljava/lang/Object;

    new-instance v2, Lala;

    new-instance v4, Ljjg;

    const/16 v5, 0xc

    invoke-direct {v4, v6, v5}, Ljjg;-><init>(Ljava/lang/Object;B)V

    new-instance v5, Lf0c;

    invoke-direct {v5, v6}, Lf0c;-><init>(Lv3m;)V

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    new-instance v6, Lpde;

    sget-object v7, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {v6, v7}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v6, v2, Lala;->d:Ljava/lang/Object;

    const v6, 0x7f0a01c1

    invoke-static {v6, v11}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/LinearLayout;

    if-eqz v7, :cond_19b

    const v6, 0x7f0a0231

    invoke-static {v6, v11}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v18, v7

    check-cast v18, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v18, :cond_19b

    const v6, 0x7f0a05e5

    invoke-static {v6, v11}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v19, v7

    check-cast v19, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;

    if-eqz v19, :cond_19b

    const v6, 0x7f0a0685

    invoke-static {v6, v11}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v20, v7

    check-cast v20, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v20, :cond_19b

    const v6, 0x7f0a0bea

    invoke-static {v6, v11}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v21, v7

    check-cast v21, Lcom/opera/android/custom_views/BottomIndicatorButton;

    if-eqz v21, :cond_19b

    const v6, 0x7f0a0beb

    invoke-static {v6, v11}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v22, v7

    check-cast v22, Lcom/opera/android/custom_views/BottomIndicatorButton;

    if-eqz v22, :cond_19b

    move-object/from16 v17, v11

    check-cast v17, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v16, Lpt1;

    move-object/from16 v23, v17

    invoke-direct/range {v16 .. v23}, Lpt1;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/BottomIndicatorButton;Lcom/opera/android/custom_views/BottomIndicatorButton;Landroidx/constraintlayout/widget/ConstraintLayout;)V

    move-object/from16 v11, v16

    move-object/from16 v10, v17

    move-object/from16 v7, v18

    move-object/from16 v6, v20

    move-object/from16 v8, v21

    move-object/from16 v9, v22

    iput-object v11, v2, Lala;->a:Ljava/lang/Object;

    move-object/from16 v11, p3

    iput-object v11, v2, Lala;->b:Ljava/lang/Object;

    move-object/from16 v11, p9

    iput-object v11, v2, Lala;->c:Ljava/lang/Object;

    iput-object v1, v2, Lala;->g:Ljava/lang/Object;

    move-object/from16 v11, p11

    iput-object v11, v2, Lala;->e:Ljava/lang/Object;

    iput-object v12, v2, Lala;->f:Ljava/lang/Object;

    move-object/from16 v11, p5

    iput-object v11, v2, Lala;->k:Ljava/lang/Object;

    iput-object v13, v2, Lala;->l:Ljava/lang/Object;

    new-instance v11, Lm3m;

    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v12

    invoke-direct {v11, v12, v2}, Lm3m;-><init>(Landroid/content/Context;Lala;)V

    iput-object v11, v2, Lala;->h:Ljava/lang/Object;

    new-instance v11, Lz3m;

    invoke-virtual {v10}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v12

    new-instance v14, Lcrk;

    const/16 v15, 0x15

    invoke-direct {v14, v1, v15}, Lcrk;-><init>(Ljava/lang/Object;B)V

    new-instance v15, Lk4m;

    move-object/from16 p1, v4

    const/4 v4, 0x1

    invoke-direct {v15, v2, v4}, Lk4m;-><init>(Lala;B)V

    move-object/from16 p8, p1

    move-object/from16 p9, v5

    move-object/from16 p5, v11

    move-object/from16 p6, v12

    move-object/from16 p7, v14

    move-object/from16 p10, v15

    invoke-direct/range {p5 .. p10}, Lz3m;-><init>(Landroid/content/Context;Lcrk;Ljjg;Lf0c;Lk4m;)V

    iput-object v11, v2, Lala;->i:Ljava/lang/Object;

    iput-object v5, v2, Lala;->j:Ljava/lang/Object;

    new-instance v5, Ll4m;

    const/4 v11, 0x0

    invoke-direct {v5, v2, v11}, Ll4m;-><init>(Lala;B)V

    invoke-virtual {v8, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v5, Lm4m;

    invoke-direct {v5, v2, v11}, Lm4m;-><init>(Lala;B)V

    invoke-virtual {v8, v5}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    new-instance v5, Ll4m;

    invoke-direct {v5, v2, v4}, Ll4m;-><init>(Lala;B)V

    invoke-virtual {v9, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v5, Lm4m;

    invoke-direct {v5, v2, v4}, Lm4m;-><init>(Lala;B)V

    invoke-virtual {v9, v5}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    new-instance v5, Ll4m;

    const/4 v8, 0x2

    invoke-direct {v5, v2, v8}, Ll4m;-><init>(Lala;B)V

    invoke-virtual {v6, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v5, Ll4m;

    const/4 v6, 0x3

    invoke-direct {v5, v2, v6}, Ll4m;-><init>(Lala;B)V

    invoke-virtual {v7, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v5, Li4m;

    invoke-direct {v5, v2, v4}, Li4m;-><init>(Lala;B)V

    iget-object v1, v1, Lr4m;->i:Lode;

    invoke-virtual {v1, v3, v5}, Lekc;->j(Lndc;Lf7f;)V

    new-instance v1, Li4m;

    const/4 v11, 0x0

    invoke-direct {v1, v2, v11}, Li4m;-><init>(Lala;B)V

    invoke-virtual {v13, v3, v1}, Lekc;->j(Lndc;Lf7f;)V

    new-instance v1, Lsvk;

    const/16 v3, 0xb

    invoke-direct {v1, v2, v3}, Lsvk;-><init>(Ljava/lang/Object;B)V

    invoke-static {v10}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v3

    if-eqz v3, :cond_194

    invoke-static {v3, v10, v1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_194
    iget-object v1, v2, Lala;->d:Ljava/lang/Object;

    check-cast v1, Lpde;

    iput-object v1, v0, Lw6j;->c:Ljava/lang/Object;

    return-void

    :cond_19b
    invoke-virtual {v11}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 v0, 0x0

    throw v0
.end method

.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lzwk;)V
    .registers 5

    .line 440
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 441
    iput-object p1, p0, Lw6j;->a:Ljava/lang/Object;

    .line 442
    iput-object p2, p0, Lw6j;->b:Ljava/lang/Object;

    .line 443
    new-instance p1, Ldnj;

    const/4 p2, 0x4

    invoke-direct {p1, p0, p2}, Ldnj;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lw6j;->c:Ljava/lang/Object;

    .line 444
    new-instance p1, Lv9j;

    invoke-direct {p1, p0}, Lv9j;-><init>(Lu9j;)V

    iput-object p1, p0, Lw6j;->d:Ljava/lang/Object;

    .line 445
    const-string p1, "speed_dial.shape"

    .line 446
    const-string p2, "speed_dial.plus_button"

    const-string v0, "speed_dial.enabled"

    const-string v1, "speed_dial.large_icons"

    filled-new-array {v0, v1, p1, p2}, [Ljava/lang/String;

    move-result-object p1

    .line 447
    invoke-static {p1}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p1

    .line 448
    iput-object p1, p0, Lw6j;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ld7l;Lrc6;)V
    .registers 3

    .line 515
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lw6j;->e:Ljava/lang/Object;

    .line 516
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Lw6j;->b:Ljava/lang/Object;

    .line 517
    iput-object p2, p0, Lw6j;->a:Ljava/lang/Object;

    .line 518
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Lw6j;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ld7l;Lw6j;)V
    .registers 6

    .line 519
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lw6j;->e:Ljava/lang/Object;

    .line 520
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Lw6j;->b:Ljava/lang/Object;

    .line 521
    iget-object p1, p2, Lw6j;->a:Ljava/lang/Object;

    check-cast p1, Lrc6;

    iput-object p1, p0, Lw6j;->a:Ljava/lang/Object;

    .line 522
    iget-object p1, p2, Lw6j;->c:Ljava/lang/Object;

    check-cast p1, Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/util/SparseArray;->clone()Landroid/util/SparseArray;

    move-result-object p1

    iput-object p1, p0, Lw6j;->c:Ljava/lang/Object;

    const/4 p1, 0x0

    .line 523
    :goto_1d
    iget-object v0, p2, Lw6j;->b:Ljava/lang/Object;

    check-cast v0, Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    if-ge p1, v0, :cond_4b

    .line 524
    iget-object v0, p2, Lw6j;->b:Ljava/lang/Object;

    check-cast v0, Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v0

    .line 525
    iget-object v1, p2, Lw6j;->b:Ljava/lang/Object;

    check-cast v1, Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lknf;

    if-eqz v1, :cond_48

    .line 526
    invoke-interface {v1}, Lknf;->getState()Landroid/os/Parcelable;

    move-result-object v1

    if-eqz v1, :cond_48

    .line 527
    iget-object v2, p0, Lw6j;->c:Ljava/lang/Object;

    check-cast v2, Landroid/util/SparseArray;

    invoke-virtual {v2, v0, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_48
    add-int/lit8 p1, p1, 0x1

    goto :goto_1d

    :cond_4b
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 6

    .line 430
    iput-object p1, p0, Lw6j;->a:Ljava/lang/Object;

    iput-object p2, p0, Lw6j;->b:Ljava/lang/Object;

    iput-object p3, p0, Lw6j;->c:Ljava/lang/Object;

    iput-object p4, p0, Lw6j;->d:Ljava/lang/Object;

    iput-object p5, p0, Lw6j;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lw06;Lltm;Ljava/util/ArrayList;Loam;)V
    .registers 8

    .line 431
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ltmo;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Ltmo;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lw6j;->a:Ljava/lang/Object;

    const/4 p1, 0x0

    .line 432
    invoke-static {v0, p1}, Li7c;->b(Li7c;Ljava/lang/Runnable;)V

    .line 433
    iput-object p3, p0, Lw6j;->b:Ljava/lang/Object;

    iput-object p4, p0, Lw6j;->d:Ljava/lang/Object;

    iput-object p5, p0, Lw6j;->c:Ljava/lang/Object;

    iput-object p2, p0, Lw6j;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljg8;Ldj9;Landroid/content/Context;)V
    .registers 4

    .line 434
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 435
    iput-object p3, p0, Lw6j;->a:Ljava/lang/Object;

    .line 436
    iput-object p2, p0, Lw6j;->b:Ljava/lang/Object;

    .line 437
    iput-object p1, p0, Lw6j;->c:Ljava/lang/Object;

    .line 438
    new-instance p1, Lcon;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lcon;-><init>(Lw6j;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lw6j;->d:Ljava/lang/Object;

    .line 439
    new-instance p1, Lcon;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lcon;-><init>(Lw6j;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lw6j;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lnx5;Lt3e;)V
    .registers 3

    .line 461
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 462
    iput-object p1, p0, Lw6j;->a:Ljava/lang/Object;

    .line 463
    iput-object p2, p0, Lw6j;->b:Ljava/lang/Object;

    const/4 p1, 0x0

    .line 464
    invoke-static {p1}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object p1

    iput-object p1, p0, Lw6j;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ls15;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V
    .registers 5

    .line 466
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 467
    iput-object p1, p0, Lw6j;->a:Ljava/lang/Object;

    .line 468
    iput-object p2, p0, Lw6j;->b:Ljava/lang/Object;

    .line 469
    iput-object p3, p0, Lw6j;->c:Ljava/lang/Object;

    .line 470
    iput-object p4, p0, Lw6j;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ltxi;Losf;Lx5f;)V
    .registers 5

    .line 528
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 529
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lw6j;->a:Ljava/lang/Object;

    .line 530
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lw6j;->b:Ljava/lang/Object;

    .line 531
    iput-object p1, p0, Lw6j;->d:Ljava/lang/Object;

    .line 532
    new-instance p1, Lole;

    invoke-direct {p1, p2}, Lole;-><init>(Ljava/lang/Object;)V

    .line 533
    iput-object p1, p0, Lw6j;->c:Ljava/lang/Object;

    .line 534
    iput-object p3, p0, Lw6j;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ltxi;Lx5f;Losf;)V
    .registers 4

    .line 508
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 509
    iput-object p1, p0, Lw6j;->a:Ljava/lang/Object;

    .line 510
    iput-object p2, p0, Lw6j;->b:Ljava/lang/Object;

    .line 511
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Lw6j;->c:Ljava/lang/Object;

    .line 512
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Lw6j;->d:Ljava/lang/Object;

    .line 513
    new-instance p1, Lole;

    invoke-direct {p1, p3}, Lole;-><init>(Ljava/lang/Object;)V

    .line 514
    iput-object p1, p0, Lw6j;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lu7m;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/util/HashMap;)V
    .registers 7

    .line 480
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 481
    iput-object p1, p0, Lw6j;->a:Ljava/lang/Object;

    .line 482
    iput-object p3, p0, Lw6j;->d:Ljava/lang/Object;

    .line 483
    iput-object p4, p0, Lw6j;->e:Ljava/lang/Object;

    .line 484
    invoke-static {p2}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p2

    iput-object p2, p0, Lw6j;->c:Ljava/lang/Object;

    .line 485
    new-instance p2, Ljava/util/TreeSet;

    invoke-direct {p2}, Ljava/util/TreeSet;-><init>()V

    const/4 p3, 0x0

    .line 486
    invoke-virtual {p1, p2, p3}, Lu7m;->d(Ljava/util/TreeSet;Z)V

    .line 487
    invoke-virtual {p2}, Ljava/util/TreeSet;->size()I

    move-result p1

    new-array p1, p1, [J

    .line 488
    invoke-virtual {p2}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_22
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    if-eqz p4, :cond_38

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/Long;

    invoke-virtual {p4}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    add-int/lit8 p4, p3, 0x1

    .line 489
    aput-wide v0, p1, p3

    move p3, p4

    goto :goto_22

    .line 490
    :cond_38
    iput-object p1, p0, Lw6j;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Luuj;Landroid/widget/ProgressBar;Lcom/opera/ad/interstitial/AdActivity;Lobn;Lg94;)V
    .registers 6

    .line 465
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lw6j;->e:Ljava/lang/Object;

    iput-object p2, p0, Lw6j;->a:Ljava/lang/Object;

    iput-object p3, p0, Lw6j;->b:Ljava/lang/Object;

    iput-object p4, p0, Lw6j;->c:Ljava/lang/Object;

    iput-object p5, p0, Lw6j;->d:Ljava/lang/Object;

    return-void
.end method

.method public static d(I)Lgr0;
    .registers 2

    const/4 v0, 0x1

    if-eq p0, v0, :cond_2e

    const/4 v0, 0x2

    if-eq p0, v0, :cond_2b

    const/4 v0, 0x3

    if-eq p0, v0, :cond_28

    const/4 v0, 0x4

    if-eq p0, v0, :cond_25

    const/4 v0, 0x5

    if-eq p0, v0, :cond_22

    const/16 v0, 0x9

    if-eq p0, v0, :cond_1f

    const/16 v0, 0xa

    if-ne p0, v0, :cond_1a

    sget-object p0, Lgr0;->j:Lgr0;

    return-object p0

    :cond_1a
    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return-object p0

    :cond_1f
    sget-object p0, Lgr0;->i:Lgr0;

    return-object p0

    :cond_22
    sget-object p0, Lgr0;->e:Lgr0;

    return-object p0

    :cond_25
    sget-object p0, Lgr0;->f:Lgr0;

    return-object p0

    :cond_28
    sget-object p0, Lgr0;->d:Lgr0;

    return-object p0

    :cond_2b
    sget-object p0, Lgr0;->b:Lgr0;

    return-object p0

    :cond_2e
    sget-object p0, Lgr0;->c:Lgr0;

    return-object p0
.end method

.method public static s(I)Lgr0;
    .registers 3

    packed-switch p0, :pswitch_data_2c

    :pswitch_3
    const-string v0, "Cannot convert SuggestedSiteType "

    const-string v1, " into AggroSuggestedSiteItemType"

    invoke-static {p0, v0, v1}, Lp3p;->i(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :pswitch_10
    sget-object p0, Lgr0;->j:Lgr0;

    return-object p0

    :pswitch_13
    sget-object p0, Lgr0;->i:Lgr0;

    return-object p0

    :pswitch_16
    sget-object p0, Lgr0;->h:Lgr0;

    return-object p0

    :pswitch_19
    sget-object p0, Lgr0;->g:Lgr0;

    return-object p0

    :pswitch_1c
    sget-object p0, Lgr0;->e:Lgr0;

    return-object p0

    :pswitch_1f
    sget-object p0, Lgr0;->f:Lgr0;

    return-object p0

    :pswitch_22
    sget-object p0, Lgr0;->d:Lgr0;

    return-object p0

    :pswitch_25
    sget-object p0, Lgr0;->b:Lgr0;

    return-object p0

    :pswitch_28
    sget-object p0, Lgr0;->c:Lgr0;

    return-object p0

    nop

    :pswitch_data_2c
    .packed-switch 0x1
        :pswitch_28
        :pswitch_25
        :pswitch_22
        :pswitch_1f
        :pswitch_1c
        :pswitch_3
        :pswitch_19
        :pswitch_16
        :pswitch_13
        :pswitch_10
    .end packed-switch
.end method


# virtual methods
.method public final a()V
    .registers 9

    iget-object v0, p0, Lw6j;->a:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Landroid/widget/ProgressBar;

    const/16 v0, 0x64

    invoke-virtual {v3, v0}, Landroid/widget/ProgressBar;->setProgress(I)V

    iget-object v0, p0, Lw6j;->b:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Lcom/opera/ad/interstitial/AdActivity;

    iget-object v0, p0, Lw6j;->c:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Lobn;

    iget-object v0, p0, Lw6j;->d:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Lg94;

    new-instance v1, Li61;

    const/16 v7, 0x8

    move-object v2, p0

    invoke-direct/range {v1 .. v7}, Li61;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    const-wide/16 v4, 0xc8

    invoke-virtual {v3, v1, v4, v5}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public final a(I)V
    .registers 2

    .line 39
    iget-object p0, p0, Lw6j;->a:Ljava/lang/Object;

    check-cast p0, Landroid/widget/ProgressBar;

    rsub-int/lit8 p1, p1, 0x3

    mul-int/lit8 p1, p1, 0x64

    div-int/lit8 p1, p1, 0x3

    invoke-virtual {p0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    return-void
.end method

.method public final b()V
    .registers 5

    iget-object v0, p0, Lw6j;->e:Ljava/lang/Object;

    check-cast v0, Lmni;

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lw6j;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_10
    if-ge v2, v1, :cond_1e

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lnya;

    invoke-static {v3}, Loya;->a(Lnya;)V

    goto :goto_10

    :cond_1e
    iget-object v0, p0, Lw6j;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/api/Callback;

    if-nez v0, :cond_25

    return-void

    :cond_25
    iget-object v1, p0, Lw6j;->d:Ljava/lang/Object;

    check-cast v1, Landroid/util/SparseBooleanArray;

    invoke-interface {v0, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lw6j;->b:Ljava/lang/Object;

    return-void
.end method

.method public final c(Lv1e;)V
    .registers 10

    iget-object v0, p0, Lw6j;->d:Ljava/lang/Object;

    check-cast v0, Ld3k;

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    invoke-virtual {v0, v1}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_a
    iput-object v1, p0, Lw6j;->e:Ljava/lang/Object;

    iget-object v0, p0, Lw6j;->c:Ljava/lang/Object;

    check-cast v0, Lnak;

    new-instance v2, Lkek;

    iget-object v3, p1, Lv1e;->h:Ljava/util/List;

    sget v4, Ldek;->b:I

    check-cast v3, Ljava/lang/Iterable;

    instance-of v4, v3, Ljava/util/Collection;

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v4, :cond_27

    move-object v4, v3

    check-cast v4, Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3e

    :cond_27
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ln01;

    iget-object v4, v4, Ln01;->a:Ll01;

    sget-object v7, Ll01;->e:Ll01;

    if-eq v4, v7, :cond_2b

    move v6, v5

    :cond_3e
    invoke-direct {v2, v6}, Lkek;-><init>(Z)V

    invoke-virtual {v0, v1, v2}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    iget-object v0, p0, Lw6j;->a:Ljava/lang/Object;

    check-cast v0, Lnx5;

    new-instance v2, Lcek;

    invoke-direct {v2, p0, p1, v1, v5}, Lcek;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 p1, 0x3

    invoke-static {v0, v1, v1, v2, p1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object p1

    iput-object p1, p0, Lw6j;->d:Ljava/lang/Object;

    return-void
.end method

.method public final e(Lac4;Ljava/util/Map;Ljava/util/Map;)Lsa4;
    .registers 12

    new-instance v0, Lsa4;

    iget-object v1, p0, Lw6j;->a:Ljava/lang/Object;

    move-object v2, v1

    check-cast v2, Lhnl;

    iget-object v1, p0, Lw6j;->b:Ljava/lang/Object;

    check-cast v1, Lfd4;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v3, p0, Lw6j;->c:Ljava/lang/Object;

    move-object v5, v3

    check-cast v5, Lxfk;

    iget-object v3, p0, Lw6j;->e:Ljava/lang/Object;

    move-object v6, v3

    check-cast v6, Lsgk;

    iget-object p0, p0, Lw6j;->d:Ljava/lang/Object;

    check-cast p0, Lhb4;

    iget-object v3, p0, Lhb4;->b:Lsgk;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Lge4;->Oo:Lfe4;

    iget-object p0, p0, Lhb4;->a:Lgb4;

    iget-object v1, v1, Lfd4;->a:Ljava/lang/String;

    check-cast p0, Lfb4;

    invoke-virtual {p0, v1}, Lfb4;->a(Ljava/lang/String;)Lge4;

    move-result-object p0

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Lfe4;->c(Lge4;)Z

    move-result v7

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v7}, Lsa4;-><init>(Lac4;Lhnl;Ljava/util/Map;Ljava/util/Map;Lxfk;Lsgk;Z)V

    return-object v0
.end method

.method public final f(ILook;)V
    .registers 6

    iget-object v0, p0, Lw6j;->a:Ljava/lang/Object;

    check-cast v0, Landroid/util/SparseArray;

    iget-byte v1, p2, Look;->d:B

    const/4 v2, 0x7

    if-eq v1, v2, :cond_26

    const/16 v2, 0x8

    if-eq v1, v2, :cond_26

    const/4 v2, 0x6

    if-eq v1, v2, :cond_26

    const/16 v2, 0xb

    if-eq v1, v2, :cond_26

    iget-object p0, p0, Lw6j;->b:Ljava/lang/Object;

    check-cast p0, Landroid/util/SparseArray;

    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->remove(I)V

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Look;

    if-nez p0, :cond_26

    invoke-virtual {v0, p1, p2}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    :cond_26
    return-void
.end method

.method public final g(Landroid/graphics/Rect;II)Landroid/graphics/Rect;
    .registers 6

    iget-object p0, p0, Lw6j;->a:Ljava/lang/Object;

    check-cast p0, Lzjn;

    invoke-virtual {p0, p1, p2, p3}, Lzjn;->a(Landroid/graphics/Rect;II)F

    move-result v0

    invoke-virtual {p0, p1, p2, p3}, Lzjn;->b(Landroid/graphics/Rect;II)Landroid/graphics/RectF;

    move-result-object p0

    new-instance p1, Landroid/graphics/RectF;

    iget p2, p0, Landroid/graphics/RectF;->left:F

    div-float/2addr p2, v0

    iget p3, p0, Landroid/graphics/RectF;->top:F

    div-float/2addr p3, v0

    iget v1, p0, Landroid/graphics/RectF;->right:F

    div-float/2addr v1, v0

    iget p0, p0, Landroid/graphics/RectF;->bottom:F

    div-float/2addr p0, v0

    invoke-direct {p1, p2, p3, v1, p0}, Landroid/graphics/RectF;-><init>(FFFF)V

    new-instance p0, Landroid/graphics/Rect;

    iget p2, p1, Landroid/graphics/RectF;->left:F

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    iget p3, p1, Landroid/graphics/RectF;->top:F

    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    move-result p3

    iget v0, p1, Landroid/graphics/RectF;->right:F

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-direct {p0, p2, p3, v0, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object p0
.end method

.method public final getCues(J)Ljava/util/List;
    .registers 33

    move-object/from16 v0, p0

    iget-object v1, v0, Lw6j;->a:Ljava/lang/Object;

    move-object v2, v1

    check-cast v2, Lu7m;

    iget-object v1, v0, Lw6j;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/Map;

    iget-object v3, v0, Lw6j;->d:Ljava/lang/Object;

    move-object v8, v3

    check-cast v8, Ljava/util/HashMap;

    iget-object v0, v0, Lw6j;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    iget-object v3, v2, Lu7m;->h:Ljava/lang/String;

    move-wide/from16 v4, p1

    invoke-virtual {v2, v4, v5, v3, v9}, Lu7m;->g(JLjava/lang/String;Ljava/util/ArrayList;)V

    new-instance v7, Ljava/util/TreeMap;

    invoke-direct {v7}, Ljava/util/TreeMap;-><init>()V

    const/4 v5, 0x0

    iget-object v6, v2, Lu7m;->h:Ljava/lang/String;

    move-wide/from16 v3, p1

    invoke-virtual/range {v2 .. v7}, Lu7m;->i(JZLjava/lang/String;Ljava/util/TreeMap;)V

    iget-object v3, v2, Lu7m;->h:Ljava/lang/String;

    move-object v5, v1

    move-object v6, v8

    move-object v8, v7

    move-object v7, v3

    move-wide/from16 v3, p1

    invoke-virtual/range {v2 .. v8}, Lu7m;->h(JLjava/util/Map;Ljava/util/HashMap;Ljava/lang/String;Ljava/util/TreeMap;)V

    move-object v7, v8

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    :cond_44
    :goto_44
    if-ge v4, v2, :cond_a1

    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Landroid/util/Pair;

    iget-object v8, v5, Landroid/util/Pair;->second:Ljava/lang/Object;

    invoke-virtual {v0, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    if-eqz v8, :cond_44

    invoke-static {v8, v3}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v8

    array-length v10, v8

    invoke-static {v8, v3, v10}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v15

    iget-object v5, v5, Landroid/util/Pair;->first:Ljava/lang/Object;

    invoke-virtual {v6, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lw7m;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v8, v5, Lw7m;->b:F

    iget v10, v5, Lw7m;->c:F

    iget v11, v5, Lw7m;->e:I

    iget v12, v5, Lw7m;->f:F

    iget v13, v5, Lw7m;->g:F

    iget v5, v5, Lw7m;->j:I

    move/from16 v18, v11

    new-instance v11, Lx36;

    move/from16 v23, v12

    const/4 v12, 0x0

    move/from16 v24, v13

    const/4 v13, 0x0

    const/16 v17, 0x0

    const/16 v20, 0x0

    const/high16 v21, -0x80000000

    const v22, -0x800001

    const/16 v25, 0x0

    const/high16 v26, -0x1000000

    const/16 v28, 0x0

    const/16 v29, 0x0

    move-object v14, v13

    move/from16 v27, v5

    move/from16 v19, v8

    move/from16 v16, v10

    invoke-direct/range {v11 .. v29}, Lx36;-><init>(Ljava/lang/CharSequence;Landroid/text/Layout$Alignment;Landroid/text/Layout$Alignment;Landroid/graphics/Bitmap;FIIFIIFFFZIIFI)V

    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_44

    :cond_a1
    invoke-virtual {v7}, Ljava/util/TreeMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1cb

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lw7m;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lw36;

    iget-object v5, v2, Lw36;->a:Ljava/lang/CharSequence;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v5, Landroid/text/SpannableStringBuilder;

    invoke-virtual {v5}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v7

    const-class v8, Lf27;

    invoke-virtual {v5, v3, v7, v8}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Lf27;

    array-length v8, v7

    move v9, v3

    :goto_dd
    if-ge v9, v8, :cond_f1

    aget-object v10, v7, v9

    invoke-virtual {v5, v10}, Landroid/text/SpannableStringBuilder;->getSpanStart(Ljava/lang/Object;)I

    move-result v11

    invoke-virtual {v5, v10}, Landroid/text/SpannableStringBuilder;->getSpanEnd(Ljava/lang/Object;)I

    move-result v10

    const-string v12, ""

    invoke-virtual {v5, v11, v10, v12}, Landroid/text/SpannableStringBuilder;->replace(IILjava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    add-int/lit8 v9, v9, 0x1

    goto :goto_dd

    :cond_f1
    move v7, v3

    :goto_f2
    invoke-virtual {v5}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v8

    const/16 v9, 0x20

    if-ge v7, v8, :cond_11c

    invoke-virtual {v5, v7}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v8

    if-ne v8, v9, :cond_119

    add-int/lit8 v8, v7, 0x1

    move v10, v8

    :goto_103
    invoke-virtual {v5}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v11

    if-ge v10, v11, :cond_112

    invoke-virtual {v5, v10}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v11

    if-ne v11, v9, :cond_112

    add-int/lit8 v10, v10, 0x1

    goto :goto_103

    :cond_112
    sub-int/2addr v10, v8

    if-lez v10, :cond_119

    add-int/2addr v10, v7

    invoke-virtual {v5, v7, v10}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    :cond_119
    add-int/lit8 v7, v7, 0x1

    goto :goto_f2

    :cond_11c
    invoke-virtual {v5}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v7

    const/4 v8, 0x1

    if-lez v7, :cond_12c

    invoke-virtual {v5, v3}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v7

    if-ne v7, v9, :cond_12c

    invoke-virtual {v5, v3, v8}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    :cond_12c
    move v7, v3

    :goto_12d
    invoke-virtual {v5}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v10

    sub-int/2addr v10, v8

    const/16 v11, 0xa

    if-ge v7, v10, :cond_14c

    invoke-virtual {v5, v7}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v10

    if-ne v10, v11, :cond_149

    add-int/lit8 v10, v7, 0x1

    invoke-virtual {v5, v10}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v11

    if-ne v11, v9, :cond_149

    add-int/lit8 v11, v7, 0x2

    invoke-virtual {v5, v10, v11}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    :cond_149
    add-int/lit8 v7, v7, 0x1

    goto :goto_12d

    :cond_14c
    invoke-virtual {v5}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v7

    if-lez v7, :cond_169

    invoke-virtual {v5}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v7

    sub-int/2addr v7, v8

    invoke-virtual {v5, v7}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v7

    if-ne v7, v9, :cond_169

    invoke-virtual {v5}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v7

    sub-int/2addr v7, v8

    invoke-virtual {v5}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v10

    invoke-virtual {v5, v7, v10}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    :cond_169
    move v7, v3

    :goto_16a
    invoke-virtual {v5}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v10

    sub-int/2addr v10, v8

    if-ge v7, v10, :cond_185

    invoke-virtual {v5, v7}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v10

    if-ne v10, v9, :cond_182

    add-int/lit8 v10, v7, 0x1

    invoke-virtual {v5, v10}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v12

    if-ne v12, v11, :cond_182

    invoke-virtual {v5, v7, v10}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    :cond_182
    add-int/lit8 v7, v7, 0x1

    goto :goto_16a

    :cond_185
    invoke-virtual {v5}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v7

    if-lez v7, :cond_1a2

    invoke-virtual {v5}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v7

    sub-int/2addr v7, v8

    invoke-virtual {v5, v7}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v7

    if-ne v7, v11, :cond_1a2

    invoke-virtual {v5}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v7

    sub-int/2addr v7, v8

    invoke-virtual {v5}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v8

    invoke-virtual {v5, v7, v8}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    :cond_1a2
    iget v5, v4, Lw7m;->c:F

    iget v7, v4, Lw7m;->d:I

    iput v5, v2, Lw36;->e:F

    iput v7, v2, Lw36;->f:I

    iget v5, v4, Lw7m;->e:I

    iput v5, v2, Lw36;->g:I

    iget v5, v4, Lw7m;->b:F

    iput v5, v2, Lw36;->h:F

    iget v5, v4, Lw7m;->f:F

    iput v5, v2, Lw36;->l:F

    iget v5, v4, Lw7m;->i:F

    iget v7, v4, Lw7m;->h:I

    iput v5, v2, Lw36;->k:F

    iput v7, v2, Lw36;->j:I

    iget v4, v4, Lw7m;->j:I

    iput v4, v2, Lw36;->p:I

    invoke-virtual {v2}, Lw36;->a()Lx36;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_a9

    :cond_1cb
    return-object v1
.end method

.method public final getEventTime(I)J
    .registers 2

    iget-object p0, p0, Lw6j;->b:Ljava/lang/Object;

    check-cast p0, [J

    aget-wide p0, p0, p1

    return-wide p0
.end method

.method public final getEventTimeCount()I
    .registers 1

    iget-object p0, p0, Lw6j;->b:Ljava/lang/Object;

    check-cast p0, [J

    array-length p0, p0

    return p0
.end method

.method public final getNextEventTimeIndex(J)I
    .registers 4

    iget-object p0, p0, Lw6j;->b:Ljava/lang/Object;

    check-cast p0, [J

    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Ltym;->b([JJZ)I

    move-result p1

    array-length p0, p0

    if-ge p1, p0, :cond_d

    return p1

    :cond_d
    const/4 p0, -0x1

    return p0
.end method

.method public final getValue()Ljava/lang/Object;
    .registers 5

    iget-object v0, p0, Lw6j;->e:Ljava/lang/Object;

    check-cast v0, Ll7n;

    if-nez v0, :cond_47

    iget-object v0, p0, Lw6j;->b:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lv7n;

    iget-object v1, p0, Lw6j;->c:Ljava/lang/Object;

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-interface {v1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lr7n;

    iget-object v2, p0, Lw6j;->d:Ljava/lang/Object;

    check-cast v2, Lkotlin/jvm/functions/Function0;

    invoke-interface {v2}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lg06;

    new-instance v3, Lplk;

    invoke-direct {v3, v0, v1, v2}, Lplk;-><init>(Lv7n;Lr7n;Lg06;)V

    iget-object v0, p0, Lw6j;->a:Ljava/lang/Object;

    check-cast v0, Ls15;

    invoke-virtual {v0}, Ls15;->b()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_40

    const-string v2, "androidx.lifecycle.ViewModelProvider.DefaultKey:"

    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v0, v1}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v0

    iput-object v0, p0, Lw6j;->e:Ljava/lang/Object;

    return-object v0

    :cond_40
    const-string p0, "Local and anonymous classes can not be ViewModels"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_47
    return-object v0
.end method

.method public final h()Lknf;
    .registers 3

    iget-object v0, p0, Lw6j;->e:Ljava/lang/Object;

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lwqm;->w(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_12

    const/4 p0, 0x0

    return-object p0

    :cond_12
    iget-object v1, p0, Lw6j;->d:Ljava/lang/Object;

    check-cast v1, Lknf;

    if-eqz v1, :cond_27

    invoke-interface {v1}, Lknf;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_27

    iget-object p0, p0, Lw6j;->d:Ljava/lang/Object;

    check-cast p0, Lknf;

    return-object p0

    :cond_27
    const/high16 v1, -0x80000000

    invoke-virtual {p0, v1, v0}, Lw6j;->i(ILjava/lang/String;)Lknf;

    move-result-object p0

    return-object p0
.end method

.method public final i(ILjava/lang/String;)Lknf;
    .registers 8

    iget-object v0, p0, Lw6j;->e:Ljava/lang/Object;

    check-cast v0, Ld7l;

    iget-object v1, p0, Lw6j;->b:Ljava/lang/Object;

    check-cast v1, Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lknf;

    if-eqz v2, :cond_16

    iget-object p0, v0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->m()Z

    return-object v2

    :cond_16
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    iget-object v2, p0, Lw6j;->a:Ljava/lang/Object;

    check-cast v2, Lrc6;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v3, "operaui"

    invoke-virtual {p2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_3b

    iget-object v2, v2, Lrc6;->a:Ljava/util/HashMap;

    invoke-virtual {p2}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Llnf;

    goto :goto_3c

    :cond_3b
    move-object v2, v4

    :goto_3c
    if-eqz v2, :cond_57

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->m()Z

    move-result v0

    iget-object v3, p0, Lw6j;->c:Ljava/lang/Object;

    check-cast v3, Landroid/util/SparseArray;

    invoke-virtual {v3, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/os/Parcelable;

    if-eqz v4, :cond_53

    invoke-virtual {v3, p1}, Landroid/util/SparseArray;->remove(I)V

    :cond_53
    invoke-interface {v2, p2, v0, v4}, Llnf;->a(Landroid/net/Uri;ZLandroid/os/Parcelable;)Lknf;

    move-result-object v4

    :cond_57
    if-eqz v4, :cond_5c

    invoke-interface {v4, p0}, Lknf;->v(Lw6j;)V

    :cond_5c
    invoke-virtual {v1, p1, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-object v4
.end method

.method public final isInitialized()Z
    .registers 1

    iget-object p0, p0, Lw6j;->e:Ljava/lang/Object;

    check-cast p0, Ll7n;

    if-eqz p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public final j()V
    .registers 1

    invoke-virtual {p0}, Lw6j;->t()V

    return-void
.end method

.method public final k()Z
    .registers 2

    iget-object v0, p0, Lw6j;->e:Ljava/lang/Object;

    check-cast v0, Llkn;

    if-eqz v0, :cond_26

    invoke-virtual {v0}, Llkn;->b()I

    move-result v0

    if-lez v0, :cond_26

    iget-object v0, p0, Lw6j;->e:Ljava/lang/Object;

    check-cast v0, Llkn;

    invoke-virtual {v0}, Llkn;->a()I

    move-result v0

    if-lez v0, :cond_26

    iget-object p0, p0, Lw6j;->e:Ljava/lang/Object;

    check-cast p0, Llkn;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object p0

    invoke-virtual {p0}, Landroid/graphics/Rect;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_26

    const/4 p0, 0x1

    return p0

    :cond_26
    const/4 p0, 0x0

    return p0
.end method

.method public final l(Z)V
    .registers 6

    if-eqz p1, :cond_66

    iget-object p1, p0, Lw6j;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/Context;

    const-string v0, "com.android.vending"

    const-wide/16 v1, 0x0

    invoke-static {p1, v0, v1, v2}, Lr9n;->u(Landroid/content/Context;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;

    move-result-object v0

    iget-object p0, p0, Lw6j;->c:Ljava/lang/Object;

    check-cast p0, Lqfl;

    if-eqz v0, :cond_3d

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "https://play.google.com/store/apps/details?id="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    iget-object p1, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v1}, Lqfl;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_3d
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.APPLICATION_DETAILS_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "package:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string p1, "android.intent.category.DEFAULT"

    invoke-virtual {v0, p1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lqfl;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_66
    iget-object p0, p0, Lw6j;->d:Ljava/lang/Object;

    check-cast p0, Lp7l;

    invoke-virtual {p0}, Lp7l;->invoke()Ljava/lang/Object;

    return-void
.end method

.method public final m(Lkze;)V
    .registers 5

    iget-object v0, p0, Lw6j;->a:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    new-instance v1, Lezg;

    const/4 v2, 0x4

    invoke-direct {v1, p0, v2}, Lezg;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, p1, v1}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    iget-object v0, p0, Lw6j;->b:Ljava/lang/Object;

    check-cast v0, Lzwk;

    new-instance v1, Lvzj;

    invoke-direct {v1, p0}, Lvzj;-><init>(Lw6j;)V

    invoke-static {v0, p1, v1}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    return-void
.end method

.method public final n(ILxk0;)V
    .registers 23

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    iget-object v3, v0, Lw6j;->d:Ljava/lang/Object;

    check-cast v3, Landroid/util/SparseArray;

    iget-object v4, v0, Lw6j;->c:Ljava/lang/Object;

    check-cast v4, Landroid/util/SparseArray;

    invoke-virtual {v4}, Landroid/util/SparseArray;->size()I

    move-result v5

    if-nez v5, :cond_15

    return-void

    :cond_15
    new-instance v6, Lb3g;

    const/4 v7, 0x2

    invoke-direct {v6, v7}, Lb3g;-><init>(I)V

    new-instance v8, Landroid/util/SparseArray;

    invoke-direct {v8, v5}, Landroid/util/SparseArray;-><init>(I)V

    const/4 v10, 0x0

    :goto_21
    const/4 v15, 0x1

    if-ge v10, v5, :cond_63

    invoke-virtual {v4, v10}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v16

    const-wide/16 v17, 0x1

    move-object/from16 v11, v16

    check-cast v11, Look;

    invoke-virtual {v4, v10}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v12

    add-int/2addr v12, v15

    new-instance v15, Lrok;

    iget-byte v13, v11, Look;->d:B

    invoke-static {v13}, Lw6j;->s(I)Lgr0;

    move-result-object v13

    iget v7, v11, Look;->f:I

    iget-byte v9, v11, Look;->d:B

    iget-byte v14, v11, Look;->e:B

    if-eq v9, v14, :cond_48

    invoke-static {v14}, Lw6j;->s(I)Lgr0;

    move-result-object v9

    goto :goto_49

    :cond_48
    const/4 v9, 0x0

    :goto_49
    invoke-direct {v15, v13, v7, v9}, Lrok;-><init>(Lgr0;ILgr0;)V

    invoke-virtual {v8, v12, v15}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    invoke-virtual {v11}, Look;->a()Z

    move-result v7

    if-eqz v7, :cond_60

    const/4 v7, -0x1

    invoke-virtual {v6, v7}, Lb3g;->a(I)La3g;

    move-result-object v7

    iget-wide v11, v7, La3g;->b:J

    add-long v11, v11, v17

    iput-wide v11, v7, La3g;->b:J

    :cond_60
    add-int/lit8 v10, v10, 0x1

    goto :goto_21

    :cond_63
    const-wide/16 v17, 0x1

    iget-object v5, v0, Lw6j;->b:Ljava/lang/Object;

    check-cast v5, Lx5f;

    add-int/lit8 v7, v1, 0x1

    iget-boolean v9, v5, Lx5f;->h:Z

    if-nez v9, :cond_73

    move-object v15, v6

    :goto_70
    const/4 v7, -0x1

    goto/16 :goto_131

    :cond_73
    iget-object v9, v5, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v10

    new-instance v11, Lvk0;

    const/4 v12, 0x4

    const/16 v13, 0x98b

    const/4 v14, -0x1

    invoke-direct {v11, v13, v14, v12}, Ljf0;-><init>(III)V

    invoke-virtual {v10, v9}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v9

    const/16 v12, 0x13

    invoke-virtual {v9, v12}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/List;

    if-eqz v14, :cond_9c

    invoke-interface {v14}, Ljava/util/List;->isEmpty()Z

    move-result v19

    if-nez v19, :cond_9c

    new-instance v13, Lhf0;

    invoke-direct {v13, v9, v12, v14}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_a6

    :cond_9c
    invoke-static {v9, v12, v15}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v13

    new-instance v14, Lhf0;

    invoke-direct {v14, v9, v12, v13}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    move-object v13, v14

    :goto_a6
    invoke-virtual {v13, v11}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    const/4 v9, 0x0

    invoke-virtual {v11, v9, v15, v12, v13}, Ljf0;->p(IIJ)V

    invoke-virtual {v11, v15, v15, v2}, Ljf0;->q(IILjava/lang/Object;)V

    if-lez v7, :cond_c4

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_bf

    const/4 v9, 0x0

    :goto_bd
    const/4 v12, 0x2

    goto :goto_c1

    :cond_bf
    move v9, v15

    goto :goto_bd

    :goto_c1
    invoke-virtual {v11, v12, v9, v7}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_c4
    invoke-virtual {v8}, Landroid/util/SparseArray;->size()I

    move-result v7

    const/4 v9, 0x0

    :goto_c9
    if-ge v9, v7, :cond_12b

    invoke-virtual {v8, v9}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lrok;

    new-instance v13, Lwk0;

    const/4 v14, 0x3

    move/from16 v19, v7

    const/4 v7, -0x1

    const/16 v15, 0x98b

    invoke-direct {v13, v15, v7, v14}, Ljf0;-><init>(III)V

    iget-object v7, v12, Lrok;->a:Lgr0;

    const/4 v14, 0x1

    const/4 v15, 0x0

    invoke-virtual {v13, v15, v14, v7}, Ljf0;->q(IILjava/lang/Object;)V

    iget v7, v12, Lrok;->b:I

    move-object v15, v6

    int-to-long v6, v7

    invoke-virtual {v13, v14, v14, v6, v7}, Ljf0;->p(IIJ)V

    iget-object v6, v12, Lrok;->c:Lgr0;

    if-nez v6, :cond_f1

    const/4 v7, 0x0

    :goto_ef
    const/4 v12, 0x2

    goto :goto_f3

    :cond_f1
    const/4 v7, 0x1

    goto :goto_ef

    :goto_f3
    invoke-virtual {v13, v12, v7, v6}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 v6, 0x3

    invoke-virtual {v11, v6}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map;

    if-eqz v7, :cond_10c

    invoke-interface {v7}, Ljava/util/Map;->isEmpty()Z

    move-result v14

    if-nez v14, :cond_10c

    new-instance v14, Lif0;

    invoke-direct {v14, v11, v6, v7}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    move-object v12, v14

    goto :goto_11a

    :cond_10c
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    const/4 v14, 0x1

    invoke-virtual {v11, v6, v14, v7}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v12, Lif0;

    invoke-direct {v12, v11, v6, v7}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_11a
    invoke-virtual {v8, v9}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v12, v6, v13}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v9, v9, 0x1

    move-object v6, v15

    move/from16 v7, v19

    goto :goto_c9

    :cond_12b
    move-object v15, v6

    invoke-virtual {v5, v10}, Lx5f;->U0(Lx56;)V

    goto/16 :goto_70

    :goto_131
    if-eq v1, v7, :cond_13f

    sget-object v5, Lxk0;->c:Lxk0;

    if-ne v2, v5, :cond_13f

    invoke-virtual {v4, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v13, v1

    check-cast v13, Look;

    goto :goto_140

    :cond_13f
    const/4 v13, 0x0

    :goto_140
    if-eqz v13, :cond_153

    invoke-virtual {v13}, Look;->a()Z

    move-result v1

    if-eqz v1, :cond_153

    const/4 v7, -0x1

    invoke-virtual {v15, v7}, Lb3g;->a(I)La3g;

    move-result-object v1

    iget-wide v5, v1, La3g;->c:J

    add-long v5, v5, v17

    iput-wide v5, v1, La3g;->c:J

    :cond_153
    iget-object v1, v0, Lw6j;->e:Ljava/lang/Object;

    check-cast v1, Lole;

    invoke-virtual {v1, v15}, Lole;->C(Lb3g;)V

    iget-object v0, v0, Lw6j;->a:Ljava/lang/Object;

    check-cast v0, Ltxi;

    new-instance v1, Ljava/util/HashSet;

    invoke-virtual {v4}, Landroid/util/SparseArray;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(I)V

    invoke-virtual {v4}, Landroid/util/SparseArray;->size()I

    move-result v2

    const/4 v9, 0x0

    :goto_16c
    if-ge v9, v2, :cond_178

    invoke-virtual {v4, v9}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    add-int/lit8 v9, v9, 0x1

    goto :goto_16c

    :cond_178
    new-instance v2, Ljava/util/HashSet;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v5

    invoke-direct {v2, v5}, Ljava/util/HashSet;-><init>(I)V

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v5

    const/4 v9, 0x0

    :goto_186
    if-ge v9, v5, :cond_192

    invoke-virtual {v3, v9}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    add-int/lit8 v9, v9, 0x1

    goto :goto_186

    :cond_192
    iget-object v0, v0, Ltxi;->b:Ljava/lang/Object;

    check-cast v0, Ld0k;

    if-eqz v13, :cond_19b

    const/4 v15, 0x0

    iput-boolean v15, v0, Ld0k;->n:Z

    :cond_19b
    iget-object v0, v0, Ld0k;->b:Lipk;

    invoke-virtual {v0, v1, v2, v13}, Lipk;->X(Ljava/util/HashSet;Ljava/util/HashSet;Look;)V

    invoke-virtual {v4}, Landroid/util/SparseArray;->clear()V

    invoke-virtual {v3}, Landroid/util/SparseArray;->clear()V

    return-void
.end method

.method public final o(ILhr0;)V
    .registers 23

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    iget-object v3, v0, Lw6j;->a:Ljava/lang/Object;

    check-cast v3, Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v4

    if-nez v4, :cond_11

    return-void

    :cond_11
    new-instance v5, Lb3g;

    const/4 v6, 0x1

    invoke-direct {v5, v6}, Lb3g;-><init>(I)V

    new-instance v7, Landroid/util/SparseArray;

    invoke-direct {v7, v4}, Landroid/util/SparseArray;-><init>(I)V

    const/4 v9, 0x0

    :goto_1d
    const/4 v13, -0x1

    if-ge v9, v4, :cond_5d

    invoke-virtual {v3, v9}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Look;

    invoke-virtual {v3, v9}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v15

    add-int/2addr v15, v6

    const-wide/16 v16, 0x1

    new-instance v10, Lrok;

    iget-byte v11, v14, Look;->d:B

    invoke-static {v11}, Lw6j;->d(I)Lgr0;

    move-result-object v11

    iget v12, v14, Look;->f:I

    iget-byte v8, v14, Look;->d:B

    iget-byte v6, v14, Look;->e:B

    if-eq v8, v6, :cond_42

    invoke-static {v6}, Lw6j;->d(I)Lgr0;

    move-result-object v6

    goto :goto_43

    :cond_42
    const/4 v6, 0x0

    :goto_43
    invoke-direct {v10, v11, v12, v6}, Lrok;-><init>(Lgr0;ILgr0;)V

    invoke-virtual {v7, v15, v10}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    invoke-virtual {v14}, Look;->a()Z

    move-result v6

    if-eqz v6, :cond_59

    invoke-virtual {v5, v13}, Lb3g;->a(I)La3g;

    move-result-object v6

    iget-wide v10, v6, La3g;->b:J

    add-long v10, v10, v16

    iput-wide v10, v6, La3g;->b:J

    :cond_59
    add-int/lit8 v9, v9, 0x1

    const/4 v6, 0x1

    goto :goto_1d

    :cond_5d
    const-wide/16 v16, 0x1

    iget-object v4, v0, Lw6j;->e:Ljava/lang/Object;

    check-cast v4, Lx5f;

    add-int/lit8 v6, v1, 0x1

    iget-boolean v8, v4, Lx5f;->h:Z

    if-nez v8, :cond_6f

    move-object/from16 v18, v5

    move v4, v13

    const/4 v13, 0x0

    goto/16 :goto_12f

    :cond_6f
    iget-object v8, v4, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v9

    new-instance v10, Lsq0;

    const/4 v11, 0x4

    const/16 v12, 0x98b

    invoke-direct {v10, v12, v13, v11}, Ljf0;-><init>(III)V

    invoke-virtual {v9, v8}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v8

    const/16 v11, 0x12

    invoke-virtual {v8, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/List;

    if-eqz v14, :cond_98

    invoke-interface {v14}, Ljava/util/List;->isEmpty()Z

    move-result v15

    if-nez v15, :cond_98

    new-instance v15, Lhf0;

    invoke-direct {v15, v8, v11, v14}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    const/4 v14, 0x1

    goto :goto_a3

    :cond_98
    const/4 v14, 0x1

    invoke-static {v8, v11, v14}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v15

    new-instance v12, Lhf0;

    invoke-direct {v12, v8, v11, v15}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    move-object v15, v12

    :goto_a3
    invoke-virtual {v15, v10}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    const/4 v8, 0x0

    invoke-virtual {v10, v8, v14, v11, v12}, Ljf0;->p(IIJ)V

    invoke-virtual {v10, v14, v14, v2}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 v8, 0x2

    if-lez v6, :cond_c0

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_bc

    const/4 v11, 0x0

    goto :goto_bd

    :cond_bc
    const/4 v11, 0x1

    :goto_bd
    invoke-virtual {v10, v8, v11, v6}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_c0
    invoke-virtual {v7}, Landroid/util/SparseArray;->size()I

    move-result v6

    const/4 v11, 0x0

    :goto_c5
    if-ge v11, v6, :cond_128

    invoke-virtual {v7, v11}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lrok;

    new-instance v14, Lfr0;

    const/4 v15, 0x3

    const/16 v8, 0x98b

    invoke-direct {v14, v8, v13, v15}, Ljf0;-><init>(III)V

    iget-object v8, v12, Lrok;->a:Lgr0;

    const/4 v13, 0x0

    const/4 v15, 0x1

    invoke-virtual {v14, v13, v15, v8}, Ljf0;->q(IILjava/lang/Object;)V

    iget v8, v12, Lrok;->b:I

    move-object/from16 v18, v5

    move/from16 v19, v6

    int-to-long v5, v8

    invoke-virtual {v14, v15, v15, v5, v6}, Ljf0;->p(IIJ)V

    iget-object v5, v12, Lrok;->c:Lgr0;

    if-nez v5, :cond_ed

    move v6, v13

    :goto_eb
    const/4 v8, 0x2

    goto :goto_ef

    :cond_ed
    const/4 v6, 0x1

    goto :goto_eb

    :goto_ef
    invoke-virtual {v14, v8, v6, v5}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 v5, 0x3

    invoke-virtual {v10, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map;

    if-eqz v6, :cond_107

    invoke-interface {v6}, Ljava/util/Map;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_107

    new-instance v12, Lif0;

    invoke-direct {v12, v10, v5, v6}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_115

    :cond_107
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    const/4 v15, 0x1

    invoke-virtual {v10, v5, v15, v6}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v12, Lif0;

    invoke-direct {v12, v10, v5, v6}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_115
    invoke-virtual {v7, v11}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v12, v5, v14}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v11, v11, 0x1

    move-object/from16 v5, v18

    move/from16 v6, v19

    const/4 v13, -0x1

    goto :goto_c5

    :cond_128
    move-object/from16 v18, v5

    const/4 v13, 0x0

    invoke-virtual {v4, v9}, Lx5f;->U0(Lx56;)V

    const/4 v4, -0x1

    :goto_12f
    if-eq v1, v4, :cond_138

    invoke-virtual {v3, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Look;

    goto :goto_139

    :cond_138
    const/4 v1, 0x0

    :goto_139
    sget-object v5, Lhr0;->c:Lhr0;

    if-eqz v1, :cond_170

    invoke-virtual {v1}, Look;->a()Z

    move-result v6

    if-eqz v6, :cond_170

    move-object/from16 v6, v18

    if-ne v2, v5, :cond_152

    invoke-virtual {v6, v4}, Lb3g;->a(I)La3g;

    move-result-object v4

    iget-wide v7, v4, La3g;->c:J

    add-long v7, v7, v16

    iput-wide v7, v4, La3g;->c:J

    goto :goto_172

    :cond_152
    sget-object v7, Lhr0;->d:Lhr0;

    if-ne v2, v7, :cond_161

    invoke-virtual {v6, v4}, Lb3g;->a(I)La3g;

    move-result-object v4

    iget-wide v7, v4, La3g;->d:J

    add-long v7, v7, v16

    iput-wide v7, v4, La3g;->d:J

    goto :goto_172

    :cond_161
    sget-object v7, Lhr0;->e:Lhr0;

    if-ne v2, v7, :cond_172

    invoke-virtual {v6, v4}, Lb3g;->a(I)La3g;

    move-result-object v4

    iget-wide v7, v4, La3g;->e:J

    add-long v7, v7, v16

    iput-wide v7, v4, La3g;->e:J

    goto :goto_172

    :cond_170
    move-object/from16 v6, v18

    :cond_172
    :goto_172
    iget-object v4, v0, Lw6j;->c:Ljava/lang/Object;

    check-cast v4, Lole;

    invoke-virtual {v4, v6}, Lole;->C(Lb3g;)V

    iget-object v4, v0, Lw6j;->d:Ljava/lang/Object;

    check-cast v4, Ltxi;

    new-instance v6, Ljava/util/HashSet;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v7

    invoke-direct {v6, v7}, Ljava/util/HashSet;-><init>(I)V

    move v8, v13

    :goto_187
    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v7

    if-ge v8, v7, :cond_199

    invoke-virtual {v3, v8}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Look;

    invoke-virtual {v6, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    add-int/lit8 v8, v8, 0x1

    goto :goto_187

    :cond_199
    iget-object v0, v0, Lw6j;->b:Ljava/lang/Object;

    check-cast v0, Landroid/util/SparseArray;

    new-instance v3, Ljava/util/HashSet;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v7

    invoke-direct {v3, v7}, Ljava/util/HashSet;-><init>(I)V

    move v8, v13

    :goto_1a7
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v7

    if-ge v8, v7, :cond_1b9

    invoke-virtual {v0, v8}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Look;

    invoke-virtual {v3, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    add-int/lit8 v8, v8, 0x1

    goto :goto_1a7

    :cond_1b9
    if-ne v2, v5, :cond_1bd

    move-object v12, v1

    goto :goto_1be

    :cond_1bd
    const/4 v12, 0x0

    :goto_1be
    iget-object v0, v4, Ltxi;->b:Ljava/lang/Object;

    check-cast v0, Lkok;

    iget-object v0, v0, Lkok;->f:Lipk;

    invoke-virtual {v0, v6, v3, v12}, Lipk;->X(Ljava/util/HashSet;Ljava/util/HashSet;Look;)V

    return-void
.end method

.method public final p()V
    .registers 2

    iget-object v0, p0, Lw6j;->a:Ljava/lang/Object;

    check-cast v0, Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    iget-object p0, p0, Lw6j;->b:Ljava/lang/Object;

    check-cast p0, Landroid/util/SparseArray;

    invoke-virtual {p0}, Landroid/util/SparseArray;->clear()V

    return-void
.end method

.method public final q()V
    .registers 6

    iget-object v0, p0, Lw6j;->e:Ljava/lang/Object;

    check-cast v0, Lu8g;

    if-nez v0, :cond_7

    return-void

    :cond_7
    iget-object v1, p0, Lw6j;->d:Ljava/lang/Object;

    check-cast v1, Ld3k;

    const/4 v2, 0x0

    if-eqz v1, :cond_11

    invoke-virtual {v1, v2}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_11
    iget-object v1, p0, Lw6j;->c:Ljava/lang/Object;

    check-cast v1, Lnak;

    new-instance v3, Lkek;

    const/4 v4, 0x1

    invoke-direct {v3, v4}, Lkek;-><init>(Z)V

    invoke-virtual {v1, v2, v3}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    iget-object v1, p0, Lw6j;->a:Ljava/lang/Object;

    check-cast v1, Lnx5;

    new-instance v3, Lr8h;

    const/16 v4, 0x17

    invoke-direct {v3, p0, v0, v2, v4}, Lr8h;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 v0, 0x3

    invoke-static {v1, v2, v2, v3, v0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object v0

    iput-object v0, p0, Lw6j;->d:Ljava/lang/Object;

    return-void
.end method

.method public final r(FF)V
    .registers 10

    iget-object v0, p0, Lw6j;->a:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lzjn;

    iget-object v2, p0, Lw6j;->e:Ljava/lang/Object;

    check-cast v2, Llkn;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    iget-object v3, p0, Lw6j;->e:Ljava/lang/Object;

    check-cast v3, Llkn;

    invoke-virtual {v3}, Llkn;->b()I

    move-result v3

    iget-object v4, p0, Lw6j;->e:Ljava/lang/Object;

    check-cast v4, Llkn;

    invoke-virtual {v4}, Llkn;->a()I

    move-result v4

    move v5, p1

    move v6, p2

    invoke-virtual/range {v1 .. v6}, Lzjn;->c(Landroid/graphics/Rect;IIFF)V

    iget-object p1, p0, Lw6j;->e:Ljava/lang/Object;

    check-cast p1, Llkn;

    check-cast v0, Lzjn;

    iget-object p2, p1, Llkn;->i:Lzjn;

    invoke-virtual {v0, p2}, Lzjn;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_42

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v1, v0, Lzjn;->a:F

    iput v1, p2, Lzjn;->a:F

    iget v1, v0, Lzjn;->b:F

    iput v1, p2, Lzjn;->b:F

    iget v0, v0, Lzjn;->c:F

    iput v0, p2, Lzjn;->c:F

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_42
    iget-object p0, p0, Lw6j;->b:Ljava/lang/Object;

    check-cast p0, Lemn;

    invoke-virtual {p0}, Lemn;->run()V

    return-void
.end method

.method public final t()V
    .registers 7

    iget-object v0, p0, Lw6j;->d:Ljava/lang/Object;

    check-cast v0, Lv9j;

    new-instance v1, Luzj;

    iget-object p0, p0, Lw6j;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    const-string v2, "speed_dial.enabled"

    invoke-virtual {p0, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v2

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->x()Lp7j;

    move-result-object v3

    const-string v4, "speed_dial.large_icons"

    invoke-virtual {p0, v4}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v4

    const-string v5, "speed_dial.plus_button"

    invoke-virtual {p0, v5}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    invoke-direct {v1, v2, v3, v4, p0}, Luzj;-><init>(ZLp7j;ZZ)V

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
