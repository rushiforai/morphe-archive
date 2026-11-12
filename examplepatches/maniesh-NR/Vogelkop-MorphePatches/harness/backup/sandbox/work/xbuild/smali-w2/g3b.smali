.class public final Lg3b;
.super Llj;
.source "SourceFile"


# instance fields
.field public final synthetic r:B

.field public s:Ljava/lang/Object;

.field public final t:Ljava/lang/Object;

.field public u:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lfdn;Ltah;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lg3b;->r:B

    const/4 v0, 0x0

    .line 42
    invoke-direct {p0, v0, v0}, Llj;-><init>(II)V

    .line 43
    iput-object p1, p0, Lg3b;->s:Ljava/lang/Object;

    .line 44
    iput-object p2, p0, Lg3b;->t:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lgjm;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lg3b;->r:B

    const/4 v0, 0x2

    invoke-static {v0}, Lu7k;->f(I)Lu7k;

    move-result-object v0

    const v1, 0x7f140f8c

    invoke-virtual {v0, v1}, Lu7k;->s(I)V

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    new-instance v0, Lt2;

    const/16 v1, 0x1a

    invoke-direct {v0, p0, v1}, Lt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lg3b;->t:Ljava/lang/Object;

    new-instance v0, Lua7;

    invoke-direct {v0, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object v0, p0, Lg3b;->u:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 6

    iget-byte v0, p0, Lg3b;->r:B

    packed-switch v0, :pswitch_data_9e

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    return-void

    :pswitch_9
    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p2, p0, Lg3b;->s:Ljava/lang/Object;

    check-cast p2, Lfdn;

    iget-object v0, p2, Lfdn;->c:Ljava/lang/String;

    iget-object v1, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/Toolbar;->D(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lg3b;->u:Ljava/lang/Object;

    check-cast v0, Lq5g;

    iget-object v0, v0, Lq5g;->d:Ljava/lang/Object;

    check-cast v0, Lowc;

    iget-object v0, v0, Lowc;->c:Lcom/opera/android/custom_views/StylingImageView;

    new-instance v1, Lsvk;

    const/16 v2, 0x15

    invoke-direct {v1, p0, v2}, Lsvk;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, v1}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {v1, v0}, Lsvk;->a(Landroid/view/View;)V

    iget-object v0, p0, Lg3b;->u:Ljava/lang/Object;

    check-cast v0, Lq5g;

    iget-object v0, v0, Lq5g;->d:Ljava/lang/Object;

    check-cast v0, Lowc;

    iget-object v0, v0, Lowc;->e:Lcom/opera/android/custom_views/StylingTextView;

    const v1, 0x7f14112f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lg3b;->u:Ljava/lang/Object;

    check-cast v0, Lq5g;

    iget-object v0, v0, Lq5g;->d:Ljava/lang/Object;

    check-cast v0, Lowc;

    iget-object v0, v0, Lowc;->h:Lcom/opera/android/custom_views/StylingTextView;

    const v1, 0x7f141381

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lg3b;->u:Ljava/lang/Object;

    check-cast v0, Lq5g;

    iget-object v0, v0, Lq5g;->d:Ljava/lang/Object;

    check-cast v0, Lowc;

    iget-object v0, v0, Lowc;->g:Landroid/widget/FrameLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lg3b;->u:Ljava/lang/Object;

    check-cast v0, Lq5g;

    iget-object v0, v0, Lq5g;->d:Ljava/lang/Object;

    check-cast v0, Lowc;

    iget-object v0, v0, Lowc;->i:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lg3b;->u:Ljava/lang/Object;

    check-cast v0, Lq5g;

    iget-object v0, v0, Lq5g;->d:Ljava/lang/Object;

    check-cast v0, Lowc;

    iget-object v0, v0, Lowc;->b:Landroid/widget/LinearLayout;

    new-instance v2, Lpkm;

    invoke-direct {v2, p0, v1}, Lpkm;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lg3b;->u:Ljava/lang/Object;

    check-cast v0, Lq5g;

    iget-object v0, v0, Lq5g;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance v1, Lev5;

    iget-object p0, p0, Lg3b;->t:Ljava/lang/Object;

    check-cast p0, Ltah;

    invoke-direct {v1, p2, p0}, Lev5;-><init>(Lfdn;Ltah;)V

    new-instance p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    const/4 p1, 0x1

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(IZ)V

    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    return-void

    :pswitch_data_9e
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 12

    iget-byte v0, p0, Lg3b;->r:B

    const-string v1, "Missing required view with ID: "

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_10a

    const v0, 0x7f0d0450

    invoke-virtual {p1, v0, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p2, 0x7f0a021d

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz v0, :cond_36

    const p2, 0x7f0a07c0

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_36

    invoke-static {v2}, Lowc;->a(Landroid/view/View;)Lowc;

    move-result-object p2

    new-instance v1, Lq5g;

    check-cast p1, Landroid/widget/LinearLayout;

    const/16 v2, 0xc

    invoke-direct {v1, p1, v0, p2, v2}, Lq5g;-><init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v1, p0, Lg3b;->u:Ljava/lang/Object;

    goto :goto_45

    :cond_36
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_45
    return-void

    :pswitch_46
    const v0, 0x7f0d0218

    invoke-virtual {p1, v0, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p2, 0x7f0a026e

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    if-eqz v0, :cond_f9

    const p2, 0x7f0a056f

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    if-eqz v0, :cond_f9

    const p2, 0x7f0a0577

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;

    if-eqz v0, :cond_f9

    const p2, 0x7f0a0579

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/google/android/material/button/MaterialButton;

    if-eqz v5, :cond_f9

    const p2, 0x7f0a057a

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lcom/google/android/material/button/MaterialButton;

    if-eqz v6, :cond_f9

    const p2, 0x7f0a086f

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Landroid/widget/TextView;

    if-eqz v7, :cond_f9

    new-instance v3, Lf2b;

    move-object v4, p1

    check-cast v4, Landroidx/constraintlayout/widget/ConstraintLayout;

    const/4 v8, 0x1

    invoke-direct/range {v3 .. v8}, Lf2b;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/google/android/material/button/MaterialButton;Lcom/google/android/material/button/MaterialButton;Landroid/widget/TextView;B)V

    iput-object v3, p0, Lg3b;->s:Ljava/lang/Object;

    const p1, 0x7f140bf3

    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Lowj;

    new-instance v0, Ljng;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    new-instance v3, Lrl;

    const/4 v4, 0x4

    invoke-direct {v3, v4}, Lrl;-><init>(B)V

    const/4 v4, 0x2

    invoke-direct {v0, v4, v1, v3}, Ljng;-><init>(ILandroid/content/Context;Ljava/lang/Runnable;)V

    const-string v1, "<ps>"

    const-string v3, "</ps>"

    invoke-direct {p2, v1, v3, v0}, Lowj;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/text/style/CharacterStyle;)V

    filled-new-array {p2}, [Lowj;

    move-result-object p2

    invoke-static {p1, p2}, Ln1h;->d(Ljava/lang/String;[Lowj;)Landroid/text/SpannableString;

    move-result-object p1

    iget-object p2, p0, Lg3b;->s:Ljava/lang/Object;

    check-cast p2, Lf2b;

    const/4 v0, 0x0

    if-nez p2, :cond_d0

    move-object p2, v0

    :cond_d0
    iget-object p2, p2, Lf2b;->e:Landroid/widget/TextView;

    invoke-static {p2, p1}, Lphj;->u0(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lg3b;->s:Ljava/lang/Object;

    check-cast p1, Lf2b;

    if-nez p1, :cond_dc

    move-object p1, v0

    :cond_dc
    iget-object p1, p1, Lf2b;->c:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Le3b;

    invoke-direct {p2, p0, v2}, Le3b;-><init>(Lg3b;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lg3b;->s:Ljava/lang/Object;

    check-cast p1, Lf2b;

    if-eqz p1, :cond_ed

    move-object v0, p1

    :cond_ed
    iget-object p1, v0, Lf2b;->d:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Le3b;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Le3b;-><init>(Lg3b;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_108

    :cond_f9
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_108
    return-void

    nop

    :pswitch_data_10a
    .packed-switch 0x0
        :pswitch_46
    .end packed-switch
.end method
