.class public abstract Lq73;
.super Ldej;
.source "SourceFile"


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/view/View;
    .registers 9

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0d039c

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0a02df

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroidx/core/widget/NestedScrollView;

    if-eqz v3, :cond_6d

    const v0, 0x7f0a0514

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/FrameLayout;

    if-eqz v3, :cond_6d

    const v0, 0x7f0a051c

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_6d

    const v0, 0x7f0a07c6

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    if-eqz v5, :cond_6d

    check-cast p1, Landroid/widget/FrameLayout;

    invoke-virtual {p0, v3}, Lq73;->d(Landroid/widget/FrameLayout;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_41

    const/4 v0, 0x1

    goto :goto_42

    :cond_41
    move v0, v2

    :goto_42
    const/16 v1, 0x8

    if-eqz v0, :cond_48

    move v6, v2

    goto :goto_49

    :cond_48
    move v6, v1

    :goto_49
    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V

    if-eqz v0, :cond_52

    instance-of v0, p0, Lpxk;

    if-eqz v0, :cond_53

    :cond_52
    move v2, v1

    :cond_53
    invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V

    new-instance v0, Lqb7;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p0, v0, Lqb7;->c:Ljava/lang/Object;

    iput-object v5, v0, Lqb7;->a:Ljava/lang/Object;

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    iput-object v1, v0, Lqb7;->b:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lq73;->e(Lqb7;)V

    return-object p1

    :cond_6d
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v1
.end method

.method public d(Landroid/widget/FrameLayout;)Landroid/view/View;
    .registers 2

    const/4 p0, 0x0

    return-object p0
.end method

.method public abstract e(Lqb7;)V
.end method
