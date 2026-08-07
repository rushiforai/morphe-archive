.class public Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;
.super Landroid/view/ViewGroup;
.source "SourceFile"


# static fields
.field public static c:Ljava/lang/String; = "BifrostLayout"

.field public static d:Z

.field public static e:Z


# instance fields
.field public a:Ll/px2;

.field public b:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->b:Z

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->u()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->b:Z

    .line 13
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->u()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->b:Z

    .line 16
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->u()V

    return-void
.end method

.method private getDefaultAddParam()Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .line 1
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    invoke-direct {p0, v0, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method private u()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setChildrenDrawingOrderEnabled(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->a:Ll/px2;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/ox2;->o(Landroid/graphics/Canvas;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->a:Ll/px2;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Ll/ox2;->Z(Landroid/view/ViewGroup;Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public getChildDrawingOrder(II)I
    .locals 0

    sub-int/2addr p1, p2

    add-int/lit8 p1, p1, -0x1

    return p1
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->a:Ll/px2;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/ox2;->s()Ll/kj2;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->a:Ll/px2;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/ox2;->s()Ll/kj2;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    invoke-interface {v0, p1, v1, p0}, Ll/kj2;->b(Landroid/graphics/Canvas;II)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->a:Ll/px2;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Ll/ox2;->a0(Landroid/view/ViewGroup;Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->a:Ll/px2;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual/range {p0 .. p5}, Ll/ox2;->b0(ZIIII)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->a:Ll/px2;

    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/ox2;->c0(II)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->a:Ll/px2;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/ox2;->e0(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public requestDisallowInterceptTouchEvent(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public s(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->getDefaultAddParam()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, -0x1

    .line 7
    invoke-virtual {p0, p1, v2, v0, v1}, Landroid/view/ViewGroup;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setRenderManager(Ll/px2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->a:Ll/px2;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ll/ox2;->j0(Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->a:Ll/px2;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ox2;->d()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public t(Landroid/view/View;I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->getDefaultAddParam()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {p0, p1, p2, v0, v1}, Landroid/view/ViewGroup;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public v(Z)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public w()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->a:Ll/px2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mx2;->z0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public z(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->a:Ll/px2;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ox2;->q0(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
