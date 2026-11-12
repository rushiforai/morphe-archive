.class public final Lslf;
.super Lulf;
.source "SourceFile"


# instance fields
.field public h:Ljmf;


# virtual methods
.method public final O()Landroid/widget/CompoundButton;
    .registers 1

    iget-object p0, p0, Lslf;->h:Ljmf;

    if-nez p0, :cond_5

    const/4 p0, 0x0

    :cond_5
    iget-object p0, p0, Ljmf;->c:Lcom/opera/android/ui/catalog/widget/OperaRadioButton;

    return-object p0
.end method

.method public final v(Landroid/view/ViewGroup;)V
    .registers 5

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0d0311

    invoke-virtual {v1, v2, p1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const v1, 0x7f0a0204

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaRadioButton;

    if-eqz v2, :cond_25

    new-instance v1, Ljmf;

    invoke-direct {v1, p1, v2, v0}, Ljmf;-><init>(Landroid/view/View;Lcom/opera/android/ui/catalog/widget/OperaRadioButton;B)V

    iput-object v1, p0, Lslf;->h:Ljmf;

    return-void

    :cond_25
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
