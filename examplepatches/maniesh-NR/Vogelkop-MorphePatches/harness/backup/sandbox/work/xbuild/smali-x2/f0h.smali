.class public final Lf0h;
.super Lj83;
.source "SourceFile"


# instance fields
.field public final a:Lumi;

.field public final b:Lp0h;

.field public final c:Lwzg;

.field public final d:Lx5f;

.field public final e:Z

.field public final f:Lgjm;

.field public g:Lo4g;


# direct methods
.method public constructor <init>(Lumi;Lp0h;Lwzg;Lx5f;ZLgjm;)V
    .registers 7

    invoke-direct {p0}, Lj83;-><init>()V

    iput-object p1, p0, Lf0h;->a:Lumi;

    iput-object p2, p0, Lf0h;->b:Lp0h;

    iput-object p3, p0, Lf0h;->c:Lwzg;

    iput-object p4, p0, Lf0h;->d:Lx5f;

    iput-boolean p5, p0, Lf0h;->e:Z

    iput-object p6, p0, Lf0h;->f:Lgjm;

    return-void
.end method

.method public static h0(Lcom/opera/android/ui/catalog/widget/OperaListItem;Lo0h;II)V
    .registers 4

    iget-boolean p1, p1, Lo0h;->c:Z

    if-eqz p1, :cond_11

    new-instance p1, Llxh;

    invoke-direct {p1, p2}, Llxh;-><init>(I)V

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    return-void

    :cond_11
    new-instance p1, Llxh;

    invoke-direct {p1, p3}, Llxh;-><init>(I)V

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    return-void
.end method


# virtual methods
.method public final f0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 16

    const v0, 0x7f0d034c

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0a0071

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lcom/opera/android/settings/SettingsStatisticView;

    if-eqz v3, :cond_90

    const p2, 0x7f0a015a

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v4, :cond_90

    const p2, 0x7f0a015c

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v5, :cond_90

    const p2, 0x7f0a0263

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Landroid/widget/TextView;

    if-eqz v6, :cond_90

    const p2, 0x7f0a0265

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Landroid/widget/TextView;

    if-eqz v7, :cond_90

    const p2, 0x7f0a0266

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v8, :cond_90

    const p2, 0x7f0a02f4

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    if-eqz v9, :cond_90

    const p2, 0x7f0a040b

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    if-eqz v10, :cond_90

    const p2, 0x7f0a0825

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v11, v0

    check-cast v11, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v11, :cond_90

    const p2, 0x7f0a0b8a

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v0, :cond_90

    const p2, 0x7f0a0bdb

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v12, v0

    check-cast v12, Lcom/opera/android/settings/SettingsStatisticView;

    if-eqz v12, :cond_90

    new-instance v1, Lo4g;

    move-object v2, p1

    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct/range {v1 .. v12}, Lo4g;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/settings/SettingsStatisticView;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroid/widget/TextView;Landroid/widget/TextView;Lcom/opera/android/custom_views/StylingImageView;Landroid/view/View;Landroid/view/View;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/settings/SettingsStatisticView;)V

    iput-object v1, p0, Lf0h;->g:Lo4g;

    return-object v2

    :cond_90
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

