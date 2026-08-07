.class public Lcom/p1/mobile/putong/core/ui/citytop/b;
.super Landroidx/recyclerview/widget/k$e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/citytop/b$a;,
        Lcom/p1/mobile/putong/core/ui/citytop/b$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroidx/recyclerview/widget/k$e;"
    }
.end annotation


# instance fields
.field public d:Z

.field public e:Z

.field public f:Z

.field public final g:Lcom/p1/mobile/putong/core/ui/citytop/b$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/core/ui/citytop/b$a<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/citytop/b$a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/citytop/b$a<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/k$e;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/citytop/b;->d:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/citytop/b;->e:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/citytop/b;->f:Z

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/citytop/b;->g:Lcom/p1/mobile/putong/core/ui/citytop/b$a;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public B(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 0

    .line 1
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 2
    .line 3
    instance-of p2, p1, Lcom/p1/mobile/putong/core/ui/citytop/b$b;

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/ui/citytop/b$b;

    .line 8
    .line 9
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/citytop/b;->g:Lcom/p1/mobile/putong/core/ui/citytop/b$a;

    .line 10
    .line 11
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/ui/citytop/b$b;->getWrapperData()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/citytop/b;->e:Z

    .line 16
    .line 17
    invoke-interface {p2, p1, p0}, Lcom/p1/mobile/putong/core/ui/citytop/b$a;->z(Ljava/lang/Object;Z)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public C(IF)F
    .locals 1

    .line 1
    int-to-float p0, p1

    .line 2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->B9()F

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    div-float/2addr p0, p1

    .line 15
    const/4 p1, 0x0

    .line 16
    cmpl-float v0, p0, p1

    .line 17
    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    return p1

    .line 21
    :cond_0
    div-float/2addr p2, p0

    .line 22
    const/high16 p0, 0x3f800000    # 1.0f

    .line 23
    .line 24
    invoke-static {p2, p0}, Ljava/lang/Math;->min(FF)F

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    const/high16 p1, -0x40800000    # -1.0f

    .line 29
    .line 30
    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0
.end method

.method public k(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;)I
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p1, p0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/16 p0, 0xf

    .line 10
    .line 11
    invoke-static {p0, p0}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    instance-of p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 17
    .line 18
    if-eqz p1, :cond_2

    .line 19
    .line 20
    check-cast p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->getOrientation()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    const/4 p1, 0x3

    .line 27
    const/16 p2, 0xc

    .line 28
    .line 29
    if-nez p0, :cond_1

    .line 30
    .line 31
    invoke-static {p2, p1}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0

    .line 36
    :cond_1
    invoke-static {p1, p2}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    return p0

    .line 41
    :cond_2
    const/4 p0, 0x0

    .line 42
    invoke-static {p0, p0}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    return p0
.end method

.method public l(F)F
    .locals 0

    .line 1
    const/high16 p0, 0x4f000000

    return p0
.end method

.method public m(Landroidx/recyclerview/widget/RecyclerView$e0;)F
    .locals 0

    .line 1
    const/high16 p0, 0x3e800000    # 0.25f

    return p0
.end method

.method public q()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public r()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public u(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;FFIZ)V
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p6, v0, :cond_5

    .line 3
    .line 4
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    int-to-float v1, v1

    .line 9
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/citytop/b;->m(Landroidx/recyclerview/widget/RecyclerView$e0;)F

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    mul-float/2addr v1, v2

    .line 14
    iget-object v2, p3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 15
    .line 16
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    const/high16 v3, 0x40000000    # 2.0f

    .line 21
    .line 22
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    mul-float/2addr v4, v3

    .line 27
    invoke-virtual {p0, v2, v4}, Lcom/p1/mobile/putong/core/ui/citytop/b;->C(IF)F

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    const/4 v3, 0x0

    .line 32
    cmpl-float v4, p4, v3

    .line 33
    .line 34
    if-lez v4, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    neg-float v2, v2

    .line 38
    :goto_0
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/citytop/b;->g:Lcom/p1/mobile/putong/core/ui/citytop/b$a;

    .line 39
    .line 40
    iget-object v5, p3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 41
    .line 42
    invoke-interface {v4, v5, v2}, Lcom/p1/mobile/putong/core/ui/citytop/b$a;->x(Landroid/view/View;F)V

    .line 43
    .line 44
    .line 45
    cmpl-float v4, v2, v3

    .line 46
    .line 47
    const/4 v5, 0x0

    .line 48
    if-lez v4, :cond_1

    .line 49
    .line 50
    if-eqz p7, :cond_3

    .line 51
    .line 52
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/citytop/b;->e:Z

    .line 53
    .line 54
    iput-boolean v5, p0, Lcom/p1/mobile/putong/core/ui/citytop/b;->f:Z

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_1
    cmpg-float v2, v2, v3

    .line 58
    .line 59
    if-gez v2, :cond_2

    .line 60
    .line 61
    if-eqz p7, :cond_3

    .line 62
    .line 63
    iput-boolean v5, p0, Lcom/p1/mobile/putong/core/ui/citytop/b;->e:Z

    .line 64
    .line 65
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/citytop/b;->f:Z

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    if-eqz p7, :cond_3

    .line 69
    .line 70
    iput-boolean v5, p0, Lcom/p1/mobile/putong/core/ui/citytop/b;->e:Z

    .line 71
    .line 72
    iput-boolean v5, p0, Lcom/p1/mobile/putong/core/ui/citytop/b;->f:Z

    .line 73
    .line 74
    :cond_3
    :goto_1
    if-eqz p7, :cond_5

    .line 75
    .line 76
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    cmpl-float v1, v2, v1

    .line 81
    .line 82
    if-lez v1, :cond_4

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_4
    move v0, v5

    .line 86
    :goto_2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/citytop/b;->d:Z

    .line 87
    .line 88
    :cond_5
    instance-of v0, p2, Lv/VPullUpRecyclerView;

    .line 89
    .line 90
    if-eqz v0, :cond_6

    .line 91
    .line 92
    move-object v0, p2

    .line 93
    check-cast v0, Lv/VPullUpRecyclerView;

    .line 94
    .line 95
    iget-object v1, p3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Lv/VRecyclerView;->F(Landroid/view/View;)V

    .line 98
    .line 99
    .line 100
    :cond_6
    invoke-super/range {p0 .. p7}, Landroidx/recyclerview/widget/k$e;->u(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;FFIZ)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public y(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;Landroidx/recyclerview/widget/RecyclerView$e0;)Z
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 p0, 0x0

    return p0
.end method
