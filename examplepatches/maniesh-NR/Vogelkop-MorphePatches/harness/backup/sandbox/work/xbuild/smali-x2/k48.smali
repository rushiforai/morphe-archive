.class public final Lk48;
.super Lozb;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Ljava/lang/Object;

.field public final synthetic k:Ljava/lang/Object;

.field public final synthetic l:Ljava/lang/Object;

.field public final synthetic m:Ljava/lang/Object;


# direct methods
.method public constructor <init>(La2m;Lx48;Lvh8;Lndj;)V
    .registers 6

    const/4 v0, 0x1

    iput-byte v0, p0, Lk48;->i:B

    iput-object p1, p0, Lk48;->k:Ljava/lang/Object;

    iput-object p2, p0, Lk48;->l:Ljava/lang/Object;

    iput-object p3, p0, Lk48;->m:Ljava/lang/Object;

    iput-object p4, p0, Lk48;->j:Ljava/lang/Object;

    invoke-direct {p0, v0}, Lozb;-><init>(I)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 6

    .line 15
    iput-byte p5, p0, Lk48;->i:B

    iput-object p1, p0, Lk48;->j:Ljava/lang/Object;

    iput-object p2, p0, Lk48;->k:Ljava/lang/Object;

    iput-object p3, p0, Lk48;->l:Ljava/lang/Object;

    iput-object p4, p0, Lk48;->m:Ljava/lang/Object;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lozb;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 29

    move-object/from16 v0, p0

    iget-byte v1, v0, Lk48;->i:B

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    packed-switch v1, :pswitch_data_44e

    move-object/from16 v1, p1

    check-cast v1, Lbap;

    iget-object v5, v0, Lk48;->j:Ljava/lang/Object;

    check-cast v5, Lo7p;

    iget-object v6, v0, Lk48;->k:Ljava/lang/Object;

    check-cast v6, Liko;

    iget-object v7, v0, Lk48;->l:Ljava/lang/Object;

    check-cast v7, Ligi;

    iget-object v0, v0, Lk48;->m:Ljava/lang/Object;

    check-cast v0, Lphe;

    iget-object v8, v5, Lpxo;->i:Lp7p;

    if-eqz v8, :cond_25

    invoke-virtual {v8}, Lp7p;->f()V

    :cond_25
    iget-object v8, v6, Liko;->a:Landroid/widget/FrameLayout;

    iput-object v6, v5, Lo7p;->k:Liko;

    iput-object v8, v5, Lpxo;->f:Landroid/view/ViewGroup;

    iput-object v7, v5, Lo7p;->m:Ligi;

    iput-object v0, v5, Lo7p;->r:Lphe;

    new-instance v0, Lof3;

    const/16 v6, 0x14

    invoke-direct {v0, v5, v8, v6}, Lof3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v9, Loep;

    invoke-direct {v9, v0}, Loep;-><init>(Lkotlin/jvm/functions/Function1;)V

    new-instance v0, Lpkm;

    invoke-direct {v0, v9, v6}, Lpkm;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v8, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static {}, Laap;->f()Lz8p;

    move-result-object v0

    iget-boolean v0, v0, Lz8p;->r:Z

    if-eqz v0, :cond_5b

    new-instance v0, Ljkp;

    iget-object v6, v5, Lpxo;->i:Lp7p;

    const-wide/16 v10, 0x12c

    invoke-direct {v0, v8, v6, v10, v11}, Ljkp;-><init>(Landroid/view/ViewGroup;Lp7p;J)V

    iput-object v0, v5, Lo7p;->p:Ljkp;

    iget-object v0, v5, Lo7p;->q:Lm42;

    invoke-virtual {v8, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    :cond_5b
    iget-object v0, v7, Ligi;->b:Ljava/lang/Object;

    check-cast v0, Lksd;

    iget-object v6, v5, Lpxo;->d:Lvoo;

    check-cast v6, Ly2p;

    if-eqz v6, :cond_216

    invoke-virtual {v5}, Lo7p;->j()Lc4p;

    move-result-object v10

    const/16 v11, 0xd

    const/4 v12, -0x1

    if-eqz v10, :cond_1ae

    iget-object v10, v10, Lc4p;->p:Lzyk;

    invoke-virtual {v10}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    if-eqz v10, :cond_1ae

    invoke-static {v10}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v10

    xor-int/2addr v10, v4

    if-ne v10, v4, :cond_1ae

    iget-object v10, v5, Lo7p;->o:Lny3;

    if-eqz v10, :cond_1ae

    iget-object v6, v0, Lksd;->b:Lzro;

    if-nez v6, :cond_a2

    new-instance v6, Lzro;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-direct {v6, v13, v3, v2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    sget-object v14, Lfko;->a:Lejo;

    invoke-static {v13}, Lfko;->a(Landroid/content/Context;)V

    iput-object v6, v0, Lksd;->b:Lzro;

    new-instance v13, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v13, v12, v12}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v13, v11}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    invoke-virtual {v0, v6, v13}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_a2
    iput-object v6, v5, Lo7p;->l:Landroid/view/View;

    iget-object v0, v10, Lny3;->d:Ljava/lang/Object;

    move-object v11, v0

    check-cast v11, Lp7p;

    iget-boolean v0, v10, Lny3;->a:Z

    if-nez v0, :cond_216

    iget-object v0, v10, Lny3;->j:Ljava/lang/Object;

    check-cast v0, Lzro;

    invoke-static {v0, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_216

    invoke-virtual {v6}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-nez v0, :cond_216

    iget-object v0, v10, Lny3;->j:Ljava/lang/Object;

    check-cast v0, Lzro;

    if-eqz v0, :cond_c5

    if-ne v0, v6, :cond_216

    :cond_c5
    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v13

    iget-object v0, v10, Lny3;->c:Ljava/lang/Object;

    move-object v12, v0

    check-cast v12, Lylp;

    iget-object v0, v10, Lny3;->h:Ljava/lang/Object;

    check-cast v0, Llzo;

    if-eqz v0, :cond_d8

    move-object/from16 v25, v3

    goto/16 :goto_192

    :cond_d8
    new-instance v0, Lrii;

    const/16 v14, 0x19

    invoke-direct {v0, v10, v14}, Lrii;-><init>(Ljava/lang/Object;B)V

    invoke-static {v13}, Lfap;->d(Landroid/content/Context;)Landroid/util/Size;

    move-result-object v14

    invoke-virtual {v14}, Landroid/util/Size;->getWidth()I

    move-result v15

    invoke-virtual {v14}, Landroid/util/Size;->getHeight()I

    move-result v16

    invoke-static {v13}, Ld1p;->d(Landroid/content/Context;)Lt5p;

    move-result-object v14

    move-object/from16 v25, v3

    invoke-virtual {v12}, Lylp;->e()Lyjo;

    move-result-object v3

    iget-object v2, v10, Lny3;->c:Ljava/lang/Object;

    check-cast v2, Lylp;

    invoke-virtual {v14}, Lt5p;->a()Ljava/lang/String;

    move-result-object v18

    iget-boolean v14, v14, Lt5p;->c:Z

    move/from16 v19, v14

    const/4 v14, 0x0

    const/16 v17, 0x0

    move-object/from16 v26, v12

    move-object v12, v2

    move-object/from16 v2, v26

    invoke-virtual/range {v12 .. v19}, Lylp;->f(Landroid/content/Context;Leq;IILjava/lang/Integer;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v12

    if-eqz v3, :cond_117

    if-eqz v12, :cond_117

    new-instance v14, Lkotlin/Pair;

    invoke-direct {v14, v3, v12}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_119

    :cond_117
    move-object/from16 v14, v25

    :goto_119
    if-eqz v14, :cond_18c

    iget-object v3, v14, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v3, Lyjo;

    iget-object v12, v14, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v12, Ljava/lang/String;

    :try_start_123
    sget-object v14, Lt0i;->b:Lp0i;
    :try_end_125
    .catchall {:try_start_123 .. :try_end_125} :catchall_15f

    move-object v14, v12

    :try_start_126
    new-instance v12, La3p;

    iget-object v15, v2, Lvoo;->x:Ljava/io/File;

    if-nez v15, :cond_12e

    move-object/from16 v15, v25

    :cond_12e
    sget-object v16, Lsm;->c:Lsm;

    iget-object v4, v10, Lny3;->l:Ljava/lang/Object;

    move-object/from16 v17, v4

    check-cast v17, Ldpj;

    iget-object v4, v10, Lny3;->d:Ljava/lang/Object;

    move-object/from16 v20, v4

    check-cast v20, Lp7p;

    iget-boolean v4, v2, Lylp;->A:Z

    sget-object v22, La43;->G:La43;

    move-object/from16 p0, v0

    iget-object v0, v10, Lny3;->f:Ljava/lang/Object;

    move-object/from16 v23, v0

    check-cast v23, Lbxk;
    :try_end_148
    .catchall {:try_start_126 .. :try_end_148} :catchall_15c

    const/16 v24, 0x60

    const/16 v18, 0x0

    const/16 v19, 0x0

    move/from16 v21, v4

    move-object v4, v14

    move-object v14, v15

    move-object/from16 v15, v16

    move-object/from16 v16, p0

    :try_start_156
    invoke-direct/range {v12 .. v24}, La3p;-><init>(Landroid/content/Context;Ljava/io/File;Lsm;Lbpo;Lm1p;IILp7p;ZLkotlin/jvm/functions/Function0;Lbxk;I)V
    :try_end_159
    .catchall {:try_start_156 .. :try_end_159} :catchall_15a

    goto :goto_168

    :catchall_15a
    move-exception v0

    goto :goto_161

    :catchall_15c
    move-exception v0

    move-object v4, v14

    goto :goto_161

    :catchall_15f
    move-exception v0

    move-object v4, v12

    :goto_161
    sget-object v12, Lt0i;->b:Lp0i;

    new-instance v12, Lq0i;

    invoke-direct {v12, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    :goto_168
    invoke-static {v12}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_177

    if-eqz v11, :cond_175

    const/16 v0, 0x3ef

    invoke-virtual {v11, v0}, Lp7p;->a(I)V

    :cond_175
    move-object/from16 v12, v25

    :cond_177
    check-cast v12, La3p;

    if-eqz v12, :cond_188

    new-instance v0, Llzo;

    iget-object v2, v2, Lvoo;->j:Ljava/lang/String;

    invoke-direct {v0, v12, v3, v2, v4}, Llzo;-><init>(La3p;Lyjo;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, v10, Lny3;->h:Ljava/lang/Object;

    invoke-virtual {v0}, Llzo;->c()V

    goto :goto_18a

    :cond_188
    move-object/from16 v12, v25

    :goto_18a
    iput-object v12, v10, Lny3;->g:Ljava/lang/Object;

    :cond_18c
    iget-object v0, v10, Lny3;->h:Ljava/lang/Object;

    check-cast v0, Llzo;

    if-eqz v0, :cond_1a6

    :goto_192
    iget-object v0, v10, Lny3;->k:Ljava/lang/Object;

    check-cast v0, Lbno;

    invoke-virtual {v6, v0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-virtual {v6}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_1a2

    invoke-virtual {v10, v6}, Lny3;->a(Lzro;)V

    :cond_1a2
    iput-object v6, v10, Lny3;->j:Ljava/lang/Object;

    goto/16 :goto_218

    :cond_1a6
    if-eqz v11, :cond_218

    const/16 v0, 0x3ea

    invoke-virtual {v11, v0}, Lp7p;->a(I)V

    goto :goto_218

    :cond_1ae
    move-object/from16 v25, v3

    iget-object v2, v6, Ly2p;->D:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lsro;

    if-eqz v2, :cond_218

    iget-object v3, v0, Lksd;->a:Landroid/widget/ImageView;

    if-nez v3, :cond_1d4

    new-instance v3, Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lksd;->a:Landroid/widget/ImageView;

    new-instance v4, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v4, v12, v12}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v11}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    invoke-virtual {v0, v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_1d4
    iput-object v3, v5, Lo7p;->l:Landroid/view/View;

    invoke-virtual {v2, v3}, Lsro;->c(Landroid/widget/ImageView;)V

    iget-object v0, v5, Lpxo;->g:Lsxo;

    if-nez v0, :cond_218

    iget-object v0, v6, Ly2p;->z:Lc4p;

    iget-object v0, v0, Lc4p;->s:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v2, v6, Ly2p;->z:Lc4p;

    iget-object v2, v2, Lc4p;->a:La5p;

    iget-object v2, v2, La5p;->b:Ljava/lang/String;

    iget-object v4, v6, Lvoo;->o:Ljava/lang/String;

    iget-object v10, v6, Lvoo;->p:Ljava/lang/String;

    filled-new-array {v0, v2, v4, v10}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le82;->p([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v2, v6, Lvoo;->q:Lmzo;

    if-eqz v2, :cond_218

    iget-object v4, v5, Lpxo;->a:Landroid/content/Context;

    sget-object v6, Lc26;->q:Ll5b;

    iget-boolean v6, v6, Ll5b;->b:Z

    if-nez v6, :cond_20e

    invoke-static {v4}, Lc26;->f(Landroid/content/Context;)V

    :cond_20e
    new-instance v4, Lwro;

    invoke-direct {v4, v3, v0, v2}, Lsxo;-><init>(Landroid/view/View;Ljava/lang/String;Lmzo;)V

    iput-object v4, v5, Lpxo;->g:Lsxo;

    goto :goto_218

    :cond_216
    move-object/from16 v25, v3

    :cond_218
    :goto_218
    iget-object v0, v5, Lo7p;->s:Lzyk;

    invoke-virtual {v0}, Lzyk;->isInitialized()Z

    move-result v2

    if-eqz v2, :cond_22e

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkko;

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_22e

    const/4 v2, 0x1

    goto :goto_22f

    :cond_22e
    const/4 v2, 0x0

    :goto_22f
    invoke-virtual {v5, v2}, Lo7p;->i(Z)V

    iget-boolean v0, v1, Lbap;->a:Z

    if-eqz v0, :cond_24f

    iget-boolean v0, v1, Lbap;->c:Z

    if-nez v0, :cond_24f

    iget-boolean v0, v1, Lbap;->d:Z

    if-nez v0, :cond_24f

    new-instance v0, Lne5;

    iget-object v2, v5, Lpxo;->a:Landroid/content/Context;

    invoke-direct {v0, v2}, Lne5;-><init>(Landroid/content/Context;)V

    iput-object v0, v5, Lo7p;->n:Lne5;

    new-instance v2, Lm6p;

    invoke-direct {v2, v5}, Lm6p;-><init>(Lo7p;)V

    invoke-virtual {v0, v8, v2}, Lne5;->m(Landroid/view/View;Lhko;)V

    :cond_24f
    iget-boolean v0, v1, Lbap;->a:Z

    if-eqz v0, :cond_25e

    iget-boolean v0, v1, Lbap;->c:Z

    if-nez v0, :cond_25e

    iget-boolean v0, v1, Lbap;->b:Z

    if-nez v0, :cond_25e

    invoke-virtual {v5}, Lpxo;->e()V

    :cond_25e
    iget-object v0, v7, Ligi;->f:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ImageView;

    if-eqz v0, :cond_277

    iget-object v1, v5, Lpxo;->d:Lvoo;

    check-cast v1, Ly2p;

    if-eqz v1, :cond_277

    iget-object v1, v1, Ly2p;->E:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lsro;

    if-eqz v1, :cond_277

    invoke-virtual {v1, v0}, Lsro;->c(Landroid/widget/ImageView;)V

    :cond_277
    invoke-virtual {v7}, Ligi;->a()Ljava/util/LinkedHashSet;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_27f
    :goto_27f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2d0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    instance-of v2, v1, Lkko;

    if-nez v2, :cond_299

    invoke-virtual {v1, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-eq v1, v8, :cond_299

    iget-object v2, v5, Lo7p;->q:Lm42;

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    :cond_299
    if-eq v1, v8, :cond_27f

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    :goto_29f
    if-eqz v2, :cond_2b6

    if-eq v2, v8, :cond_27f

    instance-of v3, v2, Landroid/view/ViewGroup;

    if-eqz v3, :cond_2aa

    check-cast v2, Landroid/view/ViewGroup;

    goto :goto_2ac

    :cond_2aa
    move-object/from16 v2, v25

    :goto_2ac
    if-eqz v2, :cond_2b3

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    goto :goto_29f

    :cond_2b3
    move-object/from16 v2, v25

    goto :goto_29f

    :cond_2b6
    invoke-virtual {v1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v2

    if-eqz v2, :cond_27f

    iget-object v2, v5, Lpxo;->i:Lp7p;

    if-eqz v2, :cond_27f

    invoke-virtual {v5, v1}, Lo7p;->f(Landroid/view/View;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "Non-descendant clickable view: "

    invoke-virtual {v3, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/16 v3, 0x3eb

    invoke-virtual {v2, v3, v1}, Lp7p;->g(ILjava/lang/String;)V

    goto :goto_27f

    :cond_2d0
    return-object v25

    :pswitch_2d1
    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-object v2, v0, Lk48;->j:Ljava/lang/Object;

    check-cast v2, Lgcm;

    iget-object v3, v0, Lk48;->k:Ljava/lang/Object;

    check-cast v3, Lufm;

    iget-object v4, v0, Lk48;->l:Ljava/lang/Object;

    check-cast v4, Lkcm;

    iget-object v0, v0, Lk48;->m:Ljava/lang/Object;

    check-cast v0, Llrk;

    invoke-virtual {v2, v3, v4, v0}, Lgcm;->i(Lufm;Lkcm;Llrk;)V

    if-eqz v1, :cond_2f7

    new-instance v0, Ldcm;

    const/4 v1, 0x1

    invoke-direct {v0, v2, v1}, Ldcm;-><init>(Lgcm;B)V

    invoke-virtual {v2, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_2f7
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2fa
    move-object/from16 v25, v3

    move v1, v4

    move-object/from16 v2, p1

    check-cast v2, Le48;

    iget-object v3, v0, Lk48;->m:Ljava/lang/Object;

    check-cast v3, Lvh8;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    if-eqz v2, :cond_331

    if-eq v2, v1, :cond_32b

    const/4 v1, 0x2

    if-ne v2, v1, :cond_325

    iget-object v1, v3, Lvh8;->a:La3m;

    iget-object v1, v1, La3m;->d:Lmli;

    if-eqz v1, :cond_319

    iget-wide v0, v1, Lmli;->b:J

    goto :goto_31f

    :cond_319
    iget-object v0, v0, Lk48;->j:Ljava/lang/Object;

    check-cast v0, Lndj;

    iget-wide v0, v0, Lndj;->h:J

    :goto_31f
    new-instance v3, La2m;

    invoke-direct {v3, v0, v1}, La2m;-><init>(J)V

    goto :goto_353

    :cond_325
    invoke-static {}, Lh9o;->p()V

    move-object/from16 v3, v25

    goto :goto_35f

    :cond_32b
    iget-object v0, v0, Lk48;->k:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, La2m;

    goto :goto_353

    :cond_331
    iget-object v0, v0, Lk48;->l:Ljava/lang/Object;

    check-cast v0, Lx48;

    iget-object v0, v0, Lx48;->a:La3m;

    iget-object v0, v0, La3m;->d:Lmli;

    if-eqz v0, :cond_343

    iget-wide v0, v0, Lmli;->b:J

    new-instance v3, La2m;

    invoke-direct {v3, v0, v1}, La2m;-><init>(J)V

    goto :goto_353

    :cond_343
    iget-object v0, v3, Lvh8;->a:La3m;

    iget-object v0, v0, La3m;->d:Lmli;

    if-eqz v0, :cond_351

    iget-wide v0, v0, Lmli;->b:J

    new-instance v3, La2m;

    invoke-direct {v3, v0, v1}, La2m;-><init>(J)V

    goto :goto_353

    :cond_351
    move-object/from16 v3, v25

    :goto_353
    if-eqz v3, :cond_358

    iget-wide v0, v3, La2m;->a:J

    goto :goto_35a

    :cond_358
    sget-wide v0, La2m;->b:J

    :goto_35a
    new-instance v3, La2m;

    invoke-direct {v3, v0, v1}, La2m;-><init>(J)V

    :goto_35f
    return-object v3

    :pswitch_360
    move v1, v4

    move-object/from16 v2, p1

    check-cast v2, Lm1i;

    iget-object v3, v0, Lk48;->j:Ljava/lang/Object;

    check-cast v3, Lndj;

    iget-object v4, v0, Lk48;->k:Ljava/lang/Object;

    check-cast v4, Lp2m;

    const/high16 v5, 0x3f800000    # 1.0f

    if-eqz v4, :cond_37c

    invoke-virtual {v4}, Lp2m;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->floatValue()F

    move-result v4

    goto :goto_37d

    :cond_37c
    move v4, v5

    :goto_37d
    iget-object v6, v3, Lndj;->c:Lp12;

    iget-object v7, v6, Lp12;->d:Ljava/lang/Object;

    check-cast v7, Lp0g;

    invoke-virtual {v3}, Lndj;->b()Z

    move-result v8

    if-eqz v8, :cond_3a2

    iget-object v8, v6, Lp12;->a:Ljava/lang/Object;

    check-cast v8, Lt0g;

    invoke-virtual {v8}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    if-eqz v8, :cond_3a2

    iget-object v8, v6, Lp12;->b:Ljava/lang/Object;

    check-cast v8, Lp0g;

    invoke-virtual {v8}, Lp0g;->h()F

    move-result v8

    goto :goto_3a3

    :cond_3a2
    move v8, v5

    :goto_3a3
    mul-float/2addr v4, v8

    invoke-virtual {v3}, Lndj;->b()Z

    move-result v8

    if-eqz v8, :cond_3ac

    iput v4, v3, Lndj;->f:F

    :cond_3ac
    invoke-virtual {v2, v4}, Lm1i;->c(F)V

    iget-object v4, v0, Lk48;->l:Ljava/lang/Object;

    check-cast v4, Lp2m;

    if-eqz v4, :cond_3c0

    invoke-virtual {v4}, Lp2m;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->floatValue()F

    move-result v4

    goto :goto_3c1

    :cond_3c0
    move v4, v5

    :goto_3c1
    invoke-virtual {v3}, Lndj;->b()Z

    move-result v8

    if-eqz v8, :cond_3d7

    iget-object v8, v6, Lp12;->c:Ljava/lang/Object;

    check-cast v8, Lt0g;

    invoke-virtual {v8}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    if-nez v8, :cond_3d8

    :cond_3d7
    const/4 v1, 0x0

    :cond_3d8
    if-eqz v1, :cond_3de

    invoke-virtual {v7}, Lp0g;->h()F

    move-result v5

    :cond_3de
    mul-float/2addr v4, v5

    invoke-virtual {v3}, Lndj;->b()Z

    move-result v5

    if-eqz v5, :cond_407

    iput v4, v3, Lndj;->g:F

    if-eqz v1, :cond_407

    invoke-virtual {v7}, Lp0g;->h()F

    iget-object v1, v3, Lndj;->j:Lk1n;

    if-nez v1, :cond_3f8

    new-instance v1, Lk1n;

    const/4 v5, 0x0

    invoke-direct {v1, v5}, Lk1n;-><init>(Z)V

    iput-object v1, v3, Lndj;->j:Lk1n;

    :cond_3f8
    sget-object v5, Ll07;->a:Lh7h;

    iget-wide v7, v3, Lndj;->d:J

    invoke-static {v7, v8}, Lspl;->b(J)J

    move-result-wide v7

    invoke-static {v7, v8}, Lpn7;->f(J)J

    move-result-wide v7

    invoke-virtual {v1, v7, v8, v4}, Lk1n;->a(JF)V

    :cond_407
    invoke-virtual {v2, v4}, Lm1i;->g(F)V

    invoke-virtual {v2, v4}, Lm1i;->h(F)V

    iget-object v0, v0, Lk48;->m:Ljava/lang/Object;

    check-cast v0, Lp2m;

    if-eqz v0, :cond_41c

    invoke-virtual {v0}, Lp2m;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, La2m;

    iget-wide v0, v0, La2m;->a:J

    goto :goto_41e

    :cond_41c
    sget-wide v0, La2m;->b:J

    :goto_41e
    invoke-virtual {v3}, Lndj;->b()Z

    move-result v4

    if-eqz v4, :cond_440

    iget-object v4, v6, Lp12;->e:Ljava/lang/Object;

    check-cast v4, Lt0g;

    invoke-virtual {v4}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_440

    iget-object v0, v6, Lp12;->f:Ljava/lang/Object;

    check-cast v0, Lt0g;

    invoke-virtual {v0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, La2m;

    iget-wide v0, v0, La2m;->a:J

    :cond_440
    invoke-virtual {v3}, Lndj;->b()Z

    move-result v4

    if-eqz v4, :cond_448

    iput-wide v0, v3, Lndj;->h:J

    :cond_448
    invoke-virtual {v2, v0, v1}, Lm1i;->r(J)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_data_44e
    .packed-switch 0x0
        :pswitch_360
        :pswitch_2fa
        :pswitch_2d1
    .end packed-switch
.end method
