.class public Ll/b0g;
.super Landroidx/recyclerview/widget/k$e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/b0g$a;
    }
.end annotation


# static fields
.field public static f:F = 1.5f


# instance fields
.field public d:Ll/b0g$a;

.field public e:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/b0g$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/k$e;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/b0g;->e:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/b0g;->d:Ll/b0g$a;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public B(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 6

    .line 1
    iget-object v1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 2
    .line 3
    instance-of v0, v1, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/b0g;->d:Ll/b0g$a;

    .line 8
    .line 9
    move-object v2, v1

    .line 10
    check-cast v2, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;

    .line 11
    .line 12
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    iget-boolean v4, p0, Ll/b0g;->e:Z

    .line 17
    .line 18
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$e0;->getAdapterPosition()I

    .line 19
    .line 20
    .line 21
    move-result v5

    .line 22
    move v3, p2

    .line 23
    invoke-interface/range {v0 .. v5}, Ll/b0g$a;->a(Landroid/view/View;Lcom/p1/mobile/putong/data/User;IZI)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    move v3, p2

    .line 28
    instance-of p2, v1, Lcom/p1/mobile/putong/core/ui/seepage/likers/IntlFakeLikersItem;

    .line 29
    .line 30
    if-eqz p2, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Ll/b0g;->d:Ll/b0g$a;

    .line 33
    .line 34
    move-object p2, v1

    .line 35
    check-cast p2, Lcom/p1/mobile/putong/core/ui/seepage/likers/IntlFakeLikersItem;

    .line 36
    .line 37
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/seepage/likers/IntlFakeLikersItem;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    iget-boolean v4, p0, Ll/b0g;->e:Z

    .line 42
    .line 43
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$e0;->getAdapterPosition()I

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    invoke-interface/range {v0 .. v5}, Ll/b0g$a;->a(Landroid/view/View;Lcom/p1/mobile/putong/data/User;IZI)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    instance-of p2, v1, Lcom/p1/mobile/putong/core/ui/seepage/likers/IntlFakeTurboItem;

    .line 52
    .line 53
    if-eqz p2, :cond_2

    .line 54
    .line 55
    iget-object v0, p0, Ll/b0g;->d:Ll/b0g$a;

    .line 56
    .line 57
    iget-boolean v4, p0, Ll/b0g;->e:Z

    .line 58
    .line 59
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$e0;->getAdapterPosition()I

    .line 60
    .line 61
    .line 62
    move-result v5

    .line 63
    const/4 v2, 0x0

    .line 64
    invoke-interface/range {v0 .. v5}, Ll/b0g$a;->a(Landroid/view/View;Lcom/p1/mobile/putong/data/User;IZI)V

    .line 65
    .line 66
    .line 67
    :cond_2
    return-void
.end method

.method public C(IF)F
    .locals 1

    .line 1
    int-to-float p0, p1

    .line 2
    sget p1, Ll/b0g;->f:F

    .line 3
    .line 4
    div-float/2addr p0, p1

    .line 5
    const/4 p1, 0x0

    .line 6
    cmpl-float v0, p0, p1

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return p1

    .line 11
    :cond_0
    div-float/2addr p2, p0

    .line 12
    const/high16 p0, 0x3f800000    # 1.0f

    .line 13
    .line 14
    invoke-static {p2, p0}, Ljava/lang/Math;->min(FF)F

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    const/high16 p1, -0x40800000    # -1.0f

    .line 19
    .line 20
    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public k(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;)I
    .locals 1

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
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object p1, p2, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 10
    .line 11
    instance-of v0, p1, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    instance-of v0, p1, Lcom/p1/mobile/putong/core/ui/seepage/likers/IntlFakeLikersItem;

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/seepage/likers/IntlFakeTurboItem;

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    :cond_0
    const/16 p0, 0xf

    .line 24
    .line 25
    invoke-static {p0, p0}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0

    .line 30
    :cond_1
    instance-of p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 31
    .line 32
    if-eqz p1, :cond_3

    .line 33
    .line 34
    iget-object p1, p2, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 35
    .line 36
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;

    .line 37
    .line 38
    if-eqz p1, :cond_3

    .line 39
    .line 40
    check-cast p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->getOrientation()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    const/4 p1, 0x3

    .line 47
    const/16 p2, 0xc

    .line 48
    .line 49
    if-nez p0, :cond_2

    .line 50
    .line 51
    invoke-static {p2, p1}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    return p0

    .line 56
    :cond_2
    invoke-static {p1, p2}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    return p0

    .line 61
    :cond_3
    iget-object p0, p2, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 62
    .line 63
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;

    .line 64
    .line 65
    if-eqz p1, :cond_4

    .line 66
    .line 67
    const/high16 p1, 0x41200000    # 10.0f

    .line 68
    .line 69
    invoke-virtual {p0, p1}, Landroid/view/View;->setElevation(F)V

    .line 70
    .line 71
    .line 72
    :cond_4
    const/4 p0, 0x0

    .line 73
    invoke-static {p0, p0}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    return p0
.end method

.method public m(Landroidx/recyclerview/widget/RecyclerView$e0;)F
    .locals 0

    .line 1
    const/high16 p0, 0x3e800000    # 0.25f

    .line 2
    .line 3
    return p0
.end method

.method public q()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public r()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public u(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;FFIZ)V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p6, v0, :cond_2

    .line 3
    .line 4
    iget-object v1, p3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 5
    .line 6
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/high16 v2, 0x40000000    # 2.0f

    .line 11
    .line 12
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    mul-float/2addr v3, v2

    .line 17
    invoke-virtual {p0, v1, v3}, Ll/b0g;->C(IF)F

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/4 v2, 0x0

    .line 22
    cmpl-float v3, p4, v2

    .line 23
    .line 24
    if-lez v3, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    neg-float v1, v1

    .line 28
    :goto_0
    cmpl-float v1, v1, v2

    .line 29
    .line 30
    if-lez v1, :cond_1

    .line 31
    .line 32
    if-eqz p7, :cond_2

    .line 33
    .line 34
    iput-boolean v0, p0, Ll/b0g;->e:Z

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    if-eqz p7, :cond_2

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    iput-boolean v0, p0, Ll/b0g;->e:Z

    .line 41
    .line 42
    :cond_2
    :goto_1
    invoke-super/range {p0 .. p7}, Landroidx/recyclerview/widget/k$e;->u(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;FFIZ)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public y(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;Landroidx/recyclerview/widget/RecyclerView$e0;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
