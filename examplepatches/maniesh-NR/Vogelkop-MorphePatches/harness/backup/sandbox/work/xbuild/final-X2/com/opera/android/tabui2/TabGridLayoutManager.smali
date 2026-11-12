.class public final Lcom/opera/android/tabui2/TabGridLayoutManager;
.super Landroidx/recyclerview/widget/GridLayoutManager;
.source "SourceFile"

# interfaces
.implements Lq5l;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0001\u0018\u00002\u00020\u00012\u00020\u0002:\u0001\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/opera/android/tabui2/TabGridLayoutManager;",
        "Landroidx/recyclerview/widget/GridLayoutManager;",
        "Lq5l;",
        "i4l",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final m:B

.field public final n:I

.field public final o:Lj1k;

.field public final p:Ls5l;


# direct methods
.method public constructor <init>(IILj1k;Ls5l;)V
    .registers 5

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(I)V

    iput-byte p1, p0, Lcom/opera/android/tabui2/TabGridLayoutManager;->m:B

    iput p2, p0, Lcom/opera/android/tabui2/TabGridLayoutManager;->n:I

    iput-object p3, p0, Lcom/opera/android/tabui2/TabGridLayoutManager;->o:Lj1k;

    iput-object p4, p0, Lcom/opera/android/tabui2/TabGridLayoutManager;->p:Ls5l;

    return-void
.end method


# virtual methods
.method public final a()Ly2c;
    .registers 3

    new-instance v0, Lz2c;

    iget-object v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->g:Ltx7;

    iget-byte p0, p0, Lcom/opera/android/tabui2/TabGridLayoutManager;->m:B

    invoke-direct {v0, p0, v1}, Lz2c;-><init>(ILtx7;)V

    return-object v0
.end method

.method public final calculateExtraLayoutSpace(Lvph;[I)V
    .registers 4

    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->calculateExtraLayoutSpace(Lvph;[I)V

    const/4 p1, 0x0

    aget v0, p2, p1

    iget p0, p0, Lcom/opera/android/tabui2/TabGridLayoutManager;->n:I

    if-ge v0, p0, :cond_b

    move v0, p0

    :cond_b
    aput v0, p2, p1

    const/4 p1, 0x1

    aget v0, p2, p1

    if-lt v0, p0, :cond_13

    move p0, v0

    :cond_13
    aput p0, p2, p1

    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_16

    instance-of v0, p1, Lcom/opera/android/tabui2/TabGridLayoutManager;

    if-eqz v0, :cond_14

    check-cast p1, Lcom/opera/android/tabui2/TabGridLayoutManager;

    iget-byte v0, p1, Lcom/opera/android/tabui2/TabGridLayoutManager;->m:B

    iget-byte v1, p0, Lcom/opera/android/tabui2/TabGridLayoutManager;->m:B

    if-ne v1, v0, :cond_14

    iget p0, p0, Lcom/opera/android/tabui2/TabGridLayoutManager;->n:I

    iget p1, p1, Lcom/opera/android/tabui2/TabGridLayoutManager;->n:I

    if-eq p0, p1, :cond_16

    :cond_14
    const/4 p0, 0x0

    return p0

    :cond_16
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-byte v0, p0, Lcom/opera/android/tabui2/TabGridLayoutManager;->m:B

    mul-int/lit8 v0, v0, 0x1f

    iget p0, p0, Lcom/opera/android/tabui2/TabGridLayoutManager;->n:I

    add-int/2addr v0, p0

    return v0
.end method

.method public final offsetChildrenVertical(I)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/f;->offsetChildrenVertical(I)V

    iget-object p0, p0, Lcom/opera/android/tabui2/TabGridLayoutManager;->o:Lj1k;

    invoke-virtual {p0}, Lj1k;->invoke()Ljava/lang/Object;

    return-void
.end method

.method public final onLayoutCompleted(Lvph;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/GridLayoutManager;->onLayoutCompleted(Lvph;)V

    iget-object p0, p0, Lcom/opera/android/tabui2/TabGridLayoutManager;->o:Lj1k;

    invoke-virtual {p0}, Lj1k;->invoke()Ljava/lang/Object;

    return-void
.end method

.method public final smoothScrollToPosition(Landroidx/recyclerview/widget/RecyclerView;Lvph;I)V
    .registers 11

    iget-object v0, p0, Lcom/opera/android/tabui2/TabGridLayoutManager;->p:Ls5l;

    iget-object v0, v0, Ls5l;->b:Lz5l;

    iget-object v4, v0, Lz5l;->w:Lqsh;

    const/4 v0, -0x1

    if-eq p3, v0, :cond_1d

    if-eqz v4, :cond_1d

    new-instance v1, Li4l;

    iget-object v5, p0, Landroidx/recyclerview/widget/GridLayoutManager;->g:Ltx7;

    iget-byte v6, p0, Lcom/opera/android/tabui2/TabGridLayoutManager;->m:B

    move-object v3, p0

    move-object v2, p1

    invoke-direct/range {v1 .. v6}, Li4l;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/tabui2/TabGridLayoutManager;Lqsh;Ltx7;I)V

    invoke-virtual {v1, p3}, Luph;->setTargetPosition(I)V

    invoke-virtual {v3, v1}, Landroidx/recyclerview/widget/f;->startSmoothScroll(Luph;)V

    return-void

    :cond_1d
    move-object v3, p0

    move-object v2, p1

    invoke-super {v3, v2, p2, p3}, Landroidx/recyclerview/widget/LinearLayoutManager;->smoothScrollToPosition(Landroidx/recyclerview/widget/RecyclerView;Lvph;I)V

    return-void
.end method
