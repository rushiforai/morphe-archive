.class public final synthetic Lpc5;
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

    .line 9
    iput-byte p2, p0, Lpc5;->a:B

    iput-object p1, p0, Lpc5;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ltc6;Lcom/opera/android/widget/GraphView;)V
    .registers 3

    const/4 p1, 0x3

    iput-byte p1, p0, Lpc5;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lpc5;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 6

    iget-byte v0, p0, Lpc5;->a:B

    const v1, 0x7f0402f3

    const/4 v2, 0x0

    const v3, 0x7f06063b

    iget-object p0, p0, Lpc5;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_29a

    check-cast p0, Lrkb;

    invoke-virtual {p0}, Lrkb;->e()V

    return-void

    :pswitch_14
    check-cast p0, Ljba;

    iget-object p1, p0, Ljba;->b:Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/ColorDrawable;->getAlpha()I

    move-result v0

    iget-object v1, p0, Ljba;->a:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lf03;->C(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {p1, v3}, Landroid/graphics/drawable/ColorDrawable;->setColor(I)V

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/ColorDrawable;->setAlpha(I)V

    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    instance-of v0, p1, Ljba;

    if-nez v0, :cond_4d

    invoke-static {p1}, Ljava/util/Optional;->ofNullable(Ljava/lang/Object;)Ljava/util/Optional;

    move-result-object p1

    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p1, v0}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/drawable/Drawable;

    iput-object p1, p0, Ljba;->d:Landroid/graphics/drawable/Drawable;

    const/16 v0, 0x4d2

    invoke-virtual {p0, v0, p1}, Landroid/graphics/drawable/LayerDrawable;->setDrawableByLayerId(ILandroid/graphics/drawable/Drawable;)Z

    invoke-virtual {v1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :cond_4d
    return-void

    :pswitch_4e
    check-cast p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;

    sget-object p1, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->p:Lrxh;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->a(Z)V

    return-void

    :pswitch_57
    check-cast p0, Lr8a;

    iget-object p0, p0, Lr8a;->c:Landroid/text/TextPaint;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lf03;->F(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColor(I)V

    return-void

    :pswitch_6b
    check-cast p0, Lne5;

    iget-object p1, p0, Lne5;->g:Ljava/lang/Object;

    check-cast p1, Ltsd;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcyj;

    iget-object p1, p1, Lcyj;->h:Lpxj;

    invoke-virtual {p0, p1}, Lne5;->n(Lpxj;)V

    return-void

    :pswitch_7d
    check-cast p0, Ld5a;

    invoke-virtual {p0}, Ld5a;->c()V

    return-void

    :pswitch_83
    check-cast p0, Lb5a;

    iget-object p1, p0, Lb5a;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget v1, p0, Lb5a;->d:I

    invoke-static {v1, v0, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lb5a;->l:I

    iget-object p0, p0, Lb5a;->k:Ljava/util/WeakHashMap;

    invoke-virtual {p0}, Ljava/util/WeakHashMap;->clear()V

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_9c
    check-cast p0, Lcd9;

    iget p1, p0, Lcd9;->n:I

    const/4 v0, 0x3

    if-eq p1, v0, :cond_aa

    iget-object p1, p0, Lcd9;->s:Ljava/lang/String;

    if-eqz p1, :cond_aa

    invoke-virtual {p0, p1}, Lcd9;->C0(Ljava/lang/String;)V

    :cond_aa
    return-void

    :pswitch_ab
    check-cast p0, Lac9;

    iget-object p0, p0, Lab2;->b:Lja2;

    instance-of v0, p1, Landroid/widget/ImageView;

    if-eqz v0, :cond_c2

    instance-of v0, p0, Lzb9;

    if-eqz v0, :cond_c2

    check-cast p0, Lzb9;

    check-cast p1, Landroid/widget/ImageView;

    iget-object v0, p0, Lzb9;->e:Ljava/lang/String;

    iget-object p0, p0, Lzb9;->f:Ljava/lang/String;

    invoke-static {p1, v0, p0}, Lbc9;->u(Landroid/widget/ImageView;Ljava/lang/String;Ljava/lang/String;)V

    :cond_c2
    return-void

    :pswitch_c3
    check-cast p0, Lcom/opera/android/bar/FindInPage;

    sget p1, Lcom/opera/android/bar/FindInPage;->w:I

    iget-object p1, p0, Lcom/opera/android/bar/FindInPage;->k:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lcom/opera/android/bar/FindInPage;->k:Landroid/widget/TextView;

    iget v1, p0, Lcom/opera/android/bar/FindInPage;->e:I

    if-lez v1, :cond_da

    iget-object p0, p0, Lcom/opera/android/bar/FindInPage;->l:Lcom/opera/android/custom_views/ObservableEditText;

    invoke-virtual {p0}, Landroid/widget/TextView;->getHintTextColors()Landroid/content/res/ColorStateList;

    move-result-object p0

    goto :goto_de

    :cond_da
    invoke-static {p1}, Lf03;->y(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    :goto_de
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    return-void

    :pswitch_e2
    check-cast p0, Lxv8;

    iget-boolean p1, p0, Lxv8;->z:Z

    iget-object v0, p0, Lxv8;->A:Lcom/opera/android/widget/ClickAwareCardView;

    if-eqz p1, :cond_f8

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {v1, p0, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    invoke-virtual {v0, p0}, Landroid/view/View;->setBackgroundColor(I)V

    goto :goto_fb

    :cond_f8
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    :goto_fb
    return-void

    :pswitch_fc
    check-cast p0, Ltv8;

    iget-object p0, p0, Ltv8;->d:Lcom/opera/android/custom_views/PullSpinner;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lf03;->C(Landroid/content/Context;)I

    move-result p1

    iget-object v0, p0, Lcom/opera/android/custom_views/PullSpinner;->e:Lz9h;

    iput p1, v0, Lz9h;->c:I

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_110
    check-cast p0, Llx;

    iget-object p1, p0, Llx;->i:Lkze;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object v0, p0, Llx;->j:Landroid/view/View;

    if-eqz p1, :cond_12c

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {v1, p0, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v2

    :cond_12c
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    return-void

    :pswitch_130
    check-cast p0, Llu8;

    invoke-virtual {p0}, Llu8;->j0()V

    return-void

    :pswitch_136
    check-cast p0, Lyk3;

    invoke-virtual {p0}, Lyk3;->a0()V

    return-void

    :pswitch_13c
    check-cast p0, Lfr8;

    invoke-virtual {p0}, Lfr8;->o()V

    return-void

    :pswitch_142
    check-cast p0, Lcom/opera/android/browser/WebContentsWrapper;

    sget p1, Lcom/opera/android/webcore/FastResizeWebViewContainer;->i:I

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result p1

    if-nez p1, :cond_14f

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->i()V

    :cond_14f
    return-void

    :pswitch_150
    check-cast p0, Lxo8;

    invoke-virtual {p0}, Lxo8;->b()V

    return-void

    :pswitch_156
    check-cast p0, Lcom/opera/android/custom_views/FadingRecyclerView;

    sget p1, Lcom/opera/android/custom_views/FadingRecyclerView;->V0:I

    iget-object p1, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->M0:Landroid/graphics/Paint;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lf03;->D(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_16f
    check-cast p0, Lcom/opera/android/bar/ExtraSideActionsAppbar;

    sget p1, Lcom/opera/android/bar/ExtraSideActionsAppbar;->f:I

    iget-object p1, p0, Lcom/opera/android/bar/ExtraSideActionsAppbar;->d:Lbn8;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0402f1

    const v2, 0x7f0600a7

    invoke-static {v1, v0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    const v1, 0x7f040059

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v1, v3, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    const v3, 0x7f040058

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {v3, p0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    iput v0, p1, Lbn8;->h:I

    iput v1, p1, Lbn8;->g:I

    iput p0, p1, Lbn8;->i:I

    iget-object p0, p1, Lbn8;->k:Lcom/opera/android/bar/ExtraSideActionsAppbar;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_1a5
    check-cast p0, Ligi;

    iget-object p0, p0, Ligi;->g:Ljava/lang/Object;

    check-cast p0, Lwnm;

    invoke-virtual {p0}, Lwnm;->u()V

    return-void

    :pswitch_1af
    check-cast p0, Lqu7;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0402a7

    invoke-static {v0, p1, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->e:Ltx4;

    if-eqz v0, :cond_1d1

    iget-object v1, v0, Ltx4;->I:Landroid/content/res/ColorStateList;

    if-eq v1, p1, :cond_1d1

    iput-object p1, v0, Ltx4;->I:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p1

    invoke-virtual {v0, p1}, Ltx4;->onStateChange([I)Z

    :cond_1d1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0402a6

    invoke-static {v0, p1, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    iget-object p0, p0, Lcom/google/android/material/chip/Chip;->e:Ltx4;

    if-eqz p0, :cond_1ff

    iget-object v0, p0, Ltx4;->X:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_1ff

    iput-object p1, p0, Ltx4;->X:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Ltx4;->W()Z

    move-result v0

    if-eqz v0, :cond_1f8

    iget-object v0, p0, Ltx4;->V:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    :cond_1f8
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p1

    invoke-virtual {p0, p1}, Ltx4;->onStateChange([I)Z

    :cond_1ff
    return-void

    :pswitch_200
    check-cast p0, Lou7;

    invoke-virtual {p0}, Lou7;->U()V

    return-void

    :pswitch_206
    check-cast p0, Lhu7;

    invoke-virtual {p0}, Lhu7;->U()V

    return-void

    :pswitch_20c
    check-cast p0, Lss7;

    invoke-virtual {p0}, Lss7;->O0()V

    return-void

    :pswitch_212
    check-cast p0, Lwg7;

    iget-object p1, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-boolean p0, p0, Lwg7;->P:Z

    if-eqz p0, :cond_222

    const p0, 0x7f040398

    goto :goto_225

    :cond_222
    const p0, 0x7f040399

    :goto_225
    invoke-static {p0, v0, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    iget v0, p1, Lcom/opera/android/StatusBarDrawingFrameLayout;->k:I

    if-eq p0, v0, :cond_232

    iput p0, p1, Lcom/opera/android/StatusBarDrawingFrameLayout;->k:I

    invoke-virtual {p1}, Lcom/opera/android/StatusBarDrawingFrameLayout;->b()V

    :cond_232
    return-void

    :pswitch_233
    check-cast p0, Lcom/opera/android/widget/GraphView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0404e7

    const v1, 0x7f0600a8

    invoke-static {v0, p1, v1}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/widget/GraphView;->i:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0404e5

    invoke-static {v0, p1, v1}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/widget/GraphView;->h:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Lcom/opera/android/widget/GraphView;->a()V

    return-void

    :pswitch_259
    check-cast p0, Lc76;

    iget-object v0, p0, Lc76;->a:Lvs;

    if-nez v0, :cond_260

    const/4 v0, 0x0

    :cond_260
    iget-object v0, v0, Lvs;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->o()Litd;

    move-result-object v0

    const v1, 0x7f0a06aa

    invoke-virtual {v0, v1}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-interface {v0}, Landroid/view/MenuItem;->isEnabled()Z

    move-result v1

    invoke-virtual {p0, p1, v1}, Lc76;->f0(Landroid/content/Context;Z)I

    move-result p0

    invoke-interface {v0}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_28b

    new-instance v0, Landroid/graphics/PorterDuffColorFilter;

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v0, p0, v1}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    :cond_28b
    return-void

    :pswitch_28c
    check-cast p0, Lcom/opera/android/menu/CustomMenuItemView;

    sget p1, Lcom/opera/android/menu/CustomMenuItemView;->f:I

    invoke-virtual {p0}, Lcom/opera/android/menu/CustomMenuItemView;->d()V

    return-void

    :pswitch_294
    check-cast p0, Lqc5;

    invoke-virtual {p0}, Lqc5;->a()V

    return-void

    :pswitch_data_29a
    .packed-switch 0x0
        :pswitch_294
        :pswitch_28c
        :pswitch_259
        :pswitch_233
        :pswitch_212
        :pswitch_20c
        :pswitch_206
        :pswitch_200
        :pswitch_1af
        :pswitch_1a5
        :pswitch_16f
        :pswitch_156
        :pswitch_150
        :pswitch_142
        :pswitch_13c
        :pswitch_136
        :pswitch_130
        :pswitch_110
        :pswitch_fc
        :pswitch_e2
        :pswitch_c3
        :pswitch_ab
        :pswitch_9c
        :pswitch_83
        :pswitch_7d
        :pswitch_6b
        :pswitch_57
        :pswitch_4e
        :pswitch_14
    .end packed-switch
.end method
