.class public Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;
.implements Landroid/animation/Animator$AnimatorListener;


# instance fields
.field public a:Landroid/graphics/Rect;

.field public b:Landroid/graphics/Rect;

.field public c:Landroid/graphics/Rect;

.field public d:Landroid/graphics/RectF;

.field public e:Landroid/graphics/Path;

.field public f:Z

.field public g:Z

.field public h:Ll/x20;

.field public i:Ll/x20;

.field public j:Ll/x20;

.field public k:I

.field public l:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 50
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 49
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->a:Landroid/graphics/Rect;

    .line 10
    .line 11
    new-instance p1, Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->b:Landroid/graphics/Rect;

    .line 17
    .line 18
    new-instance p1, Landroid/graphics/Rect;

    .line 19
    .line 20
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->c:Landroid/graphics/Rect;

    .line 24
    .line 25
    new-instance p1, Landroid/graphics/RectF;

    .line 26
    .line 27
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->d:Landroid/graphics/RectF;

    .line 31
    .line 32
    new-instance p1, Landroid/graphics/Path;

    .line 33
    .line 34
    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->e:Landroid/graphics/Path;

    .line 38
    .line 39
    const/4 p1, 0x0

    .line 40
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->f:Z

    .line 41
    .line 42
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->g:Z

    .line 43
    .line 44
    sget p1, Ll/qa00;->i:I

    .line 45
    .line 46
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->k:I

    .line 47
    .line 48
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Rect;Ll/x20;)V
    .locals 2
    .param p1    # Landroid/graphics/Rect;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {p0}, Ll/gt0;->e(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->g:Z

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->f:Z

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->c:Landroid/graphics/Rect;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 20
    .line 21
    .line 22
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->j:Ll/x20;

    .line 23
    .line 24
    const/4 p1, 0x2

    .line 25
    new-array p1, p1, [F

    .line 26
    .line 27
    fill-array-data p1, :array_0

    .line 28
    .line 29
    .line 30
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-wide/16 v0, 0x12c

    .line 35
    .line 36
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    new-instance p2, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 41
    .line 42
    invoke-direct {p2}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 52
    .line 53
    .line 54
    invoke-static {p0, p1}, Ll/gt0;->b(Landroid/view/View;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 62
    .line 63
    .line 64
    const/high16 p1, 0x3f800000    # 1.0f

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    nop

    .line 71
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public b(Landroid/graphics/Rect;Ll/x20;Ll/x20;)V
    .locals 2
    .param p1    # Landroid/graphics/Rect;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {p0}, Ll/gt0;->e(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->f:Z

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->g:Z

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->b:Landroid/graphics/Rect;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 20
    .line 21
    .line 22
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->h:Ll/x20;

    .line 23
    .line 24
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->i:Ll/x20;

    .line 25
    .line 26
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->d:Landroid/graphics/RectF;

    .line 27
    .line 28
    iget p3, p1, Landroid/graphics/Rect;->left:I

    .line 29
    .line 30
    int-to-float p3, p3

    .line 31
    iget v0, p1, Landroid/graphics/Rect;->top:I

    .line 32
    .line 33
    int-to-float v0, v0

    .line 34
    iget v1, p1, Landroid/graphics/Rect;->right:I

    .line 35
    .line 36
    int-to-float v1, v1

    .line 37
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 38
    .line 39
    int-to-float p1, p1

    .line 40
    invoke-virtual {p2, p3, v0, v1, p1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->a:Landroid/graphics/Rect;

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    int-to-float p1, p1

    .line 50
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->d:Landroid/graphics/RectF;

    .line 51
    .line 52
    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    sub-float/2addr p1, p2

    .line 57
    const/4 p2, 0x0

    .line 58
    cmpl-float p1, p1, p2

    .line 59
    .line 60
    const/high16 p2, 0x3f800000    # 1.0f

    .line 61
    .line 62
    if-lez p1, :cond_1

    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->a:Landroid/graphics/Rect;

    .line 65
    .line 66
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    int-to-float p1, p1

    .line 71
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->d:Landroid/graphics/RectF;

    .line 72
    .line 73
    invoke-virtual {p3}, Landroid/graphics/RectF;->width()F

    .line 74
    .line 75
    .line 76
    move-result p3

    .line 77
    sub-float/2addr p1, p3

    .line 78
    mul-float/2addr p1, p2

    .line 79
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->a:Landroid/graphics/Rect;

    .line 80
    .line 81
    invoke-virtual {p3}, Landroid/graphics/Rect;->height()I

    .line 82
    .line 83
    .line 84
    move-result p3

    .line 85
    int-to-float p3, p3

    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->d:Landroid/graphics/RectF;

    .line 87
    .line 88
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    sub-float/2addr p3, v0

    .line 93
    div-float/2addr p1, p3

    .line 94
    goto :goto_0

    .line 95
    :cond_1
    move p1, p2

    .line 96
    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->l:F

    .line 97
    .line 98
    const/4 p1, 0x2

    .line 99
    new-array p1, p1, [F

    .line 100
    .line 101
    fill-array-data p1, :array_0

    .line 102
    .line 103
    .line 104
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    const-wide/16 v0, 0x12c

    .line 109
    .line 110
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    new-instance p3, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 115
    .line 116
    invoke-direct {p3}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1, p3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 126
    .line 127
    .line 128
    invoke-static {p0, p1}, Ll/gt0;->b(Landroid/view/View;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p0, p2}, Landroid/view/View;->setAlpha(F)V

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    nop

    .line 143
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final c()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->g:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public final d()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->f:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->g:Z

    .line 5
    .line 6
    const/high16 v0, 0x3f800000    # 1.0f

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->e:Landroid/graphics/Path;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 13
    .line 14
    .line 15
    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->f:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->d()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->f:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->i:Ll/x20;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->i:Ll/x20;

    .line 14
    .line 15
    invoke-interface {p1}, Ll/x20;->call()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->g:Z

    .line 19
    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->j:Ll/x20;

    .line 23
    .line 24
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->j:Ll/x20;

    .line 31
    .line 32
    invoke-interface {p1}, Ll/x20;->call()V

    .line 33
    .line 34
    .line 35
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->d()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->f:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->h:Ll/x20;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->h:Ll/x20;

    .line 14
    .line 15
    invoke-interface {p0}, Ll/x20;->call()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->f:Z

    .line 12
    .line 13
    const/high16 v1, 0x3f800000    # 1.0f

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->l:F

    .line 18
    .line 19
    div-float v0, p1, v0

    .line 20
    .line 21
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->b:Landroid/graphics/Rect;

    .line 26
    .line 27
    iget v2, v1, Landroid/graphics/Rect;->left:I

    .line 28
    .line 29
    int-to-float v3, v2

    .line 30
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->a:Landroid/graphics/Rect;

    .line 31
    .line 32
    iget v5, v4, Landroid/graphics/Rect;->left:I

    .line 33
    .line 34
    sub-int/2addr v5, v2

    .line 35
    int-to-float v2, v5

    .line 36
    mul-float/2addr v2, v0

    .line 37
    add-float/2addr v3, v2

    .line 38
    float-to-int v2, v3

    .line 39
    iget v3, v1, Landroid/graphics/Rect;->right:I

    .line 40
    .line 41
    int-to-float v5, v3

    .line 42
    iget v6, v4, Landroid/graphics/Rect;->right:I

    .line 43
    .line 44
    sub-int/2addr v6, v3

    .line 45
    int-to-float v3, v6

    .line 46
    mul-float/2addr v3, v0

    .line 47
    add-float/2addr v5, v3

    .line 48
    float-to-int v0, v5

    .line 49
    iget v3, v1, Landroid/graphics/Rect;->top:I

    .line 50
    .line 51
    int-to-float v5, v3

    .line 52
    iget v6, v4, Landroid/graphics/Rect;->top:I

    .line 53
    .line 54
    sub-int/2addr v6, v3

    .line 55
    int-to-float v3, v6

    .line 56
    mul-float/2addr v3, p1

    .line 57
    add-float/2addr v5, v3

    .line 58
    float-to-int v3, v5

    .line 59
    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    .line 60
    .line 61
    int-to-float v5, v1

    .line 62
    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    .line 63
    .line 64
    sub-int/2addr v4, v1

    .line 65
    int-to-float v1, v4

    .line 66
    mul-float/2addr v1, p1

    .line 67
    add-float/2addr v5, v1

    .line 68
    float-to-int p1, v5

    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->d:Landroid/graphics/RectF;

    .line 70
    .line 71
    int-to-float v2, v2

    .line 72
    int-to-float v3, v3

    .line 73
    int-to-float v0, v0

    .line 74
    int-to-float p1, p1

    .line 75
    invoke-virtual {v1, v2, v3, v0, p1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->a:Landroid/graphics/Rect;

    .line 80
    .line 81
    iget v2, v0, Landroid/graphics/Rect;->left:I

    .line 82
    .line 83
    int-to-float v3, v2

    .line 84
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->c:Landroid/graphics/Rect;

    .line 85
    .line 86
    iget v5, v4, Landroid/graphics/Rect;->left:I

    .line 87
    .line 88
    sub-int/2addr v5, v2

    .line 89
    int-to-float v2, v5

    .line 90
    mul-float/2addr v2, p1

    .line 91
    add-float/2addr v3, v2

    .line 92
    float-to-int v2, v3

    .line 93
    iget v3, v0, Landroid/graphics/Rect;->top:I

    .line 94
    .line 95
    int-to-float v5, v3

    .line 96
    iget v6, v4, Landroid/graphics/Rect;->top:I

    .line 97
    .line 98
    sub-int/2addr v6, v3

    .line 99
    int-to-float v3, v6

    .line 100
    mul-float/2addr v3, p1

    .line 101
    add-float/2addr v5, v3

    .line 102
    float-to-int v3, v5

    .line 103
    iget v5, v0, Landroid/graphics/Rect;->right:I

    .line 104
    .line 105
    int-to-float v6, v5

    .line 106
    iget v7, v4, Landroid/graphics/Rect;->right:I

    .line 107
    .line 108
    sub-int/2addr v7, v5

    .line 109
    int-to-float v5, v7

    .line 110
    mul-float/2addr v5, p1

    .line 111
    add-float/2addr v6, v5

    .line 112
    float-to-int v5, v6

    .line 113
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 114
    .line 115
    int-to-float v6, v0

    .line 116
    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    .line 117
    .line 118
    sub-int/2addr v4, v0

    .line 119
    int-to-float v0, v4

    .line 120
    mul-float/2addr v0, p1

    .line 121
    add-float/2addr v6, v0

    .line 122
    float-to-int v0, v6

    .line 123
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->d:Landroid/graphics/RectF;

    .line 124
    .line 125
    int-to-float v2, v2

    .line 126
    int-to-float v3, v3

    .line 127
    int-to-float v5, v5

    .line 128
    int-to-float v0, v0

    .line 129
    invoke-virtual {v4, v2, v3, v5, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 130
    .line 131
    .line 132
    sub-float/2addr v1, p1

    .line 133
    const/high16 p1, 0x3f000000    # 0.5f

    .line 134
    .line 135
    invoke-static {v1, p1}, Ljava/lang/Math;->min(FF)F

    .line 136
    .line 137
    .line 138
    move-result p1

    .line 139
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 140
    .line 141
    .line 142
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->e:Landroid/graphics/Path;

    .line 143
    .line 144
    invoke-virtual {p1}, Landroid/graphics/Path;->reset()V

    .line 145
    .line 146
    .line 147
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->e:Landroid/graphics/Path;

    .line 148
    .line 149
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->d:Landroid/graphics/RectF;

    .line 150
    .line 151
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->k:I

    .line 152
    .line 153
    int-to-float v2, v1

    .line 154
    int-to-float v1, v1

    .line 155
    sget-object v3, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 156
    .line 157
    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 161
    .line 162
    .line 163
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->a:Landroid/graphics/Rect;

    .line 5
    .line 6
    const/4 p2, 0x0

    .line 7
    iput p2, p1, Landroid/graphics/Rect;->left:I

    .line 8
    .line 9
    iput p2, p1, Landroid/graphics/Rect;->top:I

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    iput p2, p1, Landroid/graphics/Rect;->right:I

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->a:Landroid/graphics/Rect;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    .line 24
    .line 25
    return-void
.end method
