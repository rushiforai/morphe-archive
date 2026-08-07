.class public Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;
.super Landroid/view/View;
.source "SourceFile"


# static fields
.field public static m:Ljava/lang/String; = "close"


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:Landroid/graphics/Paint;

.field public c:Landroid/graphics/Paint;

.field public d:Landroid/graphics/Paint;

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:Landroid/graphics/RectF;

.field public j:F

.field public k:Z

.field public l:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 153
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 152
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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
    const-string p1, "#FE7E1D"

    .line 5
    .line 6
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->e:I

    .line 11
    .line 12
    const-string p1, "#D7DAE5"

    .line 13
    .line 14
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->f:I

    .line 19
    .line 20
    const/high16 p1, 0x42380000    # 46.0f

    .line 21
    .line 22
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->g:I

    .line 27
    .line 28
    const/high16 p1, 0x41f00000    # 30.0f

    .line 29
    .line 30
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->h:I

    .line 35
    .line 36
    const/4 p1, 0x0

    .line 37
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->k:Z

    .line 38
    .line 39
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->l:Z

    .line 40
    .line 41
    new-instance p1, Landroid/graphics/Paint;

    .line 42
    .line 43
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->c:Landroid/graphics/Paint;

    .line 47
    .line 48
    const/4 p2, 0x1

    .line 49
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->c:Landroid/graphics/Paint;

    .line 53
    .line 54
    sget-object p3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 55
    .line 56
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 57
    .line 58
    .line 59
    new-instance p1, Landroid/graphics/Paint;

    .line 60
    .line 61
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 62
    .line 63
    .line 64
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->a:Landroid/graphics/Paint;

    .line 65
    .line 66
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->a:Landroid/graphics/Paint;

    .line 70
    .line 71
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->e:I

    .line 72
    .line 73
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->a:Landroid/graphics/Paint;

    .line 77
    .line 78
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 79
    .line 80
    .line 81
    new-instance p1, Landroid/graphics/Paint;

    .line 82
    .line 83
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 84
    .line 85
    .line 86
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->b:Landroid/graphics/Paint;

    .line 87
    .line 88
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->b:Landroid/graphics/Paint;

    .line 92
    .line 93
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->f:I

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->b:Landroid/graphics/Paint;

    .line 99
    .line 100
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 101
    .line 102
    .line 103
    new-instance p1, Landroid/graphics/Paint;

    .line 104
    .line 105
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 106
    .line 107
    .line 108
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->d:Landroid/graphics/Paint;

    .line 109
    .line 110
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 111
    .line 112
    .line 113
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->d:Landroid/graphics/Paint;

    .line 114
    .line 115
    const-string p2, "#FFFFFF"

    .line 116
    .line 117
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    move-result p2

    .line 121
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->d:Landroid/graphics/Paint;

    .line 125
    .line 126
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 127
    .line 128
    .line 129
    new-instance p1, Landroid/graphics/RectF;

    .line 130
    .line 131
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 132
    .line 133
    .line 134
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->i:Landroid/graphics/RectF;

    .line 135
    .line 136
    const/4 p2, 0x0

    .line 137
    iput p2, p1, Landroid/graphics/RectF;->left:F

    .line 138
    .line 139
    iput p2, p1, Landroid/graphics/RectF;->top:F

    .line 140
    .line 141
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->g:I

    .line 142
    .line 143
    int-to-float p2, p2

    .line 144
    iput p2, p1, Landroid/graphics/RectF;->right:F

    .line 145
    .line 146
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->h:I

    .line 147
    .line 148
    int-to-float p0, p0

    .line 149
    iput p0, p1, Landroid/graphics/RectF;->bottom:F

    .line 150
    .line 151
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;)Landroid/graphics/Paint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->c:Landroid/graphics/Paint;

    return-object p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->j:F

    return-void
.end method

