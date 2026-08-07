.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;
    }
.end annotation


# instance fields
.field public A:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

.field public a:F

.field public b:F

.field public c:F

.field public d:Landroid/net/Uri;

.field public e:I

.field public f:I

.field public g:Ll/rsw;

.field public h:I

.field public i:I

.field public j:Landroid/graphics/RectF;

.field public k:Landroid/graphics/drawable/Drawable;

.field public l:F

.field public m:F

.field public n:F

.field public o:F

.field public p:F

.field public q:Landroid/graphics/RectF;

.field public r:Landroid/view/GestureDetector;

.field public s:Landroid/view/ScaleGestureDetector;

.field public t:F

.field public u:Landroid/animation/ValueAnimator;

.field public v:Z

.field public w:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;

.field public x:Ll/x20;

.field public y:Landroid/view/GestureDetector$OnGestureListener;

.field public z:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f100000    # 0.5625f

    .line 5
    .line 6
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->a:F

    .line 7
    .line 8
    const v0, 0x3ff47ae1    # 1.91f

    .line 9
    .line 10
    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->b:F

    .line 12
    .line 13
    const/high16 v0, 0x3f800000    # 1.0f

    .line 14
    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->c:F

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->d:Landroid/net/Uri;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->g:Ll/rsw;

    .line 21
    .line 22
    new-instance v1, Landroid/graphics/RectF;

    .line 23
    .line 24
    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->j:Landroid/graphics/RectF;

    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->k:Landroid/graphics/drawable/Drawable;

    .line 30
    .line 31
    new-instance v1, Landroid/graphics/RectF;

    .line 32
    .line 33
    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->q:Landroid/graphics/RectF;

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->v:Z

    .line 40
    .line 41
    new-instance v2, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$c;

    .line 42
    .line 43
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$c;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)V

    .line 44
    .line 45
    .line 46
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->y:Landroid/view/GestureDetector$OnGestureListener;

    .line 47
    .line 48
    new-instance v2, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$d;

    .line 49
    .line 50
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$d;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)V

    .line 51
    .line 52
    .line 53
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->z:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    .line 54
    .line 55
    new-instance v2, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$e;

    .line 56
    .line 57
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$e;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)V

    .line 58
    .line 59
    .line 60
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->A:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    .line 61
    .line 62
    invoke-virtual {p0, p1, v0, v1, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->D(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 66
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 v0, 0x3f100000    # 0.5625f

    .line 67
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->a:F

    const v0, 0x3ff47ae1    # 1.91f

    .line 68
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->b:F

    const/high16 v0, 0x3f800000    # 1.0f

    .line 69
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->c:F

    const/4 v0, 0x0

    .line 70
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->d:Landroid/net/Uri;

    .line 71
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->g:Ll/rsw;

    .line 72
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->j:Landroid/graphics/RectF;

    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->k:Landroid/graphics/drawable/Drawable;

    .line 74
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->q:Landroid/graphics/RectF;

    const/4 v0, 0x0

    .line 75
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->v:Z

    .line 76
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$c;

    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$c;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)V

    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->y:Landroid/view/GestureDetector$OnGestureListener;

    .line 77
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$d;

    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$d;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)V

    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->z:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    .line 78
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$e;

    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$e;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)V

    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->A:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    .line 79
    invoke-virtual {p0, p1, p2, v0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->D(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 80
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 v0, 0x3f100000    # 0.5625f

    .line 81
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->a:F

    const v0, 0x3ff47ae1    # 1.91f

    .line 82
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->b:F

    const/high16 v0, 0x3f800000    # 1.0f

    .line 83
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->c:F

    const/4 v0, 0x0

    .line 84
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->d:Landroid/net/Uri;

    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->g:Ll/rsw;

    .line 86
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->j:Landroid/graphics/RectF;

    .line 87
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->k:Landroid/graphics/drawable/Drawable;

    .line 88
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->q:Landroid/graphics/RectF;

    const/4 v0, 0x0

    .line 89
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->v:Z

    .line 90
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$c;

    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$c;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)V

    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->y:Landroid/view/GestureDetector$OnGestureListener;

    .line 91
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$d;

    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$d;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)V

    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->z:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    .line 92
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$e;

    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$e;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)V

    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->A:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    .line 93
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->D(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 94
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/high16 v0, 0x3f100000    # 0.5625f

    .line 95
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->a:F

    const v0, 0x3ff47ae1    # 1.91f

    .line 96
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->b:F

    const/high16 v0, 0x3f800000    # 1.0f

    .line 97
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->c:F

    const/4 v0, 0x0

    .line 98
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->d:Landroid/net/Uri;

    .line 99
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->g:Ll/rsw;

    .line 100
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->j:Landroid/graphics/RectF;

    .line 101
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->k:Landroid/graphics/drawable/Drawable;

    .line 102
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->q:Landroid/graphics/RectF;

    const/4 v0, 0x0

    .line 103
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->v:Z

    .line 104
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$c;

    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$c;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)V

    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->y:Landroid/view/GestureDetector$OnGestureListener;

    .line 105
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$d;

    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$d;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)V

    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->z:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    .line 106
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$e;

    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$e;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)V

    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->A:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    .line 107
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->D(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->H()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->o:F

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->p:F

    return p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->l:F

    return p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->q:Landroid/graphics/RectF;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->m:F

    return p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->n:F

    return p0
.end method

.method private getDisplayDrawableHeight()F
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->l:F

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->f:I

    .line 4
    .line 5
    int-to-float p0, p0

    .line 6
    mul-float/2addr v0, p0

    .line 7
    return v0
.end method

.method private getDisplayDrawableWidth()F
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->l:F

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->e:I

    .line 4
    .line 5
    int-to-float p0, p0

    .line 6
    mul-float/2addr v0, p0

    .line 7
    return v0
.end method

.method private getDrawableScaleToFitWithValidRatio()F
    .locals 6

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->getImageSizeRatio()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->E(F)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->h:I

    .line 12
    .line 13
    int-to-float v1, v0

    .line 14
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->i:I

    .line 15
    .line 16
    int-to-float v3, v2

    .line 17
    div-float/2addr v1, v3

    .line 18
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->e:I

    .line 19
    .line 20
    int-to-float v4, v3

    .line 21
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->f:I

    .line 22
    .line 23
    int-to-float v5, p0

    .line 24
    div-float/2addr v4, v5

    .line 25
    cmpl-float v1, v4, v1

    .line 26
    .line 27
    if-lez v1, :cond_0

    .line 28
    .line 29
    int-to-float p0, v0

    .line 30
    int-to-float v0, v3

    .line 31
    div-float/2addr p0, v0

    .line 32
    return p0

    .line 33
    :cond_0
    int-to-float v0, v2

    .line 34
    :goto_0
    int-to-float p0, p0

    .line 35
    div-float/2addr v0, p0

    .line 36
    return v0

    .line 37
    :cond_1
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->a:F

    .line 38
    .line 39
    cmpg-float v0, v0, v1

    .line 40
    .line 41
    if-gez v0, :cond_2

    .line 42
    .line 43
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->h:I

    .line 44
    .line 45
    int-to-float v0, v0

    .line 46
    const/high16 v1, 0x3f100000    # 0.5625f

    .line 47
    .line 48
    mul-float/2addr v0, v1

    .line 49
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->e:I

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->i:I

    .line 53
    .line 54
    int-to-float v0, v0

    .line 55
    const v1, 0x3ff47ae1    # 1.91f

    .line 56
    .line 57
    .line 58
    div-float/2addr v0, v1

    .line 59
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->f:I

    .line 60
    .line 61
    goto :goto_0
.end method

.method private getDrawableScaleToFitWithView()F
    .locals 6

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->h:I

    .line 2
    .line 3
    int-to-float v1, v0

    .line 4
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->i:I

    .line 5
    .line 6
    int-to-float v3, v2

    .line 7
    div-float/2addr v1, v3

    .line 8
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->e:I

    .line 9
    .line 10
    int-to-float v4, v3

    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->f:I

    .line 12
    .line 13
    int-to-float v5, p0

    .line 14
    div-float/2addr v4, v5

    .line 15
    cmpl-float v1, v4, v1

    .line 16
    .line 17
    if-lez v1, :cond_0

    .line 18
    .line 19
    int-to-float v0, v2

    .line 20
    int-to-float p0, p0

    .line 21
    div-float/2addr v0, p0

    .line 22
    return v0

    .line 23
    :cond_0
    int-to-float p0, v0

    .line 24
    int-to-float v0, v3

    .line 25
    div-float/2addr p0, v0

    .line 26
    return p0
.end method

.method private getImageSizeRatio()F
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->e:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->f:I

    .line 5
    .line 6
    int-to-float p0, p0

    .line 7
    div-float/2addr v0, p0

    .line 8
    return v0
.end method

.method private getMaximumAllowedScale()F
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->e:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->f:I

    .line 5
    .line 6
    int-to-float v1, v1

    .line 7
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->h:I

    .line 8
    .line 9
    int-to-float v2, v2

    .line 10
    div-float/2addr v0, v2

    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->i:I

    .line 12
    .line 13
    int-to-float p0, p0

    .line 14
    div-float/2addr v1, p0

    .line 15
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method private getMinimumAllowedScale()F
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->v:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->getDrawableScaleToFitWithView()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->getDrawableScaleToFitWithValidRatio()F

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->o:F

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->p:F

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->k:Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->f:I

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->e:I

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->m:F

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->n:F

    return-void
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;FF)F
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->x(FF)F

    move-result p0

    return p0
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;FF)F
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->y(FF)F

    move-result p0

    return p0
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;Landroid/graphics/RectF;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->C(Landroid/graphics/RectF;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)F
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->I()F

    move-result p0

    return p0
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;Landroid/graphics/RectF;)F
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->J(Landroid/graphics/RectF;)F

    move-result p0

    return p0
