.class public final Ly8j;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"


# instance fields
.field public final a:Ljk7;

.field public final synthetic b:Lc9j;


# direct methods
.method public constructor <init>(Lc9j;)V
    .registers 2

    iput-object p1, p0, Ly8j;->b:Lc9j;

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    new-instance p1, Ljk7;

    invoke-direct {p1, p0}, Ljk7;-><init>(Ly8j;)V

    iput-object p1, p0, Ly8j;->a:Ljk7;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    return-void
.end method


# virtual methods
.method public final getItemCount()I
    .registers 2

    iget-object p0, p0, Ly8j;->a:Ljk7;

    iget-object v0, p0, Ljk7;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-boolean p0, p0, Ljk7;->a:Z

    add-int/2addr v0, p0

    return v0
.end method

.method public final getItemId(I)J
    .registers 3

    iget-object p0, p0, Ly8j;->a:Ljk7;

    iget-object v0, p0, Ljk7;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    iget-boolean p0, p0, Ljk7;->a:Z

    sub-int/2addr p1, p0

    invoke-static {p1, v0}, Lkotlin/collections/CollectionsKt;->M(ILjava/util/List;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ll6j;

    if-eqz p0, :cond_15

    iget p0, p0, Ll6j;->a:I

    int-to-long p0, p0

    return-wide p0

    :cond_15
    const-wide/16 p0, -0x1

    return-wide p0
.end method

.method public final getItemViewType(I)I
    .registers 2

    if-nez p1, :cond_a

    iget-object p0, p0, Ly8j;->a:Ljk7;

    iget-boolean p0, p0, Ljk7;->a:Z

    if-eqz p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 4

    check-cast p1, Lb9j;

    instance-of v0, p1, Lz8j;

    if-eqz v0, :cond_1a

    check-cast p1, Lz8j;

    iget-object p0, p0, Ly8j;->a:Ljk7;

    iget-object v0, p0, Ljk7;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    iget-boolean p0, p0, Ljk7;->a:Z

    sub-int/2addr p2, p0

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ll6j;

    invoke-virtual {p1, p0}, Lz8j;->U(Ll6j;)V

    :cond_1a
    return-void
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 7

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object p0, p0, Ly8j;->b:Lc9j;

    if-ne p2, v0, :cond_5c

    new-instance p2, La9j;

    sget-object v0, Lc9j;->w:[Lxtb;

    iget-object p0, p0, Lc9j;->r:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lo9j;

    const v0, 0x7f0d038c

    invoke-static {p1, v0, p1, v2}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0a021f

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/button/MaterialButton;

    if-eqz v2, :cond_4a

    const v0, 0x7f0a051b

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v3, :cond_4a

    new-instance v0, Lf9j;

    check-cast p1, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1, v2}, Lf9j;-><init>(Landroid/widget/LinearLayout;Lcom/google/android/material/button/MaterialButton;)V

    invoke-direct {p2, v0}, Lb9j;-><init>(La5n;)V

    iget-object p1, p2, Lb9j;->b:La5n;

    check-cast p1, Lf9j;

    iget-object p1, p1, Lf9j;->b:Lcom/google/android/material/button/MaterialButton;

    new-instance v0, Lh4i;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Lh4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p2

    :cond_4a
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v1

    :cond_5c
    new-instance p2, Lz8j;

    new-instance v0, Ltji;

    const/16 v3, 0xd

    invoke-direct {v0, p0, v3}, Ltji;-><init>(Ljava/lang/Object;B)V

    const p0, 0x7f0d038b

    invoke-static {p1, p0, p1, v2}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_a8

    new-instance p1, Le9j;

    check-cast p0, Lcom/opera/android/widget/MenuSettingsListItem;

    invoke-direct {p1, p0}, Le9j;-><init>(Lcom/opera/android/widget/MenuSettingsListItem;)V

    invoke-direct {p2, p1}, Lb9j;-><init>(La5n;)V

    iget-object p0, p2, Lb9j;->b:La5n;

    check-cast p0, Le9j;

    iget-object p0, p0, Le9j;->a:Lcom/opera/android/widget/MenuSettingsListItem;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lf03;->C(Landroid/content/Context;)I

    move-result p1

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    iput-object p1, p2, Lz8j;->d:Landroid/content/res/ColorStateList;

    new-instance p1, Lj5g;

    const/16 v1, 0xb

    invoke-direct {p1, p2, v0, v1}, Lj5g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lcom/opera/android/widget/MenuSettingsListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Lkkf;

    const/16 v0, 0x12

    invoke-direct {p1, p2, v0}, Lkkf;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v0

    if-nez v0, :cond_a4

    return-object p2

    :cond_a4
    invoke-static {v0, p0, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-object p2

    :cond_a8
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v1
.end method

.method public final onViewRecycled(Landroidx/recyclerview/widget/i;)V
    .registers 2

    check-cast p1, Lb9j;

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onViewRecycled(Landroidx/recyclerview/widget/i;)V

    instance-of p0, p1, Lz8j;

    if-eqz p0, :cond_e

    check-cast p1, Lz8j;

    const/4 p0, 0x0

    iput-object p0, p1, Lz8j;->c:Ll6j;

    :cond_e
    return-void
.end method