.method public static getCurState()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->m:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public c()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->l:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x2

    .line 7
    new-array v1, v0, [F

    .line 8
    .line 9
    fill-array-data v1, :array_0

    .line 10
    .line 11
    .line 12
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    new-instance v2, Landroid/view/animation/AccelerateInterpolator;

    .line 17
    .line 18
    invoke-direct {v2}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 22
    .line 23
    .line 24
    new-instance v2, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView$d;

    .line 25
    .line 26
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView$d;-><init>(Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 30
    .line 31
    .line 32
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->e:I

    .line 33
    .line 34
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->f:I

    .line 35
    .line 36
    filled-new-array {v2, v3}, [I

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofArgb([I)Landroid/animation/ValueAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    new-instance v3, Landroid/view/animation/DecelerateInterpolator;

    .line 45
    .line 46
    invoke-direct {v3}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 50
    .line 51
    .line 52
    new-instance v3, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView$e;

    .line 53
    .line 54
    invoke-direct {v3, p0}, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView$e;-><init>(Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 58
    .line 59
    .line 60
    new-instance v3, Landroid/animation/AnimatorSet;

    .line 61
    .line 62
    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 63
    .line 64
    .line 65
    new-array v0, v0, [Landroid/animation/Animator;

    .line 66
    .line 67
    const/4 v4, 0x0

    .line 68
    aput-object v1, v0, v4

    .line 69
    .line 70
    const/4 v1, 0x1

    .line 71
    aput-object v2, v0, v1

    .line 72
    .line 73
    invoke-virtual {v3, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 74
    .line 75
    .line 76
    const-wide/16 v0, 0x320

    .line 77
    .line 78
    invoke-virtual {v3, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v3}, Landroid/animation/AnimatorSet;->start()V

    .line 82
    .line 83
    .line 84
    new-instance v0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView$f;

    .line 85
    .line 86
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView$f;-><init>(Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v3, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :array_0
    .array-data 4
        0x42c80000    # 100.0f
        0x0
    .end array-data
.end method

.method public d()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->k:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x2

    .line 7
    new-array v1, v0, [F

    .line 8
    .line 9
    fill-array-data v1, :array_0

    .line 10
    .line 11
    .line 12
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    new-instance v2, Landroid/view/animation/AccelerateInterpolator;

    .line 17
    .line 18
    invoke-direct {v2}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 22
    .line 23
    .line 24
    new-instance v2, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView$a;

    .line 25
    .line 26
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView$a;-><init>(Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 30
    .line 31
    .line 32
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->e:I

    .line 33
    .line 34
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->f:I

    .line 35
    .line 36
    filled-new-array {v2, v3}, [I

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofArgb([I)Landroid/animation/ValueAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    new-instance v3, Landroid/view/animation/DecelerateInterpolator;

    .line 45
    .line 46
    invoke-direct {v3}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 50
    .line 51
    .line 52
    new-instance v3, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView$b;

    .line 53
    .line 54
    invoke-direct {v3, p0}, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView$b;-><init>(Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 58
    .line 59
    .line 60
    new-instance v3, Landroid/animation/AnimatorSet;

    .line 61
    .line 62
    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 63
    .line 64
    .line 65
    new-array v0, v0, [Landroid/animation/Animator;

    .line 66
    .line 67
    const/4 v4, 0x0

    .line 68
    aput-object v1, v0, v4

    .line 69
    .line 70
    const/4 v1, 0x1

    .line 71
    aput-object v2, v0, v1

    .line 72
    .line 73
    invoke-virtual {v3, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 74
    .line 75
    .line 76
    const-wide/16 v0, 0x320

    .line 77
    .line 78
    invoke-virtual {v3, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v3}, Landroid/animation/AnimatorSet;->start()V

    .line 82
    .line 83
    .line 84
    new-instance v0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView$c;

    .line 85
    .line 86
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView$c;-><init>(Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v3, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :array_0
    .array-data 4
        0x42c80000    # 100.0f
        0x0
    .end array-data
.end method

.method public e(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->m:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->k:Z

    .line 11
    .line 12
    if-nez v0, :cond_3

    .line 13
    .line 14
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->l:Z

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    const-string v0, "open"

    .line 20
    .line 21
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    sput-object p1, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->m:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->c()V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_2
    const-string v0, "close"

    .line 34
    .line 35
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_3

    .line 40
    .line 41
    sput-object p1, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->m:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->d()V

    .line 44
    .line 45
    .line 46
    :cond_3
    :goto_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 6
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->m:Ljava/lang/String;

    .line 5
    .line 6
    const-string v1, "open"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/high16 v1, 0x41300000    # 11.0f

    .line 13
    .line 14
    const/high16 v2, 0x41700000    # 15.0f

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->i:Landroid/graphics/RectF;

    .line 19
    .line 20
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    int-to-float v3, v3

    .line 25
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    int-to-float v4, v4

    .line 30
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->a:Landroid/graphics/Paint;

    .line 31
    .line 32
    invoke-virtual {p1, v0, v3, v4, v5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 33
    .line 34
    .line 35
    const/high16 v0, 0x41f80000    # 31.0f

    .line 36
    .line 37
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    int-to-float v0, v0

    .line 42
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    int-to-float v2, v2

    .line 47
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    int-to-float v1, v1

    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->d:Landroid/graphics/Paint;

    .line 53
    .line 54
    invoke-virtual {p1, v0, v2, v1, p0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->m:Ljava/lang/String;

    .line 59
    .line 60
    const-string v3, "close"

    .line 61
    .line 62
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->i:Landroid/graphics/RectF;

    .line 67
    .line 68
    if-eqz v0, :cond_1

    .line 69
    .line 70
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    int-to-float v0, v0

    .line 75
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    int-to-float v4, v4

    .line 80
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->b:Landroid/graphics/Paint;

    .line 81
    .line 82
    invoke-virtual {p1, v3, v0, v4, v5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    int-to-float v0, v0

    .line 90
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    int-to-float v2, v2

    .line 95
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    int-to-float v1, v1

    .line 100
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->d:Landroid/graphics/Paint;

    .line 101
    .line 102
    invoke-virtual {p1, v0, v2, v1, p0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_1
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    int-to-float v0, v0

    .line 111
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    int-to-float v1, v1

    .line 116
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->c:Landroid/graphics/Paint;

    .line 117
    .line 118
    invoke-virtual {p1, v3, v0, v1, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 119
    .line 120
    .line 121
    const/high16 v0, 0x41800000    # 16.0f

    .line 122
    .line 123
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    int-to-float v0, v0

    .line 128
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->j:F

    .line 129
    .line 130
    mul-float/2addr v0, v1

    .line 131
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    int-to-float v1, v1

    .line 136
    add-float/2addr v0, v1

    .line 137
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    int-to-float v1, v1

    .line 142
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 143
    .line 144
    .line 145
    move-result v2

    .line 146
    int-to-float v2, v2

    .line 147
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->d:Landroid/graphics/Paint;

    .line 148
    .line 149
    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 150
    .line 151
    .line 152
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->g:I

    .line 2
    .line 3
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->h:I

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
