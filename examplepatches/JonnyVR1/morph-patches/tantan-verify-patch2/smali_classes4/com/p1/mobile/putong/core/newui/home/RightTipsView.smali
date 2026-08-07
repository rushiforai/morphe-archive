.class public Lcom/p1/mobile/putong/core/newui/home/RightTipsView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:D

.field public f:Landroid/graphics/Path;

.field public g:Landroid/graphics/Paint;

.field public h:Landroid/text/TextPaint;

.field public i:Ljava/lang/String;

.field public j:Landroid/text/StaticLayout;

.field public k:I

.field public l:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 48
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 47
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x40a00000    # 5.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->a:I

    .line 11
    .line 12
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->b:I

    .line 17
    .line 18
    const/high16 p1, 0x41200000    # 10.0f

    .line 19
    .line 20
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->c:I

    .line 25
    .line 26
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->d:I

    .line 31
    .line 32
    const-wide p1, 0x4051800000000000L    # 70.0

    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->e:D

    .line 38
    .line 39
    const-string p1, "\u559c\u6b22\u6309\u94ae\u5728\u8fd9\u91cc\uff0c\u968f\u610f\u62d6\u52a8\u8bd5\u8bd5~"

    .line 40
    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->i:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->a()V

    .line 44
    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->g:Landroid/graphics/Paint;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v1, v0}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Landroid/graphics/Paint;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->g:Landroid/graphics/Paint;

    .line 13
    .line 14
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->g:Landroid/graphics/Paint;

    .line 20
    .line 21
    const/4 v2, 0x1

    .line 22
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->g:Landroid/graphics/Paint;

    .line 26
    .line 27
    const v3, -0x83ccd

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->g:Landroid/graphics/Paint;

    .line 34
    .line 35
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->b:I

    .line 36
    .line 37
    int-to-float v3, v3

    .line 38
    const/high16 v4, 0x40000000    # 2.0f

    .line 39
    .line 40
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    int-to-float v4, v4

    .line 45
    const/high16 v5, 0x19000000

    .line 46
    .line 47
    const/4 v6, 0x0

    .line 48
    invoke-virtual {v0, v3, v6, v4, v5}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 49
    .line 50
    .line 51
    new-instance v0, Landroid/text/TextPaint;

    .line 52
    .line 53
    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->h:Landroid/text/TextPaint;

    .line 57
    .line 58
    const/4 v3, -0x1

    .line 59
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->h:Landroid/text/TextPaint;

    .line 63
    .line 64
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->h:Landroid/text/TextPaint;

    .line 68
    .line 69
    const/high16 v2, 0x41700000    # 15.0f

    .line 70
    .line 71
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    int-to-float v2, v2

    .line 76
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->h:Landroid/text/TextPaint;

    .line 80
    .line 81
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 82
    .line 83
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->h:Landroid/text/TextPaint;

    .line 87
    .line 88
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->i:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    invoke-virtual {v0, v2, v1, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    float-to-int v4, v0

    .line 99
    new-instance v1, Landroid/text/StaticLayout;

    .line 100
    .line 101
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->i:Ljava/lang/String;

    .line 102
    .line 103
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->h:Landroid/text/TextPaint;

    .line 104
    .line 105
    sget-object v5, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    .line 106
    .line 107
    const/4 v7, 0x0

    .line 108
    const/4 v8, 0x1

    .line 109
    const/high16 v6, 0x3f800000    # 1.0f

    .line 110
    .line 111
    invoke-direct/range {v1 .. v8}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .line 112
    .line 113
    .line 114
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->j:Landroid/text/StaticLayout;

    .line 115
    .line 116
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->b:I

    .line 117
    .line 118
    mul-int/lit8 v0, v0, 0x2

    .line 119
    .line 120
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->d:I

    .line 121
    .line 122
    mul-int/lit8 v2, v2, 0x2

    .line 123
    .line 124
    add-int/2addr v0, v2

    .line 125
    invoke-virtual {v1}, Landroid/text/Layout;->getWidth()I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    add-int/2addr v0, v1

    .line 130
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->c:I

    .line 131
    .line 132
    add-int/2addr v0, v1

    .line 133
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->k:I

    .line 134
    .line 135
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->b:I

    .line 136
    .line 137
    mul-int/lit8 v0, v0, 0x2

    .line 138
    .line 139
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->d:I

    .line 140
    .line 141
    mul-int/lit8 v1, v1, 0x2

    .line 142
    .line 143
    add-int/2addr v0, v1

    .line 144
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->j:Landroid/text/StaticLayout;

    .line 145
    .line 146
    invoke-virtual {v1}, Landroid/text/Layout;->getHeight()I

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    add-int/2addr v0, v1

    .line 151
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->l:I

    .line 152
    .line 153
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->b()Landroid/graphics/Path;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->f:Landroid/graphics/Path;

    .line 158
    .line 159
    return-void
.end method

.method public final b()Landroid/graphics/Path;
    .locals 10

    .line 1
    new-instance v0, Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->b:I

    .line 7
    .line 8
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->a:I

    .line 9
    .line 10
    add-int/2addr v2, v1

    .line 11
    int-to-float v2, v2

    .line 12
    int-to-float v1, v1

    .line 13
    invoke-virtual {v0, v2, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 14
    .line 15
    .line 16
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->k:I

    .line 17
    .line 18
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->b:I

    .line 19
    .line 20
    sub-int/2addr v1, v2

    .line 21
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->c:I

    .line 22
    .line 23
    sub-int/2addr v1, v3

    .line 24
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->a:I

    .line 25
    .line 26
    sub-int/2addr v1, v3

    .line 27
    int-to-float v1, v1

    .line 28
    int-to-float v2, v2

    .line 29
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 30
    .line 31
    .line 32
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->k:I

    .line 33
    .line 34
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->b:I

    .line 35
    .line 36
    sub-int v3, v1, v2

    .line 37
    .line 38
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->c:I

    .line 39
    .line 40
    sub-int/2addr v3, v4

    .line 41
    int-to-float v3, v3

    .line 42
    int-to-float v5, v2

    .line 43
    sub-int/2addr v1, v2

    .line 44
    sub-int/2addr v1, v4

    .line 45
    int-to-float v1, v1

    .line 46
    add-int/2addr v2, v4

    .line 47
    int-to-float v2, v2

    .line 48
    invoke-virtual {v0, v3, v5, v1, v2}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 49
    .line 50
    .line 51
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->e:D

    .line 52
    .line 53
    const-wide v3, 0x4066800000000000L    # 180.0

    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    div-double/2addr v1, v3

    .line 59
    const-wide v3, 0x400921fb54442d18L    # Math.PI

    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    mul-double/2addr v1, v3

    .line 65
    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    .line 66
    .line 67
    div-double/2addr v1, v3

    .line 68
    invoke-static {v1, v2}, Ljava/lang/Math;->tan(D)D

    .line 69
    .line 70
    .line 71
    move-result-wide v3

    .line 72
    iget v5, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->c:I

    .line 73
    .line 74
    int-to-double v6, v5

    .line 75
    mul-double/2addr v3, v6

    .line 76
    double-to-int v3, v3

    .line 77
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->k:I

    .line 78
    .line 79
    iget v6, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->b:I

    .line 80
    .line 81
    sub-int/2addr v4, v6

    .line 82
    sub-int/2addr v4, v5

    .line 83
    int-to-float v4, v4

    .line 84
    iget v5, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->l:I

    .line 85
    .line 86
    div-int/lit8 v5, v5, 0x2

    .line 87
    .line 88
    sub-int/2addr v5, v3

    .line 89
    int-to-float v5, v5

    .line 90
    invoke-virtual {v0, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 91
    .line 92
    .line 93
    mul-int/lit8 v4, v3, 0x2

    .line 94
    .line 95
    div-int/lit8 v4, v4, 0x3

    .line 96
    .line 97
    int-to-double v4, v4

    .line 98
    invoke-static {v1, v2}, Ljava/lang/Math;->tan(D)D

    .line 99
    .line 100
    .line 101
    move-result-wide v1

    .line 102
    div-double/2addr v4, v1

    .line 103
    double-to-int v1, v4

    .line 104
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->k:I

    .line 105
    .line 106
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->b:I

    .line 107
    .line 108
    sub-int/2addr v2, v4

    .line 109
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->c:I

    .line 110
    .line 111
    sub-int/2addr v2, v4

    .line 112
    add-int/2addr v2, v1

    .line 113
    int-to-float v2, v2

    .line 114
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->l:I

    .line 115
    .line 116
    div-int/lit8 v4, v4, 0x2

    .line 117
    .line 118
    div-int/lit8 v5, v3, 0x3

    .line 119
    .line 120
    sub-int/2addr v4, v5

    .line 121
    int-to-float v4, v4

    .line 122
    invoke-virtual {v0, v2, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 123
    .line 124
    .line 125
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->k:I

    .line 126
    .line 127
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->b:I

    .line 128
    .line 129
    sub-int v6, v2, v4

    .line 130
    .line 131
    iget v7, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->c:I

    .line 132
    .line 133
    sub-int/2addr v6, v7

    .line 134
    add-int/2addr v6, v7

    .line 135
    int-to-float v6, v6

    .line 136
    iget v8, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->l:I

    .line 137
    .line 138
    div-int/lit8 v9, v8, 0x2

    .line 139
    .line 140
    int-to-float v9, v9

    .line 141
    sub-int/2addr v2, v4

    .line 142
    sub-int/2addr v2, v7

    .line 143
    add-int/2addr v2, v1

    .line 144
    int-to-float v1, v2

    .line 145
    div-int/lit8 v8, v8, 0x2

    .line 146
    .line 147
    add-int/2addr v8, v5

    .line 148
    int-to-float v2, v8

    .line 149
    invoke-virtual {v0, v6, v9, v1, v2}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 150
    .line 151
    .line 152
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->k:I

    .line 153
    .line 154
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->b:I

    .line 155
    .line 156
    sub-int/2addr v1, v2

    .line 157
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->c:I

    .line 158
    .line 159
    sub-int/2addr v1, v2

    .line 160
    int-to-float v1, v1

    .line 161
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->l:I

    .line 162
    .line 163
    div-int/lit8 v2, v2, 0x2

    .line 164
    .line 165
    add-int/2addr v2, v3

    .line 166
    int-to-float v2, v2

    .line 167
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 168
    .line 169
    .line 170
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->k:I

    .line 171
    .line 172
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->b:I

    .line 173
    .line 174
    sub-int/2addr v1, v2

    .line 175
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->c:I

    .line 176
    .line 177
    sub-int/2addr v1, v3

    .line 178
    int-to-float v1, v1

    .line 179
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->l:I

    .line 180
    .line 181
    sub-int/2addr v3, v2

    .line 182
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->a:I

    .line 183
    .line 184
    sub-int/2addr v3, v2

    .line 185
    int-to-float v2, v3

    .line 186
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 187
    .line 188
    .line 189
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->k:I

    .line 190
    .line 191
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->b:I

    .line 192
    .line 193
    sub-int v3, v1, v2

    .line 194
    .line 195
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->c:I

    .line 196
    .line 197
    sub-int/2addr v3, v4

    .line 198
    int-to-float v3, v3

    .line 199
    iget v5, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->l:I

    .line 200
    .line 201
    sub-int v6, v5, v2

    .line 202
    .line 203
    int-to-float v6, v6

    .line 204
    sub-int/2addr v1, v2

    .line 205
    sub-int/2addr v1, v4

    .line 206
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->a:I

    .line 207
    .line 208
    sub-int/2addr v1, v4

    .line 209
    int-to-float v1, v1

    .line 210
    sub-int/2addr v5, v2

    .line 211
    int-to-float v2, v5

    .line 212
    invoke-virtual {v0, v3, v6, v1, v2}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 213
    .line 214
    .line 215
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->b:I

    .line 216
    .line 217
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->a:I

    .line 218
    .line 219
    add-int/2addr v2, v1

    .line 220
    int-to-float v2, v2

    .line 221
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->l:I

    .line 222
    .line 223
    sub-int/2addr v3, v1

    .line 224
    int-to-float v1, v3

    .line 225
    invoke-virtual {v0, v2, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 226
    .line 227
    .line 228
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->b:I

    .line 229
    .line 230
    int-to-float v2, v1

    .line 231
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->l:I

    .line 232
    .line 233
    sub-int v4, v3, v1

    .line 234
    .line 235
    int-to-float v4, v4

    .line 236
    int-to-float v5, v1

    .line 237
    sub-int/2addr v3, v1

    .line 238
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->a:I

    .line 239
    .line 240
    sub-int/2addr v3, v1

    .line 241
    int-to-float v1, v3

    .line 242
    invoke-virtual {v0, v2, v4, v5, v1}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 243
    .line 244
    .line 245
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->b:I

    .line 246
    .line 247
    int-to-float v2, v1

    .line 248
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->a:I

    .line 249
    .line 250
    add-int/2addr v3, v1

    .line 251
    int-to-float v1, v3

    .line 252
    invoke-virtual {v0, v2, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 253
    .line 254
    .line 255
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->b:I

    .line 256
    .line 257
    int-to-float v2, v1

    .line 258
    int-to-float v3, v1

    .line 259
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->a:I

    .line 260
    .line 261
    add-int/2addr p0, v1

    .line 262
    int-to-float p0, p0

    .line 263
    int-to-float v1, v1

    .line 264
    invoke-virtual {v0, v2, v3, p0, v1}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 265
    .line 266
    .line 267
    return-object v0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->f:Landroid/graphics/Path;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->g:Landroid/graphics/Paint;

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 14
    .line 15
    .line 16
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->b:I

    .line 17
    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->d:I

    .line 19
    .line 20
    add-int v2, v0, v1

    .line 21
    .line 22
    int-to-float v2, v2

    .line 23
    add-int/2addr v0, v1

    .line 24
    int-to-float v0, v0

    .line 25
    invoke-virtual {p1, v2, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->j:Landroid/text/StaticLayout;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->k:I

    .line 5
    .line 6
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/home/RightTipsView;->l:I

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
