.class public final Lpq3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Lcom/opera/android/custom_views/OperaButtonBarLayout;

.field public final c:Lcom/google/android/material/button/MaterialButton;

.field public final d:Lcom/google/android/material/button/MaterialButton;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/custom_views/OperaButtonBarLayout;Lcom/google/android/material/button/MaterialButton;Lcom/google/android/material/button/MaterialButton;B)V
    .registers 5

    iput-byte p4, p0, Lpq3;->a:B

    iput-object p1, p0, Lpq3;->b:Lcom/opera/android/custom_views/OperaButtonBarLayout;

    iput-object p2, p0, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    iput-object p3, p0, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Landroid/view/View;)Lpq3;
    .registers 5

    const v0, 0x7f0a074b

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/button/MaterialButton;

    if-eqz v1, :cond_2a

    const v0, 0x7f0a084d

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/button/MaterialButton;

    if-eqz v2, :cond_2a

    const v0, 0x7f0a0a9f

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Space;

    if-eqz v3, :cond_2a

    new-instance v0, Lpq3;

    check-cast p0, Lcom/opera/android/custom_views/OperaButtonBarLayout;

    const/4 v3, 0x0

    invoke-direct {v0, p0, v1, v2, v3}, Lpq3;-><init>(Lcom/opera/android/custom_views/OperaButtonBarLayout;Lcom/google/android/material/button/MaterialButton;Lcom/google/android/material/button/MaterialButton;B)V

    return-object v0

    :cond_2a
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "Missing required view with ID: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lpq3;
    .registers 5

    const v0, 0x7f0d0421

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p1, 0x7f0a074b

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    if-eqz v0, :cond_35

    const p1, 0x7f0a084d

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/button/MaterialButton;

    if-eqz v1, :cond_35

    const p1, 0x7f0a0a9f

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Space;

    if-eqz v2, :cond_35

    new-instance p1, Lpq3;

    check-cast p0, Lcom/opera/android/custom_views/OperaButtonBarLayout;

    const/4 v2, 0x1

    invoke-direct {p1, p0, v0, v1, v2}, Lpq3;-><init>(Lcom/opera/android/custom_views/OperaButtonBarLayout;Lcom/google/android/material/button/MaterialButton;Lcom/google/android/material/button/MaterialButton;B)V

    return-object p1

    :cond_35
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Lpq3;->a:B

    iget-object p0, p0, Lpq3;->b:Lcom/opera/android/custom_views/OperaButtonBarLayout;

    return-object p0
.end method
