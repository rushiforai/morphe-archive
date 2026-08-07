.class public Ll/etj0$b;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/etj0;->l(Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public b:Z

.field public final synthetic c:Ll/x20;

.field public final synthetic d:Ll/etj0;


# direct methods
.method public constructor <init>(Ll/etj0;Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/etj0$b;->d:Ll/etj0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/etj0$b;->c:Ll/x20;

    .line 4
    .line 5
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Ll/etj0$b;->b:Z

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 3
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_2

    .line 5
    .line 6
    iget-object p2, p0, Ll/etj0$b;->d:Ll/etj0;

    .line 7
    .line 8
    iget-object p2, p2, Ll/etj0;->j:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 9
    .line 10
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    iget-object p2, p0, Ll/etj0$b;->d:Ll/etj0;

    .line 17
    .line 18
    iget-object p2, p2, Ll/etj0;->j:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 19
    .line 20
    invoke-virtual {p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 p2, -0x1

    .line 26
    :goto_0
    iget-boolean v0, p0, Ll/etj0$b;->a:Z

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-boolean v0, p0, Ll/etj0$b;->b:Z

    .line 32
    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    const/16 v0, 0x10

    .line 36
    .line 37
    if-lt p2, v0, :cond_1

    .line 38
    .line 39
    iput-boolean v1, p0, Ll/etj0$b;->b:Z

    .line 40
    .line 41
    iget-object p0, p0, Ll/etj0$b;->c:Ll/x20;

    .line 42
    .line 43
    invoke-interface {p0}, Ll/x20;->call()V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    iget-object v0, p0, Ll/etj0$b;->d:Ll/etj0;

    .line 48
    .line 49
    iget-object v0, v0, Ll/etj0;->j:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 50
    .line 51
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    iget-boolean v2, p0, Ll/etj0$b;->a:Z

    .line 56
    .line 57
    if-eqz v2, :cond_2

    .line 58
    .line 59
    iget-boolean v2, p0, Ll/etj0$b;->b:Z

    .line 60
    .line 61
    if-nez v2, :cond_2

    .line 62
    .line 63
    if-lez v0, :cond_2

    .line 64
    .line 65
    iget-object v2, p0, Ll/etj0$b;->d:Ll/etj0;

    .line 66
    .line 67
    iget-object v2, v2, Ll/etj0;->j:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 68
    .line 69
    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    sub-int/2addr v2, v1

    .line 74
    if-lt p2, v2, :cond_2

    .line 75
    .line 76
    iget-object p2, p0, Ll/etj0$b;->d:Ll/etj0;

    .line 77
    .line 78
    iget-object p2, p2, Ll/etj0;->j:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 79
    .line 80
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 81
    .line 82
    .line 83
    move-result p2

    .line 84
    if-lt p2, v0, :cond_2

    .line 85
    .line 86
    sub-int/2addr v0, v1

    .line 87
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-gt p2, v0, :cond_2

    .line 100
    .line 101
    invoke-virtual {p1, v1}, Landroid/view/View;->canScrollVertically(I)Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-nez p1, :cond_2

    .line 106
    .line 107
    iput-boolean v1, p0, Ll/etj0$b;->b:Z

    .line 108
    .line 109
    iget-object p0, p0, Ll/etj0$b;->c:Ll/x20;

    .line 110
    .line 111
    invoke-interface {p0}, Ll/x20;->call()V

    .line 112
    .line 113
    .line 114
    :cond_2
    return-void
.end method

.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 2
    .line 3
    .line 4
    if-lez p3, :cond_0

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p1, 0x0

    .line 9
    :goto_0
    iput-boolean p1, p0, Ll/etj0$b;->a:Z

    .line 10
    .line 11
    return-void
.end method
