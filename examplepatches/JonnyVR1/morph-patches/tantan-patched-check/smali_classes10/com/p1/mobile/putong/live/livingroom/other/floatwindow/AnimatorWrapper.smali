.class public Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public b:F

.field public c:F

.field public d:F

.field public e:F

.field public f:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;

.field public g:Landroid/animation/AnimatorSet;

.field public h:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public i:Landroid/view/View;


# direct methods
.method public constructor <init>(Ll/z20;Landroid/view/View;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;",
            "Landroid/view/View;",
            "I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->h:Ll/z20;

    .line 5
    .line 6
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->a:I

    .line 7
    .line 8
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->i:Landroid/view/View;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;FFFF)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->f:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;

    .line 2
    .line 3
    iput p4, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->b:F

    .line 4
    .line 5
    iput p5, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->c:F

    .line 6
    .line 7
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->d:F

    .line 8
    .line 9
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->e:F

    .line 10
    .line 11
    sub-float/2addr p4, p2

    .line 12
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    sub-float/2addr p5, p3

    .line 17
    invoke-static {p5}, Ljava/lang/Math;->abs(F)F

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    invoke-static {p1, p2}, Ljava/lang/Math;->max(FF)F

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-static {}, Ll/bnl0;->y0()I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    int-to-float p2, p2

    .line 30
    div-float/2addr p1, p2

    .line 31
    iget p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->a:I

    .line 32
    .line 33
    int-to-float p2, p2

    .line 34
    mul-float/2addr p1, p2

    .line 35
    new-instance p2, Landroid/animation/AnimatorSet;

    .line 36
    .line 37
    invoke-direct {p2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->g:Landroid/animation/AnimatorSet;

    .line 41
    .line 42
    float-to-long p3, p1

    .line 43
    invoke-virtual {p2, p3, p4}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 44
    .line 45
    .line 46
    const/4 p1, 0x2

    .line 47
    new-array p2, p1, [F

    .line 48
    .line 49
    fill-array-data p2, :array_0

    .line 50
    .line 51
    .line 52
    const-string p3, "progress"

    .line 53
    .line 54
    invoke-static {p0, p3, p2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->i:Landroid/view/View;

    .line 59
    .line 60
    invoke-virtual {p3}, Landroid/view/View;->getAlpha()F

    .line 61
    .line 62
    .line 63
    move-result p3

    .line 64
    const/high16 p4, 0x3f800000    # 1.0f

    .line 65
    .line 66
    sub-float p3, p4, p3

    .line 67
    .line 68
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    .line 69
    .line 70
    .line 71
    move-result p3

    .line 72
    float-to-double v0, p3

    .line 73
    const-wide v2, 0x3ee4f8b588e368f1L    # 1.0E-5

    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    cmpl-double p3, v0, v2

    .line 79
    .line 80
    if-lez p3, :cond_0

    .line 81
    .line 82
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->i:Landroid/view/View;

    .line 83
    .line 84
    invoke-virtual {p3}, Landroid/view/View;->getAlpha()F

    .line 85
    .line 86
    .line 87
    move-result p5

    .line 88
    new-array p1, p1, [F

    .line 89
    .line 90
    const/4 v0, 0x0

    .line 91
    aput p5, p1, v0

    .line 92
    .line 93
    const/4 p5, 0x1

    .line 94
    aput p4, p1, p5

    .line 95
    .line 96
    const-string p4, "alpha"

    .line 97
    .line 98
    invoke-static {p3, p4, p1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->g:Landroid/animation/AnimatorSet;

    .line 103
    .line 104
    invoke-virtual {p3, p2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 105
    .line 106
    .line 107
    move-result-object p2

    .line 108
    invoke-virtual {p2, p1}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->g:Landroid/animation/AnimatorSet;

    .line 113
    .line 114
    invoke-virtual {p1, p2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 115
    .line 116
    .line 117
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->g:Landroid/animation/AnimatorSet;

    .line 118
    .line 119
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->g:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->g:Landroid/animation/AnimatorSet;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public setProgress(F)V
    .locals 4
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->h:Ll/z20;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper$a;->a:[I

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->f:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    aget v0, v0, v1

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    const/high16 v2, 0x3f800000    # 1.0f

    .line 18
    .line 19
    if-eq v0, v1, :cond_3

    .line 20
    .line 21
    const/4 v1, 0x2

    .line 22
    if-eq v0, v1, :cond_2

    .line 23
    .line 24
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->d:F

    .line 25
    .line 26
    const/4 v3, 0x3

    .line 27
    if-eq v0, v3, :cond_1

    .line 28
    .line 29
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->e:F

    .line 30
    .line 31
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->c:F

    .line 32
    .line 33
    sub-float/2addr v2, v0

    .line 34
    mul-float/2addr v2, p1

    .line 35
    add-float/2addr v0, v2

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->c:F

    .line 38
    .line 39
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->e:F

    .line 40
    .line 41
    sub-float/2addr v3, v0

    .line 42
    sub-float/2addr v2, p1

    .line 43
    mul-float/2addr v3, v2

    .line 44
    add-float/2addr v0, v3

    .line 45
    goto :goto_0

    .line 46
    :cond_2
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->d:F

    .line 47
    .line 48
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->b:F

    .line 49
    .line 50
    sub-float/2addr v1, v0

    .line 51
    mul-float/2addr v1, p1

    .line 52
    add-float/2addr v1, v0

    .line 53
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->e:F

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->d:F

    .line 57
    .line 58
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->b:F

    .line 59
    .line 60
    sub-float/2addr v0, v1

    .line 61
    sub-float/2addr v2, p1

    .line 62
    mul-float v1, v0, v2

    .line 63
    .line 64
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->e:F

    .line 65
    .line 66
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->h:Ll/z20;

    .line 67
    .line 68
    float-to-int p1, v1

    .line 69
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    float-to-int v0, v0

    .line 74
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-interface {p0, p1, v0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method
