.class public final Lcvg;
.super Lltl;
.source "SourceFile"

# interfaces
.implements Lsni;


# instance fields
.field public final r:Lz77;

.field public final s:Lrn9;

.field public final t:Ltah;

.field public u:Ltn;

.field public v:Ltni;

.field public w:Los1;


# direct methods
.method public constructor <init>(Lnvg;Lz77;Ldb;Lxb;Lfmk;Laf3;Lslk;Lskm;Lebh;)V
    .registers 21

    const v0, 0x7f0d0342

    invoke-static {v0}, Lu7k;->j(I)Lu7k;

    move-result-object v0

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    iput-object p2, p0, Lcvg;->r:Lz77;

    invoke-virtual/range {p5 .. p5}, Lfmk;->b()V

    new-instance v0, Lrn9;

    const/16 v2, 0x1b

    invoke-direct {v0, p0, v2}, Lrn9;-><init>(Lk24;B)V

    iput-object v0, p0, Lcvg;->s:Lrn9;

    new-instance v0, Ltah;

    move-object v3, p0

    move-object v1, p0

    move-object v2, p1

    move-object v4, p3

    move-object v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    invoke-direct/range {v0 .. v10}, Ltah;-><init>(Lcvg;Lnvg;Lcvg;Ldb;Lxb;Lfmk;Laf3;Lslk;Lskm;Lebh;)V

    iput-object v0, p0, Lcvg;->t:Ltah;

    return-void
.end method


