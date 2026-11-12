.class public final Ltlf;
.super Lulf;
.source "SourceFile"


# instance fields
.field public h:Lkf;


# virtual methods
.method public final O()Landroid/widget/CompoundButton;
    .registers 1

    iget-object p0, p0, Ltlf;->h:Lkf;

    if-nez p0, :cond_5

    const/4 p0, 0x0

    :cond_5
    iget-object p0, p0, Lkf;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaSwitch;

    return-object p0
.end method

.method public final v(Landroid/view/ViewGroup;)V
    .registers 5

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d0312

    invoke-virtual {v0, v1, p1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const v0, 0x7f0a0102

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaSwitch;

    if-eqz v1, :cond_27

    new-instance v0, Lkf;

    const/16 v2, 0x15

    invoke-direct {v0, v2, p1, v1}, Lkf;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    iput-object v0, p0, Ltlf;->h:Lkf;

    return-void

    :cond_27
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
