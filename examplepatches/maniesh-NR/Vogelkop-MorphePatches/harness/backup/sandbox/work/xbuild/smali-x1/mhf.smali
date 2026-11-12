.class public final Lmhf;
.super Lfp7;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0008\u0007\u0018\u00002\u00020\u0001:\u0004\u0004\u0005\u0006\u0007B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0008"
    }
    d2 = {
        "Lmhf;",
        "Lfp7;",
        "<init>",
        "()V",
        "x79",
        "z4o",
        "ihf",
        "lhf",
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
.field public final g:Lzyk;

.field public h:Lihf;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lfp7;-><init>()V

    new-instance v0, Lyse;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lyse;-><init>(Landroidx/fragment/app/Fragment;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lmhf;->g:Lzyk;

    return-void
.end method

.method public static q0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Lihf;)Lx79;
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    iget-boolean v2, v2, Lihf;->b:Z

    const/4 v3, 0x0

    const-string v4, "Missing required view with ID: "

    const v5, 0x7f0a069d

    const v6, 0x7f0a0520

    const v7, 0x7f0a02a3

    const v8, 0x7f0a0281

    const v9, 0x7f0a0231

    const/4 v10, 0x0

    if-eqz v2, :cond_b1

    const v2, 0x7f0d01e6

    invoke-virtual {v0, v2, v1, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-static {v9, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v13, v1

    check-cast v13, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v13, :cond_a0

    invoke-static {v8, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v14, v1

    check-cast v14, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v14, :cond_9e

    invoke-static {v7, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/touch/CurveOverlayView;

    if-eqz v1, :cond_9c

    const v1, 0x7f0a0390

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v2, :cond_9a

    invoke-static {v6, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v1, :cond_98

    const v1, 0x7f0a07d4

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/opera/android/OverlaidStatusBarDrawingView;

    if-eqz v6, :cond_9a

    const v1, 0x7f0a0aca

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/FrameLayout;

    if-eqz v7, :cond_9a

    invoke-static {v5, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v1, :cond_a1

    move-object v12, v0

    check-cast v12, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v11, Lx79;

    const/4 v0, 0x2

    new-array v0, v0, [Landroid/view/ViewGroup;

    aput-object v7, v0, v10

    const/4 v1, 0x1

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v15

    new-instance v0, Lkhf;

    new-instance v1, Lfxh;

    const v2, 0x7f0600aa

    invoke-direct {v1, v2}, Lfxh;-><init>(I)V

    sget-object v2, Lwuf;->a:Lwuf;

    invoke-direct {v0, v6, v1}, Lkhf;-><init>(Lcom/opera/android/OverlaidStatusBarDrawingView;Lfxh;)V

    move-object/from16 v16, v0

    invoke-direct/range {v11 .. v16}, Lx79;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v11

    :cond_98
    move v5, v6

    goto :goto_a1

    :cond_9a
    move v5, v1

    goto :goto_a1

    :cond_9c
    move v5, v7

    goto :goto_a1

    :cond_9e
    move v5, v8

    goto :goto_a1

    :cond_a0
    move v5, v9

    :cond_a1
    :goto_a1
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v3

    :cond_b1
    const v2, 0x7f0d01e5

    invoke-virtual {v0, v2, v1, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a014c

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout;

    if-eqz v2, :cond_112

    invoke-static {v9, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v12, v1

    check-cast v12, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v12, :cond_110

    invoke-static {v8, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v13, v1

    check-cast v13, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v13, :cond_10e

    invoke-static {v7, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/touch/CurveOverlayView;

    if-eqz v1, :cond_10c

    invoke-static {v6, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v1, :cond_10a

    invoke-static {v5, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v1, :cond_113

    move-object v11, v0

    check-cast v11, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v10, Lx79;

    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v14

    new-instance v15, Ljhf;

    new-instance v0, Ldxh;

    const v1, 0x7f040a75

    invoke-direct {v0, v1}, Ldxh;-><init>(I)V

    invoke-direct {v15, v0}, Ljhf;-><init>(Ldxh;)V

    invoke-direct/range {v10 .. v15}, Lx79;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v10

    :cond_10a
    move v5, v6

    goto :goto_113

    :cond_10c
    move v5, v7

    goto :goto_113

    :cond_10e
    move v5, v8

    goto :goto_113

    :cond_110
    move v5, v9

    goto :goto_113

    :cond_112
    move v5, v1

    :cond_113
    :goto_113
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v3
.end method


# virtual methods
.method public final o0(Landroid/view/LayoutInflater;Landroid/widget/FrameLayout;)V
    .registers 11

    invoke-virtual {p0}, Lmhf;->p0()Lihf;

    move-result-object v0

    iput-object v0, p0, Lmhf;->h:Lihf;

    iget-boolean v1, v0, Lihf;->a:Z

    const/4 v2, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v1, :cond_54

    const v1, 0x7f0d013c

    invoke-virtual {p1, v1, p2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p2, 0x7f0a0269

    invoke-static {p2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    if-eqz v5, :cond_42

    move-object p2, v1

    check-cast p2, Landroidx/constraintlayout/widget/ConstraintLayout;

    const v6, 0x7f0a0418

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    if-eqz v7, :cond_41

    invoke-virtual {v7, v3}, Landroid/view/View;->setClipToOutline(Z)V

    new-instance v1, Lhhf;

    invoke-direct {v1, p0, v4}, Lhhf;-><init>(Lmhf;B)V

    invoke-virtual {p2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static {p1, v5, v0}, Lmhf;->q0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Lihf;)Lx79;

    move-result-object p1

    goto/16 :goto_c1

    :cond_41
    move p2, v6

    :cond_42
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_54
    invoke-static {p1, p2, v0}, Lmhf;->q0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Lihf;)Lx79;

    move-result-object p1

    iget-object p2, p1, Lx79;->a:Ljava/lang/Object;

    check-cast p2, Landroidx/constraintlayout/widget/ConstraintLayout;

    iget-object v0, p1, Lx79;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_66
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    new-instance v5, Lodf;

    invoke-direct {v5, v2}, Lodf;-><init>(B)V

    sget-object v6, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {v1, v5}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    goto :goto_66

    :cond_7d
    iget-object v0, p1, Lx79;->e:Ljava/lang/Object;

    check-cast v0, Lz4o;

    instance-of v1, v0, Ljhf;

    if-eqz v1, :cond_8f

    new-instance v1, Llhf;

    check-cast v0, Ljhf;

    iget-object v0, v0, Ljhf;->r:Ldxh;

    invoke-direct {v1, p2, v0}, Llhf;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcxh;)V

    goto :goto_c1

    :cond_8f
    instance-of v1, v0, Lkhf;

    if-eqz v1, :cond_da

    new-instance v1, Llhf;

    new-instance v5, Lgxh;

    invoke-direct {v5, v4}, Lgxh;-><init>(I)V

    invoke-direct {v1, p2, v5}, Llhf;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcxh;)V

    move-object p2, v0

    check-cast p2, Lkhf;

    iget-object p2, p2, Lkhf;->r:Lcom/opera/android/OverlaidStatusBarDrawingView;

    sget-object v1, Lwuf;->b:Lwuf;

    iget-object v4, p2, Lcom/opera/android/OverlaidStatusBarDrawingView;->f:Lwuf;

    if-eq v1, v4, :cond_b4

    iput-object v1, p2, Lcom/opera/android/OverlaidStatusBarDrawingView;->f:Lwuf;

    invoke-virtual {p2}, Landroid/view/View;->invalidate()V

    iget-object v1, p2, Lcom/opera/android/OverlaidStatusBarDrawingView;->c:Lc1f;

    if-eqz v1, :cond_b4

    invoke-virtual {v1}, Lc1f;->e()V

    :cond_b4
    new-instance v1, Llzb;

    const/16 v4, 0x1b

    invoke-direct {v1, v0, v4}, Llzb;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2, v1}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {v1, p2}, Llzb;->a(Landroid/view/View;)V

    :goto_c1
    iget-object p2, p1, Lx79;->b:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/custom_views/StylingImageButton;

    new-instance v0, Lhhf;

    invoke-direct {v0, p0, v3}, Lhhf;-><init>(Lmhf;B)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p1, Lx79;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    new-instance p2, Lhhf;

    invoke-direct {p2, p0, v2}, Lhhf;-><init>(Lmhf;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_da
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 4

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object p1, p0, Lmhf;->h:Lihf;

    invoke-virtual {p0}, Lmhf;->p0()Lihf;

    move-result-object v0

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3b

    iget-object p1, p0, Lfp7;->f:Landroid/widget/FrameLayout;

    const/4 v0, 0x0

    if-eqz p1, :cond_1d

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p1

    const/4 v1, 0x1

    if-nez p1, :cond_1c

    move v0, v1

    :cond_1c
    xor-int/2addr v0, v1

    :cond_1d
    if-eqz v0, :cond_3b

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isResumed()Z

    iget-object p1, p0, Lfp7;->f:Landroid/widget/FrameLayout;

    if-eqz p1, :cond_29

    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    :cond_29
    iget-object p1, p0, Lfp7;->f:Landroid/widget/FrameLayout;

    if-eqz p1, :cond_38

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lmhf;->o0(Landroid/view/LayoutInflater;Landroid/widget/FrameLayout;)V

    :cond_38
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isResumed()Z

    :cond_3b
    return-void
.end method

.method public final p0()Lihf;
    .registers 4

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lr9n;->i(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v1

    invoke-static {v1, p0}, Lddh;->s(ILandroid/content/Context;)Lgpj;

    move-result-object v1

    sget-object v2, Lgpj;->a:Lgpj;

    invoke-virtual {v1}, Lgpj;->d()Z

    move-result v1

    new-instance v2, Lihf;

    if-nez v1, :cond_2b

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-static {v0, p0}, Lddh;->t(ILandroid/content/Context;)Lhpj;

    move-result-object p0

    sget-object v0, Lhpj;->a:Lhpj;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    const/4 v0, 0x1

    if-ge p0, v0, :cond_2c

    :cond_2b
    const/4 v0, 0x0

    :cond_2c
    invoke-direct {v2, v0, v1}, Lihf;-><init>(ZZ)V

    return-object v2
.end method
