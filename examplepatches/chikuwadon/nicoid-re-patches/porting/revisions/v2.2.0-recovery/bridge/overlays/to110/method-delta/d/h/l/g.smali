.class public Ld/h/l/g;
.super Ljava/lang/Object;
.source ""


# instance fields
.field public a:Landroid/view/ViewParent;

.field public b:Landroid/view/ViewParent;

.field public final c:Landroid/view/View;

.field public d:Z

.field public e:[I

.field private nicoidOfficialChildHelper:Landroidx/core/view/NestedScrollingChildHelper;


# direct methods
.method private nicoidOfficialChildHelper()Landroidx/core/view/NestedScrollingChildHelper;
    .registers 2

    iget-object v0, p0, Ld/h/l/g;->nicoidOfficialChildHelper:Landroidx/core/view/NestedScrollingChildHelper;

    if-nez v0, :cond_0

    new-instance v0, Landroidx/core/view/NestedScrollingChildHelper;

    invoke-direct {v0, p0}, Landroidx/core/view/NestedScrollingChildHelper;-><init>(Ld/h/l/g;)V

    iput-object v0, p0, Ld/h/l/g;->nicoidOfficialChildHelper:Landroidx/core/view/NestedScrollingChildHelper;

    :cond_0
    return-object v0
.end method


# virtual methods
.method public a(FF)Z
    .registers 4

    invoke-direct {p0}, Ld/h/l/g;->nicoidOfficialChildHelper()Landroidx/core/view/NestedScrollingChildHelper;

    move-result-object p0

    invoke-virtual/range {p0 .. p2}, Landroidx/core/view/NestedScrollingChildHelper;->dispatchNestedPreFling(FF)Z

    move-result v0

    return v0
.end method

.method public a(FFZ)Z
    .registers 5

    invoke-direct {p0}, Ld/h/l/g;->nicoidOfficialChildHelper()Landroidx/core/view/NestedScrollingChildHelper;

    move-result-object p0

    invoke-virtual/range {p0 .. p3}, Landroidx/core/view/NestedScrollingChildHelper;->dispatchNestedFling(FFZ)Z

    move-result v0

    return v0
.end method

.method public a(II)Z
    .registers 4

    invoke-direct {p0}, Ld/h/l/g;->nicoidOfficialChildHelper()Landroidx/core/view/NestedScrollingChildHelper;

    move-result-object p0

    invoke-virtual/range {p0 .. p2}, Landroidx/core/view/NestedScrollingChildHelper;->startNestedScroll(II)Z

    move-result v0

    return v0
.end method

.method public final a(IIII[II[I)Z
    .registers 9

    invoke-direct {p0}, Ld/h/l/g;->nicoidOfficialChildHelper()Landroidx/core/view/NestedScrollingChildHelper;

    move-result-object p0

    invoke-virtual/range {p0 .. p7}, Landroidx/core/view/NestedScrollingChildHelper;->dispatchNestedScrollInternal(IIII[II[I)Z

    move-result v0

    return v0
.end method

.method public a(II[I[II)Z
    .registers 7

    invoke-direct {p0}, Ld/h/l/g;->nicoidOfficialChildHelper()Landroidx/core/view/NestedScrollingChildHelper;

    move-result-object p0

    invoke-virtual/range {p0 .. p5}, Landroidx/core/view/NestedScrollingChildHelper;->dispatchNestedPreScroll(II[I[II)Z

    move-result v0

    return v0
.end method

.method public c(I)V
    .registers 3

    invoke-direct {p0}, Ld/h/l/g;->nicoidOfficialChildHelper()Landroidx/core/view/NestedScrollingChildHelper;

    move-result-object p0

    invoke-virtual/range {p0 .. p1}, Landroidx/core/view/NestedScrollingChildHelper;->stopNestedScroll(I)V

    return-void
.end method
