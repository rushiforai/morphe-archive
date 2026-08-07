.class public Lcom/p1/mobile/putong/core/view/MaximumScroll;
.super Lv/VScroll;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/view/MaximumScroll$b;
    }
.end annotation


# instance fields
.field public e:I

.field public f:I

.field public g:Landroid/view/GestureDetector;

.field public h:I

.field public i:Lcom/p1/mobile/putong/core/view/MaximumScroll$b;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 36
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/view/MaximumScroll;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 35
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/view/MaximumScroll;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VScroll;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p3, -0x1

    .line 5
    iput p3, p0, Lcom/p1/mobile/putong/core/view/MaximumScroll;->e:I

    .line 6
    .line 7
    iput p3, p0, Lcom/p1/mobile/putong/core/view/MaximumScroll;->f:I

    .line 8
    .line 9
    sget-object v0, Ll/khc0;->R0:[I

    .line 10
    .line 11
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    sget p2, Ll/khc0;->T0:I

    .line 16
    .line 17
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    iput p2, p0, Lcom/p1/mobile/putong/core/view/MaximumScroll;->f:I

    .line 22
    .line 23
    sget p2, Ll/khc0;->S0:I

    .line 24
    .line 25
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    iput p2, p0, Lcom/p1/mobile/putong/core/view/MaximumScroll;->e:I

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 32
    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public final e()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/MaximumScroll;->g:Landroid/view/GestureDetector;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/view/GestureDetector;

    .line 6
    .line 7
    new-instance v1, Lcom/p1/mobile/putong/core/view/MaximumScroll$a;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/view/MaximumScroll$a;-><init>(Lcom/p1/mobile/putong/core/view/MaximumScroll;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v0, v1}, Landroid/view/GestureDetector;-><init>(Landroid/view/GestureDetector$OnGestureListener;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/MaximumScroll;->g:Landroid/view/GestureDetector;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    sub-int/2addr p5, p3

    .line 5
    iget p1, p0, Lcom/p1/mobile/putong/core/view/MaximumScroll;->h:I

    .line 6
    .line 7
    if-eq p1, p5, :cond_0

    .line 8
    .line 9
    iput p5, p0, Lcom/p1/mobile/putong/core/view/MaximumScroll;->h:I

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/MaximumScroll;->i:Lcom/p1/mobile/putong/core/view/MaximumScroll$b;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/MaximumScroll;->i:Lcom/p1/mobile/putong/core/view/MaximumScroll$b;

    .line 20
    .line 21
    iget p0, p0, Lcom/p1/mobile/putong/core/view/MaximumScroll;->h:I

    .line 22
    .line 23
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/view/MaximumScroll$b;->a(I)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/view/MaximumScroll;->f:I

    .line 2
    .line 3
    const/high16 v1, -0x80000000

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/view/MaximumScroll;->e:I

    .line 12
    .line 13
    if-lez v0, :cond_1

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/MaximumScroll;->e()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/MaximumScroll;->g:Landroid/view/GestureDetector;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 7
    .line 8
    .line 9
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public setOnHeightChangeListener(Lcom/p1/mobile/putong/core/view/MaximumScroll$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/MaximumScroll;->i:Lcom/p1/mobile/putong/core/view/MaximumScroll$b;

    .line 2
    .line 3
    return-void
.end method
