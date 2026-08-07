.class public Ll/lqc0;
.super Ll/kam;
.source "SourceFile"


# instance fields
.field public j:Landroid/graphics/Paint;

.field public k:F

.field public l:[I

.field public m:I

.field public n:I

.field public o:Landroid/text/TextPaint;

.field public p:F

.field public q:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/kam;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const p1, -0x181e3

    .line 5
    .line 6
    .line 7
    const v0, -0x9b9c

    .line 8
    .line 9
    .line 10
    filled-new-array {p1, v0}, [I

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/lqc0;->l:[I

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    aget p1, p1, v0

    .line 18
    .line 19
    iput p1, p0, Ll/lqc0;->m:I

    .line 20
    .line 21
    iput v0, p0, Ll/lqc0;->n:I

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/lqc0;->l()V

    .line 24
    .line 25
    .line 26
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
    invoke-super {p0, p1, p2}, Ll/lam;->f(II)V

    .line 5
    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x1

    .line 11
    if-ne p1, v0, :cond_1

    .line 12
    .line 13
    mul-int/lit16 p1, p2, 0xff

    .line 14
    .line 15
    div-int/lit8 p1, p1, 0x64

    .line 16
    .line 17
    iput p1, p0, Ll/lqc0;->n:I

    .line 18
    .line 19
    iget-object p1, p0, Ll/lqc0;->l:[I

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    aget v1, p1, v1

    .line 23
    .line 24
    aget p1, p1, v0

    .line 25
    .line 26
    invoke-virtual {p0, v1, p1, p2}, Ll/lam;->e(III)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iput p1, p0, Ll/lqc0;->m:I

    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    const/4 v0, 0x2

    .line 34
    if-ne p1, v0, :cond_2

    .line 35
    .line 36
    mul-int/lit16 p2, p2, 0xff

    .line 37
    .line 38
    div-int/lit8 p2, p2, 0x64

    .line 39
    .line 40
    rsub-int p1, p2, 0xff

    .line 41
    .line 42
    iput p1, p0, Ll/lqc0;->n:I

    .line 43
    .line 44
    :cond_2
    :goto_0
    return-void
.end method

.method public g(Landroid/graphics/Canvas;II)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/lam;->c()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 p3, 0x1

    .line 6
    if-ne p2, p3, :cond_0

    .line 7
    .line 8
    iget-object p2, p0, Ll/lqc0;->j:Landroid/graphics/Paint;

    .line 9
    .line 10
    iget p3, p0, Ll/lqc0;->m:I

    .line 11
    .line 12
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 13
    .line 14
    .line 15
    iget-object p2, p0, Ll/lqc0;->j:Landroid/graphics/Paint;

    .line 16
    .line 17
    iget p3, p0, Ll/lqc0;->n:I

    .line 18
    .line 19
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 20
    .line 21
    .line 22
    iget-object p2, p0, Ll/lqc0;->o:Landroid/text/TextPaint;

    .line 23
    .line 24
    iget p3, p0, Ll/lqc0;->n:I

    .line 25
    .line 26
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 27
    .line 28
    .line 29
    iget-object p2, p0, Ll/kam;->i:Landroid/graphics/RectF;

    .line 30
    .line 31
    iget p3, p0, Ll/lqc0;->k:F

    .line 32
    .line 33
    iget-object v0, p0, Ll/lqc0;->j:Landroid/graphics/Paint;

    .line 34
    .line 35
    invoke-virtual {p1, p2, p3, p3, v0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 36
    .line 37
    .line 38
    iget-object p2, p0, Ll/lqc0;->q:Ljava/lang/String;

    .line 39
    .line 40
    iget-object p3, p0, Ll/kam;->i:Landroid/graphics/RectF;

    .line 41
    .line 42
    iget v0, p3, Landroid/graphics/RectF;->left:F

    .line 43
    .line 44
    iget v1, p3, Landroid/graphics/RectF;->right:F

    .line 45
    .line 46
    add-float/2addr v0, v1

    .line 47
    const/high16 v1, 0x40000000    # 2.0f

    .line 48
    .line 49
    div-float/2addr v0, v1

    .line 50
    iget v2, p3, Landroid/graphics/RectF;->top:F

    .line 51
    .line 52
    iget p3, p3, Landroid/graphics/RectF;->bottom:F

    .line 53
    .line 54
    add-float/2addr v2, p3

    .line 55
    div-float/2addr v2, v1

    .line 56
    iget p3, p0, Ll/lqc0;->p:F

    .line 57
    .line 58
    sub-float/2addr v2, p3

    .line 59
    iget-object p0, p0, Ll/lqc0;->o:Landroid/text/TextPaint;

    .line 60
    .line 61
    invoke-virtual {p1, p2, v0, v2, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 62
    .line 63
    .line 64
    :cond_0
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

.method public final l()V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/lqc0;->j:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/lqc0;->j:Landroid/graphics/Paint;

    .line 13
    .line 14
    const v2, -0x181e3

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 18
    .line 19
    .line 20
    const/16 v0, 0xa

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/lam;->a(I)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    int-to-float v0, v0

    .line 27
    iput v0, p0, Ll/lqc0;->k:F

    .line 28
    .line 29
    new-instance v0, Landroid/text/TextPaint;

    .line 30
    .line 31
    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Ll/lqc0;->o:Landroid/text/TextPaint;

    .line 35
    .line 36
    const/4 v2, -0x1

    .line 37
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/lqc0;->o:Landroid/text/TextPaint;

    .line 41
    .line 42
    sget-object v2, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/lqc0;->o:Landroid/text/TextPaint;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/lqc0;->o:Landroid/text/TextPaint;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 55
    .line 56
    .line 57
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget-object v1, p0, Ll/lqc0;->o:Landroid/text/TextPaint;

    .line 66
    .line 67
    const-string v2, "in"

    .line 68
    .line 69
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    if-nez v2, :cond_1

    .line 74
    .line 75
    const-string v2, "id"

    .line 76
    .line 77
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_0

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_0
    const/16 v0, 0xe

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_1
    :goto_0
    const/16 v0, 0xc

    .line 88
    .line 89
    :goto_1
    invoke-virtual {p0, v0}, Ll/lam;->a(I)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    int-to-float v0, v0

    .line 94
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Ll/lqc0;->o:Landroid/text/TextPaint;

    .line 98
    .line 99
    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iget v1, v0, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 104
    .line 105
    iget v0, v0, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 106
    .line 107
    const/high16 v2, 0x40000000    # 2.0f

    .line 108
    .line 109
    div-float/2addr v1, v2

    .line 110
    div-float/2addr v0, v2

    .line 111
    add-float/2addr v1, v0

    .line 112
    iput v1, p0, Ll/lqc0;->p:F

    .line 113
    .line 114
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 115
    .line 116
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->v4:I

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    iput-object v0, p0, Ll/lqc0;->q:Ljava/lang/String;

    .line 123
    .line 124
    return-void
.end method
