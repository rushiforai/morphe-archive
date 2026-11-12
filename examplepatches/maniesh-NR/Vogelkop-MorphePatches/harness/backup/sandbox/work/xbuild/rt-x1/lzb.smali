.class public final synthetic Llzb;
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

    iput-byte p2, p0, Llzb;->a:B

    iput-object p1, p0, Llzb;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 7

    iget-byte v0, p0, Llzb;->a:B

    const/4 v1, 0x0

    const v2, 0x7f06063b

    iget-object p0, p0, Llzb;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_326

    check-cast p0, Lcom/opera/android/custom_views/OperaActionMenuItemView;

    sget v0, Lcom/opera/android/custom_views/OperaActionMenuItemView;->r:I

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lcom/opera/android/custom_views/OperaActionMenuItemView;->s()Z

    move-result p0

    if-eqz p0, :cond_1d

    const p0, 0x7f040846

    goto :goto_20

    :cond_1d
    const p0, 0x7f040005

    :goto_20
    invoke-static {p0, v0}, Lf03;->x(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_28
    check-cast p0, Llhf;

    iget-object p0, p0, Llhf;->c:Lc1f;

    if-eqz p0, :cond_31

    invoke-virtual {p0}, Lc1f;->e()V

    :cond_31
    return-void

    :pswitch_32
    check-cast p0, Lz4o;

    check-cast p0, Lkhf;

    iget-object p1, p0, Lkhf;->r:Lcom/opera/android/OverlaidStatusBarDrawingView;

    iget-object p0, p0, Lkhf;->s:Lfxh;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcxh;->a(Landroid/content/Context;)I

    move-result p0

    iget v0, p1, Lcom/opera/android/OverlaidStatusBarDrawingView;->e:I

    if-eq p0, v0, :cond_52

    iput p0, p1, Lcom/opera/android/OverlaidStatusBarDrawingView;->e:I

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    iget-object p0, p1, Lcom/opera/android/OverlaidStatusBarDrawingView;->c:Lc1f;

    if-eqz p0, :cond_52

    invoke-virtual {p0}, Lc1f;->e()V

    :cond_52
    return-void

    :pswitch_53
    check-cast p0, Lpdf;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lf03;->I(Landroid/content/Context;)Z

    move-result p1

    iget-object p0, p0, Lpdf;->h:Lmcj;

    invoke-virtual {p0, p1}, Lmcj;->t(Z)V

    invoke-virtual {p0, p1}, Lmcj;->r(Z)V

    return-void

    :pswitch_66
    check-cast p0, Lvbf;

    iget-boolean v0, p0, Lvbf;->o:Z

    if-eqz v0, :cond_70

    const v0, 0x7f0409be

    goto :goto_73

    :cond_70
    const v0, 0x7f0409c4

    :goto_73
    iget-object v1, p0, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v0, v2}, Lf03;->W(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setHintTextColor(Landroid/content/res/ColorStateList;)V

    iget-object p0, p0, Lvbf;->q:Lv73;

    iget-object v0, p0, Lv73;->a:Ljava/util/EnumMap;

    invoke-virtual {v0}, Ljava/util/EnumMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_8c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_9e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Luaf;

    iget-object v2, p0, Lv73;->b:Landroid/content/Context;

    invoke-virtual {v1, v2}, Luaf;->a(Landroid/content/Context;)V

    goto :goto_8c

    :cond_9e
    new-instance p0, Lrqd;

    const/16 v0, 0x1d

    invoke-direct {p0, v0}, Lrqd;-><init>(B)V

    const-class v0, Lcom/opera/android/bar/OmniButtonView;

    invoke-static {p1, v0, p0}, Lq9n;->J(Landroid/view/View;Ljava/lang/Class;Lp9n;)V

    return-void

    :pswitch_ab
    check-cast p0, Lk5o;

    iget-object p1, p0, Lk5o;->b:Ljava/lang/Object;

    check-cast p1, Lor2;

    iget-object p1, p1, Lor2;->e:Ljava/lang/Object;

    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout;

    iget-object p0, p0, Lk5o;->c:Ljava/lang/Object;

    check-cast p0, Ltsd;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lv8k;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lv8k;->d(Landroid/content/Context;)I

    move-result p0

    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    return-void

    :pswitch_cf
    check-cast p0, Lkxe;

    iget-object p0, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f040a16

    invoke-static {v0, p1, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/opera/android/StatusBarDrawingFrameLayout;->e(I)V

    return-void

    :pswitch_e2
    check-cast p0, Ljve;

    invoke-virtual {p0}, Ljve;->j0()V

    return-void

    :pswitch_e8
    check-cast p0, Live;

    invoke-virtual {p0}, Live;->m0()V

    return-void

    :pswitch_ee
    check-cast p0, Lpte;

    invoke-virtual {p0}, Lpte;->J0()V

    return-void

    :pswitch_f4
    check-cast p0, Llqe;

    invoke-virtual {p0}, Llqe;->b()V

    return-void

    :pswitch_fa
    check-cast p0, Lcom/opera/android/flow/MyFlowMessageRoot;

    sget p1, Lcom/opera/android/flow/MyFlowMessageRoot;->l:I

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0803c8

    invoke-static {v0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->d:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0803c7

    invoke-static {v0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->e:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0803c9

    invoke-static {v0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->f:Landroid/graphics/drawable/Drawable;

    iget-object p1, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->d:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-object p1, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->e:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-object p1, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->f:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-object p1, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->d:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    iget-object p1, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->e:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    iget-object p1, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->f:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_153
    check-cast p0, Lcge;

    iget-object p0, p0, Lcge;->d:Landroid/text/TextPaint;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lf03;->F(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_16a
    check-cast p0, Lfge;

    iget-object p0, p0, Lfge;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lf03;->G(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p1

    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    sget-object v2, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    const/4 v3, 0x0

    invoke-static {p1, v3}, Lp37;->m0(II)I

    move-result v4

    filled-new-array {v4, p1, p1}, [I

    move-result-object p1

    invoke-direct {v0, v2, p1}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    const/high16 p1, 0x42800000    # 64.0f

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {p1, v2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    invoke-virtual {v0, v3, p1}, Landroid/graphics/drawable/GradientDrawable;->setSize(II)V

    new-instance p1, Lw3a;

    const/16 v2, 0x57

    invoke-direct {p1, v0, v2, v3}, Lw3a;-><init>(Landroid/graphics/drawable/Drawable;IZ)V

    iget-object v0, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->U0:Lw3a;

    if-eqz v0, :cond_1a5

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    :cond_1a5
    iput-object p1, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->U0:Lw3a;

    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_1ae
    check-cast p0, Lrhj;

    invoke-virtual {p0}, Lrhj;->d()V

    return-void

    :pswitch_1b4
    check-cast p0, Ld0e;

    invoke-virtual {p0}, Ld0e;->X()V

    return-void

    :pswitch_1ba
    check-cast p0, Ldwd;

    invoke-virtual {p0, p1}, Ldwd;->f(Landroid/view/View;)V

    return-void

    :pswitch_1c0
    check-cast p0, Lcmd;

    iget-object p1, p0, Lcmd;->g:Lkg7;

    if-eqz p1, :cond_1cc

    invoke-virtual {p0}, Lcmd;->U()V

    invoke-virtual {p0}, Lcmd;->V()V

    :cond_1cc
    return-void

    :pswitch_1cd
    check-cast p0, Lcom/opera/android/media/MediaPlayerMini;

    sget p1, Lcom/opera/android/media/MediaPlayerMini;->d:I

    iget-object p0, p0, Lcom/opera/android/media/MediaPlayerMini;->c:Lmig;

    invoke-virtual {p0}, Lmig;->g()V

    return-void

    :pswitch_1d7
    check-cast p0, Lwub;

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f040205

    invoke-static {v0, p1, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/opera/android/StatusBarDrawingFrameLayout;->e(I)V

    return-void

    :pswitch_1ec
    check-cast p0, Li7d;

    iget-object p0, p0, Li7d;->p:Lnga;

    if-eqz p0, :cond_210

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0402ed

    invoke-static {v0, p1, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    iget v0, p0, Lnga;->a:I

    if-eq p1, v0, :cond_210

    iput p1, p0, Lnga;->a:I

    iget-object v0, p0, Lnga;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/StatusBarDrawingFrameLayout;

    iget p0, p0, Lnga;->b:F

    invoke-static {p0, p1}, Lp37;->j0(FI)I

    move-result p0

    invoke-virtual {v0, p0}, Lcom/opera/android/StatusBarDrawingFrameLayout;->e(I)V

    :cond_210
    return-void

    :pswitch_211
    check-cast p0, Lbpd;

    invoke-virtual {p0}, Lbpd;->b0()V

    return-void

    :pswitch_217
    check-cast p0, Lhwc;

    iget-object p1, p0, Lhwc;->e:Ljava/lang/String;

    if-eqz p1, :cond_220

    invoke-virtual {p0, p1}, Lhwc;->c0(Ljava/lang/String;)V

    :cond_220
    return-void

    :pswitch_221
    check-cast p0, Ldvc;

    iget-object p1, p0, Ldvc;->v:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/View;->hasFocus()Z

    move-result p1

    iget-object v0, p0, Ldvc;->u:Lcom/opera/android/custom_views/ActionBarSearchView;

    if-eqz v0, :cond_248

    if-eqz p1, :cond_236

    const p0, 0x7f0807f0

    invoke-virtual {v0, p0}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_248

    :cond_236
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0401de

    invoke-static {v0, p1}, Lf03;->x(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_248

    iget-object p0, p0, Ldvc;->u:Lcom/opera/android/custom_views/ActionBarSearchView;

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :cond_248
    :goto_248
    return-void

    :pswitch_249
    check-cast p0, Llrc;

    iget-object p0, p0, Llrc;->s:Lqrc;

    iget-object p0, p0, Lqrc;->a:Lurc;

    iget-object p0, p0, Lurc;->i:Leyi;

    iget-object p1, p0, Leyi;->d:Ljava/lang/Object;

    check-cast p1, Lkze;

    iget-object v0, p0, Leyi;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    iget-boolean p0, p0, Leyi;->b:Z

    if-eqz p0, :cond_260

    const-string p0, "ofa-private-mode"

    goto :goto_26c

    :cond_260
    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->g()Lg7j;

    move-result-object p0

    iget-object p0, p0, Lg7j;->d:Ljava/lang/String;

    const-string v0, "ofa-"

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :goto_26c
    invoke-static {p1, p0}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    return-void

    :pswitch_270
    check-cast p0, Lor2;

    iget-object p0, p0, Lor2;->c:Landroid/view/View;

    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0807eb

    invoke-static {v0, p1}, Lw8h;->u(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_285
    check-cast p0, Lcom/opera/android/custom_views/LineHeaderTextView;

    sget p1, Lcom/opera/android/custom_views/LineHeaderTextView;->p:I

    iget-object p1, p0, Lcom/opera/android/custom_views/LineHeaderTextView;->o:Landroid/graphics/Paint;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f04084a

    const v2, 0x7f0600a8

    invoke-static {v1, v0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_2a0
    check-cast p0, Lcom/opera/android/bar/LimitedSideActionsAppbar;

    sget p1, Lcom/opera/android/bar/LimitedSideActionsAppbar;->e:I

    iget-object p1, p0, Lcom/opera/android/bar/LimitedSideActionsAppbar;->d:Liec;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f040057

    const v2, 0x7f0600a7

    invoke-static {v1, v0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    const v1, 0x7f040058

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {v1, p0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    iget v1, p1, Liec;->d:I

    if-ne v0, v1, :cond_2c7

    iget v1, p1, Liec;->e:I

    if-eq p0, v1, :cond_2d0

    :cond_2c7
    iput v0, p1, Liec;->d:I

    iput p0, p1, Liec;->e:I

    iget-object p0, p1, Liec;->h:Lcom/opera/android/bar/LimitedSideActionsAppbar;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_2d0
    return-void

    :pswitch_2d1
    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionActionBarContextView;

    sget p1, Lcom/opera/android/custom_views/LayoutDirectionActionBarContextView;->H:I

    iget-object p1, p0, Landroidx/appcompat/widget/ActionBarContextView;->c:Lqe;

    if-eqz p1, :cond_2fc

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lf03;->v(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    iget-object v0, p0, Landroidx/appcompat/widget/ActionBarContextView;->c:Lqe;

    invoke-virtual {v0}, Lqe;->j()Litd;

    iget-object v0, v0, Lqe;->t:Lne;

    iget-object v0, v0, Lne;->g:Lme;

    if-eqz v0, :cond_2f0

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    :cond_2f0
    invoke-static {v1, p1}, Lj14;->o0(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    iget-object p0, p0, Landroidx/appcompat/widget/ActionBarContextView;->c:Lqe;

    invoke-virtual {p0}, Lqe;->j()Litd;

    move-result-object p0

    invoke-static {p0, p1}, Lj14;->p0(Litd;Landroid/content/res/ColorStateList;)V

    :cond_2fc
    return-void

    :pswitch_2fd
    check-cast p0, Lmzb;

    iget-object p1, p0, Lmzb;->d:Lswc;

    iget-object p1, p1, Lswc;->c:Lcom/opera/android/custom_views/StylingTextView;

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object p0, p0, Lmzb;->e:Ltah;

    iget-object p0, p0, Ltah;->d:Ljava/lang/Object;

    check-cast p0, Lydn;

    iget-object p0, p0, Lydn;->c:Lgfn;

    invoke-interface {p0}, Lgfn;->isEnabled()Z

    move-result p0

    if-eqz p0, :cond_31b

    const p0, 0x7f0407da

    goto :goto_31e

    :cond_31b
    const p0, 0x7f040203

    :goto_31e
    invoke-static {p0, v0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    return-void

    :pswitch_data_326
    .packed-switch 0x0
        :pswitch_2fd
        :pswitch_2d1
        :pswitch_2a0
        :pswitch_285
        :pswitch_270
        :pswitch_249
        :pswitch_221
        :pswitch_217
        :pswitch_211
        :pswitch_1ec
        :pswitch_1d7
        :pswitch_1cd
        :pswitch_1c0
        :pswitch_1ba
        :pswitch_1b4
        :pswitch_1ae
        :pswitch_16a
        :pswitch_153
        :pswitch_fa
        :pswitch_f4
        :pswitch_ee
        :pswitch_e8
        :pswitch_e2
        :pswitch_cf
        :pswitch_ab
        :pswitch_66
        :pswitch_53
        :pswitch_32
        :pswitch_28
    .end packed-switch
.end method
