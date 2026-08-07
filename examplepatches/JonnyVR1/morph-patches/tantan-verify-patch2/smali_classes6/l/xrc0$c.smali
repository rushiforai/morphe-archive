.class public Ll/xrc0$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xrc0$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/xrc0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ll/yrc0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/xrc0$c;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroidx/recyclerview/widget/RecyclerView;)Ll/yem0;
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    new-instance v2, Ll/yem0;

    .line 24
    .line 25
    invoke-direct {v2, p1, v0, v1, p0}, Ll/yem0;-><init>(IIII)V

    .line 26
    .line 27
    .line 28
    return-object v2
.end method

.method public b(Landroidx/recyclerview/widget/RecyclerView;ZF)Lcom/p1/mobile/putong/live/base/util/IntSet;
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Ll/xrc0$c;->a(Landroidx/recyclerview/widget/RecyclerView;)Ll/yem0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/yem0;->a()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/live/base/util/IntSet;->emptySet()Lcom/p1/mobile/putong/live/base/util/IntSet;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    iget v0, p0, Ll/yem0;->a:I

    .line 17
    .line 18
    iget v1, p0, Ll/yem0;->b:I

    .line 19
    .line 20
    iget v2, p0, Ll/yem0;->c:I

    .line 21
    .line 22
    iget p0, p0, Ll/yem0;->d:I

    .line 23
    .line 24
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->findViewByPosition(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->findViewByPosition(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {v3, p2, p3}, Ll/xrc0;->a(Landroid/view/View;ZF)Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-eqz v3, :cond_1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    move v0, v2

    .line 44
    :goto_0
    invoke-static {p1, p2, p3}, Ll/xrc0;->a(Landroid/view/View;ZF)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_2

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_2
    move v1, p0

    .line 52
    :goto_1
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/base/util/IntSet;->interval(II)Lcom/p1/mobile/putong/live/base/util/IntSet;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method
