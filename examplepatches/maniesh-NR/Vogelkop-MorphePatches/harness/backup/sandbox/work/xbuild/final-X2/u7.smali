.class public final synthetic Lu7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lu7;->a:B

    iput-object p1, p0, Lu7;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 7

    iget-byte v0, p0, Lu7;->a:B

    const/4 v1, 0x0

    const v2, 0x7f0402af

    const/4 v3, 0x0

    const v4, 0x7f06063b

    iget-object p0, p0, Lu7;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_314

    check-cast p0, Lh85;

    invoke-virtual {p0}, Lh85;->Z()V

    return-void

    :pswitch_15
    check-cast p0, Ll55;

    iget-object p1, p0, Lfmj;->d:Lfqk;

    if-eqz p1, :cond_2e

    iget-object p1, p1, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iget-object p1, p1, Lcom/opera/android/suggestion/Suggestion;->d:Ljava/lang/String;

    if-nez p1, :cond_2e

    iget-object p0, p0, Lfmj;->b:Lcom/opera/android/suggestion/adapter/SuggestionListItem;

    new-instance p1, Ldxh;

    const v0, 0x7f04052c

    invoke-direct {p1, v0}, Ldxh;-><init>(I)V

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->x(Lcxh;)V

    :cond_2e
    return-void

    :pswitch_2f
    check-cast p0, Lac1;

    invoke-virtual {p0}, Lac1;->l()V

    return-void

    :pswitch_35
    check-cast p0, Lal4;

    iget-object p1, p0, Lal4;->c:Lcom/opera/android/autofill/CreditCard;

    if-eqz p1, :cond_57

    iget-object v0, p0, Lal4;->b:Lvs;

    iget-object v0, v0, Lvs;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    iget p1, p1, Lcom/opera/android/autofill/CreditCard;->f:I

    invoke-static {p1, p0}, Ly9m;->V(ILandroid/content/Context;)I

    move-result p1

    if-nez p1, :cond_54

    const/4 p1, 0x5

    invoke-static {p1, p0}, Ly9m;->V(ILandroid/content/Context;)I

    move-result p1

    :cond_54
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    :cond_57
    return-void

    :pswitch_58
    check-cast p0, Lcom/opera/android/bubbleview/BubbleView;

    sget p1, Lcom/opera/android/bubbleview/BubbleView;->D:I

    invoke-virtual {p0}, Lcom/opera/android/bubbleview/BubbleView;->b()V

    return-void

    :pswitch_60
    check-cast p0, Lcom/opera/android/browser/BrowserFragment;

    iget-object v0, p0, Lcom/opera/android/browser/BrowserFragment;->g:Lk6l;

    invoke-virtual {v0}, Lk6l;->z()V

    iget-object p0, p0, Lcom/opera/android/browser/BrowserFragment;->d:Lb7f;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lf03;->H(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_76

    const/high16 p1, -0x1000000

    goto :goto_77

    :cond_76
    const/4 p1, -0x1

    :goto_77
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Lb7f;->d(Ljava/lang/Object;)V

    return-void

    :pswitch_7f
    check-cast p0, Lcom/opera/android/BrowserActivity;

    sget p1, Lcom/opera/android/BrowserActivity;->E1:I

    new-instance p1, Ls8n;

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->Q:Lcom/opera/android/RootView;

    if-nez v0, :cond_8a

    move-object v0, v3

    :cond_8a
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f040557

    invoke-direct {p1, v0, v1}, Ls8n;-><init>(Landroid/content/Context;I)V

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->Q:Lcom/opera/android/RootView;

    if-nez v0, :cond_99

    move-object v0, v3

    :cond_99
    const v1, 0x7f04073f

    invoke-static {v1, p1, v4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    iget v2, v0, Lcom/opera/android/RootView;->s:I

    if-eq v1, v2, :cond_ac

    iput v1, v0, Lcom/opera/android/RootView;->s:I

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    invoke-virtual {v0}, Lcom/opera/android/RootView;->f()V

    :cond_ac
    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->Q:Lcom/opera/android/RootView;

    if-eqz p0, :cond_b1

    move-object v3, p0

    :cond_b1
    const p0, 0x7f040740

    invoke-static {p0, p1, v4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    iget p1, v3, Lcom/opera/android/RootView;->t:I

    if-eq p0, p1, :cond_c4

    iput p0, v3, Lcom/opera/android/RootView;->t:I

    invoke-virtual {v3}, Landroid/view/View;->invalidate()V

    invoke-virtual {v3}, Lcom/opera/android/RootView;->f()V

    :cond_c4
    return-void

    :pswitch_c5
    check-cast p0, Ltq3;

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p0

    if-eqz p0, :cond_df

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0400ec

    invoke-static {v0, p1, v4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-static {p1}, Lp37;->u0(I)Z

    move-result p1

    invoke-static {p0, p1}, Lmcj;->s(Landroid/view/Window;Z)Z

    :cond_df
    return-void

    :pswitch_e0
    check-cast p0, Lpjn;

    iget-object p0, p0, Lpjn;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/TabCountButton;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lf03;->v(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/TabCountButton;->f(Landroid/content/res/ColorStateList;)V

    return-void

    :pswitch_f2
    check-cast p0, Li3j;

    invoke-virtual {p0}, Li3j;->i()V

    iget-object p0, p0, Li3j;->c:Ljava/lang/Object;

    check-cast p0, Lfwk;

    invoke-virtual {p0}, Lfwk;->jumpToCurrentState()V

    return-void

    :pswitch_ff
    check-cast p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;

    sget-object v0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->i:Landroid/view/animation/PathInterpolator;

    iget-object v0, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->b:Landroid/graphics/Paint;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lf03;->C(Landroid/content/Context;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_114
    check-cast p0, Lcom/opera/android/bar/BottomBar;

    sget-boolean p1, Lcom/opera/android/bar/BottomBar;->r:Z

    iget-object p1, p0, Lcom/opera/android/bar/BottomBar;->l:Landroid/graphics/Paint;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const v0, 0x7f04084a

    const v1, 0x7f0600a8

    invoke-static {v0, p0, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setColor(I)V

    return-void

    :pswitch_12c
    check-cast p0, Lcom/opera/android/settings/BigSwitchButton;

    sget-object p1, Lcom/opera/android/settings/BigSwitchButton;->j:Lk2d;

    invoke-virtual {p0}, Lcom/opera/android/settings/BigSwitchButton;->a()V

    invoke-virtual {p0}, Lcom/opera/android/settings/BigSwitchButton;->e()V

    return-void

    :pswitch_137
    check-cast p0, Lx83;

    invoke-virtual {p0, p1}, Lx83;->q(Landroid/view/View;)V

    return-void

    :pswitch_13d
    check-cast p0, Ls63;

    iget-boolean p0, p0, Ls63;->i:Z

    if-eqz p0, :cond_14f

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const v0, 0x7f0403ad

    invoke-static {v0, p0, v4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    goto :goto_15b

    :cond_14f
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lf03;->G(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p0

    :goto_15b
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundColor(I)V

    return-void

    :pswitch_15f
    check-cast p0, Lg53;

    invoke-virtual {p0, p1}, Lg53;->L0(Landroid/view/View;)V

    check-cast p1, Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p1}, Landroidx/appcompat/widget/Toolbar;->q()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    if-eqz p0, :cond_17d

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f040216

    const v1, 0x7f061084

    invoke-static {v0, p1, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-static {p0, p1}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    :cond_17d
    return-void

    :pswitch_17e
    check-cast p0, Ljv2;

    invoke-virtual {p0}, Ljv2;->U()V

    return-void

    :pswitch_184
    check-cast p0, Lmr2;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0402d7

    const v1, 0x7f0602c4

    invoke-static {v0, p1, v1}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    if-eqz p1, :cond_1a2

    iget-object p0, p0, Lmr2;->y:Lfr2;

    if-eqz p0, :cond_19b

    move-object v3, p0

    :cond_19b
    iget-object p0, v3, Lfr2;->b:Landroid/graphics/drawable/Drawable;

    if-eqz p0, :cond_1a2

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    :cond_1a2
    return-void

    :pswitch_1a3
    check-cast p0, Lav1;

    iget-object p1, p0, Lav1;->c:Lf7j;

    if-eqz p1, :cond_1b2

    iget-object v0, p0, Lav1;->b:Lcq3;

    iget-object v0, v0, Lcq3;->b:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/ThemeSelector;

    invoke-virtual {p0, p1, v0}, Lav1;->U(Lf7j;Lcom/opera/android/custom_views/ThemeSelector;)V

    :cond_1b2
    return-void

    :pswitch_1b3
    check-cast p0, Lzu1;

    iget-object p1, p0, Lzu1;->c:Lg7j;

    if-eqz p1, :cond_1c2

    iget-object p0, p0, Lzu1;->b:Lcq3;

    iget-object p0, p0, Lcq3;->b:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/AccentSelector;

    invoke-static {p1, p0}, Lzu1;->U(Lg7j;Lcom/opera/android/custom_views/AccentSelector;)V

    :cond_1c2
    return-void

    :pswitch_1c3
    check-cast p0, Lcom/opera/android/custom_views/AnimationEmptyListView;

    iget-object p1, p0, Lcom/opera/android/custom_views/AnimationEmptyListView;->a:Lov0;

    iget-object v0, p1, Lov0;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0402ed

    invoke-static {v1, v0, v4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    iget-object p1, p1, Lov0;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {v2, p1, v4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-static {v0, p1}, Lp37;->r(II)I

    move-result p1

    iput p1, p0, Lcom/opera/android/custom_views/AnimationEmptyListView;->d:I

    return-void

    :pswitch_1e9
    check-cast p0, Luk6;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object p0, p0, Luk6;->b:Ljava/lang/Object;

    check-cast p0, Lvv3;

    invoke-virtual {p0, v0}, Lvv3;->getPositiveButtonIcon(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f07006a

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p0, v1, v1, v0, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    check-cast p1, Landroid/widget/Button;

    invoke-virtual {p1, p0, v3, v3, v3}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_20f
    check-cast p0, Ls10;

    invoke-virtual {p0}, Ls10;->i0()V

    invoke-virtual {p0}, Ls10;->f0()V

    return-void

    :pswitch_218
    check-cast p0, Lws;

    iget-object p1, p0, Lws;->d:Lts;

    if-eqz p1, :cond_233

    iget-object p0, p0, Lws;->b:Lvs;

    iget-object p0, p0, Lvs;->b:Landroid/view/ViewGroup;

    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object p1, p1, Lts;->a:Lkq8;

    iget p1, p1, Lkq8;->b:I

    invoke-static {p1, v0}, Lf03;->W(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    :cond_233
    return-void

    :pswitch_234
    check-cast p0, Lq87;

    iget-object p1, p0, Lq87;->b:Landroid/content/Context;

    const v0, 0x1010214

    filled-new-array {v0}, [I

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    invoke-virtual {v0, v1, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    if-eqz v1, :cond_24d

    invoke-static {v1, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    :cond_24d
    iput-object v3, p0, Lq87;->d:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    return-void

    :pswitch_253
    check-cast p0, Lcom/opera/android/ads/AdStarRatingView;

    sget v0, Lcom/opera/android/ads/AdStarRatingView;->h:I

    iget-object p0, p0, Lcom/opera/android/ads/AdStarRatingView;->d:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f040260

    invoke-static {v0, p1, v4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    sget-object v0, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {p0, p1, v0}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    return-void

    :pswitch_26a
    check-cast p0, Lwk;

    invoke-virtual {p0}, Lwk;->H0()V

    return-void

    :pswitch_270
    check-cast p0, Ltf;

    invoke-virtual {p0}, Ltf;->U()V

    return-void

    :pswitch_276
    check-cast p0, Lcom/opera/android/custom_views/ActionBarSearchView;

    sget p1, Lcom/opera/android/custom_views/ActionBarSearchView;->j0:I

    const p1, 0x7f0a0946

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v2, v0, v4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setHintTextColor(I)V

    const-string v0, "mSearchHintIcon"

    invoke-static {p0, v0}, Lmzg;->h(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_2ad

    invoke-virtual {p1}, Landroid/widget/TextView;->getHintTextColors()Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p1

    invoke-static {v1, p1}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    invoke-static {p0, v1, v0}, Lmzg;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Landroidx/appcompat/widget/SearchView;->getQueryHint()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/SearchView;->setQueryHint(Ljava/lang/CharSequence;)V

    :cond_2ad
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lf03;->v(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    const v0, 0x7f0a0935

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_2cd

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_2cd
    const v0, 0x7f0a0937

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_2e6

    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v2

    invoke-static {v1, v2}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_2e6
    const v0, 0x7f0a0940

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_2fe

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_2fe
    return-void

    :pswitch_2ff
    check-cast p0, Lcom/opera/android/custom_views/AccentSelector;

    sget p1, Lcom/opera/android/custom_views/AccentSelector;->n:I

    iget-object p1, p0, Lcom/opera/android/custom_views/AccentSelector;->m:Lsll;

    iget-object v0, p1, Lsll;->a:Landroid/content/Context;

    iget v1, p1, Lsll;->b:I

    invoke-static {v1, v0}, Lf03;->W(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/RippleDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_data_314
    .packed-switch 0x0
        :pswitch_2ff
        :pswitch_276
        :pswitch_270
        :pswitch_26a
        :pswitch_253
        :pswitch_234
        :pswitch_218
        :pswitch_20f
        :pswitch_1e9
        :pswitch_1c3
        :pswitch_1b3
        :pswitch_1a3
        :pswitch_184
        :pswitch_17e
        :pswitch_15f
        :pswitch_13d
        :pswitch_137
        :pswitch_12c
        :pswitch_114
        :pswitch_ff
        :pswitch_f2
        :pswitch_e0
        :pswitch_c5
        :pswitch_7f
        :pswitch_60
        :pswitch_58
        :pswitch_35
        :pswitch_2f
        :pswitch_15
    .end packed-switch
.end method
