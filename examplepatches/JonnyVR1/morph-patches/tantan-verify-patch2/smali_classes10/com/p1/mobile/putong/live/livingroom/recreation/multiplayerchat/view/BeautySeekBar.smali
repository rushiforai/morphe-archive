.class public Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$Style;,
        Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$c;,
        Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;,
        Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;,
        Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$d;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;

.field public b:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 51
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 50
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    sget-object p3, Ll/vhc0;->J:[I

    .line 5
    .line 6
    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$Style;->values()[Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$Style;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    sget p3, Ll/vhc0;->Q:I

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p1, p3, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 18
    .line 19
    .line 20
    move-result p3

    .line 21
    aget-object p2, p2, p3

    .line 22
    .line 23
    sget-object p3, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$Style;->NORMAL:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$Style;

    .line 24
    .line 25
    if-ne p2, p3, :cond_0

    .line 26
    .line 27
    new-instance p2, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$c;

    .line 28
    .line 29
    invoke-direct {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$c;-><init>(Landroid/content/res/TypedArray;)V

    .line 30
    .line 31
    .line 32
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    sget-object p3, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$Style;->CENTER:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$Style;

    .line 36
    .line 37
    if-ne p2, p3, :cond_1

    .line 38
    .line 39
    new-instance p2, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;

    .line 40
    .line 41
    invoke-direct {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;-><init>(Landroid/content/res/TypedArray;)V

    .line 42
    .line 43
    .line 44
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;

    .line 45
    .line 46
    :cond_1
    :goto_0
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 47
    .line 48
    .line 49
    return-void
.end method


# virtual methods
.method public final a(FI)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, p1, v0

    .line 3
    .line 4
    if-gez v1, :cond_0

    .line 5
    .line 6
    move p1, v0

    .line 7
    :cond_0
    int-to-float v0, p2

    .line 8
    cmpl-float v1, p1, v0

    .line 9
    .line 10
    if-lez v1, :cond_1

    .line 11
    .line 12
    move p1, v0

    .line 13
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->d()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;

    .line 20
    .line 21
    invoke-virtual {v1, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->j(FI)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->d()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eq v0, p1, :cond_2

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 33
    .line 34
    .line 35
    :cond_2
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v4

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v5

    .line 11
    const/4 v2, 0x0

    .line 12
    const/4 v3, 0x0

    .line 13
    move-object v1, p1

    .line 14
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->a(Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;Landroid/graphics/Canvas;IIII)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroid/view/ViewGroup;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 12
    .line 13
    .line 14
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onMeasure(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->c()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    add-int/2addr v0, v1

    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    add-int/2addr v0, v1

    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-static {v0, p2, v1}, Landroid/view/View;->resolveSizeAndState(III)I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    if-eq v0, v1, :cond_1

    .line 9
    .line 10
    const/4 v2, 0x2

    .line 11
    if-eq v0, v2, :cond_0

    .line 12
    .line 13
    const/4 p1, 0x3

    .line 14
    if-eq v0, p1, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar;->a(FI)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;

    .line 30
    .line 31
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar;->b:Z

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->i(Z)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;

    .line 41
    .line 42
    iget-boolean v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar;->b:Z

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->i(Z)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar;->a(FI)V

    .line 56
    .line 57
    .line 58
    :goto_0
    return v1
.end method

.method public setDrawText(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar;->b:Z

    .line 2
    .line 3
    return-void
.end method

.method public setOnSeekBarChangeListener(Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$d;)V
    .locals 0

    return-void
.end method

.method public setProgress(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->k(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
