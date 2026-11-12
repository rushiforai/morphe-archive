.class public final Lrcn;
.super Llz3;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Landroid/view/View;ILjava/lang/CharSequence;Ljava/lang/CharSequence;Lwzg;ILmf0;)V
    .registers 15

    new-instance v5, Ll11;

    const/4 v0, 0x1

    invoke-direct {v5, p2, v0, p3}, Ll11;-><init>(Landroid/view/View;II)V

    const-wide/16 v3, 0x5dc

    move-object v0, p0

    move-object v1, p1

    move v2, p7

    invoke-direct/range {v0 .. v5}, Llz3;-><init>(Landroid/view/ViewGroup;IJLhxj;)V

    new-instance p0, Llcn;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p1

    iget-object p1, p1, Ld6j;->c:Lx5f;

    invoke-direct {p0, v0, p1, p8}, Llcn;-><init>(Lrcn;Lx5f;Lmf0;)V

    invoke-virtual {v0, p0}, Llz3;->a(Lkz3;)V

    iget-object p1, v0, Llz3;->b:Lcom/opera/android/bubbleview/BubbleView;

    const p2, 0x7f0a0046

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/google/android/material/button/MaterialButton;

    if-eqz p3, :cond_83

    const p2, 0x7f0a0231

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p7

    check-cast p7, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz p7, :cond_83

    const p2, 0x7f0a026e

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p7

    check-cast p7, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz p7, :cond_83

    const p2, 0x7f0a06b5

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p7

    check-cast p7, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz p7, :cond_83

    const p2, 0x7f0a06c5

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p8

    check-cast p8, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz p8, :cond_83

    invoke-virtual {p8, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p7, p5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 p1, 0x8

    if-eqz p6, :cond_7f

    iget-object p2, p6, Lwzg;->b:Ljava/lang/Object;

    check-cast p2, Ljava/lang/CharSequence;

    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance p2, Ldv2;

    invoke-direct {p2, v0, p0, p6, p1}, Ldv2;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p3, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 p0, 0x0

    invoke-virtual {p3, p0}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_7f
    invoke-virtual {p3, p1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_83
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final d(Z)Z
    .registers 2

    invoke-virtual {p0, p1}, Llz3;->e(Z)Z

    move-result p1

    if-eqz p1, :cond_d

    sget-object p1, Lhjm;->b:Lhjm;

    invoke-virtual {p0, p1}, Llz3;->b(Lhjm;)Z

    const/4 p0, 0x1

    return p0

    :cond_d
    const/4 p0, 0x0

    return p0
.end method
