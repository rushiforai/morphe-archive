.class public final Ln5g;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"

# interfaces
.implements Ljvk;


# instance fields
.field public final a:Lqfb;

.field public final b:Lw4g;

.field public final c:Lflb;

.field public final d:Lmvk;

.field public final e:Lpad;

.field public f:Ld5g;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lqfb;Lw4g;)V
    .registers 12

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    iput-object p2, p0, Ln5g;->a:Lqfb;

    iput-object p3, p0, Ln5g;->b:Lw4g;

    new-instance p2, Lnvk;

    invoke-direct {p2, p1, p0}, Lnvk;-><init>(Landroid/content/Context;Ljvk;)V

    new-instance p1, Lflb;

    invoke-direct {p1, p2}, Lflb;-><init>(Lblb;)V

    iput-object p1, p0, Ln5g;->c:Lflb;

    const p1, 0x7f140567

    invoke-static {p1}, Lnvk;->v(I)Lmvk;

    move-result-object p1

    iput-object p1, p0, Ln5g;->d:Lmvk;

    new-instance p1, Lpad;

    const/16 p2, 0x1c

    const/4 p3, 0x0

    invoke-direct {p1, p2, p3}, Lpad;-><init>(BZ)V

    iput-object p1, p0, Ln5g;->e:Lpad;

    new-instance v0, Ld5g;

    sget-object v1, Ll08;->a:Ll08;

    sget-object v2, Lu3g;->d:Lu3g;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v7}, Ld5g;-><init>(Ljava/util/List;Lu3g;ZZZZZ)V

    iput-object v0, p0, Ln5g;->f:Ld5g;

    return-void
.end method


# virtual methods
.method public final getItemCount()I
    .registers 1

    iget-object p0, p0, Ln5g;->f:Ld5g;

    iget p0, p0, Ld5g;->k:I

    return p0
.end method

.method public final getItemViewType(I)I
    .registers 3

    iget-object p0, p0, Ln5g;->f:Ld5g;

    iget v0, p0, Ld5g;->j:I

    if-ne p1, v0, :cond_8

    const/4 p0, 0x3

    return p0

    :cond_8
    iget v0, p0, Ld5g;->i:I

    if-ne p1, v0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    iget p0, p0, Ld5g;->h:I

    if-ne p1, p0, :cond_14

    const/4 p0, 0x2

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method public final h(Landroidx/recyclerview/widget/i;[Lhvk;)V
    .registers 3

    const/4 p1, 0x0

    iget-object p0, p0, Ln5g;->d:Lmvk;

    aput-object p0, p2, p1

    const/4 p1, 0x1

    aput-object p0, p2, p1

    return-void
.end method

.method public final k(Landroidx/recyclerview/widget/i;Lhvk;)V
    .registers 6

    invoke-virtual {p1}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result p2

    iget-object v0, p0, Ln5g;->f:Ld5g;

    invoke-virtual {v0, p2}, Ld5g;->a(I)Lw3g;

    move-result-object p2

    new-instance v0, Lvvf;

    const/4 v1, 0x3

    invoke-direct {v0, p0, p1, v1}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Ln5g;->a:Lqfb;

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Lt5g;

    invoke-virtual {p0}, Lt5g;->I0()Lt6g;

    move-result-object p1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p0

    iget-object v1, p1, Lt6g;->b:Lot2;

    new-instance v2, Lc0h;

    invoke-direct {v2, v0, p1, p2}, Lc0h;-><init>(Lvvf;Lt6g;Lw3g;)V

    iget-object p1, v1, Lot2;->b:Lgjm;

    new-instance v0, La27;

    iget-object p2, p2, Lw3g;->c:Ljava/lang/String;

    invoke-direct {v0, p2}, La27;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0, p0, v2}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    return-void
.end method

.method public final n(Landroidx/recyclerview/widget/i;)Z
    .registers 2

    instance-of p0, p1, Lk5g;

    return p0
.end method

