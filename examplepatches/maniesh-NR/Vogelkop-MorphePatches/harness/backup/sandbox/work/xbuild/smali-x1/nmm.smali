.class public final Lnmm;
.super Llj;
.source "SourceFile"


# instance fields
.field public r:Ljm9;

.field public final s:Lua7;


# direct methods
.method public constructor <init>(Lgjm;)V
    .registers 4

    const v0, 0x7f140c73

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Llj;-><init>(II)V

    new-instance v0, Lua7;

    invoke-direct {v0, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object v0, p0, Lnmm;->s:Lua7;

    return-void
.end method


# virtual methods
.method public final G0()V
    .registers 4

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Lcbl;

    const/16 v2, 0x1d

    invoke-direct {v1, p0, v2}, Lcbl;-><init>(Ljava/lang/Object;B)V

    sget-boolean p0, Lwi2;->l:Z

    if-nez p0, :cond_28

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    sget-boolean v2, Lwi2;->l:Z

    if-nez v2, :cond_28

    sput-object p0, Lwi2;->j:Lcom/opera/android/settings/SettingsManager;

    sget-object p0, Lu55;->Ro:Lulp;

    sput-object p0, Lwi2;->k:Lulp;

    const/4 p0, 0x1

    sput-boolean p0, Lwi2;->l:Z

    :cond_28
    sget-object p0, Lwi2;->i:Lwi2;

    invoke-virtual {p0, v0, v1}, Llj2;->b(Landroid/content/Context;Ljava/lang/Runnable;)V

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 4

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lnmm;->G0()V

    iget-object p1, p0, Lnmm;->r:Ljm9;

    if-nez p1, :cond_b

    const/4 p1, 0x0

    :cond_b
    iget-object p1, p1, Ljm9;->c:Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    new-instance p2, Lpkm;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Lpkm;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 5

    const v0, 0x7f0d01ea

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p2, 0x7f0a056f

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    if-eqz v0, :cond_36

    const p2, 0x7f0a069d

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    if-eqz v0, :cond_36

    const p2, 0x7f0a0c55

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v0, :cond_36

    new-instance p2, Ljm9;

    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct {p2, p1, v0}, Ljm9;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;)V

    iput-object p2, p0, Lnmm;->r:Ljm9;

    return-void

    :cond_36
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