# virtual methods
.method public final G0(Landroid/view/LayoutInflater;Landroid/view/View;)V
    .registers 15

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    const v0, 0x7f0a0797

    invoke-static {p2, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    check-cast p2, Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/opera/android/utilities/DisplayUtil;->f(Landroid/content/Context;)V

    sget v1, Lcom/opera/android/utilities/DisplayUtil;->f:F

    invoke-static {v0, v1}, Lcom/opera/android/utilities/DisplayUtil;->d(Landroid/content/Context;F)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_31

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_31

    const v0, 0x7f0d0343

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    goto :goto_37

    :cond_31
    const v0, 0x7f0d0341

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    :goto_37
    new-instance p1, Ltn;

    const v0, 0x7f0a083b

    invoke-static {p2, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Landroid/view/ViewStub;

    const v1, 0x7f0a0102

    invoke-static {p2, v1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    check-cast v1, Landroid/widget/Button;

    iget-object v2, p0, Lcvg;->t:Ltah;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v3, Lr9g;

    const/4 v4, 0x6

    invoke-direct {v3, v2, v4}, Lr9g;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    const v2, 0x7f0d0344

    invoke-virtual {v0, v2}, Landroid/view/ViewStub;->setLayoutResource(I)V

    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v0

    const v2, 0x7f0a0613

    invoke-static {v2, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    if-eqz v7, :cond_11c

    const v2, 0x7f0a083a

    invoke-static {v2, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v8, v5

    check-cast v8, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;

    if-eqz v8, :cond_11c

    const v2, 0x7f0a083c

    invoke-static {v2, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v9, v5

    check-cast v9, Landroid/widget/LinearLayout;

    if-eqz v9, :cond_11c

    const v2, 0x7f0a0bf5

    invoke-static {v2, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v10, v5

    check-cast v10, Landroid/widget/TextView;

    if-eqz v10, :cond_11c

    new-instance v5, Lor2;

    move-object v6, v0

    check-cast v6, Landroid/widget/FrameLayout;

    const/16 v11, 0x16

    invoke-direct/range {v5 .. v11}, Lor2;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v5, p1, Ltn;->b:Ljava/lang/Object;

    iput-object v1, p1, Ltn;->c:Ljava/lang/Object;

    iput-object v3, p1, Ltn;->d:Ljava/lang/Object;

    new-instance v0, Lhz0;

    invoke-direct {v0, v4}, Lhz0;-><init>(B)V

    invoke-static {v7, v0}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {v0, v7}, Lhz0;->a(Landroid/view/View;)V

    new-instance v0, Lr9g;

    const/4 v2, 0x7

    invoke-direct {v0, p1, v2}, Lr9g;-><init>(Ljava/lang/Object;B)V

    iput-object v0, v8, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->b:Lvlk;

    new-instance v0, Lzvd;

    const/16 v2, 0x16

    invoke-direct {v0, p1, v2}, Lzvd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object p1, p0, Lcvg;->u:Ltn;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcxc;->t(Landroid/content/Context;)Lcxc;

    move-result-object p1

    invoke-virtual {p1}, Lno7;->i()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lbxc;

    const/16 v0, 0x17

    invoke-virtual {p1, v0, p0}, Lbxc;->a(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f0a06c5

    if-eqz v0, :cond_e8

    invoke-static {p2, v1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_f6

    :cond_e8
    invoke-static {p2, v1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f1413c6

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    :goto_f6
    const/16 v0, 0x18

    invoke-virtual {p1, v0, p0}, Lbxc;->a(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    const p1, 0x7f0a02d0

    if-eqz p0, :cond_10d

    invoke-static {p2, p1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    check-cast p1, Landroid/widget/TextView;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_10d
    invoke-static {p2, p1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    check-cast p0, Landroid/widget/TextView;

    const p1, 0x7f1413c5

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    return-void

    :cond_11c
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public final H0(Lgvg;)V
    .registers 7

    if-eqz p1, :cond_e

    iget-object v0, p1, Lgvg;->a:Lfvg;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_4f

    const/4 v2, 0x1

    if-eq v0, v2, :cond_f

    :cond_e
    return-void

    :cond_f
    check-cast p1, Ldvg;

    iget-object p1, p1, Ldvg;->b:Lbmk;

    iget-object p0, p0, Lcvg;->u:Ltn;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-boolean v0, p1, Lbmk;->e:Z

    iput-boolean v0, p0, Ltn;->a:Z

    iget-object v0, p0, Ltn;->b:Ljava/lang/Object;

    check-cast v0, Lor2;

    iget-object v3, v0, Lor2;->d:Ljava/lang/Object;

    check-cast v3, Landroid/view/View;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    iget-object v3, v0, Lor2;->f:Ljava/lang/Object;

    check-cast v3, Landroid/widget/LinearLayout;

    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, v0, Lor2;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;

    iget-object v1, p1, Lbmk;->c:Lcsh;

    new-instance v3, Lf8d;

    iget-boolean v4, p0, Ltn;->a:Z

    xor-int/2addr v4, v2

    iget p1, p1, Lbmk;->d:F

    invoke-direct {v3, p1, v4}, Lf8d;-><init>(FZ)V

    invoke-virtual {v0, v1, v3}, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->d(Ljava/util/List;Lf8d;)V

    const/4 p1, 0x0

    invoke-virtual {v0, p1, v2}, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->f(Ljava/lang/String;Z)Z

    iget-object p0, p0, Ltn;->c:Ljava/lang/Object;

    check-cast p0, Landroid/widget/Button;

    invoke-virtual {p0, v2}, Landroid/view/View;->setEnabled(Z)V

    return-void

    :cond_4f
    check-cast p1, Levg;

    iget-object p0, p0, Lcvg;->u:Ltn;

    iget-object p1, p0, Ltn;->b:Ljava/lang/Object;

    check-cast p1, Lor2;

    iget-object v0, p1, Lor2;->d:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p1, Lor2;->f:Ljava/lang/Object;

    check-cast p1, Landroid/widget/LinearLayout;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Ltn;->c:Ljava/lang/Object;

    check-cast p0, Landroid/widget/Button;

    invoke-virtual {p0, v1}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method public final Y(Z)V
    .registers 4

    iget-object p1, p0, Lcvg;->u:Ltn;

    iget-object p1, p1, Ltn;->b:Ljava/lang/Object;

    check-cast p1, Lor2;

    iget-object p1, p1, Lor2;->e:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;

    invoke-virtual {p1}, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->a()Lamk;

    move-result-object p1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireView()Landroid/view/View;

    move-result-object v0

    sget-object v1, Lr5n;->a:Ljava/util/WeakHashMap;

    const v1, 0x7f0a0797

    invoke-static {v0, v1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcvg;->G0(Landroid/view/LayoutInflater;Landroid/view/View;)V

    iget-object v0, p0, Lcvg;->t:Ltah;

    iget-object v0, v0, Ltah;->j:Ljava/lang/Object;

    check-cast v0, Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgvg;

    invoke-virtual {p0, v0}, Lcvg;->H0(Lgvg;)V

    if-eqz p1, :cond_54

    iget-object p0, p0, Lcvg;->u:Ltn;

    iget-object p1, p1, Lamk;->a:Lzsk;

    iget-object p1, p1, Lzsk;->a:Ljava/lang/String;

    iget-object p0, p0, Ltn;->b:Ljava/lang/Object;

    check-cast p0, Lor2;

    iget-object p0, p0, Lor2;->e:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->f(Ljava/lang/String;Z)Z

    :cond_54
    return-void
.end method

.method public final h0(Landroidx/fragment/app/w;)V
    .registers 2

    iget-object p0, p0, Lcvg;->t:Ltah;

    iget-object p0, p0, Ltah;->c:Ljava/lang/Object;

    check-cast p0, Lnvg;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lnvg;->a(I)V

    return-void
.end method

.method public final k0()I
    .registers 1

    const p0, 0x7f0407e2

    return p0
.end method

.method public final onAttach(Landroid/content/Context;)V
    .registers 3

    invoke-super {p0, p1}, Lk24;->onAttach(Landroid/content/Context;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p1

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    check-cast p1, Lcom/opera/android/BrowserActivity;

    iget-object p1, p1, Ldx3;->l:Ltni;

    iput-object p1, p0, Lcvg;->v:Ltni;

    invoke-virtual {p1, p0}, Ltni;->a(Lsni;)V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 6

    invoke-super {p0, p1}, Lltl;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object p1

    iget-object v0, p0, Lcvg;->t:Ltah;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lbvg;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Lbvg;-><init>(Ltah;B)V

    iget-object p0, p0, Lcvg;->s:Lrn9;

    iput-object p1, p0, Lrn9;->d:Ljava/lang/Object;

    iget-object v0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast v0, Lltl;

    new-instance v2, Lmgf;

    const/16 v3, 0x11

    invoke-direct {v2, p0, v1, v3}, Lmgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const-string p0, "SyncAuthPortalFragment_request"

    invoke-virtual {p1, p0, v0, v2}, Landroidx/fragment/app/w;->i0(Ljava/lang/String;Lndc;Lmm9;)V

    return-void
.end method

.method public final onDetach()V
    .registers 2

    invoke-super {p0}, Lk24;->onDetach()V

    iget-object v0, p0, Lcvg;->v:Ltni;

    invoke-virtual {v0, p0}, Ltni;->c(Lsni;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcvg;->v:Ltni;

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 5

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const p2, 0x7f0a08ea

    invoke-static {p1, p2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    new-instance p2, Lzvd;

    const/16 v0, 0x15

    invoke-direct {p2, p0, v0}, Lzvd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcvg;->t:Ltah;

    iget-object p1, p1, Ltah;->j:Ljava/lang/Object;

    check-cast p1, Lode;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    new-instance v0, Ld8d;

    const/16 v1, 0x19

    invoke-direct {v0, p0, v1}, Ld8d;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2, v0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public final s0()I
    .registers 1

    const p0, 0x7f14044d

    return p0
.end method

.method public final t0(Landroid/content/Context;)I
    .registers 2

    const p0, 0x7f080522

    return p0
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 3

    invoke-virtual {p0, p1, p2}, Lcvg;->G0(Landroid/view/LayoutInflater;Landroid/view/View;)V

    return-void
.end method
