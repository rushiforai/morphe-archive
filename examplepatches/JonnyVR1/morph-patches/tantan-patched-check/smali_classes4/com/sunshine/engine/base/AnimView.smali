.class public abstract Lcom/sunshine/engine/base/AnimView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/sunshine/engine/base/s;",
        ">",
        "Landroid/view/View;"
    }
.end annotation


# instance fields
.field protected a:Lcom/sunshine/engine/base/s;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private b:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/sunshine/engine/base/AnimView;->a()Lcom/sunshine/engine/base/s;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/sunshine/engine/base/AnimView;->a:Lcom/sunshine/engine/base/s;

    .line 9
    .line 10
    const-wide/16 v0, -0x1

    .line 11
    .line 12
    iput-wide v0, p0, Lcom/sunshine/engine/base/AnimView;->b:J

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    invoke-virtual {p0}, Lcom/sunshine/engine/base/AnimView;->a()Lcom/sunshine/engine/base/s;

    move-result-object p1

    iput-object p1, p0, Lcom/sunshine/engine/base/AnimView;->a:Lcom/sunshine/engine/base/s;

    const-wide/16 p1, -0x1

    .line 17
    iput-wide p1, p0, Lcom/sunshine/engine/base/AnimView;->b:J

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 19
    invoke-virtual {p0}, Lcom/sunshine/engine/base/AnimView;->a()Lcom/sunshine/engine/base/s;

    move-result-object p1

    iput-object p1, p0, Lcom/sunshine/engine/base/AnimView;->a:Lcom/sunshine/engine/base/s;

    const-wide/16 p1, -0x1

    .line 20
    iput-wide p1, p0, Lcom/sunshine/engine/base/AnimView;->b:J

    return-void
.end method


# virtual methods
.method public abstract a()Lcom/sunshine/engine/base/s;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method public b(Z)Lcom/sunshine/engine/base/AnimView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/sunshine/engine/base/AnimView;->a:Lcom/sunshine/engine/base/s;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput-boolean p1, v0, Lcom/sunshine/engine/base/a;->r:Z

    .line 8
    .line 9
    :cond_0
    return-object p0
.end method

.method public abstract c(II)V
.end method

.method public varargs d([Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/sunshine/engine/base/AnimView;->a:Lcom/sunshine/engine/base/s;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1}, Lcom/sunshine/engine/base/s;->n(Landroid/view/View;[Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public e()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sunshine/engine/base/AnimView;->a:Lcom/sunshine/engine/base/s;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/sunshine/engine/base/s;->e()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/sunshine/engine/base/AnimView;->a:Lcom/sunshine/engine/base/s;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/sunshine/engine/base/s;->i(Landroid/graphics/Canvas;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 2

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/sunshine/engine/base/AnimView;->a:Lcom/sunshine/engine/base/s;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    sub-int/2addr p4, p2

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    sub-int/2addr p4, p2

    .line 20
    sub-int/2addr p5, p3

    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    sub-int/2addr p5, p0

    .line 26
    invoke-virtual {p1, v0, v1, p4, p5}, Lcom/sunshine/engine/base/s;->p(IIII)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/sunshine/engine/base/AnimView;->a:Lcom/sunshine/engine/base/s;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, v0, Lcom/sunshine/engine/base/a;->x:Ljava/util/Map;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-lez v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-static {}, Ll/a2j0;->h()J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    iput-wide v0, p0, Lcom/sunshine/engine/base/AnimView;->b:J

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const/4 v1, 0x1

    .line 33
    if-ne v0, v1, :cond_1

    .line 34
    .line 35
    invoke-static {}, Ll/a2j0;->h()J

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    iget-wide v2, p0, Lcom/sunshine/engine/base/AnimView;->b:J

    .line 40
    .line 41
    sub-long/2addr v0, v2

    .line 42
    const-wide/16 v2, 0xc8

    .line 43
    .line 44
    cmp-long v0, v0, v2

    .line 45
    .line 46
    if-gez v0, :cond_1

    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    float-to-int v0, v0

    .line 53
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    float-to-int v1, v1

    .line 58
    invoke-virtual {p0, v0, v1}, Lcom/sunshine/engine/base/AnimView;->c(II)V

    .line 59
    .line 60
    .line 61
    :cond_1
    :goto_0
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    return p0
.end method

.method public setOnError(Ll/bdj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bdj<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/sunshine/engine/base/AnimView;->a:Lcom/sunshine/engine/base/s;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/sunshine/engine/base/s;->q(Ll/bdj;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
