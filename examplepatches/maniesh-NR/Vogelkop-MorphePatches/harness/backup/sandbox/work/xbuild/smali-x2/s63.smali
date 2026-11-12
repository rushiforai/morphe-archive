.class public abstract Ls63;
.super Lk24;
.source "SourceFile"


# instance fields
.field public f:Landroid/widget/FrameLayout;

.field public g:Landroid/view/View;

.field public h:Landroid/view/View;

.field public i:Z

.field public j:Lepj;

.field public final k:Lr63;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lk24;-><init>()V

    new-instance v0, Lr63;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lr63;-><init>(Lk24;B)V

    iput-object v0, p0, Ls63;->k:Lr63;

    return-void
.end method

.method public static o0(Landroid/content/Context;)Lepj;
    .registers 4

    invoke-static {p0}, Lr9n;->i(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v0

    new-instance v1, Landroid/util/Size;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    invoke-direct {v1, v2, v0}, Landroid/util/Size;-><init>(II)V

    sget-object v0, Lepj;->a:Lcpj;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v0

    invoke-static {v0, p0}, Lddh;->s(ILandroid/content/Context;)Lgpj;

    move-result-object v0

    sget-object v2, Lgpj;->a:Lgpj;

    invoke-virtual {v0}, Lgpj;->d()Z

    move-result v0

    if-eqz v0, :cond_29

    sget-object p0, Lepj;->b:Lepj;

    return-object p0

    :cond_29
    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v0

    invoke-static {v0, p0}, Lddh;->t(ILandroid/content/Context;)Lhpj;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_4e

    const/4 v0, 0x1

    if-eq p0, v0, :cond_4b

    const/4 v0, 0x2

    if-eq p0, v0, :cond_48

    const/4 v0, 0x3

    if-ne p0, v0, :cond_43

    sget-object p0, Lepj;->f:Lepj;

    return-object p0

    :cond_43
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0

    :cond_48
    sget-object p0, Lepj;->e:Lepj;

    return-object p0

    :cond_4b
    sget-object p0, Lepj;->d:Lepj;

    return-object p0

    :cond_4e
    sget-object p0, Lepj;->c:Lepj;

    return-object p0
.end method

.method public static p0(Landroidx/fragment/app/w;)V
    .registers 4

    const/4 v0, -0x1

    const/4 v1, 0x1

    const-string v2, "flow-scan-intro"

    invoke-virtual {p0, v0, v1, v2}, Landroidx/fragment/app/w;->Y(IILjava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_22

    const-string v2, "flow-generate"

    invoke-virtual {p0, v0, v1, v2}, Landroidx/fragment/app/w;->Y(IILjava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_22

    const-string v2, "flow-code-verification"

    invoke-virtual {p0, v0, v1, v2}, Landroidx/fragment/app/w;->Y(IILjava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_22

    const-string v2, "two-factor-authentication"

    invoke-virtual {p0, v0, v1, v2}, Landroidx/fragment/app/w;->Y(IILjava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_23

    :cond_22
    return-void

    :cond_23
    invoke-virtual {p0}, Landroidx/fragment/app/w;->X()Z

    return-void
.end method


# virtual methods
.method public final n0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 3

    new-instance p2, Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p2, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Ls63;->f:Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Ls63;->q0()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object p1

    iget-object p2, p0, Ls63;->k:Lr63;

    iget-object p1, p1, Landroidx/fragment/app/w;->o:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Ls63;->f:Landroid/widget/FrameLayout;

    return-object p0
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object p1, p0, Ls63;->j:Lepj;

    if-eqz p1, :cond_17

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Ls63;->o0(Landroid/content/Context;)Lepj;

    move-result-object v0

    if-eq p1, v0, :cond_17

    invoke-virtual {p0}, Ls63;->r0()V

    invoke-virtual {p0}, Ls63;->q0()V

    :cond_17
    return-void
.end method

.method public final onDestroyView()V
    .registers 3

    invoke-virtual {p0}, Ls63;->r0()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    iget-object v1, p0, Ls63;->k:Lr63;

    iget-object v0, v0, Landroidx/fragment/app/w;->o:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-super {p0}, Lk24;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Ls63;->f:Landroid/widget/FrameLayout;

    return-void
.end method

.method public final onPause()V
    .registers 1

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onPause()V

    invoke-virtual {p0}, Ls63;->u0()V

    return-void
.end method

.method public final onResume()V
    .registers 1

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    invoke-virtual {p0}, Ls63;->v0()V

    return-void
.end method

.method public final q0()V
    .registers 9

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_131

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    invoke-static {v0}, Ls63;->o0(Landroid/content/Context;)Lepj;

    move-result-object v2

    iput-object v2, p0, Ls63;->j:Lepj;

    invoke-static {v0}, Ls63;->o0(Landroid/content/Context;)Lepj;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v0, :cond_30

    if-eq v0, v5, :cond_30

    if-eq v0, v2, :cond_2e

    const/4 v6, 0x3

    if-eq v0, v6, :cond_2e

    const/4 v6, 0x4

    if-eq v0, v6, :cond_2e

    new-instance p0, Ljava/lang/RuntimeException;

    invoke-direct {p0, v3, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0

    :cond_2e
    move v0, v5

    goto :goto_31

    :cond_30
    move v0, v4

    :goto_31
    iput-boolean v0, p0, Ls63;->i:Z

    iget-object v6, p0, Ls63;->f:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_6a

    const v0, 0x7f0d01b7

    invoke-virtual {v1, v0, v6, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    iget-object v0, p0, Ls63;->f:Landroid/widget/FrameLayout;

    sget-object v6, Lr5n;->a:Ljava/util/WeakHashMap;

    const v6, 0x7f0a02f0

    invoke-static {v0, v6}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iput-object v0, p0, Ls63;->g:Landroid/view/View;

    new-instance v6, Lq63;

    invoke-direct {v6, p0, v4}, Lq63;-><init>(Ls63;B)V

    invoke-virtual {v0, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Ls63;->g:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setFocusable(Z)V

    iget-object v0, p0, Ls63;->f:Landroid/widget/FrameLayout;

    const v6, 0x7f0a0418

    invoke-static {v0, v6}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iput-object v0, p0, Ls63;->h:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->setClipToOutline(Z)V

    goto :goto_8b

    :cond_6a
    const v0, 0x7f0d01b6

    invoke-virtual {v1, v0, v6, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    iget-object v0, p0, Ls63;->f:Landroid/widget/FrameLayout;

    sget-object v3, Lr5n;->a:Ljava/util/WeakHashMap;

    const v3, 0x7f0a0adb

    invoke-static {v0, v3}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    move-object v3, v0

    check-cast v3, Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-virtual {v3, v5}, Lcom/opera/android/StatusBarDrawingFrameLayout;->d(Z)V

    new-instance v0, Llje;

    invoke-direct {v0, v3, v4}, Llje;-><init>(Lcom/opera/android/StatusBarDrawingFrameLayout;B)V

    invoke-static {v3, v0}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    :goto_8b
    iget-object v0, p0, Ls63;->f:Landroid/widget/FrameLayout;

    const v6, 0x7f0a0269

    invoke-static {v0, v6}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Ls63;->o0(Landroid/content/Context;)Lepj;

    move-result-object v6

    invoke-virtual {p0, v1, v0, v6}, Ls63;->s0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Lepj;)Ldgh;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isResumed()Z

    move-result v1

    if-eqz v1, :cond_ad

    invoke-virtual {p0}, Ls63;->v0()V

    :cond_ad
    iget-object v1, p0, Ls63;->f:Landroid/widget/FrameLayout;

    const v6, 0x7f0a0231

    invoke-static {v1, v6}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageView;

    new-instance v6, Lq63;

    invoke-direct {v6, p0, v5}, Lq63;-><init>(Ls63;B)V

    invoke-virtual {v1, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p0, Ls63;->f:Landroid/widget/FrameLayout;

    const v6, 0x7f0a02a3

    invoke-static {v1, v6}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    new-instance v6, Lu7;

    const/16 v7, 0xf

    invoke-direct {v6, p0, v7}, Lu7;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1, v6}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    iget-boolean v1, p0, Ls63;->i:Z

    if-eqz v1, :cond_de

    invoke-virtual {p0}, Ls63;->x0()V

    :cond_de
    if-eqz v3, :cond_131

    if-eqz v0, :cond_12e

    instance-of p0, v0, Lick;

    if-eqz p0, :cond_f2

    new-instance p0, Llje;

    invoke-direct {p0, v3, v5}, Llje;-><init>(Lcom/opera/android/StatusBarDrawingFrameLayout;B)V

    invoke-static {v3, p0}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {p0, v3}, Llje;->a(Landroid/view/View;)V

    return-void

    :cond_f2
    instance-of p0, v0, Lhck;

    if-eqz p0, :cond_106

    new-instance p0, Le73;

    check-cast v0, Lhck;

    const/16 v1, 0xc

    invoke-direct {p0, v3, v0, v1}, Le73;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v3, p0}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {p0, v3}, Le73;->a(Landroid/view/View;)V

    return-void

    :cond_106
    instance-of p0, v0, Lkck;

    if-eqz p0, :cond_12e

    invoke-virtual {v3, v4}, Lcom/opera/android/StatusBarDrawingFrameLayout;->c(Z)V

    check-cast v0, Lkck;

    iget-object p0, v0, Lkck;->a:Ljava/util/List;

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_117
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_131

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    new-instance v1, Lkje;

    invoke-direct {v1, v0, v2}, Lkje;-><init>(Landroid/view/View;B)V

    sget-object v3, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {v0, v1}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    goto :goto_117

    :cond_12e
    invoke-static {}, Lh9o;->p()V

    :cond_131
    return-void
.end method

.method public final r0()V
    .registers 2

    iget-object v0, p0, Ls63;->j:Lepj;

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-virtual {p0}, Ls63;->u0()V

    :cond_e
    invoke-virtual {p0}, Ls63;->t0()V

    iget-object v0, p0, Ls63;->f:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    const/4 v0, 0x0

    iput-object v0, p0, Ls63;->j:Lepj;

    iput-object v0, p0, Ls63;->g:Landroid/view/View;

    iput-object v0, p0, Ls63;->h:Landroid/view/View;

    return-void
.end method

.method public abstract s0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Lepj;)Ldgh;
.end method

.method public t0()V
    .registers 1

    return-void
.end method

.method public u0()V
    .registers 1

    return-void
.end method

.method public v0()V
    .registers 1

    return-void
.end method

.method public final w0(Landroid/content/Context;)V
    .registers 3

    const/16 v0, 0x1003

    invoke-static {p0, v0}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p0

    invoke-virtual {p0, p1}, Lzhj;->c(Landroid/content/Context;)V

    return-void
.end method

.method public final x0()V
    .registers 7

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    iget-object p0, p0, Landroidx/fragment/app/w;->c:Landroidx/fragment/app/a0;

    invoke-virtual {p0}, Landroidx/fragment/app/a0;->f()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x1

    :cond_f
    :goto_f
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_56

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment;

    instance-of v2, v1, Ls63;

    if-eqz v2, :cond_f

    check-cast v1, Ls63;

    iget-object v2, v1, Ls63;->g:Landroid/view/View;

    if-eqz v2, :cond_f

    iget-object v3, v1, Ls63;->h:Landroid/view/View;

    if-eqz v3, :cond_f

    iget-boolean v3, v1, Ls63;->i:Z

    if-eqz v3, :cond_f

    const/4 v3, 0x0

    if-eqz v0, :cond_3c

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f0600ae

    invoke-virtual {v4, v5}, Landroid/content/Context;->getColor(I)I

    move-result v4

    goto :goto_3d

    :cond_3c
    move v4, v3

    :goto_3d
    invoke-virtual {v2, v4}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object v1, v1, Ls63;->h:Landroid/view/View;

    if-eqz v0, :cond_50

    const/high16 v0, 0x41c00000    # 24.0f

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v0, v2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v0

    int-to-float v0, v0

    goto :goto_51

    :cond_50
    const/4 v0, 0x0

    :goto_51
    invoke-virtual {v1, v0}, Landroid/view/View;->setElevation(F)V

    move v0, v3

    goto :goto_f

    :cond_56
    return-void
.end method
