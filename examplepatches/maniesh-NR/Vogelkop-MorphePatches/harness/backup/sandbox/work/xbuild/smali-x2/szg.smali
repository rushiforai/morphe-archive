.class public final Lszg;
.super Lz46;
.source "SourceFile"


# instance fields
.field public final synthetic u:Lxzg;


# direct methods
.method public constructor <init>(Lxzg;Ls8n;)V
    .registers 3

    iput-object p1, p0, Lszg;->u:Lxzg;

    const/4 p1, 0x0

    invoke-direct {p0, p2, p1}, Lz46;-><init>(Landroid/content/Context;I)V

    return-void
.end method


# virtual methods
.method public final onCreate(Landroid/os/Bundle;)V
    .registers 7

    invoke-super {p0, p1}, Ltq3;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroid/app/Dialog;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0d0349

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0a0191

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    if-eqz v1, :cond_70

    const v0, 0x7f0a0269

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_70

    invoke-static {v1}, Lei;->a(Landroid/view/View;)Lei;

    move-result-object v0

    check-cast p1, Landroid/widget/FrameLayout;

    iget-object v1, p0, Lszg;->u:Lxzg;

    iput-object v0, v1, Lxzg;->h:Lei;

    invoke-virtual {p0, p1}, Lz46;->setContentView(Landroid/view/View;)V

    sget-object v0, Lq9n;->c:Ll5b;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    :goto_37
    if-eqz v0, :cond_4e

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-class v4, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    invoke-virtual {v4, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_49

    move-object v2, v0

    check-cast v2, Landroid/view/View;

    goto :goto_4e

    :cond_49
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    goto :goto_37

    :cond_4e
    :goto_4e
    check-cast v2, Landroid/view/ViewGroup;

    iput-object v2, v1, Lxzg;->g:Landroid/view/ViewGroup;

    if-nez v2, :cond_56

    iput-object p1, v1, Lxzg;->g:Landroid/view/ViewGroup;

    :cond_56
    iget-object p1, p0, Ltq3;->g:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    if-nez p1, :cond_5d

    invoke-virtual {p0}, Ltq3;->f()V

    :cond_5d
    iget-object p1, p0, Ltq3;->g:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->M(I)V

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p0

    if-eqz p0, :cond_6c

    invoke-static {p0}, Lp8f;->w(Landroid/view/Window;)V

    :cond_6c
    invoke-virtual {v1}, Lxzg;->i0()V

    return-void

    :cond_70
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
