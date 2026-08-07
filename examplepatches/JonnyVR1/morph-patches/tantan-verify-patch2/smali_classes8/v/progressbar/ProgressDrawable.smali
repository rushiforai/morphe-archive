.class public Lv/progressbar/ProgressDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/drawable/Animatable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lv/progressbar/ProgressDrawable$Style;,
        Lv/progressbar/ProgressDrawable$j;,
        Lv/progressbar/ProgressDrawable$i;
    }
.end annotation


# static fields
.field public static final A:Landroid/view/animation/Interpolator;

.field public static final B:Landroid/view/animation/Interpolator;

.field public static final y:Landroid/animation/ArgbEvaluator;

.field public static final z:Landroid/view/animation/Interpolator;


# instance fields
.field public final a:F

.field public final b:Landroid/graphics/RectF;

.field public c:Landroid/animation/ValueAnimator;

.field public d:Landroid/animation/ValueAnimator;

.field public e:Landroid/animation/ValueAnimator;

.field public f:Landroid/animation/ValueAnimator;

.field public g:Z

.field public h:Landroid/graphics/Paint;

.field public i:Z

.field public j:I

.field public k:I

.field public l:F

.field public m:F

.field public n:F

.field public o:F

.field public p:Landroid/view/animation/Interpolator;

.field public q:Landroid/view/animation/Interpolator;

.field public r:F

