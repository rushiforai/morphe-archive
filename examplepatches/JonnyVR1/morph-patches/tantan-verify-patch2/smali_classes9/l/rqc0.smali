.class public Ll/rqc0;
.super Ll/kam;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/rqc0$a;
    }
.end annotation


# instance fields
.field public A:J

.field public B:I

.field public C:J

.field public final D:I

.field public final E:I

.field public final F:I

.field public j:I

.field public k:I

.field public l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/rqc0$a;",
            ">;"
        }
    .end annotation
.end field

.field public m:I

.field public n:I

.field public o:I

.field public p:I

.field public q:F

.field public r:I

.field public s:I

.field public t:J

.field public u:Landroid/graphics/Paint;

.field public v:Landroid/graphics/RectF;

.field public w:Landroid/graphics/RectF;

.field public x:I

.field public y:I

.field public z:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, -0x1

    .line 34
    invoke-direct {p0, p1, v0}, Ll/rqc0;-><init>(Landroid/content/Context;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/kam;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-wide/32 v0, 0xf4240

    .line 5
    .line 6
    .line 7
    iput-wide v0, p0, Ll/rqc0;->z:J

    .line 8
    .line 9
    const-wide/32 v0, 0x3b9aca00

    .line 10
    .line 11
    .line 12
    iput-wide v0, p0, Ll/rqc0;->A:J

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput p1, p0, Ll/rqc0;->B:I

    .line 16
    .line 17
    const-wide/16 v0, -0x1

    .line 18
    .line 19
    iput-wide v0, p0, Ll/rqc0;->C:J

    .line 20
    .line 21
    iput p1, p0, Ll/rqc0;->D:I

    .line 22
    .line 23
    const/16 p1, 0x1f4

    .line 24
    .line 25
    iput p1, p0, Ll/rqc0;->E:I

    .line 26
    .line 27
    const/4 p1, 0x7

    .line 28
    iput p1, p0, Ll/rqc0;->F:I

    .line 29
    .line 30
    invoke-virtual {p0, p2}, Ll/rqc0;->u(I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public f(II)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Ll/lam;->f(II)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/rqc0;->B:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    const/16 v1, 0xff

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    mul-int/2addr p2, v1

    .line 13
    div-int/lit8 p2, p2, 0x64

    .line 14
    .line 15
    iput p2, p0, Ll/rqc0;->B:I

    .line 16
    .line 17
    iget-object p1, p0, Ll/rqc0;->w:Landroid/graphics/RectF;

    .line 18
    .line 19
    iget-object p2, p0, Ll/kam;->i:Landroid/graphics/RectF;

    .line 20
    .line 21
    iget v1, p2, Landroid/graphics/RectF;->right:F

    .line 22
    .line 23
    iget p0, p0, Ll/rqc0;->x:I

    .line 24
    .line 25
    int-to-float p0, p0

    .line 26
    sub-float/2addr v1, p0

    .line 27
    iget p0, p2, Landroid/graphics/RectF;->bottom:F

    .line 28
    .line 29
    invoke-virtual {p1, v0, v0, v1, p0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    const/4 v2, 0x1

    .line 34
    if-ne p1, v2, :cond_1

    .line 35
    .line 36
    iput v1, p0, Ll/rqc0;->B:I

    .line 37
    .line 38
    iget-object p1, p0, Ll/rqc0;->w:Landroid/graphics/RectF;

    .line 39
    .line 40
    iget-object p2, p0, Ll/kam;->i:Landroid/graphics/RectF;

    .line 41
    .line 42
    iget v1, p2, Landroid/graphics/RectF;->right:F

    .line 43
    .line 44
    iget p0, p0, Ll/rqc0;->x:I

    .line 45
    .line 46
    int-to-float p0, p0

    .line 47
    sub-float/2addr v1, p0

    .line 48
    iget p0, p2, Landroid/graphics/RectF;->bottom:F

    .line 49
    .line 50
    invoke-virtual {p1, v0, v0, v1, p0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    const/4 v0, 0x2

    .line 55
    if-ne p1, v0, :cond_2

    .line 56
    .line 57
    mul-int/2addr p2, v1

    .line 58
    div-int/lit8 p2, p2, 0x64

    .line 59
    .line 60
    sub-int/2addr v1, p2

    .line 61
    iput v1, p0, Ll/rqc0;->B:I

    .line 62
    .line 63
    :cond_2
    return-void
.end method

.method public g(Landroid/graphics/Canvas;II)V
    .locals 7

    .line 1
    iget p2, p0, Ll/lam;->b:I

    .line 2
    .line 3
    int-to-float v3, p2

    .line 4
    iget p2, p0, Ll/lam;->c:I

    .line 5
    .line 6
    int-to-float v4, p2

    .line 7
    iget-object v5, p0, Ll/rqc0;->u:Landroid/graphics/Paint;

    .line 8
    .line 9
    const/16 v6, 0x1f

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x0

    .line 13
    move-object v0, p1

    .line 14
    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iget-object p2, p0, Ll/rqc0;->u:Landroid/graphics/Paint;

    .line 19
    .line 20
    iget p3, p0, Ll/rqc0;->B:I

    .line 21
    .line 22
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 23
    .line 24
    .line 25
    iget-object p2, p0, Ll/kam;->i:Landroid/graphics/RectF;

    .line 26
    .line 27
    iget p3, p2, Landroid/graphics/RectF;->left:F

    .line 28
    .line 29
    iget v1, p0, Ll/rqc0;->y:I

    .line 30
    .line 31
    int-to-float v1, v1

    .line 32
    add-float/2addr p3, v1

    .line 33
    iget v1, p2, Landroid/graphics/RectF;->top:F

    .line 34
    .line 35
    iget v2, p2, Landroid/graphics/RectF;->right:F

    .line 36
    .line 37
    iget p2, p2, Landroid/graphics/RectF;->bottom:F

    .line 38
    .line 39
    invoke-virtual {v0, p3, v1, v2, p2}, Landroid/graphics/Canvas;->clipRect(FFFF)Z

    .line 40
    .line 41
    .line 42
    iget p2, p0, Ll/rqc0;->j:I

    .line 43
    .line 44
    if-lez p2, :cond_2

    .line 45
    .line 46
    iget p2, p0, Ll/rqc0;->k:I

    .line 47
    .line 48
    if-lez p2, :cond_2

    .line 49
    .line 50
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 51
    .line 52
    .line 53
    move-result-wide p2

    .line 54
    iget-wide v1, p0, Ll/rqc0;->C:J

    .line 55
    .line 56
    const-wide/16 v3, 0x0

    .line 57
    .line 58
    cmp-long v5, v1, v3

    .line 59
    .line 60
    if-lez v5, :cond_0

    .line 61
    .line 62
    move-wide p2, v1

    .line 63
    goto :goto_0

    .line 64
    :cond_0
    iget-object v1, p0, Ll/lam;->f:Ll/n4m;

    .line 65
    .line 66
    invoke-interface {v1}, Ll/n4m;->getRecordStartTime()J

    .line 67
    .line 68
    .line 69
    move-result-wide v1

    .line 70
    cmp-long v1, v1, v3

    .line 71
    .line 72
    if-lez v1, :cond_1

    .line 73
    .line 74
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 75
    .line 76
    .line 77
    move-result-wide v1

    .line 78
    iget-object v3, p0, Ll/lam;->f:Ll/n4m;

    .line 79
    .line 80
    invoke-interface {v3}, Ll/n4m;->getRecordStartTime()J

    .line 81
    .line 82
    .line 83
    move-result-wide v3

    .line 84
    sub-long/2addr v1, v3

    .line 85
    const-wide/32 v3, 0xea60

    .line 86
    .line 87
    .line 88
    cmp-long v1, v1, v3

    .line 89
    .line 90
    if-lez v1, :cond_1

    .line 91
    .line 92
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 93
    .line 94
    .line 95
    move-result-wide v1

    .line 96
    iput-wide v1, p0, Ll/rqc0;->C:J

    .line 97
    .line 98
    :cond_1
    :goto_0
    invoke-virtual {p0, p2, p3}, Ll/rqc0;->q(J)V

    .line 99
    .line 100
    .line 101
    iget-object v1, p0, Ll/rqc0;->l:Ljava/util/List;

    .line 102
    .line 103
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    if-eqz v2, :cond_2

    .line 112
    .line 113
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    check-cast v2, Ll/rqc0$a;

    .line 118
    .line 119
    invoke-virtual {p0, v2, v0, p2, p3}, Ll/rqc0;->s(Ll/rqc0$a;Landroid/graphics/Canvas;J)V

    .line 120
    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_2
    invoke-virtual {v0, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public h(II)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Ll/lam;->h(II)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Ll/rqc0;->n(II)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/rqc0;->w:Landroid/graphics/RectF;

    .line 8
    .line 9
    iget-object p2, p0, Ll/rqc0;->v:Landroid/graphics/RectF;

    .line 10
    .line 11
    iget v0, p2, Landroid/graphics/RectF;->right:F

    .line 12
    .line 13
    iget v1, p2, Landroid/graphics/RectF;->left:F

    .line 14
    .line 15
    sub-float/2addr v0, v1

    .line 16
    iget v1, p2, Landroid/graphics/RectF;->bottom:F

    .line 17
    .line 18
    iget p2, p2, Landroid/graphics/RectF;->top:F

    .line 19
    .line 20
    sub-float/2addr v1, p2

    .line 21
    const/4 p2, 0x0

    .line 22
    invoke-virtual {p1, p2, p2, v0, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/lam;->g:Landroid/graphics/RectF;

    .line 26
    .line 27
    iget p2, p1, Landroid/graphics/RectF;->right:F

    .line 28
    .line 29
    iget v0, p1, Landroid/graphics/RectF;->left:F

    .line 30
    .line 31
    sub-float/2addr p2, v0

    .line 32
    float-to-int p2, p2

    .line 33
    iget v0, p1, Landroid/graphics/RectF;->bottom:F

    .line 34
    .line 35
    iget p1, p1, Landroid/graphics/RectF;->top:F

    .line 36
    .line 37
    sub-float/2addr v0, p1

    .line 38
    float-to-int p1, v0

    .line 39
    iput p2, p0, Ll/rqc0;->j:I

    .line 40
    .line 41
    iput p1, p0, Ll/rqc0;->k:I

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/rqc0;->o()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/lam;->i()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/rqc0;->l:Ljava/util/List;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    :cond_0
    const-wide/16 v0, -0x1

    .line 12
    .line 13
    iput-wide v0, p0, Ll/rqc0;->C:J

    .line 14
    .line 15
    return-void
.end method

.method public n(II)V
    .locals 3

    .line 1
    iget-object p2, p0, Ll/lam;->g:Landroid/graphics/RectF;

    .line 2
    .line 3
    const/16 v0, 0x42

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/lam;->a(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    int-to-float v0, v0

    .line 10
    const/16 v1, 0x2a

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Ll/lam;->a(I)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    int-to-float v1, v1

    .line 17
    const/16 v2, 0x4a

    .line 18
    .line 19
    invoke-virtual {p0, v2}, Ll/lam;->a(I)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    sub-int/2addr p1, v2

    .line 24
    int-to-float p1, p1

    .line 25
    const/16 v2, 0x62

    .line 26
    .line 27
    invoke-virtual {p0, v2}, Ll/lam;->a(I)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    int-to-float p0, p0

    .line 32
    invoke-virtual {p2, v0, v1, p1, p0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public o()V
    .locals 3

    .line 1
    iget v0, p0, Ll/rqc0;->k:I

    .line 2
    .line 3
    int-to-float v1, v0

    .line 4
    const v2, 0x3ecccccd    # 0.4f

    .line 5
    .line 6
    .line 7
    mul-float/2addr v1, v2

    .line 8
    iput v1, p0, Ll/rqc0;->q:F

    .line 9
    .line 10
    div-int/lit8 v1, v0, 0x2

    .line 11
    .line 12
    iput v1, p0, Ll/rqc0;->s:I

    .line 13
    .line 14
    div-int/lit8 v0, v0, 0x14

    .line 15
    .line 16
    iput v0, p0, Ll/rqc0;->p:I

    .line 17
    .line 18
    return-void
.end method

.method public final p(J)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/rqc0;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/rqc0;->l:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    add-int/lit8 v1, v1, -0x1

    .line 17
    .line 18
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ll/rqc0$a;

    .line 23
    .line 24
    invoke-static {v0}, Ll/rqc0$a;->d(Ll/rqc0$a;)J

    .line 25
    .line 26
    .line 27
    move-result-wide v1

    .line 28
    sub-long/2addr p1, v1

    .line 29
    iget-wide v1, p0, Ll/rqc0;->t:J

    .line 30
    .line 31
    iget-wide v3, p0, Ll/rqc0;->z:J

    .line 32
    .line 33
    mul-long/2addr v1, v3

    .line 34
    cmp-long p1, p1, v1

    .line 35
    .line 36
    if-ltz p1, :cond_1

    .line 37
    .line 38
    invoke-static {v0}, Ll/rqc0$a;->d(Ll/rqc0$a;)J

    .line 39
    .line 40
    .line 41
    move-result-wide p1

    .line 42
    iget-wide v0, p0, Ll/rqc0;->t:J

    .line 43
    .line 44
    iget-wide v2, p0, Ll/rqc0;->z:J

    .line 45
    .line 46
    mul-long/2addr v0, v2

    .line 47
    add-long/2addr p1, v0

    .line 48
    invoke-virtual {p0, p1, p2}, Ll/rqc0;->t(J)Ll/rqc0$a;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iget-object p0, p0, Ll/rqc0;->l:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    :cond_1
    :goto_0
    return-void
.end method

.method public final q(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rqc0;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-wide/16 p1, -0x1

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Ll/rqc0;->t(J)Ll/rqc0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p0, p0, Ll/rqc0;->l:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/rqc0;->r(J)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1, p2}, Ll/rqc0;->p(J)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final r(J)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/rqc0;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/rqc0$a;

    .line 18
    .line 19
    invoke-static {v0}, Ll/rqc0$a;->c(Ll/rqc0$a;)J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    cmp-long v0, v0, p1

    .line 24
    .line 25
    if-gtz v0, :cond_0

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    return-void
.end method

.method public final s(Ll/rqc0$a;Landroid/graphics/Canvas;J)V
    .locals 5

    .line 1
    invoke-static {p1}, Ll/rqc0$a;->d(Ll/rqc0$a;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sub-long v0, p3, v0

    .line 6
    .line 7
    iget-wide v2, p0, Ll/rqc0;->z:J

    .line 8
    .line 9
    div-long/2addr v0, v2

    .line 10
    invoke-static {p1}, Ll/rqc0$a;->b(Ll/rqc0$a;)J

    .line 11
    .line 12
    .line 13
    move-result-wide v2

    .line 14
    add-long/2addr v0, v2

    .line 15
    invoke-static {p1}, Ll/rqc0$a;->a(Ll/rqc0$a;)J

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    rem-long/2addr v0, v2

    .line 20
    long-to-float v0, v0

    .line 21
    invoke-static {p1}, Ll/rqc0$a;->a(Ll/rqc0$a;)J

    .line 22
    .line 23
    .line 24
    move-result-wide v1

    .line 25
    long-to-float v1, v1

    .line 26
    div-float/2addr v0, v1

    .line 27
    const/high16 v1, 0x3f800000    # 1.0f

    .line 28
    .line 29
    cmpl-float v2, v0, v1

    .line 30
    .line 31
    if-lez v2, :cond_0

    .line 32
    .line 33
    move v0, v1

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 v2, 0x0

    .line 36
    cmpg-float v3, v0, v2

    .line 37
    .line 38
    if-gez v3, :cond_1

    .line 39
    .line 40
    move v0, v2

    .line 41
    :cond_1
    :goto_0
    const/high16 v2, 0x3f000000    # 0.5f

    .line 42
    .line 43
    cmpl-float v3, v0, v2

    .line 44
    .line 45
    if-ltz v3, :cond_2

    .line 46
    .line 47
    sub-float/2addr v1, v0

    .line 48
    div-float/2addr v1, v2

    .line 49
    goto :goto_1

    .line 50
    :cond_2
    div-float v1, v0, v2

    .line 51
    .line 52
    :goto_1
    invoke-static {p1}, Ll/rqc0$a;->d(Ll/rqc0$a;)J

    .line 53
    .line 54
    .line 55
    move-result-wide v2

    .line 56
    sub-long/2addr p3, v2

    .line 57
    iget v0, p0, Ll/rqc0;->o:I

    .line 58
    .line 59
    int-to-long v2, v0

    .line 60
    mul-long/2addr p3, v2

    .line 61
    iget-wide v2, p0, Ll/rqc0;->A:J

    .line 62
    .line 63
    div-long/2addr p3, v2

    .line 64
    long-to-float p3, p3

    .line 65
    iget-object p4, p0, Ll/rqc0;->v:Landroid/graphics/RectF;

    .line 66
    .line 67
    iget v0, p0, Ll/rqc0;->m:I

    .line 68
    .line 69
    int-to-float v0, v0

    .line 70
    sub-float v0, p3, v0

    .line 71
    .line 72
    iget v2, p0, Ll/rqc0;->s:I

    .line 73
    .line 74
    iget v3, p0, Ll/rqc0;->p:I

    .line 75
    .line 76
    sub-int v3, v2, v3

    .line 77
    .line 78
    int-to-float v3, v3

    .line 79
    int-to-float v2, v2

    .line 80
    invoke-static {p1}, Ll/rqc0$a;->e(Ll/rqc0$a;)F

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    mul-float/2addr v2, v4

    .line 85
    mul-float/2addr v2, v1

    .line 86
    sub-float/2addr v3, v2

    .line 87
    iget v2, p0, Ll/rqc0;->s:I

    .line 88
    .line 89
    iget v4, p0, Ll/rqc0;->p:I

    .line 90
    .line 91
    add-int/2addr v4, v2

    .line 92
    int-to-float v4, v4

    .line 93
    int-to-float v2, v2

    .line 94
    invoke-static {p1}, Ll/rqc0$a;->e(Ll/rqc0$a;)F

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    mul-float/2addr v2, p1

    .line 99
    mul-float/2addr v2, v1

    .line 100
    add-float/2addr v4, v2

    .line 101
    invoke-virtual {p4, v0, v3, p3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Ll/rqc0;->v:Landroid/graphics/RectF;

    .line 105
    .line 106
    iget p3, p0, Ll/rqc0;->r:I

    .line 107
    .line 108
    int-to-float p4, p3

    .line 109
    int-to-float p3, p3

    .line 110
    iget-object p0, p0, Ll/rqc0;->u:Landroid/graphics/Paint;

    .line 111
    .line 112
    invoke-virtual {p2, p1, p4, p3, p0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public final t(J)Ll/rqc0$a;
    .locals 5

    .line 1
    new-instance v0, Ll/rqc0$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/rqc0$a;-><init>(Ll/rqc0;Ll/sqc0;)V

    .line 5
    .line 6
    .line 7
    const-wide/16 v1, -0x1

    .line 8
    .line 9
    cmp-long v1, p1, v1

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 14
    .line 15
    .line 16
    move-result-wide v1

    .line 17
    invoke-static {v0, v1, v2}, Ll/rqc0$a;->i(Ll/rqc0$a;J)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-static {v0, p1, p2}, Ll/rqc0$a;->i(Ll/rqc0$a;J)V

    .line 22
    .line 23
    .line 24
    :goto_0
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 25
    .line 26
    .line 27
    move-result-wide v1

    .line 28
    const-wide v3, 0x409f400000000000L    # 2000.0

    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    mul-double/2addr v1, v3

    .line 34
    double-to-long v1, v1

    .line 35
    const-wide/16 v3, 0x320

    .line 36
    .line 37
    add-long/2addr v1, v3

    .line 38
    invoke-static {v0, v1, v2}, Ll/rqc0$a;->f(Ll/rqc0$a;J)V

    .line 39
    .line 40
    .line 41
    new-instance v1, Ljava/util/Random;

    .line 42
    .line 43
    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/util/Random;->nextDouble()D

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Ll/lam;->f:Ll/n4m;

    .line 50
    .line 51
    invoke-interface {v1}, Ll/n4m;->getSoundLevel()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-gez v1, :cond_1

    .line 56
    .line 57
    const/4 v1, 0x1

    .line 58
    goto :goto_1

    .line 59
    :cond_1
    add-int/lit16 v1, v1, 0x1f4

    .line 60
    .line 61
    div-int/lit16 v1, v1, 0x1f4

    .line 62
    .line 63
    :goto_1
    int-to-float v1, v1

    .line 64
    const/high16 v2, 0x40e00000    # 7.0f

    .line 65
    .line 66
    div-float/2addr v1, v2

    .line 67
    const v2, 0x3d4ccccd    # 0.05f

    .line 68
    .line 69
    .line 70
    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    const v2, 0x3f266666    # 0.65f

    .line 75
    .line 76
    .line 77
    invoke-static {v2, v1}, Ljava/lang/Math;->min(FF)F

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    invoke-static {v0, v1}, Ll/rqc0$a;->j(Ll/rqc0$a;F)V

    .line 82
    .line 83
    .line 84
    invoke-static {v0}, Ll/rqc0$a;->a(Ll/rqc0$a;)J

    .line 85
    .line 86
    .line 87
    move-result-wide v1

    .line 88
    rem-long/2addr p1, v1

    .line 89
    invoke-static {v0, p1, p2}, Ll/rqc0$a;->g(Ll/rqc0$a;J)V

    .line 90
    .line 91
    .line 92
    invoke-static {v0}, Ll/rqc0$a;->d(Ll/rqc0$a;)J

    .line 93
    .line 94
    .line 95
    move-result-wide p1

    .line 96
    iget v1, p0, Ll/rqc0;->j:I

    .line 97
    .line 98
    iget v2, p0, Ll/rqc0;->m:I

    .line 99
    .line 100
    add-int/2addr v1, v2

    .line 101
    iget v2, p0, Ll/rqc0;->n:I

    .line 102
    .line 103
    add-int/2addr v1, v2

    .line 104
    int-to-long v1, v1

    .line 105
    iget-wide v3, p0, Ll/rqc0;->A:J

    .line 106
    .line 107
    mul-long/2addr v1, v3

    .line 108
    iget p0, p0, Ll/rqc0;->o:I

    .line 109
    .line 110
    int-to-long v3, p0

    .line 111
    div-long/2addr v1, v3

    .line 112
    add-long/2addr p1, v1

    .line 113
    invoke-static {v0, p1, p2}, Ll/rqc0$a;->h(Ll/rqc0$a;J)V

    .line 114
    .line 115
    .line 116
    return-object v0
.end method

.method public final u(I)V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/rqc0;->l:Ljava/util/List;

    .line 7
    .line 8
    const/4 v0, 0x3

    .line 9
    invoke-virtual {p0, v0}, Ll/lam;->a(I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iput v1, p0, Ll/rqc0;->m:I

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/lam;->a(I)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iput v1, p0, Ll/rqc0;->n:I

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/lam;->a(I)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iput v0, p0, Ll/rqc0;->r:I

    .line 26
    .line 27
    const/16 v0, 0x12c

    .line 28
    .line 29
    iput v0, p0, Ll/rqc0;->o:I

    .line 30
    .line 31
    iget v1, p0, Ll/rqc0;->m:I

    .line 32
    .line 33
    iget v2, p0, Ll/rqc0;->n:I

    .line 34
    .line 35
    add-int/2addr v1, v2

    .line 36
    mul-int/lit16 v1, v1, 0x3e8

    .line 37
    .line 38
    div-int/2addr v1, v0

    .line 39
    int-to-long v0, v1

    .line 40
    iput-wide v0, p0, Ll/rqc0;->t:J

    .line 41
    .line 42
    new-instance v0, Landroid/graphics/RectF;

    .line 43
    .line 44
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Ll/rqc0;->v:Landroid/graphics/RectF;

    .line 48
    .line 49
    const/16 v0, 0x3a

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Ll/lam;->a(I)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    iput v0, p0, Ll/rqc0;->x:I

    .line 56
    .line 57
    new-instance v0, Landroid/graphics/RectF;

    .line 58
    .line 59
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Ll/rqc0;->w:Landroid/graphics/RectF;

    .line 63
    .line 64
    new-instance v0, Landroid/graphics/Paint;

    .line 65
    .line 66
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 67
    .line 68
    .line 69
    iput-object v0, p0, Ll/rqc0;->u:Landroid/graphics/Paint;

    .line 70
    .line 71
    const/4 v1, 0x1

    .line 72
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/rqc0;->u:Landroid/graphics/Paint;

    .line 76
    .line 77
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 78
    .line 79
    .line 80
    const/16 p1, 0x10

    .line 81
    .line 82
    invoke-virtual {p0, p1}, Ll/lam;->a(I)I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    iput p1, p0, Ll/rqc0;->y:I

    .line 87
    .line 88
    return-void
.end method
