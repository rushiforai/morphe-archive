.class public Ll/x0e0;
.super Ll/p2j;
.source "SourceFile"


# instance fields
.field public e:Ll/h1e0;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public f:Ljava/lang/Object;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public g:Landroid/graphics/PointF;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public h:I
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public i:I
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public j:Landroid/graphics/Matrix;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public k:Landroid/graphics/Matrix;


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;Ll/h1e0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p2j;-><init>(Landroid/graphics/drawable/Drawable;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Ll/x0e0;->g:Landroid/graphics/PointF;

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput p1, p0, Ll/x0e0;->h:I

    .line 9
    .line 10
    iput p1, p0, Ll/x0e0;->i:I

    .line 11
    .line 12
    new-instance p1, Landroid/graphics/Matrix;

    .line 13
    .line 14
    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/x0e0;->k:Landroid/graphics/Matrix;

    .line 18
    .line 19
    iput-object p2, p0, Ll/x0e0;->e:Ll/h1e0;

    .line 20
    .line 21
    return-void
.end method

.method private t()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/x0e0;->e:Ll/h1e0;

    .line 2
    .line 3
    instance-of v1, v0, Ll/t1e0;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v1, :cond_2

    .line 7
    .line 8
    check-cast v0, Ll/t1e0;

    .line 9
    .line 10
    invoke-interface {v0}, Ll/t1e0;->getState()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Ll/x0e0;->f:Ljava/lang/Object;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_1

    .line 23
    .line 24
    :cond_0
    const/4 v2, 0x1

    .line 25
    :cond_1
    iput-object v0, p0, Ll/x0e0;->f:Ljava/lang/Object;

    .line 26
    .line 27
    :cond_2
    invoke-virtual {p0}, Ll/p2j;->getCurrent()Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_3
    iget v1, p0, Ll/x0e0;->h:I

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-ne v1, v3, :cond_6

    .line 41
    .line 42
    iget v1, p0, Ll/x0e0;->i:I

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eq v1, v0, :cond_4

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_4
    if-eqz v2, :cond_5

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_5
    :goto_0
    return-void

    .line 55
    :cond_6
    :goto_1
    invoke-virtual {p0}, Ll/x0e0;->s()V

    .line 56
    .line 57
    .line 58
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/x0e0;->t()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/x0e0;->j:Landroid/graphics/Matrix;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Ll/x0e0;->j:Landroid/graphics/Matrix;

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 22
    .line 23
    .line 24
    invoke-super {p0, p1}, Ll/p2j;->draw(Landroid/graphics/Canvas;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-super {p0, p1}, Ll/p2j;->draw(Landroid/graphics/Canvas;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public j(Landroid/graphics/Matrix;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p2j;->o(Landroid/graphics/Matrix;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/x0e0;->t()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/x0e0;->j:Landroid/graphics/Matrix;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onBoundsChange(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/x0e0;->s()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public q(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/p2j;->q(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/x0e0;->s()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public s()V
    .locals 10
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/p2j;->getCurrent()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iput v1, p0, Ll/x0e0;->i:I

    .line 10
    .line 11
    iput v1, p0, Ll/x0e0;->h:I

    .line 12
    .line 13
    iput-object v2, p0, Ll/x0e0;->j:Landroid/graphics/Matrix;

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 29
    .line 30
    .line 31
    move-result v6

    .line 32
    iput v6, p0, Ll/x0e0;->h:I

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 35
    .line 36
    .line 37
    move-result v7

    .line 38
    iput v7, p0, Ll/x0e0;->i:I

    .line 39
    .line 40
    if-lez v6, :cond_6

    .line 41
    .line 42
    if-gtz v7, :cond_1

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    if-ne v6, v3, :cond_2

    .line 46
    .line 47
    if-ne v7, v4, :cond_2

    .line 48
    .line 49
    invoke-virtual {v0, v5}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 50
    .line 51
    .line 52
    iput-object v2, p0, Ll/x0e0;->j:Landroid/graphics/Matrix;

    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    iget-object v3, p0, Ll/x0e0;->e:Ll/h1e0;

    .line 56
    .line 57
    sget-object v4, Ll/h1e0;->a:Ll/h1e0;

    .line 58
    .line 59
    if-ne v3, v4, :cond_3

    .line 60
    .line 61
    invoke-virtual {v0, v5}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 62
    .line 63
    .line 64
    iput-object v2, p0, Ll/x0e0;->j:Landroid/graphics/Matrix;

    .line 65
    .line 66
    return-void

    .line 67
    :cond_3
    invoke-virtual {v0, v1, v1, v6, v7}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/x0e0;->k:Landroid/graphics/Matrix;

    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 73
    .line 74
    .line 75
    iget-object v3, p0, Ll/x0e0;->e:Ll/h1e0;

    .line 76
    .line 77
    iget-object v4, p0, Ll/x0e0;->k:Landroid/graphics/Matrix;

    .line 78
    .line 79
    iget-object v0, p0, Ll/x0e0;->g:Landroid/graphics/PointF;

    .line 80
    .line 81
    const/high16 v1, 0x3f000000    # 0.5f

    .line 82
    .line 83
    if-eqz v0, :cond_4

    .line 84
    .line 85
    iget v2, v0, Landroid/graphics/PointF;->x:F

    .line 86
    .line 87
    move v8, v2

    .line 88
    goto :goto_0

    .line 89
    :cond_4
    move v8, v1

    .line 90
    :goto_0
    if-eqz v0, :cond_5

    .line 91
    .line 92
    iget v1, v0, Landroid/graphics/PointF;->y:F

    .line 93
    .line 94
    :cond_5
    move v9, v1

    .line 95
    invoke-interface/range {v3 .. v9}, Ll/h1e0;->a(Landroid/graphics/Matrix;Landroid/graphics/Rect;IIFF)Landroid/graphics/Matrix;

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Ll/x0e0;->k:Landroid/graphics/Matrix;

    .line 99
    .line 100
    iput-object v0, p0, Ll/x0e0;->j:Landroid/graphics/Matrix;

    .line 101
    .line 102
    return-void

    .line 103
    :cond_6
    :goto_1
    invoke-virtual {v0, v5}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 104
    .line 105
    .line 106
    iput-object v2, p0, Ll/x0e0;->j:Landroid/graphics/Matrix;

    .line 107
    .line 108
    return-void
.end method

.method public u()Landroid/graphics/PointF;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x0e0;->g:Landroid/graphics/PointF;

    .line 2
    .line 3
    return-object p0
.end method

.method public v()Ll/h1e0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x0e0;->e:Ll/h1e0;

    .line 2
    .line 3
    return-object p0
.end method

.method public w(Landroid/graphics/PointF;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x0e0;->g:Landroid/graphics/PointF;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/i950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    if-nez p1, :cond_1

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-object p1, p0, Ll/x0e0;->g:Landroid/graphics/PointF;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    iget-object v0, p0, Ll/x0e0;->g:Landroid/graphics/PointF;

    .line 17
    .line 18
    if-nez v0, :cond_2

    .line 19
    .line 20
    new-instance v0, Landroid/graphics/PointF;

    .line 21
    .line 22
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/x0e0;->g:Landroid/graphics/PointF;

    .line 26
    .line 27
    :cond_2
    iget-object v0, p0, Ll/x0e0;->g:Landroid/graphics/PointF;

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 30
    .line 31
    .line 32
    :goto_0
    invoke-virtual {p0}, Ll/x0e0;->s()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public x(Ll/h1e0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x0e0;->e:Ll/h1e0;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/i950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iput-object p1, p0, Ll/x0e0;->e:Ll/h1e0;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-object p1, p0, Ll/x0e0;->f:Ljava/lang/Object;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/x0e0;->s()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 19
    .line 20
    .line 21
    return-void
.end method
