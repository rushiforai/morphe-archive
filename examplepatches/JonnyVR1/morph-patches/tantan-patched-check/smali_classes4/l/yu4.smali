.class public Ll/yu4;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# static fields
.field public static r:Landroid/graphics/Paint;

.field public static s:F

.field public static t:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Landroid/graphics/Paint;",
            ">;"
        }
    .end annotation
.end field

.field public static u:Landroid/graphics/Rect;


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:I

.field public c:F

.field public d:I

.field public e:F

.field public f:F

.field public g:F

.field public h:F

.field public final i:Ljava/lang/String;

.field public final j:I

.field public final k:I

.field public final l:I

.field public final m:I

.field public n:I

.field public o:Ljava/lang/String;

.field public p:I

.field public q:Landroid/graphics/Paint;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/yu4;->t:Ljava/util/HashMap;

    .line 7
    .line 8
    new-instance v0, Landroid/graphics/Rect;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/yu4;->u:Landroid/graphics/Rect;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;IIIIIIFFFIFZ)V
    .locals 5

    move/from16 v0, p13

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    const/4 v1, 0x0

    .line 2
    iput v1, p0, Ll/yu4;->n:I

    const/4 v2, -0x1

    .line 3
    iput v2, p0, Ll/yu4;->p:I

    .line 4
    invoke-static {p4}, Ll/yu4;->c(I)I

    move-result p4

    .line 5
    sget-object v3, Ll/yu4;->t:Ljava/util/HashMap;

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_0

    .line 6
    invoke-static {p1, p4}, Ll/yu4;->d(Landroid/content/Context;I)V

    .line 7
    :cond_0
    sget-object p1, Ll/yu4;->t:Ljava/util/HashMap;

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    invoke-virtual {p1, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Paint;

    iput-object p1, p0, Ll/yu4;->a:Landroid/graphics/Paint;

    .line 8
    invoke-static {p10}, Ll/yu4;->b(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Ll/yu4;->g:F

    .line 9
    invoke-static/range {p11 .. p11}, Ll/yu4;->b(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Ll/yu4;->h:F

    .line 10
    invoke-static {p9}, Ll/yu4;->b(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Ll/yu4;->c:F

    .line 11
    invoke-static {p7}, Ll/yu4;->c(I)I

    move-result p1

    iput p1, p0, Ll/yu4;->n:I

    .line 12
    iput p8, p0, Ll/yu4;->d:I

    .line 13
    iget-object p1, p0, Ll/yu4;->a:Landroid/graphics/Paint;

    if-eqz p14, :cond_1

    const/4 p4, 0x1

    .line 14
    invoke-static {p4}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    move-result-object p4

    invoke-virtual {p1, p4}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    goto :goto_0

    :cond_1
    const/4 p4, 0x2

    .line 15
    invoke-static {p4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    move-result-object p4

    invoke-virtual {p1, p4}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 16
    :goto_0
    iget-object p1, p0, Ll/yu4;->a:Landroid/graphics/Paint;

    invoke-virtual {p1}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object p1

    iget p1, p1, Landroid/graphics/Paint$FontMetrics;->ascent:F

    iput p1, p0, Ll/yu4;->e:F

    .line 17
    iget-object p1, p0, Ll/yu4;->a:Landroid/graphics/Paint;

    invoke-virtual {p1}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object p1

    iget p1, p1, Landroid/graphics/Paint$FontMetrics;->descent:F

    iput p1, p0, Ll/yu4;->f:F

    .line 18
    iget p4, p0, Ll/yu4;->e:F

    sub-float/2addr p1, p4

    float-to-int p1, p1

    iput p1, p0, Ll/yu4;->b:I

    .line 19
    iput-object p2, p0, Ll/yu4;->i:Ljava/lang/String;

    .line 20
    iget-object p1, p0, Ll/yu4;->a:Landroid/graphics/Paint;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result p1

    float-to-int p1, p1

    .line 21
    iput p3, p0, Ll/yu4;->j:I

    .line 22
    iput p5, p0, Ll/yu4;->l:I

    int-to-float p1, p1

    .line 23
    iget p3, p0, Ll/yu4;->g:F

    const/high16 p4, 0x40000000    # 2.0f

    mul-float/2addr p3, p4

    add-float/2addr p1, p3

    float-to-int p1, p1

    if-ne p6, v2, :cond_2

    move p3, p1

    goto :goto_1

    .line 24
    :cond_2
    iget p3, p0, Ll/yu4;->n:I

    sub-int p3, p6, p3

    invoke-static {p1, p3}, Ljava/lang/Math;->min(II)I

    move-result p3

    :goto_1
    iput p3, p0, Ll/yu4;->k:I

    .line 25
    iget p5, p0, Ll/yu4;->b:I

    int-to-float p5, p5

    iget v3, p0, Ll/yu4;->h:F

    mul-float/2addr v3, p4

    add-float/2addr p5, v3

    iget v3, p0, Ll/yu4;->c:F

    mul-float/2addr v3, p4

    add-float/2addr p5, v3

    mul-float v3, v0, p4

    add-float/2addr p5, v3

    float-to-int p5, p5

    iput p5, p0, Ll/yu4;->m:I

    move/from16 v3, p12

    .line 26
    invoke-virtual {p0, v3, v0}, Ll/yu4;->e(IF)Ll/yu4;

    .line 27
    iget v0, p0, Ll/yu4;->n:I

    add-int/2addr p3, v0

    invoke-virtual {p0, v1, v1, p3, p5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 28
    iput p6, p0, Ll/yu4;->p:I

    if-eq p6, v2, :cond_4

    .line 29
    iget p3, p0, Ll/yu4;->n:I

    sub-int p5, p6, p3

    if-le p1, p5, :cond_3

    sub-int p1, p6, p3

    .line 30
    iget p2, p0, Ll/yu4;->g:F

    mul-float/2addr p2, p4

    float-to-int p2, p2

    sub-int/2addr p1, p2

    invoke-virtual {p0, p1}, Ll/yu4;->a(I)V

    return-void

    .line 31
    :cond_3
    iput-object p2, p0, Ll/yu4;->o:Ljava/lang/String;

    :cond_4
    return-void
.end method

.method public static b(F)I
    .locals 1

    .line 1
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 6
    .line 7
    mul-float/2addr v0, p0

    .line 8
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public static c(I)I
    .locals 1

    .line 1
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 6
    .line 7
    int-to-float p0, p0

    .line 8
    mul-float/2addr v0, p0

    .line 9
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static d(Landroid/content/Context;I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 10
    .line 11
    sput p0, Ll/yu4;->s:F

    .line 12
    .line 13
    new-instance p0, Landroid/text/TextPaint;

    .line 14
    .line 15
    invoke-direct {p0}, Landroid/text/TextPaint;-><init>()V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x2

    .line 19
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 24
    .line 25
    .line 26
    int-to-float v0, p1

    .line 27
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 28
    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/graphics/Paint;->getFlags()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    or-int/lit16 v1, v1, 0x80

    .line 39
    .line 40
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setFlags(I)V

    .line 41
    .line 42
    .line 43
    new-instance v1, Landroid/graphics/Paint;

    .line 44
    .line 45
    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 46
    .line 47
    .line 48
    sput-object v1, Ll/yu4;->r:Landroid/graphics/Paint;

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 51
    .line 52
    .line 53
    sget-object v0, Ll/yu4;->t:Ljava/util/HashMap;

    .line 54
    .line 55
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {v0, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    return-void
.end method


# virtual methods
.method public final a(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/yu4;->i:Ljava/lang/String;

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
    iget-object v0, p0, Ll/yu4;->i:Ljava/lang/String;

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
    iget-object v1, p0, Ll/yu4;->i:Ljava/lang/String;

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
    iget-object v1, p0, Ll/yu4;->i:Ljava/lang/String;

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
    iget-object v2, p0, Ll/yu4;->a:Landroid/graphics/Paint;

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
    iput-object v1, p0, Ll/yu4;->o:Ljava/lang/String;

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

.method public draw(Landroid/graphics/Canvas;)V
    .locals 9

    .line 1
    iget v0, p0, Ll/yu4;->p:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const/high16 v2, 0x40000000    # 2.0f

    .line 5
    .line 6
    const/high16 v3, 0x3f800000    # 1.0f

    .line 7
    .line 8
    const/4 v4, 0x0

    .line 9
    if-ne v0, v1, :cond_6

    .line 10
    .line 11
    sget-object v0, Ll/yu4;->u:Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->getClipBounds(Landroid/graphics/Rect;)Z

    .line 14
    .line 15
    .line 16
    sget-object v0, Ll/yu4;->u:Landroid/graphics/Rect;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    sget-object v0, Ll/yu4;->u:Landroid/graphics/Rect;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    :goto_0
    iget v1, p0, Ll/yu4;->k:I

    .line 36
    .line 37
    if-ge v0, v1, :cond_1

    .line 38
    .line 39
    const/4 v5, 0x1

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    const/4 v5, 0x0

    .line 42
    :goto_1
    if-eqz v5, :cond_2

    .line 43
    .line 44
    move v1, v0

    .line 45
    :cond_2
    sget-object v6, Ll/yu4;->r:Landroid/graphics/Paint;

    .line 46
    .line 47
    iget v7, p0, Ll/yu4;->l:I

    .line 48
    .line 49
    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 50
    .line 51
    .line 52
    new-instance v6, Landroid/graphics/RectF;

    .line 53
    .line 54
    iget v7, p0, Ll/yu4;->c:F

    .line 55
    .line 56
    int-to-float v1, v1

    .line 57
    iget v8, p0, Ll/yu4;->m:I

    .line 58
    .line 59
    int-to-float v8, v8

    .line 60
    sub-float/2addr v8, v7

    .line 61
    invoke-direct {v6, v4, v7, v1, v8}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 62
    .line 63
    .line 64
    iget v1, p0, Ll/yu4;->d:I

    .line 65
    .line 66
    int-to-float v7, v1

    .line 67
    int-to-float v1, v1

    .line 68
    sget-object v8, Ll/yu4;->r:Landroid/graphics/Paint;

    .line 69
    .line 70
    invoke-virtual {p1, v6, v7, v1, v8}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 71
    .line 72
    .line 73
    iget-object v1, p0, Ll/yu4;->q:Landroid/graphics/Paint;

    .line 74
    .line 75
    if-eqz v1, :cond_3

    .line 76
    .line 77
    invoke-virtual {v1}, Landroid/graphics/Paint;->getStrokeWidth()F

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    div-float/2addr v1, v2

    .line 82
    add-float v4, v1, v3

    .line 83
    .line 84
    iget v1, v6, Landroid/graphics/RectF;->left:F

    .line 85
    .line 86
    add-float/2addr v1, v4

    .line 87
    iput v1, v6, Landroid/graphics/RectF;->left:F

    .line 88
    .line 89
    iget v1, v6, Landroid/graphics/RectF;->top:F

    .line 90
    .line 91
    add-float/2addr v1, v4

    .line 92
    iput v1, v6, Landroid/graphics/RectF;->top:F

    .line 93
    .line 94
    sub-float/2addr v1, v4

    .line 95
    iput v1, v6, Landroid/graphics/RectF;->right:F

    .line 96
    .line 97
    iget v1, v6, Landroid/graphics/RectF;->bottom:F

    .line 98
    .line 99
    sub-float/2addr v1, v4

    .line 100
    iput v1, v6, Landroid/graphics/RectF;->bottom:F

    .line 101
    .line 102
    iget v1, p0, Ll/yu4;->d:I

    .line 103
    .line 104
    int-to-float v2, v1

    .line 105
    int-to-float v1, v1

    .line 106
    iget-object v7, p0, Ll/yu4;->q:Landroid/graphics/Paint;

    .line 107
    .line 108
    invoke-virtual {p1, v6, v2, v1, v7}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 109
    .line 110
    .line 111
    :cond_3
    if-eqz v5, :cond_4

    .line 112
    .line 113
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 114
    .line 115
    .line 116
    int-to-float v0, v0

    .line 117
    mul-float/2addr v0, v3

    .line 118
    iget v1, p0, Ll/yu4;->k:I

    .line 119
    .line 120
    int-to-float v1, v1

    .line 121
    div-float/2addr v0, v1

    .line 122
    invoke-virtual {p1, v0, v3}, Landroid/graphics/Canvas;->scale(FF)V

    .line 123
    .line 124
    .line 125
    :cond_4
    iget-object v0, p0, Ll/yu4;->a:Landroid/graphics/Paint;

    .line 126
    .line 127
    iget v1, p0, Ll/yu4;->j:I

    .line 128
    .line 129
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Ll/yu4;->i:Ljava/lang/String;

    .line 133
    .line 134
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    if-eqz v0, :cond_5

    .line 139
    .line 140
    iget-object v0, p0, Ll/yu4;->i:Ljava/lang/String;

    .line 141
    .line 142
    iget v1, p0, Ll/yu4;->g:F

    .line 143
    .line 144
    iget v2, p0, Ll/yu4;->m:I

    .line 145
    .line 146
    int-to-float v2, v2

    .line 147
    sub-float/2addr v2, v4

    .line 148
    iget v3, p0, Ll/yu4;->c:F

    .line 149
    .line 150
    sub-float/2addr v2, v3

    .line 151
    iget v3, p0, Ll/yu4;->h:F

    .line 152
    .line 153
    sub-float/2addr v2, v3

    .line 154
    iget v3, p0, Ll/yu4;->f:F

    .line 155
    .line 156
    sub-float/2addr v2, v3

    .line 157
    iget-object p0, p0, Ll/yu4;->a:Landroid/graphics/Paint;

    .line 158
    .line 159
    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 160
    .line 161
    .line 162
    :cond_5
    if-eqz v5, :cond_8

    .line 163
    .line 164
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :cond_6
    sget-object v0, Ll/yu4;->r:Landroid/graphics/Paint;

    .line 169
    .line 170
    iget v1, p0, Ll/yu4;->l:I

    .line 171
    .line 172
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 173
    .line 174
    .line 175
    new-instance v0, Landroid/graphics/RectF;

    .line 176
    .line 177
    iget v1, p0, Ll/yu4;->c:F

    .line 178
    .line 179
    iget v5, p0, Ll/yu4;->k:I

    .line 180
    .line 181
    int-to-float v5, v5

    .line 182
    iget v6, p0, Ll/yu4;->m:I

    .line 183
    .line 184
    int-to-float v6, v6

    .line 185
    sub-float/2addr v6, v1

    .line 186
    invoke-direct {v0, v4, v1, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 187
    .line 188
    .line 189
    iget v1, p0, Ll/yu4;->d:I

    .line 190
    .line 191
    int-to-float v5, v1

    .line 192
    int-to-float v1, v1

    .line 193
    sget-object v6, Ll/yu4;->r:Landroid/graphics/Paint;

    .line 194
    .line 195
    invoke-virtual {p1, v0, v5, v1, v6}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 196
    .line 197
    .line 198
    iget-object v1, p0, Ll/yu4;->q:Landroid/graphics/Paint;

    .line 199
    .line 200
    if-eqz v1, :cond_7

    .line 201
    .line 202
    invoke-virtual {v1}, Landroid/graphics/Paint;->getStrokeWidth()F

    .line 203
    .line 204
    .line 205
    move-result v1

    .line 206
    div-float/2addr v1, v2

    .line 207
    add-float v4, v1, v3

    .line 208
    .line 209
    iget v1, v0, Landroid/graphics/RectF;->left:F

    .line 210
    .line 211
    add-float/2addr v1, v4

    .line 212
    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 213
    .line 214
    iget v1, v0, Landroid/graphics/RectF;->top:F

    .line 215
    .line 216
    add-float/2addr v1, v4

    .line 217
    iput v1, v0, Landroid/graphics/RectF;->top:F

    .line 218
    .line 219
    iget v1, v0, Landroid/graphics/RectF;->right:F

    .line 220
    .line 221
    sub-float/2addr v1, v4

    .line 222
    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 223
    .line 224
    iget v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 225
    .line 226
    sub-float/2addr v1, v4

    .line 227
    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 228
    .line 229
    iget v1, p0, Ll/yu4;->d:I

    .line 230
    .line 231
    int-to-float v2, v1

    .line 232
    int-to-float v1, v1

    .line 233
    iget-object v3, p0, Ll/yu4;->q:Landroid/graphics/Paint;

    .line 234
    .line 235
    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 236
    .line 237
    .line 238
    :cond_7
    iget-object v0, p0, Ll/yu4;->o:Ljava/lang/String;

    .line 239
    .line 240
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    move-result v0

    .line 244
    if-eqz v0, :cond_8

    .line 245
    .line 246
    iget-object v0, p0, Ll/yu4;->a:Landroid/graphics/Paint;

    .line 247
    .line 248
    iget v1, p0, Ll/yu4;->j:I

    .line 249
    .line 250
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 251
    .line 252
    .line 253
    iget-object v0, p0, Ll/yu4;->o:Ljava/lang/String;

    .line 254
    .line 255
    iget v1, p0, Ll/yu4;->g:F

    .line 256
    .line 257
    iget v2, p0, Ll/yu4;->m:I

    .line 258
    .line 259
    int-to-float v2, v2

    .line 260
    sub-float/2addr v2, v4

    .line 261
    iget v3, p0, Ll/yu4;->c:F

    .line 262
    .line 263
    sub-float/2addr v2, v3

    .line 264
    iget v3, p0, Ll/yu4;->h:F

    .line 265
    .line 266
    sub-float/2addr v2, v3

    .line 267
    iget v3, p0, Ll/yu4;->f:F

    .line 268
    .line 269
    sub-float/2addr v2, v3

    .line 270
    iget-object p0, p0, Ll/yu4;->a:Landroid/graphics/Paint;

    .line 271
    .line 272
    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 273
    .line 274
    .line 275
    :cond_8
    return-void
.end method

.method public e(IF)Ll/yu4;
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/yu4;->q:Landroid/graphics/Paint;

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
    iput-object v0, p0, Ll/yu4;->q:Landroid/graphics/Paint;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/yu4;->q:Landroid/graphics/Paint;

    .line 13
    .line 14
    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Ll/yu4;->q:Landroid/graphics/Paint;

    .line 18
    .line 19
    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/yu4;->q:Landroid/graphics/Paint;

    .line 23
    .line 24
    const/4 p2, 0x1

    .line 25
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/yu4;->q:Landroid/graphics/Paint;

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

.method public getIntrinsicHeight()I
    .locals 0

    .line 1
    iget p0, p0, Ll/yu4;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public getIntrinsicWidth()I
    .locals 0

    .line 1
    iget p0, p0, Ll/yu4;->k:I

    .line 2
    .line 3
    return p0
.end method

.method public getMinimumHeight()I
    .locals 0

    .line 1
    iget p0, p0, Ll/yu4;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public getMinimumWidth()I
    .locals 0

    .line 1
    iget p0, p0, Ll/yu4;->k:I

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
