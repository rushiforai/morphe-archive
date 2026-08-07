.class public abstract Ll/jnd0;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"

# interfaces
.implements Ll/and0;
.implements Ll/qgj0;


# instance fields
.field public A:Z

.field public B:Z

.field public C:Ll/rgj0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final a:Landroid/graphics/drawable/Drawable;

.field public b:Z

.field public c:Z

.field public d:F

.field public final e:Landroid/graphics/Path;

.field public f:Z

.field public g:I

.field public final h:Landroid/graphics/Path;

.field public final i:[F

.field public final j:[F
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public k:[F
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final l:Landroid/graphics/RectF;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final m:Landroid/graphics/RectF;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final n:Landroid/graphics/RectF;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final o:Landroid/graphics/RectF;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public p:Landroid/graphics/RectF;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final q:Landroid/graphics/Matrix;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final r:Landroid/graphics/Matrix;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final s:Landroid/graphics/Matrix;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final t:Landroid/graphics/Matrix;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final u:Landroid/graphics/Matrix;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public v:Landroid/graphics/Matrix;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public w:Landroid/graphics/Matrix;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final x:Landroid/graphics/Matrix;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public y:F

.field public z:Z


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/jnd0;->b:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/jnd0;->c:Z

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput v1, p0, Ll/jnd0;->d:F

    .line 11
    .line 12
    new-instance v2, Landroid/graphics/Path;

    .line 13
    .line 14
    invoke-direct {v2}, Landroid/graphics/Path;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v2, p0, Ll/jnd0;->e:Landroid/graphics/Path;

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    iput-boolean v2, p0, Ll/jnd0;->f:Z

    .line 21
    .line 22
    iput v0, p0, Ll/jnd0;->g:I

    .line 23
    .line 24
    new-instance v3, Landroid/graphics/Path;

    .line 25
    .line 26
    invoke-direct {v3}, Landroid/graphics/Path;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v3, p0, Ll/jnd0;->h:Landroid/graphics/Path;

    .line 30
    .line 31
    const/16 v3, 0x8

    .line 32
    .line 33
    new-array v4, v3, [F

    .line 34
    .line 35
    iput-object v4, p0, Ll/jnd0;->i:[F

    .line 36
    .line 37
    new-array v3, v3, [F

    .line 38
    .line 39
    iput-object v3, p0, Ll/jnd0;->j:[F

    .line 40
    .line 41
    new-instance v3, Landroid/graphics/RectF;

    .line 42
    .line 43
    invoke-direct {v3}, Landroid/graphics/RectF;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object v3, p0, Ll/jnd0;->l:Landroid/graphics/RectF;

    .line 47
    .line 48
    new-instance v3, Landroid/graphics/RectF;

    .line 49
    .line 50
    invoke-direct {v3}, Landroid/graphics/RectF;-><init>()V

    .line 51
    .line 52
    .line 53
    iput-object v3, p0, Ll/jnd0;->m:Landroid/graphics/RectF;

    .line 54
    .line 55
    new-instance v3, Landroid/graphics/RectF;

    .line 56
    .line 57
    invoke-direct {v3}, Landroid/graphics/RectF;-><init>()V

    .line 58
    .line 59
    .line 60
    iput-object v3, p0, Ll/jnd0;->n:Landroid/graphics/RectF;

    .line 61
    .line 62
    new-instance v3, Landroid/graphics/RectF;

    .line 63
    .line 64
    invoke-direct {v3}, Landroid/graphics/RectF;-><init>()V

    .line 65
    .line 66
    .line 67
    iput-object v3, p0, Ll/jnd0;->o:Landroid/graphics/RectF;

    .line 68
    .line 69
    new-instance v3, Landroid/graphics/Matrix;

    .line 70
    .line 71
    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 72
    .line 73
    .line 74
    iput-object v3, p0, Ll/jnd0;->q:Landroid/graphics/Matrix;

    .line 75
    .line 76
    new-instance v3, Landroid/graphics/Matrix;

    .line 77
    .line 78
    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 79
    .line 80
    .line 81
    iput-object v3, p0, Ll/jnd0;->r:Landroid/graphics/Matrix;

    .line 82
    .line 83
    new-instance v3, Landroid/graphics/Matrix;

    .line 84
    .line 85
    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 86
    .line 87
    .line 88
    iput-object v3, p0, Ll/jnd0;->s:Landroid/graphics/Matrix;

    .line 89
    .line 90
    new-instance v3, Landroid/graphics/Matrix;

    .line 91
    .line 92
    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 93
    .line 94
    .line 95
    iput-object v3, p0, Ll/jnd0;->t:Landroid/graphics/Matrix;

    .line 96
    .line 97
    new-instance v3, Landroid/graphics/Matrix;

    .line 98
    .line 99
    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 100
    .line 101
    .line 102
    iput-object v3, p0, Ll/jnd0;->u:Landroid/graphics/Matrix;

    .line 103
    .line 104
    new-instance v3, Landroid/graphics/Matrix;

    .line 105
    .line 106
    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 107
    .line 108
    .line 109
    iput-object v3, p0, Ll/jnd0;->x:Landroid/graphics/Matrix;

    .line 110
    .line 111
    iput v1, p0, Ll/jnd0;->y:F

    .line 112
    .line 113
    iput-boolean v0, p0, Ll/jnd0;->z:Z

    .line 114
    .line 115
    iput-boolean v0, p0, Ll/jnd0;->A:Z

    .line 116
    .line 117
    iput-boolean v2, p0, Ll/jnd0;->B:Z

    .line 118
    .line 119
    iput-object p1, p0, Ll/jnd0;->a:Landroid/graphics/drawable/Drawable;

    .line 120
    .line 121
    return-void
.end method

.method public static d(Landroid/graphics/Matrix;)Landroid/graphics/Matrix;
    .locals 1
    .param p0    # Landroid/graphics/Matrix;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    new-instance v0, Landroid/graphics/Matrix;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public static i(Landroid/graphics/Matrix;Landroid/graphics/Matrix;)Z
    .locals 0
    .param p0    # Landroid/graphics/Matrix;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p1    # Landroid/graphics/Matrix;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    if-eqz p0, :cond_2

    .line 8
    .line 9
    if-nez p1, :cond_1

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_1
    invoke-virtual {p0, p1}, Landroid/graphics/Matrix;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method


# virtual methods
.method public a(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/jnd0;->b:Z

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Ll/jnd0;->B:Z

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public b(F)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float v0, p1, v0

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    const/4 v2, 0x1

    .line 6
    if-ltz v0, :cond_0

    .line 7
    .line 8
    move v3, v2

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v3, v1

    .line 11
    :goto_0
    invoke-static {v3}, Ll/wn80;->i(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v3, p0, Ll/jnd0;->i:[F

    .line 15
    .line 16
    invoke-static {v3, p1}, Ljava/util/Arrays;->fill([FF)V

    .line 17
    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    move v1, v2

    .line 22
    :cond_1
    iput-boolean v1, p0, Ll/jnd0;->c:Z

    .line 23
    .line 24
    iput-boolean v2, p0, Ll/jnd0;->B:Z

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public c(IF)V
    .locals 1

    .line 1
    iget v0, p0, Ll/jnd0;->g:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_1

    .line 4
    .line 5
    iget v0, p0, Ll/jnd0;->d:F

    .line 6
    .line 7
    cmpl-float v0, v0, p2

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    :goto_0
    iput p1, p0, Ll/jnd0;->g:I

    .line 14
    .line 15
    iput p2, p0, Ll/jnd0;->d:F

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    iput-boolean p1, p0, Ll/jnd0;->B:Z

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public clearColorFilter()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jnd0;->a:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/i9j;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "RoundedDrawable#draw"

    .line 8
    .line 9
    invoke-static {v0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/jnd0;->a:Landroid/graphics/drawable/Drawable;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/i9j;->d()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    invoke-static {}, Ll/i9j;->b()V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public e(F)V
    .locals 1

    .line 1
    iget v0, p0, Ll/jnd0;->y:F

    .line 2
    .line 3
    cmpl-float v0, v0, p1

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Ll/jnd0;->y:F

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput-boolean p1, p0, Ll/jnd0;->B:Z

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public f(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public g(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/jnd0;->A:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Ll/jnd0;->A:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public getAlpha()I
    .locals 0
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x13
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jnd0;->a:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getAlpha()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getColorFilter()Landroid/graphics/ColorFilter;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jnd0;->a:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getColorFilter()Landroid/graphics/ColorFilter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getIntrinsicHeight()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jnd0;->a:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getIntrinsicWidth()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jnd0;->a:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jnd0;->a:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/jnd0;->A:Z

    .line 2
    .line 3
    return p0
.end method

.method public j()Z
    .locals 1
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/jnd0;->b:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/jnd0;->c:Z

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget p0, p0, Ll/jnd0;->d:F

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    cmpl-float p0, p0, v0

    .line 13
    .line 14
    if-lez p0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0

    .line 19
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 20
    return p0
.end method

.method public k()V
    .locals 8

    .line 1
    iget-boolean v0, p0, Ll/jnd0;->B:Z

    .line 2
    .line 3
    if-eqz v0, :cond_7

    .line 4
    .line 5
    iget-object v0, p0, Ll/jnd0;->h:Landroid/graphics/Path;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/jnd0;->l:Landroid/graphics/RectF;

    .line 11
    .line 12
    iget v1, p0, Ll/jnd0;->d:F

    .line 13
    .line 14
    const/high16 v2, 0x40000000    # 2.0f

    .line 15
    .line 16
    div-float v3, v1, v2

    .line 17
    .line 18
    div-float/2addr v1, v2

    .line 19
    invoke-virtual {v0, v3, v1}, Landroid/graphics/RectF;->inset(FF)V

    .line 20
    .line 21
    .line 22
    iget-boolean v0, p0, Ll/jnd0;->b:Z

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Ll/jnd0;->l:Landroid/graphics/RectF;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iget-object v3, p0, Ll/jnd0;->l:Landroid/graphics/RectF;

    .line 34
    .line 35
    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    invoke-static {v0, v3}, Ljava/lang/Math;->min(FF)F

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    div-float/2addr v0, v2

    .line 44
    iget-object v3, p0, Ll/jnd0;->h:Landroid/graphics/Path;

    .line 45
    .line 46
    iget-object v4, p0, Ll/jnd0;->l:Landroid/graphics/RectF;

    .line 47
    .line 48
    invoke-virtual {v4}, Landroid/graphics/RectF;->centerX()F

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    iget-object v5, p0, Ll/jnd0;->l:Landroid/graphics/RectF;

    .line 53
    .line 54
    invoke-virtual {v5}, Landroid/graphics/RectF;->centerY()F

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    sget-object v6, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 59
    .line 60
    invoke-virtual {v3, v4, v5, v0, v6}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_0
    move v0, v1

    .line 65
    :goto_0
    iget-object v3, p0, Ll/jnd0;->j:[F

    .line 66
    .line 67
    array-length v4, v3

    .line 68
    if-ge v0, v4, :cond_1

    .line 69
    .line 70
    iget-object v4, p0, Ll/jnd0;->i:[F

    .line 71
    .line 72
    aget v4, v4, v0

    .line 73
    .line 74
    iget v5, p0, Ll/jnd0;->y:F

    .line 75
    .line 76
    add-float/2addr v4, v5

    .line 77
    iget v5, p0, Ll/jnd0;->d:F

    .line 78
    .line 79
    div-float/2addr v5, v2

    .line 80
    sub-float/2addr v4, v5

    .line 81
    aput v4, v3, v0

    .line 82
    .line 83
    add-int/lit8 v0, v0, 0x1

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_1
    iget-object v0, p0, Ll/jnd0;->h:Landroid/graphics/Path;

    .line 87
    .line 88
    iget-object v4, p0, Ll/jnd0;->l:Landroid/graphics/RectF;

    .line 89
    .line 90
    sget-object v5, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 91
    .line 92
    invoke-virtual {v0, v4, v3, v5}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path$Direction;)V

    .line 93
    .line 94
    .line 95
    :goto_1
    iget-object v0, p0, Ll/jnd0;->l:Landroid/graphics/RectF;

    .line 96
    .line 97
    iget v3, p0, Ll/jnd0;->d:F

    .line 98
    .line 99
    neg-float v4, v3

    .line 100
    div-float/2addr v4, v2

    .line 101
    neg-float v3, v3

    .line 102
    div-float/2addr v3, v2

    .line 103
    invoke-virtual {v0, v4, v3}, Landroid/graphics/RectF;->inset(FF)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Ll/jnd0;->e:Landroid/graphics/Path;

    .line 107
    .line 108
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 109
    .line 110
    .line 111
    iget v0, p0, Ll/jnd0;->y:F

    .line 112
    .line 113
    iget-boolean v3, p0, Ll/jnd0;->z:Z

    .line 114
    .line 115
    if-eqz v3, :cond_2

    .line 116
    .line 117
    iget v3, p0, Ll/jnd0;->d:F

    .line 118
    .line 119
    goto :goto_2

    .line 120
    :cond_2
    const/4 v3, 0x0

    .line 121
    :goto_2
    add-float/2addr v0, v3

    .line 122
    iget-object v3, p0, Ll/jnd0;->l:Landroid/graphics/RectF;

    .line 123
    .line 124
    invoke-virtual {v3, v0, v0}, Landroid/graphics/RectF;->inset(FF)V

    .line 125
    .line 126
    .line 127
    iget-boolean v3, p0, Ll/jnd0;->b:Z

    .line 128
    .line 129
    if-eqz v3, :cond_3

    .line 130
    .line 131
    iget-object v3, p0, Ll/jnd0;->e:Landroid/graphics/Path;

    .line 132
    .line 133
    iget-object v4, p0, Ll/jnd0;->l:Landroid/graphics/RectF;

    .line 134
    .line 135
    invoke-virtual {v4}, Landroid/graphics/RectF;->centerX()F

    .line 136
    .line 137
    .line 138
    move-result v4

    .line 139
    iget-object v5, p0, Ll/jnd0;->l:Landroid/graphics/RectF;

    .line 140
    .line 141
    invoke-virtual {v5}, Landroid/graphics/RectF;->centerY()F

    .line 142
    .line 143
    .line 144
    move-result v5

    .line 145
    iget-object v6, p0, Ll/jnd0;->l:Landroid/graphics/RectF;

    .line 146
    .line 147
    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    .line 148
    .line 149
    .line 150
    move-result v6

    .line 151
    iget-object v7, p0, Ll/jnd0;->l:Landroid/graphics/RectF;

    .line 152
    .line 153
    invoke-virtual {v7}, Landroid/graphics/RectF;->height()F

    .line 154
    .line 155
    .line 156
    move-result v7

    .line 157
    invoke-static {v6, v7}, Ljava/lang/Math;->min(FF)F

    .line 158
    .line 159
    .line 160
    move-result v6

    .line 161
    div-float/2addr v6, v2

    .line 162
    sget-object v2, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 163
    .line 164
    invoke-virtual {v3, v4, v5, v6, v2}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 165
    .line 166
    .line 167
    goto :goto_4

    .line 168
    :cond_3
    iget-boolean v2, p0, Ll/jnd0;->z:Z

    .line 169
    .line 170
    if-eqz v2, :cond_6

    .line 171
    .line 172
    iget-object v2, p0, Ll/jnd0;->k:[F

    .line 173
    .line 174
    if-nez v2, :cond_4

    .line 175
    .line 176
    const/16 v2, 0x8

    .line 177
    .line 178
    new-array v2, v2, [F

    .line 179
    .line 180
    iput-object v2, p0, Ll/jnd0;->k:[F

    .line 181
    .line 182
    :cond_4
    move v2, v1

    .line 183
    :goto_3
    iget-object v3, p0, Ll/jnd0;->j:[F

    .line 184
    .line 185
    array-length v3, v3

    .line 186
    if-ge v2, v3, :cond_5

    .line 187
    .line 188
    iget-object v3, p0, Ll/jnd0;->k:[F

    .line 189
    .line 190
    iget-object v4, p0, Ll/jnd0;->i:[F

    .line 191
    .line 192
    aget v4, v4, v2

    .line 193
    .line 194
    iget v5, p0, Ll/jnd0;->d:F

    .line 195
    .line 196
    sub-float/2addr v4, v5

    .line 197
    aput v4, v3, v2

    .line 198
    .line 199
    add-int/lit8 v2, v2, 0x1

    .line 200
    .line 201
    goto :goto_3

    .line 202
    :cond_5
    iget-object v2, p0, Ll/jnd0;->e:Landroid/graphics/Path;

    .line 203
    .line 204
    iget-object v3, p0, Ll/jnd0;->l:Landroid/graphics/RectF;

    .line 205
    .line 206
    iget-object v4, p0, Ll/jnd0;->k:[F

    .line 207
    .line 208
    sget-object v5, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 209
    .line 210
    invoke-virtual {v2, v3, v4, v5}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path$Direction;)V

    .line 211
    .line 212
    .line 213
    goto :goto_4

    .line 214
    :cond_6
    iget-object v2, p0, Ll/jnd0;->e:Landroid/graphics/Path;

    .line 215
    .line 216
    iget-object v3, p0, Ll/jnd0;->l:Landroid/graphics/RectF;

    .line 217
    .line 218
    iget-object v4, p0, Ll/jnd0;->i:[F

    .line 219
    .line 220
    sget-object v5, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 221
    .line 222
    invoke-virtual {v2, v3, v4, v5}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path$Direction;)V

    .line 223
    .line 224
    .line 225
    :goto_4
    iget-object v2, p0, Ll/jnd0;->l:Landroid/graphics/RectF;

    .line 226
    .line 227
    neg-float v0, v0

    .line 228
    invoke-virtual {v2, v0, v0}, Landroid/graphics/RectF;->inset(FF)V

    .line 229
    .line 230
    .line 231
    iget-object v0, p0, Ll/jnd0;->e:Landroid/graphics/Path;

    .line 232
    .line 233
    sget-object v2, Landroid/graphics/Path$FillType;->WINDING:Landroid/graphics/Path$FillType;

    .line 234
    .line 235
    invoke-virtual {v0, v2}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 236
    .line 237
    .line 238
    iput-boolean v1, p0, Ll/jnd0;->B:Z

    .line 239
    .line 240
    :cond_7
    return-void
.end method

.method public l(Ll/rgj0;)V
    .locals 0
    .param p1    # Ll/rgj0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/jnd0;->C:Ll/rgj0;

    .line 2
    .line 3
    return-void
.end method

.method public m(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/jnd0;->z:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Ll/jnd0;->z:Z

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Ll/jnd0;->B:Z

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public n([F)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    const/4 v2, 0x0

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Ll/jnd0;->i:[F

    .line 7
    .line 8
    invoke-static {p1, v0}, Ljava/util/Arrays;->fill([FF)V

    .line 9
    .line 10
    .line 11
    iput-boolean v2, p0, Ll/jnd0;->c:Z

    .line 12
    .line 13
    goto :goto_3

    .line 14
    :cond_0
    array-length v3, p1

    .line 15
    const/16 v4, 0x8

    .line 16
    .line 17
    if-ne v3, v4, :cond_1

    .line 18
    .line 19
    move v3, v1

    .line 20
    goto :goto_0

    .line 21
    :cond_1
    move v3, v2

    .line 22
    :goto_0
    const-string v5, "radii should have exactly 8 values"

    .line 23
    .line 24
    invoke-static {v3, v5}, Ll/wn80;->c(ZLjava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iget-object v3, p0, Ll/jnd0;->i:[F

    .line 28
    .line 29
    invoke-static {p1, v2, v3, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 30
    .line 31
    .line 32
    iput-boolean v2, p0, Ll/jnd0;->c:Z

    .line 33
    .line 34
    move v3, v2

    .line 35
    :goto_1
    if-ge v3, v4, :cond_3

    .line 36
    .line 37
    iget-boolean v5, p0, Ll/jnd0;->c:Z

    .line 38
    .line 39
    aget v6, p1, v3

    .line 40
    .line 41
    cmpl-float v6, v6, v0

    .line 42
    .line 43
    if-lez v6, :cond_2

    .line 44
    .line 45
    move v6, v1

    .line 46
    goto :goto_2

    .line 47
    :cond_2
    move v6, v2

    .line 48
    :goto_2
    or-int/2addr v5, v6

    .line 49
    iput-boolean v5, p0, Ll/jnd0;->c:Z

    .line 50
    .line 51
    add-int/lit8 v3, v3, 0x1

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_3
    :goto_3
    iput-boolean v1, p0, Ll/jnd0;->B:Z

    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public o()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jnd0;->C:Ll/rgj0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/jnd0;->s:Landroid/graphics/Matrix;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0, v1}, Ll/rgj0;->j(Landroid/graphics/Matrix;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/jnd0;->C:Ll/rgj0;

    .line 11
    .line 12
    iget-object v1, p0, Ll/jnd0;->l:Landroid/graphics/RectF;

    .line 13
    .line 14
    invoke-interface {v0, v1}, Ll/rgj0;->h(Landroid/graphics/RectF;)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {v1}, Landroid/graphics/Matrix;->reset()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/jnd0;->l:Landroid/graphics/RectF;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 28
    .line 29
    .line 30
    :goto_0
    iget-object v0, p0, Ll/jnd0;->n:Landroid/graphics/RectF;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/jnd0;->getIntrinsicWidth()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    int-to-float v1, v1

    .line 37
    invoke-virtual {p0}, Ll/jnd0;->getIntrinsicHeight()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    int-to-float v2, v2

    .line 42
    const/4 v3, 0x0

    .line 43
    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/jnd0;->o:Landroid/graphics/RectF;

    .line 47
    .line 48
    iget-object v1, p0, Ll/jnd0;->a:Landroid/graphics/drawable/Drawable;

    .line 49
    .line 50
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/jnd0;->q:Landroid/graphics/Matrix;

    .line 58
    .line 59
    iget-object v1, p0, Ll/jnd0;->n:Landroid/graphics/RectF;

    .line 60
    .line 61
    iget-object v2, p0, Ll/jnd0;->o:Landroid/graphics/RectF;

    .line 62
    .line 63
    sget-object v3, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    .line 64
    .line 65
    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 66
    .line 67
    .line 68
    iget-boolean v0, p0, Ll/jnd0;->z:Z

    .line 69
    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    iget-object v0, p0, Ll/jnd0;->p:Landroid/graphics/RectF;

    .line 73
    .line 74
    if-nez v0, :cond_1

    .line 75
    .line 76
    new-instance v0, Landroid/graphics/RectF;

    .line 77
    .line 78
    iget-object v1, p0, Ll/jnd0;->l:Landroid/graphics/RectF;

    .line 79
    .line 80
    invoke-direct {v0, v1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 81
    .line 82
    .line 83
    iput-object v0, p0, Ll/jnd0;->p:Landroid/graphics/RectF;

    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_1
    iget-object v1, p0, Ll/jnd0;->l:Landroid/graphics/RectF;

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 89
    .line 90
    .line 91
    :goto_1
    iget-object v0, p0, Ll/jnd0;->p:Landroid/graphics/RectF;

    .line 92
    .line 93
    iget v1, p0, Ll/jnd0;->d:F

    .line 94
    .line 95
    invoke-virtual {v0, v1, v1}, Landroid/graphics/RectF;->inset(FF)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Ll/jnd0;->v:Landroid/graphics/Matrix;

    .line 99
    .line 100
    if-nez v0, :cond_2

    .line 101
    .line 102
    new-instance v0, Landroid/graphics/Matrix;

    .line 103
    .line 104
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 105
    .line 106
    .line 107
    iput-object v0, p0, Ll/jnd0;->v:Landroid/graphics/Matrix;

    .line 108
    .line 109
    :cond_2
    iget-object v0, p0, Ll/jnd0;->v:Landroid/graphics/Matrix;

    .line 110
    .line 111
    iget-object v1, p0, Ll/jnd0;->l:Landroid/graphics/RectF;

    .line 112
    .line 113
    iget-object v2, p0, Ll/jnd0;->p:Landroid/graphics/RectF;

    .line 114
    .line 115
    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 116
    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_3
    iget-object v0, p0, Ll/jnd0;->v:Landroid/graphics/Matrix;

    .line 120
    .line 121
    if-eqz v0, :cond_4

    .line 122
    .line 123
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 124
    .line 125
    .line 126
    :cond_4
    :goto_2
    iget-object v0, p0, Ll/jnd0;->s:Landroid/graphics/Matrix;

    .line 127
    .line 128
    iget-object v1, p0, Ll/jnd0;->t:Landroid/graphics/Matrix;

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    const/4 v1, 0x1

    .line 135
    if-eqz v0, :cond_5

    .line 136
    .line 137
    iget-object v0, p0, Ll/jnd0;->q:Landroid/graphics/Matrix;

    .line 138
    .line 139
    iget-object v2, p0, Ll/jnd0;->r:Landroid/graphics/Matrix;

    .line 140
    .line 141
    invoke-virtual {v0, v2}, Landroid/graphics/Matrix;->equals(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-eqz v0, :cond_5

    .line 146
    .line 147
    iget-object v0, p0, Ll/jnd0;->v:Landroid/graphics/Matrix;

    .line 148
    .line 149
    if-eqz v0, :cond_9

    .line 150
    .line 151
    iget-object v2, p0, Ll/jnd0;->w:Landroid/graphics/Matrix;

    .line 152
    .line 153
    invoke-static {v0, v2}, Ll/jnd0;->i(Landroid/graphics/Matrix;Landroid/graphics/Matrix;)Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-nez v0, :cond_9

    .line 158
    .line 159
    :cond_5
    iput-boolean v1, p0, Ll/jnd0;->f:Z

    .line 160
    .line 161
    iget-object v0, p0, Ll/jnd0;->s:Landroid/graphics/Matrix;

    .line 162
    .line 163
    iget-object v2, p0, Ll/jnd0;->u:Landroid/graphics/Matrix;

    .line 164
    .line 165
    invoke-virtual {v0, v2}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 166
    .line 167
    .line 168
    iget-object v0, p0, Ll/jnd0;->x:Landroid/graphics/Matrix;

    .line 169
    .line 170
    iget-object v2, p0, Ll/jnd0;->s:Landroid/graphics/Matrix;

    .line 171
    .line 172
    invoke-virtual {v0, v2}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 173
    .line 174
    .line 175
    iget-boolean v0, p0, Ll/jnd0;->z:Z

    .line 176
    .line 177
    if-eqz v0, :cond_6

    .line 178
    .line 179
    iget-object v0, p0, Ll/jnd0;->v:Landroid/graphics/Matrix;

    .line 180
    .line 181
    if-eqz v0, :cond_6

    .line 182
    .line 183
    iget-object v2, p0, Ll/jnd0;->x:Landroid/graphics/Matrix;

    .line 184
    .line 185
    invoke-virtual {v2, v0}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 186
    .line 187
    .line 188
    :cond_6
    iget-object v0, p0, Ll/jnd0;->x:Landroid/graphics/Matrix;

    .line 189
    .line 190
    iget-object v2, p0, Ll/jnd0;->q:Landroid/graphics/Matrix;

    .line 191
    .line 192
    invoke-virtual {v0, v2}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 193
    .line 194
    .line 195
    iget-object v0, p0, Ll/jnd0;->t:Landroid/graphics/Matrix;

    .line 196
    .line 197
    iget-object v2, p0, Ll/jnd0;->s:Landroid/graphics/Matrix;

    .line 198
    .line 199
    invoke-virtual {v0, v2}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 200
    .line 201
    .line 202
    iget-object v0, p0, Ll/jnd0;->r:Landroid/graphics/Matrix;

    .line 203
    .line 204
    iget-object v2, p0, Ll/jnd0;->q:Landroid/graphics/Matrix;

    .line 205
    .line 206
    invoke-virtual {v0, v2}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 207
    .line 208
    .line 209
    iget-boolean v0, p0, Ll/jnd0;->z:Z

    .line 210
    .line 211
    iget-object v2, p0, Ll/jnd0;->w:Landroid/graphics/Matrix;

    .line 212
    .line 213
    if-eqz v0, :cond_8

    .line 214
    .line 215
    iget-object v0, p0, Ll/jnd0;->v:Landroid/graphics/Matrix;

    .line 216
    .line 217
    if-nez v2, :cond_7

    .line 218
    .line 219
    invoke-static {v0}, Ll/jnd0;->d(Landroid/graphics/Matrix;)Landroid/graphics/Matrix;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    iput-object v0, p0, Ll/jnd0;->w:Landroid/graphics/Matrix;

    .line 224
    .line 225
    goto :goto_3

    .line 226
    :cond_7
    invoke-virtual {v2, v0}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 227
    .line 228
    .line 229
    goto :goto_3

    .line 230
    :cond_8
    if-eqz v2, :cond_9

    .line 231
    .line 232
    invoke-virtual {v2}, Landroid/graphics/Matrix;->reset()V

    .line 233
    .line 234
    .line 235
    :cond_9
    :goto_3
    iget-object v0, p0, Ll/jnd0;->l:Landroid/graphics/RectF;

    .line 236
    .line 237
    iget-object v2, p0, Ll/jnd0;->m:Landroid/graphics/RectF;

    .line 238
    .line 239
    invoke-virtual {v0, v2}, Landroid/graphics/RectF;->equals(Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    move-result v0

    .line 243
    if-nez v0, :cond_a

    .line 244
    .line 245
    iput-boolean v1, p0, Ll/jnd0;->B:Z

    .line 246
    .line 247
    iget-object v0, p0, Ll/jnd0;->m:Landroid/graphics/RectF;

    .line 248
    .line 249
    iget-object p0, p0, Ll/jnd0;->l:Landroid/graphics/RectF;

    .line 250
    .line 251
    invoke-virtual {v0, p0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 252
    .line 253
    .line 254
    :cond_a
    return-void
.end method

.method public onBoundsChange(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jnd0;->a:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setAlpha(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jnd0;->a:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jnd0;->a:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0
    .param p1    # Landroid/graphics/ColorFilter;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 7
    iget-object p0, p0, Ll/jnd0;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    return-void
.end method
