.class public final Lz4b;
.super Ldej;
.source "SourceFile"

# interfaces
.implements Lsni;


# instance fields
.field public c:Lc5b;

.field public final synthetic d:Lmej;

.field public final synthetic e:Log5;


# direct methods
.method public constructor <init>(Lmej;Log5;)V
    .registers 3

    iput-object p1, p0, Lz4b;->d:Lmej;

    iput-object p2, p0, Lz4b;->e:Log5;

    invoke-direct {p0, p1}, Ldej;-><init>(Lmej;)V

    return-void
.end method


# virtual methods
.method public final Y(Z)V
    .registers 2

    iget-object p0, p0, Lz4b;->c:Lc5b;

    if-eqz p0, :cond_f

    iget-object p0, p0, Lc5b;->c:Lcom/opera/android/custom_views/StylingImageView;

    if-eqz p1, :cond_a

    const/4 p1, 0x0

    goto :goto_c

    :cond_a
    const/16 p1, 0x8

    :goto_c
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    :cond_f
    return-void
.end method

.method public final a(Landroid/content/Context;)Landroid/view/View;
    .registers 13

    iget-object v0, p0, Lz4b;->e:Log5;

    iget-object v0, v0, Log5;->b:Ljava/lang/Object;

    check-cast v0, Lb5b;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v1, 0x7f0d021c

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {p1, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const v1, 0x7f0a01c0

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_b7

    invoke-static {v4}, Lpq3;->a(Landroid/view/View;)Lpq3;

    move-result-object v7

    const v1, 0x7f0a056f

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v8, v4

    check-cast v8, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v8, :cond_b7

    const v1, 0x7f0a06b5

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v9, v4

    check-cast v9, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v9, :cond_b7

    const v1, 0x7f0a06c5

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Lcom/opera/android/custom_views/DialogTitle;

    if-eqz v10, :cond_b7

    new-instance v5, Lc5b;

    move-object v6, p1

    check-cast v6, Landroid/widget/LinearLayout;

    invoke-direct/range {v5 .. v10}, Lc5b;-><init>(Landroid/widget/LinearLayout;Lpq3;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/DialogTitle;)V

    invoke-virtual {v10}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-interface {v0, p1}, Lb5b;->p(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v10, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v9}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-interface {v0, p1}, Lb5b;->q(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v9, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, v7, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-interface {v0, v1}, Lb5b;->o(Landroid/content/Context;)Lx4b;

    move-result-object v1

    const/16 v2, 0x8

    if-eqz v1, :cond_81

    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v4, v1, Lx4b;->a:Ljava/lang/String;

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v4, Ly4b;

    invoke-direct {v4, p0, v0, v1, v3}, Ly4b;-><init>(Lz4b;Lb5b;Lx4b;B)V

    invoke-virtual {p1, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_84

    :cond_81
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    :goto_84
    iget-object p1, v7, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-interface {v0, v1}, Lb5b;->h(Landroid/content/Context;)Lx4b;

    move-result-object v1

    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v4, v1, Lx4b;->a:Ljava/lang/String;

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v4, Ly4b;

    const/4 v7, 0x1

    invoke-direct {v4, p0, v0, v1, v7}, Ly4b;-><init>(Lz4b;Lb5b;Lx4b;B)V

    invoke-virtual {p1, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v5, p0, Lz4b;->c:Lc5b;

    invoke-virtual {v8}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    if-eq p1, v7, :cond_ae

    move v3, v2

    :cond_ae
    invoke-virtual {v8, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lz4b;->d:Lmej;

    invoke-interface {p1, p0}, Lmej;->x(Lsni;)V

    return-object v6

    :cond_b7
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v2
.end method
