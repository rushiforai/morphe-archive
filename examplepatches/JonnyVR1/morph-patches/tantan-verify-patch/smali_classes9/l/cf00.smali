.class public Ll/cf00;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# static fields
.field public static v:Landroid/graphics/Rect;


# instance fields
.field public a:I

.field public b:Landroid/graphics/Paint;

.field public c:Landroid/graphics/Paint;

.field public d:I

.field public e:F

.field public f:F

.field public g:F

.field public h:I

.field public i:F

.field public j:F

.field public k:I

.field public final l:Ljava/lang/String;

.field public final m:I

.field public final n:I

.field public final o:I

.field public final p:I

.field public q:I

.field public r:I

.field public s:Ljava/lang/String;

.field public t:I

.field public u:Landroid/graphics/Paint;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/cf00;->v:Landroid/graphics/Rect;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;IIIIIFIZ)V
    .locals 8

    .line 1
    move/from16 v1, p9

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 4
    .line 5
    .line 6
    const/high16 v2, 0x41600000    # 14.0f

    .line 7
    .line 8
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    iput v2, p0, Ll/cf00;->a:I

    .line 13
    .line 14
    const/4 v6, 0x0

    .line 15
    iput v6, p0, Ll/cf00;->q:I

    .line 16
    .line 17
    iput v6, p0, Ll/cf00;->r:I

    .line 18
    .line 19
    const/4 v7, -0x1

    .line 20
    iput v7, p0, Ll/cf00;->t:I

    .line 21
    .line 22
    if-lez v1, :cond_0

    .line 23
    .line 24
    int-to-float v1, v1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/high16 v1, 0x41700000    # 15.0f

    .line 27
    .line 28
    :goto_0
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    iput v1, p0, Ll/cf00;->a:I

    .line 33
    .line 34
    move-object v0, p0

    .line 35
    move-object v1, p1

    .line 36
    move v2, p6

    .line 37
    move v3, p7

    .line 38
    move/from16 v4, p8

    .line 39
    .line 40
    move/from16 v5, p10

    .line 41
    .line 42
    invoke-virtual/range {v0 .. v5}, Ll/cf00;->b(Landroid/content/Context;IIFZ)V

    .line 43
    .line 44
    .line 45
    iput-object p2, p0, Ll/cf00;->l:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v1, p0, Ll/cf00;->c:Landroid/graphics/Paint;

    .line 48
    .line 49
    invoke-virtual {v1, p2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    float-to-int v1, v1

    .line 54
    iput p3, p0, Ll/cf00;->m:I

    .line 55
    .line 56
    iput p4, p0, Ll/cf00;->o:I

    .line 57
    .line 58
    int-to-float v1, v1

    .line 59
    iget v2, p0, Ll/cf00;->e:F

    .line 60
    .line 61
    const/high16 v3, 0x40000000    # 2.0f

    .line 62
    .line 63
    mul-float/2addr v2, v3

    .line 64
    add-float/2addr v1, v2

    .line 65
    float-to-int v1, v1

    .line 66
    if-ne p5, v7, :cond_1

    .line 67
    .line 68
    move v2, v1

    .line 69
    goto :goto_1

    .line 70
    :cond_1
    iget v2, p0, Ll/cf00;->r:I

    .line 71
    .line 72
    sub-int v2, p5, v2

    .line 73
    .line 74
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    :goto_1
    iput v2, p0, Ll/cf00;->n:I

    .line 79
    .line 80
    iget v4, p0, Ll/cf00;->d:I

    .line 81
    .line 82
    int-to-float v4, v4

    .line 83
    iget v5, p0, Ll/cf00;->f:F

    .line 84
    .line 85
    mul-float/2addr v5, v3

    .line 86
    add-float/2addr v4, v5

    .line 87
    iget v5, p0, Ll/cf00;->g:F

    .line 88
    .line 89
    mul-float/2addr v5, v3

    .line 90
    add-float/2addr v4, v5

    .line 91
    float-to-int v4, v4

    .line 92
    iput v4, p0, Ll/cf00;->p:I

    .line 93
    .line 94
    iget v5, p0, Ll/cf00;->r:I

    .line 95
    .line 96
    add-int/2addr v2, v5

    .line 97
    invoke-virtual {p0, v6, v6, v2, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 98
    .line 99
    .line 100
    iput p5, p0, Ll/cf00;->t:I

    .line 101
    .line 102
    if-eq p5, v7, :cond_3

    .line 103
    .line 104
    iget v2, p0, Ll/cf00;->r:I

    .line 105
    .line 106
    sub-int v4, p5, v2

    .line 107
    .line 108
    if-le v1, v4, :cond_2

    .line 109
    .line 110
    sub-int v1, p5, v2

    .line 111
    .line 112
    iget v2, p0, Ll/cf00;->e:F

    .line 113
    .line 114
    mul-float/2addr v2, v3

    .line 115
    float-to-int v2, v2

    .line 116
    sub-int/2addr v1, v2

    .line 117
    invoke-virtual {p0, v1}, Ll/cf00;->a(I)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_2
    iput-object p2, p0, Ll/cf00;->s:Ljava/lang/String;

    .line 122
    .line 123
    :cond_3
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;IIIIIFIZI)V
    .locals 0

    .line 124
    invoke-direct/range {p0 .. p10}, Ll/cf00;-><init>(Landroid/content/Context;Ljava/lang/String;IIIIIFIZ)V

    .line 125
    iput p11, p0, Ll/cf00;->q:I

    return-void
.end method


# virtual methods
.method public final a(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cf00;->l:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    if-lez p1, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/cf00;->l:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-lez v0, :cond_1

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    :goto_0
    iget-object v1, p0, Ll/cf00;->l:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-ge v0, v1, :cond_1

    .line 27
    .line 28
    iget-object v1, p0, Ll/cf00;->l:Ljava/lang/String;

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v2, "..."

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iget-object v2, p0, Ll/cf00;->c:Landroid/graphics/Paint;

    .line 42
    .line 43
    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    int-to-float v3, p1

    .line 48
    cmpl-float v2, v2, v3

    .line 49
    .line 50
    if-lez v2, :cond_0

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_0
    iput-object v1, p0, Ll/cf00;->s:Ljava/lang/String;

    .line 54
    .line 55
    add-int/lit8 v0, v0, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    :goto_1
    return-void
.end method

.method public b(Landroid/content/Context;IIFZ)V
    .locals 2

    .line 1
    iget v0, p0, Ll/cf00;->a:I

    .line 2
    .line 3
    iget v1, p0, Ll/cf00;->k:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/cf00;->c:Landroid/graphics/Paint;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

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
    iget v0, p0, Ll/cf00;->a:I

    .line 17
    .line 18
    iput v0, p0, Ll/cf00;->k:I

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    .line 29
    .line 30
    new-instance v0, Landroid/text/TextPaint;

    .line 31
    .line 32
    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Ll/cf00;->c:Landroid/graphics/Paint;

    .line 36
    .line 37
    if-eqz p5, :cond_1

    .line 38
    .line 39
    sget-object p5, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 40
    .line 41
    invoke-virtual {v0, p5}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const/4 p5, 0x2

    .line 46
    invoke-static {p5}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 47
    .line 48
    .line 49
    move-result-object p5

    .line 50
    invoke-virtual {v0, p5}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 51
    .line 52
    .line 53
    :goto_0
    iget-object p5, p0, Ll/cf00;->c:Landroid/graphics/Paint;

    .line 54
    .line 55
    iget v0, p0, Ll/cf00;->k:I

    .line 56
    .line 57
    int-to-float v0, v0

    .line 58
    invoke-virtual {p5, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 59
    .line 60
    .line 61
    iget-object p5, p0, Ll/cf00;->c:Landroid/graphics/Paint;

    .line 62
    .line 63
    const/4 v0, 0x1

    .line 64
    invoke-virtual {p5, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 65
    .line 66
    .line 67
    iget-object p5, p0, Ll/cf00;->c:Landroid/graphics/Paint;

    .line 68
    .line 69
    invoke-virtual {p5}, Landroid/graphics/Paint;->getFlags()I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    or-int/lit16 v1, v1, 0x80

    .line 74
    .line 75
    invoke-virtual {p5, v1}, Landroid/graphics/Paint;->setFlags(I)V

    .line 76
    .line 77
    .line 78
    const/high16 p5, 0x41880000    # 17.0f

    .line 79
    .line 80
    mul-float/2addr p5, p1

    .line 81
    iput p5, p0, Ll/cf00;->e:F

    .line 82
    .line 83
    const/high16 p5, 0x41000000    # 8.0f

    .line 84
    .line 85
    mul-float/2addr p5, p1

    .line 86
    iput p5, p0, Ll/cf00;->f:F

    .line 87
    .line 88
    mul-float/2addr p4, p1

    .line 89
    iput p4, p0, Ll/cf00;->g:F

    .line 90
    .line 91
    int-to-float p2, p2

    .line 92
    mul-float/2addr p2, p1

    .line 93
    float-to-int p1, p2

    .line 94
    iput p1, p0, Ll/cf00;->r:I

    .line 95
    .line 96
    new-instance p1, Landroid/graphics/Paint;

    .line 97
    .line 98
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 99
    .line 100
    .line 101
    iput-object p1, p0, Ll/cf00;->b:Landroid/graphics/Paint;

    .line 102
    .line 103
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 104
    .line 105
    .line 106
    iput p3, p0, Ll/cf00;->h:I

    .line 107
    .line 108
    iget-object p1, p0, Ll/cf00;->c:Landroid/graphics/Paint;

    .line 109
    .line 110
    invoke-virtual {p1}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    iget p1, p1, Landroid/graphics/Paint$FontMetrics;->ascent:F

    .line 115
    .line 116
    iput p1, p0, Ll/cf00;->i:F

    .line 117
    .line 118
    iget-object p1, p0, Ll/cf00;->c:Landroid/graphics/Paint;

    .line 119
    .line 120
    invoke-virtual {p1}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    iget p1, p1, Landroid/graphics/Paint$FontMetrics;->descent:F

    .line 125
    .line 126
    iput p1, p0, Ll/cf00;->j:F

    .line 127
    .line 128
    iget p2, p0, Ll/cf00;->i:F

    .line 129
    .line 130
    sub-float/2addr p1, p2

    .line 131
    float-to-int p1, p1

    .line 132
    iput p1, p0, Ll/cf00;->d:I

    .line 133
    .line 134
    return-void
.end method

.method public c(IF)Ll/cf00;
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/cf00;->u:Landroid/graphics/Paint;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/graphics/Paint;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/cf00;->u:Landroid/graphics/Paint;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/cf00;->u:Landroid/graphics/Paint;

    .line 13
    .line 14
    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Ll/cf00;->u:Landroid/graphics/Paint;

    .line 18
    .line 19
    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/cf00;->u:Landroid/graphics/Paint;

    .line 23
    .line 24
    const/4 p2, 0x1

    .line 25
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/cf00;->u:Landroid/graphics/Paint;

    .line 29
    .line 30
    sget-object p2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 31
    .line 32
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 33
    .line 34
    .line 35
    return-object p0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 9

    .line 1
    iget v0, p0, Ll/cf00;->t:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    const/high16 v3, 0x3f800000    # 1.0f

    .line 6
    .line 7
    const/high16 v4, 0x40000000    # 2.0f

    .line 8
    .line 9
    const/4 v5, 0x0

    .line 10
    if-ne v0, v1, :cond_6

    .line 11
    .line 12
    sget-object v0, Ll/cf00;->v:Landroid/graphics/Rect;

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->getClipBounds(Landroid/graphics/Rect;)Z

    .line 15
    .line 16
    .line 17
    sget-object v0, Ll/cf00;->v:Landroid/graphics/Rect;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    sget-object v0, Ll/cf00;->v:Landroid/graphics/Rect;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    :goto_0
    iget v1, p0, Ll/cf00;->n:I

    .line 37
    .line 38
    if-ge v0, v1, :cond_1

    .line 39
    .line 40
    const/4 v2, 0x1

    .line 41
    :cond_1
    if-eqz v2, :cond_2

    .line 42
    .line 43
    move v1, v0

    .line 44
    :cond_2
    iget-object v6, p0, Ll/cf00;->b:Landroid/graphics/Paint;

    .line 45
    .line 46
    iget v7, p0, Ll/cf00;->o:I

    .line 47
    .line 48
    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 49
    .line 50
    .line 51
    new-instance v6, Landroid/graphics/RectF;

    .line 52
    .line 53
    iget v7, p0, Ll/cf00;->g:F

    .line 54
    .line 55
    int-to-float v1, v1

    .line 56
    iget v8, p0, Ll/cf00;->p:I

    .line 57
    .line 58
    int-to-float v8, v8

    .line 59
    sub-float/2addr v8, v7

    .line 60
    invoke-direct {v6, v5, v7, v1, v8}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 61
    .line 62
    .line 63
    iget v1, p0, Ll/cf00;->h:I

    .line 64
    .line 65
    int-to-float v5, v1

    .line 66
    int-to-float v1, v1

    .line 67
    iget-object v7, p0, Ll/cf00;->b:Landroid/graphics/Paint;

    .line 68
    .line 69
    invoke-virtual {p1, v6, v5, v1, v7}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 70
    .line 71
    .line 72
    iget-object v1, p0, Ll/cf00;->u:Landroid/graphics/Paint;

    .line 73
    .line 74
    if-eqz v1, :cond_3

    .line 75
    .line 76
    invoke-virtual {v1}, Landroid/graphics/Paint;->getStrokeWidth()F

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    div-float/2addr v1, v4

    .line 81
    add-float/2addr v1, v3

    .line 82
    iget v4, v6, Landroid/graphics/RectF;->left:F

    .line 83
    .line 84
    add-float/2addr v4, v1

    .line 85
    iput v4, v6, Landroid/graphics/RectF;->left:F

    .line 86
    .line 87
    iget v4, v6, Landroid/graphics/RectF;->top:F

    .line 88
    .line 89
    add-float/2addr v4, v1

    .line 90
    iput v4, v6, Landroid/graphics/RectF;->top:F

    .line 91
    .line 92
    sub-float/2addr v4, v1

    .line 93
    iput v4, v6, Landroid/graphics/RectF;->right:F

    .line 94
    .line 95
    iget v4, v6, Landroid/graphics/RectF;->bottom:F

    .line 96
    .line 97
    sub-float/2addr v4, v1

    .line 98
    iput v4, v6, Landroid/graphics/RectF;->bottom:F

    .line 99
    .line 100
    iget v1, p0, Ll/cf00;->h:I

    .line 101
    .line 102
    int-to-float v4, v1

    .line 103
    int-to-float v1, v1

    .line 104
    iget-object v5, p0, Ll/cf00;->u:Landroid/graphics/Paint;

    .line 105
    .line 106
    invoke-virtual {p1, v6, v4, v1, v5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 107
    .line 108
    .line 109
    :cond_3
    if-eqz v2, :cond_4

    .line 110
    .line 111
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 112
    .line 113
    .line 114
    int-to-float v0, v0

    .line 115
    mul-float/2addr v0, v3

    .line 116
    iget v1, p0, Ll/cf00;->n:I

    .line 117
    .line 118
    int-to-float v1, v1

    .line 119
    div-float/2addr v0, v1

    .line 120
    invoke-virtual {p1, v0, v3}, Landroid/graphics/Canvas;->scale(FF)V

    .line 121
    .line 122
    .line 123
    :cond_4
    iget-object v0, p0, Ll/cf00;->c:Landroid/graphics/Paint;

    .line 124
    .line 125
    iget v1, p0, Ll/cf00;->m:I

    .line 126
    .line 127
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Ll/cf00;->l:Ljava/lang/String;

    .line 131
    .line 132
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-eqz v0, :cond_5

    .line 137
    .line 138
    iget-object v0, p0, Ll/cf00;->l:Ljava/lang/String;

    .line 139
    .line 140
    iget v1, p0, Ll/cf00;->e:F

    .line 141
    .line 142
    iget v3, p0, Ll/cf00;->p:I

    .line 143
    .line 144
    int-to-float v3, v3

    .line 145
    iget v4, p0, Ll/cf00;->g:F

    .line 146
    .line 147
    sub-float/2addr v3, v4

    .line 148
    iget v4, p0, Ll/cf00;->f:F

    .line 149
    .line 150
    sub-float/2addr v3, v4

    .line 151
    iget v4, p0, Ll/cf00;->j:F

    .line 152
    .line 153
    sub-float/2addr v3, v4

    .line 154
    iget-object p0, p0, Ll/cf00;->c:Landroid/graphics/Paint;

    .line 155
    .line 156
    invoke-virtual {p1, v0, v1, v3, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 157
    .line 158
    .line 159
    :cond_5
    if-eqz v2, :cond_a

    .line 160
    .line 161
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 162
    .line 163
    .line 164
    return-void

    .line 165
    :cond_6
    iget v0, p0, Ll/cf00;->q:I

    .line 166
    .line 167
    iget-object v1, p0, Ll/cf00;->b:Landroid/graphics/Paint;

    .line 168
    .line 169
    if-lez v0, :cond_8

    .line 170
    .line 171
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 172
    .line 173
    .line 174
    new-instance v0, Landroid/graphics/RectF;

    .line 175
    .line 176
    iget v1, p0, Ll/cf00;->n:I

    .line 177
    .line 178
    int-to-float v1, v1

    .line 179
    iget v2, p0, Ll/cf00;->q:I

    .line 180
    .line 181
    int-to-float v2, v2

    .line 182
    iget v6, p0, Ll/cf00;->g:F

    .line 183
    .line 184
    mul-float/2addr v6, v4

    .line 185
    add-float/2addr v2, v6

    .line 186
    invoke-direct {v0, v5, v5, v1, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 187
    .line 188
    .line 189
    iget-object v0, p0, Ll/cf00;->b:Landroid/graphics/Paint;

    .line 190
    .line 191
    iget v1, p0, Ll/cf00;->o:I

    .line 192
    .line 193
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 194
    .line 195
    .line 196
    new-instance v0, Landroid/graphics/RectF;

    .line 197
    .line 198
    iget v1, p0, Ll/cf00;->n:I

    .line 199
    .line 200
    int-to-float v1, v1

    .line 201
    iget v2, p0, Ll/cf00;->q:I

    .line 202
    .line 203
    int-to-float v2, v2

    .line 204
    invoke-direct {v0, v5, v5, v1, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 205
    .line 206
    .line 207
    iget v1, p0, Ll/cf00;->h:I

    .line 208
    .line 209
    int-to-float v2, v1

    .line 210
    int-to-float v1, v1

    .line 211
    iget-object v5, p0, Ll/cf00;->b:Landroid/graphics/Paint;

    .line 212
    .line 213
    invoke-virtual {p1, v0, v2, v1, v5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 214
    .line 215
    .line 216
    iget-object v1, p0, Ll/cf00;->u:Landroid/graphics/Paint;

    .line 217
    .line 218
    if-eqz v1, :cond_7

    .line 219
    .line 220
    invoke-virtual {v1}, Landroid/graphics/Paint;->getStrokeWidth()F

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    div-float/2addr v1, v4

    .line 225
    add-float/2addr v1, v3

    .line 226
    iget v2, v0, Landroid/graphics/RectF;->left:F

    .line 227
    .line 228
    add-float/2addr v2, v1

    .line 229
    iput v2, v0, Landroid/graphics/RectF;->left:F

    .line 230
    .line 231
    iget v2, v0, Landroid/graphics/RectF;->top:F

    .line 232
    .line 233
    add-float/2addr v2, v1

    .line 234
    iput v2, v0, Landroid/graphics/RectF;->top:F

    .line 235
    .line 236
    iget v2, v0, Landroid/graphics/RectF;->right:F

    .line 237
    .line 238
    sub-float/2addr v2, v1

    .line 239
    iput v2, v0, Landroid/graphics/RectF;->right:F

    .line 240
    .line 241
    iget v2, v0, Landroid/graphics/RectF;->bottom:F

    .line 242
    .line 243
    sub-float/2addr v2, v1

    .line 244
    iput v2, v0, Landroid/graphics/RectF;->bottom:F

    .line 245
    .line 246
    iget v1, p0, Ll/cf00;->h:I

    .line 247
    .line 248
    int-to-float v2, v1

    .line 249
    int-to-float v1, v1

    .line 250
    iget-object v3, p0, Ll/cf00;->u:Landroid/graphics/Paint;

    .line 251
    .line 252
    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 253
    .line 254
    .line 255
    :cond_7
    iget-object v1, p0, Ll/cf00;->s:Ljava/lang/String;

    .line 256
    .line 257
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 258
    .line 259
    .line 260
    move-result v1

    .line 261
    if-eqz v1, :cond_a

    .line 262
    .line 263
    iget-object v1, p0, Ll/cf00;->c:Landroid/graphics/Paint;

    .line 264
    .line 265
    iget v2, p0, Ll/cf00;->m:I

    .line 266
    .line 267
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 268
    .line 269
    .line 270
    iget-object v1, p0, Ll/cf00;->s:Ljava/lang/String;

    .line 271
    .line 272
    iget v2, p0, Ll/cf00;->e:F

    .line 273
    .line 274
    iget v3, p0, Ll/cf00;->j:F

    .line 275
    .line 276
    iget v5, p0, Ll/cf00;->i:F

    .line 277
    .line 278
    sub-float v5, v3, v5

    .line 279
    .line 280
    div-float/2addr v5, v4

    .line 281
    sub-float/2addr v5, v3

    .line 282
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerY()F

    .line 283
    .line 284
    .line 285
    move-result v0

    .line 286
    add-float/2addr v5, v0

    .line 287
    iget-object p0, p0, Ll/cf00;->c:Landroid/graphics/Paint;

    .line 288
    .line 289
    invoke-virtual {p1, v1, v2, v5, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 290
    .line 291
    .line 292
    return-void

    .line 293
    :cond_8
    iget v0, p0, Ll/cf00;->o:I

    .line 294
    .line 295
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 296
    .line 297
    .line 298
    new-instance v0, Landroid/graphics/RectF;

    .line 299
    .line 300
    iget v1, p0, Ll/cf00;->g:F

    .line 301
    .line 302
    iget v2, p0, Ll/cf00;->n:I

    .line 303
    .line 304
    int-to-float v2, v2

    .line 305
    iget v6, p0, Ll/cf00;->p:I

    .line 306
    .line 307
    int-to-float v6, v6

    .line 308
    sub-float/2addr v6, v1

    .line 309
    invoke-direct {v0, v5, v1, v2, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 310
    .line 311
    .line 312
    iget v1, p0, Ll/cf00;->h:I

    .line 313
    .line 314
    int-to-float v2, v1

    .line 315
    int-to-float v1, v1

    .line 316
    iget-object v5, p0, Ll/cf00;->b:Landroid/graphics/Paint;

    .line 317
    .line 318
    invoke-virtual {p1, v0, v2, v1, v5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 319
    .line 320
    .line 321
    iget-object v1, p0, Ll/cf00;->u:Landroid/graphics/Paint;

    .line 322
    .line 323
    if-eqz v1, :cond_9

    .line 324
    .line 325
    invoke-virtual {v1}, Landroid/graphics/Paint;->getStrokeWidth()F

    .line 326
    .line 327
    .line 328
    move-result v1

    .line 329
    div-float/2addr v1, v4

    .line 330
    add-float/2addr v1, v3

    .line 331
    iget v2, v0, Landroid/graphics/RectF;->left:F

    .line 332
    .line 333
    add-float/2addr v2, v1

    .line 334
    iput v2, v0, Landroid/graphics/RectF;->left:F

    .line 335
    .line 336
    iget v2, v0, Landroid/graphics/RectF;->top:F

    .line 337
    .line 338
    add-float/2addr v2, v1

    .line 339
    iput v2, v0, Landroid/graphics/RectF;->top:F

    .line 340
    .line 341
    iget v2, v0, Landroid/graphics/RectF;->right:F

    .line 342
    .line 343
    sub-float/2addr v2, v1

    .line 344
    iput v2, v0, Landroid/graphics/RectF;->right:F

    .line 345
    .line 346
    iget v2, v0, Landroid/graphics/RectF;->bottom:F

    .line 347
    .line 348
    sub-float/2addr v2, v1

    .line 349
    iput v2, v0, Landroid/graphics/RectF;->bottom:F

    .line 350
    .line 351
    iget v1, p0, Ll/cf00;->h:I

    .line 352
    .line 353
    int-to-float v2, v1

    .line 354
    int-to-float v1, v1

    .line 355
    iget-object v3, p0, Ll/cf00;->u:Landroid/graphics/Paint;

    .line 356
    .line 357
    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 358
    .line 359
    .line 360
    :cond_9
    iget-object v0, p0, Ll/cf00;->s:Ljava/lang/String;

    .line 361
    .line 362
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 363
    .line 364
    .line 365
    move-result v0

    .line 366
    if-eqz v0, :cond_a

    .line 367
    .line 368
    iget-object v0, p0, Ll/cf00;->c:Landroid/graphics/Paint;

    .line 369
    .line 370
    iget v1, p0, Ll/cf00;->m:I

    .line 371
    .line 372
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 373
    .line 374
    .line 375
    iget-object v0, p0, Ll/cf00;->s:Ljava/lang/String;

    .line 376
    .line 377
    iget v1, p0, Ll/cf00;->e:F

    .line 378
    .line 379
    iget v2, p0, Ll/cf00;->p:I

    .line 380
    .line 381
    int-to-float v2, v2

    .line 382
    iget v3, p0, Ll/cf00;->g:F

    .line 383
    .line 384
    sub-float/2addr v2, v3

    .line 385
    iget v3, p0, Ll/cf00;->f:F

    .line 386
    .line 387
    sub-float/2addr v2, v3

    .line 388
    iget v3, p0, Ll/cf00;->j:F

    .line 389
    .line 390
    sub-float/2addr v2, v3

    .line 391
    iget-object p0, p0, Ll/cf00;->c:Landroid/graphics/Paint;

    .line 392
    .line 393
    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 394
    .line 395
    .line 396
    :cond_a
    return-void
.end method

.method public getIntrinsicHeight()I
    .locals 0

    .line 1
    iget p0, p0, Ll/cf00;->p:I

    .line 2
    .line 3
    return p0
.end method

.method public getIntrinsicWidth()I
    .locals 0

    .line 1
    iget p0, p0, Ll/cf00;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public getMinimumHeight()I
    .locals 0

    .line 1
    iget p0, p0, Ll/cf00;->p:I

    .line 2
    .line 3
    return p0
.end method

.method public getMinimumWidth()I
    .locals 0

    .line 1
    iget p0, p0, Ll/cf00;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public setAlpha(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    return-void
.end method
