.class public final Lln5;
.super Landroidx/fragment/app/Fragment;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Leak;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u0003B\u0007\u00a2\u0006\u0004\u0008\u0004\u0010\u0005\u00a8\u0006\u0006"
    }
    d2 = {
        "Lln5;",
        "Landroidx/fragment/app/Fragment;",
        "Landroid/view/View$OnClickListener;",
        "Leak;",
        "<init>",
        "()V",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public a:Lpt1;

.field public final b:Lpde;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    new-instance v0, Lpde;

    sget-object v1, Lkl0;->h:Lkl0;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lln5;->b:Lpde;

    return-void
.end method


# virtual methods
.method public final T()Likc;
    .registers 1

    iget-object p0, p0, Lln5;->b:Lpde;

    return-object p0
.end method

.method public final onAttach(Landroid/content/Context;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p1

    check-cast p1, Lcom/opera/android/startup/WelcomeActivity;

    invoke-virtual {p1}, Lcom/opera/android/startup/WelcomeActivity;->T()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    check-cast p0, Lcom/opera/android/startup/WelcomeActivity;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/opera/android/startup/WelcomeActivity;->V(Z)V

    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 7

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "key.consents"

    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iget-object v1, p0, Lln5;->a:Lpt1;

    const/4 v2, 0x0

    if-nez v1, :cond_10

    move-object v1, v2

    :cond_10
    iget-object v1, v1, Lpt1;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    iget-object v3, p0, Lln5;->a:Lpt1;

    const/4 v4, 0x0

    if-eqz v1, :cond_37

    if-eqz v3, :cond_20

    move-object v2, v3

    :cond_20
    iget-object p1, v2, Lpt1;->g:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p1, v4}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    check-cast p0, Lcom/opera/android/startup/WelcomeActivity;

    new-instance p1, Lo2c;

    const/4 v1, 0x1

    invoke-direct {p1, v0, v0, v1, v4}, Lo2c;-><init>(IIZZ)V

    invoke-virtual {p0, p1}, Lcom/opera/android/startup/WelcomeActivity;->K(Lo2c;)V

    return-void

    :cond_37
    if-nez v3, :cond_3a

    move-object v3, v2

    :cond_3a
    iget-object v1, v3, Lpt1;->g:Landroid/view/View;

    check-cast v1, Lcom/google/android/material/button/MaterialButton;

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_95

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    check-cast p0, Lcom/opera/android/startup/WelcomeActivity;

    iget-object p1, p0, Lcom/opera/android/startup/WelcomeActivity;->v:Lxbf;

    iget-object p1, p1, Lxbf;->f:Ljava/lang/Object;

    check-cast p1, Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lmdf;

    iget-object v1, p1, Lmdf;->e:Ljava/util/ArrayList;

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->R(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkl0;

    if-eqz v1, :cond_65

    sget-object v3, Lgl0;->f:Lgl0;

    invoke-virtual {p1, v1, v3}, Lmdf;->a(Lkl0;Lgl0;)V

    :cond_65
    iget-object p0, p0, Lcom/opera/android/startup/WelcomeActivity;->n:Lbl9;

    if-eqz p0, :cond_95

    new-instance p1, Lc76;

    invoke-direct {p1}, Lc76;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v3, "key.asked_consents"

    invoke-virtual {v1, v3, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {p1, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    new-instance v0, Lmn9;

    invoke-direct {v0, v2, v4, v2}, Lmn9;-><init>(Ls65;ZLx65;)V

    iget-object v1, p0, Lbl9;->d:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/fragment/app/Fragment;

    invoke-virtual {v1, p1}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    new-instance v1, Lvr9;

    invoke-direct {v1, p0, v2}, Lvr9;-><init>(Lbl9;Landroidx/fragment/app/Fragment;)V

    invoke-virtual {p0, p1, v2, v0, v1}, Lbl9;->b(Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;Lzm9;Ljava/lang/Runnable;)V

    :cond_95
    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 7

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f07097d

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f07097c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f07097b

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iget-object v3, p0, Lln5;->a:Lpt1;

    const/4 v4, 0x0

    if-nez v3, :cond_2a

    move-object v3, v4

    :cond_2a
    iget-object v3, v3, Lpt1;->f:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/custom_views/OperaButtonBarLayout;

    invoke-virtual {v3, p1, v1, p1, v2}, Landroid/view/View;->setPaddingRelative(IIII)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iget-object v0, p0, Lln5;->a:Lpt1;

    if-nez v0, :cond_3f

    move-object v1, v4

    goto :goto_40

    :cond_3f
    move-object v1, v0

    :goto_40
    iget-object v1, v1, Lpt1;->c:Landroid/view/View;

    check-cast v1, Lcom/jensdriller/libs/undobar/MaxWidthLinearLayout;

    if-nez v0, :cond_47

    move-object v0, v4

    :cond_47
    iget-object v0, v0, Lpt1;->c:Landroid/view/View;

    check-cast v0, Lcom/jensdriller/libs/undobar/MaxWidthLinearLayout;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    iget-object p0, p0, Lln5;->a:Lpt1;

    if-eqz p0, :cond_54

    move-object v4, p0

    :cond_54
    iget-object p0, v4, Lpt1;->c:Landroid/view/View;

    check-cast p0, Lcom/jensdriller/libs/undobar/MaxWidthLinearLayout;

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result p0

    invoke-virtual {v1, p1, v0, p1, p0}, Landroid/view/View;->setPaddingRelative(IIII)V

    return-void
.end method

.method public final onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 12

    const p3, 0x7f0d00d6

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0a00e6

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    move-object v2, p3

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v2, :cond_9d

    const p2, 0x7f0a01ae

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    move-object v3, p3

    check-cast v3, Lcom/opera/android/custom_views/OperaButtonBarLayout;

    if-eqz v3, :cond_9d

    const p2, 0x7f0a026e

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    move-object v4, p3

    check-cast v4, Lcom/jensdriller/libs/undobar/MaxWidthLinearLayout;

    if-eqz v4, :cond_9d

    const p2, 0x7f0a02b1

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    move-object v5, p3

    check-cast v5, Lcom/google/android/material/button/MaterialButton;

    if-eqz v5, :cond_9d

    const p2, 0x7f0a04aa

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/TextView;

    if-eqz p3, :cond_9d

    const p2, 0x7f0a04c3

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    move-object v6, p3

    check-cast v6, Landroid/widget/TextView;

    if-eqz v6, :cond_9d

    const p2, 0x7f0a0621

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/ImageView;

    if-eqz p3, :cond_9d

    const p2, 0x7f0a082c

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/RelativeLayout;

    if-eqz p3, :cond_9d

    const p2, 0x7f0a082d

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz p3, :cond_9d

    const p2, 0x7f0a082e

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/RelativeLayout;

    if-eqz p3, :cond_9d

    const p2, 0x7f0a082f

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz p3, :cond_9d

    const p2, 0x7f0a06c5

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/TextView;

    if-eqz p3, :cond_9d

    new-instance v0, Lpt1;

    move-object v1, p1

    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    const/4 v7, 0x3

    invoke-direct/range {v0 .. v7}, Lpt1;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Landroid/view/View;Landroid/view/View;Landroid/view/View;B)V

    iput-object v0, p0, Lln5;->a:Lpt1;

    return-object v1

    :cond_9d
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 6

    invoke-super {p0, p1, p2}, Landroidx/fragment/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Lln5;->a:Lpt1;

    const/4 p2, 0x0

    if-nez p1, :cond_9

    move-object p1, p2

    :cond_9
    iget-object p1, p1, Lpt1;->e:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lln5;->a:Lpt1;

    if-nez p1, :cond_15

    move-object p1, p2

    :cond_15
    iget-object p1, p1, Lpt1;->g:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lln5;->a:Lpt1;

    if-nez p1, :cond_22

    move-object v0, p2

    goto :goto_23

    :cond_22
    move-object v0, p1

    :goto_23
    iget-object v0, v0, Lpt1;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    if-nez p1, :cond_2a

    move-object p1, p2

    :cond_2a
    iget-object p1, p1, Lpt1;->b:Landroid/view/View;

    check-cast p1, Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v1, 0x7f1404ba

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance v1, Lvk2;

    const/16 v2, 0x8

    invoke-direct {v1, v2}, Lvk2;-><init>(B)V

    invoke-static {v0, p1, v1}, Lphj;->b0(Landroid/widget/TextView;Ljava/lang/String;Lcom/opera/api/Callback;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "key.should_fade_buttons"

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_75

    iget-object p1, p0, Lln5;->a:Lpt1;

    if-nez p1, :cond_54

    move-object p1, p2

    :cond_54
    iget-object p1, p1, Lpt1;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/OperaButtonBarLayout;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const-wide/16 v0, 0x15e

    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const-wide/16 v0, 0x2bc

    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_75
    iget-object p0, p0, Lln5;->a:Lpt1;

    if-eqz p0, :cond_7a

    move-object p2, p0

    :cond_7a
    iget-object p0, p2, Lpt1;->d:Ljava/lang/Object;

    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance p1, Lyq4;

    const/16 p2, 0x17

    invoke-direct {p1, p2}, Lyq4;-><init>(B)V

    sget-object p2, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {p0, p1}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    return-void
.end method
