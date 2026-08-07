.class public Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;
    }
.end annotation


# instance fields
.field public a:Landroidx/recyclerview/widget/RecyclerView;

.field public b:Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;

.field public c:Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;

.field public d:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 134
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 133
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 4
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p3, 0x0

    .line 5
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;->d:Z

    .line 6
    .line 7
    sget-object v0, Ll/xhc0;->a:[I

    .line 8
    .line 9
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    const/high16 v0, 0x41a00000    # 20.0f

    .line 14
    .line 15
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    sget v1, Ll/xhc0;->c:I

    .line 22
    .line 23
    invoke-virtual {p2, v1, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;->d:Z

    .line 28
    .line 29
    sget v1, Ll/xhc0;->b:I

    .line 30
    .line 31
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-virtual {p2, v1, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    :cond_0
    new-instance v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 40
    .line 41
    invoke-direct {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 45
    .line 46
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 47
    .line 48
    const/4 v2, -0x1

    .line 49
    invoke-direct {v0, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 50
    .line 51
    .line 52
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;->d:Z

    .line 53
    .line 54
    if-eqz v3, :cond_1

    .line 55
    .line 56
    new-instance v3, Landroidx/cardview/widget/CardView;

    .line 57
    .line 58
    invoke-direct {v3, p1}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;)V

    .line 59
    .line 60
    .line 61
    const/4 p1, 0x0

    .line 62
    invoke-virtual {v3, p1}, Landroidx/cardview/widget/CardView;->setCardElevation(F)V

    .line 63
    .line 64
    .line 65
    int-to-float p1, v1

    .line 66
    invoke-virtual {v3, p1}, Landroidx/cardview/widget/CardView;->setRadius(F)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v3, p3}, Landroidx/cardview/widget/CardView;->setUseCompatPadding(Z)V

    .line 70
    .line 71
    .line 72
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 73
    .line 74
    invoke-direct {p1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, v3, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 81
    .line 82
    invoke-virtual {v3, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 87
    .line 88
    invoke-virtual {p0, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 89
    .line 90
    .line 91
    :goto_0
    new-instance p1, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;

    .line 92
    .line 93
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 94
    .line 95
    invoke-direct {p1, p3}, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 96
    .line 97
    .line 98
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;->c:Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;

    .line 99
    .line 100
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 101
    .line 102
    invoke-virtual {p3, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 103
    .line 104
    .line 105
    new-instance p1, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;

    .line 106
    .line 107
    iget-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;->d:Z

    .line 108
    .line 109
    invoke-direct {p1, p3}, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;-><init>(Z)V

    .line 110
    .line 111
    .line 112
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;->b:Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;

    .line 113
    .line 114
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 115
    .line 116
    invoke-virtual {p3, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 120
    .line 121
    new-instance p3, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$a;

    .line 122
    .line 123
    invoke-direct {p3, p0}, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$a;-><init>(Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p1, p3}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 130
    .line 131
    .line 132
    return-void
.end method


# virtual methods
.method public b(Landroidx/recyclerview/widget/RecyclerView$t;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$t;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;->b:Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;->y()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;->b:Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;->y()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ll/h11;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/h11;->b()V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    return-void
.end method

.method public setItemData(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;->b:Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;->z(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;->c:Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLayoutManager;->e()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;->b:Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setViewHolderData(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ll/hll0;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;->b:Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView$b;->A(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
