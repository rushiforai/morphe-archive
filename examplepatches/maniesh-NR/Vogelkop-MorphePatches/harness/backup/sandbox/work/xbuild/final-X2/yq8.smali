.class public final Lyq8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lti7;


# instance fields
.field public final a:Landroid/view/View;

.field public b:Z

.field public c:Z

.field public final synthetic d:Lar8;


# direct methods
.method public constructor <init>(Lar8;Landroid/view/View;)V
    .registers 3

    iput-object p1, p0, Lyq8;->d:Lar8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lyq8;->a:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final a(Landroidx/recyclerview/widget/i;)V
    .registers 2

    return-void
.end method

.method public final b(Landroidx/recyclerview/widget/i;II)Z
    .registers 6

    iget-boolean v0, p0, Lyq8;->b:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_6

    return v1

    :cond_6
    iget-object p1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget-object p0, p0, Lyq8;->a:Landroid/view/View;

    invoke-static {p1, p0, p2, p3}, Lwi7;->a(Landroid/view/View;Landroid/view/View;II)Z

    move-result p0

    xor-int/2addr p0, v1

    return p0
.end method

.method public final c(Landroidx/recyclerview/widget/i;II)V
    .registers 12

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_6

    move v2, v1

    goto :goto_7

    :cond_6
    move v2, v0

    :goto_7
    iget-boolean v3, p0, Lyq8;->c:Z

    if-eq v2, v3, :cond_cc

    iput-boolean v2, p0, Lyq8;->c:Z

    if-eqz v2, :cond_cc

    iget-object v2, p0, Lyq8;->d:Lar8;

    iget-object v3, v2, Lar8;->o:Lcom/opera/android/favorites/FavoriteFolderRootView;

    sget v4, Lcom/opera/android/RootView;->D:I

    :goto_15
    const/4 v4, 0x0

    if-eqz v3, :cond_2e

    instance-of v5, v3, Lcom/opera/android/RootView;

    if-eqz v5, :cond_1f

    check-cast v3, Lcom/opera/android/RootView;

    goto :goto_2f

    :cond_1f
    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    instance-of v5, v5, Landroid/view/View;

    if-eqz v5, :cond_2e

    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    goto :goto_15

    :cond_2e
    move-object v3, v4

    :goto_2f
    if-eqz v3, :cond_cc

    check-cast p1, Lth7;

    new-instance v5, Lf1p;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    iput-object p1, v5, Lf1p;->a:Ljava/lang/Object;

    const-class v6, Landroid/view/View;

    invoke-static {v3, v6, v5}, Lq9n;->J(Landroid/view/View;Ljava/lang/Class;Lp9n;)V

    iget-object v5, v5, Lf1p;->b:Ljava/lang/Object;

    check-cast v5, Lnw7;

    if-eqz v5, :cond_ca

    iget-object v5, v5, Lnw7;->a:Low7;

    iget-object v6, v5, Low7;->i:Lns8;

    if-eqz v6, :cond_c8

    invoke-interface {p1}, Lth7;->e()Landroid/view/View;

    move-result-object v6

    :goto_4f
    if-eqz v6, :cond_67

    instance-of v7, v6, Lcom/opera/android/RootView;

    if-eqz v7, :cond_58

    check-cast v6, Lcom/opera/android/RootView;

    goto :goto_68

    :cond_58
    invoke-virtual {v6}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    instance-of v7, v7, Landroid/view/View;

    if-eqz v7, :cond_67

    invoke-virtual {v6}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    check-cast v6, Landroid/view/View;

    goto :goto_4f

    :cond_67
    move-object v6, v4

    :goto_68
    if-eqz v6, :cond_c8

    invoke-interface {p1}, Lth7;->f()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lhq8;

    const/4 v6, 0x2

    new-array v7, v6, [I

    invoke-interface {p1}, Lth7;->e()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p1, v7}, Landroid/view/View;->getLocationOnScreen([I)V

    aget p1, v7, v0

    add-int/2addr p1, p2

    aput p1, v7, v0

    aget p2, v7, v1

    add-int/2addr p2, p3

    aput p2, v7, v1

    new-instance p3, Lmw7;

    iget-object v0, v5, Low7;->c:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v5, v5, Low7;->i:Lns8;

    invoke-direct {p3}, Ljava/lang/Object;-><init>()V

    new-array v7, v6, [I

    iput-object v7, p3, Lmw7;->f:Ljava/io/Serializable;

    new-array v6, v6, [I

    iput-object v6, p3, Lmw7;->g:Ljava/io/Serializable;

    iput-object v0, p3, Lmw7;->c:Ljava/lang/Object;

    invoke-virtual {v0, v7}, Landroid/view/View;->getLocationInWindow([I)V

    iput-object v5, p3, Lmw7;->d:Ljava/lang/Object;

    iput p1, p3, Lmw7;->a:I

    iput p2, p3, Lmw7;->b:I

    iput-object v4, p3, Lmw7;->e:Ljava/lang/Object;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object p1

    iget-object p2, v5, Lns8;->c:Ls9i;

    iget-object p2, p2, Ls9i;->b:Ljava/lang/Object;

    check-cast p2, Ltq8;

    iget-object v0, p2, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p1, v4, p2, v0}, Lnr8;->d(Lhq8;Ltq8;I)V

    move-object v4, p3

    :cond_c8
    iput-object v4, v3, Lcom/opera/android/RootView;->c:Lmw7;

    :cond_ca
    if-nez v4, :cond_cd

    :cond_cc
    return-void

    :cond_cd
    new-instance p1, Lxq8;

    invoke-direct {p1, p0, v3}, Lxq8;-><init>(Lyq8;Lcom/opera/android/RootView;)V

    iget-object p2, v3, Lcom/opera/android/RootView;->g:Li7f;

    invoke-virtual {p2, p1}, Li7f;->b(Ljava/lang/Object;)Z

    iget-object p1, v2, Lar8;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget-object p2, v2, Lar8;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result p2

    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget-object p2, v2, Lar8;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result p2

    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    iget-object p2, v2, Lar8;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p1, v2, Lar8;->o:Lcom/opera/android/favorites/FavoriteFolderRootView;

    iput-boolean v1, p1, Lcom/opera/android/favorites/FavoriteFolderRootView;->g:Z

    iget-object p1, v2, Lar8;->p:Landroid/view/View;

    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    iput-boolean v1, p0, Lyq8;->b:Z

    return-void
.end method
