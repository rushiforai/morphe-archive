.class public final Lcom/opera/android/tabui2/TabCarouselLayoutManager;
.super Landroidx/recyclerview/widget/LinearLayoutManager;
.source "SourceFile"

# interfaces
.implements Lq5l;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0001\u0018\u00002\u00020\u00012\u00020\u0002\u00a8\u0006\u0003"
    }
    d2 = {
        "Lcom/opera/android/tabui2/TabCarouselLayoutManager;",
        "Landroidx/recyclerview/widget/LinearLayoutManager;",
        "Lq5l;",
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
.field public final a:I

.field public final b:Lj1k;

.field public final c:Lzc3;


# direct methods
.method public constructor <init>(ILj1k;Lzc3;)V
    .registers 5

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(IZ)V

    iput p1, p0, Lcom/opera/android/tabui2/TabCarouselLayoutManager;->a:I

    iput-object p2, p0, Lcom/opera/android/tabui2/TabCarouselLayoutManager;->b:Lj1k;

    iput-object p3, p0, Lcom/opera/android/tabui2/TabCarouselLayoutManager;->c:Lzc3;

    return-void
.end method


# virtual methods
.method public final a()Ly2c;
    .registers 2

    new-instance p0, La3c;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, La3c;-><init>(B)V

    return-object p0
.end method

.method public final calculateExtraLayoutSpace(Lvph;[I)V
    .registers 4

    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->calculateExtraLayoutSpace(Lvph;[I)V

    const/4 p1, 0x0

    aget v0, p2, p1

    iget p0, p0, Lcom/opera/android/tabui2/TabCarouselLayoutManager;->a:I

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
    .registers 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lcom/opera/android/tabui2/TabCarouselLayoutManager;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lcom/opera/android/tabui2/TabCarouselLayoutManager;

    iget p1, p1, Lcom/opera/android/tabui2/TabCarouselLayoutManager;->a:I

    iget p0, p0, Lcom/opera/android/tabui2/TabCarouselLayoutManager;->a:I

    if-eq p0, p1, :cond_13

    return v2

    :cond_13
    return v0
.end method

.method public final hashCode()I
    .registers 1

    iget p0, p0, Lcom/opera/android/tabui2/TabCarouselLayoutManager;->a:I

    return p0
.end method

.method public final offsetChildrenHorizontal(I)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/f;->offsetChildrenHorizontal(I)V

    iget-object p0, p0, Lcom/opera/android/tabui2/TabCarouselLayoutManager;->b:Lj1k;

    invoke-virtual {p0}, Lj1k;->invoke()Ljava/lang/Object;

    return-void
.end method

.method public final onLayoutCompleted(Lvph;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->onLayoutCompleted(Lvph;)V

    iget-object p0, p0, Lcom/opera/android/tabui2/TabCarouselLayoutManager;->b:Lj1k;

    invoke-virtual {p0}, Lj1k;->invoke()Ljava/lang/Object;

    return-void
.end method

.method public final smoothScrollToPosition(Landroidx/recyclerview/widget/RecyclerView;Lvph;I)V
    .registers 4

    const/4 p1, -0x1

    iget-object p0, p0, Lcom/opera/android/tabui2/TabCarouselLayoutManager;->c:Lzc3;

    if-ne p3, p1, :cond_9

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void

    :cond_9
    iget-object p1, p0, Lzc3;->i:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz p1, :cond_17

    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    if-eqz p1, :cond_17

    invoke-virtual {p0, p1}, Lzc3;->createScroller(Landroidx/recyclerview/widget/f;)Luph;

    move-result-object p0

    if-nez p0, :cond_18

    :cond_17
    return-void

    :cond_18
    invoke-virtual {p0, p3}, Luph;->setTargetPosition(I)V

    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/f;->startSmoothScroll(Luph;)V

    return-void
.end method
