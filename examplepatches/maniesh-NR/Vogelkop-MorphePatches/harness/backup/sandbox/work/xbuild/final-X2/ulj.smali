.class public final Lulj;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"


# virtual methods
.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 3

    return-void
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 4

    new-instance p0, Lzl5;

    const p2, 0x7f0d03b3

    const/4 v0, 0x0

    invoke-static {p1, p2, p1, v0}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_12

    check-cast p1, Landroid/widget/FrameLayout;

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    return-object p0

    :cond_12
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method
