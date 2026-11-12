.class public final Ls10;
.super Lo43;
.source "SourceFile"

# interfaces
.implements Lxa2;
.implements Landroid/view/View$OnClickListener;
.implements Lev8;


# instance fields
.field public final f:Lz4n;

.field public final g:Ltsd;

.field public final h:Lr10;

.field public i:I

.field public j:Lp10;


# direct methods
.method public constructor <init>(Lz4n;Lpde;Ltsd;)V
    .registers 8

    iget-object v0, p1, Lz4n;->a:Landroid/widget/FrameLayout;

    const v1, 0x7f0a0647

    invoke-direct {p0, v0, v1}, Lo43;-><init>(Landroid/view/View;I)V

    iput-object p1, p0, Ls10;->f:Lz4n;

    iput-object p3, p0, Ls10;->g:Ltsd;

    invoke-static {v0}, Lp37;->z(Landroid/view/View;)Lkze;

    move-result-object v1

    new-instance v2, Lr10;

    invoke-direct {v2, p0}, Lr10;-><init>(Ls10;)V

    iput-object v2, p0, Ls10;->h:Lr10;

    const/4 v2, 0x2

    iput v2, p0, Ls10;->i:I

    sget-object v2, Lo10;->d:Lo10;

    iput-object v2, p0, Ls10;->j:Lp10;

    iget-object p1, p1, Lz4n;->b:Lcom/opera/android/widget/ClickAwareCardView;

    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Landroid/view/View;->setClipToOutline(Z)V

    iput-object p0, p1, Lcom/opera/android/widget/ClickAwareCardView;->q:Landroid/view/View$OnClickListener;

    new-instance p1, Lk10;

    const/4 v3, 0x0

    invoke-direct {p1, p0, v3}, Lk10;-><init>(Ls10;B)V

    invoke-static {p2, v1, p1}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance p1, Lk10;

    invoke-direct {p1, p0, v2}, Lk10;-><init>(Ls10;B)V

    invoke-static {p3, v1, p1}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance p1, Lu7;

    const/4 p2, 0x7

    invoke-direct {p1, p0, p2}, Lu7;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-nez p0, :cond_44

    return-void

    :cond_44
    invoke-static {p0, v0, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method


# virtual methods
.method public final J(Lwa2;)V
    .registers 2

    const/4 p0, 0x0

    iput-boolean p0, p1, Lwa2;->c:Z

    return-void
.end method

.method public final V(Lja2;Z)V
    .registers 6

    invoke-super {p0, p1, p2}, Lo43;->V(Lja2;Z)V

    if-nez p2, :cond_82

    iget-object p1, p0, Ls10;->f:Lz4n;

    iget-object p2, p1, Lz4n;->b:Lcom/opera/android/widget/ClickAwareCardView;

    iget-object v0, p1, Lz4n;->b:Lcom/opera/android/widget/ClickAwareCardView;

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p2

    invoke-static {p2}, Lcqp;->c0(Landroid/content/res/Configuration;)Lbwc;

    move-result-object p2

    const/4 v1, 0x0

    invoke-virtual {p2, v1}, Lbwc;->b(I)Ljava/util/Locale;

    move-result-object p2

    invoke-static {p2}, Landroid/icu/util/ULocale;->forLocale(Ljava/util/Locale;)Landroid/icu/util/ULocale;

    move-result-object v1

    invoke-virtual {v1}, Landroid/icu/util/ULocale;->isRightToLeft()Z

    move-result v1

    invoke-static {p2}, Landroid/text/TextUtils;->getLayoutDirectionFromLocale(Ljava/util/Locale;)I

    move-result p2

    if-eq v1, p2, :cond_33

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Ll2c;->a(Landroid/content/Context;)I

    move-result p2

    goto :goto_34

    :cond_33
    const/4 p2, 0x2

    :goto_34
    iput p2, p0, Ls10;->i:I

    invoke-virtual {p0}, Ls10;->h0()Ll10;

    move-result-object p2

    if-eqz p2, :cond_82

    invoke-virtual {p0}, Ls10;->j0()V

    invoke-virtual {p0}, Ls10;->i0()V

    invoke-virtual {p0}, Ls10;->f0()V

    iget-object v1, p1, Lz4n;->d:Lcom/opera/android/custom_views/StylingTextView;

    iget-object v2, p2, Ll10;->b:Ljava/lang/String;

    invoke-virtual {p0, v1, v2}, Ls10;->k0(Landroid/widget/TextView;Ljava/lang/String;)V

    iget-object v1, p1, Lz4n;->e:Lcom/opera/android/custom_views/StylingTextView;

    iget-object v2, p2, Ll10;->c:Ljava/lang/String;

    invoke-virtual {p0, v1, v2}, Ls10;->k0(Landroid/widget/TextView;Ljava/lang/String;)V

    iget-boolean v1, p2, Ll10;->i:Z

    iget-object p1, p1, Lz4n;->i:Lcom/google/android/material/button/MaterialButton;

    if-eqz v1, :cond_61

    if-eqz p1, :cond_68

    iget-object p2, p2, Ll10;->d:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Ls10;->k0(Landroid/widget/TextView;Ljava/lang/String;)V

    goto :goto_68

    :cond_61
    if-eqz p1, :cond_68

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    :cond_68
    :goto_68
    iget-object p1, v0, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;->a:Ll2c;

    iget p2, p0, Ls10;->i:I

    invoke-virtual {p1, p2}, Ll2c;->d(I)V

    iget-object p1, p0, Lab2;->b:Lja2;

    check-cast p1, Lmq;

    const/4 p2, 0x0

    if-eqz p1, :cond_79

    iget-object p1, p1, Lmq;->d:Lyz;

    goto :goto_7a

    :cond_79
    move-object p1, p2

    :goto_7a
    check-cast p1, Lw10;

    if-eqz p1, :cond_80

    iget-object p2, p1, Lw10;->u:Lcie;

    :cond_80
    if-nez p2, :cond_83

    :cond_82
    return-void

    :cond_83
    iget-object p1, p0, Ls10;->j:Lp10;

    sget-object v0, Ln10;->d:Ln10;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    iput-boolean p1, p2, Lcie;->q0:Z

    iget-object p0, p0, Ls10;->h:Lr10;

    iput-object p0, p2, Lcie;->T:Ly55;

    return-void
.end method

.method public final Y()V
    .registers 2

    invoke-super {p0}, Lo43;->Y()V

    iget-object p0, p0, Lab2;->b:Lja2;

    check-cast p0, Lmq;

    const/4 v0, 0x0

    if-eqz p0, :cond_d

    iget-object p0, p0, Lmq;->d:Lyz;

    goto :goto_e

    :cond_d
    move-object p0, v0

    :goto_e
    check-cast p0, Lw10;

    if-eqz p0, :cond_14

    iget-object v0, p0, Lw10;->u:Lcie;

    :cond_14
    if-eqz v0, :cond_1a

    sget-object p0, Ly55;->a:Ly55;

    iput-object p0, v0, Lcie;->T:Ly55;

    :cond_1a
    return-void
.end method

.method public final f0()V
    .registers 18

    move-object/from16 v0, p0

    iget-object v1, v0, Ls10;->f:Lz4n;

    iget-object v2, v1, Lz4n;->a:Landroid/widget/FrameLayout;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0}, Ls10;->h0()Ll10;

    move-result-object v3

    if-nez v3, :cond_11

    return-void

    :cond_11
    iget-object v0, v0, Ls10;->g:Ltsd;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrmn;

    sget-object v4, Lv8k;->a:Lv8k;

    invoke-virtual {v4, v2}, Lv8k;->d(Landroid/content/Context;)I

    move-result v4

    if-eqz v0, :cond_28

    iget v0, v0, Lrmn;->e:I

    invoke-static {v0, v4}, Lp37;->r(II)I

    move-result v0

    goto :goto_2e

    :cond_28
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0, v4}, Lp37;->j0(FI)I

    move-result v0

    :goto_2e
    const v4, 0x1010036

    const v5, 0x7f0600b6

    invoke-static {v4, v2, v5}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v6

    invoke-static {v2}, Lf03;->I(Landroid/content/Context;)Z

    move-result v7

    const v8, 0x7f06063b

    const v9, 0x7f0402d7

    const v10, 0x7f0402b9

    if-eqz v7, :cond_73

    iget-object v7, v3, Ll10;->j:Ljava/lang/String;

    invoke-static {v6, v7}, Lipe;->Y(ILjava/lang/String;)I

    move-result v12

    new-instance v11, Lq10;

    iget-object v7, v3, Ll10;->l:Ljava/lang/String;

    invoke-static {v6, v7}, Lipe;->Y(ILjava/lang/String;)I

    move-result v13

    iget-object v6, v3, Ll10;->n:Ljava/lang/String;

    invoke-static {v9, v2, v8}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v7

    invoke-static {v7, v6}, Lipe;->Y(ILjava/lang/String;)I

    move-result v14

    iget-object v3, v3, Ll10;->p:Ljava/lang/String;

    invoke-static {v10, v2, v8}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v6

    invoke-static {v6, v3}, Lipe;->Y(ILjava/lang/String;)I

    move-result v15

    move/from16 v16, v12

    invoke-direct/range {v11 .. v16}, Lq10;-><init>(IIIII)V

    goto :goto_9a

    :cond_73
    iget-object v7, v3, Ll10;->k:Ljava/lang/String;

    invoke-static {v6, v7}, Lipe;->Y(ILjava/lang/String;)I

    move-result v12

    new-instance v11, Lq10;

    iget-object v7, v3, Ll10;->m:Ljava/lang/String;

    invoke-static {v6, v7}, Lipe;->Y(ILjava/lang/String;)I

    move-result v13

    iget-object v6, v3, Ll10;->o:Ljava/lang/String;

    invoke-static {v9, v2, v8}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v7

    invoke-static {v7, v6}, Lipe;->Y(ILjava/lang/String;)I

    move-result v14

    iget-object v3, v3, Ll10;->q:Ljava/lang/String;

    invoke-static {v10, v2, v8}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v6

    invoke-static {v6, v3}, Lipe;->Y(ILjava/lang/String;)I

    move-result v15

    move/from16 v16, v12

    invoke-direct/range {v11 .. v16}, Lq10;-><init>(IIIII)V

    :goto_9a
    invoke-static {v4, v2, v5}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v3

    iget v4, v11, Lq10;->c:I

    invoke-static {v4, v0}, Lab5;->e(II)D

    move-result-wide v5

    double-to-float v0, v5

    float-to-double v5, v0

    const-wide/high16 v12, 0x4012000000000000L    # 4.5

    cmpl-double v0, v5, v12

    if-ltz v0, :cond_b3

    iget v0, v11, Lq10;->d:I

    goto :goto_bb

    :cond_b3
    invoke-static {v9, v2, v8}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v4

    invoke-static {v10, v2, v8}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    :goto_bb
    iget-object v2, v1, Lz4n;->d:Lcom/opera/android/custom_views/StylingTextView;

    iget-object v5, v1, Lz4n;->i:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v2, v1, Lz4n;->e:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    if-eqz v5, :cond_cf

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v5, v4}, Lcom/google/android/material/button/MaterialButton;->setBackgroundColor(I)V

    :cond_cf
    iget-object v0, v1, Lz4n;->g:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-static {v3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final g0()V
    .registers 3

    iget-object v0, p0, Ls10;->f:Lz4n;

    iget-object v0, v0, Lz4n;->j:Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v0, :cond_a

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_a
    iget-object v0, p0, Lab2;->b:Lja2;

    check-cast v0, Lmq;

    if-eqz v0, :cond_19

    iget-object v1, v0, Lmq;->d:Lyz;

    if-eqz v1, :cond_19

    iget-object v0, v0, Lmq;->g:Lkm;

    invoke-interface {v0, v1}, Lkm;->s(Lyz;)V

    :cond_19
    invoke-virtual {p0}, Ls10;->j0()V

    iget-object p0, p0, Lab2;->b:Lja2;

    check-cast p0, Lmq;

    const/4 v0, 0x0

    if-eqz p0, :cond_26

    iget-object p0, p0, Lmq;->d:Lyz;

    goto :goto_27

    :cond_26
    move-object p0, v0

    :goto_27
    check-cast p0, Lw10;

    if-eqz p0, :cond_2d

    iget-object v0, p0, Lw10;->u:Lcie;

    :cond_2d
    if-eqz v0, :cond_32

    const/4 p0, 0x1

    iput-boolean p0, v0, Lcie;->q0:Z

    :cond_32
    return-void
.end method

.method public final h0()Ll10;
    .registers 20

    move-object/from16 v0, p0

    iget-object v0, v0, Lab2;->b:Lja2;

    check-cast v0, Lmq;

    const/4 v1, 0x0

    if-eqz v0, :cond_c

    iget-object v0, v0, Lmq;->d:Lyz;

    goto :goto_d

    :cond_c
    move-object v0, v1

    :goto_d
    check-cast v0, Lw10;

    if-eqz v0, :cond_44

    iget-object v0, v0, Lw10;->u:Lcie;

    new-instance v1, Ll10;

    iget-boolean v2, v0, Lcie;->o0:Z

    iget-object v3, v0, Lcie;->q:Ljava/lang/String;

    iget-object v4, v0, Lcie;->r:Ljava/lang/String;

    iget-object v5, v0, Lcie;->t:Ljava/lang/String;

    iget-object v6, v0, Lcie;->a0:Ljava/lang/String;

    iget-object v7, v0, Lcie;->b0:Ljava/lang/String;

    iget-object v8, v0, Lcie;->c0:Ljava/lang/String;

    iget-object v9, v0, Lcie;->d0:Ljava/lang/String;

    iget-boolean v10, v0, Lcie;->s:Z

    iget-object v11, v0, Lcie;->e0:Ljava/lang/String;

    iget-object v12, v0, Lcie;->f0:Ljava/lang/String;

    iget-object v13, v0, Lcie;->g0:Ljava/lang/String;

    iget-object v14, v0, Lcie;->h0:Ljava/lang/String;

    iget-object v15, v0, Lcie;->m0:Ljava/lang/String;

    move-object/from16 p0, v1

    iget-object v1, v0, Lcie;->n0:Ljava/lang/String;

    move-object/from16 v16, v1

    iget-object v1, v0, Lcie;->k0:Ljava/lang/String;

    iget-object v0, v0, Lcie;->l0:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v17, v1

    move-object/from16 v1, p0

    invoke-direct/range {v1 .. v18}, Ll10;-><init>(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_44
    return-object v1
.end method

.method public final i(Z)V
    .registers 6

    iget-object v0, p0, Lab2;->b:Lja2;

    check-cast v0, Lmq;

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    iget-object v0, v0, Lmq;->d:Lyz;

    goto :goto_b

    :cond_a
    move-object v0, v1

    :goto_b
    check-cast v0, Lw10;

    if-eqz v0, :cond_12

    iget-object v0, v0, Lw10;->u:Lcie;

    goto :goto_13

    :cond_12
    move-object v0, v1

    :goto_13
    if-nez v0, :cond_16

    return-void

    :cond_16
    if-eqz p1, :cond_53

    iget-object p0, p0, Ls10;->f:Lz4n;

    iget-object p1, p0, Lz4n;->b:Lcom/opera/android/widget/ClickAwareCardView;

    iget-object v2, p0, Lz4n;->b:Lcom/opera/android/widget/ClickAwareCardView;

    iget-object v3, p0, Lz4n;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v2, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const/4 p1, 0x0

    invoke-virtual {v2, p1}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {v3, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v3, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    invoke-virtual {v3, p1}, Landroid/view/View;->setClickable(Z)V

    iput-object v2, v0, Lcie;->R:Landroid/view/View;

    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    move-object v2, p1

    check-cast v2, Ljava/util/List;

    invoke-static {v2}, Lm5h;->d(Ljava/util/List;)Z

    move-result v2

    if-nez v2, :cond_49

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v2, v0, Lcie;->Q:Ljava/util/ArrayList;

    :cond_49
    iget-object p0, p0, Lz4n;->i:Lcom/google/android/material/button/MaterialButton;

    if-eqz p0, :cond_4f

    iput-object p0, v0, Lcie;->S:Landroid/widget/TextView;

    :cond_4f
    invoke-virtual {v0, v1}, Lcie;->h(Ljsd;)V

    return-void

    :cond_53
    invoke-virtual {v0}, Lcie;->unregister()V

    return-void
.end method

.method public final i0()V
    .registers 9

    iget-object v0, p0, Ls10;->f:Lz4n;

    iget-object v1, v0, Lz4n;->a:Landroid/widget/FrameLayout;

    iget-object v2, v0, Lz4n;->b:Lcom/opera/android/widget/ClickAwareCardView;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Ls10;->h0()Ll10;

    move-result-object p0

    if-eqz p0, :cond_53

    invoke-static {v1}, Lf03;->I(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_1b

    iget-object v1, p0, Ll10;->e:Ljava/lang/String;

    iget-object p0, p0, Ll10;->g:Ljava/lang/String;

    goto :goto_1f

    :cond_1b
    iget-object v1, p0, Ll10;->f:Ljava/lang/String;

    iget-object p0, p0, Ll10;->h:Ljava/lang/String;

    :goto_1f
    iget-object v3, v0, Lz4n;->f:Lcom/opera/android/custom_views/StylingImageView;

    invoke-static {v3, v2}, Lga6;->m(Landroid/widget/ImageView;Landroid/view/View;)Lga6;

    move-result-object v4

    const/4 v5, 0x4

    const/4 v6, 0x0

    if-eqz v1, :cond_36

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :cond_36

    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    invoke-static {v1, v3, v4}, Lgu8;->g0(Ljava/lang/String;Landroid/widget/ImageView;Lga6;)V

    goto :goto_39

    :cond_36
    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    :goto_39
    iget-object v0, v0, Lz4n;->h:Lcom/opera/android/widget/RoundedImageView;

    if-eqz v0, :cond_53

    invoke-static {v0, v2}, Lga6;->m(Landroid/widget/ImageView;Landroid/view/View;)Lga6;

    move-result-object v1

    if-eqz p0, :cond_50

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_50

    invoke-virtual {v0, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    invoke-static {p0, v0, v1}, Lgu8;->g0(Ljava/lang/String;Landroid/widget/ImageView;Lga6;)V

    return-void

    :cond_50
    invoke-virtual {v0, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_53
    return-void
.end method

.method public final j0()V
    .registers 4

    invoke-virtual {p0}, Ls10;->h0()Ll10;

    move-result-object v0

    if-eqz v0, :cond_23

    iget-boolean v0, v0, Ll10;->a:Z

    iget-object v1, p0, Ls10;->f:Lz4n;

    if-eqz v0, :cond_19

    iget-object v0, v1, Lz4n;->j:Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v0, :cond_16

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_19

    :cond_16
    sget-object v0, Ln10;->d:Ln10;

    goto :goto_1b

    :cond_19
    sget-object v0, Lm10;->d:Lm10;

    :goto_1b
    iget-object v2, p0, Ls10;->j:Lp10;

    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_24

    :cond_23
    return-void

    :cond_24
    iput-object v0, p0, Ls10;->j:Lp10;

    iget-object p0, v1, Lz4n;->g:Lcom/opera/android/custom_views/StylingImageButton;

    iget v2, v0, Lp10;->b:I

    invoke-virtual {p0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    iget-object p0, v1, Lz4n;->g:Lcom/opera/android/custom_views/StylingImageButton;

    iget v0, v0, Lp10;->c:I

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Ln1h;->n(Landroid/view/View;II)V

    return-void
.end method

.method public final k0(Landroid/widget/TextView;Ljava/lang/String;)V
    .registers 4

    if-eqz p2, :cond_20

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_20

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    iget p1, p0, Ls10;->i:I

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1c

    invoke-static {p2}, Lcs5;->J(Ljava/lang/CharSequence;)I

    move-result p1

    if-eqz p1, :cond_1d

    if-eq p1, v0, :cond_1d

    :cond_1c
    return-void

    :cond_1d
    iput p1, p0, Ls10;->i:I

    return-void

    :cond_20
    const/16 p0, 0x8

    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-object v0, p0, Ls10;->f:Lz4n;

    iget-object v0, v0, Lz4n;->g:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5c

    iget-object p1, p0, Ls10;->j:Lp10;

    sget-object v0, Lm10;->d:Lm10;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_44

    iget-object p1, p0, Lab2;->b:Lja2;

    check-cast p1, Lmq;

    const/4 v0, 0x0

    if-eqz p1, :cond_1e

    iget-object p1, p1, Lmq;->d:Lyz;

    goto :goto_1f

    :cond_1e
    move-object p1, v0

    :goto_1f
    check-cast p1, Lw10;

    if-eqz p1, :cond_25

    iget-object v0, p1, Lw10;->u:Lcie;

    :cond_25
    if-eqz v0, :cond_6f

    const/4 p1, 0x5

    invoke-virtual {v0, p1}, Lcie;->g(I)V

    iget-object p0, p0, Lab2;->b:Lja2;

    check-cast p0, Lmq;

    if-eqz p0, :cond_6f

    iget-object p1, p0, Lmq;->d:Lyz;

    if-eqz p1, :cond_6f

    iget-object v0, p0, Lmq;->g:Lkm;

    iget-object v1, p0, Lmq;->c:Ldl;

    invoke-interface {v0, p1, v1}, Lkm;->x(Lyz;Ldl;)V

    iget-object p1, p0, Lmq;->l:Lkq;

    if-eqz p1, :cond_6f

    invoke-interface {p1, p0}, Lkq;->r(Lmq;)V

    return-void

    :cond_44
    sget-object v0, Ln10;->d:Ln10;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_50

    invoke-virtual {p0}, Ls10;->g0()V

    return-void

    :cond_50
    sget-object p0, Lo10;->d:Lo10;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6f

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_5c
    iget-object p0, p0, Lab2;->b:Lja2;

    check-cast p0, Lmq;

    if-eqz p0, :cond_6f

    iget-object p1, p0, Lmq;->d:Lyz;

    if-eqz p1, :cond_6c

    invoke-virtual {p1}, Lyz;->s()Z

    move-result p1

    if-nez p1, :cond_6f

    :cond_6c
    invoke-virtual {p0}, Lmq;->k()V

    :cond_6f
    return-void
.end method