.method public final i0()V
    .registers 10

    iget-object v0, p0, Lf0h;->g:Lo4g;

    iget-object v0, v0, Lo4g;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lf0h;->b:Lp0h;

    iget-object v3, v2, Lp0h;->f:Lkze;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lqwi;

    iget-object v3, v3, Lqwi;->a:Lnwi;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    const v4, 0x7f060b01

    const v5, 0x7f0402b2

    const/4 v6, 0x3

    const/4 v7, 0x2

    const/4 v8, 0x1

    if-eqz v3, :cond_3b

    if-eq v3, v8, :cond_30

    if-eq v3, v7, :cond_3b

    if-eq v3, v6, :cond_3b

    invoke-static {v5, v1, v4}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v1

    goto :goto_3f

    :cond_30
    const v3, 0x7f0402c2

    const v4, 0x7f060b05

    invoke-static {v3, v1, v4}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v1

    goto :goto_3f

    :cond_3b
    invoke-static {v5, v1, v4}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v1

    :goto_3f
    invoke-virtual {v0, v1}, Lcom/opera/android/custom_views/StylingImageView;->c(Landroid/content/res/ColorStateList;)V

    iget-object p0, p0, Lf0h;->g:Lo4g;

    iget-object p0, p0, Lo4g;->c:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, v2, Lp0h;->f:Lkze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqwi;

    iget-object v1, v1, Lqwi;->a:Lnwi;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_72

    if-eq v1, v8, :cond_67

    if-eq v1, v7, :cond_72

    if-eq v1, v6, :cond_72

    invoke-static {v0}, Lf03;->y(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_76

    :cond_67
    const v1, 0x7f0402eb

    const v2, 0x7f060b0b

    invoke-static {v1, v0, v2}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_76

    :cond_72
    invoke-static {v0}, Lf03;->y(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    :goto_76
    iget-object p0, p0, Lcom/opera/android/custom_views/StylingImageView;->e:Lua7;

    invoke-virtual {p0, v0}, Lua7;->M(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final onDestroyView()V
    .registers 4

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroyView()V

    iget-object v0, p0, Lf0h;->g:Lo4g;

    const/4 v1, 0x0

    if-eqz v0, :cond_14

    iget-object v2, v0, Lo4g;->e:Landroid/view/View;

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object v1, v2, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    iget-object v0, v0, Lo4g;->f:Landroid/view/View;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object v1, v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    :cond_14
    iput-object v1, p0, Lf0h;->g:Lo4g;

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 14

    invoke-super/range {p0 .. p2}, Landroidx/fragment/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object v0, p0, Lf0h;->b:Lp0h;

    iget-object v2, v0, Lp0h;->c:Lh42;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v3

    new-instance v4, Ld0h;

    const/4 v6, 0x1

    invoke-direct {v4, p0, v6}, Ld0h;-><init>(Lf0h;B)V

    invoke-virtual {v2, v3, v4}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v7, v0, Lp0h;->d:Lh42;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v2

    new-instance v3, Ld0h;

    const/4 v8, 0x2

    invoke-direct {v3, p0, v8}, Ld0h;-><init>(Lf0h;B)V

    invoke-virtual {v7, v2, v3}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v2, v0, Lp0h;->f:Lkze;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v3

    new-instance v4, Ld0h;

    const/4 v9, 0x0

    invoke-direct {v4, p0, v9}, Ld0h;-><init>(Lf0h;B)V

    invoke-virtual {v2, v3, v4}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v2, v0, Lp0h;->h:Lh42;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v3

    new-instance v4, Ld0h;

    const/4 v5, 0x3

    invoke-direct {v4, p0, v5}, Ld0h;-><init>(Lf0h;B)V

    invoke-virtual {v2, v3, v4}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v4, v0, Lp0h;->e:Lkze;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v2

    new-instance v3, Ld0h;

    const/4 v10, 0x4

    invoke-direct {v3, p0, v10}, Ld0h;-><init>(Lf0h;B)V

    invoke-virtual {v4, v2, v3}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v3, v0, Lp0h;->c:Lh42;

    new-instance v2, Lh42;

    invoke-direct {v2}, Lh42;-><init>()V

    new-instance v0, Lc0h;

    const/4 v5, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lc0h;-><init>(Lf0h;Lh42;Lh42;Lkze;B)V

    invoke-virtual {v2, v3, v0}, Lh42;->s(Lekc;Lf7f;)V

    new-instance v0, Lc0h;

    const/4 v5, 0x1

    invoke-direct/range {v0 .. v5}, Lc0h;-><init>(Lf0h;Lh42;Lh42;Lkze;B)V

    invoke-virtual {v2, v4, v0}, Lh42;->s(Lekc;Lf7f;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v0

    iget-object v3, p0, Lf0h;->g:Lo4g;

    iget-object v3, v3, Lo4g;->e:Landroid/view/View;

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v5, Lqzg;

    invoke-direct {v5, v3, v8}, Lqzg;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v0, v5}, Lekc;->j(Lndc;Lf7f;)V

    new-instance v2, Lh42;

    invoke-direct {v2}, Lh42;-><init>()V

    new-instance v0, Lc0h;

    const/4 v5, 0x0

    move-object v3, v7

    invoke-direct/range {v0 .. v5}, Lc0h;-><init>(Lf0h;Lh42;Lh42;Lkze;B)V

    invoke-virtual {v2, v3, v0}, Lh42;->s(Lekc;Lf7f;)V

    new-instance v0, Lc0h;

    const/4 v5, 0x1

    invoke-direct/range {v0 .. v5}, Lc0h;-><init>(Lf0h;Lh42;Lh42;Lkze;B)V

    invoke-virtual {v2, v4, v0}, Lh42;->s(Lekc;Lf7f;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v0

    iget-object v3, p0, Lf0h;->g:Lo4g;

    iget-object v3, v3, Lo4g;->f:Landroid/view/View;

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v4, Lqzg;

    invoke-direct {v4, v3, v8}, Lqzg;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v0, v4}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v0, p0, Lf0h;->g:Lo4g;

    iget-object v0, v0, Lo4g;->d:Landroid/view/View;

    check-cast v0, Lcom/opera/android/settings/SettingsStatisticView;

    new-instance v2, Lb0h;

    invoke-direct {v2, p0, v8}, Lb0h;-><init>(Lf0h;B)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lf0h;->g:Lo4g;

    iget-object v0, v0, Lo4g;->l:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/SettingsStatisticView;

    new-instance v2, Lb0h;

    invoke-direct {v2, p0, v9}, Lb0h;-><init>(Lf0h;B)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lf0h;->g:Lo4g;

    iget-object v0, v0, Lo4g;->k:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v2, Lb0h;

    invoke-direct {v2, p0, v6}, Lb0h;-><init>(Lf0h;B)V

    invoke-virtual {v0, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lf0h;->g:Lo4g;

    iget-object v0, v0, Lo4g;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    new-instance v2, Lkkf;

    invoke-direct {v2, p0, v10}, Lkkf;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, v2}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {v2, v0}, Lkkf;->a(Landroid/view/View;)V

    return-void
.end method

.method public final onViewStateRestored(Landroid/os/Bundle;)V
    .registers 5

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onViewStateRestored(Landroid/os/Bundle;)V

    iget-object p1, p0, Lf0h;->g:Lo4g;

    if-nez p1, :cond_8

    return-void

    :cond_8
    iget-object v0, p1, Lo4g;->e:Landroid/view/View;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v1, La0h;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, La0h;-><init>(Lf0h;B)V

    iput-object v1, v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    iget-object p1, p1, Lo4g;->f:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v0, La0h;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, La0h;-><init>(Lf0h;B)V

    iput-object v0, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    return-void
.end method
