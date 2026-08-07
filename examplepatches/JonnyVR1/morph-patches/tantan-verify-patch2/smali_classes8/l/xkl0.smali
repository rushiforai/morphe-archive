.class public Ll/xkl0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:Landroid/view/VelocityTracker;

.field public final d:I

.field public e:Landroid/view/MotionEvent;

.field public f:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x320

    .line 5
    .line 6
    iput v0, p0, Ll/xkl0;->d:I

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Ll/xkl0;->f:Z

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/xkl0;->d(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(Landroid/view/MotionEvent;)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/xkl0;->e:Landroid/view/MotionEvent;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    iput-object p1, p0, Ll/xkl0;->e:Landroid/view/MotionEvent;

    .line 10
    .line 11
    :cond_0
    iget-boolean p1, p0, Ll/xkl0;->f:Z

    .line 12
    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/xkl0;->b(Landroid/view/MotionEvent;)[F

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const/4 v1, 0x0

    .line 20
    aget v1, p1, v1

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    aget p1, p1, v2

    .line 24
    .line 25
    invoke-virtual {v0, v1, p1}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-object p0, p0, Ll/xkl0;->c:Landroid/view/VelocityTracker;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public b(Landroid/view/MotionEvent;)[F
    .locals 5

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    iget-object v1, p0, Ll/xkl0;->e:Landroid/view/MotionEvent;

    .line 5
    .line 6
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iget-object v2, p0, Ll/xkl0;->e:Landroid/view/MotionEvent;

    .line 17
    .line 18
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getRawX()F

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    sub-float/2addr v1, v2

    .line 23
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    iget-object v3, p0, Ll/xkl0;->e:Landroid/view/MotionEvent;

    .line 28
    .line 29
    invoke-virtual {v3}, Landroid/view/MotionEvent;->getRawY()F

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    sub-float/2addr v2, v3

    .line 34
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    iget-object v4, p0, Ll/xkl0;->e:Landroid/view/MotionEvent;

    .line 39
    .line 40
    invoke-virtual {v4}, Landroid/view/MotionEvent;->getX()F

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    sub-float/2addr v3, v4

    .line 45
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    iget-object p0, p0, Ll/xkl0;->e:Landroid/view/MotionEvent;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getY()F

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    sub-float/2addr p1, p0

    .line 56
    const/4 p0, 0x0

    .line 57
    sub-float/2addr v1, v3

    .line 58
    aput v1, v0, p0

    .line 59
    .line 60
    const/4 p0, 0x1

    .line 61
    sub-float/2addr v2, p1

    .line 62
    aput v2, v0, p0

    .line 63
    .line 64
    :cond_0
    return-object v0
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xkl0;->c:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Ll/xkl0;->e:Landroid/view/MotionEvent;

    .line 8
    .line 9
    return-void
.end method

.method public final d(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Ll/xkl0;->a:I

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iput p1, p0, Ll/xkl0;->b:I

    .line 16
    .line 17
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Ll/xkl0;->c:Landroid/view/VelocityTracker;

    .line 22
    .line 23
    return-void
.end method

.method public e()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xkl0;->c:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    iget v1, p0, Ll/xkl0;->b:I

    .line 4
    .line 5
    int-to-float v1, v1

    .line 6
    const/16 v2, 0x3e8

    .line 7
    .line 8
    invoke-virtual {v0, v2, v1}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/xkl0;->c:Landroid/view/VelocityTracker;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/VelocityTracker;->getYVelocity()F

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const/high16 v0, 0x44480000    # 800.0f

    .line 18
    .line 19
    cmpl-float p0, p0, v0

    .line 20
    .line 21
    if-ltz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method
