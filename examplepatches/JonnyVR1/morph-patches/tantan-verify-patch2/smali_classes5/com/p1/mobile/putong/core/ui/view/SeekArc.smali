.class public Lcom/p1/mobile/putong/core/ui/view/SeekArc;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/view/SeekArc$a;
    }
.end annotation


# static fields
.field public static B:I = -0x1


# instance fields
.field public A:Landroid/animation/ValueAnimator;

.field public final a:I

.field public b:Landroid/graphics/drawable/Drawable;

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:Z

.field public k:Z

.field public l:Z

.field public m:Z

.field public n:I

.field public o:F

.field public p:Landroid/graphics/RectF;

.field public q:Landroid/graphics/Paint;

.field public r:Landroid/graphics/Paint;

.field public s:I

.field public t:I

.field public u:I

.field public v:I

.field public w:D

.field public x:F

.field public y:Z

.field public z:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 58
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const/16 v0, -0x5a

    .line 59
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->a:I

    const/16 v0, 0x64

    .line 60
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->c:I

    const/4 v0, 0x0

    .line 61
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->d:I

    const/4 v1, 0x4

    .line 62
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->e:I

    const/4 v1, 0x2

    .line 63
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->f:I

    .line 64
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->g:I

    const/16 v1, 0x168

    .line 65
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->h:I

    .line 66
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->i:I

    .line 67
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->j:Z

    .line 68
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->k:Z

    const/4 v1, 0x1

    .line 69
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->l:Z

    .line 70
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->m:Z

    .line 71
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->n:I

    const/4 v2, 0x0

    .line 72
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->o:F

    .line 73
    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->p:Landroid/graphics/RectF;

    .line 74
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->z:Z

    const/4 v1, 0x0

    .line 75
    invoke-virtual {p0, p1, v1, v0}, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->d(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/16 v0, -0x5a

    .line 5
    .line 6
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->a:I

    .line 7
    .line 8
    const/16 v0, 0x64

    .line 9
    .line 10
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->c:I

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->d:I

    .line 14
    .line 15
    const/4 v1, 0x4

    .line 16
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->e:I

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->f:I

    .line 20
    .line 21
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->g:I

    .line 22
    .line 23
    const/16 v1, 0x168

    .line 24
    .line 25
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->h:I

    .line 26
    .line 27
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->i:I

    .line 28
    .line 29
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->j:Z

    .line 30
    .line 31
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->k:Z

    .line 32
    .line 33
    const/4 v1, 0x1

    .line 34
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->l:Z

    .line 35
    .line 36
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->m:Z

    .line 37
    .line 38
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->n:I

    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->o:F

    .line 42
    .line 43
    new-instance v0, Landroid/graphics/RectF;

    .line 44
    .line 45
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->p:Landroid/graphics/RectF;

    .line 49
    .line 50
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->z:Z

    .line 51
    .line 52
    sget v0, Ll/q8c0;->k:I

    .line 53
    .line 54
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->d(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 76
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/16 v0, -0x5a

    .line 77
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->a:I

    const/16 v0, 0x64

    .line 78
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->c:I

    const/4 v0, 0x0

    .line 79
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->d:I

    const/4 v1, 0x4

    .line 80
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->e:I

    const/4 v1, 0x2

    .line 81
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->f:I

    .line 82
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->g:I

    const/16 v1, 0x168

    .line 83
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->h:I

    .line 84
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->i:I

    .line 85
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->j:Z

    .line 86
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->k:Z

    const/4 v1, 0x1

    .line 87
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->l:Z

    .line 88
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->m:Z

    .line 89
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->n:I

    const/4 v0, 0x0

    .line 90
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->o:F

    .line 91
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->p:Landroid/graphics/RectF;

    .line 92
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->z:Z

    .line 93
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->d(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(D)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->k()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    float-to-double v0, v0

    .line 6
    mul-double/2addr v0, p1

    .line 7
    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    .line 8
    .line 9
    .line 10
    move-result-wide p1

    .line 11
    long-to-int p1, p1

    .line 12
    if-gez p1, :cond_0

    .line 13
    .line 14
    sget p1, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->B:I

    .line 15
    .line 16
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->c:I

    .line 17
    .line 18
    if-le p1, p0, :cond_1

    .line 19
    .line 20
    sget p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->B:I

    .line 21
    .line 22
    return p0

    .line 23
    :cond_1
    return p1
.end method

.method public final b(FF)D
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->s:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    sub-float/2addr p1, v0

    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->t:I

    .line 6
    .line 7
    int-to-float v0, v0

    .line 8
    sub-float/2addr p2, v0

    .line 9
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->l:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    neg-float p1, p1

    .line 15
    :goto_0
    float-to-double v0, p2

    .line 16
    float-to-double p1, p1

    .line 17
    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->atan2(DD)D

    .line 18
    .line 19
    .line 20
    move-result-wide p1

    .line 21
    const-wide v0, 0x3ff921fb54442d18L    # 1.5707963267948966

    .line 22
    .line 23
    .line 24
    .line 25
    .line 26
    add-double/2addr p1, v0

    .line 27
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->i:I

    .line 28
    .line 29
    int-to-double v0, v0

    .line 30
    invoke-static {v0, v1}, Ljava/lang/Math;->toRadians(D)D

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    sub-double/2addr p1, v0

    .line 35
    invoke-static {p1, p2}, Ljava/lang/Math;->toDegrees(D)D

    .line 36
    .line 37
    .line 38
    move-result-wide p1

    .line 39
    const-wide/16 v0, 0x0

    .line 40
    .line 41
    cmpg-double v0, p1, v0

    .line 42
    .line 43
    if-gez v0, :cond_1

    .line 44
    .line 45
    const-wide v0, 0x4076800000000000L    # 360.0

    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    add-double/2addr p1, v0

    .line 51
    :cond_1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->g:I

    .line 52
    .line 53
    int-to-double v0, p0

    .line 54
    sub-double/2addr p1, v0

    .line 55
    return-wide p1
.end method

.method public final c(FF)Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->s:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    sub-float/2addr p1, v0

    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->t:I

    .line 6
    .line 7
    int-to-float v0, v0

    .line 8
    sub-float/2addr p2, v0

    .line 9
    mul-float/2addr p1, p1

    .line 10
    mul-float/2addr p2, p2

    .line 11
    add-float/2addr p1, p2

    .line 12
    float-to-double p1, p1

    .line 13
    invoke-static {p1, p2}, Ljava/lang/Math;->sqrt(D)D

    .line 14
    .line 15
    .line 16
    move-result-wide p1

    .line 17
    double-to-float p1, p1

    .line 18
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->x:F

    .line 19
    .line 20
    cmpg-float p0, p1, p0

    .line 21
    .line 22
    if-gez p0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public final d(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 13
    .line 14
    const-string v1, "#66ffffff"

    .line 15
    .line 16
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->e:I

    .line 21
    .line 22
    int-to-float v2, v2

    .line 23
    mul-float/2addr v2, v0

    .line 24
    float-to-int v0, v2

    .line 25
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->e:I

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    const/high16 v2, -0x10000

    .line 29
    .line 30
    if-eqz p2, :cond_1

    .line 31
    .line 32
    sget-object v3, Ll/ohc0;->Q:[I

    .line 33
    .line 34
    invoke-virtual {p1, p2, v3, p3, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    sget p2, Ll/ohc0;->c0:I

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    if-eqz p2, :cond_0

    .line 45
    .line 46
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->b:Landroid/graphics/drawable/Drawable;

    .line 47
    .line 48
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    div-int/lit8 p2, p2, 0x2

    .line 53
    .line 54
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->b:Landroid/graphics/drawable/Drawable;

    .line 55
    .line 56
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 57
    .line 58
    .line 59
    move-result p3

    .line 60
    div-int/lit8 p3, p3, 0x2

    .line 61
    .line 62
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->b:Landroid/graphics/drawable/Drawable;

    .line 63
    .line 64
    neg-int v4, p3

    .line 65
    neg-int v5, p2

    .line 66
    invoke-virtual {v3, v4, v5, p3, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 67
    .line 68
    .line 69
    :cond_0
    sget p2, Ll/ohc0;->U:I

    .line 70
    .line 71
    iget p3, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->c:I

    .line 72
    .line 73
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->c:I

    .line 78
    .line 79
    sget p2, Ll/ohc0;->V:I

    .line 80
    .line 81
    iget p3, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->d:I

    .line 82
    .line 83
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->d:I

    .line 88
    .line 89
    sget p2, Ll/ohc0;->X:I

    .line 90
    .line 91
    iget p3, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->e:I

    .line 92
    .line 93
    int-to-float p3, p3

    .line 94
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 95
    .line 96
    .line 97
    move-result p2

    .line 98
    float-to-int p2, p2

    .line 99
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->e:I

    .line 100
    .line 101
    sget p2, Ll/ohc0;->e0:I

    .line 102
    .line 103
    iget p3, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->f:I

    .line 104
    .line 105
    int-to-float p3, p3

    .line 106
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 107
    .line 108
    .line 109
    move-result p2

    .line 110
    float-to-int p2, p2

    .line 111
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->f:I

    .line 112
    .line 113
    sget p2, Ll/ohc0;->a0:I

    .line 114
    .line 115
    iget p3, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->g:I

    .line 116
    .line 117
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 118
    .line 119
    .line 120
    move-result p2

    .line 121
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->g:I

    .line 122
    .line 123
    sget p2, Ll/ohc0;->b0:I

    .line 124
    .line 125
    iget p3, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->h:I

    .line 126
    .line 127
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 128
    .line 129
    .line 130
    move-result p2

    .line 131
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->h:I

    .line 132
    .line 133
    sget p2, Ll/ohc0;->Y:I

    .line 134
    .line 135
    iget p3, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->i:I

    .line 136
    .line 137
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 138
    .line 139
    .line 140
    move-result p2

    .line 141
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->i:I

    .line 142
    .line 143
    sget p2, Ll/ohc0;->Z:I

    .line 144
    .line 145
    iget-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->j:Z

    .line 146
    .line 147
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 148
    .line 149
    .line 150
    move-result p2

    .line 151
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->j:Z

    .line 152
    .line 153
    sget p2, Ll/ohc0;->d0:I

    .line 154
    .line 155
    iget-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->k:Z

    .line 156
    .line 157
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 158
    .line 159
    .line 160
    move-result p2

    .line 161
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->k:Z

    .line 162
    .line 163
    sget p2, Ll/ohc0;->R:I

    .line 164
    .line 165
    iget-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->l:Z

    .line 166
    .line 167
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 168
    .line 169
    .line 170
    move-result p2

    .line 171
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->l:Z

    .line 172
    .line 173
    sget p2, Ll/ohc0;->T:I

    .line 174
    .line 175
    iget-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->m:Z

    .line 176
    .line 177
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 178
    .line 179
    .line 180
    move-result p2

    .line 181
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->m:Z

    .line 182
    .line 183
    sget p2, Ll/ohc0;->S:I

    .line 184
    .line 185
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    sget p2, Ll/ohc0;->W:I

    .line 190
    .line 191
    invoke-virtual {p1, p2, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 192
    .line 193
    .line 194
    move-result v2

    .line 195
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 196
    .line 197
    .line 198
    :cond_1
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->d:I

    .line 199
    .line 200
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->c:I

    .line 201
    .line 202
    if-le p1, p2, :cond_2

    .line 203
    .line 204
    move p1, p2

    .line 205
    :cond_2
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->d:I

    .line 206
    .line 207
    if-gez p1, :cond_3

    .line 208
    .line 209
    move p1, v0

    .line 210
    :cond_3
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->d:I

    .line 211
    .line 212
    iget p3, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->h:I

    .line 213
    .line 214
    const/16 v3, 0x168

    .line 215
    .line 216
    if-le p3, v3, :cond_4

    .line 217
    .line 218
    move p3, v3

    .line 219
    :cond_4
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->h:I

    .line 220
    .line 221
    if-gez p3, :cond_5

    .line 222
    .line 223
    move p3, v0

    .line 224
    :cond_5
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->h:I

    .line 225
    .line 226
    int-to-float p1, p1

    .line 227
    int-to-float p2, p2

    .line 228
    div-float/2addr p1, p2

    .line 229
    int-to-float p2, p3

    .line 230
    mul-float/2addr p1, p2

    .line 231
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->o:F

    .line 232
    .line 233
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->g:I

    .line 234
    .line 235
    if-le p1, v3, :cond_6

    .line 236
    .line 237
    move p1, v0

    .line 238
    :cond_6
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->g:I

    .line 239
    .line 240
    if-gez p1, :cond_7

    .line 241
    .line 242
    goto :goto_0

    .line 243
    :cond_7
    move v0, p1

    .line 244
    :goto_0
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->g:I

    .line 245
    .line 246
    new-instance p1, Landroid/graphics/Paint;

    .line 247
    .line 248
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 249
    .line 250
    .line 251
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->q:Landroid/graphics/Paint;

    .line 252
    .line 253
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 254
    .line 255
    .line 256
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->q:Landroid/graphics/Paint;

    .line 257
    .line 258
    const/4 p2, 0x1

    .line 259
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 260
    .line 261
    .line 262
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->q:Landroid/graphics/Paint;

    .line 263
    .line 264
    sget-object p3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 265
    .line 266
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 267
    .line 268
    .line 269
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->q:Landroid/graphics/Paint;

    .line 270
    .line 271
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->f:I

    .line 272
    .line 273
    int-to-float v0, v0

    .line 274
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 275
    .line 276
    .line 277
    new-instance p1, Landroid/graphics/Paint;

    .line 278
    .line 279
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 280
    .line 281
    .line 282
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->r:Landroid/graphics/Paint;

    .line 283
    .line 284
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 285
    .line 286
    .line 287
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->r:Landroid/graphics/Paint;

    .line 288
    .line 289
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 290
    .line 291
    .line 292
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->r:Landroid/graphics/Paint;

    .line 293
    .line 294
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 295
    .line 296
    .line 297
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->r:Landroid/graphics/Paint;

    .line 298
    .line 299
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->e:I

    .line 300
    .line 301
    int-to-float p2, p2

    .line 302
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 303
    .line 304
    .line 305
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->j:Z

    .line 306
    .line 307
    if-eqz p1, :cond_8

    .line 308
    .line 309
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->q:Landroid/graphics/Paint;

    .line 310
    .line 311
    sget-object p2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 312
    .line 313
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 314
    .line 315
    .line 316
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->r:Landroid/graphics/Paint;

    .line 317
    .line 318
    invoke-virtual {p0, p2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 319
    .line 320
    .line 321
    :cond_8
    return-void
.end method

.method public drawableStateChanged()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->drawableStateChanged()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->b:Landroid/graphics/drawable/Drawable;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->b:Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 21
    .line 22
    .line 23
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final e(IZ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->i(IZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final f()V
    .locals 0

    .line 1
    return-void
.end method

.method public final g()V
    .locals 0

    .line 1
    return-void
.end method

.method public getArcColor()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->q:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/Paint;->getColor()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getArcRotation()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public getArcWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public getMax()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public getProgress()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public getProgressColor()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->r:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/Paint;->getColor()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getProgressWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public getStartAngle()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public getSweepAngle()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public final h(Landroid/view/MotionEvent;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->c(FF)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const/4 v0, 0x1

    .line 17
    invoke-virtual {p0, v0}, Landroid/view/View;->setPressed(Z)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->b(FF)D

    .line 29
    .line 30
    .line 31
    move-result-wide v1

    .line 32
    iput-wide v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->w:D

    .line 33
    .line 34
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->a(D)I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->e(IZ)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final i(IZ)V
    .locals 0

    .line 1
    sget p2, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->B:I

    .line 2
    .line 3
    if-ne p1, p2, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->c:I

    .line 7
    .line 8
    if-le p1, p2, :cond_1

    .line 9
    .line 10
    move p1, p2

    .line 11
    :cond_1
    if-gez p1, :cond_2

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    :cond_2
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->d:I

    .line 15
    .line 16
    int-to-float p1, p1

    .line 17
    int-to-float p2, p2

    .line 18
    div-float/2addr p1, p2

    .line 19
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->h:I

    .line 20
    .line 21
    int-to-float p2, p2

    .line 22
    mul-float/2addr p1, p2

    .line 23
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->o:F

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->j()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public isEnabled()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method public final j()V
    .locals 7

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->g:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->o:F

    .line 5
    .line 6
    add-float/2addr v0, v1

    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->i:I

    .line 8
    .line 9
    int-to-float v1, v1

    .line 10
    add-float/2addr v0, v1

    .line 11
    const/high16 v1, 0x42b40000    # 90.0f

    .line 12
    .line 13
    add-float/2addr v0, v1

    .line 14
    float-to-int v0, v0

    .line 15
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->n:I

    .line 16
    .line 17
    int-to-double v1, v1

    .line 18
    int-to-double v3, v0

    .line 19
    invoke-static {v3, v4}, Ljava/lang/Math;->toRadians(D)D

    .line 20
    .line 21
    .line 22
    move-result-wide v5

    .line 23
    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    .line 24
    .line 25
    .line 26
    move-result-wide v5

    .line 27
    mul-double/2addr v1, v5

    .line 28
    double-to-int v0, v1

    .line 29
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->u:I

    .line 30
    .line 31
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->n:I

    .line 32
    .line 33
    int-to-double v0, v0

    .line 34
    invoke-static {v3, v4}, Ljava/lang/Math;->toRadians(D)D

    .line 35
    .line 36
    .line 37
    move-result-wide v2

    .line 38
    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    .line 39
    .line 40
    .line 41
    move-result-wide v2

    .line 42
    mul-double/2addr v0, v2

    .line 43
    double-to-int v0, v0

    .line 44
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->v:I

    .line 45
    .line 46
    return-void
.end method

.method public final k()F
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->c:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->h:I

    .line 5
    .line 6
    int-to-float p0, p0

    .line 7
    div-float/2addr v0, p0

    .line 8
    return v0
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->A:Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 10

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->l:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->p:Landroid/graphics/RectF;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->p:Landroid/graphics/RectF;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/high16 v2, -0x40800000    # -1.0f

    .line 18
    .line 19
    const/high16 v3, 0x3f800000    # 1.0f

    .line 20
    .line 21
    invoke-virtual {p1, v2, v3, v0, v1}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->g:I

    .line 25
    .line 26
    add-int/lit8 v0, v0, -0x5a

    .line 27
    .line 28
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->i:I

    .line 29
    .line 30
    add-int/2addr v0, v1

    .line 31
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->h:I

    .line 32
    .line 33
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->p:Landroid/graphics/RectF;

    .line 34
    .line 35
    int-to-float v4, v0

    .line 36
    int-to-float v5, v1

    .line 37
    const/4 v6, 0x0

    .line 38
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->q:Landroid/graphics/Paint;

    .line 39
    .line 40
    move-object v2, p1

    .line 41
    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 42
    .line 43
    .line 44
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->p:Landroid/graphics/RectF;

    .line 45
    .line 46
    iget v7, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->o:F

    .line 47
    .line 48
    const/4 v8, 0x0

    .line 49
    iget-object v9, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->r:Landroid/graphics/Paint;

    .line 50
    .line 51
    move v6, v4

    .line 52
    move-object v4, v2

    .line 53
    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 54
    .line 55
    .line 56
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->m:Z

    .line 57
    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->y:Z

    .line 61
    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    :cond_1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->z:Z

    .line 65
    .line 66
    if-eqz p1, :cond_2

    .line 67
    .line 68
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->d:I

    .line 69
    .line 70
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->c:I

    .line 71
    .line 72
    if-ge p1, v0, :cond_3

    .line 73
    .line 74
    if-lez p1, :cond_3

    .line 75
    .line 76
    :cond_2
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->s:I

    .line 77
    .line 78
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->u:I

    .line 79
    .line 80
    sub-int/2addr p1, v0

    .line 81
    int-to-float p1, p1

    .line 82
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->t:I

    .line 83
    .line 84
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->v:I

    .line 85
    .line 86
    sub-int/2addr v0, v1

    .line 87
    int-to-float v0, v0

    .line 88
    invoke-virtual {v2, p1, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->b:Landroid/graphics/drawable/Drawable;

    .line 92
    .line 93
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-eqz p1, :cond_3

    .line 98
    .line 99
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->b:Landroid/graphics/drawable/Drawable;

    .line 100
    .line 101
    invoke-virtual {p0, v2}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 102
    .line 103
    .line 104
    :cond_3
    return-void
.end method

.method public onMeasure(II)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getSuggestedMinimumHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0, p2}, Landroid/view/View;->getDefaultSize(II)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getSuggestedMinimumWidth()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {v1, p1}, Landroid/view/View;->getDefaultSize(II)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    int-to-float v3, v1

    .line 22
    const/high16 v4, 0x3f000000    # 0.5f

    .line 23
    .line 24
    mul-float/2addr v3, v4

    .line 25
    float-to-int v3, v3

    .line 26
    iput v3, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->s:I

    .line 27
    .line 28
    int-to-float v3, v0

    .line 29
    mul-float/2addr v3, v4

    .line 30
    float-to-int v3, v3

    .line 31
    iput v3, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->t:I

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    sub-int/2addr v2, v3

    .line 38
    div-int/lit8 v3, v2, 0x2

    .line 39
    .line 40
    iput v3, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->n:I

    .line 41
    .line 42
    div-int/lit8 v0, v0, 0x2

    .line 43
    .line 44
    sub-int/2addr v0, v3

    .line 45
    int-to-float v0, v0

    .line 46
    div-int/lit8 v1, v1, 0x2

    .line 47
    .line 48
    sub-int/2addr v1, v3

    .line 49
    int-to-float v1, v1

    .line 50
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->p:Landroid/graphics/RectF;

    .line 51
    .line 52
    int-to-float v2, v2

    .line 53
    add-float v4, v1, v2

    .line 54
    .line 55
    add-float/2addr v2, v0

    .line 56
    invoke-virtual {v3, v1, v0, v4, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 57
    .line 58
    .line 59
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->o:F

    .line 60
    .line 61
    float-to-int v0, v0

    .line 62
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->g:I

    .line 63
    .line 64
    add-int/2addr v0, v1

    .line 65
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->i:I

    .line 66
    .line 67
    add-int/2addr v0, v1

    .line 68
    add-int/lit8 v0, v0, 0x5a

    .line 69
    .line 70
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->n:I

    .line 71
    .line 72
    int-to-double v1, v1

    .line 73
    int-to-double v3, v0

    .line 74
    invoke-static {v3, v4}, Ljava/lang/Math;->toRadians(D)D

    .line 75
    .line 76
    .line 77
    move-result-wide v5

    .line 78
    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    .line 79
    .line 80
    .line 81
    move-result-wide v5

    .line 82
    mul-double/2addr v1, v5

    .line 83
    double-to-int v0, v1

    .line 84
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->u:I

    .line 85
    .line 86
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->n:I

    .line 87
    .line 88
    int-to-double v0, v0

    .line 89
    invoke-static {v3, v4}, Ljava/lang/Math;->toRadians(D)D

    .line 90
    .line 91
    .line 92
    move-result-wide v2

    .line 93
    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    .line 94
    .line 95
    .line 96
    move-result-wide v2

    .line 97
    mul-double/2addr v0, v2

    .line 98
    double-to-int v0, v0

    .line 99
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->v:I

    .line 100
    .line 101
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->k:Z

    .line 102
    .line 103
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->setTouchInSide(Z)V

    .line 104
    .line 105
    .line 106
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->m:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_4

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v2, 0x1

    .line 11
    invoke-interface {v0, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_3

    .line 19
    .line 20
    if-eq v0, v2, :cond_2

    .line 21
    .line 22
    const/4 v3, 0x2

    .line 23
    if-eq v0, v3, :cond_1

    .line 24
    .line 25
    const/4 p1, 0x3

    .line 26
    if-eq v0, p1, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->g()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v1}, Landroid/view/View;->setPressed(Z)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-interface {p0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->h(Landroid/view/MotionEvent;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->g()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, v1}, Landroid/view/View;->setPressed(Z)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-interface {p0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->f()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->h(Landroid/view/MotionEvent;)V

    .line 65
    .line 66
    .line 67
    :goto_0
    return v2

    .line 68
    :cond_4
    return v1
.end method

.method public setArcColor(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->q:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setArcRotation(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->i:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->j()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setArcWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->f:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->q:Landroid/graphics/Paint;

    .line 4
    .line 5
    int-to-float p1, p1

    .line 6
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setClockwise(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->l:Z

    .line 2
    .line 3
    return-void
.end method

.method public setEnabled(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->m:Z

    .line 2
    .line 3
    return-void
.end method

.method public setMax(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->c:I

    .line 2
    .line 3
    return-void
.end method

.method public setOnSeekArcChangeListener(Lcom/p1/mobile/putong/core/ui/view/SeekArc$a;)V
    .locals 0

    return-void
.end method

.method public setProgress(I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->i(IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setProgressColor(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->r:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setProgressWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->e:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->r:Landroid/graphics/Paint;

    .line 4
    .line 5
    int-to-float p1, p1

    .line 6
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setRoundedEdges(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->j:Z

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->q:Landroid/graphics/Paint;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object p1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->r:Landroid/graphics/Paint;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    sget-object p1, Landroid/graphics/Paint$Cap;->SQUARE:Landroid/graphics/Paint$Cap;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->r:Landroid/graphics/Paint;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public setShowThumb(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->y:Z

    .line 2
    .line 3
    return-void
.end method

.method public setStartAngle(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->g:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->j()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSweepAngle(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->h:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->j()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setThumbHideInEdge(Z)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->z:Z

    .line 2
    .line 3
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->z:Z

    .line 4
    .line 5
    return-void
.end method

.method public setTouchInSide(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->b:Landroid/graphics/drawable/Drawable;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->b:Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    div-int/lit8 v0, v0, 0x2

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->b:Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    div-int/lit8 v1, v1, 0x2

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->e:I

    .line 27
    .line 28
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->f:I

    .line 29
    .line 30
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    div-int/lit8 v0, v0, 0x2

    .line 35
    .line 36
    move v1, v0

    .line 37
    :goto_0
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->k:Z

    .line 38
    .line 39
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->n:I

    .line 40
    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    int-to-float p1, v2

    .line 44
    const/high16 v0, 0x40800000    # 4.0f

    .line 45
    .line 46
    div-float/2addr p1, v0

    .line 47
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->x:F

    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    sub-int/2addr v2, p1

    .line 55
    int-to-float p1, v2

    .line 56
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/SeekArc;->x:F

    .line 57
    .line 58
    return-void
.end method
