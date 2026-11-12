.class public final synthetic Lkkf;
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

    iput-byte p2, p0, Lkkf;->a:B

    iput-object p1, p0, Lkkf;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 5

    iget-byte v0, p0, Lkkf;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lkkf;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_258

    check-cast p0, Lyjk;

    iget-object p1, p0, Lyjk;->c:Late;

    if-eqz p1, :cond_2e

    iget-object p0, p0, Lyjk;->b:Lb7k;

    iget-object p0, p0, Lb7k;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object p1, p1, Late;->a:Ljava/lang/String;

    const v2, 0x7f0803c5

    invoke-static {v2, p1}, Lvtp;->K(ILjava/lang/String;)I

    move-result p1

    const/4 v2, 0x1

    invoke-static {v2, v0, v1, p1}, Lddh;->o(ZLandroid/content/Context;II)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    new-instance v0, Lmxh;

    invoke-direct {v0, p1}, Lmxh;-><init>(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    :cond_2e
    return-void

    :pswitch_2f
    check-cast p0, Luck;

    invoke-virtual {p0}, Luck;->a()V

    return-void

    :pswitch_35
    check-cast p0, Lghf;

    iget-object p0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast p0, Lc1f;

    if-eqz p0, :cond_40

    invoke-virtual {p0}, Lc1f;->e()V

    :cond_40
    return-void

    :pswitch_41
    check-cast p0, Lo9k;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lf03;->I(Landroid/content/Context;)Z

    move-result p1

    iget-object p0, p0, Lo9k;->d:Lmcj;

    invoke-virtual {p0, p1}, Lmcj;->t(Z)V

    invoke-virtual {p0, p1}, Lmcj;->r(Z)V

    return-void

    :pswitch_54
    check-cast p0, Ly8k;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lf03;->I(Landroid/content/Context;)Z

    move-result p1

    iget-object p0, p0, Ly8k;->a:Lmcj;

    invoke-virtual {p0, p1}, Lmcj;->t(Z)V

    invoke-virtual {p0, v1}, Lmcj;->r(Z)V

    return-void

    :pswitch_67
    check-cast p0, Lvkn;

    iget-object p1, p0, Lvkn;->d:Lzk7;

    iget-object v0, p1, Lzk7;->a:Lyk7;

    invoke-interface {v0}, Lyk7;->f()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v2, p1, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_78

    invoke-virtual {v2, v1, v1}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    :cond_78
    iput-object v0, p1, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    iget-object v2, p1, Lzk7;->g:Lwk7;

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-object p1, p1, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v1, v1}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    iget-object p1, p0, Lvkn;->c:Lq87;

    iget-object v0, p1, Lq87;->b:Landroid/content/Context;

    iget v2, p1, Lq87;->c:I

    invoke-static {v2, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p1, Lq87;->d:Landroid/graphics/drawable/Drawable;

    const v2, 0x7f080a25

    invoke-static {v2, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p1, Lq87;->f:Ljava/lang/Object;

    iget-object p1, p0, Lvkn;->e:Lplk;

    iget-object p1, p1, Lplk;->b:Ljava/lang/Object;

    check-cast p1, Lzk7;

    iget-object v0, p1, Lzk7;->a:Lyk7;

    invoke-interface {v0}, Lyk7;->f()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v2, p1, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_ac

    invoke-virtual {v2, v1, v1}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    :cond_ac
    iput-object v0, p1, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    iget-object v2, p1, Lzk7;->g:Lwk7;

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-object p1, p1, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v1, v1}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    iget-object p1, p0, Lvkn;->f:Lplk;

    iget-object p1, p1, Lplk;->b:Ljava/lang/Object;

    check-cast p1, Lzk7;

    iget-object v0, p1, Lzk7;->a:Lyk7;

    invoke-interface {v0}, Lyk7;->f()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v2, p1, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_cb

    invoke-virtual {v2, v1, v1}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    :cond_cb
    iput-object v0, p1, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    iget-object v2, p1, Lzk7;->g:Lwk7;

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-object p1, p1, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v1, v1}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    iget-object p0, p0, Lvkn;->b:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_dd
    check-cast p0, Lz6k;

    invoke-virtual {p0}, Lz6k;->b0()V

    return-void

    :pswitch_e3
    check-cast p0, Lr6k;

    iget-object p1, p0, Lr6k;->e:Lne5;

    iget-object p1, p1, Lne5;->g:Ljava/lang/Object;

    check-cast p1, Lpde;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lv6k;

    invoke-virtual {p0, p1}, Lr6k;->b0(Lv6k;)V

    return-void

    :pswitch_f5
    check-cast p0, Lm6k;

    iget-object p0, p0, Lm6k;->e:Ltsd;

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

    :pswitch_10f
    check-cast p0, Lcu5;

    iget-object p0, p0, Lcu5;->f:Ltsd;

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

    :pswitch_129
    check-cast p0, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;

    sget p1, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;->v:I

    invoke-virtual {p0}, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;->r()V

    return-void

    :pswitch_131
    check-cast p0, Lz8j;

    sget v0, Lz8j;->e:I

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lf03;->C(Landroid/content/Context;)I

    move-result p1

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    iput-object p1, p0, Lz8j;->d:Landroid/content/res/ColorStateList;

    iget-object p1, p0, Lz8j;->c:Ll6j;

    if-eqz p1, :cond_14a

    invoke-virtual {p0, p1}, Lz8j;->U(Ll6j;)V

    :cond_14a
    return-void

    :pswitch_14b
    check-cast p0, Lyzi;

    invoke-virtual {p0}, Lyzi;->a0()V

    return-void

    :pswitch_151
    check-cast p0, Lcom/opera/android/widget/SelectableRelativeLayout;

    sget p1, Lcom/opera/android/widget/SelectableRelativeLayout;->h:I

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0402e3

    const v1, 0x7f06063b

    invoke-static {v0, p1, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    iput p1, p0, Lcom/opera/android/widget/SelectableRelativeLayout;->f:I

    iget-boolean p1, p0, Lcom/opera/android/widget/SelectableRelativeLayout;->e:Z

    if-eqz p1, :cond_172

    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    move-result p1

    if-eqz p1, :cond_172

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_172
    return-void

    :pswitch_173
    check-cast p0, Lawi;

    iget-object p1, p0, Lawi;->r:Lvzk;

    iget-object p1, p1, Lvzk;->d:Ljava/lang/Object;

    check-cast p1, Lode;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lbwi;

    invoke-virtual {p0, p1}, Lawi;->L0(Lbwi;)V

    return-void

    :pswitch_185
    check-cast p0, Lzri;

    iget-boolean p1, p0, Lzri;->i:Z

    if-eqz p1, :cond_1a7

    iget-object p0, p0, Lfmj;->b:Lcom/opera/android/suggestion/adapter/SuggestionListItem;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0805e5

    invoke-static {v0, p1}, Lj14;->i0(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {p1}, Lf03;->v(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    new-instance p1, Lmxh;

    invoke-direct {p1, v0}, Lmxh;-><init>(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    :cond_1a7
    return-void

    :pswitch_1a8
    check-cast p0, Lcom/opera/android/widget/ScheduleRangeSlider;

    iget-boolean p1, p0, Lcom/opera/android/widget/ScheduleRangeSlider;->h1:Z

    invoke-virtual {p0, p1}, Lcom/opera/android/widget/ScheduleRangeSlider;->H0(Z)V

    return-void

    :pswitch_1b0
    check-cast p0, Liji;

    invoke-virtual {p0}, Liji;->V()V

    return-void

    :pswitch_1b6
    check-cast p0, Lcom/opera/android/custom_views/swipe_to_refresh/RefreshView;

    sget p1, Lcom/opera/android/custom_views/swipe_to_refresh/RefreshView;->e:I

    invoke-virtual {p0}, Lcom/opera/android/custom_views/swipe_to_refresh/RefreshView;->a()V

    return-void

    :pswitch_1be
    check-cast p0, Lymh;

    invoke-virtual {p0}, Lymh;->X()V

    return-void

    :pswitch_1c4
    check-cast p0, Lwmh;

    invoke-virtual {p0}, Lwmh;->X()V

    return-void

    :pswitch_1ca
    check-cast p0, Lalh;

    iget-object p1, p0, Lalh;->k:Lp8i;

    if-eqz p1, :cond_1dd

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lf03;->s(Landroid/content/Context;)I

    move-result p0

    invoke-virtual {p1, p0}, Lp8i;->a(I)V

    :cond_1dd
    return-void

    :pswitch_1de
    check-cast p0, Lshf;

    invoke-virtual {p0}, Lshf;->Q()V

    return-void

    :pswitch_1e4
    check-cast p0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;

    sget-object v0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->u:[I

    invoke-virtual {p0}, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->t()V

    iget-object p0, p0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->r:Lpbj;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f04021b

    invoke-static {v0, p1}, Lf03;->W(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p1

    iget-object v0, p0, Lpbj;->e:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void

    :pswitch_205
    check-cast p0, Li0h;

    iget-object p0, p0, Li0h;->e:Lq5g;

    iget-object p0, p0, Lq5g;->d:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/d;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    return-void

    :pswitch_213
    check-cast p0, Lf0h;

    invoke-virtual {p0}, Lf0h;->i0()V

    return-void

    :pswitch_219
    check-cast p0, Lxzg;

    iget-object p1, p0, Lxzg;->h:Lei;

    iget-object p1, p1, Lei;->d:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p1}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lxzg;->e:Lp0h;

    iget-object v0, v0, Lp0h;->f:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqwi;

    iget-object v0, v0, Lqwi;->a:Lnwi;

    invoke-virtual {p0, p1, v0}, Lxzg;->k0(Ljava/lang/String;Lnwi;)V

    return-void

    :pswitch_239
    check-cast p0, Lcom/opera/android/media/PlayerContainerView;

    sget p1, Lcom/opera/android/media/PlayerContainerView;->k:I

    invoke-virtual {p0}, Lcom/opera/android/media/PlayerContainerView;->a()V

    return-void

    :pswitch_241
    check-cast p0, Lhcg;

    invoke-virtual {p0}, Lhcg;->H0()Lkm9;

    move-result-object p0

    iget-object p0, p0, Lkm9;->d:Landroid/widget/ImageView;

    const p1, 0x7f080477

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void

    :pswitch_250
    check-cast p0, Lcom/opera/android/custom_views/OperaEditText;

    sget p1, Lcom/opera/android/custom_views/OperaEditText;->r:I

    invoke-virtual {p0}, Lcom/opera/android/custom_views/OperaEditText;->j()V

    return-void

    :pswitch_data_258
    .packed-switch 0x0
        :pswitch_250
        :pswitch_241
        :pswitch_239
        :pswitch_219
        :pswitch_213
        :pswitch_205
        :pswitch_1e4
        :pswitch_1de
        :pswitch_1ca
        :pswitch_1c4
        :pswitch_1be
        :pswitch_1b6
        :pswitch_1b0
        :pswitch_1a8
        :pswitch_185
        :pswitch_173
        :pswitch_151
        :pswitch_14b
        :pswitch_131
        :pswitch_129
        :pswitch_10f
        :pswitch_f5
        :pswitch_e3
        :pswitch_dd
        :pswitch_67
        :pswitch_54
        :pswitch_41
        :pswitch_35
        :pswitch_2f
    .end packed-switch
.end method
