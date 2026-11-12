.class public final synthetic Le73;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Le73;->a:B

    iput-object p1, p0, Le73;->b:Ljava/lang/Object;

    iput-object p2, p0, Le73;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 13

    iget-byte v0, p0, Le73;->a:B

    const/4 v1, 0x1

    const v2, 0x7f06063b

    const v3, 0x7f040a16

    iget-object v4, p0, Le73;->c:Ljava/lang/Object;

    iget-object p0, p0, Le73;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_1ee

    check-cast p0, Lnga;

    check-cast v4, Lmqn;

    iget-object p1, v4, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {v3, p1, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    iget v0, p0, Lnga;->a:I

    if-eq p1, v0, :cond_31

    iput p1, p0, Lnga;->a:I

    iget-object v0, p0, Lnga;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/StatusBarDrawingFrameLayout;

    iget p0, p0, Lnga;->b:F

    invoke-static {p0, p1}, Lp37;->j0(FI)I

    move-result p0

    invoke-virtual {v0, p0}, Lcom/opera/android/StatusBarDrawingFrameLayout;->e(I)V

    :cond_31
    return-void

    :pswitch_32
    check-cast p0, Lcom/opera/android/custom_views/VpnProBanner;

    check-cast v4, Landroid/content/Context;

    sget p1, Lcom/opera/android/custom_views/VpnProBanner;->q:I

    const p1, 0x7f0407d5

    invoke-static {p1, v4}, Lf03;->x(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_43
    check-cast p0, Lkdn;

    check-cast v4, Ltah;

    iget-object p0, p0, Lkdn;->b:Lbt1;

    iget-object p0, p0, Lbt1;->d:Lcom/opera/android/custom_views/StylingImageView;

    iget-object p1, v4, Ltah;->d:Ljava/lang/Object;

    check-cast p1, Lydn;

    iget-object p1, p1, Lydn;->c:Lgfn;

    invoke-interface {p1}, Lgfn;->isEnabled()Z

    move-result p1

    if-eqz p1, :cond_5b

    const p1, 0x7f08074b

    goto :goto_5e

    :cond_5b
    const p1, 0x7f080583

    :goto_5e
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    return-void

    :pswitch_62
    move-object v0, p0

    check-cast v0, Lbz0;

    check-cast v4, Lb23;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v4, p0}, Lb23;->j(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v4}, Lb23;->n()Landroid/widget/ImageView$ScaleType;

    move-result-object v2

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v4, p0}, Lb23;->m(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v4, p0}, Lb23;->k(Landroid/content/Context;)I

    move-result p0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {v4, p1}, Lb23;->l(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v5

    move v4, p0

    invoke-static/range {v0 .. v5}, Lphj;->w0(Lbz0;Landroid/graphics/drawable/Drawable;Landroid/widget/ImageView$ScaleType;Landroid/content/res/ColorStateList;ILandroid/content/res/ColorStateList;)V

    return-void

    :pswitch_90
    check-cast p0, Lcom/opera/android/StatusBarDrawingFrameLayout;

    check-cast v4, Lhck;

    iget-object v0, v4, Lhck;->a:Lcxh;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcxh;->a(Landroid/content/Context;)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/opera/android/StatusBarDrawingFrameLayout;->e(I)V

    return-void

    :pswitch_a2
    check-cast p0, Lnga;

    check-cast v4, Lknh;

    iget-object p1, v4, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {v3, p1, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    iget v0, p0, Lnga;->a:I

    if-eq p1, v0, :cond_c3

    iput p1, p0, Lnga;->a:I

    iget-object v0, p0, Lnga;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/StatusBarDrawingFrameLayout;

    iget p0, p0, Lnga;->b:F

    invoke-static {p0, p1}, Lp37;->j0(FI)I

    move-result p0

    invoke-virtual {v0, p0}, Lcom/opera/android/StatusBarDrawingFrameLayout;->e(I)V

    :cond_c3
    return-void

    :pswitch_c4
    check-cast p0, Lkxe;

    check-cast v4, Lvs;

    invoke-virtual {p0, v4}, Lkxe;->H0(Lvs;)V

    return-void

    :pswitch_cc
    check-cast p0, Lnga;

    check-cast v4, Llrc;

    iget-object p1, v4, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {v3, p1, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    iget v0, p0, Lnga;->a:I

    if-eq p1, v0, :cond_ed

    iput p1, p0, Lnga;->a:I

    iget-object v0, p0, Lnga;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/StatusBarDrawingFrameLayout;

    iget p0, p0, Lnga;->b:F

    invoke-static {p0, p1}, Lp37;->j0(FI)I

    move-result p0

    invoke-virtual {v0, p0}, Lcom/opera/android/StatusBarDrawingFrameLayout;->e(I)V

    :cond_ed
    return-void

    :pswitch_ee
    check-cast p0, Lkf;

    check-cast v4, Landroid/content/Context;

    sget p1, Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;->f:I

    iget-object p0, p0, Lkf;->c:Ljava/lang/Object;

    check-cast p0, Landroid/widget/ImageView;

    const p1, 0x7f0602cf

    invoke-static {p1, v4}, Lnb6;->v(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    return-void

    :pswitch_103
    check-cast p0, Lcom/opera/android/FullscreenWebActivity;

    check-cast v4, Landroidx/appcompat/widget/Toolbar;

    sget-object p1, Lcom/opera/android/FullscreenWebActivity;->I:Ljava/util/HashSet;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/FullscreenWebActivity;->l0(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {v4, p0}, Landroidx/appcompat/widget/Toolbar;->A(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_115
    check-cast p0, Ltu8;

    check-cast v4, Landroid/view/View;

    new-instance p1, Landroid/util/TypedValue;

    invoke-direct {p1}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    const v2, 0x7f040485

    invoke-virtual {v0, v2, p1, v1}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget-object p0, p0, Ltu8;->e:Landroid/widget/ImageView;

    iget p1, p1, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void

    :pswitch_134
    check-cast p0, Ljava/util/concurrent/atomic/AtomicInteger;

    check-cast v4, Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/TextView;->getCurrentHintTextColor()I

    move-result p1

    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    invoke-virtual {v4}, Landroid/view/View;->hasFocus()Z

    move-result p0

    if-eqz p0, :cond_149

    const/4 p0, 0x0

    invoke-virtual {v4, p0}, Landroid/widget/TextView;->setHintTextColor(I)V

    :cond_149
    return-void

    :pswitch_14a
    check-cast p0, Lx77;

    check-cast v4, Ldkf;

    iget-object p0, p0, Lx77;->d:Ljava/lang/Object;

    move-object v5, p0

    check-cast v5, Lbz0;

    const p0, 0x7f080637

    invoke-static {p0, v4}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    sget-object v7, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    const p0, 0x7f04052c

    invoke-static {p0, v4}, Lf03;->W(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v8

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-static/range {v5 .. v10}, Lphj;->w0(Lbz0;Landroid/graphics/drawable/Drawable;Landroid/widget/ImageView$ScaleType;Landroid/content/res/ColorStateList;ILandroid/content/res/ColorStateList;)V

    return-void

    :pswitch_169
    check-cast p0, Lat5;

    check-cast v4, Leri;

    const v0, 0x7f0a0322

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iget-object p0, p0, Ldej;->b:Lmej;

    invoke-interface {p0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v1, 0x41c00000    # 24.0f

    invoke-static {v1, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v0

    invoke-interface {p0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {v4, p0, v0}, Leti;->d(Leri;Landroid/content/Context;I)Landroid/graphics/drawable/LayerDrawable;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_192
    check-cast p0, Lo85;

    check-cast v4, Lize;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lrmn;

    invoke-virtual {p0, p1}, Lo85;->f(Lrmn;)V

    iget-object p1, p0, Lo85;->b:Lu85;

    iget-object p1, p1, Lu85;->k:Ljava/lang/Object;

    check-cast p1, Lpde;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lq85;

    invoke-virtual {p0, p1}, Lo85;->a(Lq85;)V

    return-void

    :pswitch_1af
    check-cast p0, Lf73;

    check-cast v4, Lac1;

    iget-object p0, p0, Lf73;->d:Lowc;

    iget-object p0, p0, Lowc;->f:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget v0, v4, Lac1;->b:I

    const v1, 0x7f0602c4

    invoke-static {v0, p1, v1}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    if-nez v0, :cond_1d2

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    :cond_1d2
    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/StylingImageView;->c(Landroid/content/res/ColorStateList;)V

    return-void

    :pswitch_1d6
    check-cast p0, Lf73;

    check-cast v4, Lfdn;

    iget-object p0, p0, Lf73;->d:Lowc;

    iget-object p0, p0, Lowc;->c:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget v0, v4, Lfdn;->h:I

    iget v2, v4, Lfdn;->i:I

    invoke-static {v1, p1, v0, v2}, Lddh;->o(ZLandroid/content/Context;II)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_data_1ee
    .packed-switch 0x0
        :pswitch_1d6
        :pswitch_1af
        :pswitch_192
        :pswitch_169
        :pswitch_14a
        :pswitch_134
        :pswitch_115
        :pswitch_103
        :pswitch_ee
        :pswitch_cc
        :pswitch_c4
        :pswitch_a2
        :pswitch_90
        :pswitch_62
        :pswitch_43
        :pswitch_32
    .end packed-switch
.end method
