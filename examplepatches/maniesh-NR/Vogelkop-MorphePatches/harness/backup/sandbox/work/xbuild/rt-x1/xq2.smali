.class public final Lxq2;
.super Llj;
.source "SourceFile"

# interfaces
.implements Ljj2;


# static fields
.field public static final synthetic x:[Lxtb;


# instance fields
.field public final r:Lwh2;

.field public final s:Lktl;

.field public t:Lzq2;

.field public final u:Lzyk;

.field public final v:Lua7;

.field public final w:Lwq2;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ld6h;

    const-class v1, Lxq2;

    const-string v2, "binding"

    const-string v3, "getBinding()Lcom/opera/android/databinding/AutofillCardDetailsFragmentBinding;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Lxq2;->x:[Lxtb;

    return-void
.end method

.method public constructor <init>(Lgjm;Lwh2;)V
    .registers 6

    sget v0, Lfki;->a:I

    invoke-static {v0}, Lu7k;->f(I)Lu7k;

    move-result-object v0

    iget-object v1, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v1, Litl;

    const/4 v2, 0x1

    iput v2, v1, Litl;->k:I

    const v2, 0x7f14025c

    invoke-virtual {v0, v2}, Lu7k;->s(I)V

    invoke-direct {p0, v1}, Lltl;-><init>(Litl;)V

    iput-object p2, p0, Lxq2;->r:Lwh2;

    new-instance p2, Lqp2;

    const/4 v0, 0x2

    invoke-direct {p2, v0}, Lqp2;-><init>(B)V

    invoke-virtual {p0, p2}, Lltl;->F0(Ljtl;)Lktl;

    move-result-object p2

    iput-object p2, p0, Lxq2;->s:Lktl;

    new-instance p2, Lt2;

    const/16 v0, 0xb

    invoke-direct {p2, p0, v0}, Lt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p2

    iput-object p2, p0, Lxq2;->u:Lzyk;

    new-instance p2, Lua7;

    invoke-direct {p2, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object p2, p0, Lxq2;->v:Lua7;

    new-instance p1, Lwq2;

    invoke-direct {p1}, Lwq2;-><init>()V

    iput-object p1, p0, Lxq2;->w:Lwq2;

    return-void
.end method


# virtual methods
.method public final G0(Ljava/lang/CharSequence;)V
    .registers 3

    if-eqz p1, :cond_17

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-eqz v0, :cond_17

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    if-nez p0, :cond_f

    return-void

    :cond_f
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Llcp;->F(Landroid/content/Context;Ljava/lang/String;Z)V

    :cond_17
    return-void
.end method

.method public final H0()Lyq2;
    .registers 3

    sget-object v0, Lxq2;->x:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object p0, p0, Lxq2;->s:Lktl;

    iget-object p0, p0, Lktl;->b:La5n;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Lyq2;

    return-object p0
.end method

.method public final b0()V
    .registers 1

    iget-object p0, p0, Lxq2;->v:Lua7;

    invoke-virtual {p0}, Lua7;->D()V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 2

    invoke-super {p0, p1}, Lltl;->onCreate(Landroid/os/Bundle;)V

    iget-object p1, p0, Lxq2;->r:Lwh2;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object p0

    iget-object p1, p1, Llj2;->b:Lob;

    invoke-virtual {p0, p1}, Ltcc;->a(Lmdc;)V

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 7

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lxq2;->H0()Lyq2;

    move-result-object p1

    iget-object p1, p1, Lyq2;->e:Lcom/opera/android/custom_views/StylingImageView;

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p2

    if-eqz p2, :cond_14

    iget-object v0, p0, Lxq2;->w:Lwq2;

    invoke-static {p2, p1, v0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_14
    invoke-virtual {p0}, Lxq2;->H0()Lyq2;

    move-result-object p1

    iget-object p1, p1, Lyq2;->f:Lor2;

    iget-object p1, p1, Lor2;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    const p2, 0x7f14025d

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {p0}, Lxq2;->H0()Lyq2;

    move-result-object p1

    iget-object p1, p1, Lyq2;->c:Lor2;

    iget-object p1, p1, Lor2;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    const p2, 0x7f140261

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {p0}, Lxq2;->H0()Lyq2;

    move-result-object p1

    iget-object p1, p1, Lyq2;->d:Lor2;

    iget-object p1, p1, Lor2;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    const p2, 0x7f14029d

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {p0}, Lxq2;->H0()Lyq2;

    move-result-object p1

    iget-object p1, p1, Lyq2;->g:Lor2;

    iget-object p1, p1, Lor2;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    const p2, 0x7f14027e

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {p0}, Lxq2;->H0()Lyq2;

    move-result-object p1

    iget-object p1, p1, Lyq2;->b:Lor2;

    iget-object p1, p1, Lor2;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    const p2, 0x7f140230

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {p0}, Lxq2;->H0()Lyq2;

    move-result-object p1

    iget-object p1, p1, Lyq2;->f:Lor2;

    iget-object p1, p1, Lor2;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageButton;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lxq2;->H0()Lyq2;

    move-result-object p1

    iget-object p1, p1, Lyq2;->f:Lor2;

    iget-object p1, p1, Lor2;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageButton;

    new-instance v0, Lvq2;

    invoke-direct {v0, p0, p2}, Lvq2;-><init>(Lxq2;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lxq2;->H0()Lyq2;

    move-result-object p1

    iget-object p1, p1, Lyq2;->c:Lor2;

    iget-object p1, p1, Lor2;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lxq2;->H0()Lyq2;

    move-result-object p1

    iget-object p1, p1, Lyq2;->c:Lor2;

    iget-object p1, p1, Lor2;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageButton;

    new-instance v0, Lvq2;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lvq2;-><init>(Lxq2;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lxq2;->H0()Lyq2;

    move-result-object p1

    iget-object p1, p1, Lyq2;->d:Lor2;

    iget-object p1, p1, Lor2;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lxq2;->H0()Lyq2;

    move-result-object p1

    iget-object p1, p1, Lyq2;->d:Lor2;

    iget-object p1, p1, Lor2;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageButton;

    new-instance v0, Lvq2;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lvq2;-><init>(Lxq2;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lxq2;->H0()Lyq2;

    move-result-object p1

    iget-object p1, p1, Lyq2;->g:Lor2;

    iget-object p1, p1, Lor2;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lxq2;->H0()Lyq2;

    move-result-object p1

    iget-object p1, p1, Lyq2;->g:Lor2;

    iget-object p1, p1, Lor2;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageButton;

    new-instance p2, Lvq2;

    const/4 v0, 0x3

    invoke-direct {p2, p0, v0}, Lvq2;-><init>(Lxq2;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lxq2;->t:Lzq2;

    const/4 p2, 0x0

    if-nez p1, :cond_ea

    move-object p1, p2

    :cond_ea
    iget-object p1, p1, Lzq2;->d:Lcom/google/android/material/button/MaterialButton;

    new-instance v0, Lvq2;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lvq2;-><init>(Lxq2;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lxq2;->t:Lzq2;

    if-nez p1, :cond_fa

    move-object p1, p2

    :cond_fa
    iget-object p1, p1, Lzq2;->c:Lcom/google/android/material/button/MaterialButton;

    new-instance v0, Lvq2;

    const/4 v1, 0x5

    invoke-direct {v0, p0, v1}, Lvq2;-><init>(Lxq2;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lxq2;->u:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbr2;

    iget-object v1, p0, Lxq2;->v:Lua7;

    invoke-virtual {v1}, Lua7;->p()Ln37;

    move-result-object v1

    check-cast v1, Luq2;

    iget-object v1, v1, Luq2;->a:Ljava/lang/String;

    iput-object v1, v0, Lbr2;->g:Ljava/lang/String;

    invoke-virtual {v0}, Lbr2;->g()V

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lbr2;

    iget-object p1, p1, Lbr2;->e:Lode;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v0

    invoke-virtual {p0}, Lxq2;->H0()Lyq2;

    move-result-object v1

    iget-object v1, v1, Lyq2;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v2, Lpb;

    const/16 v3, 0xe

    invoke-direct {v2, p0, v3}, Lpb;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, v0, v1, p2, v2}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    return-void
.end method

.method public final u0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 6

    const v0, 0x7f0d0078

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p2, 0x7f0a02cc

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    if-eqz v0, :cond_2b

    const p2, 0x7f0a035f

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/button/MaterialButton;

    if-eqz v2, :cond_2b

    new-instance p2, Lzq2;

    check-cast p1, Landroid/widget/LinearLayout;

    invoke-direct {p2, p1, v0, v2, v1}, Lzq2;-><init>(Landroid/widget/LinearLayout;Lcom/google/android/material/button/MaterialButton;Lcom/google/android/material/button/MaterialButton;B)V

    iput-object p2, p0, Lxq2;->t:Lzq2;

    return-void

    :cond_2b
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final y()Ljava/lang/String;
    .registers 1

    const-string p0, "AuthCardsSettings"

    return-object p0
.end method
