.class public final Lwlf;
.super Lcmf;
.source "SourceFile"


# instance fields
.field public l:Lhmf;


# virtual methods
.method public final F(Landroid/view/ViewGroup;)V
    .registers 5

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d0313

    invoke-virtual {v0, v1, p1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const v0, 0x7f0a0204

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/checkbox/MaterialCheckBox;

    if-eqz v1, :cond_26

    new-instance v0, Lhmf;

    const/4 v2, 0x1

    invoke-direct {v0, p1, v1, v2}, Lhmf;-><init>(Landroid/view/View;Lcom/google/android/material/checkbox/MaterialCheckBox;B)V

    iput-object v0, p0, Lwlf;->l:Lhmf;

    return-void

    :cond_26
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

.method public final t0()Landroid/widget/CompoundButton;
    .registers 1

    iget-object p0, p0, Lwlf;->l:Lhmf;

    if-nez p0, :cond_5

    const/4 p0, 0x0

    :cond_5
    iget-object p0, p0, Lhmf;->c:Lcom/google/android/material/checkbox/MaterialCheckBox;

    return-object p0
.end method
