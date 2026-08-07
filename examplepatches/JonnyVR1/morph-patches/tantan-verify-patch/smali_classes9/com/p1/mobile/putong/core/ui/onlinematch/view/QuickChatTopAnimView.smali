.class public Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Landroid/view/animation/DecelerateInterpolator;

.field public d:Landroid/graphics/Paint;

.field public e:I

.field public f:Ll/ft5;

.field public g:Landroid/animation/ValueAnimator;

.field public h:Z

.field public i:I

.field public j:I

.field public k:J

.field public l:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 105
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 104
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->b:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance p1, Landroid/view/animation/DecelerateInterpolator;

    .line 12
    .line 13
    invoke-direct {p1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->c:Landroid/view/animation/DecelerateInterpolator;

    .line 17
    .line 18
    new-instance p1, Landroid/graphics/Paint;

    .line 19
    .line 20
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->d:Landroid/graphics/Paint;

    .line 24
    .line 25
    new-instance p1, Ll/ft5;

    .line 26
    .line 27
    invoke-direct {p1}, Ll/ft5;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->f:Ll/ft5;

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->d:Landroid/graphics/Paint;

    .line 33
    .line 34
    const-string p2, "#ffffff"

    .line 35
    .line 36
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->d:Landroid/graphics/Paint;

    .line 44
    .line 45
    sget p2, Ll/qa00;->a:I

    .line 46
    .line 47
    int-to-float p2, p2

    .line 48
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->d:Landroid/graphics/Paint;

    .line 52
    .line 53
    const/16 p2, 0x2d

    .line 54
    .line 55
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->d:Landroid/graphics/Paint;

    .line 59
    .line 60
    const/4 p2, 0x1

    .line 61
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->d:Landroid/graphics/Paint;

    .line 65
    .line 66
    sget-object p2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 67
    .line 68
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 69
    .line 70
    .line 71
    const/4 p1, 0x0

    .line 72
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->h:Z

    .line 73
    .line 74
    const/16 p2, 0xbb8

    .line 75
    .line 76
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->i:I

    .line 77
    .line 78
    const/16 p2, 0x320

    .line 79
    .line 80
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->j:I

    .line 81
    .line 82
    const-wide/16 p2, 0x0

    .line 83
    .line 84
    iput-wide p2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->k:J

    .line 85
    .line 86
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->l:I

    .line 87
    .line 88
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 89
    .line 90
    .line 91
    move-result p2

    .line 92
    if-eqz p2, :cond_0

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_0
    const/high16 p1, 0x40400000    # 3.0f

    .line 96
    .line 97
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->e:I

    .line 102
    .line 103
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->c(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method


# virtual methods
.method public final b()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic c(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->g:Landroid/animation/ValueAnimator;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->g:Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->h:Lcom/p1/mobile/android/app/c;

    .line 20
    .line 21
    if-ne p1, v0, :cond_1

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->g:Landroid/animation/ValueAnimator;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->g:Landroid/animation/ValueAnimator;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->f:Ll/ft5;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/ft5;->c()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->g:Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->g:Landroid/animation/ValueAnimator;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->g:Landroid/animation/ValueAnimator;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->b:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_3

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ljava/lang/Long;

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 23
    .line 24
    .line 25
    move-result-wide v1

    .line 26
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 27
    .line 28
    .line 29
    move-result-wide v3

    .line 30
    sub-long/2addr v3, v1

    .line 31
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->i:I

    .line 32
    .line 33
    int-to-long v5, v5

    .line 34
    cmp-long v3, v3, v5

    .line 35
    .line 36
    if-gez v3, :cond_2

    .line 37
    .line 38
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 39
    .line 40
    .line 41
    move-result-wide v3

    .line 42
    sub-long/2addr v3, v1

    .line 43
    long-to-float v1, v3

    .line 44
    const/high16 v2, 0x3f800000    # 1.0f

    .line 45
    .line 46
    mul-float/2addr v1, v2

    .line 47
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->i:I

    .line 48
    .line 49
    int-to-float v3, v3

    .line 50
    div-float/2addr v1, v3

    .line 51
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->c:Landroid/view/animation/DecelerateInterpolator;

    .line 52
    .line 53
    invoke-virtual {v3, v1}, Landroid/view/animation/DecelerateInterpolator;->getInterpolation(F)F

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->d:Landroid/graphics/Paint;

    .line 58
    .line 59
    const/high16 v5, 0x420c0000    # 35.0f

    .line 60
    .line 61
    sub-float/2addr v2, v3

    .line 62
    mul-float/2addr v2, v5

    .line 63
    const/high16 v3, 0x41200000    # 10.0f

    .line 64
    .line 65
    add-float/2addr v2, v3

    .line 66
    float-to-int v2, v2

    .line 67
    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    div-int/lit8 v2, v2, 0x2

    .line 75
    .line 76
    int-to-float v2, v2

    .line 77
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->l:I

    .line 78
    .line 79
    if-eqz v3, :cond_0

    .line 80
    .line 81
    int-to-float v3, v3

    .line 82
    goto :goto_2

    .line 83
    :cond_0
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->h:Z

    .line 84
    .line 85
    if-eqz v3, :cond_1

    .line 86
    .line 87
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    int-to-float v3, v3

    .line 92
    const v4, 0x3e99999a    # 0.3f

    .line 93
    .line 94
    .line 95
    :goto_1
    mul-float/2addr v3, v4

    .line 96
    goto :goto_2

    .line 97
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    int-to-float v3, v3

    .line 102
    const v4, 0x3e75c28f    # 0.24f

    .line 103
    .line 104
    .line 105
    goto :goto_1

    .line 106
    :goto_2
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->a:I

    .line 107
    .line 108
    int-to-float v4, v4

    .line 109
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 110
    .line 111
    .line 112
    move-result v5

    .line 113
    iget v6, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->a:I

    .line 114
    .line 115
    sub-int/2addr v5, v6

    .line 116
    int-to-float v5, v5

    .line 117
    mul-float/2addr v5, v1

    .line 118
    add-float/2addr v4, v5

    .line 119
    float-to-int v1, v4

    .line 120
    div-int/lit8 v1, v1, 0x2

    .line 121
    .line 122
    int-to-float v1, v1

    .line 123
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->d:Landroid/graphics/Paint;

    .line 124
    .line 125
    invoke-virtual {p1, v2, v3, v1, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 126
    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_2
    iput-wide v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->k:J

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->b:Ljava/util/ArrayList;

    .line 133
    .line 134
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->k:J

    .line 135
    .line 136
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->f:Ll/ft5;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->b()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    new-instance v2, Ll/k6c0;

    .line 15
    .line 16
    invoke-direct {v2, p0}, Ll/k6c0;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Ll/ft5;->a(Ll/kcg0;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public onMeasure(II)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    div-int/lit8 p1, p1, 0x2

    .line 9
    .line 10
    sget p2, Ll/qa00;->y:I

    .line 11
    .line 12
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->h:Z

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    sget p2, Ll/qa00;->K:I

    .line 17
    .line 18
    :cond_0
    int-to-float v0, p2

    .line 19
    const v1, 0x3f99999a    # 1.2f

    .line 20
    .line 21
    .line 22
    mul-float/2addr v0, v1

    .line 23
    float-to-int v0, v0

    .line 24
    const/16 v1, 0xc8

    .line 25
    .line 26
    mul-int/2addr p1, v1

    .line 27
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->i:I

    .line 28
    .line 29
    div-int/2addr p1, v2

    .line 30
    sub-int/2addr v0, p1

    .line 31
    int-to-float p1, v0

    .line 32
    const/high16 v0, 0x3f800000    # 1.0f

    .line 33
    .line 34
    mul-float/2addr p1, v0

    .line 35
    div-int/2addr v1, v2

    .line 36
    rsub-int/lit8 v0, v1, 0x1

    .line 37
    .line 38
    int-to-float v0, v0

    .line 39
    div-float/2addr p1, v0

    .line 40
    float-to-int p1, p1

    .line 41
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->a:I

    .line 42
    .line 43
    if-le p1, p2, :cond_1

    .line 44
    .line 45
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->a:I

    .line 46
    .line 47
    :cond_1
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->a:I

    .line 48
    .line 49
    int-to-float p1, p1

    .line 50
    const p2, 0x3f733333    # 0.95f

    .line 51
    .line 52
    .line 53
    mul-float/2addr p1, p2

    .line 54
    float-to-int p1, p1

    .line 55
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->a:I

    .line 56
    .line 57
    return-void
.end method

.method public setCenterYMarginTop(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->l:I

    .line 2
    .line 3
    return-void
.end method

.method public setIsbig(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->h:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/16 p1, 0x7d0

    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->i:I

    .line 8
    .line 9
    const/16 p1, 0x230

    .line 10
    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->j:I

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/16 p1, 0xbb8

    .line 15
    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->i:I

    .line 17
    .line 18
    const/16 p1, 0x320

    .line 19
    .line 20
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatTopAnimView;->j:I

    .line 21
    .line 22
    return-void
.end method