.method public final onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    iget-object p0, p0, Ln5g;->c:Lflb;

    invoke-virtual {p0, p1}, Lflb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 11

    check-cast p1, Lm5g;

    if-eqz p1, :cond_b8

    instance-of v0, p1, Lk5g;

    const/16 v1, 0x8

    const/4 v2, 0x0

    if-eqz v0, :cond_57

    check-cast p1, Lk5g;

    iget-object p0, p0, Ln5g;->f:Ld5g;

    invoke-virtual {p0, p2}, Ld5g;->a(I)Lw3g;

    move-result-object p0

    iget p2, p0, Lw3g;->a:I

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    iput-object p2, p1, Lk5g;->f:Ljava/lang/Integer;

    iget-object p2, p0, Lw3g;->b:Lorg/chromium/url/GURL;

    iget-object p2, p2, Lorg/chromium/url/GURL;->a:Ljava/lang/String;

    iput-object p2, p1, Lk5g;->g:Ljava/lang/String;

    iget-object p2, p0, Lw3g;->c:Ljava/lang/String;

    iput-object p2, p1, Lk5g;->h:Ljava/lang/String;

    new-instance v0, Li4g;

    iget-object v3, p1, Lk5g;->d:Lw4g;

    iget v4, p1, Lk5g;->e:I

    invoke-direct {v0, v3, p0, v4, p1}, Li4g;-><init>(Lw4g;Lw3g;ILh4g;)V

    iget-object v0, p1, Lk5g;->b:Lvs;

    iget-object v3, v0, Lvs;->e:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v4, v0, Lvs;->c:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p2, p0, Lw3g;->f:Ljava/lang/String;

    invoke-virtual {v4, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    if-lez p2, :cond_47

    move v1, v2

    :cond_47
    invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p2, v0, Lvs;->b:Landroid/view/ViewGroup;

    check-cast p2, Lcom/opera/android/widget/SelectableRelativeLayout;

    new-instance v0, Lj5g;

    invoke-direct {v0, p1, p0, v2}, Lj5g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_57
    instance-of p2, p1, Lg5g;

    if-eqz p2, :cond_b8

    check-cast p1, Lg5g;

    iget-object p0, p0, Ln5g;->f:Ld5g;

    iget-object p2, p0, Ld5g;->b:Lu3g;

    iget-boolean v0, p0, Ld5g;->d:Z

    iget-boolean v3, p0, Ld5g;->e:Z

    iget-boolean v4, p0, Ld5g;->f:Z

    iget-boolean p0, p0, Ld5g;->g:Z

    iget-object p1, p1, Lg5g;->b:Lf5g;

    iget-object v5, p1, Lf5g;->d:Lp5g;

    iget-object v6, p1, Lf5g;->c:Lcom/opera/android/custom_views/AnimationEmptyListView;

    iget-object v7, p1, Lf5g;->e:Lu3g;

    if-eq v7, p2, :cond_8a

    iput-object p2, p1, Lf5g;->e:Lu3g;

    iget v7, p2, Lu3g;->b:I

    invoke-virtual {v6, v7}, Lcom/opera/android/custom_views/AnimationEmptyListView;->c(I)V

    iget v7, p2, Lu3g;->a:I

    invoke-virtual {v6, v7}, Lcom/opera/android/custom_views/AnimationEmptyListView;->b(I)V

    iget p2, p2, Lu3g;->c:I

    const/4 v7, -0x1

    if-ge p2, v7, :cond_85

    move p2, v7

    :cond_85
    iput p2, v6, Lcom/opera/android/custom_views/AnimationEmptyListView;->c:I

    invoke-virtual {v6}, Lcom/opera/android/custom_views/AnimationEmptyListView;->a()V

    :cond_8a
    iget-object p2, p1, Lf5g;->a:Li5g;

    iget-object p2, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    if-eqz v0, :cond_92

    move v0, v2

    goto :goto_93

    :cond_92
    move v0, v1

    :goto_93
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p1, Lf5g;->b:Li5g;

    iget-object p1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    if-eqz v3, :cond_9e

    move p2, v2

    goto :goto_9f

    :cond_9e
    move p2, v1

    :goto_9f
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    if-eqz v4, :cond_a6

    move p1, v2

    goto :goto_a7

    :cond_a6
    move p1, v1

    :goto_a7
    invoke-virtual {v5, p1}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, v5, Lp5g;->b:Ljava/lang/Object;

    check-cast p1, Lq5g;

    iget-object p1, p1, Lq5g;->d:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    if-eqz p0, :cond_b5

    move v1, v2

    :cond_b5
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_b8
    return-void
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 13

    iget-object v3, p0, Ln5g;->b:Lw4g;

    iget-object v4, p0, Ln5g;->a:Lqfb;

    if-eqz p2, :cond_4c

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eq p2, v6, :cond_46

    const/4 v7, 0x2

    if-eq p2, v7, :cond_1c

    const/4 v0, 0x3

    if-eq p2, v0, :cond_16

    new-instance v0, Lk5g;

    invoke-direct {v0, p1, v4, v3}, Lk5g;-><init>(Landroid/view/ViewGroup;Lqfb;Lw4g;)V

    return-object v0

    :cond_16
    new-instance v0, Li5g;

    invoke-direct {v0, p1, v4, v6}, Li5g;-><init>(Landroid/view/ViewGroup;Lqfb;B)V

    return-object v0

    :cond_1c
    new-instance v2, Lg5g;

    move-object v3, v2

    new-instance v2, Li5g;

    invoke-direct {v2, p1, v4, v5}, Li5g;-><init>(Landroid/view/ViewGroup;Lqfb;B)V

    move-object v5, v3

    new-instance v3, Li5g;

    invoke-direct {v3, p1, v4, v6}, Li5g;-><init>(Landroid/view/ViewGroup;Lqfb;B)V

    iget-object v4, p0, Ln5g;->f:Ld5g;

    iget-object v6, v4, Ld5g;->b:Lu3g;

    move-object v7, v5

    iget-boolean v5, v4, Ld5g;->d:Z

    move-object v8, v6

    iget-boolean v6, v4, Ld5g;->e:Z

    move-object v9, v7

    iget-boolean v7, v4, Ld5g;->f:Z

    iget-boolean v4, v4, Ld5g;->g:Z

    iget-object v0, p0, Ln5g;->a:Lqfb;

    move-object v1, v9

    move-object v9, v0

    move-object v0, v1

    move-object v1, v8

    move v8, v4

    move-object v4, v1

    move-object v1, p1

    invoke-direct/range {v0 .. v9}, Lg5g;-><init>(Landroid/view/ViewGroup;Li5g;Li5g;Lu3g;ZZZZLqfb;)V

    return-object v0

    :cond_46
    new-instance v0, Li5g;

    invoke-direct {v0, p1, v4, v5}, Li5g;-><init>(Landroid/view/ViewGroup;Lqfb;B)V

    return-object v0

    :cond_4c
    new-instance v0, Lk5g;

    invoke-direct {v0, p1, v4, v3}, Lk5g;-><init>(Landroid/view/ViewGroup;Lqfb;Lw4g;)V

    return-object v0
.end method

.method public final onDetachedFromRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onDetachedFromRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    iget-object p0, p0, Ln5g;->c:Lflb;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lflb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method
