.class public final Ll/zk80;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0007\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\n\u0018\u00002\u00020\u0001B\'\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\u0008\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\t\u0010\nJ\'\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\r\u001a\u00020\u00042\u0006\u0010\u000e\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u0011R\u0016\u0010\u0003\u001a\u00020\u00028\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0012\u0010\u0013R\u0016\u0010\u0005\u001a\u00020\u00048\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0014\u0010\u0015R\u0016\u0010\u0007\u001a\u00020\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0016\u0010\u0017R\u0016\u0010\u0008\u001a\u00020\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0018\u0010\u0017\u00a8\u0006\u0019"
    }
    d2 = {
        "Ll/zk80;",
        "Landroidx/recyclerview/widget/RecyclerView$t;",
        "Landroidx/recyclerview/widget/LinearLayoutManager;",
        "layoutManager",
        "",
        "recyclerViewWidthExpect",
        "",
        "itemWidth",
        "overlapWidth",
        "<init>",
        "(Landroidx/recyclerview/widget/LinearLayoutManager;IFF)V",
        "Landroidx/recyclerview/widget/RecyclerView;",
        "recyclerView",
        "dx",
        "dy",
        "",
        "onScrolled",
        "(Landroidx/recyclerview/widget/RecyclerView;II)V",
        "a",
        "Landroidx/recyclerview/widget/LinearLayoutManager;",
        "b",
        "I",
        "c",
        "F",
        "d",
        "b_feed_intlGmsRelease"
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
.field public a:Landroidx/recyclerview/widget/LinearLayoutManager;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:I

.field public c:F

.field public d:F


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/LinearLayoutManager;IFF)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/LinearLayoutManager;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/zk80;->a:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 8
    .line 9
    iput p2, p0, Ll/zk80;->b:I

    .line 10
    .line 11
    iput p3, p0, Ll/zk80;->c:F

    .line 12
    .line 13
    iput p4, p0, Ll/zk80;->d:F

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 8
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/zk80;->a:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iget-object p2, p0, Ll/zk80;->a:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 14
    .line 15
    invoke-virtual {p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    iget p3, p0, Ll/zk80;->c:F

    .line 20
    .line 21
    const/high16 v0, 0x40000000    # 2.0f

    .line 22
    .line 23
    mul-float v1, p3, v0

    .line 24
    .line 25
    iget v2, p0, Ll/zk80;->d:F

    .line 26
    .line 27
    sub-float/2addr v1, v2

    .line 28
    div-float v3, p3, v0

    .line 29
    .line 30
    sub-float/2addr v1, v3

    .line 31
    iget v3, p0, Ll/zk80;->b:I

    .line 32
    .line 33
    int-to-float v3, v3

    .line 34
    mul-float v4, p3, v0

    .line 35
    .line 36
    sub-float/2addr v3, v4

    .line 37
    add-float/2addr v3, v2

    .line 38
    div-float/2addr p3, v0

    .line 39
    add-float/2addr v3, p3

    .line 40
    sub-int/2addr p2, p1

    .line 41
    if-ltz p2, :cond_4

    .line 42
    .line 43
    const/4 p3, 0x0

    .line 44
    move v0, p3

    .line 45
    :goto_0
    iget-object v2, p0, Ll/zk80;->a:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 46
    .line 47
    add-int v4, v0, p1

    .line 48
    .line 49
    invoke-virtual {v2, v4}, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    if-nez v2, :cond_0

    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_0
    iget v4, p0, Ll/zk80;->c:F

    .line 57
    .line 58
    const/high16 v5, 0x3f000000    # 0.5f

    .line 59
    .line 60
    mul-float/2addr v4, v5

    .line 61
    invoke-virtual {v2, v4}, Landroid/view/View;->setPivotX(F)V

    .line 62
    .line 63
    .line 64
    iget v4, p0, Ll/zk80;->c:F

    .line 65
    .line 66
    mul-float/2addr v4, v5

    .line 67
    invoke-virtual {v2, v4}, Landroid/view/View;->setPivotY(F)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v2}, Landroid/view/View;->getRight()I

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 75
    .line 76
    .line 77
    move-result v6

    .line 78
    div-int/lit8 v6, v6, 0x2

    .line 79
    .line 80
    sub-int/2addr v4, v6

    .line 81
    int-to-float v4, v4

    .line 82
    cmpl-float v6, v4, v3

    .line 83
    .line 84
    if-ltz v6, :cond_1

    .line 85
    .line 86
    sub-float/2addr v4, v3

    .line 87
    sub-float/2addr v4, v5

    .line 88
    invoke-static {v4}, Ll/fhx;->b(F)I

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    goto :goto_1

    .line 93
    :cond_1
    cmpg-float v6, v4, v1

    .line 94
    .line 95
    if-gtz v6, :cond_2

    .line 96
    .line 97
    sub-float v4, v1, v4

    .line 98
    .line 99
    sub-float/2addr v4, v5

    .line 100
    invoke-static {v4}, Ll/fhx;->b(F)I

    .line 101
    .line 102
    .line 103
    move-result v4

    .line 104
    goto :goto_1

    .line 105
    :cond_2
    move v4, p3

    .line 106
    :goto_1
    int-to-float v4, v4

    .line 107
    const/high16 v5, 0x3f800000    # 1.0f

    .line 108
    .line 109
    mul-float/2addr v4, v5

    .line 110
    iget v6, p0, Ll/zk80;->c:F

    .line 111
    .line 112
    iget v7, p0, Ll/zk80;->d:F

    .line 113
    .line 114
    sub-float/2addr v6, v7

    .line 115
    div-float/2addr v4, v6

    .line 116
    sub-float/2addr v5, v4

    .line 117
    const/4 v4, 0x0

    .line 118
    cmpg-float v6, v5, v4

    .line 119
    .line 120
    if-gtz v6, :cond_3

    .line 121
    .line 122
    move v5, v4

    .line 123
    :cond_3
    invoke-virtual {v2, v5}, Landroid/view/View;->setScaleX(F)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v2, v5}, Landroid/view/View;->setScaleY(F)V

    .line 127
    .line 128
    .line 129
    const v4, 0x3f4ccccd    # 0.8f

    .line 130
    .line 131
    .line 132
    mul-float/2addr v5, v4

    .line 133
    const v4, 0x3e4ccccd    # 0.2f

    .line 134
    .line 135
    .line 136
    add-float/2addr v5, v4

    .line 137
    invoke-virtual {v2, v5}, Landroid/view/View;->setAlpha(F)V

    .line 138
    .line 139
    .line 140
    :goto_2
    if-eq v0, p2, :cond_4

    .line 141
    .line 142
    add-int/lit8 v0, v0, 0x1

    .line 143
    .line 144
    goto :goto_0

    .line 145
    :cond_4
    return-void
.end method
