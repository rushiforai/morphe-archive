.class public Lwz7;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public c:I

.field public d:I

.field public e:Z

.field public f:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public constructor <init>(IIII)V
    .registers 5

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    iput p1, p0, Lwz7;->a:I

    iput p2, p0, Lwz7;->d:I

    iput p3, p0, Lwz7;->c:I

    iput p4, p0, Lwz7;->b:I

    return-void
.end method


# virtual methods
.method public G(Lxz7;)V
    .registers 3

    iget v0, p0, Lwz7;->d:I

    invoke-virtual {p1, v0}, Lxz7;->V(I)V

    iget p0, p0, Lwz7;->c:I

    invoke-virtual {p1, p0}, Lxz7;->U(I)V

    return-void
.end method

.method public H(Landroid/view/ViewGroup;I)Lxz7;
    .registers 8

    iget p2, p0, Lwz7;->a:I

    invoke-static {p2}, Lvep;->A(I)I

    move-result p2

    const/4 v0, 0x1

    const/4 v1, -0x1

    if-eqz p2, :cond_52

    if-eq p2, v0, :cond_26

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget p2, p0, Lwz7;->d:I

    iget p0, p0, Lwz7;->c:I

    invoke-static {p2, p1, p0}, Lcom/opera/android/custom_views/EmptyListView;->d(ILandroid/content/Context;I)Lcom/opera/android/custom_views/EmptyListView;

    move-result-object p0

    new-instance p1, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {p1, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p1, Lvz7;

    invoke-direct {p1, p0, v0}, Lvz7;-><init>(Landroid/widget/FrameLayout;B)V

    return-object p1

    :cond_26
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget p2, p0, Lwz7;->d:I

    iget v0, p0, Lwz7;->c:I

    new-instance v2, Lcom/opera/android/custom_views/AnimationEmptyListView;

    const/4 v3, 0x0

    const/16 v4, 0xe

    invoke-direct {v2, p1, v3, v4}, Lcom/opera/android/custom_views/AnimationEmptyListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-virtual {v2, p2}, Lcom/opera/android/custom_views/AnimationEmptyListView;->c(I)V

    invoke-virtual {v2, v0}, Lcom/opera/android/custom_views/AnimationEmptyListView;->b(I)V

    iget p0, p0, Lwz7;->b:I

    if-ge p0, v1, :cond_41

    move p0, v1

    :cond_41
    iput p0, v2, Lcom/opera/android/custom_views/AnimationEmptyListView;->c:I

    new-instance p0, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {p0, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v2, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p0, Lvz7;

    const/4 p1, 0x0

    invoke-direct {p0, v2, p1}, Lvz7;-><init>(Landroid/widget/FrameLayout;B)V

    return-object p0

    :cond_52
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget p2, p0, Lwz7;->d:I

    iget p0, p0, Lwz7;->c:I

    invoke-static {p2, p1, p0}, Lcom/opera/android/custom_views/EmptyListView;->d(ILandroid/content/Context;I)Lcom/opera/android/custom_views/EmptyListView;

    move-result-object p0

    new-instance p1, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {p1, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p1, Lvz7;

    invoke-direct {p1, p0, v0}, Lvz7;-><init>(Landroid/widget/FrameLayout;B)V

    return-object p1
.end method

.method public final getItemCount()I
    .registers 1

    iget-boolean p0, p0, Lwz7;->e:Z

    return p0
.end method

.method public final getItemViewType(I)I
    .registers 2

    const p0, 0x7f0a0377

    return p0
.end method

.method public final onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 2

    iput-object p1, p0, Lwz7;->f:Landroidx/recyclerview/widget/RecyclerView;

    iget-boolean p0, p0, Lwz7;->e:Z

    if-eqz p1, :cond_f

    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    if-eqz p1, :cond_f

    xor-int/lit8 p0, p0, 0x1

    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/f;->setMeasurementCacheEnabled(Z)V

    :cond_f
    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 3

    check-cast p1, Lxz7;

    invoke-virtual {p0, p1}, Lwz7;->G(Lxz7;)V

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 3

    invoke-virtual {p0, p1, p2}, Lwz7;->H(Landroid/view/ViewGroup;I)Lxz7;

    move-result-object p0

    return-object p0
.end method

.method public final onDetachedFromRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 2

    const/4 p1, 0x0

    iput-object p1, p0, Lwz7;->f:Landroidx/recyclerview/widget/RecyclerView;

    return-void
.end method
