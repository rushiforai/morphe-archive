.class public Lcom/p1/mobile/putong/core/ui/map/TouchProxyForMap;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/Matrix;

.field public b:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/Matrix;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/map/TouchProxyForMap;->a:Landroid/graphics/Matrix;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/map/TouchProxyForMap;->b:Z

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/map/TouchProxyForMap;->a:Landroid/graphics/Matrix;

    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/map/TouchProxyForMap;->b:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 19
    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/map/TouchProxyForMap;->a:Landroid/graphics/Matrix;

    const/4 p1, 0x0

    .line 20
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/map/TouchProxyForMap;->b:Z

    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/core/ui/map/MapAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/map/MapAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public b(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/map/TouchProxyForMap;->a:Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/map/TouchProxyForMap;->a:Landroid/graphics/Matrix;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    div-int/lit8 v1, v1, 0x2

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/map/TouchProxyForMap;->a()Lcom/p1/mobile/putong/core/ui/map/MapAct;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/map/MapAct;->e:Ll/sww;

    .line 19
    .line 20
    iget-object v2, v2, Ll/sww;->h:Lcom/baidu/mapapi/map/MapView;

    .line 21
    .line 22
    invoke-virtual {v2}, Lcom/baidu/mapapi/map/MapView;->getTop()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    sub-int/2addr v1, v2

    .line 27
    int-to-float v1, v1

    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-virtual {v0, v2, v1}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/map/TouchProxyForMap;->a:Landroid/graphics/Matrix;

    .line 33
    .line 34
    invoke-virtual {p1, p0}, Landroid/view/MotionEvent;->transform(Landroid/graphics/Matrix;)V

    .line 35
    .line 36
    .line 37
    return-object p1
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    const/4 v1, 0x3

    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    const/4 v1, 0x4

    .line 14
    if-eq v0, v1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/map/TouchProxyForMap;->b:Z

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/map/TouchProxyForMap;->b:Z

    .line 22
    .line 23
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/map/TouchProxyForMap;->a()Lcom/p1/mobile/putong/core/ui/map/MapAct;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/map/MapAct;->e:Ll/sww;

    .line 28
    .line 29
    iget-object v0, v0, Ll/sww;->h:Lcom/baidu/mapapi/map/MapView;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/map/TouchProxyForMap;->b(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Lcom/baidu/mapapi/map/MapView;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/map/TouchProxyForMap;->a()Lcom/p1/mobile/putong/core/ui/map/MapAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/map/MapAct;->e:Ll/sww;

    .line 6
    .line 7
    iget-object v0, v0, Ll/sww;->h:Lcom/baidu/mapapi/map/MapView;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/map/TouchProxyForMap;->b(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0}, Lcom/baidu/mapapi/map/MapView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public onMeasure(II)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    check-cast p2, Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Ll/cac0;->b:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    sub-int/2addr p2, v0

    .line 22
    invoke-static {p2}, Ll/dox;->b(I)I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/map/TouchProxyForMap;->a()Lcom/p1/mobile/putong/core/ui/map/MapAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/map/MapAct;->e:Ll/sww;

    .line 6
    .line 7
    iget-object v0, v0, Ll/sww;->h:Lcom/baidu/mapapi/map/MapView;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/map/TouchProxyForMap;->b(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0}, Lcom/baidu/mapapi/map/MapView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method
