.class public final Lwl3;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# static fields
.field public static final synthetic c:I


# instance fields
.field public final a:Lpt1;

.field public b:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 13

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v2, 0x7f0d009a

    invoke-virtual {p1, v2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const p1, 0x7f0a00f4

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Lcom/opera/android/custom_views/AnimationEmptyListView;

    if-eqz v5, :cond_6b

    const p1, 0x7f0a014c

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Lcom/opera/android/bookmarks/ImportBookmarksBanner;

    if-eqz v6, :cond_6b

    const p1, 0x7f0a01c0

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;

    if-eqz v7, :cond_6b

    const p1, 0x7f0a0576

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_6b

    const p1, 0x7f0a08e9

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Lcom/google/android/material/button/MaterialButton;

    if-eqz v9, :cond_6b

    new-instance v3, Lpt1;

    const/4 v10, 0x2

    move-object v4, p0

    invoke-direct/range {v3 .. v10}, Lpt1;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Landroid/view/View;Landroid/view/View;Landroid/view/View;B)V

    iput-object v3, v4, Lwl3;->a:Lpt1;

    const/4 p0, 0x1

    iput-boolean p0, v4, Lwl3;->b:Z

    invoke-virtual {v4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    invoke-virtual {v4, p0}, Lwl3;->a(Landroid/content/res/Configuration;)Z

    move-result p0

    if-nez p0, :cond_67

    const/16 v1, 0x8

    :cond_67
    invoke-virtual {v5, v1}, Lcom/opera/android/custom_views/AnimationEmptyListView;->setVisibility(I)V

    return-void

    :cond_6b
    move-object v4, p0

    invoke-virtual {v4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public final a(Landroid/content/res/Configuration;)Z
    .registers 4

    invoke-static {}, Li0l;->g()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_8

    return v1

    :cond_8
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/opera/android/utilities/DisplayUtil;->e(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_13

    return v1

    :cond_13
    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    if-eq p1, v1, :cond_20

    const/4 v0, 0x2

    if-ne p1, v0, :cond_1e

    iget-boolean p0, p0, Lwl3;->b:Z

    if-nez p0, :cond_20

    :cond_1e
    const/4 p0, 0x0

    return p0

    :cond_20
    return v1
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3

    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object v0, p0, Lwl3;->a:Lpt1;

    iget-object v0, v0, Lpt1;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/AnimationEmptyListView;

    invoke-virtual {p0, p1}, Lwl3;->a(Landroid/content/res/Configuration;)Z

    move-result p0

    if-eqz p0, :cond_11

    const/4 p0, 0x0

    goto :goto_13

    :cond_11
    const/16 p0, 0x8

    :goto_13
    invoke-virtual {v0, p0}, Lcom/opera/android/custom_views/AnimationEmptyListView;->setVisibility(I)V

    return-void
.end method
