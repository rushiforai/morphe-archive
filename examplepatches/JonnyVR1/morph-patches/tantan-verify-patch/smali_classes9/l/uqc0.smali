.class public Ll/uqc0;
.super Ll/lam;
.source "SourceFile"


# instance fields
.field public i:I

.field public j:I

.field public k:Landroid/text/TextPaint;

.field public l:[Ljava/lang/String;

.field public m:[Ljava/lang/String;

.field public n:I

.field public o:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/lam;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Ll/uqc0;->n:I

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/uqc0;->n()V

    .line 8
    .line 9
    .line 10
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
    const/16 v0, 0x33

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
    iput p2, p0, Ll/uqc0;->n:I

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
    iput v0, p0, Ll/uqc0;->n:I

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
    iput v0, p0, Ll/uqc0;->n:I

    .line 28
    .line 29
    :cond_2
    return-void
.end method

.method public g(Landroid/graphics/Canvas;II)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/uqc0;->k:Landroid/text/TextPaint;

    .line 2
    .line 3
    iget p3, p0, Ll/uqc0;->n:I

    .line 4
    .line 5
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/uqc0;->m()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    iget p3, p0, Ll/uqc0;->i:I

    .line 13
    .line 14
    int-to-float p3, p3

    .line 15
    iget v0, p0, Ll/uqc0;->j:I

    .line 16
    .line 17
    int-to-float v0, v0

    .line 18
    iget-object v1, p0, Ll/uqc0;->k:Landroid/text/TextPaint;

    .line 19
    .line 20
    invoke-virtual {p1, p2, p3, v0, v1}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 21
    .line 22
    .line 23
    iget-object p2, p0, Ll/uqc0;->k:Landroid/text/TextPaint;

    .line 24
    .line 25
    iget p3, p0, Ll/uqc0;->n:I

    .line 26
    .line 27
    div-int/lit8 p3, p3, 0x3

    .line 28
    .line 29
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/uqc0;->l()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    iget p3, p0, Ll/uqc0;->i:I

    .line 37
    .line 38
    int-to-float p3, p3

    .line 39
    iget v0, p0, Ll/uqc0;->j:I

    .line 40
    .line 41
    int-to-float v0, v0

    .line 42
    iget-object p0, p0, Ll/uqc0;->k:Landroid/text/TextPaint;

    .line 43
    .line 44
    invoke-virtual {p1, p2, p3, v0, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public h(II)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Ll/lam;->h(II)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Ll/lam;->g:Landroid/graphics/RectF;

    .line 5
    .line 6
    int-to-float v0, p1

    .line 7
    const/16 v1, 0x2a

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Ll/lam;->a(I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    int-to-float v1, v1

    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-virtual {p2, v2, v2, v0, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 16
    .line 17
    .line 18
    div-int/lit8 p1, p1, 0x2

    .line 19
    .line 20
    iput p1, p0, Ll/uqc0;->i:I

    .line 21
    .line 22
    return-void
.end method

.method public final l()Ljava/lang/String;
    .locals 7

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
    long-to-float v2, v2

    .line 13
    const/high16 v3, 0x447a0000    # 1000.0f

    .line 14
    .line 15
    div-float/2addr v2, v3

    .line 16
    float-to-double v2, v2

    .line 17
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    double-to-int v2, v2

    .line 22
    const/16 v3, 0x32

    .line 23
    .line 24
    const-string v4, ""

    .line 25
    .line 26
    if-lt v2, v3, :cond_1

    .line 27
    .line 28
    const-wide/16 v5, 0x0

    .line 29
    .line 30
    cmp-long v0, v0, v5

    .line 31
    .line 32
    if-lez v0, :cond_1

    .line 33
    .line 34
    rsub-int/lit8 v0, v2, 0x3c

    .line 35
    .line 36
    int-to-long v0, v0

    .line 37
    cmp-long v0, v0, v5

    .line 38
    .line 39
    if-gtz v0, :cond_0

    .line 40
    .line 41
    iget-object p0, p0, Ll/uqc0;->m:[Ljava/lang/String;

    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    aget-object p0, p0, v0

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_0
    return-object v4

    .line 48
    :cond_1
    invoke-virtual {p0}, Ll/lam;->c()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iget-object v1, p0, Ll/uqc0;->l:[Ljava/lang/String;

    .line 53
    .line 54
    array-length v1, v1

    .line 55
    if-ge v0, v1, :cond_2

    .line 56
    .line 57
    iget-object v0, p0, Ll/uqc0;->m:[Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/lam;->c()I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    aget-object p0, v0, p0

    .line 64
    .line 65
    return-object p0

    .line 66
    :cond_2
    return-object v4
.end method

.method public final m()Ljava/lang/String;
    .locals 5

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
    long-to-float v2, v2

    .line 13
    const/high16 v3, 0x447a0000    # 1000.0f

    .line 14
    .line 15
    div-float/2addr v2, v3

    .line 16
    float-to-double v2, v2

    .line 17
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    double-to-int v2, v2

    .line 22
    const/16 v3, 0x32

    .line 23
    .line 24
    if-lt v2, v3, :cond_1

    .line 25
    .line 26
    const-wide/16 v3, 0x0

    .line 27
    .line 28
    cmp-long v0, v0, v3

    .line 29
    .line 30
    if-lez v0, :cond_1

    .line 31
    .line 32
    rsub-int/lit8 v0, v2, 0x3c

    .line 33
    .line 34
    int-to-long v0, v0

    .line 35
    cmp-long v2, v0, v3

    .line 36
    .line 37
    if-gtz v2, :cond_0

    .line 38
    .line 39
    iget-object p0, p0, Ll/uqc0;->l:[Ljava/lang/String;

    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    aget-object p0, p0, v0

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_0
    iget-object p0, p0, Ll/uqc0;->o:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0

    .line 60
    :cond_1
    invoke-virtual {p0}, Ll/lam;->c()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iget-object v1, p0, Ll/uqc0;->l:[Ljava/lang/String;

    .line 65
    .line 66
    array-length v2, v1

    .line 67
    if-ge v0, v2, :cond_2

    .line 68
    .line 69
    invoke-virtual {p0}, Ll/lam;->c()I

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    aget-object p0, v1, p0

    .line 74
    .line 75
    return-object p0

    .line 76
    :cond_2
    const-string p0, ""

    .line 77
    .line 78
    return-object p0
.end method

.method public final n()V
    .locals 5

    .line 1
    new-instance v0, Landroid/text/TextPaint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/uqc0;->k:Landroid/text/TextPaint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v2, p0, Ll/uqc0;->k:Landroid/text/TextPaint;

    .line 21
    .line 22
    const-string v3, "in"

    .line 23
    .line 24
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    const/16 v4, 0xd

    .line 29
    .line 30
    if-nez v3, :cond_1

    .line 31
    .line 32
    const-string v3, "id"

    .line 33
    .line 34
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    move v0, v4

    .line 42
    goto :goto_1

    .line 43
    :cond_1
    :goto_0
    const/16 v0, 0xb

    .line 44
    .line 45
    :goto_1
    invoke-virtual {p0, v0}, Ll/lam;->a(I)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    int-to-float v0, v0

    .line 50
    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/uqc0;->k:Landroid/text/TextPaint;

    .line 54
    .line 55
    const/high16 v2, -0x1000000

    .line 56
    .line 57
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/uqc0;->k:Landroid/text/TextPaint;

    .line 61
    .line 62
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/uqc0;->k:Landroid/text/TextPaint;

    .line 66
    .line 67
    sget-object v2, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 68
    .line 69
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/uqc0;->k:Landroid/text/TextPaint;

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/uqc0;->k:Landroid/text/TextPaint;

    .line 78
    .line 79
    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iget v1, v0, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 84
    .line 85
    iget v0, v0, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 86
    .line 87
    const/16 v2, 0x15

    .line 88
    .line 89
    invoke-virtual {p0, v2}, Ll/lam;->a(I)I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    int-to-float v2, v2

    .line 94
    const/high16 v3, 0x40000000    # 2.0f

    .line 95
    .line 96
    div-float/2addr v1, v3

    .line 97
    sub-float/2addr v2, v1

    .line 98
    div-float/2addr v0, v3

    .line 99
    sub-float/2addr v2, v0

    .line 100
    float-to-int v0, v2

    .line 101
    iput v0, p0, Ll/uqc0;->j:I

    .line 102
    .line 103
    new-instance v0, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Ll/lam;->b()Landroid/content/Context;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->d1:I

    .line 113
    .line 114
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    const-string v1, "   "

    .line 122
    .line 123
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0}, Ll/lam;->b()Landroid/content/Context;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->e1:I

    .line 131
    .line 132
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {p0}, Ll/lam;->b()Landroid/content/Context;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->f1:I

    .line 148
    .line 149
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    iput-object v1, p0, Ll/uqc0;->o:Ljava/lang/String;

    .line 154
    .line 155
    const-string v1, ""

    .line 156
    .line 157
    filled-new-array {v0, v1, v1}, [Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    iput-object v0, p0, Ll/uqc0;->l:[Ljava/lang/String;

    .line 162
    .line 163
    const-string v0, "|"

    .line 164
    .line 165
    filled-new-array {v0, v1, v1}, [Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    iput-object v0, p0, Ll/uqc0;->m:[Ljava/lang/String;

    .line 170
    .line 171
    return-void
.end method
