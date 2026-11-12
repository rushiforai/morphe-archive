.class public final Lnen;
.super Lnz0;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final a:Lwtm;

.field public final b:Lysj;

.field public final c:Landroid/graphics/ColorMatrixColorFilter;

.field public final d:Landroid/view/animation/AnimationSet;

.field public e:Lzu;

.field public f:Ljava/util/List;

.field public g:Landroid/widget/Button;


# direct methods
.method public constructor <init>(Lwtm;Lysj;)V
    .registers 16

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lnz0;-><init>(ZZ)V

    iput-object p1, p0, Lnen;->a:Lwtm;

    iput-object p2, p0, Lnen;->b:Lysj;

    new-instance p1, Landroid/graphics/ColorMatrix;

    invoke-direct {p1}, Landroid/graphics/ColorMatrix;-><init>()V

    const/high16 p2, 0x3f800000    # 1.0f

    const v0, 0x3f19999a    # 0.6f

    invoke-virtual {p1, p2, p2, p2, v0}, Landroid/graphics/ColorMatrix;->setScale(FFFF)V

    new-instance p2, Landroid/graphics/ColorMatrix;

    invoke-direct {p2}, Landroid/graphics/ColorMatrix;-><init>()V

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/graphics/ColorMatrix;->setSaturation(F)V

    invoke-virtual {p1, p2}, Landroid/graphics/ColorMatrix;->postConcat(Landroid/graphics/ColorMatrix;)V

    new-instance p2, Landroid/graphics/ColorMatrixColorFilter;

    invoke-direct {p2, p1}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    iput-object p2, p0, Lnen;->c:Landroid/graphics/ColorMatrixColorFilter;

    new-instance p1, Landroid/view/animation/AnimationSet;

    invoke-direct {p1, v1}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    new-instance v2, Landroid/view/animation/ScaleAnimation;

    const/4 v9, 0x1

    const/high16 v10, 0x3f000000    # 0.5f

    const/high16 v3, 0x3f800000    # 1.0f

    const v4, 0x3f4ccccd    # 0.8f

    const/high16 v5, 0x3f800000    # 1.0f

    const v6, 0x3f4ccccd    # 0.8f

    const/4 v7, 0x1

    const/high16 v8, 0x3f000000    # 0.5f

    invoke-direct/range {v2 .. v10}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    const-wide/16 v0, 0x64

    invoke-virtual {v2, v0, v1}, Landroid/view/animation/Animation;->setDuration(J)V

    sget-object p2, Llf1;->k:Landroid/view/animation/PathInterpolator;

    invoke-virtual {v2, p2}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    invoke-virtual {p1, v2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    new-instance v3, Landroid/view/animation/ScaleAnimation;

    const/4 v10, 0x1

    const/high16 v11, 0x3f000000    # 0.5f

    const/high16 v4, 0x3f800000    # 1.0f

    const/high16 v5, 0x3fe00000    # 1.75f

    const/high16 v6, 0x3f800000    # 1.0f

    const/high16 v7, 0x3fe00000    # 1.75f

    const/4 v8, 0x1

    const/high16 v9, 0x3f000000    # 0.5f

    invoke-direct/range {v3 .. v11}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    const-wide/16 v4, 0x6e

    invoke-virtual {v3, v4, v5}, Landroid/view/animation/Animation;->setDuration(J)V

    invoke-virtual {v3, v0, v1}, Landroid/view/animation/Animation;->setStartOffset(J)V

    sget-object p2, Llf1;->m:Landroid/view/animation/PathInterpolator;

    invoke-virtual {v3, p2}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    invoke-virtual {p1, v3}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    new-instance v4, Landroid/view/animation/ScaleAnimation;

    const/4 v11, 0x1

    const/high16 v12, 0x3f000000    # 0.5f

    const/high16 v5, 0x3f800000    # 1.0f

    const v6, 0x3f36db6e

    const/high16 v7, 0x3f800000    # 1.0f

    const v8, 0x3f36db6e

    const/4 v9, 0x1

    const/high16 v10, 0x3f000000    # 0.5f

    invoke-direct/range {v4 .. v12}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    const-wide/16 v0, 0xf0

    invoke-virtual {v4, v0, v1}, Landroid/view/animation/Animation;->setDuration(J)V

    const-wide/16 v0, 0xd2

    invoke-virtual {v4, v0, v1}, Landroid/view/animation/Animation;->setStartOffset(J)V

    sget-object p2, Llf1;->h:Landroid/view/animation/PathInterpolator;

    invoke-virtual {v4, p2}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    invoke-virtual {p1, v4}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    iput-object p1, p0, Lnen;->d:Landroid/view/animation/AnimationSet;

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 11

    check-cast p1, Lpen;

    iget-object v0, p1, Lpen;->a:Ljava/lang/Integer;

    iget-object v1, p1, Lpen;->b:Ljava/lang/CharSequence;

    iget-object v2, p0, Lnen;->f:Ljava/util/List;

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-eqz v0, :cond_4c

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    if-nez v2, :cond_14

    move-object v2, v5

    :cond_14
    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_65

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/opera/android/custom_views/StylingImageRadio;

    invoke-virtual {v6}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v7

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_40

    invoke-virtual {v6, v3}, Lnjk;->setChecked(Z)V

    invoke-virtual {v6}, Landroid/widget/ImageView;->clearColorFilter()V

    iget-object v7, p0, Lnen;->d:Landroid/view/animation/AnimationSet;

    invoke-virtual {v6, v7}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_1a

    :cond_40
    invoke-virtual {v6}, Landroid/view/View;->clearAnimation()V

    invoke-virtual {v6, v4}, Lnjk;->setChecked(Z)V

    iget-object v7, p0, Lnen;->c:Landroid/graphics/ColorMatrixColorFilter;

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setColorFilter(Landroid/graphics/ColorFilter;)V

    goto :goto_1a

    :cond_4c
    if-nez v2, :cond_4f

    move-object v2, v5

    :cond_4f
    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_55
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_65

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnjk;

    invoke-virtual {v2}, Landroid/widget/ImageView;->clearColorFilter()V

    goto :goto_55

    :cond_65
    iget-object v0, p0, Lnen;->g:Landroid/widget/Button;

    if-nez v0, :cond_6a

    move-object v0, v5

    :cond_6a
    iget-boolean v2, p1, Lpen;->d:Z

    invoke-virtual {v0, v2}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lnen;->e:Lzu;

    if-nez v0, :cond_74

    move-object v0, v5

    :cond_74
    iget-object v0, v0, Lzu;->d:Lcom/google/android/material/textfield/TextInputLayout;

    iget-boolean v2, p1, Lpen;->c:Z

    if-nez v2, :cond_7c

    const/16 v4, 0x8

    :cond_7c
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lnen;->e:Lzu;

    if-eqz v0, :cond_84

    move-object v5, v0

    :cond_84
    iget-object v0, v5, Lzu;->c:Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-static {v2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_93

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_93
    iget-object p1, p1, Lpen;->e:Leb8;

    if-eqz p1, :cond_b1

    iget-boolean v0, p1, Leb8;->b:Z

    if-nez v0, :cond_b1

    iput-boolean v3, p1, Leb8;->b:Z

    iget-object p1, p1, Leb8;->a:Lek5;

    check-cast p1, Ljava/lang/Void;

    const p1, 0x7f1413bd

    const/16 v0, 0x9c4

    iget-object p0, p0, Lnen;->b:Lysj;

    invoke-static {p1, v0, p0}, Lam2;->i(IILysj;)Lglj;

    move-result-object p1

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    :cond_b1
    return-void
.end method

.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f1403bf

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f141193

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getTheme()I
    .registers 1

    const p0, 0x7f150292

    return p0
.end method

.method public final onCreateDialog(Laz0;)V
    .registers 9

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d046a

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0a089f

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/EqualWidthLinearLayout;

    if-eqz v4, :cond_9a

    const v1, 0x7f0a0c73

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v5, :cond_9a

    const v1, 0x7f0a0c74

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v6, :cond_9a

    new-instance v1, Lzu;

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-direct {v1, v0, v4, v5, v6}, Lzu;-><init>(Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/EqualWidthLinearLayout;Lcom/opera/android/custom_views/OperaTextInputEditText;Lcom/google/android/material/textfield/TextInputLayout;)V

    iput-object v1, p0, Lnen;->e:Lzu;

    new-instance v0, Lg6n;

    invoke-direct {v0, v4}, Lg6n;-><init>(Landroid/view/ViewGroup;)V

    sget-object v1, Lu91;->r:Lu91;

    invoke-static {v0, v1}, Ly1j;->c(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lv39;

    move-result-object v0

    invoke-static {v0}, Ly1j;->g(Lkotlin/sequences/Sequence;)Ljava/util/List;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_51
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_70

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v5, v3, 0x1

    if-ltz v3, :cond_6c

    check-cast v4, Lcom/opera/android/custom_views/StylingImageRadio;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    iput-object p0, v4, Lnjk;->l:Lnen;

    move v3, v5

    goto :goto_51

    :cond_6c
    invoke-static {}, Lj95;->n()V

    throw v2

    :cond_70
    iput-object v0, p0, Lnen;->f:Ljava/util/List;

    iget-object v0, p0, Lnen;->e:Lzu;

    if-nez v0, :cond_77

    move-object v0, v2

    :cond_77
    iget-object v0, v0, Lzu;->c:Lcom/opera/android/custom_views/OperaTextInputEditText;

    new-instance v1, Lh63;

    const/16 v3, 0xa

    invoke-direct {v1, p0, v3}, Lh63;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    const v0, 0x7f1413be

    invoke-virtual {p1, v0}, Laz0;->b(I)V

    const v0, 0x7f1413bb

    invoke-virtual {p1, v0}, Laz0;->a(I)V

    iget-object p0, p0, Lnen;->e:Lzu;

    if-eqz p0, :cond_94

    move-object v2, p0

    :cond_94
    iget-object p0, v2, Lzu;->b:Landroid/widget/LinearLayout;

    invoke-virtual {p1, p0}, Laz0;->setView(Landroid/view/View;)Laz0;

    return-void

    :cond_9a
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final onDismissDialog(Lbz0;Lhjm;)V
    .registers 3

    iget-object p1, p0, Lnen;->a:Lwtm;

    iget-object p1, p1, Lwtm;->b:Ljava/lang/Object;

    check-cast p1, Lh42;

    invoke-virtual {p1, p0}, Lekc;->p(Lf7f;)V

    return-void
.end method

.method public final onFinished(Lhjm;)V
    .registers 3

    sget-object v0, Lhjm;->b:Lhjm;

    if-ne p1, v0, :cond_14

    iget-object p0, p0, Lnen;->a:Lwtm;

    iget-object p1, p0, Lwtm;->c:Ljava/lang/Object;

    check-cast p1, Lkze;

    sget-object v0, Loen;->d:Loen;

    invoke-virtual {p1, v0}, Lekc;->r(Ljava/lang/Object;)V

    sget-object p1, Lvb0;->d:Lvb0;

    invoke-virtual {p0, p1}, Lwtm;->f(Lvb0;)V

    :cond_14
    return-void
.end method

.method public final onNegativeButtonClicked(Lbz0;)V
    .registers 3

    iget-object p0, p0, Lnen;->a:Lwtm;

    iget-object p1, p0, Lwtm;->c:Ljava/lang/Object;

    check-cast p1, Lkze;

    sget-object v0, Loen;->d:Loen;

    invoke-virtual {p1, v0}, Lekc;->r(Ljava/lang/Object;)V

    sget-object p1, Lvb0;->c:Lvb0;

    invoke-virtual {p0, p1}, Lwtm;->f(Lvb0;)V

    return-void
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 5

    iget-object p0, p0, Lnen;->a:Lwtm;

    iget-object p1, p0, Lwtm;->c:Ljava/lang/Object;

    check-cast p1, Lkze;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Loen;

    const/4 v1, 0x0

    const/4 v2, 0x3

    invoke-static {v0, v1, v1, v2}, Loen;->a(Loen;Ljava/lang/Integer;Ljava/lang/CharSequence;I)Loen;

    move-result-object v0

    invoke-virtual {p1, v0}, Lekc;->r(Ljava/lang/Object;)V

    sget-object p1, Lvb0;->b:Lvb0;

    invoke-virtual {p0, p1}, Lwtm;->f(Lvb0;)V

    return-void
.end method

.method public final onShowDialog(Lbz0;)V
    .registers 3

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Lbz0;->f(I)Landroid/widget/Button;

    move-result-object p1

    iput-object p1, p0, Lnen;->g:Landroid/widget/Button;

    iget-object p1, p0, Lnen;->a:Lwtm;

    iget-object p1, p1, Lwtm;->b:Ljava/lang/Object;

    check-cast p1, Lh42;

    invoke-virtual {p1, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method