.end method

.method private setDrawableScale(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->l:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private setGridBounds(Landroid/graphics/RectF;)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->j:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget v0, p1, Landroid/graphics/RectF;->left:F

    .line 4
    .line 5
    float-to-int v0, v0

    .line 6
    int-to-float v0, v0

    .line 7
    iget v1, p1, Landroid/graphics/RectF;->top:F

    .line 8
    .line 9
    float-to-int v1, v1

    .line 10
    int-to-float v1, v1

    .line 11
    iget v2, p1, Landroid/graphics/RectF;->right:F

    .line 12
    .line 13
    float-to-int v2, v2

    .line 14
    int-to-float v2, v2

    .line 15
    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    .line 16
    .line 17
    float-to-int p1, p1

    .line 18
    int-to-float p1, p1

    .line 19
    invoke-virtual {p0, v0, v1, v2, p1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;Landroid/graphics/RectF;)F
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->K(Landroid/graphics/RectF;)F

    move-result p0

    return p0
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->M()V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;FFF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->T(FFF)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->V()V

    return-void
.end method


# virtual methods
.method public final A()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->k:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->k:Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->G(II)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public final B()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->g:Ll/rsw;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/rsw;->e()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->g:Ll/rsw;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/rsw;->d()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->G(II)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public final C(Landroid/graphics/RectF;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->o:F

    .line 2
    .line 3
    iput v0, p1, Landroid/graphics/RectF;->left:F

    .line 4
    .line 5
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->p:F

    .line 6
    .line 7
    iput v1, p1, Landroid/graphics/RectF;->top:F

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->getDisplayDrawableWidth()F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    add-float/2addr v0, v1

    .line 14
    iput v0, p1, Landroid/graphics/RectF;->right:F

    .line 15
    .line 16
    iget v0, p1, Landroid/graphics/RectF;->top:F

    .line 17
    .line 18
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->getDisplayDrawableHeight()F

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    add-float/2addr v0, p0

    .line 23
    iput v0, p1, Landroid/graphics/RectF;->bottom:F

    .line 24
    .line 25
    return-void
.end method

.method public final D(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 1
    new-instance p2, Landroid/view/GestureDetector;

    .line 2
    .line 3
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->y:Landroid/view/GestureDetector$OnGestureListener;

    .line 4
    .line 5
    invoke-direct {p2, p1, p3}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 6
    .line 7
    .line 8
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->r:Landroid/view/GestureDetector;

    .line 9
    .line 10
    new-instance p2, Landroid/view/ScaleGestureDetector;

    .line 11
    .line 12
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->z:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    .line 13
    .line 14
    invoke-direct {p2, p1, p3}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    .line 15
    .line 16
    .line 17
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->s:Landroid/view/ScaleGestureDetector;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    .line 28
    .line 29
    const/high16 p2, 0x43100000    # 144.0f

    .line 30
    .line 31
    mul-float/2addr p1, p2

    .line 32
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->t:F

    .line 33
    .line 34
    new-instance p1, Landroid/animation/ValueAnimator;

    .line 35
    .line 36
    invoke-direct {p1}, Landroid/animation/ValueAnimator;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->u:Landroid/animation/ValueAnimator;

    .line 40
    .line 41
    const-wide/16 p2, 0x190

    .line 42
    .line 43
    invoke-virtual {p1, p2, p3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->u:Landroid/animation/ValueAnimator;

    .line 47
    .line 48
    const/4 p2, 0x2

    .line 49
    new-array p2, p2, [F

    .line 50
    .line 51
    fill-array-data p2, :array_0

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->u:Landroid/animation/ValueAnimator;

    .line 58
    .line 59
    new-instance p2, Landroid/view/animation/DecelerateInterpolator;

    .line 60
    .line 61
    const/high16 p3, 0x3e800000    # 0.25f

    .line 62
    .line 63
    invoke-direct {p2, p3}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->u:Landroid/animation/ValueAnimator;

    .line 70
    .line 71
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->A:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    .line 72
    .line 73
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->u:Landroid/animation/ValueAnimator;

    .line 77
    .line 78
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$a;

    .line 79
    .line 80
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final E(F)Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->a:F

    .line 2
    .line 3
    cmpl-float v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_0

    .line 6
    .line 7
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->b:F

    .line 8
    .line 9
    cmpg-float p0, p1, p0

    .line 10
    .line 11
    if-gtz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final F()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->g:Ll/rsw;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final G(II)Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->h:I

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->i:I

    .line 4
    .line 5
    mul-int/2addr v0, p0

    .line 6
    mul-int/2addr p1, p2

    .line 7
    int-to-float p0, v0

    .line 8
    int-to-float p1, p1

    .line 9
    div-float/2addr p0, p1

    .line 10
    const/high16 p1, 0x3f000000    # 0.5f

    .line 11
    .line 12
    cmpl-float p1, p0, p1

    .line 13
    .line 14
    if-ltz p1, :cond_0

    .line 15
    .line 16
    const/high16 p1, 0x40000000    # 2.0f

    .line 17
    .line 18
    cmpg-float p0, p0, p1

    .line 19
    .line 20
    if-gtz p0, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public final synthetic H()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->L()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final I()F
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->getMaximumAllowedScale()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->getMinimumAllowedScale()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    cmpg-float v2, v0, v1

    .line 10
    .line 11
    if-gez v2, :cond_0

    .line 12
    .line 13
    move v0, v1

    .line 14
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->l:F

    .line 15
    .line 16
    cmpg-float v2, p0, v1

    .line 17
    .line 18
    if-gez v2, :cond_1

    .line 19
    .line 20
    div-float/2addr p0, v1

    .line 21
    return p0

    .line 22
    :cond_1
    cmpl-float v1, p0, v0

    .line 23
    .line 24
    if-lez v1, :cond_2

    .line 25
    .line 26
    div-float/2addr p0, v0

    .line 27
    return p0

    .line 28
    :cond_2
    const/high16 p0, 0x3f800000    # 1.0f

    .line 29
    .line 30
    return p0
.end method

.method public final J(Landroid/graphics/RectF;)F
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->h:I

    .line 6
    .line 7
    int-to-float v2, v1

    .line 8
    cmpg-float v0, v0, v2

    .line 9
    .line 10
    if-gtz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->h:I

    .line 17
    .line 18
    div-int/lit8 p0, p0, 0x2

    .line 19
    .line 20
    int-to-float p0, p0

    .line 21
    :goto_0
    sub-float/2addr p1, p0

    .line 22
    return p1

    .line 23
    :cond_0
    iget p0, p1, Landroid/graphics/RectF;->left:F

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    cmpg-float v2, p0, v0

    .line 27
    .line 28
    if-gtz v2, :cond_1

    .line 29
    .line 30
    iget v2, p1, Landroid/graphics/RectF;->right:F

    .line 31
    .line 32
    int-to-float v3, v1

    .line 33
    cmpl-float v2, v2, v3

    .line 34
    .line 35
    if-ltz v2, :cond_1

    .line 36
    .line 37
    return v0

    .line 38
    :cond_1
    cmpg-float v2, p0, v0

    .line 39
    .line 40
    iget p1, p1, Landroid/graphics/RectF;->right:F

    .line 41
    .line 42
    if-gez v2, :cond_2

    .line 43
    .line 44
    int-to-float p0, v1

    .line 45
    goto :goto_0

    .line 46
    :cond_2
    int-to-float v1, v1

    .line 47
    cmpl-float p1, p1, v1

    .line 48
    .line 49
    if-lez p1, :cond_3

    .line 50
    .line 51
    return p0

    .line 52
    :cond_3
    return v0
.end method

.method public final K(Landroid/graphics/RectF;)F
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->i:I

    .line 6
    .line 7
    int-to-float v2, v1

    .line 8
    cmpg-float v0, v0, v2

    .line 9
    .line 10
    if-gez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerY()F

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->i:I

    .line 17
    .line 18
    div-int/lit8 p0, p0, 0x2

    .line 19
    .line 20
    int-to-float p0, p0

    .line 21
    :goto_0
    sub-float/2addr p1, p0

    .line 22
    return p1

    .line 23
    :cond_0
    iget p0, p1, Landroid/graphics/RectF;->top:F

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    cmpg-float v2, p0, v0

    .line 27
    .line 28
    if-gtz v2, :cond_1

    .line 29
    .line 30
    iget v2, p1, Landroid/graphics/RectF;->bottom:F

    .line 31
    .line 32
    int-to-float v3, v1

    .line 33
    cmpl-float v2, v2, v3

    .line 34
    .line 35
    if-ltz v2, :cond_1

    .line 36
    .line 37
    return v0

    .line 38
    :cond_1
    cmpg-float v2, p0, v0

    .line 39
    .line 40
    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    .line 41
    .line 42
    if-gez v2, :cond_2

    .line 43
    .line 44
    int-to-float p0, v1

    .line 45
    goto :goto_0

    .line 46
    :cond_2
    int-to-float v1, v1

    .line 47
    cmpl-float p1, p1, v1

    .line 48
    .line 49
    if-lez p1, :cond_3

    .line 50
    .line 51
    return p0

    .line 52
    :cond_3
    return v0
.end method

.method public L()V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->d:Landroid/net/Uri;

    .line 4
    .line 5
    if-eqz v1, :cond_14

    .line 6
    .line 7
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->k:Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    iget v1, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->e:I

    .line 12
    .line 13
    const/4 v2, -0x1

    .line 14
    if-eq v1, v2, :cond_0

    .line 15
    .line 16
    iget v1, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->f:I

    .line 17
    .line 18
    if-ne v1, v2, :cond_1

    .line 19
    .line 20
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->u:Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_2

    .line 27
    .line 28
    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    new-instance v2, Ll/tvm;

    .line 33
    .line 34
    invoke-direct {v2, v0}, Ll/tvm;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)V

    .line 35
    .line 36
    .line 37
    const-wide/16 v3, 0xc8

    .line 38
    .line 39
    invoke-static {v1, v2, v3, v4}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    const/16 v1, 0x438

    .line 44
    .line 45
    const/high16 v2, -0x80000000

    .line 46
    .line 47
    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    const/4 v3, 0x0

    .line 52
    invoke-static {v3, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    iget-object v5, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->j:Landroid/graphics/RectF;

    .line 57
    .line 58
    iget v6, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->o:F

    .line 59
    .line 60
    neg-float v6, v6

    .line 61
    iget v7, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->p:F

    .line 62
    .line 63
    neg-float v7, v7

    .line 64
    invoke-virtual {v5, v6, v7}, Landroid/graphics/RectF;->offset(FF)V

    .line 65
    .line 66
    .line 67
    iget-object v6, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->q:Landroid/graphics/RectF;

    .line 68
    .line 69
    invoke-virtual {v0, v6}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->C(Landroid/graphics/RectF;)V

    .line 70
    .line 71
    .line 72
    iget v6, v5, Landroid/graphics/RectF;->left:F

    .line 73
    .line 74
    iget-object v7, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->q:Landroid/graphics/RectF;

    .line 75
    .line 76
    invoke-virtual {v7}, Landroid/graphics/RectF;->width()F

    .line 77
    .line 78
    .line 79
    move-result v7

    .line 80
    div-float/2addr v6, v7

    .line 81
    iget v7, v5, Landroid/graphics/RectF;->top:F

    .line 82
    .line 83
    iget-object v8, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->q:Landroid/graphics/RectF;

    .line 84
    .line 85
    invoke-virtual {v8}, Landroid/graphics/RectF;->height()F

    .line 86
    .line 87
    .line 88
    move-result v8

    .line 89
    div-float/2addr v7, v8

    .line 90
    iget v8, v5, Landroid/graphics/RectF;->right:F

    .line 91
    .line 92
    iget-object v9, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->q:Landroid/graphics/RectF;

    .line 93
    .line 94
    invoke-virtual {v9}, Landroid/graphics/RectF;->width()F

    .line 95
    .line 96
    .line 97
    move-result v9

    .line 98
    div-float/2addr v8, v9

    .line 99
    iget v5, v5, Landroid/graphics/RectF;->bottom:F

    .line 100
    .line 101
    iget-object v9, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->q:Landroid/graphics/RectF;

    .line 102
    .line 103
    invoke-virtual {v9}, Landroid/graphics/RectF;->height()F

    .line 104
    .line 105
    .line 106
    move-result v9

    .line 107
    div-float/2addr v5, v9

    .line 108
    iget v9, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->e:I

    .line 109
    .line 110
    int-to-float v9, v9

    .line 111
    mul-float/2addr v6, v9

    .line 112
    float-to-int v6, v6

    .line 113
    invoke-static {v3, v6}, Ljava/lang/Math;->max(II)I

    .line 114
    .line 115
    .line 116
    move-result v14

    .line 117
    iget v6, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->f:I

    .line 118
    .line 119
    int-to-float v6, v6

    .line 120
    mul-float/2addr v7, v6

    .line 121
    float-to-int v6, v7

    .line 122
    invoke-static {v3, v6}, Ljava/lang/Math;->max(II)I

    .line 123
    .line 124
    .line 125
    move-result v15

    .line 126
    iget v3, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->e:I

    .line 127
    .line 128
    int-to-float v6, v3

    .line 129
    mul-float/2addr v8, v6

    .line 130
    float-to-int v6, v8

    .line 131
    invoke-static {v3, v6}, Ljava/lang/Math;->min(II)I

    .line 132
    .line 133
    .line 134
    move-result v16

    .line 135
    iget v3, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->f:I

    .line 136
    .line 137
    int-to-float v6, v3

    .line 138
    mul-float/2addr v5, v6

    .line 139
    float-to-int v5, v5

    .line 140
    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    .line 141
    .line 142
    .line 143
    move-result v17

    .line 144
    sub-int v3, v16, v14

    .line 145
    .line 146
    sub-int v5, v17, v15

    .line 147
    .line 148
    int-to-float v6, v3

    .line 149
    int-to-float v7, v5

    .line 150
    div-float/2addr v6, v7

    .line 151
    iget v7, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->a:F

    .line 152
    .line 153
    cmpg-float v8, v6, v7

    .line 154
    .line 155
    if-gez v8, :cond_3

    .line 156
    .line 157
    move v6, v7

    .line 158
    :cond_3
    iget v7, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->b:F

    .line 159
    .line 160
    cmpl-float v8, v6, v7

    .line 161
    .line 162
    if-lez v8, :cond_4

    .line 163
    .line 164
    move v6, v7

    .line 165
    :cond_4
    invoke-static {v1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 166
    .line 167
    .line 168
    move-result v7

    .line 169
    invoke-static {v1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    invoke-static {v4}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 174
    .line 175
    .line 176
    move-result v8

    .line 177
    invoke-static {v4}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 178
    .line 179
    .line 180
    move-result v4

    .line 181
    const/high16 v9, 0x40000000    # 2.0f

    .line 182
    .line 183
    if-eq v7, v2, :cond_c

    .line 184
    .line 185
    if-eqz v7, :cond_9

    .line 186
    .line 187
    if-eq v7, v9, :cond_5

    .line 188
    .line 189
    goto :goto_2

    .line 190
    :cond_5
    if-eq v8, v2, :cond_8

    .line 191
    .line 192
    if-eqz v8, :cond_7

    .line 193
    .line 194
    if-eq v8, v9, :cond_6

    .line 195
    .line 196
    goto :goto_0

    .line 197
    :cond_6
    move v5, v4

    .line 198
    goto :goto_0

    .line 199
    :cond_7
    int-to-float v2, v1

    .line 200
    div-float/2addr v2, v6

    .line 201
    float-to-int v5, v2

    .line 202
    goto :goto_0

    .line 203
    :cond_8
    int-to-float v2, v1

    .line 204
    div-float/2addr v2, v6

    .line 205
    float-to-int v2, v2

    .line 206
    invoke-static {v4, v2}, Ljava/lang/Math;->min(II)I

    .line 207
    .line 208
    .line 209
    move-result v5

    .line 210
    :goto_0
    move/from16 v18, v1

    .line 211
    .line 212
    :goto_1
    move/from16 v19, v5

    .line 213
    .line 214
    goto :goto_5

    .line 215
    :cond_9
    if-eq v8, v2, :cond_b

    .line 216
    .line 217
    if-eq v8, v9, :cond_a

    .line 218
    .line 219
    goto :goto_2

    .line 220
    :cond_a
    int-to-float v1, v4

    .line 221
    mul-float/2addr v1, v6

    .line 222
    float-to-int v3, v1

    .line 223
    move/from16 v18, v3

    .line 224
    .line 225
    move/from16 v19, v4

    .line 226
    .line 227
    goto :goto_5

    .line 228
    :cond_b
    if-gt v5, v4, :cond_a

    .line 229
    .line 230
    :goto_2
    move/from16 v18, v3

    .line 231
    .line 232
    goto :goto_1

    .line 233
    :cond_c
    if-eq v8, v2, :cond_10

    .line 234
    .line 235
    if-eqz v8, :cond_e

    .line 236
    .line 237
    if-eq v8, v9, :cond_d

    .line 238
    .line 239
    goto :goto_2

    .line 240
    :cond_d
    int-to-float v2, v4

    .line 241
    mul-float/2addr v2, v6

    .line 242
    float-to-int v2, v2

    .line 243
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 244
    .line 245
    .line 246
    move-result v3

    .line 247
    :goto_3
    move v5, v4

    .line 248
    goto :goto_2

    .line 249
    :cond_e
    if-gt v3, v1, :cond_f

    .line 250
    .line 251
    goto :goto_2

    .line 252
    :cond_f
    int-to-float v2, v1

    .line 253
    div-float/2addr v2, v6

    .line 254
    float-to-int v5, v2

    .line 255
    move v3, v1

    .line 256
    goto :goto_2

    .line 257
    :cond_10
    if-gt v3, v1, :cond_11

    .line 258
    .line 259
    if-gt v5, v4, :cond_11

    .line 260
    .line 261
    goto :goto_2

    .line 262
    :cond_11
    int-to-float v2, v1

    .line 263
    int-to-float v3, v4

    .line 264
    div-float v5, v2, v3

    .line 265
    .line 266
    cmpl-float v5, v5, v6

    .line 267
    .line 268
    if-nez v5, :cond_12

    .line 269
    .line 270
    :goto_4
    move v3, v1

    .line 271
    goto :goto_3

    .line 272
    :cond_12
    if-lez v5, :cond_13

    .line 273
    .line 274
    mul-float/2addr v3, v6

    .line 275
    float-to-int v1, v3

    .line 276
    goto :goto_4

    .line 277
    :cond_13
    div-float/2addr v2, v6

    .line 278
    float-to-int v2, v2

    .line 279
    move v3, v1

    .line 280
    move v5, v2

    .line 281
    goto :goto_2

    .line 282
    :goto_5
    new-instance v9, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;

    .line 283
    .line 284
    iget-object v10, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->d:Landroid/net/Uri;

    .line 285
    .line 286
    iget v11, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->l:F

    .line 287
    .line 288
    iget v12, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->o:F

    .line 289
    .line 290
    iget v13, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->p:F

    .line 291
    .line 292
    invoke-direct/range {v9 .. v19}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;-><init>(Landroid/net/Uri;FFFIIIIII)V

    .line 293
    .line 294
    .line 295
    iput-object v9, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->w:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;

    .line 296
    .line 297
    return-void

    .line 298
    :cond_14
    const-string v0, "Image uri is not set."

    .line 299
    .line 300
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    return-void
.end method

.method public final M()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->w:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->v:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->w:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->P(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->O()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final N()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->h:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->getDisplayDrawableWidth()F

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    sub-float/2addr v0, v1

    .line 9
    const/high16 v1, 0x40000000    # 2.0f

    .line 10
    .line 11
    div-float/2addr v0, v1

    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->o:F

    .line 13
    .line 14
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->i:I

    .line 15
    .line 16
    int-to-float v0, v0

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->getDisplayDrawableHeight()F

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    sub-float/2addr v0, v2

    .line 22
    div-float/2addr v0, v1

    .line 23
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->p:F

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final O()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->u:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->u:Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->v:Z

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->Q()V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->R()V

    .line 23
    .line 24
    .line 25
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->N()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->V()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->L()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final P(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->u:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->u:Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget v0, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;->b:F

    .line 15
    .line 16
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->setDrawableScale(F)V

    .line 17
    .line 18
    .line 19
    iget v0, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;->c:F

    .line 20
    .line 21
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->o:F

    .line 22
    .line 23
    iget p1, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;->d:F

    .line 24
    .line 25
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->p:F

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->V()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final Q()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->getDrawableScaleToFitWithView()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->setDrawableScale(F)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final R()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->getDrawableScaleToFitWithValidRatio()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->setDrawableScale(F)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public S(Landroid/net/Uri;Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->w:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->z()V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->d:Landroid/net/Uri;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->k:Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final T(FFF)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->q:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->C(Landroid/graphics/RectF;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->q:Landroid/graphics/RectF;

    .line 7
    .line 8
    iget v1, v0, Landroid/graphics/RectF;->left:F

    .line 9
    .line 10
    sub-float v1, p2, v1

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    div-float/2addr v1, v0

    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->q:Landroid/graphics/RectF;

    .line 18
    .line 19
    iget v2, v0, Landroid/graphics/RectF;->top:F

    .line 20
    .line 21
    sub-float v2, p3, v2

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    div-float/2addr v2, v0

    .line 28
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->l:F

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->q:Landroid/graphics/RectF;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->C(Landroid/graphics/RectF;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->q:Landroid/graphics/RectF;

    .line 36
    .line 37
    iget v0, p1, Landroid/graphics/RectF;->left:F

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    mul-float/2addr v1, p1

    .line 44
    add-float/2addr v0, v1

    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->q:Landroid/graphics/RectF;

    .line 46
    .line 47
    iget v1, p1, Landroid/graphics/RectF;->top:F

    .line 48
    .line 49
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    mul-float/2addr v2, p1

    .line 54
    add-float/2addr v1, v2

    .line 55
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->o:F

    .line 56
    .line 57
    sub-float/2addr p2, v0

    .line 58
    add-float/2addr p1, p2

    .line 59
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->o:F

    .line 60
    .line 61
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->p:F

    .line 62
    .line 63
    sub-float/2addr p3, v1

    .line 64
    add-float/2addr p1, p3

    .line 65
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->p:F

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->V()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final U()V
    .locals 6

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$b;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->d:Landroid/net/Uri;

    .line 8
    .line 9
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->h:I

    .line 10
    .line 11
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->i:I

    .line 12
    .line 13
    move-object v1, p0

    .line 14
    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$b;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;Landroid/content/Context;Landroid/net/Uri;II)V

    .line 15
    .line 16
    .line 17
    iput-object v0, v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->g:Ll/rsw;

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    new-array p0, p0, [Ljava/lang/Void;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final V()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->q:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->C(Landroid/graphics/RectF;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->q:Landroid/graphics/RectF;

    .line 7
    .line 8
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->h:I

    .line 9
    .line 10
    int-to-float v1, v1

    .line 11
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->i:I

    .line 12
    .line 13
    int-to-float v2, v2

    .line 14
    const/4 v3, 0x0

    .line 15
    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;->intersect(FFFF)Z

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->q:Landroid/graphics/RectF;

    .line 19
    .line 20
    iget v1, v0, Landroid/graphics/RectF;->left:F

    .line 21
    .line 22
    iget v2, v0, Landroid/graphics/RectF;->top:F

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->q:Landroid/graphics/RectF;

    .line 29
    .line 30
    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->q:Landroid/graphics/RectF;

    .line 35
    .line 36
    add-float/2addr v0, v1

    .line 37
    add-float/2addr v3, v2

    .line 38
    invoke-virtual {v4, v1, v2, v0, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->q:Landroid/graphics/RectF;

    .line 42
    .line 43
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->setGridBounds(Landroid/graphics/RectF;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 5

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->k:Landroid/graphics/drawable/Drawable;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->q:Landroid/graphics/RectF;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->C(Landroid/graphics/RectF;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->k:Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->q:Landroid/graphics/RectF;

    .line 17
    .line 18
    iget v2, v1, Landroid/graphics/RectF;->left:F

    .line 19
    .line 20
    float-to-int v2, v2

    .line 21
    iget v3, v1, Landroid/graphics/RectF;->top:F

    .line 22
    .line 23
    float-to-int v3, v3

    .line 24
    iget v4, v1, Landroid/graphics/RectF;->right:F

    .line 25
    .line 26
    float-to-int v4, v4

    .line 27
    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    .line 28
    .line 29
    float-to-int v1, v1

    .line 30
    invoke-virtual {v0, v2, v3, v4, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->k:Landroid/graphics/drawable/Drawable;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    sub-int/2addr p4, p2

    .line 5
    iput p4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->h:I

    .line 6
    .line 7
    sub-int/2addr p5, p3

    .line 8
    iput p5, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->i:I

    .line 9
    .line 10
    if-eqz p4, :cond_5

    .line 11
    .line 12
    if-nez p5, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->d:Landroid/net/Uri;

    .line 16
    .line 17
    if-nez p1, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->A()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->z()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->F()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_4

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->B()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_3

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->z()V

    .line 44
    .line 45
    .line 46
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->U()V

    .line 47
    .line 48
    .line 49
    :cond_5
    :goto_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 6

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    const/high16 v2, 0x40000000    # 2.0f

    .line 18
    .line 19
    const/4 v3, 0x1

    .line 20
    const/high16 v4, -0x80000000

    .line 21
    .line 22
    if-eq v0, v4, :cond_7

    .line 23
    .line 24
    if-eqz v0, :cond_3

    .line 25
    .line 26
    if-eq v0, v2, :cond_0

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_0
    if-eq v1, v4, :cond_2

    .line 30
    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    if-eq v1, v2, :cond_d

    .line 34
    .line 35
    move p2, v3

    .line 36
    goto :goto_3

    .line 37
    :cond_1
    int-to-float p2, p1

    .line 38
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->c:F

    .line 39
    .line 40
    :goto_0
    div-float/2addr p2, v0

    .line 41
    float-to-int p2, p2

    .line 42
    goto :goto_3

    .line 43
    :cond_2
    int-to-float v0, p1

    .line 44
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->c:F

    .line 45
    .line 46
    div-float/2addr v0, v1

    .line 47
    float-to-int v0, v0

    .line 48
    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    goto :goto_3

    .line 53
    :cond_3
    if-eq v1, v4, :cond_6

    .line 54
    .line 55
    if-eqz v1, :cond_5

    .line 56
    .line 57
    if-eq v1, v2, :cond_4

    .line 58
    .line 59
    :goto_1
    move p1, v3

    .line 60
    move p2, p1

    .line 61
    goto :goto_3

    .line 62
    :cond_4
    int-to-float p1, p2

    .line 63
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->c:F

    .line 64
    .line 65
    :goto_2
    mul-float/2addr p1, v0

    .line 66
    float-to-int p1, p1

    .line 67
    goto :goto_3

    .line 68
    :cond_5
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->t:F

    .line 69
    .line 70
    float-to-int p2, p1

    .line 71
    float-to-int p1, p1

    .line 72
    move v5, p2

    .line 73
    move p2, p1

    .line 74
    move p1, v5

    .line 75
    goto :goto_3

    .line 76
    :cond_6
    int-to-float p1, p2

    .line 77
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->c:F

    .line 78
    .line 79
    goto :goto_2

    .line 80
    :cond_7
    if-eq v1, v4, :cond_a

    .line 81
    .line 82
    if-eqz v1, :cond_9

    .line 83
    .line 84
    if-eq v1, v2, :cond_8

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_8
    int-to-float v0, p2

    .line 88
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->c:F

    .line 89
    .line 90
    mul-float/2addr v0, v1

    .line 91
    float-to-int v0, v0

    .line 92
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    goto :goto_3

    .line 97
    :cond_9
    int-to-float p2, p1

    .line 98
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->c:F

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_a
    int-to-float v0, p1

    .line 102
    int-to-float v1, p2

    .line 103
    div-float v2, v0, v1

    .line 104
    .line 105
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->c:F

    .line 106
    .line 107
    cmpl-float v4, v2, v3

    .line 108
    .line 109
    if-nez v4, :cond_b

    .line 110
    .line 111
    goto :goto_3

    .line 112
    :cond_b
    cmpl-float v2, v2, v3

    .line 113
    .line 114
    if-lez v2, :cond_c

    .line 115
    .line 116
    mul-float/2addr v1, v3

    .line 117
    float-to-int p1, v1

    .line 118
    goto :goto_3

    .line 119
    :cond_c
    div-float/2addr v0, v3

    .line 120
    float-to-int p2, v0

    .line 121
    :cond_d
    :goto_3
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->k:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->r:Landroid/view/GestureDetector;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->s:Landroid/view/ScaleGestureDetector;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    const/4 v0, 0x1

    .line 22
    if-eq p1, v0, :cond_1

    .line 23
    .line 24
    const/4 v1, 0x3

    .line 25
    if-eq p1, v1, :cond_1

    .line 26
    .line 27
    const/4 v1, 0x4

    .line 28
    if-ne p1, v1, :cond_2

    .line 29
    .line 30
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->u:Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 33
    .line 34
    .line 35
    :cond_2
    return v0
.end method

.method public setFitView(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->v:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->O()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setImageUri(Landroid/net/Uri;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->S(Landroid/net/Uri;Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final x(FF)F
    .locals 2

    .line 1
    const/high16 p0, 0x3f800000    # 1.0f

    cmpl-float v0, p2, p0

    if-nez v0, :cond_0

    return p1

    :cond_0
    if-lez v0, :cond_1

    div-float p2, p0, p2

    :cond_1
    const v0, 0x3f333333    # 0.7f

    sub-float/2addr p2, v0

    const v0, 0x3e99999a    # 0.3f

    div-float/2addr p2, v0

    const/4 v0, 0x0

    cmpg-float v1, p2, v0

    if-gez v1, :cond_2

    move p2, v0

    :cond_2
    sub-float/2addr p0, p2

    div-float/2addr p0, p1

    add-float/2addr p2, p0

    mul-float/2addr p1, p2

    return p1
.end method

.method public final y(FF)F
    .locals 2

    .line 1
    mul-float v0, p2, p1

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    cmpg-float v0, v0, v1

    .line 5
    .line 6
    if-gtz v0, :cond_0

    .line 7
    .line 8
    return p1

    .line 9
    :cond_0
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->t:F

    .line 14
    .line 15
    div-float/2addr p2, p0

    .line 16
    float-to-double p0, p1

    .line 17
    float-to-double v0, p2

    .line 18
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    mul-double/2addr v0, p0

    .line 23
    sub-double/2addr p0, v0

    .line 24
    double-to-float p0, p0

    .line 25
    return p0
.end method

.method public final z()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->g:Ll/rsw;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->g:Ll/rsw;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->cancel(Z)Z

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->g:Ll/rsw;

    .line 17
    .line 18
    :cond_0
    return-void
.end method
