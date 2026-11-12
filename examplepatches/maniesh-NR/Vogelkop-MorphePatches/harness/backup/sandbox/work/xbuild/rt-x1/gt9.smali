.class public final Lgt9;
.super Lft9;
.source "SourceFile"


# instance fields
.field public final d:Lov0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lk6n;)V
    .registers 5

    invoke-direct {p0, p1, p2, p2}, Ly46;-><init>(Landroid/content/Context;Lhcb;Lhcb;)V

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0d01fe

    const/4 v0, 0x0

    invoke-virtual {p1, p2, p0, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p2, 0x7f0a0296

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v0, :cond_37

    const p2, 0x7f0a0854

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    if-eqz v1, :cond_37

    new-instance p2, Lov0;

    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct {p2, p1, v0, v1}, Lov0;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/StylingTextView;Landroid/widget/LinearLayout;)V

    iput-object p2, p0, Lgt9;->d:Lov0;

    const/16 p0, 0x8

    invoke-virtual {v1, p0}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_37
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
