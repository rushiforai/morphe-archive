.class public final synthetic Lvs5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    iput-byte p4, p0, Lvs5;->a:B

    iput-object p1, p0, Lvs5;->b:Ljava/lang/Object;

    iput-object p2, p0, Lvs5;->c:Ljava/lang/Object;

    iput-object p3, p0, Lvs5;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 6

    iget-byte v0, p0, Lvs5;->a:B

    const/high16 v1, 0x41c00000    # 24.0f

    iget-object v2, p0, Lvs5;->d:Ljava/lang/Object;

    iget-object v3, p0, Lvs5;->c:Ljava/lang/Object;

    iget-object p0, p0, Lvs5;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_10c

    check-cast p0, Lymn;

    check-cast v3, Landroid/content/Context;

    check-cast v2, Lg7d;

    iget-object p1, v2, Lg7d;->c:Lcom/opera/android/custom_views/CircleImageView;

    iget-object p0, p0, Lymn;->k:Lumn;

    iget-object v0, p0, Lumn;->g:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_25

    invoke-static {v3}, Lf03;->H(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_25

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_2a

    :cond_25
    iget-object p0, p0, Lumn;->f:Landroid/graphics/Bitmap;

    invoke-virtual {p1, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :goto_2a
    return-void

    :pswitch_2b
    check-cast p0, Leri;

    check-cast v3, Lakg;

    check-cast v2, Landroid/view/MenuItem;

    iget-object p1, v3, Lakg;->s:Ljava/lang/Object;

    check-cast p1, Ldkf;

    if-nez p1, :cond_38

    const/4 p1, 0x0

    :cond_38
    move-object v0, p1

    invoke-static {p1, v1}, Lz7h;->h(Landroid/content/Context;F)I

    move-result p1

    invoke-static {p0, v0, p1}, Leti;->d(Leri;Landroid/content/Context;I)Landroid/graphics/drawable/LayerDrawable;

    move-result-object p0

    invoke-interface {v2, p0}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    return-void

    :pswitch_45
    check-cast p0, Ldxh;

    check-cast v3, Ldxh;

    check-cast v2, Lcom/opera/android/StatusBarDrawingFrameLayout;

    if-eqz p0, :cond_56

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcxh;->a(Landroid/content/Context;)I

    move-result p0

    goto :goto_5e

    :cond_56
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v3, p0}, Lcxh;->a(Landroid/content/Context;)I

    move-result p0

    :goto_5e
    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    const/16 v1, 0xff

    if-ne v0, v1, :cond_76

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {v3, p1}, Lcxh;->a(Landroid/content/Context;)I

    move-result p1

    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result p1

    invoke-static {p0, p1}, Lp37;->m0(II)I

    move-result p0

    :cond_76
    iget p1, v2, Lcom/opera/android/StatusBarDrawingFrameLayout;->k:I

    if-eq p0, p1, :cond_7f

    iput p0, v2, Lcom/opera/android/StatusBarDrawingFrameLayout;->k:I

    invoke-virtual {v2}, Lcom/opera/android/StatusBarDrawingFrameLayout;->b()V

    :cond_7f
    return-void

    :pswitch_80
    check-cast p0, Lzzb;

    check-cast v3, Lcom/opera/android/custom_views/StylingImageView;

    check-cast v2, Ly83;

    iget-object p1, v2, Ly83;->b:Landroid/view/ViewGroup;

    check-cast p1, Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ltzb;

    iget-object v0, p0, Lzzb;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    iget p0, p0, Lzzb;->d:I

    if-ne p1, p0, :cond_a6

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lf03;->v(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {v3, p0}, Lcom/opera/android/custom_views/StylingImageView;->c(Landroid/content/res/ColorStateList;)V

    goto :goto_b5

    :cond_a6
    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lf03;->q(Landroid/content/Context;)I

    move-result p0

    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {v3, p0}, Lcom/opera/android/custom_views/StylingImageView;->c(Landroid/content/res/ColorStateList;)V

    :goto_b5
    return-void

    :pswitch_b6
    check-cast p0, Ld5o;

    check-cast v3, Landroid/widget/ImageView;

    check-cast v2, Ll6e;

    iget-object p0, p0, Ld5o;->c:Ljava/lang/Object;

    check-cast p0, Liv6;

    iget-object p0, p0, Ldej;->b:Lmej;

    invoke-interface {p0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {v1, p1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    invoke-static {v2, p0, p1}, Leti;->d(Leri;Landroid/content/Context;I)Landroid/graphics/drawable/LayerDrawable;

    move-result-object p0

    invoke-virtual {v3, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_d6
    check-cast p0, Lat5;

    check-cast v3, Landroid/widget/FrameLayout;

    check-cast v2, Lor2;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f080263

    invoke-static {v1, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x101030e

    invoke-static {v0, p1}, Lf03;->x(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {v3, p1}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    iget-boolean p0, p0, Lat5;->l:Z

    if-nez p0, :cond_103

    iget-object p0, v2, Lor2;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-static {p0}, Lat5;->g(Lcom/opera/android/custom_views/StylingImageView;)V

    :cond_103
    iget-object p0, v2, Lor2;->e:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-static {p0}, Lat5;->g(Lcom/opera/android/custom_views/StylingImageView;)V

    return-void

    nop

    :pswitch_data_10c
    .packed-switch 0x0
        :pswitch_d6
        :pswitch_b6
        :pswitch_80
        :pswitch_45
        :pswitch_2b
    .end packed-switch
.end method