.field public s:[I

.field public t:F

.field public u:F

.field public v:I

.field public w:I

.field public x:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/animation/ArgbEvaluator;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/ArgbEvaluator;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lv/progressbar/ProgressDrawable;->y:Landroid/animation/ArgbEvaluator;

    .line 7
    .line 8
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lv/progressbar/ProgressDrawable;->z:Landroid/view/animation/Interpolator;

    .line 14
    .line 15
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    .line 16
    .line 17
    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lv/progressbar/ProgressDrawable;->A:Landroid/view/animation/Interpolator;

    .line 21
    .line 22
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    .line 23
    .line 24
    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lv/progressbar/ProgressDrawable;->B:Landroid/view/animation/Interpolator;

    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>([IFFFFIILv/progressbar/ProgressDrawable$Style;Landroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/RectF;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lv/progressbar/ProgressDrawable;->b:Landroid/graphics/RectF;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lv/progressbar/ProgressDrawable;->m:F

    .line 13
    .line 14
    iput v0, p0, Lv/progressbar/ProgressDrawable;->n:F

    .line 15
    .line 16
    const/high16 v0, 0x3f800000    # 1.0f

    .line 17
    .line 18
    iput v0, p0, Lv/progressbar/ProgressDrawable;->o:F

    .line 19
    .line 20
    iput-object p10, p0, Lv/progressbar/ProgressDrawable;->q:Landroid/view/animation/Interpolator;

    .line 21
    .line 22
    iput-object p9, p0, Lv/progressbar/ProgressDrawable;->p:Landroid/view/animation/Interpolator;

    .line 23
    .line 24
    iput p2, p0, Lv/progressbar/ProgressDrawable;->r:F

    .line 25
    .line 26
    iput p3, p0, Lv/progressbar/ProgressDrawable;->a:F

    .line 27
    .line 28
    const/4 p3, 0x0

    .line 29
    iput p3, p0, Lv/progressbar/ProgressDrawable;->k:I

    .line 30
    .line 31
    iput-object p1, p0, Lv/progressbar/ProgressDrawable;->s:[I

    .line 32
    .line 33
    aget p1, p1, p3

    .line 34
    .line 35
    iput p1, p0, Lv/progressbar/ProgressDrawable;->j:I

    .line 36
    .line 37
    iput p4, p0, Lv/progressbar/ProgressDrawable;->t:F

    .line 38
    .line 39
    iput p5, p0, Lv/progressbar/ProgressDrawable;->u:F

    .line 40
    .line 41
    iput p6, p0, Lv/progressbar/ProgressDrawable;->v:I

    .line 42
    .line 43
    iput p7, p0, Lv/progressbar/ProgressDrawable;->w:I

    .line 44
    .line 45
    new-instance p1, Landroid/graphics/Paint;

    .line 46
    .line 47
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object p1, p0, Lv/progressbar/ProgressDrawable;->h:Landroid/graphics/Paint;

    .line 51
    .line 52
    const/4 p4, 0x1

    .line 53
    invoke-virtual {p1, p4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lv/progressbar/ProgressDrawable;->h:Landroid/graphics/Paint;

    .line 57
    .line 58
    sget-object p4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 59
    .line 60
    invoke-virtual {p1, p4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Lv/progressbar/ProgressDrawable;->h:Landroid/graphics/Paint;

    .line 64
    .line 65
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lv/progressbar/ProgressDrawable;->h:Landroid/graphics/Paint;

    .line 69
    .line 70
    sget-object p2, Lv/progressbar/ProgressDrawable$Style;->ROUNDED:Lv/progressbar/ProgressDrawable$Style;

    .line 71
    .line 72
    if-ne p8, p2, :cond_0

    .line 73
    .line 74
    sget-object p2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_0
    sget-object p2, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    .line 78
    .line 79
    :goto_0
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Lv/progressbar/ProgressDrawable;->h:Landroid/graphics/Paint;

    .line 83
    .line 84
    iget-object p2, p0, Lv/progressbar/ProgressDrawable;->s:[I

    .line 85
    .line 86
    aget p2, p2, p3

    .line 87
    .line 88
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Lv/progressbar/ProgressDrawable;->E()V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public synthetic constructor <init>([IFFFFIILv/progressbar/ProgressDrawable$Style;Landroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;Ll/p4b0;)V
    .locals 0

    .line 95
    invoke-direct/range {p0 .. p10}, Lv/progressbar/ProgressDrawable;-><init>([IFFFFIILv/progressbar/ProgressDrawable$Style;Landroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;)V

    return-void
.end method

.method public static bridge synthetic a(Lv/progressbar/ProgressDrawable;)[I
    .locals 0

    .line 1
    iget-object p0, p0, Lv/progressbar/ProgressDrawable;->s:[I

    return-object p0
.end method

.method public static bridge synthetic b(Lv/progressbar/ProgressDrawable;)I
    .locals 0

    .line 1
    iget p0, p0, Lv/progressbar/ProgressDrawable;->j:I

    return p0
.end method

.method public static bridge synthetic c(Lv/progressbar/ProgressDrawable;)I
    .locals 0

    .line 1
    iget p0, p0, Lv/progressbar/ProgressDrawable;->k:I

    return p0
.end method

.method public static bridge synthetic d(Lv/progressbar/ProgressDrawable;)Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/progressbar/ProgressDrawable;->f:Landroid/animation/ValueAnimator;

    return-object p0
.end method

.method public static bridge synthetic e(Lv/progressbar/ProgressDrawable;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lv/progressbar/ProgressDrawable;->x:Z

    return p0
.end method

.method public static bridge synthetic f(Lv/progressbar/ProgressDrawable;)I
    .locals 0

    .line 1
    iget p0, p0, Lv/progressbar/ProgressDrawable;->w:I

    return p0
.end method

.method public static bridge synthetic g(Lv/progressbar/ProgressDrawable;)I
    .locals 0

    .line 1
    iget p0, p0, Lv/progressbar/ProgressDrawable;->v:I

    return p0
.end method

.method public static bridge synthetic h(Lv/progressbar/ProgressDrawable;)Lv/progressbar/ProgressDrawable$j;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x0

    return-object p0
.end method

.method public static bridge synthetic i(Lv/progressbar/ProgressDrawable;)Landroid/graphics/Paint;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/progressbar/ProgressDrawable;->h:Landroid/graphics/Paint;

    return-object p0
.end method

.method public static bridge synthetic j(Lv/progressbar/ProgressDrawable;)Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/progressbar/ProgressDrawable;->c:Landroid/animation/ValueAnimator;

    return-object p0
.end method

.method public static bridge synthetic k(Lv/progressbar/ProgressDrawable;)Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/progressbar/ProgressDrawable;->d:Landroid/animation/ValueAnimator;

    return-object p0
.end method

.method public static bridge synthetic l(Lv/progressbar/ProgressDrawable;I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/progressbar/ProgressDrawable;->j:I

    return-void
.end method

.method public static bridge synthetic m(Lv/progressbar/ProgressDrawable;I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/progressbar/ProgressDrawable;->k:I

    return-void
.end method

.method public static bridge synthetic n(Lv/progressbar/ProgressDrawable;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lv/progressbar/ProgressDrawable;->x:Z

    return-void
.end method

.method public static bridge synthetic o(Lv/progressbar/ProgressDrawable;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lv/progressbar/ProgressDrawable;->g:Z

    return-void
.end method

.method public static bridge synthetic p(Lv/progressbar/ProgressDrawable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lv/progressbar/ProgressDrawable;->z()V

    return-void
.end method

.method public static bridge synthetic q(Lv/progressbar/ProgressDrawable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lv/progressbar/ProgressDrawable;->C()V

    return-void
.end method

.method public static bridge synthetic r(Lv/progressbar/ProgressDrawable;F)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/progressbar/ProgressDrawable;->D(F)V

    return-void
.end method

.method public static bridge synthetic s()Landroid/animation/ArgbEvaluator;
    .locals 1

    .line 1
    sget-object v0, Lv/progressbar/ProgressDrawable;->y:Landroid/animation/ArgbEvaluator;

    return-object v0
.end method

.method public static bridge synthetic t()Landroid/view/animation/Interpolator;
    .locals 1

    .line 1
    sget-object v0, Lv/progressbar/ProgressDrawable;->A:Landroid/view/animation/Interpolator;

    return-object v0
.end method

.method public static bridge synthetic u()Landroid/view/animation/Interpolator;
    .locals 1

    .line 1
    sget-object v0, Lv/progressbar/ProgressDrawable;->B:Landroid/view/animation/Interpolator;

    return-object v0
.end method


# virtual methods
.method public A(F)V
    .locals 0

    .line 1
    iput p1, p0, Lv/progressbar/ProgressDrawable;->n:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public B(F)V
    .locals 0

    .line 1
    iput p1, p0, Lv/progressbar/ProgressDrawable;->l:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final C()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lv/progressbar/ProgressDrawable;->g:Z

    .line 3
    .line 4
    iget v0, p0, Lv/progressbar/ProgressDrawable;->m:F

    .line 5
    .line 6
    iget v1, p0, Lv/progressbar/ProgressDrawable;->w:I

    .line 7
    .line 8
    rsub-int v1, v1, 0x168

    .line 9
    .line 10
    int-to-float v1, v1

    .line 11
    add-float/2addr v0, v1

    .line 12
    iput v0, p0, Lv/progressbar/ProgressDrawable;->m:F

    .line 13
    .line 14
    return-void
.end method

.method public final D(F)V
    .locals 0

    .line 1
    iput p1, p0, Lv/progressbar/ProgressDrawable;->o:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final E()V
    .locals 8

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [F

    .line 3
    .line 4
    fill-array-data v1, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iput-object v1, p0, Lv/progressbar/ProgressDrawable;->e:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    iget-object v2, p0, Lv/progressbar/ProgressDrawable;->p:Landroid/view/animation/Interpolator;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lv/progressbar/ProgressDrawable;->e:Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    const/high16 v2, 0x44fa0000    # 2000.0f

    .line 21
    .line 22
    iget v3, p0, Lv/progressbar/ProgressDrawable;->u:F

    .line 23
    .line 24
    div-float/2addr v2, v3

    .line 25
    float-to-long v2, v2

    .line 26
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lv/progressbar/ProgressDrawable;->e:Landroid/animation/ValueAnimator;

    .line 30
    .line 31
    new-instance v2, Lv/progressbar/ProgressDrawable$a;

    .line 32
    .line 33
    invoke-direct {v2, p0}, Lv/progressbar/ProgressDrawable$a;-><init>(Lv/progressbar/ProgressDrawable;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lv/progressbar/ProgressDrawable;->e:Landroid/animation/ValueAnimator;

    .line 40
    .line 41
    const/4 v2, -0x1

    .line 42
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lv/progressbar/ProgressDrawable;->e:Landroid/animation/ValueAnimator;

    .line 46
    .line 47
    const/4 v2, 0x1

    .line 48
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 49
    .line 50
    .line 51
    iget v1, p0, Lv/progressbar/ProgressDrawable;->v:I

    .line 52
    .line 53
    int-to-float v1, v1

    .line 54
    iget v3, p0, Lv/progressbar/ProgressDrawable;->w:I

    .line 55
    .line 56
    int-to-float v3, v3

    .line 57
    new-array v4, v0, [F

    .line 58
    .line 59
    const/4 v5, 0x0

    .line 60
    aput v1, v4, v5

    .line 61
    .line 62
    aput v3, v4, v2

    .line 63
    .line 64
    invoke-static {v4}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iput-object v1, p0, Lv/progressbar/ProgressDrawable;->c:Landroid/animation/ValueAnimator;

    .line 69
    .line 70
    iget-object v3, p0, Lv/progressbar/ProgressDrawable;->q:Landroid/view/animation/Interpolator;

    .line 71
    .line 72
    invoke-virtual {v1, v3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 73
    .line 74
    .line 75
    iget-object v1, p0, Lv/progressbar/ProgressDrawable;->c:Landroid/animation/ValueAnimator;

    .line 76
    .line 77
    iget v3, p0, Lv/progressbar/ProgressDrawable;->t:F

    .line 78
    .line 79
    const/high16 v4, 0x44160000    # 600.0f

    .line 80
    .line 81
    div-float v3, v4, v3

    .line 82
    .line 83
    float-to-long v6, v3

    .line 84
    invoke-virtual {v1, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 85
    .line 86
    .line 87
    iget-object v1, p0, Lv/progressbar/ProgressDrawable;->c:Landroid/animation/ValueAnimator;

    .line 88
    .line 89
    new-instance v3, Lv/progressbar/ProgressDrawable$b;

    .line 90
    .line 91
    invoke-direct {v3, p0}, Lv/progressbar/ProgressDrawable$b;-><init>(Lv/progressbar/ProgressDrawable;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 95
    .line 96
    .line 97
    iget-object v1, p0, Lv/progressbar/ProgressDrawable;->c:Landroid/animation/ValueAnimator;

    .line 98
    .line 99
    new-instance v3, Lv/progressbar/ProgressDrawable$c;

    .line 100
    .line 101
    invoke-direct {v3, p0}, Lv/progressbar/ProgressDrawable$c;-><init>(Lv/progressbar/ProgressDrawable;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v1, v3}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 105
    .line 106
    .line 107
    iget v1, p0, Lv/progressbar/ProgressDrawable;->w:I

    .line 108
    .line 109
    int-to-float v1, v1

    .line 110
    iget v3, p0, Lv/progressbar/ProgressDrawable;->v:I

    .line 111
    .line 112
    int-to-float v3, v3

    .line 113
    new-array v6, v0, [F

    .line 114
    .line 115
    aput v1, v6, v5

    .line 116
    .line 117
    aput v3, v6, v2

    .line 118
    .line 119
    invoke-static {v6}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    iput-object v1, p0, Lv/progressbar/ProgressDrawable;->d:Landroid/animation/ValueAnimator;

    .line 124
    .line 125
    iget-object v2, p0, Lv/progressbar/ProgressDrawable;->q:Landroid/view/animation/Interpolator;

    .line 126
    .line 127
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 128
    .line 129
    .line 130
    iget-object v1, p0, Lv/progressbar/ProgressDrawable;->d:Landroid/animation/ValueAnimator;

    .line 131
    .line 132
    iget v2, p0, Lv/progressbar/ProgressDrawable;->t:F

    .line 133
    .line 134
    div-float/2addr v4, v2

    .line 135
    float-to-long v2, v4

    .line 136
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 137
    .line 138
    .line 139
    iget-object v1, p0, Lv/progressbar/ProgressDrawable;->d:Landroid/animation/ValueAnimator;

    .line 140
    .line 141
    new-instance v2, Lv/progressbar/ProgressDrawable$d;

    .line 142
    .line 143
    invoke-direct {v2, p0}, Lv/progressbar/ProgressDrawable$d;-><init>(Lv/progressbar/ProgressDrawable;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 147
    .line 148
    .line 149
    iget-object v1, p0, Lv/progressbar/ProgressDrawable;->d:Landroid/animation/ValueAnimator;

    .line 150
    .line 151
    new-instance v2, Lv/progressbar/ProgressDrawable$e;

    .line 152
    .line 153
    invoke-direct {v2, p0}, Lv/progressbar/ProgressDrawable$e;-><init>(Lv/progressbar/ProgressDrawable;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v1, v2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 157
    .line 158
    .line 159
    new-array v0, v0, [F

    .line 160
    .line 161
    fill-array-data v0, :array_1

    .line 162
    .line 163
    .line 164
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    iput-object v0, p0, Lv/progressbar/ProgressDrawable;->f:Landroid/animation/ValueAnimator;

    .line 169
    .line 170
    sget-object v1, Lv/progressbar/ProgressDrawable;->z:Landroid/view/animation/Interpolator;

    .line 171
    .line 172
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 173
    .line 174
    .line 175
    iget-object v0, p0, Lv/progressbar/ProgressDrawable;->f:Landroid/animation/ValueAnimator;

    .line 176
    .line 177
    const-wide/16 v1, 0xc8

    .line 178
    .line 179
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 180
    .line 181
    .line 182
    iget-object v0, p0, Lv/progressbar/ProgressDrawable;->f:Landroid/animation/ValueAnimator;

    .line 183
    .line 184
    new-instance v1, Lv/progressbar/ProgressDrawable$f;

    .line 185
    .line 186
    invoke-direct {v1, p0}, Lv/progressbar/ProgressDrawable$f;-><init>(Lv/progressbar/ProgressDrawable;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 190
    .line 191
    .line 192
    iget-object v0, p0, Lv/progressbar/ProgressDrawable;->f:Landroid/animation/ValueAnimator;

    .line 193
    .line 194
    new-instance v1, Lv/progressbar/ProgressDrawable$g;

    .line 195
    .line 196
    invoke-direct {v1, p0}, Lv/progressbar/ProgressDrawable$g;-><init>(Lv/progressbar/ProgressDrawable;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 200
    .line 201
    .line 202
    return-void

    .line 203
    :array_0
    .array-data 4
        0x0
        0x43b40000    # 360.0f
    .end array-data

    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final F()V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/progressbar/ProgressDrawable;->e:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lv/progressbar/ProgressDrawable;->c:Landroid/animation/ValueAnimator;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lv/progressbar/ProgressDrawable;->d:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lv/progressbar/ProgressDrawable;->f:Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 9

    .line 1
    iget v0, p0, Lv/progressbar/ProgressDrawable;->n:F

    .line 2
    .line 3
    iget v1, p0, Lv/progressbar/ProgressDrawable;->m:F

    .line 4
    .line 5
    sub-float/2addr v0, v1

    .line 6
    iget v1, p0, Lv/progressbar/ProgressDrawable;->l:F

    .line 7
    .line 8
    iget-boolean v2, p0, Lv/progressbar/ProgressDrawable;->g:Z

    .line 9
    .line 10
    const/high16 v3, 0x43b40000    # 360.0f

    .line 11
    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    sub-float v2, v3, v1

    .line 15
    .line 16
    add-float/2addr v0, v2

    .line 17
    :cond_0
    rem-float/2addr v0, v3

    .line 18
    iget v2, p0, Lv/progressbar/ProgressDrawable;->o:F

    .line 19
    .line 20
    const/high16 v4, 0x3f800000    # 1.0f

    .line 21
    .line 22
    cmpg-float v4, v2, v4

    .line 23
    .line 24
    if-gez v4, :cond_1

    .line 25
    .line 26
    mul-float/2addr v2, v1

    .line 27
    sub-float/2addr v1, v2

    .line 28
    add-float/2addr v0, v1

    .line 29
    rem-float/2addr v0, v3

    .line 30
    move v6, v2

    .line 31
    :goto_0
    move v5, v0

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    move v6, v1

    .line 34
    goto :goto_0

    .line 35
    :goto_1
    iget-object v4, p0, Lv/progressbar/ProgressDrawable;->b:Landroid/graphics/RectF;

    .line 36
    .line 37
    const/4 v7, 0x0

    .line 38
    iget-object v8, p0, Lv/progressbar/ProgressDrawable;->h:Landroid/graphics/Paint;

    .line 39
    .line 40
    move-object v3, p1

    .line 41
    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public getOpacity()I
    .locals 0

    const/4 p0, -0x3

    return p0
.end method

.method public isRunning()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lv/progressbar/ProgressDrawable;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method public onBoundsChange(Landroid/graphics/Rect;)V
    .locals 5

    .line 1
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lv/progressbar/ProgressDrawable;->a:F

    .line 5
    .line 6
    const/high16 v1, -0x40800000    # -1.0f

    .line 7
    .line 8
    cmpl-float v0, v0, v1

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    int-to-float v0, v0

    .line 17
    iget v1, p0, Lv/progressbar/ProgressDrawable;->a:F

    .line 18
    .line 19
    mul-float/2addr v0, v1

    .line 20
    iput v0, p0, Lv/progressbar/ProgressDrawable;->r:F

    .line 21
    .line 22
    iget-object v1, p0, Lv/progressbar/ProgressDrawable;->h:Landroid/graphics/Paint;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Lv/progressbar/ProgressDrawable;->b:Landroid/graphics/RectF;

    .line 28
    .line 29
    iget v1, p1, Landroid/graphics/Rect;->left:I

    .line 30
    .line 31
    int-to-float v1, v1

    .line 32
    iget p0, p0, Lv/progressbar/ProgressDrawable;->r:F

    .line 33
    .line 34
    const/high16 v2, 0x40000000    # 2.0f

    .line 35
    .line 36
    div-float v3, p0, v2

    .line 37
    .line 38
    add-float/2addr v1, v3

    .line 39
    const/high16 v3, 0x3f000000    # 0.5f

    .line 40
    .line 41
    add-float/2addr v1, v3

    .line 42
    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 43
    .line 44
    iget v1, p1, Landroid/graphics/Rect;->right:I

    .line 45
    .line 46
    int-to-float v1, v1

    .line 47
    div-float v4, p0, v2

    .line 48
    .line 49
    sub-float/2addr v1, v4

    .line 50
    sub-float/2addr v1, v3

    .line 51
    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 52
    .line 53
    iget v1, p1, Landroid/graphics/Rect;->top:I

    .line 54
    .line 55
    int-to-float v1, v1

    .line 56
    div-float v4, p0, v2

    .line 57
    .line 58
    add-float/2addr v1, v4

    .line 59
    add-float/2addr v1, v3

    .line 60
    iput v1, v0, Landroid/graphics/RectF;->top:F

    .line 61
    .line 62
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 63
    .line 64
    int-to-float p1, p1

    .line 65
    div-float/2addr p0, v2

    .line 66
    sub-float/2addr p1, p0

    .line 67
    sub-float/2addr p1, v3

    .line 68
    iput p1, v0, Landroid/graphics/RectF;->bottom:F

    .line 69
    .line 70
    return-void
.end method

.method public setAlpha(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/progressbar/ProgressDrawable;->h:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/progressbar/ProgressDrawable;->h:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public start()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lv/progressbar/ProgressDrawable;->isRunning()Z

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
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lv/progressbar/ProgressDrawable;->i:Z

    .line 10
    .line 11
    invoke-virtual {p0}, Lv/progressbar/ProgressDrawable;->y()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lv/progressbar/ProgressDrawable;->e:Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lv/progressbar/ProgressDrawable;->c:Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public stop()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lv/progressbar/ProgressDrawable;->isRunning()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lv/progressbar/ProgressDrawable;->i:Z

    .line 10
    .line 11
    invoke-virtual {p0}, Lv/progressbar/ProgressDrawable;->F()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public v([I)V
    .locals 1

    .line 1
    iput-object p1, p0, Lv/progressbar/ProgressDrawable;->s:[I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget p1, p1, v0

    .line 5
    .line 6
    iput p1, p0, Lv/progressbar/ProgressDrawable;->j:I

    .line 7
    .line 8
    return-void
.end method

.method public w()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lv/progressbar/ProgressDrawable;->x(Lv/progressbar/ProgressDrawable$j;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public x(Lv/progressbar/ProgressDrawable$j;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lv/progressbar/ProgressDrawable;->isRunning()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    iget-object p1, p0, Lv/progressbar/ProgressDrawable;->f:Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p1, p0, Lv/progressbar/ProgressDrawable;->f:Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    new-instance v0, Lv/progressbar/ProgressDrawable$h;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Lv/progressbar/ProgressDrawable$h;-><init>(Lv/progressbar/ProgressDrawable;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lv/progressbar/ProgressDrawable;->f:Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_0
    return-void
.end method

.method public final y()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lv/progressbar/ProgressDrawable;->x:Z

    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput v0, p0, Lv/progressbar/ProgressDrawable;->o:F

    .line 7
    .line 8
    iget-object v0, p0, Lv/progressbar/ProgressDrawable;->h:Landroid/graphics/Paint;

    .line 9
    .line 10
    iget p0, p0, Lv/progressbar/ProgressDrawable;->j:I

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final z()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lv/progressbar/ProgressDrawable;->g:Z

    .line 3
    .line 4
    iget v0, p0, Lv/progressbar/ProgressDrawable;->m:F

    .line 5
    .line 6
    iget v1, p0, Lv/progressbar/ProgressDrawable;->v:I

    .line 7
    .line 8
    int-to-float v1, v1

    .line 9
    add-float/2addr v0, v1

    .line 10
    iput v0, p0, Lv/progressbar/ProgressDrawable;->m:F

    .line 11
    .line 12
    return-void
.end method
