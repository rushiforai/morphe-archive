.class public Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;
.super Lv/VFrame;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView$a;
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/graphics/Point;

.field public c:Landroid/graphics/Point;

.field public d:Landroid/graphics/Point;

.field public e:F

.field public f:F

.field public final g:I

.field public h:Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView$a;

.field public i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/p4h;",
            ">;"
        }
    .end annotation
.end field

.field public j:F

.field public k:F

.field public l:I

.field public m:Z

.field public n:Ll/x20;

.field public o:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Landroid/graphics/Point;",
            ">;"
        }
    .end annotation
.end field

.field public p:Ll/x20;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 33
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    new-instance p1, Landroid/graphics/Point;

    const/4 p2, 0x0

    invoke-direct {p1, p2, p2}, Landroid/graphics/Point;-><init>(II)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->b:Landroid/graphics/Point;

    const/high16 p1, -0x40800000    # -1.0f

    .line 35
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->e:F

    .line 36
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->f:F

    .line 37
    sget p1, Ll/hdc0;->N1:I

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->g:I

    .line 38
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->i:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 39
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 40
    new-instance p1, Landroid/graphics/Point;

    const/4 p2, 0x0

    invoke-direct {p1, p2, p2}, Landroid/graphics/Point;-><init>(II)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->b:Landroid/graphics/Point;

    const/high16 p1, -0x40800000    # -1.0f

    .line 41
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->e:F

    .line 42
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->f:F

    .line 43
    sget p1, Ll/hdc0;->N1:I

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->g:I

    .line 44
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->i:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Point;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1, v1}, Landroid/graphics/Point;-><init>(II)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->b:Landroid/graphics/Point;

    .line 11
    .line 12
    const/high16 v0, -0x40800000    # -1.0f

    .line 13
    .line 14
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->e:F

    .line 15
    .line 16
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->f:F

    .line 17
    .line 18
    sget v0, Ll/hdc0;->N1:I

    .line 19
    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->g:I

    .line 21
    .line 22
    new-instance v0, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->i:Ljava/util/List;

    .line 28
    .line 29
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->p(Landroid/content/Context;Landroid/view/View;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public B(Landroid/app/Activity;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->g:I

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 v0, 0x4

    .line 19
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Landroid/view/ViewGroup;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->u()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public C(Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView$a;)Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->h:Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public E(Ll/y20;)Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Landroid/graphics/Point;",
            ">;)",
            "Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->o:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public F(Ll/x20;)Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->p:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public G(Landroid/app/Activity;Landroid/graphics/Point;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->w(Landroid/graphics/Point;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->g:I

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-eqz p2, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->g:I

    .line 26
    .line 27
    invoke-virtual {p0, p2}, Landroid/view/View;->setId(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-eqz p2, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    check-cast p2, Landroid/view/ViewGroup;

    .line 45
    .line 46
    invoke-virtual {p2, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    instance-of p2, p1, Landroid/widget/FrameLayout;

    .line 50
    .line 51
    if-eqz p2, :cond_2

    .line 52
    .line 53
    check-cast p1, Landroid/widget/FrameLayout;

    .line 54
    .line 55
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 56
    .line 57
    const/4 v0, -0x1

    .line 58
    invoke-direct {p2, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 62
    .line 63
    .line 64
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->b:Landroid/graphics/Point;

    .line 65
    .line 66
    iget p2, p2, Landroid/graphics/Point;->x:I

    .line 67
    .line 68
    int-to-float p2, p2

    .line 69
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->setX(F)V

    .line 70
    .line 71
    .line 72
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->b:Landroid/graphics/Point;

    .line 73
    .line 74
    iget p2, p2, Landroid/graphics/Point;->y:I

    .line 75
    .line 76
    int-to-float p2, p2

    .line 77
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->setY(F)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->u()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 84
    .line 85
    .line 86
    const/4 p1, 0x0

    .line 87
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 88
    .line 89
    .line 90
    :cond_2
    :goto_0
    return-void
.end method

.method public K()Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->i:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/o4h;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/o4h;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->z(Landroid/view/MotionEvent;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->m:Z

    .line 13
    .line 14
    :goto_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->m:Z

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->n:Ll/x20;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->n:Ll/x20;

    .line 27
    .line 28
    invoke-interface {v0}, Ll/x20;->call()V

    .line 29
    .line 30
    .line 31
    :cond_1
    invoke-super {p0, p1}, Lv/VFrame;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0
.end method

.method public getAttachView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->a:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->m:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_3

    .line 12
    .line 13
    const/4 v1, 0x2

    .line 14
    if-eq v0, v1, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->j:F

    .line 22
    .line 23
    sub-float/2addr v0, v1

    .line 24
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->l:I

    .line 29
    .line 30
    int-to-float v1, v1

    .line 31
    cmpl-float v0, v0, v1

    .line 32
    .line 33
    if-gtz v0, :cond_2

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->k:F

    .line 40
    .line 41
    sub-float/2addr v0, v1

    .line 42
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->l:I

    .line 47
    .line 48
    int-to-float v1, v1

    .line 49
    cmpl-float v0, v0, v1

    .line 50
    .line 51
    if-lez v0, :cond_4

    .line 52
    .line 53
    :cond_2
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->j:F

    .line 54
    .line 55
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->e:F

    .line 56
    .line 57
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->k:F

    .line 58
    .line 59
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->f:F

    .line 60
    .line 61
    const/4 p0, 0x1

    .line 62
    return p0

    .line 63
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->j:F

    .line 68
    .line 69
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->k:F

    .line 74
    .line 75
    :cond_4
    :goto_0
    invoke-super {p0, p1}, Lv/VFrame;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    return p0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->m:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-eqz v0, :cond_4

    .line 13
    .line 14
    if-eq v0, v1, :cond_3

    .line 15
    .line 16
    const/4 v2, 0x2

    .line 17
    if-eq v0, v2, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->p:Ll/x20;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->p:Ll/x20;

    .line 29
    .line 30
    invoke-interface {v0}, Ll/x20;->call()V

    .line 31
    .line 32
    .line 33
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->c:Landroid/graphics/Point;

    .line 34
    .line 35
    iget v2, v0, Landroid/graphics/Point;->x:I

    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->e:F

    .line 42
    .line 43
    sub-float/2addr v3, v4

    .line 44
    float-to-int v3, v3

    .line 45
    add-int/2addr v2, v3

    .line 46
    iput v2, v0, Landroid/graphics/Point;->x:I

    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->c:Landroid/graphics/Point;

    .line 49
    .line 50
    iget v2, v0, Landroid/graphics/Point;->y:I

    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->f:F

    .line 57
    .line 58
    sub-float/2addr v3, v4

    .line 59
    float-to-int v3, v3

    .line 60
    add-int/2addr v2, v3

    .line 61
    iput v2, v0, Landroid/graphics/Point;->y:I

    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->c:Landroid/graphics/Point;

    .line 64
    .line 65
    iget v0, v0, Landroid/graphics/Point;->x:I

    .line 66
    .line 67
    int-to-float v0, v0

    .line 68
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->setX(F)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->c:Landroid/graphics/Point;

    .line 72
    .line 73
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 74
    .line 75
    int-to-float v0, v0

    .line 76
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->setY(F)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->e:F

    .line 84
    .line 85
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->f:F

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_3
    const/4 v0, 0x0

    .line 93
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->e:F

    .line 94
    .line 95
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->f:F

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->e:F

    .line 103
    .line 104
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->f:F

    .line 109
    .line 110
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->v(Landroid/view/MotionEvent;)V

    .line 111
    .line 112
    .line 113
    return v1
.end method

.method public p(Landroid/content/Context;Landroid/view/View;)V
    .locals 1

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->l:I

    .line 12
    .line 13
    new-instance p1, Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    const/4 v0, -0x2

    .line 16
    invoke-direct {p1, v0, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    .line 21
    .line 22
    new-instance p1, Landroid/graphics/Point;

    .line 23
    .line 24
    invoke-direct {p1}, Landroid/graphics/Point;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->d:Landroid/graphics/Point;

    .line 28
    .line 29
    return-void
.end method

.method public final s(Landroid/graphics/Point;)Landroid/graphics/Point;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->h:Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView$a;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->h:Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView$a;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView$a;->a(Landroid/graphics/Point;)Landroid/graphics/Point;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    return-object p1
.end method

.method public setX(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->c:Landroid/graphics/Point;

    .line 2
    .line 3
    float-to-int p1, p1

    .line 4
    iput p1, v0, Landroid/graphics/Point;->x:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->s(Landroid/graphics/Point;)Landroid/graphics/Point;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->a:Landroid/view/View;

    .line 11
    .line 12
    iget v1, p1, Landroid/graphics/Point;->x:I

    .line 13
    .line 14
    int-to-float v1, v1

    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setX(F)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->d:Landroid/graphics/Point;

    .line 19
    .line 20
    iget p1, p1, Landroid/graphics/Point;->x:I

    .line 21
    .line 22
    iput p1, v0, Landroid/graphics/Point;->x:I

    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->o:Ll/y20;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->o:Ll/y20;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->d:Landroid/graphics/Point;

    .line 35
    .line 36
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public setY(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->c:Landroid/graphics/Point;

    .line 2
    .line 3
    float-to-int p1, p1

    .line 4
    iput p1, v0, Landroid/graphics/Point;->y:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->s(Landroid/graphics/Point;)Landroid/graphics/Point;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->a:Landroid/view/View;

    .line 11
    .line 12
    iget v1, p1, Landroid/graphics/Point;->y:I

    .line 13
    .line 14
    int-to-float v1, v1

    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setY(F)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->d:Landroid/graphics/Point;

    .line 19
    .line 20
    iget p1, p1, Landroid/graphics/Point;->y:I

    .line 21
    .line 22
    iput p1, v0, Landroid/graphics/Point;->y:I

    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->o:Ll/y20;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->o:Ll/y20;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->d:Landroid/graphics/Point;

    .line 35
    .line 36
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public final u()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Point;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->c:Landroid/graphics/Point;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->b:Landroid/graphics/Point;

    .line 9
    .line 10
    iget v1, p0, Landroid/graphics/Point;->x:I

    .line 11
    .line 12
    iput v1, v0, Landroid/graphics/Point;->x:I

    .line 13
    .line 14
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 15
    .line 16
    iput p0, v0, Landroid/graphics/Point;->y:I

    .line 17
    .line 18
    return-void
.end method

.method public final v(Landroid/view/MotionEvent;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->i:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/p4h;

    .line 18
    .line 19
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->c:Landroid/graphics/Point;

    .line 26
    .line 27
    invoke-interface {v1, p1, v2, p0}, Ll/p4h;->a(Landroid/view/MotionEvent;Landroid/graphics/Point;Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    return-void
.end method

.method public final w(Landroid/graphics/Point;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->b:Landroid/graphics/Point;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->u()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final z(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->a:Landroid/view/View;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getX()F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    float-to-int v0, v0

    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->a:Landroid/view/View;

    .line 18
    .line 19
    invoke-virtual {v2}, Landroid/view/View;->getY()F

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    float-to-int v2, v2

    .line 24
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->a:Landroid/view/View;

    .line 25
    .line 26
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    add-int/2addr v3, v0

    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->a:Landroid/view/View;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    add-int/2addr p0, v2

    .line 38
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    int-to-float v0, v0

    .line 43
    cmpl-float v0, v4, v0

    .line 44
    .line 45
    if-ltz v0, :cond_0

    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    int-to-float v3, v3

    .line 52
    cmpg-float v0, v0, v3

    .line 53
    .line 54
    if-gtz v0, :cond_0

    .line 55
    .line 56
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    int-to-float v2, v2

    .line 61
    cmpl-float v0, v0, v2

    .line 62
    .line 63
    if-ltz v0, :cond_0

    .line 64
    .line 65
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    int-to-float p0, p0

    .line 70
    cmpg-float p0, p1, p0

    .line 71
    .line 72
    if-gtz p0, :cond_0

    .line 73
    .line 74
    const/4 p0, 0x1

    .line 75
    return p0

    .line 76
    :cond_0
    return v1
.end method
