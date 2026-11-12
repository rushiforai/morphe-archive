.class public final Llu2;
.super Lh53;
.source "SourceFile"

# interfaces
.implements Lh4g;


# static fields
.field public static final synthetic B:[Lxtb;


# instance fields
.field public A:Landroid/graphics/drawable/Drawable;

.field public final t:Lktl;

.field public u:Lpq3;

.field public v:I

.field public final w:Lzyk;

.field public final x:Lua7;

.field public final y:Lulp;

.field public z:Lw3g;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ld6h;

    const-class v1, Llu2;

    const-string v2, "binding"

    const-string v3, "getBinding()Lcom/opera/android/databinding/FragmentViewPasswordsBinding;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Llu2;->B:[Lxtb;

    return-void
.end method

.method public constructor <init>(Lgjm;)V
    .registers 6

    sget v0, Lfki;->a:I

    invoke-static {v0}, Lu7k;->f(I)Lu7k;

    move-result-object v0

    iget-object v1, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v1, Litl;

    const/4 v2, 0x1

    iput-boolean v2, v1, Litl;->e:Z

    iput v2, v1, Litl;->k:I

    const v3, 0x7f140efb

    invoke-virtual {v0, v3}, Lu7k;->s(I)V

    const v0, 0x7f10000c

    iput v0, v1, Litl;->b:I

    invoke-direct {p0, v1, v2}, Li93;-><init>(Litl;Z)V

    new-instance v0, Lqp2;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lqp2;-><init>(B)V

    invoke-virtual {p0, v0}, Lltl;->F0(Ljtl;)Lktl;

    move-result-object v0

    iput-object v0, p0, Llu2;->t:Lktl;

    new-instance v0, Lt2;

    const/16 v1, 0xe

    invoke-direct {v0, p0, v1}, Lt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Llu2;->w:Lzyk;

    new-instance v0, Lua7;

    invoke-direct {v0, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object v0, p0, Llu2;->x:Lua7;

    sget-object p1, Lulp;->b:Lulp;

    iput-object p1, p0, Llu2;->y:Lulp;

    return-void
.end method


# virtual methods
.method public final G0()Lh93;
    .registers 1

    iget-object p0, p0, Llu2;->y:Lulp;

    return-object p0
.end method

.method public final H0()Ltn9;
    .registers 3

    sget-object v0, Llu2;->B:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object p0, p0, Llu2;->t:Lktl;

    iget-object p0, p0, Lktl;->b:La5n;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Ltn9;

    return-object p0
.end method

.method public final I0()Lmu2;
    .registers 1

    iget-object p0, p0, Llu2;->w:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmu2;

    return-object p0
.end method

.method public final J0()V
    .registers 3

    invoke-virtual {p0}, Llu2;->H0()Ltn9;

    move-result-object v0

    iget-object v0, v0, Ltn9;->e:Lcom/opera/android/custom_views/StylingImageButton;

    const v1, 0x7f080625

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    invoke-virtual {p0}, Llu2;->H0()Ltn9;

    move-result-object v0

    iget-object v0, v0, Ltn9;->c:Lcom/opera/android/custom_views/StylingTextView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lc5g;->a(Landroid/widget/TextView;Z)V

    invoke-virtual {p0}, Llu2;->H0()Ltn9;

    move-result-object p0

    iget-object p0, p0, Ltn9;->c:Lcom/opera/android/custom_views/StylingTextView;

    const-string v0, "fakepass"

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final K0()V
    .registers 5

    new-instance v0, Ls4g;

    invoke-direct {v0}, Ls4g;-><init>()V

    new-instance v1, Lt02;

    const/16 v2, 0x11

    invoke-direct {v1, p0, v2}, Lt02;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lpb;

    const/16 v3, 0x13

    invoke-direct {v2, v1, v3}, Lpb;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Llu2;->x:Lua7;

    invoke-virtual {p0, v0, v2}, Lua7;->E(Lr37;Lf7f;)V

    return-void
.end method

.method public final P(ILjava/lang/String;)Z
    .registers 4

    iget-object p0, p0, Llu2;->z:Lw3g;

    if-nez p0, :cond_5

    const/4 p0, 0x0

    :cond_5
    iget v0, p0, Lw3g;->a:I

    if-ne p1, v0, :cond_15

    iget-object p0, p0, Lw3g;->b:Lorg/chromium/url/GURL;

    iget-object p0, p0, Lorg/chromium/url/GURL;->a:Ljava/lang/String;

    invoke-static {p2, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_15

    const/4 p0, 0x1

    return p0

    :cond_15
    const/4 p0, 0x0

    return p0
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 8

    invoke-super {p0, p1}, Li93;->onMenuItemClick(Landroid/view/MenuItem;)Z

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a02c9

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne p1, v0, :cond_32

    invoke-virtual {p0}, Llu2;->I0()Lmu2;

    move-result-object p1

    iget-object v0, p0, Llu2;->z:Lw3g;

    if-eqz v0, :cond_17

    move-object v2, v0

    :cond_17
    iget-object v0, p1, Lmu2;->b:Lgjm;

    new-instance v3, La27;

    iget-object v4, v2, Lw3g;->c:Ljava/lang/String;

    invoke-direct {v3, v4}, La27;-><init>(Ljava/lang/String;)V

    new-instance v4, Lq3;

    const/16 v5, 0x1d

    invoke-direct {v4, p1, v2, v5}, Lq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p1, Lpb;

    const/16 v2, 0x14

    invoke-direct {p1, v4, v2}, Lpb;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v3, p0, p1}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    return v1

    :cond_32
    const v0, 0x7f0a035e

    const/4 v3, 0x0

    if-ne p1, v0, :cond_5c

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lsj2;->g(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_46

    invoke-virtual {p0}, Llu2;->K0()V

    return v1

    :cond_46
    invoke-virtual {p0}, Llu2;->I0()Lmu2;

    move-result-object p1

    iget-object p0, p0, Llu2;->z:Lw3g;

    if-eqz p0, :cond_4f

    move-object v2, p0

    :cond_4f
    iget-object p0, p1, Lmu2;->b:Lgjm;

    new-instance p1, Lzv7;

    iget v0, v2, Lw3g;->a:I

    invoke-direct {p1, v0}, Lzv7;-><init>(I)V

    invoke-virtual {p0, p1, v3}, Lgjm;->e(Ln37;Z)V

    return v1

    :cond_5c
    return v3
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 6

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0708f0

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Llu2;->v:I

    invoke-virtual {p0}, Llu2;->H0()Ltn9;

    move-result-object p1

    iget-object p1, p1, Ltn9;->f:Lor2;

    iget-object p1, p1, Lor2;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    const p2, 0x7f140639

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {p0}, Llu2;->H0()Ltn9;

    move-result-object p1

    iget-object p1, p1, Ltn9;->h:Lor2;

    iget-object p1, p1, Lor2;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    const p2, 0x7f14063b

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {p0}, Llu2;->I0()Lmu2;

    move-result-object p1

    iget-object p1, p1, Lmu2;->e:Lode;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    invoke-virtual {p0}, Llu2;->H0()Ltn9;

    move-result-object v0

    iget-object v0, v0, Ltn9;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v1, Lpb;

    const/16 v2, 0x12

    invoke-direct {v1, p0, v2}, Lpb;-><init>(Ljava/lang/Object;B)V

    const/4 v2, 0x0

    invoke-static {p1, p2, v0, v2, v1}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lsj2;->g(Landroid/content/Context;)Z

    move-result p1

    const/4 p2, 0x0

    if-nez p1, :cond_74

    invoke-virtual {p0}, Llu2;->H0()Ltn9;

    move-result-object p1

    iget-object p1, p1, Ltn9;->e:Lcom/opera/android/custom_views/StylingImageButton;

    new-instance v0, Lku2;

    invoke-direct {v0, p0, p2}, Lku2;-><init>(Llu2;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Llu2;->H0()Ltn9;

    move-result-object p1

    iget-object p1, p1, Ltn9;->d:Lcom/opera/android/custom_views/StylingImageButton;

    new-instance v0, Lku2;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lku2;-><init>(Llu2;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_92

    :cond_74
    invoke-virtual {p0}, Llu2;->H0()Ltn9;

    move-result-object p1

    iget-object p1, p1, Ltn9;->e:Lcom/opera/android/custom_views/StylingImageButton;

    new-instance v0, Lku2;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lku2;-><init>(Llu2;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Llu2;->H0()Ltn9;

    move-result-object p1

    iget-object p1, p1, Ltn9;->d:Lcom/opera/android/custom_views/StylingImageButton;

    new-instance v0, Lku2;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lku2;-><init>(Llu2;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_92
    invoke-virtual {p0}, Llu2;->H0()Ltn9;

    move-result-object p1

    iget-object p1, p1, Ltn9;->h:Lor2;

    iget-object p1, p1, Lor2;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Llu2;->H0()Ltn9;

    move-result-object p1

    iget-object p1, p1, Ltn9;->h:Lor2;

    iget-object p1, p1, Lor2;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageButton;

    new-instance p2, Lku2;

    const/4 v0, 0x4

    invoke-direct {p2, p0, v0}, Lku2;-><init>(Llu2;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final s()V
    .registers 9

    iget-object v0, p0, Llu2;->z:Lw3g;

    if-nez v0, :cond_5

    const/4 v0, 0x0

    :cond_5
    sget v1, Lvmj;->g:I

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, v0, Lw3g;->c:Ljava/lang/String;

    iget v4, p0, Llu2;->v:I

    const/4 v6, 0x0

    const/16 v7, 0x30

    move v5, v4

    invoke-static/range {v2 .. v7}, Ltmj;->m(Landroid/content/Context;Ljava/lang/String;IILna5;I)Lvmj;

    move-result-object v0

    iput-object v0, p0, Llu2;->A:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Llu2;->H0()Ltn9;

    move-result-object v0

    iget-object v0, v0, Ltn9;->b:Lcom/opera/android/custom_views/StylingImageView;

    iget-object p0, p0, Llu2;->A:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p0}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public final u0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 4

    invoke-static {p1, p2}, Lpq3;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lpq3;

    move-result-object p1

    iput-object p1, p0, Llu2;->u:Lpq3;

    iget-object p1, p1, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    const p2, 0x7f1402b0

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Llu2;->u:Lpq3;

    if-nez p1, :cond_13

    const/4 p1, 0x0

    :cond_13
    iget-object p1, p1, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Lku2;

    const/4 v0, 0x5

    invoke-direct {p2, p0, v0}, Lku2;-><init>(Llu2;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final w(Landroid/graphics/Bitmap;)V
    .registers 6

    iget v0, p0, Llu2;->v:I

    div-int/lit8 v1, v0, 0x2

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Ls8i;->d:Landroid/view/animation/PathInterpolator;

    new-instance v3, Lp8i;

    invoke-direct {v3, v0, v1, v2, p1}, Lp8i;-><init>(IILandroid/content/Context;Landroid/graphics/Bitmap;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lf03;->s(Landroid/content/Context;)I

    move-result p1

    invoke-virtual {v3, p1}, Lp8i;->a(I)V

    iput-object v3, p0, Llu2;->A:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Llu2;->H0()Ltn9;

    move-result-object p1

    iget-object p1, p1, Ltn9;->b:Lcom/opera/android/custom_views/StylingImageView;

    iget-object p0, p0, Llu2;->A:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, p0}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
