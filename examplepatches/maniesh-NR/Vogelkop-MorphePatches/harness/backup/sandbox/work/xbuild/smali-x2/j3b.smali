.class public final Lj3b;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public final a:Ldll;

.field public final b:Lor2;

.field public c:I

.field public final d:Li3b;


# direct methods
.method public constructor <init>(Ll2b;Ldll;)V
    .registers 12

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v1, v0, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    iput-object p2, p0, Lj3b;->a:Ldll;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0d0219

    invoke-virtual {p2, v0, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const p2, 0x7f0a00f2

    invoke-static {p2, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    if-eqz v4, :cond_69

    const p2, 0x7f0a026e

    invoke-static {p2, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v0, :cond_69

    const p2, 0x7f0a0280

    invoke-static {p2, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/google/android/material/button/MaterialButton;

    if-eqz v5, :cond_69

    const p2, 0x7f0a057d

    invoke-static {p2, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v0, :cond_69

    const p2, 0x7f0a06b5

    invoke-static {p2, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Landroid/widget/TextView;

    if-eqz v6, :cond_69

    const p2, 0x7f0a06c5

    invoke-static {p2, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Landroid/widget/TextView;

    if-eqz v7, :cond_69

    new-instance v2, Lor2;

    const/16 v8, 0xc

    move-object v3, p0

    invoke-direct/range {v2 .. v8}, Lor2;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v2, v3, Lj3b;->b:Lor2;

    new-instance p0, Li3b;

    invoke-direct {p0, v3, p1}, Li3b;-><init>(Lj3b;Ll2b;)V

    iput-object p0, v3, Lj3b;->d:Li3b;

    return-void

    :cond_69
    move-object v3, p0

    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public final a(I)V
    .registers 4

    iput p1, p0, Lj3b;->c:I

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lf03;->E(ILandroid/content/Context;I)I

    move-result p1

    iget-object p0, p0, Lj3b;->b:Lor2;

    iget-object p0, p0, Lor2;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    invoke-virtual {p0, p1}, Ln2d;->j(I)V

    return-void
.end method

.method public final onAttachedToWindow()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    iget-object v0, p0, Lj3b;->a:Ldll;

    iget-object p0, p0, Lj3b;->d:Li3b;

    invoke-virtual {v0, p0}, Ldll;->a(Lcll;)V

    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    iget-object v0, p0, Lj3b;->a:Ldll;

    iget-object p0, p0, Lj3b;->d:Li3b;

    invoke-virtual {v0, p0}, Ldll;->b(Lcll;)V

    return-void
.end method
