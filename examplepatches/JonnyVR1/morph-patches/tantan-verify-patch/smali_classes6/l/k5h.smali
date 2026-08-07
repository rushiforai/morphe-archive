.class public Ll/k5h;
.super Ll/k1i;
.source "SourceFile"

# interfaces
.implements Ll/npg;


# static fields
.field public static k:Landroid/graphics/Point;


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public d:I

.field public e:I

.field public f:Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;

.field public g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

.field public h:Landroid/app/Activity;

.field public i:Ljava/lang/String;

.field public j:Ll/qgh;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/k1i;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/bnl0;->y0()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iput v0, p0, Ll/k5h;->a:I

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput v0, p0, Ll/k5h;->b:I

    .line 12
    .line 13
    const/high16 v1, 0x41c00000    # 24.0f

    .line 14
    .line 15
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iput v1, p0, Ll/k5h;->c:I

    .line 20
    .line 21
    iput v0, p0, Ll/k5h;->e:I

    .line 22
    .line 23
    iput-object p1, p0, Ll/k5h;->h:Landroid/app/Activity;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/k5h;->o()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p2}, Ll/k5h;->n(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic b(Ll/k5h;Landroid/graphics/Point;)Landroid/graphics/Point;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k5h;->g(Landroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Landroid/graphics/Point;)V
    .locals 0

    .line 1
    sput-object p0, Ll/k5h;->k:Landroid/graphics/Point;

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic d(Ll/k5h;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/k5h;->q()V

    return-void
.end method

.method public static synthetic e(Ll/k5h;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/k5h;->m()V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Exception;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k5h;->g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/k5h;->g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->a(Ljava/lang/Exception;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p1, p0, Ll/k5h;->h:Landroid/app/Activity;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/k5h;->u(Landroid/app/Activity;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final f()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/k5h;->h:Landroid/app/Activity;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/g5h;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/g5h;-><init>(Ll/k5h;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final g(Landroid/graphics/Point;)Landroid/graphics/Point;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/k5h;->t()V

    .line 2
    .line 3
    .line 4
    iget v0, p1, Landroid/graphics/Point;->x:I

    .line 5
    .line 6
    if-gez v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p1, Landroid/graphics/Point;->x:I

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget v1, p0, Ll/k5h;->e:I

    .line 13
    .line 14
    if-le v0, v1, :cond_1

    .line 15
    .line 16
    iput v1, p1, Landroid/graphics/Point;->x:I

    .line 17
    .line 18
    :cond_1
    :goto_0
    iget v0, p1, Landroid/graphics/Point;->y:I

    .line 19
    .line 20
    iget v1, p0, Ll/k5h;->c:I

    .line 21
    .line 22
    if-ge v0, v1, :cond_2

    .line 23
    .line 24
    iput v1, p1, Landroid/graphics/Point;->y:I

    .line 25
    .line 26
    return-object p1

    .line 27
    :cond_2
    iget p0, p0, Ll/k5h;->d:I

    .line 28
    .line 29
    if-le v0, p0, :cond_3

    .line 30
    .line 31
    iput p0, p1, Landroid/graphics/Point;->y:I

    .line 32
    .line 33
    :cond_3
    return-object p1
.end method

.method public h()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k5h;->h:Landroid/app/Activity;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/k5h;->v(Landroid/app/Activity;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/k5h;->g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/k5h;->g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->h()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public i(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k5h;->g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/k5h;->g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->i(Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    if-nez p1, :cond_1

    .line 15
    .line 16
    iget-object p1, p0, Ll/k5h;->h:Landroid/app/Activity;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/k5h;->u(Landroid/app/Activity;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public j(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k5h;->g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/k5h;->g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->j(F)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public k()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k5h;->j:Ll/qgh;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/k5h;->j:Ll/qgh;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/qgh;->a()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final l()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/k5h;->g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 13
    .line 14
    if-gez v0, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/k5h;->g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_0
    return v0
.end method

.method public final m()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k5h;->h:Landroid/app/Activity;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/k5h;->h:Landroid/app/Activity;

    .line 10
    .line 11
    instance-of v0, p0, Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final n(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Ll/k5h;->g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 9
    .line 10
    iget-object v1, p0, Ll/k5h;->h:Landroid/app/Activity;

    .line 11
    .line 12
    invoke-direct {v0, v1, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;-><init>(Landroid/content/Context;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/k5h;->g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 16
    .line 17
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;

    .line 18
    .line 19
    iget-object v0, p0, Ll/k5h;->h:Landroid/app/Activity;

    .line 20
    .line 21
    iget-object v1, p0, Ll/k5h;->g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 22
    .line 23
    invoke-direct {p1, v0, v1}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->K()Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    new-instance v0, Ll/h5h;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Ll/h5h;-><init>(Ll/k5h;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->C(Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView$a;)Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    new-instance v0, Ll/i5h;

    .line 40
    .line 41
    invoke-direct {v0}, Ll/i5h;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->E(Ll/y20;)Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    new-instance v0, Ll/j5h;

    .line 49
    .line 50
    invoke-direct {v0, p0}, Ll/j5h;-><init>(Ll/k5h;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->F(Ll/x20;)Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iput-object p1, p0, Ll/k5h;->f:Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/k5h;->f()V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    iget-object v1, p0, Ll/k5h;->i:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->setFrom(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Ll/k5h;->g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->L(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final o()V
    .locals 3

    .line 1
    sget-object v0, Ll/k5h;->k:Landroid/graphics/Point;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/graphics/Point;

    .line 6
    .line 7
    iget-object v1, p0, Ll/k5h;->h:Landroid/app/Activity;

    .line 8
    .line 9
    invoke-static {v1}, Ll/bnl0;->x0(Landroid/content/Context;)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/high16 v2, 0x430e0000    # 142.0f

    .line 14
    .line 15
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    sub-int/2addr v1, v2

    .line 20
    iget-object p0, p0, Ll/k5h;->h:Landroid/app/Activity;

    .line 21
    .line 22
    invoke-static {p0}, Ll/bnl0;->I(Landroid/content/Context;)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    sub-int/2addr v1, p0

    .line 27
    const/4 p0, 0x0

    .line 28
    invoke-direct {v0, p0, v1}, Landroid/graphics/Point;-><init>(II)V

    .line 29
    .line 30
    .line 31
    sput-object v0, Ll/k5h;->k:Landroid/graphics/Point;

    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/k1i;->onActivityPaused(Landroid/app/Activity;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/lpg;->v()Ll/lpg;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/lpg;->D()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/k5h;->u(Landroid/app/Activity;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/k5h;->h:Landroid/app/Activity;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/k5h;->f()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/lpg;->v()Ll/lpg;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ll/lpg;->D()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/k5h;->v(Landroid/app/Activity;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ll/k5h;->g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Ll/k5h;->g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->setCurrentShowAct(Landroid/app/Activity;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public onComplete()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k5h;->g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/k5h;->g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->onComplete()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/k5h;->h:Landroid/app/Activity;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/k5h;->u(Landroid/app/Activity;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k5h;->g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/k5h;->g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->onPause()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k5h;->g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/k5h;->g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->onResume()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k5h;->h:Landroid/app/Activity;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/k5h;->v(Landroid/app/Activity;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/k5h;->g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/k5h;->g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->onStart()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final p(Landroid/app/Activity;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic q()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/k5h;->k()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/qgh;

    .line 5
    .line 6
    iget-object v1, p0, Ll/k5h;->g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 7
    .line 8
    iget-object v2, p0, Ll/k5h;->f:Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;

    .line 9
    .line 10
    const/high16 v3, 0x430c0000    # 140.0f

    .line 11
    .line 12
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    invoke-direct {v0, v1, v2, v3}, Ll/qgh;-><init>(Landroid/view/View;Landroid/view/View;I)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/k5h;->j:Ll/qgh;

    .line 20
    .line 21
    iget-object p0, p0, Ll/k5h;->h:Landroid/app/Activity;

    .line 22
    .line 23
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ll/qgh;->e(Lcom/p1/mobile/android/app/Act;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final r(Landroid/graphics/Point;)Landroid/graphics/Point;
    .locals 2

    .line 1
    iget v0, p1, Landroid/graphics/Point;->x:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/k5h;->g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v0, v1}, Ll/ksg;->l0(II)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/k5h;->t()V

    .line 16
    .line 17
    .line 18
    iget p0, p0, Ll/k5h;->e:I

    .line 19
    .line 20
    iput p0, p1, Landroid/graphics/Point;->x:I

    .line 21
    .line 22
    return-object p1

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    iput p0, p1, Landroid/graphics/Point;->x:I

    .line 25
    .line 26
    return-object p1
.end method

.method public s(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k5h;->n(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final t()V
    .locals 2

    .line 1
    iget v0, p0, Ll/k5h;->a:I

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/k5h;->l()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    sub-int/2addr v0, v1

    .line 8
    const/high16 v1, 0x41a00000    # 20.0f

    .line 9
    .line 10
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    sub-int/2addr v0, v1

    .line 15
    iput v0, p0, Ll/k5h;->e:I

    .line 16
    .line 17
    iget-object v0, p0, Ll/k5h;->h:Landroid/app/Activity;

    .line 18
    .line 19
    invoke-static {v0}, Ll/bnl0;->x0(Landroid/content/Context;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object v1, p0, Ll/k5h;->g:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    .line 24
    .line 25
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    sub-int/2addr v0, v1

    .line 30
    iget-object v1, p0, Ll/k5h;->h:Landroid/app/Activity;

    .line 31
    .line 32
    invoke-static {v1}, Ll/bnl0;->I(Landroid/content/Context;)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    sub-int/2addr v0, v1

    .line 37
    iput v0, p0, Ll/k5h;->d:I

    .line 38
    .line 39
    return-void
.end method

.method public final u(Landroid/app/Activity;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/k5h;->p(Landroid/app/Activity;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Ll/k5h;->f:Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object p0, p0, Ll/k5h;->f:Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->B(Landroid/app/Activity;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    return-void
.end method

.method public final v(Landroid/app/Activity;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/k5h;->p(Landroid/app/Activity;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Ll/k5h;->f:Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Ll/k5h;->f:Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;

    .line 17
    .line 18
    sget-object v1, Ll/k5h;->k:Landroid/graphics/Point;

    .line 19
    .line 20
    invoke-virtual {p0, v1}, Ll/k5h;->r(Landroid/graphics/Point;)Landroid/graphics/Point;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p1, p0}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->G(Landroid/app/Activity;Landroid/graphics/Point;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-void
.end method
