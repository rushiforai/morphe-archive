.class public final Lig;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lhh4;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>()V
    .registers 2

    .line 14
    const/16 v0, 0xe

    iput-byte v0, p0, Lig;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lgn3;)V
    .registers 3

    const/16 v0, 0xc

    iput-byte v0, p0, Lig;->a:B

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lig;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 13
    iput-byte p2, p0, Lig;->a:B

    iput-object p1, p0, Lig;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lmm6;Lqim;)V
    .registers 3

    const/16 p1, 0x13

    iput-byte p1, p0, Lig;->a:B

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lig;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Low7;)V
    .registers 3

    const/16 v0, 0x18

    iput-byte v0, p0, Lig;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lig;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final cancel()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lig;->b:Ljava/lang/Object;

    return-void
.end method

.method public final run()V
    .registers 25

    move-object/from16 v0, p0

    iget-byte v1, v0, Lig;->a:B

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    packed-switch v1, :pswitch_data_3fc

    iget-object v0, v0, Lig;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/fragment/app/h;

    iget-object v1, v0, Landroidx/fragment/app/h;->b:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1a

    invoke-virtual {v0}, Landroidx/fragment/app/h;->e()V

    :cond_1a
    return-void

    :pswitch_1b
    iget-object v0, v0, Lig;->b:Ljava/lang/Object;

    check-cast v0, Leq8;

    iget-object v1, v0, Leq8;->z:Landroid/animation/ValueAnimator;

    iget-byte v2, v0, Leq8;->A:B

    if-eq v2, v6, :cond_28

    if-eq v2, v5, :cond_2b

    goto :goto_4a

    :cond_28
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_2b
    const/4 v2, 0x3

    iput-byte v2, v0, Leq8;->A:B

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    new-array v2, v5, [F

    aput v0, v2, v7

    const/4 v0, 0x0

    aput v0, v2, v6

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    const-wide/16 v2, 0x1f4

    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    :goto_4a
    return-void

    :pswitch_4b
    iget-object v0, v0, Lig;->b:Ljava/lang/Object;

    check-cast v0, Ldm8;

    iget-object v1, v0, Ldm8;->z:Lqmj;

    invoke-virtual {v0}, Ldm8;->G0()Ljava/util/HashSet;

    move-result-object v2

    invoke-virtual {v1, v2}, Lqmj;->L(Ljava/util/Collection;)V

    iget-object v0, v0, Ldm8;->A:Lqmj;

    sget-object v1, Ls9g;->h:Ls9g;

    iget-object v1, v1, Ls9g;->c:Lvzk;

    sget-object v2, Lkag;->c:Lkag;

    invoke-virtual {v1, v2}, Lvzk;->E(Lkag;)Ljava/util/HashSet;

    move-result-object v1

    invoke-virtual {v0, v1}, Lqmj;->L(Ljava/util/Collection;)V

    return-void

    :pswitch_68
    iget-object v0, v0, Lig;->b:Ljava/lang/Object;

    invoke-static {v0}, Lac8;->a(Ljava/lang/Object;)V

    return-void

    :pswitch_6e
    iget-object v0, v0, Lig;->b:Ljava/lang/Object;

    check-cast v0, Li18;

    iget-object v0, v0, Li18;->f:Lf18;

    if-eqz v0, :cond_7d

    iget-object v0, v0, Lf18;->c:Le18;

    iput-boolean v6, v0, Le18;->e:Z

    invoke-virtual {v0, v7}, Le18;->b(Z)V

    :cond_7d
    return-void

    :pswitch_7e
    iget-object v0, v0, Lig;->b:Ljava/lang/Object;

    check-cast v0, Low7;

    iget-boolean v1, v0, Low7;->j:Z

    if-eqz v1, :cond_8d

    iget-object v1, v0, Low7;->g:Ljr8;

    iget-object v0, v0, Low7;->c:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v0}, Lh6e;->d(Landroidx/recyclerview/widget/RecyclerView;)V

    :cond_8d
    return-void

    :pswitch_8e
    iget-object v0, v0, Lig;->b:Ljava/lang/Object;

    check-cast v0, Lim7;

    iput-object v4, v0, Lim7;->l:Lig;

    invoke-virtual {v0}, Lim7;->drawableStateChanged()V

    return-void

    :pswitch_98
    iget-object v1, v0, Lig;->b:Ljava/lang/Object;

    check-cast v1, Lfg7;

    iget-object v5, v1, Lfg7;->b:Ljava/util/ArrayList;

    iget v8, v1, Lfg7;->g:I

    if-nez v8, :cond_a3

    move v6, v7

    :cond_a3
    iget-object v8, v1, Lfg7;->c:Ll76;

    iget-object v9, v1, Lfg7;->a:Lrf7;

    iget-object v9, v9, Lrf7;->c:Ljava/util/ArrayList;

    invoke-static {v9}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    const-wide/16 v10, 0x0

    const-wide/16 v12, 0x0

    const-wide/16 v14, 0x0

    :goto_b7
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    const-wide/16 v17, 0x3e8

    if-eqz v16, :cond_ff

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    const-wide/16 v19, 0x0

    move-object/from16 v2, v16

    check-cast v2, Lre7;

    invoke-static {v2}, Lfg7;->c(Lre7;)Z

    move-result v3

    if-eqz v3, :cond_f6

    invoke-virtual {v2}, Lre7;->m()Z

    move-result v3

    if-eqz v3, :cond_f6

    move-object/from16 v16, v8

    iget-wide v7, v2, Lre7;->k:J

    cmp-long v21, v7, v19

    if-lez v21, :cond_f3

    add-long/2addr v12, v7

    move-object/from16 v21, v4

    iget-wide v3, v2, Lre7;->j:J

    move-wide/from16 v22, v3

    iget-wide v3, v2, Lre7;->i:J

    sub-long v3, v22, v3

    mul-long v3, v3, v17

    div-long/2addr v3, v7

    cmp-long v17, v3, v14

    if-lez v17, :cond_fa

    move-wide v14, v3

    move-wide v10, v7

    move-object v4, v2

    goto :goto_fc

    :cond_f3
    move-object/from16 v21, v4

    goto :goto_fa

    :cond_f6
    move-object/from16 v21, v4

    move-object/from16 v16, v8

    :cond_fa
    :goto_fa
    move-object/from16 v4, v21

    :goto_fc
    move-object/from16 v8, v16

    goto :goto_b7

    :cond_ff
    move-object/from16 v21, v4

    move-object/from16 v16, v8

    const-wide/16 v19, 0x0

    if-eqz v21, :cond_160

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static/range {v21 .. v21}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v2

    move-object/from16 v3, v16

    invoke-virtual {v3, v2}, Ll76;->add(Ljava/lang/Object;)Z

    invoke-static/range {v21 .. v21}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v2

    if-eqz v2, :cond_153

    invoke-virtual {v3}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move-wide/from16 v7, v19

    const/4 v4, 0x0

    :cond_129
    :goto_129
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_14b

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/util/Pair;

    iget-object v10, v9, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    if-ne v10, v2, :cond_129

    iget-object v9, v9, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v9, Ljava/lang/Long;

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    add-long/2addr v7, v9

    add-int/lit8 v4, v4, 0x1

    goto :goto_129

    :cond_14b
    if-lez v4, :cond_153

    int-to-long v2, v4

    div-long v2, v7, v2

    :goto_150
    move-object/from16 v4, v21

    goto :goto_156

    :cond_153
    move-wide/from16 v2, v19

    goto :goto_150

    :goto_156
    iget-wide v7, v4, Lre7;->j:J

    iget-wide v9, v4, Lre7;->i:J

    sub-long/2addr v7, v9

    mul-long v7, v7, v17

    div-long v2, v7, v2

    goto :goto_162

    :cond_160
    move-wide/from16 v2, v19

    :goto_162
    iput-wide v12, v1, Lfg7;->d:J

    iput-wide v2, v1, Lfg7;->e:J

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v7, 0x0

    :goto_16b
    if-ge v7, v4, :cond_17f

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    check-cast v8, Lbg;

    if-eqz v6, :cond_17b

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_16b

    :cond_17b
    invoke-virtual {v8, v12, v13, v2, v3}, Lbg;->b(JJ)V

    goto :goto_16b

    :cond_17f
    const/4 v7, 0x0

    iput v7, v1, Lfg7;->g:I

    iget-boolean v1, v1, Lfg7;->f:Z

    if-eqz v1, :cond_192

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_192

    const/16 v1, 0x3e8

    int-to-long v1, v1

    invoke-static {v0, v1, v2}, Lvml;->d(Ljava/lang/Runnable;J)V

    :cond_192
    return-void

    :pswitch_193
    iget-object v0, v0, Lig;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/fragment/app/i;

    invoke-static {v0}, Landroidx/fragment/app/i;->access$100(Landroidx/fragment/app/i;)Landroid/content/DialogInterface$OnDismissListener;

    move-result-object v1

    invoke-static {v0}, Landroidx/fragment/app/i;->access$000(Landroidx/fragment/app/i;)Landroid/app/Dialog;

    move-result-object v0

    invoke-interface {v1, v0}, Landroid/content/DialogInterface$OnDismissListener;->onDismiss(Landroid/content/DialogInterface;)V

    return-void

    :pswitch_1a3
    iget-object v0, v0, Lig;->b:Ljava/lang/Object;

    check-cast v0, Ld17;

    iget-boolean v1, v0, Ld17;->b:Z

    if-eqz v1, :cond_1b1

    const/4 v3, 0x0

    iput-boolean v3, v0, Ld17;->b:Z

    invoke-virtual {v0}, Ld17;->b()V

    :cond_1b1
    return-void

    :pswitch_1b2
    iget-object v0, v0, Lig;->b:Ljava/lang/Object;

    check-cast v0, Lqim;

    iget-object v0, v0, Lqim;->e:Lysj;

    const v1, 0x7f141289

    const/16 v2, 0x1388

    invoke-static {v1, v2, v0}, Lam2;->i(IILysj;)Lglj;

    move-result-object v1

    sget-object v2, Lijm;->b:Lijm;

    invoke-virtual {v0, v1, v2}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_1c7
    iget-object v0, v0, Lig;->b:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;

    iget-object v0, v0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->c:Lc5o;

    iget-object v0, v0, Lc5o;->a:Ljava/lang/Object;

    check-cast v0, Landroid/view/SurfaceView;

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundResource(I)V

    return-void

    :pswitch_1d6
    iget-object v0, v0, Lig;->b:Ljava/lang/Object;

    check-cast v0, Lky4;

    iget-object v0, v0, Lky4;->b:Ljava/lang/Object;

    check-cast v0, Lly4;

    iget-object v1, v0, Lly4;->u:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v1

    iget-object v2, v0, Lly4;->u:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x7f07010d

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    sub-int/2addr v1, v2

    iget-object v0, v0, Lly4;->w:Landroidx/core/widget/NestedScrollView;

    invoke-virtual {v0}, Landroid/view/View;->getScrollX()I

    move-result v2

    const/4 v3, 0x0

    rsub-int/lit8 v7, v2, 0x0

    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result v2

    sub-int/2addr v1, v2

    const/16 v2, 0xfa

    invoke-virtual {v0, v7, v1, v2, v3}, Landroidx/core/widget/NestedScrollView;->B(IIIZ)V

    return-void

    :pswitch_206
    iget-object v0, v0, Lig;->b:Ljava/lang/Object;

    check-cast v0, Lhw4;

    iget-object v0, v0, Lhw4;->a:Liw4;

    invoke-virtual {v0}, Liw4;->i()V

    return-void

    :pswitch_210
    iget-object v0, v0, Lig;->b:Ljava/lang/Object;

    check-cast v0, Lcda;

    if-eqz v0, :cond_219

    invoke-virtual {v0}, Lcda;->run()V

    :cond_219
    return-void

    :pswitch_21a
    iget-object v1, v0, Lig;->b:Ljava/lang/Object;

    check-cast v1, Lpjg;

    if-eqz v1, :cond_225

    iput-object v4, v0, Lig;->b:Ljava/lang/Object;

    invoke-virtual {v1}, Lpjg;->run()V

    :cond_225
    return-void

    :pswitch_226
    iget-object v0, v0, Lig;->b:Ljava/lang/Object;

    check-cast v0, Loq3;

    const/4 v3, 0x0

    iput-boolean v3, v0, Loq3;->c:Z

    iget-object v1, v0, Loq3;->e:Lnv5;

    check-cast v1, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    iget-object v2, v1, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->Q:Lx5n;

    if-eqz v2, :cond_241

    invoke-virtual {v2}, Lx5n;->f()Z

    move-result v2

    if-eqz v2, :cond_241

    iget-byte v1, v0, Loq3;->b:B

    invoke-virtual {v0, v1}, Loq3;->a(I)V

    goto :goto_24a

    :cond_241
    iget v2, v1, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->P:I

    if-ne v2, v5, :cond_24a

    iget-byte v0, v0, Loq3;->b:B

    invoke-virtual {v1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->N(I)V

    :cond_24a
    :goto_24a
    return-void

    :pswitch_24b
    iget-object v0, v0, Lig;->b:Ljava/lang/Object;

    check-cast v0, Lgn3;

    iput-object v4, v0, Lgn3;->o:Ljava/lang/Runnable;

    iget-object v1, v0, Lgn3;->b:Lcom/opera/android/bookmarks/h;

    iget-object v2, v0, Lgn3;->z:Ldm3;

    iget-object v3, v0, Lgn3;->a:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_279

    invoke-virtual {v2}, Lshf;->q()V

    iget-object v2, v2, Lshf;->a:Ljava/lang/Object;

    check-cast v2, Lml3;

    if-eqz v2, :cond_26a

    invoke-virtual {v0, v2}, Lgn3;->m(Lal3;)V

    goto :goto_276

    :cond_26a
    invoke-virtual {v1}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v2

    new-instance v4, Lym3;

    invoke-direct {v4, v2}, Lym3;-><init>(Lml3;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_276
    invoke-virtual {v0}, Lgn3;->g()V

    :cond_279
    iget-object v2, v0, Lgn3;->s:Lxm3;

    invoke-virtual {v1, v2}, Lcom/opera/android/bookmarks/h;->a(Lql3;)V

    iget-object v0, v0, Lgn3;->G:Lbm3;

    invoke-virtual {v0}, Lyz7;->c()V

    return-void

    :pswitch_284
    new-instance v1, Ljava/lang/NullPointerException;

    iget-object v0, v0, Lig;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    :pswitch_292
    iget-object v0, v0, Lig;->b:Ljava/lang/Object;

    check-cast v0, Lm93;

    iget-object v1, v0, Lm93;->r:Lqmj;

    invoke-virtual {v0}, Lm93;->H0()Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {v1, v0}, Lqmj;->L(Ljava/util/Collection;)V

    return-void

    :pswitch_2a0
    iget-object v0, v0, Lig;->b:Ljava/lang/Object;

    check-cast v0, Lf93;

    invoke-virtual {v0}, Lf93;->e()V

    return-void

    :pswitch_2a8
    iget-object v0, v0, Lig;->b:Ljava/lang/Object;

    check-cast v0, Lou2;

    iget-object v0, v0, Lou2;->d:Lpjn;

    iget-object v0, v0, Lpjn;->b:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/components/autofill/AutofillProvider;

    iget-object v0, v0, Lorg/chromium/components/autofill/AutofillProvider;->m:Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;

    invoke-virtual {v0}, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;->P()Z

    move-result v1

    if-eqz v1, :cond_2d7

    iget-wide v1, v0, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;->e:J

    invoke-static {v1, v2}, LJ/N;->Mk31b3DX(J)I

    move-result v1

    if-eqz v1, :cond_2d7

    sget-object v2, Lgq5;->b:Lcde;

    invoke-virtual {v2}, Lcde;->a()Z

    move-result v2

    if-eqz v2, :cond_2d1

    invoke-virtual {v0, v1}, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;->a0(I)Z

    invoke-virtual {v0, v1}, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;->V(I)Z

    goto :goto_2d7

    :cond_2d1
    invoke-virtual {v0, v1}, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;->V(I)Z

    invoke-virtual {v0, v1}, Lorg/chromium/content/browser/accessibility/WebContentsAccessibilityImpl;->a0(I)Z

    :cond_2d7
    :goto_2d7
    return-void

    :pswitch_2d8
    const-wide/16 v19, 0x0

    iget-object v1, v0, Lig;->b:Ljava/lang/Object;

    check-cast v1, Luic;

    iget-object v2, v1, Luic;->c:Lim7;

    iget-object v4, v1, Luic;->a:Llm2;

    iget-boolean v5, v1, Luic;->n:Z

    if-eqz v5, :cond_367

    iget-boolean v5, v1, Luic;->l:Z

    if-eqz v5, :cond_2fd

    const/4 v3, 0x0

    iput-boolean v3, v1, Luic;->l:Z

    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v5

    iput-wide v5, v4, Llm2;->d:J

    const-wide/16 v7, -0x1

    iput-wide v7, v4, Llm2;->f:J

    iput-wide v5, v4, Llm2;->e:J

    const/high16 v5, 0x3f000000    # 0.5f

    iput v5, v4, Llm2;->g:F

    :cond_2fd
    iget-wide v5, v4, Llm2;->f:J

    cmp-long v5, v5, v19

    if-lez v5, :cond_311

    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v5

    iget-wide v7, v4, Llm2;->f:J

    iget v9, v4, Llm2;->h:I

    int-to-long v9, v9

    add-long/2addr v7, v9

    cmp-long v5, v5, v7

    if-gtz v5, :cond_317

    :cond_311
    invoke-virtual {v1}, Luic;->e()Z

    move-result v5

    if-nez v5, :cond_31b

    :cond_317
    const/4 v3, 0x0

    iput-boolean v3, v1, Luic;->n:Z

    goto :goto_367

    :cond_31b
    const/4 v3, 0x0

    iget-boolean v5, v1, Luic;->m:Z

    if-eqz v5, :cond_335

    iput-boolean v3, v1, Luic;->m:Z

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v10, 0x3

    const/4 v11, 0x0

    move-wide v8, v6

    invoke-static/range {v6 .. v13}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v3

    invoke-virtual {v2, v3}, Lim7;->onTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-virtual {v3}, Landroid/view/MotionEvent;->recycle()V

    :cond_335
    iget-wide v5, v4, Llm2;->e:J

    cmp-long v3, v5, v19

    if-eqz v3, :cond_362

    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Llm2;->a(J)F

    move-result v3

    const/high16 v7, -0x3f800000    # -4.0f

    mul-float/2addr v7, v3

    mul-float/2addr v7, v3

    const/high16 v8, 0x40800000    # 4.0f

    mul-float/2addr v3, v8

    add-float/2addr v3, v7

    iget-wide v7, v4, Llm2;->e:J

    sub-long v7, v5, v7

    iput-wide v5, v4, Llm2;->e:J

    long-to-float v5, v7

    mul-float/2addr v5, v3

    iget v3, v4, Llm2;->c:F

    mul-float/2addr v5, v3

    float-to-int v3, v5

    iget-object v1, v1, Luic;->p:Lim7;

    invoke-virtual {v1, v3}, Landroid/widget/AbsListView;->scrollListBy(I)V

    sget-object v1, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {v2, v0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    goto :goto_367

    :cond_362
    const-string v0, "Cannot compute scroll delta before calling start()"

    invoke-static {v0}, Lh9o;->r(Ljava/lang/String;)V

    :cond_367
    :goto_367
    return-void

    :pswitch_368
    iget-object v0, v0, Lig;->b:Ljava/lang/Object;

    check-cast v0, Lul2;

    invoke-virtual {v0}, Lul2;->close()V

    return-void

    :pswitch_370
    iget-object v0, v0, Lig;->b:Ljava/lang/Object;

    check-cast v0, Lbhi;

    sget-object v1, Lt0i;->b:Lp0i;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lbhi;->resumeWith(Ljava/lang/Object;)V

    return-void

    :pswitch_37c
    iget-object v0, v0, Lig;->b:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/content/browser/androidoverlay/AndroidOverlayProviderImpl;

    iget v1, v0, Lorg/chromium/content/browser/androidoverlay/AndroidOverlayProviderImpl;->a:I

    sub-int/2addr v1, v6

    iput v1, v0, Lorg/chromium/content/browser/androidoverlay/AndroidOverlayProviderImpl;->a:I

    return-void

    :pswitch_386
    iget-object v1, v0, Lig;->b:Ljava/lang/Object;

    move-object v7, v1

    check-cast v7, Lv31;

    invoke-virtual {v7, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v8, v7, Lv31;->m0:Landroid/view/MotionEvent;

    if-eqz v8, :cond_3b2

    invoke-virtual {v8}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/16 v1, 0xa

    if-eq v0, v1, :cond_3b2

    if-eq v0, v6, :cond_3b2

    const/4 v1, 0x7

    if-eq v0, v1, :cond_3ab

    const/16 v2, 0x8

    const/16 v3, 0x9

    if-eq v0, v2, :cond_3a9

    if-eq v0, v3, :cond_3ab

    move v9, v5

    goto :goto_3ac

    :cond_3a9
    move v9, v3

    goto :goto_3ac

    :cond_3ab
    move v9, v1

    :goto_3ac
    iget-wide v10, v7, Lv31;->n0:J

    const/4 v12, 0x0

    invoke-virtual/range {v7 .. v12}, Lv31;->P(Landroid/view/MotionEvent;IJZ)V

    :cond_3b2
    return-void

    :pswitch_3b3
    iget-object v0, v0, Lig;->b:Ljava/lang/Object;

    check-cast v0, Li21;

    iget-object v1, v0, Li21;->h:Leq1;

    invoke-virtual {v1}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_3c2

    invoke-virtual {v0}, Li21;->a()V

    :cond_3c2
    return-void

    :pswitch_3c3
    iget-object v0, v0, Lig;->b:Ljava/lang/Object;

    check-cast v0, Liz;

    iget-object v1, v0, Liz;->f:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3e1

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfz;

    iget-object v2, v0, Liz;->b:Lt9f;

    iget-object v3, v0, Liz;->d:Landroid/net/Uri;

    iget-object v4, v0, Liz;->e:Ljava/lang/String;

    iget-object v0, v0, Liz;->g:Lhz;

    invoke-virtual {v1, v2, v3, v4, v0}, Lfz;->a(Lt9f;Landroid/net/Uri;Ljava/lang/String;Lhz;)V

    :cond_3e1
    return-void

    :pswitch_3e2
    iget-object v0, v0, Lig;->b:Ljava/lang/Object;

    check-cast v0, Lvzk;

    :goto_3e6
    :try_start_3e6
    iget-object v1, v0, Lvzk;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v1}, Ljava/lang/ref/ReferenceQueue;->remove()Ljava/lang/ref/Reference;

    move-result-object v1

    check-cast v1, Ljg;

    invoke-virtual {v0, v1}, Lvzk;->s(Ljg;)V
    :try_end_3f3
    .catch Ljava/lang/InterruptedException; {:try_start_3e6 .. :try_end_3f3} :catch_3f4

    goto :goto_3e6

    :catch_3f4
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_3e6

    :pswitch_data_3fc
    .packed-switch 0x0
        :pswitch_3e2
        :pswitch_3c3
        :pswitch_3b3
        :pswitch_386
        :pswitch_37c
        :pswitch_370
        :pswitch_368
        :pswitch_2d8
        :pswitch_2a8
        :pswitch_2a0
        :pswitch_292
        :pswitch_284
        :pswitch_24b
        :pswitch_226
        :pswitch_21a
        :pswitch_210
        :pswitch_206
        :pswitch_1d6
        :pswitch_1c7
        :pswitch_1b2
        :pswitch_1a3
        :pswitch_193
        :pswitch_98
        :pswitch_8e
        :pswitch_7e
        :pswitch_6e
        :pswitch_68
        :pswitch_4b
        :pswitch_1b
    .end packed-switch
.end method
