.class public Ll/kmj;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/kmj$c;,
        Ll/kmj$a;,
        Ll/kmj$b;,
        Ll/kmj$d;
    }
.end annotation


# static fields
.field public static final u:I

.field public static final v:I

.field public static final w:I


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public final f:Landroid/os/Handler;

.field public final g:Ll/kmj$c;

.field public h:Ll/kmj$b;

.field public i:Z

.field public j:Z

.field public k:Z

.field public l:Z

.field public m:Z

.field public n:Landroid/view/MotionEvent;

.field public o:Landroid/view/MotionEvent;

.field public p:Z

.field public q:F

.field public r:F

.field public s:Z

.field public t:Landroid/view/VelocityTracker;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sput v0, Ll/kmj;->u:I

    .line 6
    .line 7
    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    sput v0, Ll/kmj;->v:I

    .line 12
    .line 13
    invoke-static {}, Landroid/view/ViewConfiguration;->getDoubleTapTimeout()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    sput v0, Ll/kmj;->w:I

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/kmj$c;)V
    .locals 1

    const/4 v0, 0x0

    .line 36
    invoke-direct {p0, p1, p2, v0}, Ll/kmj;-><init>(Landroid/content/Context;Ll/kmj$c;Landroid/os/Handler;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/kmj$c;Landroid/os/Handler;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p3, :cond_0

    .line 5
    .line 6
    new-instance v0, Ll/kmj$a;

    .line 7
    .line 8
    invoke-direct {v0, p0, p3}, Ll/kmj$a;-><init>(Ll/kmj;Landroid/os/Handler;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/kmj;->f:Landroid/os/Handler;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    new-instance p3, Ll/kmj$a;

    .line 15
    .line 16
    invoke-direct {p3, p0}, Ll/kmj$a;-><init>(Ll/kmj;)V

    .line 17
    .line 18
    .line 19
    iput-object p3, p0, Ll/kmj;->f:Landroid/os/Handler;

    .line 20
    .line 21
    :goto_0
    iput-object p2, p0, Ll/kmj;->g:Ll/kmj$c;

    .line 22
    .line 23
    instance-of p3, p2, Ll/kmj$b;

    .line 24
    .line 25
    if-eqz p3, :cond_1

    .line 26
    .line 27
    check-cast p2, Ll/kmj$b;

    .line 28
    .line 29
    invoke-virtual {p0, p2}, Ll/kmj;->n(Ll/kmj$b;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    invoke-virtual {p0, p1}, Ll/kmj;->j(Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static bridge synthetic a(Ll/kmj;)Landroid/view/MotionEvent;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kmj;->n:Landroid/view/MotionEvent;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/kmj;)Ll/kmj$b;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kmj;->h:Ll/kmj$b;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/kmj;)Ll/kmj$c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kmj;->g:Ll/kmj$c;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/kmj;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/kmj;->i:Z

    return p0
.end method

.method public static bridge synthetic e(Ll/kmj;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/kmj;->j:Z

    return-void
.end method

.method public static bridge synthetic f(Ll/kmj;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/kmj;->i()V

    return-void
.end method


# virtual methods
.method public final g()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kmj;->f:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/kmj;->f:Landroid/os/Handler;

    .line 8
    .line 9
    const/4 v1, 0x2

    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/kmj;->f:Landroid/os/Handler;

    .line 14
    .line 15
    const/4 v1, 0x3

    .line 16
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/kmj;->t:Landroid/view/VelocityTracker;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput-object v0, p0, Ll/kmj;->t:Landroid/view/VelocityTracker;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    iput-boolean v0, p0, Ll/kmj;->p:Z

    .line 29
    .line 30
    iput-boolean v0, p0, Ll/kmj;->i:Z

    .line 31
    .line 32
    iput-boolean v0, p0, Ll/kmj;->l:Z

    .line 33
    .line 34
    iput-boolean v0, p0, Ll/kmj;->m:Z

    .line 35
    .line 36
    iput-boolean v0, p0, Ll/kmj;->j:Z

    .line 37
    .line 38
    iget-boolean v1, p0, Ll/kmj;->k:Z

    .line 39
    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    iput-boolean v0, p0, Ll/kmj;->k:Z

    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public final h()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kmj;->f:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/kmj;->f:Landroid/os/Handler;

    .line 8
    .line 9
    const/4 v1, 0x2

    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/kmj;->f:Landroid/os/Handler;

    .line 14
    .line 15
    const/4 v1, 0x3

    .line 16
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Ll/kmj;->p:Z

    .line 21
    .line 22
    iput-boolean v0, p0, Ll/kmj;->l:Z

    .line 23
    .line 24
    iput-boolean v0, p0, Ll/kmj;->m:Z

    .line 25
    .line 26
    iput-boolean v0, p0, Ll/kmj;->j:Z

    .line 27
    .line 28
    iget-boolean v1, p0, Ll/kmj;->k:Z

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    iput-boolean v0, p0, Ll/kmj;->k:Z

    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final i()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kmj;->f:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/kmj;->j:Z

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Ll/kmj;->k:Z

    .line 12
    .line 13
    iget-object v0, p0, Ll/kmj;->g:Ll/kmj$c;

    .line 14
    .line 15
    iget-object p0, p0, Ll/kmj;->n:Landroid/view/MotionEvent;

    .line 16
    .line 17
    invoke-interface {v0, p0}, Ll/kmj$c;->onLongPress(Landroid/view/MotionEvent;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final j(Landroid/content/Context;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/kmj;->g:Ll/kmj$c;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/kmj;->s:Z

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    invoke-static {}, Landroid/view/ViewConfiguration;->getTouchSlop()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-static {}, Landroid/view/ViewConfiguration;->getTouchSlop()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-static {}, Landroid/view/ViewConfiguration;->getMinimumFlingVelocity()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    iput v1, p0, Ll/kmj;->d:I

    .line 23
    .line 24
    invoke-static {}, Landroid/view/ViewConfiguration;->getMaximumFlingVelocity()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    iput v1, p0, Ll/kmj;->e:I

    .line 29
    .line 30
    move v1, p1

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledDoubleTapSlop()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    iput v3, p0, Ll/kmj;->d:I

    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    iput p1, p0, Ll/kmj;->e:I

    .line 59
    .line 60
    move p1, v0

    .line 61
    move v0, v2

    .line 62
    :goto_0
    mul-int/2addr p1, p1

    .line 63
    int-to-double v2, p1

    .line 64
    const-wide v4, 0x3fb1eb851eb851ecL    # 0.07

    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    mul-double/2addr v2, v4

    .line 70
    double-to-int p1, v2

    .line 71
    iput p1, p0, Ll/kmj;->a:I

    .line 72
    .line 73
    mul-int/2addr v1, v1

    .line 74
    iput v1, p0, Ll/kmj;->b:I

    .line 75
    .line 76
    mul-int/2addr v0, v0

    .line 77
    iput v0, p0, Ll/kmj;->c:I

    .line 78
    .line 79
    return-void

    .line 80
    :cond_1
    const-string p0, "OnGestureListener must not be null"

    .line 81
    .line 82
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public final k(Landroid/view/MotionEvent;Landroid/view/MotionEvent;Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1
    iget-boolean v0, p0, Ll/kmj;->m:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getEventTime()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getEventTime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v4

    .line 15
    sub-long/2addr v2, v4

    .line 16
    sget p2, Ll/kmj;->w:I

    .line 17
    .line 18
    int-to-long v4, p2

    .line 19
    cmp-long p2, v2, v4

    .line 20
    .line 21
    if-gtz p2, :cond_2

    .line 22
    .line 23
    const-wide/16 v4, 0x28

    .line 24
    .line 25
    cmp-long p2, v2, v4

    .line 26
    .line 27
    if-gez p2, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    float-to-int p2, p2

    .line 35
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getX()F

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    float-to-int v0, v0

    .line 40
    sub-int/2addr p2, v0

    .line 41
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    float-to-int p1, p1

    .line 46
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    .line 47
    .line 48
    .line 49
    move-result p3

    .line 50
    float-to-int p3, p3

    .line 51
    sub-int/2addr p1, p3

    .line 52
    mul-int/2addr p2, p2

    .line 53
    mul-int/2addr p1, p1

    .line 54
    add-int/2addr p2, p1

    .line 55
    iget p0, p0, Ll/kmj;->c:I

    .line 56
    .line 57
    if-ge p2, p0, :cond_2

    .line 58
    .line 59
    const/4 p0, 0x1

    .line 60
    return p0

    .line 61
    :cond_2
    :goto_0
    return v1
.end method

.method public l(Landroid/view/MotionEvent;)Z
    .locals 12

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/kmj;->t:Landroid/view/VelocityTracker;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iput-object v1, p0, Ll/kmj;->t:Landroid/view/VelocityTracker;

    .line 14
    .line 15
    :cond_0
    iget-object v1, p0, Ll/kmj;->t:Landroid/view/VelocityTracker;

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getDownTime()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    .line 22
    .line 23
    .line 24
    move-result-wide v4

    .line 25
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 26
    .line 27
    .line 28
    move-result v6

    .line 29
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 30
    .line 31
    .line 32
    move-result v7

    .line 33
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 34
    .line 35
    .line 36
    move-result v8

    .line 37
    const/4 v9, 0x0

    .line 38
    invoke-static/range {v2 .. v9}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v1, v2}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 43
    .line 44
    .line 45
    and-int/lit16 v0, v0, 0xff

    .line 46
    .line 47
    const/4 v1, 0x6

    .line 48
    const/4 v2, 0x1

    .line 49
    const/4 v3, 0x0

    .line 50
    if-ne v0, v1, :cond_1

    .line 51
    .line 52
    move v4, v2

    .line 53
    goto :goto_0

    .line 54
    :cond_1
    move v4, v3

    .line 55
    :goto_0
    if-eqz v4, :cond_2

    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 58
    .line 59
    .line 60
    move-result v5

    .line 61
    goto :goto_1

    .line 62
    :cond_2
    const/4 v5, -0x1

    .line 63
    :goto_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 64
    .line 65
    .line 66
    move-result v6

    .line 67
    const/4 v7, 0x0

    .line 68
    move v8, v3

    .line 69
    move v9, v7

    .line 70
    move v10, v9

    .line 71
    :goto_2
    if-ge v8, v6, :cond_4

    .line 72
    .line 73
    if-ne v5, v8, :cond_3

    .line 74
    .line 75
    goto :goto_3

    .line 76
    :cond_3
    invoke-virtual {p1, v8}, Landroid/view/MotionEvent;->getX(I)F

    .line 77
    .line 78
    .line 79
    move-result v11

    .line 80
    add-float/2addr v9, v11

    .line 81
    invoke-virtual {p1, v8}, Landroid/view/MotionEvent;->getY(I)F

    .line 82
    .line 83
    .line 84
    move-result v11

    .line 85
    add-float/2addr v10, v11

    .line 86
    :goto_3
    add-int/lit8 v8, v8, 0x1

    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_4
    if-eqz v4, :cond_5

    .line 90
    .line 91
    add-int/lit8 v4, v6, -0x1

    .line 92
    .line 93
    goto :goto_4

    .line 94
    :cond_5
    move v4, v6

    .line 95
    :goto_4
    int-to-float v4, v4

    .line 96
    div-float/2addr v9, v4

    .line 97
    div-float/2addr v10, v4

    .line 98
    const/4 v4, 0x2

    .line 99
    const/4 v5, 0x3

    .line 100
    if-eqz v0, :cond_1c

    .line 101
    .line 102
    const/16 v8, 0x3e8

    .line 103
    .line 104
    if-eq v0, v2, :cond_13

    .line 105
    .line 106
    if-eq v0, v4, :cond_b

    .line 107
    .line 108
    if-eq v0, v5, :cond_a

    .line 109
    .line 110
    const/4 v2, 0x5

    .line 111
    if-eq v0, v2, :cond_9

    .line 112
    .line 113
    if-eq v0, v1, :cond_6

    .line 114
    .line 115
    goto :goto_7

    .line 116
    :cond_6
    iput v9, p0, Ll/kmj;->q:F

    .line 117
    .line 118
    iput v10, p0, Ll/kmj;->r:F

    .line 119
    .line 120
    iget-object v0, p0, Ll/kmj;->t:Landroid/view/VelocityTracker;

    .line 121
    .line 122
    iget v1, p0, Ll/kmj;->e:I

    .line 123
    .line 124
    int-to-float v1, v1

    .line 125
    invoke-virtual {v0, v8, v1}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    iget-object v2, p0, Ll/kmj;->t:Landroid/view/VelocityTracker;

    .line 137
    .line 138
    invoke-virtual {v2, v1}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    .line 139
    .line 140
    .line 141
    move-result v2

    .line 142
    iget-object v4, p0, Ll/kmj;->t:Landroid/view/VelocityTracker;

    .line 143
    .line 144
    invoke-virtual {v4, v1}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    move v4, v3

    .line 149
    :goto_5
    if-ge v4, v6, :cond_c

    .line 150
    .line 151
    if-ne v4, v0, :cond_7

    .line 152
    .line 153
    goto :goto_6

    .line 154
    :cond_7
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 155
    .line 156
    .line 157
    move-result v5

    .line 158
    iget-object v8, p0, Ll/kmj;->t:Landroid/view/VelocityTracker;

    .line 159
    .line 160
    invoke-virtual {v8, v5}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    .line 161
    .line 162
    .line 163
    move-result v8

    .line 164
    mul-float/2addr v8, v2

    .line 165
    iget-object v9, p0, Ll/kmj;->t:Landroid/view/VelocityTracker;

    .line 166
    .line 167
    invoke-virtual {v9, v5}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    .line 168
    .line 169
    .line 170
    move-result v5

    .line 171
    mul-float/2addr v5, v1

    .line 172
    add-float/2addr v8, v5

    .line 173
    cmpg-float v5, v8, v7

    .line 174
    .line 175
    if-gez v5, :cond_8

    .line 176
    .line 177
    iget-object p0, p0, Ll/kmj;->t:Landroid/view/VelocityTracker;

    .line 178
    .line 179
    invoke-virtual {p0}, Landroid/view/VelocityTracker;->clear()V

    .line 180
    .line 181
    .line 182
    return v3

    .line 183
    :cond_8
    :goto_6
    add-int/lit8 v4, v4, 0x1

    .line 184
    .line 185
    goto :goto_5

    .line 186
    :cond_9
    iput v9, p0, Ll/kmj;->q:F

    .line 187
    .line 188
    iput v10, p0, Ll/kmj;->r:F

    .line 189
    .line 190
    invoke-virtual {p0}, Ll/kmj;->h()V

    .line 191
    .line 192
    .line 193
    return v3

    .line 194
    :cond_a
    invoke-virtual {p0}, Ll/kmj;->g()V

    .line 195
    .line 196
    .line 197
    return v3

    .line 198
    :cond_b
    iget-boolean v0, p0, Ll/kmj;->k:Z

    .line 199
    .line 200
    if-eqz v0, :cond_d

    .line 201
    .line 202
    :cond_c
    :goto_7
    return v3

    .line 203
    :cond_d
    iget-object v0, p0, Ll/kmj;->n:Landroid/view/MotionEvent;

    .line 204
    .line 205
    if-nez v0, :cond_e

    .line 206
    .line 207
    invoke-virtual {p0, v9, v10, p1}, Ll/kmj;->o(FFLandroid/view/MotionEvent;)V

    .line 208
    .line 209
    .line 210
    :cond_e
    iget-boolean v0, p0, Ll/kmj;->p:Z

    .line 211
    .line 212
    if-eqz v0, :cond_f

    .line 213
    .line 214
    iget-object p0, p0, Ll/kmj;->h:Ll/kmj$b;

    .line 215
    .line 216
    invoke-interface {p0, p1}, Ll/kmj$b;->onDoubleTapEvent(Landroid/view/MotionEvent;)Z

    .line 217
    .line 218
    .line 219
    move-result p0

    .line 220
    return p0

    .line 221
    :cond_f
    iget-boolean v0, p0, Ll/kmj;->l:Z

    .line 222
    .line 223
    if-eqz v0, :cond_12

    .line 224
    .line 225
    iget v0, p0, Ll/kmj;->q:F

    .line 226
    .line 227
    sub-float/2addr v9, v0

    .line 228
    float-to-int v0, v9

    .line 229
    iget v1, p0, Ll/kmj;->r:F

    .line 230
    .line 231
    sub-float/2addr v10, v1

    .line 232
    float-to-int v1, v10

    .line 233
    mul-int/2addr v0, v0

    .line 234
    mul-int/2addr v1, v1

    .line 235
    add-int/2addr v0, v1

    .line 236
    iget v1, p0, Ll/kmj;->a:I

    .line 237
    .line 238
    if-le v0, v1, :cond_10

    .line 239
    .line 240
    iget-object v1, p0, Ll/kmj;->g:Ll/kmj$c;

    .line 241
    .line 242
    iget-object v6, p0, Ll/kmj;->n:Landroid/view/MotionEvent;

    .line 243
    .line 244
    invoke-interface {v1, v6, p1}, Ll/kmj$c;->a(Landroid/view/MotionEvent;Landroid/view/MotionEvent;)Z

    .line 245
    .line 246
    .line 247
    move-result p1

    .line 248
    iput-boolean v3, p0, Ll/kmj;->l:Z

    .line 249
    .line 250
    iget-object v1, p0, Ll/kmj;->f:Landroid/os/Handler;

    .line 251
    .line 252
    invoke-virtual {v1, v5}, Landroid/os/Handler;->removeMessages(I)V

    .line 253
    .line 254
    .line 255
    iget-object v1, p0, Ll/kmj;->f:Landroid/os/Handler;

    .line 256
    .line 257
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 258
    .line 259
    .line 260
    iget-object v1, p0, Ll/kmj;->f:Landroid/os/Handler;

    .line 261
    .line 262
    invoke-virtual {v1, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 263
    .line 264
    .line 265
    goto :goto_8

    .line 266
    :cond_10
    move p1, v3

    .line 267
    :goto_8
    iget v1, p0, Ll/kmj;->b:I

    .line 268
    .line 269
    if-le v0, v1, :cond_11

    .line 270
    .line 271
    iput-boolean v3, p0, Ll/kmj;->m:Z

    .line 272
    .line 273
    :cond_11
    return p1

    .line 274
    :cond_12
    iget-object v0, p0, Ll/kmj;->g:Ll/kmj$c;

    .line 275
    .line 276
    iget-object p0, p0, Ll/kmj;->n:Landroid/view/MotionEvent;

    .line 277
    .line 278
    invoke-interface {v0, p0, p1}, Ll/kmj$c;->a(Landroid/view/MotionEvent;Landroid/view/MotionEvent;)Z

    .line 279
    .line 280
    .line 281
    move-result p0

    .line 282
    return p0

    .line 283
    :cond_13
    iput-boolean v3, p0, Ll/kmj;->i:Z

    .line 284
    .line 285
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    iget-boolean v1, p0, Ll/kmj;->p:Z

    .line 290
    .line 291
    if-eqz v1, :cond_14

    .line 292
    .line 293
    iget-object v1, p0, Ll/kmj;->h:Ll/kmj$b;

    .line 294
    .line 295
    invoke-interface {v1, p1}, Ll/kmj$b;->onDoubleTapEvent(Landroid/view/MotionEvent;)Z

    .line 296
    .line 297
    .line 298
    move-result p1

    .line 299
    goto :goto_b

    .line 300
    :cond_14
    iget-boolean v1, p0, Ll/kmj;->k:Z

    .line 301
    .line 302
    if-eqz v1, :cond_15

    .line 303
    .line 304
    iget-object p1, p0, Ll/kmj;->f:Landroid/os/Handler;

    .line 305
    .line 306
    invoke-virtual {p1, v5}, Landroid/os/Handler;->removeMessages(I)V

    .line 307
    .line 308
    .line 309
    iput-boolean v3, p0, Ll/kmj;->k:Z

    .line 310
    .line 311
    goto :goto_9

    .line 312
    :cond_15
    iget-boolean v1, p0, Ll/kmj;->l:Z

    .line 313
    .line 314
    if-eqz v1, :cond_17

    .line 315
    .line 316
    iget-object v1, p0, Ll/kmj;->g:Ll/kmj$c;

    .line 317
    .line 318
    invoke-interface {v1, p1}, Ll/kmj$c;->onSingleTapUp(Landroid/view/MotionEvent;)Z

    .line 319
    .line 320
    .line 321
    move-result v1

    .line 322
    iget-boolean v5, p0, Ll/kmj;->j:Z

    .line 323
    .line 324
    if-eqz v5, :cond_16

    .line 325
    .line 326
    iget-object v5, p0, Ll/kmj;->h:Ll/kmj$b;

    .line 327
    .line 328
    if-eqz v5, :cond_16

    .line 329
    .line 330
    invoke-interface {v5, p1}, Ll/kmj$b;->onSingleTapConfirmed(Landroid/view/MotionEvent;)Z

    .line 331
    .line 332
    .line 333
    :cond_16
    move p1, v1

    .line 334
    goto :goto_b

    .line 335
    :cond_17
    iget-object v1, p0, Ll/kmj;->t:Landroid/view/VelocityTracker;

    .line 336
    .line 337
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 338
    .line 339
    .line 340
    move-result v5

    .line 341
    iget v6, p0, Ll/kmj;->e:I

    .line 342
    .line 343
    int-to-float v6, v6

    .line 344
    invoke-virtual {v1, v8, v6}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 345
    .line 346
    .line 347
    invoke-virtual {v1, v5}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    .line 348
    .line 349
    .line 350
    move-result v6

    .line 351
    invoke-virtual {v1, v5}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    .line 352
    .line 353
    .line 354
    move-result v1

    .line 355
    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    .line 356
    .line 357
    .line 358
    move-result v5

    .line 359
    iget v7, p0, Ll/kmj;->d:I

    .line 360
    .line 361
    int-to-float v7, v7

    .line 362
    cmpl-float v5, v5, v7

    .line 363
    .line 364
    if-gtz v5, :cond_19

    .line 365
    .line 366
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 367
    .line 368
    .line 369
    move-result v5

    .line 370
    iget v7, p0, Ll/kmj;->d:I

    .line 371
    .line 372
    int-to-float v7, v7

    .line 373
    cmpl-float v5, v5, v7

    .line 374
    .line 375
    if-lez v5, :cond_18

    .line 376
    .line 377
    goto :goto_a

    .line 378
    :cond_18
    :goto_9
    move p1, v3

    .line 379
    goto :goto_b

    .line 380
    :cond_19
    :goto_a
    iget-object v5, p0, Ll/kmj;->g:Ll/kmj$c;

    .line 381
    .line 382
    iget-object v7, p0, Ll/kmj;->n:Landroid/view/MotionEvent;

    .line 383
    .line 384
    invoke-interface {v5, v7, p1, v1, v6}, Ll/kmj$c;->onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    .line 385
    .line 386
    .line 387
    move-result p1

    .line 388
    :goto_b
    iget-object v1, p0, Ll/kmj;->o:Landroid/view/MotionEvent;

    .line 389
    .line 390
    if-eqz v1, :cond_1a

    .line 391
    .line 392
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    .line 393
    .line 394
    .line 395
    :cond_1a
    iput-object v0, p0, Ll/kmj;->o:Landroid/view/MotionEvent;

    .line 396
    .line 397
    iget-object v0, p0, Ll/kmj;->t:Landroid/view/VelocityTracker;

    .line 398
    .line 399
    if-eqz v0, :cond_1b

    .line 400
    .line 401
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 402
    .line 403
    .line 404
    const/4 v0, 0x0

    .line 405
    iput-object v0, p0, Ll/kmj;->t:Landroid/view/VelocityTracker;

    .line 406
    .line 407
    :cond_1b
    iput-boolean v3, p0, Ll/kmj;->p:Z

    .line 408
    .line 409
    iput-boolean v3, p0, Ll/kmj;->j:Z

    .line 410
    .line 411
    iget-object v0, p0, Ll/kmj;->f:Landroid/os/Handler;

    .line 412
    .line 413
    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 414
    .line 415
    .line 416
    iget-object p0, p0, Ll/kmj;->f:Landroid/os/Handler;

    .line 417
    .line 418
    invoke-virtual {p0, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 419
    .line 420
    .line 421
    return p1

    .line 422
    :cond_1c
    iget-object v0, p0, Ll/kmj;->h:Ll/kmj$b;

    .line 423
    .line 424
    if-eqz v0, :cond_1f

    .line 425
    .line 426
    iget-object v0, p0, Ll/kmj;->f:Landroid/os/Handler;

    .line 427
    .line 428
    invoke-virtual {v0, v5}, Landroid/os/Handler;->hasMessages(I)Z

    .line 429
    .line 430
    .line 431
    move-result v0

    .line 432
    if-eqz v0, :cond_1d

    .line 433
    .line 434
    iget-object v1, p0, Ll/kmj;->f:Landroid/os/Handler;

    .line 435
    .line 436
    invoke-virtual {v1, v5}, Landroid/os/Handler;->removeMessages(I)V

    .line 437
    .line 438
    .line 439
    :cond_1d
    iget-object v1, p0, Ll/kmj;->n:Landroid/view/MotionEvent;

    .line 440
    .line 441
    if-eqz v1, :cond_1e

    .line 442
    .line 443
    iget-object v6, p0, Ll/kmj;->o:Landroid/view/MotionEvent;

    .line 444
    .line 445
    if-eqz v6, :cond_1e

    .line 446
    .line 447
    if-eqz v0, :cond_1e

    .line 448
    .line 449
    invoke-virtual {p0, v1, v6, p1}, Ll/kmj;->k(Landroid/view/MotionEvent;Landroid/view/MotionEvent;Landroid/view/MotionEvent;)Z

    .line 450
    .line 451
    .line 452
    move-result v0

    .line 453
    if-eqz v0, :cond_1e

    .line 454
    .line 455
    iput-boolean v2, p0, Ll/kmj;->p:Z

    .line 456
    .line 457
    iget-object v0, p0, Ll/kmj;->h:Ll/kmj$b;

    .line 458
    .line 459
    iget-object v1, p0, Ll/kmj;->n:Landroid/view/MotionEvent;

    .line 460
    .line 461
    invoke-interface {v0, v1}, Ll/kmj$b;->onDoubleTap(Landroid/view/MotionEvent;)Z

    .line 462
    .line 463
    .line 464
    move-result v0

    .line 465
    iget-object v1, p0, Ll/kmj;->h:Ll/kmj$b;

    .line 466
    .line 467
    invoke-interface {v1, p1}, Ll/kmj$b;->onDoubleTapEvent(Landroid/view/MotionEvent;)Z

    .line 468
    .line 469
    .line 470
    move-result v1

    .line 471
    or-int/2addr v0, v1

    .line 472
    goto :goto_c

    .line 473
    :cond_1e
    iget-object v0, p0, Ll/kmj;->f:Landroid/os/Handler;

    .line 474
    .line 475
    sget v1, Ll/kmj;->w:I

    .line 476
    .line 477
    int-to-long v6, v1

    .line 478
    invoke-virtual {v0, v5, v6, v7}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 479
    .line 480
    .line 481
    :cond_1f
    move v0, v3

    .line 482
    :goto_c
    iput v9, p0, Ll/kmj;->q:F

    .line 483
    .line 484
    iput v10, p0, Ll/kmj;->r:F

    .line 485
    .line 486
    iget-object v1, p0, Ll/kmj;->n:Landroid/view/MotionEvent;

    .line 487
    .line 488
    if-eqz v1, :cond_20

    .line 489
    .line 490
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    .line 491
    .line 492
    .line 493
    :cond_20
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    .line 494
    .line 495
    .line 496
    move-result-object v1

    .line 497
    iput-object v1, p0, Ll/kmj;->n:Landroid/view/MotionEvent;

    .line 498
    .line 499
    iput-boolean v2, p0, Ll/kmj;->l:Z

    .line 500
    .line 501
    iput-boolean v2, p0, Ll/kmj;->m:Z

    .line 502
    .line 503
    iput-boolean v2, p0, Ll/kmj;->i:Z

    .line 504
    .line 505
    iput-boolean v3, p0, Ll/kmj;->k:Z

    .line 506
    .line 507
    iput-boolean v3, p0, Ll/kmj;->j:Z

    .line 508
    .line 509
    iget-boolean v1, p0, Ll/kmj;->s:Z

    .line 510
    .line 511
    if-eqz v1, :cond_21

    .line 512
    .line 513
    iget-object v1, p0, Ll/kmj;->f:Landroid/os/Handler;

    .line 514
    .line 515
    invoke-virtual {v1, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 516
    .line 517
    .line 518
    iget-object v1, p0, Ll/kmj;->f:Landroid/os/Handler;

    .line 519
    .line 520
    iget-object v3, p0, Ll/kmj;->n:Landroid/view/MotionEvent;

    .line 521
    .line 522
    invoke-virtual {v3}, Landroid/view/MotionEvent;->getDownTime()J

    .line 523
    .line 524
    .line 525
    move-result-wide v5

    .line 526
    sget v3, Ll/kmj;->v:I

    .line 527
    .line 528
    int-to-long v7, v3

    .line 529
    add-long/2addr v5, v7

    .line 530
    sget v3, Ll/kmj;->u:I

    .line 531
    .line 532
    int-to-long v7, v3

    .line 533
    add-long/2addr v5, v7

    .line 534
    invoke-virtual {v1, v4, v5, v6}, Landroid/os/Handler;->sendEmptyMessageAtTime(IJ)Z

    .line 535
    .line 536
    .line 537
    :cond_21
    iget-object v1, p0, Ll/kmj;->f:Landroid/os/Handler;

    .line 538
    .line 539
    iget-object v3, p0, Ll/kmj;->n:Landroid/view/MotionEvent;

    .line 540
    .line 541
    invoke-virtual {v3}, Landroid/view/MotionEvent;->getDownTime()J

    .line 542
    .line 543
    .line 544
    move-result-wide v3

    .line 545
    sget v5, Ll/kmj;->v:I

    .line 546
    .line 547
    int-to-long v5, v5

    .line 548
    add-long/2addr v3, v5

    .line 549
    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->sendEmptyMessageAtTime(IJ)Z

    .line 550
    .line 551
    .line 552
    iget-object p0, p0, Ll/kmj;->g:Ll/kmj$c;

    .line 553
    .line 554
    invoke-interface {p0, p1}, Ll/kmj$c;->onDown(Landroid/view/MotionEvent;)Z

    .line 555
    .line 556
    .line 557
    move-result p0

    .line 558
    or-int/2addr p0, v0

    .line 559
    return p0
.end method

.method public m(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/kmj;->s:Z

    .line 2
    .line 3
    return-void
.end method

.method public n(Ll/kmj$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kmj;->h:Ll/kmj$b;

    .line 2
    .line 3
    return-void
.end method

.method public o(FFLandroid/view/MotionEvent;)V
    .locals 0

    .line 1
    iput p1, p0, Ll/kmj;->q:F

    .line 2
    .line 3
    iput p2, p0, Ll/kmj;->r:F

    .line 4
    .line 5
    invoke-static {p3}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Ll/kmj;->n:Landroid/view/MotionEvent;

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    invoke-virtual {p1, p0}, Landroid/view/MotionEvent;->setAction(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
