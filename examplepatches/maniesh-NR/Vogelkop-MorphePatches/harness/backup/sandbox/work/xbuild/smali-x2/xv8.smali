.class public abstract Lxv8;
.super Lbu8;
.source "SourceFile"


# instance fields
.field public final A:Lcom/opera/android/widget/ClickAwareCardView;

.field public final B:Lwv8;

.field public C:I

.field public final i:Landroid/view/ViewGroup;

.field public final j:Landroid/widget/FrameLayout;

.field public final k:Lga6;

.field public final l:Landroid/widget/TextView;

.field public final m:Landroid/widget/TextView;

.field public final n:Landroid/widget/TextView;

.field public final o:Landroid/widget/TextView;

.field public final p:Landroid/widget/TextView;

.field public final q:Landroid/view/View;

.field public final r:Landroid/widget/ImageView;

.field public final s:Lga6;

.field public final t:Landroid/widget/TextView;

.field public final u:Lcom/opera/android/ads/AdStarRatingView;

.field public final v:Landroid/view/View;

.field public final w:Landroid/widget/ImageView;

.field public final x:Landroid/widget/TextView;

.field public y:Landroid/view/View;

.field public z:Z


# direct methods
.method public constructor <init>(Landroid/view/View;Lwv8;Lize;)V
    .registers 5

    invoke-direct {p0, p1}, Lbu8;-><init>(Landroid/view/View;)V

    const/4 v0, 0x2

    iput v0, p0, Lxv8;->C:I

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    const v0, 0x7f0a0436

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lxv8;->j:Landroid/widget/FrameLayout;

    invoke-static {v0, p1}, Lgu8;->i0(Landroid/view/View;Landroid/view/View;)Lga6;

    move-result-object v0

    iput-object v0, p0, Lxv8;->k:Lga6;

    const v0, 0x7f0a042c

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lxv8;->l:Landroid/widget/TextView;

    const v0, 0x7f0a0434

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lxv8;->i:Landroid/view/ViewGroup;

    const v0, 0x7f0a043d

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lxv8;->m:Landroid/widget/TextView;

    const v0, 0x7f0a0441

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lxv8;->n:Landroid/widget/TextView;

    const v0, 0x7f0a0440

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lxv8;->o:Landroid/widget/TextView;

    const v0, 0x7f0a0442

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lxv8;->p:Landroid/widget/TextView;

    const v0, 0x7f0a043a

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iput-object v0, p0, Lxv8;->q:Landroid/view/View;

    const v0, 0x7f0a043b

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lxv8;->r:Landroid/widget/ImageView;

    invoke-static {v0, p1}, Lga6;->m(Landroid/widget/ImageView;Landroid/view/View;)Lga6;

    move-result-object v0

    iput-object v0, p0, Lxv8;->s:Lga6;

    const v0, 0x7f0a0439

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lxv8;->t:Landroid/widget/TextView;

    const v0, 0x7f0a043e

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Lcom/opera/android/ads/AdStarRatingView;

    iput-object v0, p0, Lxv8;->u:Lcom/opera/android/ads/AdStarRatingView;

    const v0, 0x7f0a042e

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iput-object v0, p0, Lxv8;->v:Landroid/view/View;

    const v0, 0x7f0a0431

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lxv8;->w:Landroid/widget/ImageView;

    const v0, 0x7f0a042d

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lxv8;->x:Landroid/widget/TextView;

    iput-object p2, p0, Lxv8;->B:Lwv8;

    const p2, 0x7f0a042f

    invoke-static {p1, p2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    check-cast p1, Lcom/opera/android/widget/ClickAwareCardView;

    iput-object p1, p0, Lxv8;->A:Lcom/opera/android/widget/ClickAwareCardView;

    new-instance p2, Lks6;

    const/16 v0, 0xb

    invoke-direct {p2, p0, v0}, Lks6;-><init>(Ljava/lang/Object;B)V

    invoke-static {p3, p1, p2}, Lxf8;->j0(Likc;Landroid/view/View;Lf7f;)V

    new-instance p2, Lpc5;

    const/16 p3, 0x13

    invoke-direct {p2, p0, p3}, Lpc5;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {p2, p1}, Lpc5;->a(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public V(Lja2;Z)V
    .registers 12

    invoke-super {p0, p1, p2}, Lo43;->V(Lja2;Z)V

    if-eqz p2, :cond_6

    return-void

    :cond_6
    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    invoke-static {p1}, Lcqp;->c0(Landroid/content/res/Configuration;)Lbwc;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lbwc;->b(I)Ljava/util/Locale;

    move-result-object p1

    invoke-static {p1}, Landroid/icu/util/ULocale;->forLocale(Ljava/util/Locale;)Landroid/icu/util/ULocale;

    move-result-object v0

    invoke-virtual {v0}, Landroid/icu/util/ULocale;->isRightToLeft()Z

    move-result v0

    invoke-static {p1}, Landroid/text/TextUtils;->getLayoutDirectionFromLocale(Ljava/util/Locale;)I

    move-result p1

    const/4 v1, 0x2

    if-eq v0, p1, :cond_33

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Ll2c;->a(Landroid/content/Context;)I

    move-result p1

    goto :goto_34

    :cond_33
    move p1, v1

    :goto_34
    iput p1, p0, Lxv8;->C:I

    invoke-virtual {p0}, Lbu8;->f0()Lyz;

    move-result-object p1

    invoke-virtual {p0}, Lbu8;->f0()Lyz;

    move-result-object v0

    iget-object v2, p0, Lxv8;->B:Lwv8;

    invoke-interface {v2, v0}, Lwv8;->j(Lyz;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    iget-object v4, p0, Lxv8;->m:Landroid/widget/TextView;

    if-eqz v3, :cond_53

    const v0, 0x7f14009b

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(I)V

    goto :goto_56

    :cond_53
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_56
    iget-object v0, p0, Lxv8;->l:Landroid/widget/TextView;

    const-string v3, ""

    invoke-virtual {p0, v0, v3}, Lxv8;->j0(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    invoke-interface {v2, p1}, Lwv8;->g(Lyz;)Ljava/lang/CharSequence;

    move-result-object v0

    iget-object v3, p0, Lxv8;->n:Landroid/widget/TextView;

    invoke-virtual {p0, v3, v0}, Lxv8;->j0(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    invoke-interface {v2, p1}, Lwv8;->f(Lyz;)Ljava/lang/CharSequence;

    move-result-object v0

    iget-object v4, p0, Lxv8;->o:Landroid/widget/TextView;

    invoke-virtual {p0, v4, v0}, Lxv8;->j0(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    invoke-interface {v2, p1}, Lwv8;->h(Lyz;)Ljava/lang/CharSequence;

    move-result-object v0

    iget-object v5, p0, Lxv8;->p:Landroid/widget/TextView;

    invoke-virtual {p0, v5, v0}, Lxv8;->j0(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lxv8;->i0()V

    invoke-virtual {p0}, Lbu8;->f0()Lyz;

    move-result-object v0

    invoke-virtual {v0}, Lyz;->i()Lvz;

    move-result-object v6

    invoke-virtual {v0}, Lyz;->k()Ljava/util/List;

    move-result-object v0

    const/4 v7, 0x1

    if-nez v6, :cond_92

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_92

    move v0, v7

    goto :goto_93

    :cond_92
    move v0, p2

    :goto_93
    const/16 v6, 0x8

    if-eqz v0, :cond_99

    move v0, v6

    goto :goto_9a

    :cond_99
    move v0, p2

    :goto_9a
    iget-object v8, p0, Lxv8;->v:Landroid/view/View;

    invoke-virtual {v8, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-interface {v2, p1}, Lwv8;->e(Lyz;)Ljava/lang/CharSequence;

    move-result-object p1

    iget-object v0, p0, Lxv8;->x:Landroid/widget/TextView;

    invoke-virtual {p0, v0, p1}, Lxv8;->j0(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-ltz p1, :cond_101

    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_ba

    move p1, v7

    goto :goto_bb

    :cond_ba
    move p1, p2

    :goto_bb
    iget-object v2, p0, Lxv8;->q:Landroid/view/View;

    if-eqz p1, :cond_c2

    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    :cond_c2
    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-nez v5, :cond_ca

    move v5, v7

    goto :goto_cb

    :cond_ca
    move v5, p2

    :goto_cb
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-nez v2, :cond_d3

    move v2, v7

    goto :goto_d4

    :cond_d3
    move v2, p2

    :goto_d4
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_db

    move p2, v7

    :cond_db
    if-nez v5, :cond_e1

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    goto :goto_101

    :cond_e1
    if-nez v2, :cond_e5

    if-eqz p1, :cond_ee

    :cond_e5
    if-eqz p2, :cond_ee

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setMaxLines(I)V

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setMaxLines(I)V

    goto :goto_101

    :cond_ee
    if-nez v2, :cond_fb

    if-nez p1, :cond_fb

    if-nez p2, :cond_fb

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    goto :goto_101

    :cond_fb
    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setMaxLines(I)V

    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    :cond_101
    :goto_101
    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/CardView;

    iget-object p1, p1, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;->a:Ll2c;

    iget p0, p0, Lxv8;->C:I

    invoke-virtual {p1, p0}, Ll2c;->d(I)V

    return-void
.end method

.method public g0(Landroid/view/View;)Z
    .registers 3

    const/4 v0, 0x1

    if-nez p1, :cond_4

    return v0

    :cond_4
    iget-object p0, p0, Lxv8;->w:Landroid/widget/ImageView;

    if-ne p0, p1, :cond_9

    return v0

    :cond_9
    const/4 p0, 0x0

    return p0
.end method

.method public final h0(Landroid/view/View;)V
    .registers 4

    iput-object p1, p0, Lxv8;->y:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget-object v0, p0, Lxv8;->y:Landroid/view/View;

    iget-object p0, p0, Lxv8;->j:Landroid/widget/FrameLayout;

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    instance-of v0, p0, Lcom/opera/android/widget/AspectRatioFrameLayout;

    if-eqz v0, :cond_27

    check-cast p0, Lcom/opera/android/widget/AspectRatioFrameLayout;

    if-eqz p1, :cond_20

    iget v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1e

    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq p1, v1, :cond_20

    :cond_1e
    const/4 p1, 0x0

    goto :goto_21

    :cond_20
    const/4 p1, 0x1

    :goto_21
    iget-object v0, p0, Lcom/opera/android/widget/AspectRatioFrameLayout;->c:Lrn9;

    iget-boolean v1, v0, Lrn9;->b:Z

    if-ne v1, p1, :cond_28

    :cond_27
    return-void

    :cond_28
    iput-boolean p1, v0, Lrn9;->b:Z

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public final i0()V
    .registers 21

    move-object/from16 v0, p0

    invoke-virtual {v0}, Lbu8;->f0()Lyz;

    move-result-object v1

    iget-object v2, v0, Lxv8;->B:Lwv8;

    invoke-interface {v2, v1}, Lwv8;->c(Lyz;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v1}, Lwv8;->b(Lyz;)D

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmpl-double v8, v4, v6

    const-wide/high16 v9, 0x4014000000000000L    # 5.0

    if-lez v8, :cond_1c

    cmpg-double v8, v4, v9

    if-lez v8, :cond_1d

    :cond_1c
    move-wide v4, v6

    :cond_1d
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    xor-int/lit8 v11, v8, 0x1

    invoke-interface {v2, v1}, Lwv8;->d(Lyz;)Z

    move-result v12

    cmpl-double v13, v4, v6

    const/4 v14, 0x1

    const/4 v15, 0x0

    if-lez v13, :cond_2f

    move v13, v14

    goto :goto_30

    :cond_2f
    move v13, v15

    :goto_30
    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    move-wide/from16 v16, v6

    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-static {v13}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    filled-new-array {v11, v6, v7}, [Ljava/lang/Boolean;

    move-result-object v6

    move-wide/from16 v18, v9

    move v7, v15

    move v11, v7

    :goto_46
    const/4 v9, 0x3

    if-ge v7, v9, :cond_56

    aget-object v9, v6, v7

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    if-eqz v9, :cond_53

    add-int/lit8 v11, v11, 0x1

    :cond_53
    add-int/lit8 v7, v7, 0x1

    goto :goto_46

    :cond_56
    const/4 v6, 0x2

    if-lt v11, v6, :cond_5a

    move v14, v15

    :cond_5a
    const/16 v6, 0x8

    if-eqz v14, :cond_60

    move v7, v6

    goto :goto_61

    :cond_60
    move v7, v15

    :goto_61
    iget-object v9, v0, Lxv8;->q:Landroid/view/View;

    invoke-virtual {v9, v7}, Landroid/view/View;->setVisibility(I)V

    iget-object v7, v0, Lxv8;->x:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v9

    const-string v10, "resized_in_code"

    invoke-virtual {v10, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_82

    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    if-nez v14, :cond_7c

    const/4 v10, -0x2

    goto :goto_7d

    :cond_7c
    const/4 v10, -0x1

    :goto_7d
    iput v10, v9, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {v7, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_82
    if-nez v14, :cond_da

    iget-object v7, v0, Lxv8;->t:Landroid/widget/TextView;

    invoke-virtual {v0, v7, v3}, Lxv8;->j0(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    if-eqz v12, :cond_8d

    move v3, v15

    goto :goto_8e

    :cond_8d
    move v3, v6

    :goto_8e
    iget-object v7, v0, Lxv8;->r:Landroid/widget/ImageView;

    invoke-virtual {v7, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    if-eqz v12, :cond_c5

    invoke-interface {v2, v1}, Lwv8;->a(Lyz;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_a9

    new-instance v2, Lnv6;

    invoke-direct {v2, v7}, Lnv6;-><init>(Ljava/lang/Object;)V

    iget-object v3, v0, Lxv8;->s:Lga6;

    invoke-static {v1, v7, v3, v15, v2}, Lgu8;->h0(Ljava/lang/String;Landroid/widget/ImageView;Lga6;ZLd94;)V

    :cond_a9
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    if-nez v8, :cond_b4

    if-eqz v13, :cond_b4

    const/high16 v2, 0x41c00000    # 24.0f

    goto :goto_b6

    :cond_b4
    const/high16 v2, 0x41800000    # 16.0f

    :goto_b6
    invoke-virtual {v7}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v2, v3}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v2

    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v7, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_c5
    if-nez v13, :cond_c8

    move v15, v6

    :cond_c8
    iget-object v0, v0, Lxv8;->u:Lcom/opera/android/ads/AdStarRatingView;

    invoke-virtual {v0, v15}, Landroid/view/View;->setVisibility(I)V

    cmpg-double v1, v4, v16

    if-ltz v1, :cond_da

    cmpl-double v1, v4, v18

    if-gtz v1, :cond_da

    iput-wide v4, v0, Lcom/opera/android/ads/AdStarRatingView;->f:D

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    :cond_da
    return-void
.end method

.method public final j0(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
    .registers 5

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v1, 0x0

    goto :goto_a

    :cond_8
    const/16 v1, 0x8

    :goto_a
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    if-nez v0, :cond_1f

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget p1, p0, Lxv8;->C:I

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1f

    invoke-static {p2}, Lcs5;->J(Ljava/lang/CharSequence;)I

    move-result p1

    if-eqz p1, :cond_20

    if-eq p1, v0, :cond_20

    :cond_1f
    return-void

    :cond_20
    iput p1, p0, Lxv8;->C:I

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 9

    invoke-virtual {p0}, Lo43;->e0()Lmq;

    move-result-object v1

    if-nez v1, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lxv8;->v:Landroid/view/View;

    if-ne p1, v0, :cond_55

    invoke-virtual {p0}, Lbu8;->f0()Lyz;

    move-result-object v0

    invoke-virtual {v0}, Lyz;->i()Lvz;

    move-result-object v2

    sget-object v6, Lijm;->b:Lijm;

    if-nez v2, :cond_32

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v0}, Lyz;->k()Ljava/util/List;

    move-result-object p1

    invoke-static {p0}, La4h;->f(Landroid/content/Context;)Lnej;

    move-result-object p0

    new-instance v0, Lcp;

    const v2, 0x7f140088

    invoke-direct {v0, v1, v2, p1}, Lcp;-><init>(Lmq;ILjava/util/List;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v0, v6}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_32
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    move-object v3, v2

    iget-object v2, v3, Lvz;->a:Ljava/lang/String;

    iget-object v3, v3, Lvz;->b:Ljava/lang/String;

    iget-object p0, p0, Lxv8;->B:Lwv8;

    invoke-interface {p0, v0}, Lwv8;->a(Lyz;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Lyz;->k()Ljava/util/List;

    move-result-object v5

    invoke-static {p1}, La4h;->f(Landroid/content/Context;)Lnej;

    move-result-object p0

    new-instance v0, Lcq;

    invoke-direct/range {v0 .. v5}, Lcq;-><init>(Lmq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v0, v6}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_55
    invoke-super {p0, p1}, Lbu8;->onClick(Landroid/view/View;)V

    return-void
.end method
