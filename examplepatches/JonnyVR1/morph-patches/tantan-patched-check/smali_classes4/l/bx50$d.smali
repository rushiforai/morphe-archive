.class public final Ll/bx50$d;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/bx50;->G()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\'\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0008\n\u0002\u0010\u000b\n\u0002\u0008\u0006*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\'\u0010\u0008\u001a\u00020\u00072\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u001f\u0010\u000b\u001a\u00020\u00072\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\n\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cR\u0014\u0010\u000f\u001a\u00020\u00048\u0002X\u0082D\u00a2\u0006\u0006\n\u0004\u0008\r\u0010\u000eR\u0016\u0010\u0013\u001a\u00020\u00108\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0011\u0010\u0012R\u0016\u0010\u0015\u001a\u00020\u00108\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0014\u0010\u0012\u00a8\u0006\u0016"
    }
    d2 = {
        "l/bx50$d",
        "Landroidx/recyclerview/widget/RecyclerView$t;",
        "Landroidx/recyclerview/widget/RecyclerView;",
        "recyclerView",
        "",
        "dx",
        "dy",
        "",
        "onScrolled",
        "(Landroidx/recyclerview/widget/RecyclerView;II)V",
        "newState",
        "onScrollStateChanged",
        "(Landroidx/recyclerview/widget/RecyclerView;I)V",
        "a",
        "I",
        "SCROLL_ITEM_COUNT",
        "",
        "b",
        "Z",
        "isScrollingToBottom",
        "c",
        "pullUpDisable",
        "member_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:I

.field public b:Z

.field public c:Z

.field public final synthetic d:Landroidx/recyclerview/widget/GridLayoutManager;

.field public final synthetic e:Ll/bx50;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/GridLayoutManager;Ll/bx50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bx50$d;->d:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 2
    .line 3
    iput-object p2, p0, Ll/bx50$d;->e:Ll/bx50;

    .line 4
    .line 5
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 6
    .line 7
    .line 8
    const/16 p1, 0xa

    .line 9
    .line 10
    iput p1, p0, Ll/bx50$d;->a:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 5
    .line 6
    .line 7
    if-nez p2, :cond_1

    .line 8
    .line 9
    iget-object p2, p0, Ll/bx50$d;->d:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 10
    .line 11
    invoke-virtual {p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    iget-boolean v0, p0, Ll/bx50$d;->b:Z

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-boolean v0, p0, Ll/bx50$d;->c:Z

    .line 21
    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    iget v0, p0, Ll/bx50$d;->a:I

    .line 25
    .line 26
    sub-int/2addr v0, v1

    .line 27
    if-ne p2, v0, :cond_0

    .line 28
    .line 29
    invoke-static {}, Ll/joa;->O3()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-nez p1, :cond_1

    .line 34
    .line 35
    iput-boolean v1, p0, Ll/bx50$d;->c:Z

    .line 36
    .line 37
    iget-object p0, p0, Ll/bx50$d;->e:Ll/bx50;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/bx50;->m()Lcom/p1/mobile/putong/core/newui/onlinezone/OnlineZonePresenter;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/onlinezone/OnlineZonePresenter;->R0()V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    iget-object v0, p0, Ll/bx50$d;->d:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 48
    .line 49
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    iget-boolean v2, p0, Ll/bx50$d;->b:Z

    .line 54
    .line 55
    if-eqz v2, :cond_1

    .line 56
    .line 57
    iget-boolean v2, p0, Ll/bx50$d;->c:Z

    .line 58
    .line 59
    if-nez v2, :cond_1

    .line 60
    .line 61
    if-lez v0, :cond_1

    .line 62
    .line 63
    iget-object v2, p0, Ll/bx50$d;->d:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 64
    .line 65
    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    sub-int/2addr v2, v1

    .line 70
    if-lt p2, v2, :cond_1

    .line 71
    .line 72
    iget-object p2, p0, Ll/bx50$d;->d:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 73
    .line 74
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    if-lt p2, v0, :cond_1

    .line 79
    .line 80
    sub-int/2addr v0, v1

    .line 81
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    .line 86
    .line 87
    .line 88
    move-result p2

    .line 89
    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-gt p2, v0, :cond_1

    .line 94
    .line 95
    invoke-virtual {p1, v1}, Landroid/view/View;->canScrollVertically(I)Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    if-nez p1, :cond_1

    .line 100
    .line 101
    invoke-static {}, Ll/joa;->O3()Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-nez p1, :cond_1

    .line 106
    .line 107
    iput-boolean v1, p0, Ll/bx50$d;->c:Z

    .line 108
    .line 109
    iget-object p0, p0, Ll/bx50$d;->e:Ll/bx50;

    .line 110
    .line 111
    invoke-virtual {p0}, Ll/bx50;->m()Lcom/p1/mobile/putong/core/newui/onlinezone/OnlineZonePresenter;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/onlinezone/OnlineZonePresenter;->R0()V

    .line 116
    .line 117
    .line 118
    :cond_1
    return-void
.end method

.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    if-lez p3, :cond_0

    .line 9
    .line 10
    const/4 p2, 0x1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move p2, p1

    .line 13
    :goto_0
    iput-boolean p2, p0, Ll/bx50$d;->b:Z

    .line 14
    .line 15
    if-nez p2, :cond_1

    .line 16
    .line 17
    iput-boolean p1, p0, Ll/bx50$d;->c:Z

    .line 18
    .line 19
    :cond_1
    return-void
.end method
