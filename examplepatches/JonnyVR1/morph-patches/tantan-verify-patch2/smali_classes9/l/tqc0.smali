.class public Ll/tqc0;
.super Ll/kam;
.source "SourceFile"


# instance fields
.field public j:Landroid/text/TextPaint;

.field public k:F

.field public l:I

.field public m:I

.field public n:Ljava/lang/String;

.field public o:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/kam;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Ll/tqc0;->m:I

    .line 6
    .line 7
    const-string p1, "0:00"

    .line 8
    .line 9
    iput-object p1, p0, Ll/tqc0;->n:Ljava/lang/String;

    .line 10
    .line 11
    const-wide/16 v0, -0x1

    .line 12
    .line 13
    iput-wide v0, p0, Ll/tqc0;->o:J

    .line 14
    .line 15
    invoke-direct {p0}, Ll/tqc0;->l()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private l()V
    .locals 3

    .line 1
    new-instance v0, Landroid/text/TextPaint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/tqc0;->j:Landroid/text/TextPaint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/tqc0;->j:Landroid/text/TextPaint;

    .line 13
    .line 14
    const/4 v1, -0x1

    .line 15
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/tqc0;->j:Landroid/text/TextPaint;

    .line 19
    .line 20
    const/16 v1, 0xe

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Ll/lam;->a(I)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    int-to-float v1, v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/tqc0;->j:Landroid/text/TextPaint;

    .line 31
    .line 32
    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 35
    .line 36
    .line 37
    const/16 v0, 0x3a

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ll/lam;->a(I)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iput v0, p0, Ll/tqc0;->l:I

    .line 44
    .line 45
    iget-object v0, p0, Ll/tqc0;->j:Landroid/text/TextPaint;

    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget v1, v0, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 52
    .line 53
    iget v0, v0, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 54
    .line 55
    const/high16 v2, 0x40000000    # 2.0f

    .line 56
    .line 57
    div-float/2addr v1, v2

    .line 58
    div-float/2addr v0, v2

    .line 59
    add-float/2addr v1, v0

    .line 60
    iput v1, p0, Ll/tqc0;->k:F

    .line 61
    .line 62
    return-void
.end method


# virtual methods
.method public f(II)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Ll/lam;->f(II)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xff

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    mul-int/2addr p2, v0

    .line 9
    div-int/lit8 p2, p2, 0x64

    .line 10
    .line 11
    iput p2, p0, Ll/tqc0;->m:I

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 v1, 0x1

    .line 15
    if-ne p1, v1, :cond_1

    .line 16
    .line 17
    iput v0, p0, Ll/tqc0;->m:I

    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    const/4 v1, 0x2

    .line 21
    if-ne p1, v1, :cond_2

    .line 22
    .line 23
    mul-int/2addr p2, v0

    .line 24
    div-int/lit8 p2, p2, 0x64

    .line 25
    .line 26
    sub-int/2addr v0, p2

    .line 27
    iput v0, p0, Ll/tqc0;->m:I

    .line 28
    .line 29
    :cond_2
    return-void
.end method

.method public g(Landroid/graphics/Canvas;II)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/tqc0;->j:Landroid/text/TextPaint;

    .line 2
    .line 3
    iget p3, p0, Ll/tqc0;->m:I

    .line 4
    .line 5
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/tqc0;->n()V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Ll/tqc0;->n:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p3, p0, Ll/kam;->i:Landroid/graphics/RectF;

    .line 14
    .line 15
    iget v0, p3, Landroid/graphics/RectF;->right:F

    .line 16
    .line 17
    iget v1, p0, Ll/tqc0;->l:I

    .line 18
    .line 19
    div-int/lit8 v1, v1, 0x2

    .line 20
    .line 21
    int-to-float v1, v1

    .line 22
    sub-float/2addr v0, v1

    .line 23
    iget v1, p3, Landroid/graphics/RectF;->top:F

    .line 24
    .line 25
    iget p3, p3, Landroid/graphics/RectF;->bottom:F

    .line 26
    .line 27
    add-float/2addr v1, p3

    .line 28
    const/high16 p3, 0x40000000    # 2.0f

    .line 29
    .line 30
    div-float/2addr v1, p3

    .line 31
    iget p3, p0, Ll/tqc0;->k:F

    .line 32
    .line 33
    sub-float/2addr v1, p3

    .line 34
    iget-object p0, p0, Ll/tqc0;->j:Landroid/text/TextPaint;

    .line 35
    .line 36
    invoke-virtual {p1, p2, v0, v1, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public h(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/lam;->h(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final n()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/lam;->f:Ll/n4m;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/n4m;->getRecordStartTime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    sub-long/2addr v2, v0

    .line 12
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 13
    .line 14
    .line 15
    move-result-wide v4

    .line 16
    sub-long/2addr v4, v0

    .line 17
    long-to-float v4, v4

    .line 18
    const/high16 v5, 0x447a0000    # 1000.0f

    .line 19
    .line 20
    div-float/2addr v4, v5

    .line 21
    const/4 v5, 0x0

    .line 22
    cmpl-float v5, v4, v5

    .line 23
    .line 24
    const-string v6, "0:00"

    .line 25
    .line 26
    if-lez v5, :cond_4

    .line 27
    .line 28
    const-wide/16 v7, 0x0

    .line 29
    .line 30
    cmp-long v0, v0, v7

    .line 31
    .line 32
    if-lez v0, :cond_4

    .line 33
    .line 34
    const-wide/16 v0, 0xfa

    .line 35
    .line 36
    cmp-long v0, v2, v0

    .line 37
    .line 38
    if-gtz v0, :cond_0

    .line 39
    .line 40
    iput-object v6, p0, Ll/tqc0;->n:Ljava/lang/String;

    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    float-to-double v0, v4

    .line 44
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    .line 45
    .line 46
    .line 47
    move-result-wide v0

    .line 48
    double-to-int v0, v0

    .line 49
    const/4 v1, 0x1

    .line 50
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    int-to-long v1, v0

    .line 55
    iget-wide v3, p0, Ll/tqc0;->o:J

    .line 56
    .line 57
    cmp-long v3, v1, v3

    .line 58
    .line 59
    if-eqz v3, :cond_3

    .line 60
    .line 61
    const/16 v3, 0x3c

    .line 62
    .line 63
    if-ge v0, v3, :cond_2

    .line 64
    .line 65
    new-instance v3, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    const-string v4, "0:"

    .line 68
    .line 69
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    const/16 v4, 0xa

    .line 73
    .line 74
    if-lt v0, v4, :cond_1

    .line 75
    .line 76
    const-string v4, ""

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_1
    const-string v4, "0"

    .line 80
    .line 81
    :goto_0
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iput-object v0, p0, Ll/tqc0;->n:Ljava/lang/String;

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_2
    const-string v0, "0:60"

    .line 95
    .line 96
    iput-object v0, p0, Ll/tqc0;->n:Ljava/lang/String;

    .line 97
    .line 98
    :goto_1
    iput-wide v1, p0, Ll/tqc0;->o:J

    .line 99
    .line 100
    :cond_3
    return-void

    .line 101
    :cond_4
    iput-object v6, p0, Ll/tqc0;->n:Ljava/lang/String;

    .line 102
    .line 103
    const-wide/16 v0, -0x1

    .line 104
    .line 105
    iput-wide v0, p0, Ll/tqc0;->o:J

    .line 106
    .line 107
    return-void
.end method
