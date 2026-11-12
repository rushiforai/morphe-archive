.class public final Luwk;
.super Lm6k;
.source "SourceFile"


# instance fields
.field public final f:Lor2;


# direct methods
.method public constructor <init>(Lkf;Ltsd;Ltsd;)V
    .registers 12

    invoke-direct {p0, p1, p2, p3}, Lm6k;-><init>(Lkf;Ltsd;Ltsd;)V

    iget-object p1, p0, Lm6k;->d:Lkf;

    iget-object p2, p1, Lkf;->c:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/startpage/SoftwareClipMaxWidthLinearLayout;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    iget-object p1, p1, Lkf;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/startpage/SoftwareClipMaxWidthLinearLayout;

    const/4 p3, 0x1

    const v0, 0x7f0d03e6

    invoke-virtual {p2, v0, p1, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    const p1, 0x7f0a01d2

    invoke-static {p1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz p2, :cond_62

    const p1, 0x7f0a022e

    invoke-static {p1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    move-object v3, p2

    check-cast v3, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v3, :cond_62

    const p1, 0x7f0a06b5

    invoke-static {p1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    move-object v4, p2

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v4, :cond_62

    const p1, 0x7f0a086b

    invoke-static {p1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    move-object v5, p2

    check-cast v5, Lcom/google/android/material/button/MaterialButton;

    if-eqz v5, :cond_62

    const p1, 0x7f0a06c5

    invoke-static {p1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    move-object v6, p2

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v6, :cond_62

    new-instance v1, Lor2;

    const/16 v7, 0x1d

    invoke-direct/range {v1 .. v7}, Lor2;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v1, p0, Luwk;->f:Lor2;

    return-void

    :cond_62
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final V(Lja2;Z)V
    .registers 5

    invoke-virtual {p0}, Lab2;->a0()Lja2;

    move-result-object p1

    check-cast p1, Lrwk;

    iget-object p0, p0, Luwk;->f:Lor2;

    iget-object p2, p0, Lor2;->b:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iget-object v0, p1, Lrwk;->c:Lrxh;

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v0, v1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p2, p0, Lor2;->e:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iget-object v0, p1, Lrwk;->d:Lrxh;

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v0, v1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p2, p0, Lor2;->f:Ljava/lang/Object;

    check-cast p2, Lcom/google/android/material/button/MaterialButton;

    iget-object v0, p1, Lrwk;->e:Lrxh;

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v0, v1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v0, Ltwk;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Ltwk;-><init>(Lrwk;B)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, p0, Lor2;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageButton;

    new-instance p2, Ltwk;

    const/4 v0, 0x1

    invoke-direct {p2, p1, v0}, Ltwk;-><init>(Lrwk;B)V

    invoke-virtual {p0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
