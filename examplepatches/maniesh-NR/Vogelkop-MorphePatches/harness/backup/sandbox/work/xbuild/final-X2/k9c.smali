.class public final Lk9c;
.super Ldej;
.source "SourceFile"


# instance fields
.field public final c:Ltah;

.field public d:Lcom/opera/android/custom_views/MaxHeightLayoutDirectionFrameLayout;

.field public e:Lcom/opera/android/widget/AspectRatioFrameLayout;

.field public f:Lcom/opera/android/widget/AspectRatioImageView;


# direct methods
.method public constructor <init>(Lmej;Ltah;)V
    .registers 3

    invoke-direct {p0, p1}, Ldej;-><init>(Lmej;)V

    iput-object p2, p0, Lk9c;->c:Ltah;

    return-void
.end method

.method public static d(Landroid/content/res/Resources;Lcom/opera/android/custom_views/MaxHeightLayoutDirectionFrameLayout;)V
    .registers 7

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_b

    move v0, v1

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v2, v2, Landroid/content/res/Configuration;->screenHeightDp:I

    int-to-float v2, v2

    sget-object v3, Lfan;->a:Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    invoke-static {v1, v2, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    float-to-int p0, p0

    int-to-double v1, p0

    if-eqz v0, :cond_24

    const-wide/high16 v3, 0x3fe8000000000000L    # 0.75

    goto :goto_29

    :cond_24
    const-wide v3, 0x3feccccccccccccdL    # 0.9

    :goto_29
    mul-double/2addr v1, v3

    double-to-int p0, v1

    iput p0, p1, Lcom/opera/android/custom_views/MaxHeightLayoutDirectionFrameLayout;->c:I

    return-void
.end method

.method public static e(Landroid/content/res/Configuration;Lcom/opera/android/widget/AspectRatioFrameLayout;Lcom/opera/android/widget/AspectRatioImageView;)V
    .registers 8

    const v0, 0x7f0a0625

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/widget/LottieAnimationView;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/16 v2, 0x8

    if-ne v1, v2, :cond_17

    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    move-result p2

    if-eq p2, v2, :cond_3e

    :cond_17
    iget p2, p0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x0

    const/4 v3, 0x1

    if-ne p2, v3, :cond_1f

    move p2, v3

    goto :goto_20

    :cond_1f
    move p2, v1

    :goto_20
    iget p0, p0, Landroid/content/res/Configuration;->screenHeightDp:I

    const/16 v4, 0x258

    if-ge p0, v4, :cond_27

    move v3, v1

    :cond_27
    if-eqz p2, :cond_2c

    if-eqz v3, :cond_2c

    move v2, v1

    :cond_2c
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, v0, Ln2d;->m:Lp2d;

    if-eqz p0, :cond_3e

    if-eqz p2, :cond_3b

    if-eqz v3, :cond_3b

    invoke-virtual {v0}, Lcom/opera/android/widget/LottieAnimationView;->h()V

    return-void

    :cond_3b
    invoke-virtual {v0}, Lcom/opera/android/widget/LottieAnimationView;->f()V

    :cond_3e
    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/view/View;
    .registers 15

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d0225

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0a01c0

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_155

    invoke-static {v4}, Lpq3;->a(Landroid/view/View;)Lpq3;

    move-result-object v1

    const v4, 0x7f0a0231

    invoke-static {v4, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v5, :cond_154

    const v4, 0x7f0a0232

    invoke-static {v4, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/FrameLayout;

    if-eqz v5, :cond_154

    const v4, 0x7f0a04ed

    invoke-static {v4, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/opera/android/widget/AspectRatioFrameLayout;

    if-eqz v6, :cond_154

    const v4, 0x7f0a0571

    invoke-static {v4, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/opera/android/widget/AspectRatioImageView;

    if-eqz v7, :cond_154

    const v4, 0x7f0a0625

    invoke-static {v4, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/opera/android/leanplum/ErrorReportingLottieAnimationView;

    if-eqz v8, :cond_154

    const v4, 0x7f0a06b5

    invoke-static {v4, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    check-cast v9, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v9, :cond_154

    move-object v4, v0

    check-cast v4, Lcom/opera/android/custom_views/MaxHeightLayoutDirectionFrameLayout;

    const v10, 0x7f0a06c5

    invoke-static {v10, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    check-cast v11, Lcom/opera/android/custom_views/DialogTitle;

    if-eqz v11, :cond_152

    iput-object v4, p0, Lk9c;->d:Lcom/opera/android/custom_views/MaxHeightLayoutDirectionFrameLayout;

    iput-object v6, p0, Lk9c;->e:Lcom/opera/android/widget/AspectRatioFrameLayout;

    iput-object v7, p0, Lk9c;->f:Lcom/opera/android/widget/AspectRatioImageView;

    iget-object v0, p0, Lk9c;->c:Ltah;

    iget-object v2, v0, Ltah;->d:Ljava/lang/Object;

    check-cast v2, Lp2d;

    iget-object v10, v0, Ltah;->c:Ljava/lang/Object;

    check-cast v10, Landroid/graphics/Bitmap;

    const/16 v12, 0x8

    if-eqz v2, :cond_8c

    invoke-virtual {v8, v2}, Ln2d;->m(Lp2d;)V

    const/4 v2, -0x1

    invoke-virtual {v8, v2}, Ln2d;->p(I)V

    invoke-virtual {v8, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v7, v12}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_a1

    :cond_8c
    if-eqz v10, :cond_98

    invoke-virtual {v7, v10}, Landroidx/appcompat/widget/AppCompatImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    invoke-virtual {v7, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    invoke-virtual {v8, v12}, Landroid/view/View;->setVisibility(I)V

    goto :goto_a1

    :cond_98
    invoke-virtual {v8, v12}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v7, v12}, Landroid/widget/ImageView;->setVisibility(I)V

    invoke-virtual {v6, v12}, Landroid/view/View;->setVisibility(I)V

    :goto_a1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    iget-object v2, p0, Lk9c;->e:Lcom/opera/android/widget/AspectRatioFrameLayout;

    iget-object v6, p0, Lk9c;->f:Lcom/opera/android/widget/AspectRatioImageView;

    invoke-static {p1, v2, v6}, Lk9c;->e(Landroid/content/res/Configuration;Lcom/opera/android/widget/AspectRatioFrameLayout;Lcom/opera/android/widget/AspectRatioImageView;)V

    iget-object p1, v0, Ltah;->b:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_ba

    invoke-virtual {v11, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_bd

    :cond_ba
    invoke-virtual {v11, v12}, Landroid/view/View;->setVisibility(I)V

    :goto_bd
    iget-object p1, v0, Ltah;->e:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_c7

    invoke-virtual {v9, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_ca

    :cond_c7
    invoke-virtual {v9, v12}, Landroid/view/View;->setVisibility(I)V

    :goto_ca
    iget-object p1, v1, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    iget-object v2, v0, Ltah;->f:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    if-eqz v2, :cond_ee

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, v0, Ltah;->g:Ljava/lang/Object;

    check-cast v2, Lxnf;

    if-eqz v2, :cond_e4

    new-instance v2, Lj9c;

    invoke-direct {v2, p0, v3}, Lj9c;-><init>(Lk9c;B)V

    invoke-virtual {p1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_f1

    :cond_e4
    new-instance v2, Lj9c;

    const/4 v6, 0x1

    invoke-direct {v2, p0, v6}, Lj9c;-><init>(Lk9c;B)V

    invoke-virtual {p1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_f1

    :cond_ee
    invoke-virtual {p1, v12}, Landroid/view/View;->setVisibility(I)V

    :goto_f1
    iget-object p1, v1, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    iget-object v1, v0, Ltah;->h:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_116

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Ltah;->i:Ljava/lang/Object;

    check-cast v1, Lxnf;

    if-eqz v1, :cond_10c

    new-instance v1, Lj9c;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Lj9c;-><init>(Lk9c;B)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_119

    :cond_10c
    new-instance v1, Lj9c;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v2}, Lj9c;-><init>(Lk9c;B)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_119

    :cond_116
    invoke-virtual {p1, v12}, Landroid/view/View;->setVisibility(I)V

    :goto_119
    iget-object p1, v0, Ltah;->k:Ljava/lang/Object;

    check-cast p1, Lxnf;

    if-eqz p1, :cond_12b

    invoke-virtual {v5, v3}, Landroid/view/View;->setVisibility(I)V

    new-instance p1, Lj9c;

    const/4 v1, 0x4

    invoke-direct {p1, p0, v1}, Lj9c;-><init>(Lk9c;B)V

    invoke-virtual {v5, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_12b
    iget-object p1, p0, Ldej;->b:Lmej;

    invoke-interface {p1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {p1, v4}, Lk9c;->d(Landroid/content/res/Resources;Lcom/opera/android/custom_views/MaxHeightLayoutDirectionFrameLayout;)V

    invoke-static {v4}, Lfsp;->m(Landroid/view/View;)Lpde;

    move-result-object p1

    new-instance v1, Lks6;

    const/16 v2, 0x16

    invoke-direct {v1, p0, v2}, Lks6;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, v4, v1}, Lxf8;->j0(Likc;Landroid/view/View;Lf7f;)V

    iget-object p1, v0, Ltah;->j:Ljava/lang/Object;

    check-cast p1, Lynf;

    if-eqz p1, :cond_151

    iget-object p0, p0, Ldej;->a:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    :cond_151
    return-object v4

    :cond_152
    move v1, v10

    goto :goto_155

    :cond_154
    move v1, v4

    :cond_155
    :goto_155
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v2
.end method
