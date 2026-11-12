.class public final synthetic Lsvk;
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

    iput-byte p2, p0, Lsvk;->a:B

    iput-object p1, p0, Lsvk;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 13

    iget-byte v0, p0, Lsvk;->a:B

    const/4 v1, 0x0

    const v2, 0x7f0402e3

    const/4 v3, -0x1

    const/4 v4, 0x1

    const v5, 0x7f080a25

    const v6, 0x7f06063b

    const/4 v7, 0x0

    iget-object p0, p0, Lsvk;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_3bc

    check-cast p0, Lzg;

    iget-object p0, p0, Lzg;->c:Ljava/lang/Object;

    check-cast p0, Liuh;

    if-eqz p0, :cond_23

    iget-object p0, p0, Liuh;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_23
    return-void

    :pswitch_24
    check-cast p0, Lbmn;

    iget-object p0, p0, Lbmn;->f:Lvkn;

    if-eqz p0, :cond_9a

    iget-object p1, p0, Lvkn;->d:Lzk7;

    iget-object v0, p1, Lzk7;->a:Lyk7;

    invoke-interface {v0}, Lyk7;->f()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p1, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_39

    invoke-virtual {v1, v7, v7}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    :cond_39
    iput-object v0, p1, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    iget-object v1, p1, Lzk7;->g:Lwk7;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-object p1, p1, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v7, v7}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    iget-object p1, p0, Lvkn;->c:Lq87;

    iget-object v0, p1, Lq87;->b:Landroid/content/Context;

    iget v1, p1, Lq87;->c:I

    invoke-static {v1, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p1, Lq87;->d:Landroid/graphics/drawable/Drawable;

    invoke-static {v5, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p1, Lq87;->f:Ljava/lang/Object;

    iget-object p1, p0, Lvkn;->e:Lplk;

    iget-object p1, p1, Lplk;->b:Ljava/lang/Object;

    check-cast p1, Lzk7;

    iget-object v0, p1, Lzk7;->a:Lyk7;

    invoke-interface {v0}, Lyk7;->f()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p1, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_6a

    invoke-virtual {v1, v7, v7}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    :cond_6a
    iput-object v0, p1, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    iget-object v1, p1, Lzk7;->g:Lwk7;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-object p1, p1, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v7, v7}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    iget-object p1, p0, Lvkn;->f:Lplk;

    iget-object p1, p1, Lplk;->b:Ljava/lang/Object;

    check-cast p1, Lzk7;

    iget-object v0, p1, Lzk7;->a:Lyk7;

    invoke-interface {v0}, Lyk7;->f()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p1, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_89

    invoke-virtual {v1, v7, v7}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    :cond_89
    iput-object v0, p1, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    iget-object v1, p1, Lzk7;->g:Lwk7;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-object p1, p1, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v7, v7}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    iget-object p0, p0, Lvkn;->b:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_9a
    return-void

    :pswitch_9b
    check-cast p0, Ltln;

    iget-object p0, p0, Ltln;->B:Lqkn;

    if-eqz p0, :cond_d3

    iget-object p1, p0, Lqkn;->k:Lzk7;

    iget-object v0, p1, Lzk7;->a:Lyk7;

    invoke-interface {v0}, Lyk7;->f()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p1, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_b0

    invoke-virtual {v1, v7, v7}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    :cond_b0
    iput-object v0, p1, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    iget-object v1, p1, Lzk7;->g:Lwk7;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-object p1, p1, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v7, v7}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    iget-object p1, p0, Lqkn;->l:Lq87;

    iget-object v0, p1, Lq87;->b:Landroid/content/Context;

    iget v1, p1, Lq87;->c:I

    invoke-static {v1, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p1, Lq87;->d:Landroid/graphics/drawable/Drawable;

    invoke-static {v5, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p1, Lq87;->f:Ljava/lang/Object;

    iget-object p0, p0, Lqkn;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_d3
    return-void

    :pswitch_d4
    check-cast p0, Lukn;

    iget-object p0, p0, Lukn;->D:Lqkn;

    if-eqz p0, :cond_10c

    iget-object p1, p0, Lqkn;->k:Lzk7;

    iget-object v0, p1, Lzk7;->a:Lyk7;

    invoke-interface {v0}, Lyk7;->f()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p1, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_e9

    invoke-virtual {v1, v7, v7}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    :cond_e9
    iput-object v0, p1, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    iget-object v1, p1, Lzk7;->g:Lwk7;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-object p1, p1, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v7, v7}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    iget-object p1, p0, Lqkn;->l:Lq87;

    iget-object v0, p1, Lq87;->b:Landroid/content/Context;

    iget v1, p1, Lq87;->c:I

    invoke-static {v1, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p1, Lq87;->d:Landroid/graphics/drawable/Drawable;

    invoke-static {v5, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p1, Lq87;->f:Ljava/lang/Object;

    iget-object p0, p0, Lqkn;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_10c
    return-void

    :pswitch_10d
    check-cast p0, Lnkn;

    iget-object p0, p0, Lnkn;->B:Lqkn;

    if-eqz p0, :cond_145

    iget-object p1, p0, Lqkn;->k:Lzk7;

    iget-object v0, p1, Lzk7;->a:Lyk7;

    invoke-interface {v0}, Lyk7;->f()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p1, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_122

    invoke-virtual {v1, v7, v7}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    :cond_122
    iput-object v0, p1, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    iget-object v1, p1, Lzk7;->g:Lwk7;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-object p1, p1, Lzk7;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v7, v7}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    iget-object p1, p0, Lqkn;->l:Lq87;

    iget-object v0, p1, Lq87;->b:Landroid/content/Context;

    iget v1, p1, Lq87;->c:I

    invoke-static {v1, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p1, Lq87;->d:Landroid/graphics/drawable/Drawable;

    invoke-static {v5, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p1, Lq87;->f:Ljava/lang/Object;

    iget-object p0, p0, Lqkn;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_145
    return-void

    :pswitch_146
    check-cast p0, Lcgn;

    invoke-virtual {p0}, Lcgn;->N0()V

    return-void

    :pswitch_14c
    check-cast p0, Lbdn;

    invoke-virtual {p0}, Lbdn;->c()V

    return-void

    :pswitch_152
    check-cast p0, Li9c;

    invoke-virtual {p0}, Li9c;->a()V

    return-void

    :pswitch_158
    check-cast p0, Lg3b;

    iget-object v0, p0, Lg3b;->u:Ljava/lang/Object;

    check-cast v0, Lq5g;

    iget-object v0, v0, Lq5g;->d:Ljava/lang/Object;

    check-cast v0, Lowc;

    iget-object v0, v0, Lowc;->c:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object p0, p0, Lg3b;->s:Ljava/lang/Object;

    check-cast p0, Lfdn;

    iget v1, p0, Lfdn;->h:I

    iget p0, p0, Lfdn;->i:I

    invoke-static {v4, p1, v1, p0}, Lddh;->o(ZLandroid/content/Context;II)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_178
    check-cast p0, Lpbn;

    iget-object p0, p0, Lpbn;->b:Ly83;

    iget-object p0, p0, Ly83;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lf03;->q(Landroid/content/Context;)I

    move-result p1

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/StylingImageView;->c(Landroid/content/res/ColorStateList;)V

    return-void

    :pswitch_190
    check-cast p0, Lc7n;

    iget-object p1, p0, Lc7n;->s:Lp8i;

    if-eqz p1, :cond_1a3

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lf03;->s(Landroid/content/Context;)I

    move-result p0

    invoke-virtual {p1, p0}, Lp8i;->a(I)V

    :cond_1a3
    return-void

    :pswitch_1a4
    check-cast p0, Lpyl;

    iget-object p1, p0, Lpyl;->c:Ljava/lang/Object;

    move-object v6, p1

    check-cast v6, Laln;

    if-eqz v6, :cond_1d2

    invoke-interface {v6}, Laln;->a()Z

    move-result p1

    if-ne p1, v4, :cond_1d2

    iget-object p1, p0, Lpyl;->d:Ljava/lang/Object;

    check-cast p1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    iget-object p1, p0, Lpyl;->d:Ljava/lang/Object;

    move-object v7, p1

    check-cast v7, Landroid/view/View;

    iget-object p1, p0, Lpyl;->e:Ljava/lang/Object;

    move-object v8, p1

    check-cast v8, Lagm;

    iget v9, p0, Lpyl;->b:I

    iget-object p0, p0, Lpyl;->f:Ljava/lang/Object;

    check-cast p0, Ltjn;

    invoke-interface {p0}, Ltjn;->a()I

    move-result v10

    invoke-static/range {v5 .. v10}, Lpyl;->i(Landroid/content/Context;Laln;Landroid/view/View;Lagm;II)V

    :cond_1d2
    return-void

    :pswitch_1d3
    check-cast p0, Lx6n;

    iget p1, p0, Lo6n;->b:I

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v2, v0, v6}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    invoke-static {v3, p1, v0}, Lj14;->E(III)Landroid/graphics/drawable/ShapeDrawable;

    move-result-object p1

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lf03;->H(Landroid/content/Context;)Z

    move-result v1

    invoke-virtual {p0, v1, p1}, Lo6n;->U(ZLandroid/graphics/drawable/ShapeDrawable;)Landroid/graphics/drawable/RippleDrawable;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_1f7
    check-cast p0, Lv6n;

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v2, 0x7f0801e7

    invoke-static {v2, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v2, 0x7f0406a7

    invoke-static {v2, v0, v6}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iget p0, p0, Lv6n;->b:I

    invoke-static {v1, v0, p0}, Lxgh;->i(Landroid/graphics/drawable/ShapeDrawable;Landroid/content/res/ColorStateList;I)Landroid/graphics/drawable/RippleDrawable;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_224
    check-cast p0, Lu6n;

    iget-object p1, p0, Lu6n;->f:Laln;

    if-eqz p1, :cond_22d

    invoke-virtual {p0, p1}, Lu6n;->U(Laln;)V

    :cond_22d
    return-void

    :pswitch_22e
    check-cast p0, Lm6n;

    iget-object p1, p0, Lm6n;->c:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget v5, p0, Lo6n;->b:I

    invoke-static {v2, v0, v6}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v2

    invoke-static {v3, v5, v2}, Lj14;->E(III)Landroid/graphics/drawable/ShapeDrawable;

    move-result-object v2

    invoke-static {v0}, Lf03;->I(Landroid/content/Context;)Z

    move-result v3

    xor-int/2addr v3, v4

    invoke-virtual {p0, v3, v2}, Lo6n;->U(ZLandroid/graphics/drawable/ShapeDrawable;)Landroid/graphics/drawable/RippleDrawable;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const p0, 0x7f0402bf

    invoke-static {p0, v0, v6}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/opera/android/custom_views/StylingImageView;->c(Landroid/content/res/ColorStateList;)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_25e
    check-cast p0, Ll6n;

    iget p1, p0, Lo6n;->b:I

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v2, v0, v6}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    invoke-static {v3, p1, v0}, Lj14;->E(III)Landroid/graphics/drawable/ShapeDrawable;

    move-result-object p1

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lf03;->H(Landroid/content/Context;)Z

    move-result v1

    invoke-virtual {p0, v1, p1}, Lo6n;->U(ZLandroid/graphics/drawable/ShapeDrawable;)Landroid/graphics/drawable/RippleDrawable;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_282
    check-cast p0, Ly5m;

    invoke-virtual {p0}, Ly5m;->X()V

    return-void

    :pswitch_288
    check-cast p0, Lala;

    invoke-virtual {p0}, Lala;->e()V

    return-void

    :pswitch_28e
    check-cast p0, Ly83;

    iget-object p0, p0, Ly83;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0402d7

    const v1, 0x7f0602c4

    invoke-static {v0, p1, v1}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/StylingImageView;->c(Landroid/content/res/ColorStateList;)V

    return-void

    :pswitch_2a6
    check-cast p0, Lwyl;

    invoke-virtual {p0}, Lwyl;->H0()V

    return-void

    :pswitch_2ac
    check-cast p0, Lp8f;

    invoke-virtual {p0}, Lp8f;->a()V

    return-void

    :pswitch_2b2
    check-cast p0, Lrzg;

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    iget-byte p0, p0, Lrzg;->g:B

    packed-switch p0, :pswitch_data_3fa

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const p1, 0x7f040a27

    invoke-static {p1, p0, v6}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    goto :goto_2d9

    :pswitch_2cd
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lf03;->G(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p0

    :goto_2d9
    invoke-static {p0}, Lp37;->u0(I)Z

    move-result p0

    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    move-result p1

    if-eqz p0, :cond_2e6

    or-int/lit16 p1, p1, 0x2000

    goto :goto_2e8

    :cond_2e6
    and-int/lit16 p1, p1, -0x2001

    :goto_2e8
    invoke-virtual {v0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    return-void

    :pswitch_2ec
    check-cast p0, Lcom/opera/android/custom_views/ThemeSelector;

    sget p1, Lcom/opera/android/custom_views/ThemeSelector;->f:I

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_2f4
    check-cast p0, Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;

    sget p1, Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;->b:I

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lf03;->I(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_30a

    const v0, 0x7f08047e

    goto :goto_30d

    :cond_30a
    const v0, 0x7f08047d

    :goto_30d
    invoke-static {v0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iget-object p0, p0, Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;->a:Lq5g;

    iget-object p0, p0, Lq5g;->c:Ljava/lang/Object;

    check-cast p0, Landroid/widget/ImageView;

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_31b
    check-cast p0, Lgal;

    iget-object p1, p0, Lgal;->c:Lebl;

    iget-object p1, p1, Lebl;->a:Lcom/opera/android/tabui2/TabUiRootFrameLayout;

    new-instance v0, Lqlk;

    const/16 v1, 0x1d

    invoke-direct {v0, p0, v1}, Lqlk;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void

    :pswitch_32c
    check-cast p0, Lcom/opera/android/custom_views/TabCountButton;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lf03;->v(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/TabCountButton;->f(Landroid/content/res/ColorStateList;)V

    return-void

    :pswitch_33a
    check-cast p0, Lfzk;

    invoke-virtual {p0}, Lfzk;->a()V

    return-void

    :pswitch_340
    check-cast p0, Livg;

    iget-object p1, p0, Livg;->c:Ljava/lang/Object;

    check-cast p1, Lvx;

    invoke-virtual {p1}, Lvx;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ldpf;

    invoke-virtual {p1, p0}, Ldpf;->a(Lhpf;)V

    return-void

    :pswitch_350
    check-cast p0, Lcy3;

    check-cast p1, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object p0, p0, Lcy3;->b:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    new-instance v2, Landroid/util/TypedValue;

    invoke-direct {v2}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p0

    const v3, 0x7f040557

    invoke-virtual {p0, v3, v2, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget p0, v2, Landroid/util/TypedValue;->resourceId:I

    invoke-static {v0, v1, p0}, Lu8n;->i(Landroid/content/Context;Landroid/content/res/Resources$Theme;I)V

    const p0, 0x7f060f81

    filled-new-array {p0}, [I

    move-result-object p0

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    aget p0, p0, v7

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getColor(I)I

    move-result p0

    filled-new-array {p0}, [I

    move-result-object p0

    iget-object v0, p1, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->o:Lvdd;

    iget-object v0, v0, Lvdd;->b:Ludd;

    iput-object p0, v0, Ludd;->j:[I

    invoke-virtual {v0, v7}, Ludd;->b(I)V

    invoke-virtual {v0, v7}, Ludd;->b(I)V

    aget p0, p0, v7

    iput p0, p1, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->y:I

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lf03;->q(Landroid/content/Context;)I

    move-result p0

    iput p0, p1, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->z:I

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const v0, 0x7f0402f3

    const v1, 0x7f060f80

    invoke-static {v0, p0, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    iget-object v0, p1, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->j:Lg05;

    invoke-virtual {v0, p0}, Lg05;->setBackgroundColor(I)V

    iget-object p1, p1, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->o:Lvdd;

    iget-object p1, p1, Lvdd;->b:Ludd;

    iput p0, p1, Ludd;->w:I

    return-void

    nop

    :pswitch_data_3bc
    .packed-switch 0x0
        :pswitch_350
        :pswitch_340
        :pswitch_33a
        :pswitch_32c
        :pswitch_31b
        :pswitch_2f4
        :pswitch_2ec
        :pswitch_2b2
        :pswitch_2ac
        :pswitch_2a6
        :pswitch_28e
        :pswitch_288
        :pswitch_282
        :pswitch_25e
        :pswitch_22e
        :pswitch_224
        :pswitch_1f7
        :pswitch_1d3
        :pswitch_1a4
        :pswitch_190
        :pswitch_178
        :pswitch_158
        :pswitch_152
        :pswitch_14c
        :pswitch_146
        :pswitch_10d
        :pswitch_d4
        :pswitch_9b
        :pswitch_24
    .end packed-switch

    :pswitch_data_3fa
    .packed-switch 0x0
        :pswitch_2cd
    .end packed-switch
.end method
