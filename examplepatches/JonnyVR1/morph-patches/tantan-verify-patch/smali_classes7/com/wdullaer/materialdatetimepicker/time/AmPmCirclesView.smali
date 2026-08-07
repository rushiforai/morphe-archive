.class public Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field private final a:Landroid/graphics/Paint;

.field private b:I

.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private g:I

.field private h:I

.field private i:F

.field private j:F

.field private k:Ljava/lang/String;

.field private l:Ljava/lang/String;

.field private m:Z

.field private n:Z

.field private o:Z

.field private p:Z

.field private q:I

.field private r:I

.field private s:I

.field private t:I

.field private u:I

.field private v:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/Paint;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->a:Landroid/graphics/Paint;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->o:Z

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(FF)I
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->p:Z

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->t:I

    .line 8
    .line 9
    int-to-float v2, v0

    .line 10
    sub-float v2, p2, v2

    .line 11
    .line 12
    int-to-float v0, v0

    .line 13
    sub-float/2addr p2, v0

    .line 14
    mul-float/2addr v2, p2

    .line 15
    float-to-int p2, v2

    .line 16
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->r:I

    .line 17
    .line 18
    int-to-float v2, v0

    .line 19
    sub-float v2, p1, v2

    .line 20
    .line 21
    int-to-float v0, v0

    .line 22
    sub-float v0, p1, v0

    .line 23
    .line 24
    mul-float/2addr v2, v0

    .line 25
    int-to-float p2, p2

    .line 26
    add-float/2addr v2, p2

    .line 27
    float-to-double v2, v2

    .line 28
    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    .line 29
    .line 30
    .line 31
    move-result-wide v2

    .line 32
    double-to-int v0, v2

    .line 33
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->q:I

    .line 34
    .line 35
    if-gt v0, v2, :cond_1

    .line 36
    .line 37
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->m:Z

    .line 38
    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    return p0

    .line 43
    :cond_1
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->s:I

    .line 44
    .line 45
    int-to-float v2, v0

    .line 46
    sub-float v2, p1, v2

    .line 47
    .line 48
    int-to-float v0, v0

    .line 49
    sub-float/2addr p1, v0

    .line 50
    mul-float/2addr v2, p1

    .line 51
    add-float/2addr v2, p2

    .line 52
    float-to-double p1, v2

    .line 53
    invoke-static {p1, p2}, Ljava/lang/Math;->sqrt(D)D

    .line 54
    .line 55
    .line 56
    move-result-wide p1

    .line 57
    double-to-int p1, p1

    .line 58
    iget p2, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->q:I

    .line 59
    .line 60
    if-gt p1, p2, :cond_2

    .line 61
    .line 62
    iget-boolean p0, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->n:Z

    .line 63
    .line 64
    if-nez p0, :cond_2

    .line 65
    .line 66
    const/4 p0, 0x1

    .line 67
    return p0

    .line 68
    :cond_2
    return v1
.end method

.method public b(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/time/a;I)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->o:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string p0, "AmPmCirclesView"

    .line 6
    .line 7
    const-string p1, "AmPmCirclesView may only be initialized once."

    .line 8
    .line 9
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {p2}, Lcom/wdullaer/materialdatetimepicker/time/a;->z()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/16 v2, 0xff

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    sget v1, Ll/q9c0;->f:I

    .line 26
    .line 27
    invoke-static {p1, v1}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->d:I

    .line 32
    .line 33
    sget v1, Ll/q9c0;->u:I

    .line 34
    .line 35
    invoke-static {p1, v1}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->e:I

    .line 40
    .line 41
    sget v1, Ll/q9c0;->k:I

    .line 42
    .line 43
    invoke-static {p1, v1}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->g:I

    .line 48
    .line 49
    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->b:I

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    sget v1, Ll/q9c0;->u:I

    .line 53
    .line 54
    invoke-static {p1, v1}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->d:I

    .line 59
    .line 60
    sget v1, Ll/q9c0;->c:I

    .line 61
    .line 62
    invoke-static {p1, v1}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->e:I

    .line 67
    .line 68
    sget v1, Ll/q9c0;->j:I

    .line 69
    .line 70
    invoke-static {p1, v1}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->g:I

    .line 75
    .line 76
    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->b:I

    .line 77
    .line 78
    :goto_0
    invoke-interface {p2}, Lcom/wdullaer/materialdatetimepicker/time/a;->u()I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->h:I

    .line 83
    .line 84
    invoke-static {v1}, Ll/tnk0;->a(I)I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->c:I

    .line 89
    .line 90
    sget v1, Ll/q9c0;->u:I

    .line 91
    .line 92
    invoke-static {p1, v1}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->f:I

    .line 97
    .line 98
    sget p1, Lcom/wdullaer/materialdatetimepicker/R$string;->p:I

    .line 99
    .line 100
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    const/4 v1, 0x0

    .line 105
    invoke-static {p1, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->a:Landroid/graphics/Paint;

    .line 110
    .line 111
    invoke-virtual {v2, p1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->a:Landroid/graphics/Paint;

    .line 115
    .line 116
    const/4 v2, 0x1

    .line 117
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->a:Landroid/graphics/Paint;

    .line 121
    .line 122
    sget-object v3, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 123
    .line 124
    invoke-virtual {p1, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 125
    .line 126
    .line 127
    sget p1, Lcom/wdullaer/materialdatetimepicker/R$string;->c:I

    .line 128
    .line 129
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->i:F

    .line 138
    .line 139
    sget p1, Lcom/wdullaer/materialdatetimepicker/R$string;->a:I

    .line 140
    .line 141
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->j:F

    .line 150
    .line 151
    new-instance p1, Ljava/text/DateFormatSymbols;

    .line 152
    .line 153
    invoke-direct {p1}, Ljava/text/DateFormatSymbols;-><init>()V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p1}, Ljava/text/DateFormatSymbols;->getAmPmStrings()[Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    aget-object v0, p1, v1

    .line 161
    .line 162
    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->k:Ljava/lang/String;

    .line 163
    .line 164
    aget-object p1, p1, v2

    .line 165
    .line 166
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->l:Ljava/lang/String;

    .line 167
    .line 168
    invoke-interface {p2}, Lcom/wdullaer/materialdatetimepicker/time/a;->a()Z

    .line 169
    .line 170
    .line 171
    move-result p1

    .line 172
    iput-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->m:Z

    .line 173
    .line 174
    invoke-interface {p2}, Lcom/wdullaer/materialdatetimepicker/time/a;->g()Z

    .line 175
    .line 176
    .line 177
    move-result p1

    .line 178
    iput-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->n:Z

    .line 179
    .line 180
    invoke-virtual {p0, p3}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->setAmOrPm(I)V

    .line 181
    .line 182
    .line 183
    const/4 p1, -0x1

    .line 184
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->v:I

    .line 185
    .line 186
    iput-boolean v2, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->o:Z

    .line 187
    .line 188
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 11

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_8

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->o:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_3

    .line 12
    .line 13
    :cond_0
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->p:Z

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    div-int/lit8 v0, v0, 0x2

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    div-int/lit8 v2, v2, 0x2

    .line 29
    .line 30
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    int-to-float v3, v3

    .line 35
    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->i:F

    .line 36
    .line 37
    mul-float/2addr v3, v4

    .line 38
    float-to-int v3, v3

    .line 39
    int-to-float v4, v3

    .line 40
    iget v5, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->j:F

    .line 41
    .line 42
    mul-float/2addr v4, v5

    .line 43
    float-to-int v4, v4

    .line 44
    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->q:I

    .line 45
    .line 46
    int-to-double v5, v2

    .line 47
    int-to-double v7, v4

    .line 48
    const-wide/high16 v9, 0x3fe8000000000000L    # 0.75

    .line 49
    .line 50
    mul-double/2addr v7, v9

    .line 51
    add-double/2addr v5, v7

    .line 52
    double-to-int v2, v5

    .line 53
    mul-int/lit8 v4, v4, 0x3

    .line 54
    .line 55
    div-int/lit8 v4, v4, 0x4

    .line 56
    .line 57
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->a:Landroid/graphics/Paint;

    .line 58
    .line 59
    int-to-float v4, v4

    .line 60
    invoke-virtual {v5, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 61
    .line 62
    .line 63
    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->q:I

    .line 64
    .line 65
    div-int/lit8 v5, v4, 0x2

    .line 66
    .line 67
    sub-int/2addr v2, v5

    .line 68
    add-int/2addr v2, v3

    .line 69
    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->t:I

    .line 70
    .line 71
    sub-int v2, v0, v3

    .line 72
    .line 73
    add-int/2addr v2, v4

    .line 74
    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->r:I

    .line 75
    .line 76
    add-int/2addr v0, v3

    .line 77
    sub-int/2addr v0, v4

    .line 78
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->s:I

    .line 79
    .line 80
    iput-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->p:Z

    .line 81
    .line 82
    :cond_1
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->d:I

    .line 83
    .line 84
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->e:I

    .line 85
    .line 86
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->u:I

    .line 87
    .line 88
    const/16 v4, 0xff

    .line 89
    .line 90
    if-nez v3, :cond_2

    .line 91
    .line 92
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->h:I

    .line 93
    .line 94
    iget v5, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->b:I

    .line 95
    .line 96
    iget v6, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->f:I

    .line 97
    .line 98
    move v7, v6

    .line 99
    move v6, v2

    .line 100
    move v2, v7

    .line 101
    move v7, v4

    .line 102
    move v4, v0

    .line 103
    goto :goto_0

    .line 104
    :cond_2
    if-ne v3, v1, :cond_3

    .line 105
    .line 106
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->h:I

    .line 107
    .line 108
    iget v5, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->b:I

    .line 109
    .line 110
    iget v6, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->f:I

    .line 111
    .line 112
    move v7, v5

    .line 113
    move v5, v4

    .line 114
    move v4, v3

    .line 115
    move v3, v0

    .line 116
    goto :goto_0

    .line 117
    :cond_3
    move v3, v0

    .line 118
    move v6, v2

    .line 119
    move v5, v4

    .line 120
    move v7, v5

    .line 121
    move v4, v3

    .line 122
    :goto_0
    iget v8, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->v:I

    .line 123
    .line 124
    if-nez v8, :cond_4

    .line 125
    .line 126
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->c:I

    .line 127
    .line 128
    iget v5, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->b:I

    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_4
    if-ne v8, v1, :cond_5

    .line 132
    .line 133
    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->c:I

    .line 134
    .line 135
    iget v7, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->b:I

    .line 136
    .line 137
    :cond_5
    :goto_1
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->m:Z

    .line 138
    .line 139
    if-eqz v1, :cond_6

    .line 140
    .line 141
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->g:I

    .line 142
    .line 143
    move v3, v0

    .line 144
    :cond_6
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->n:Z

    .line 145
    .line 146
    if-eqz v1, :cond_7

    .line 147
    .line 148
    iget v6, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->g:I

    .line 149
    .line 150
    goto :goto_2

    .line 151
    :cond_7
    move v0, v4

    .line 152
    :goto_2
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->a:Landroid/graphics/Paint;

    .line 153
    .line 154
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 155
    .line 156
    .line 157
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->a:Landroid/graphics/Paint;

    .line 158
    .line 159
    invoke-virtual {v1, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 160
    .line 161
    .line 162
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->r:I

    .line 163
    .line 164
    int-to-float v1, v1

    .line 165
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->t:I

    .line 166
    .line 167
    int-to-float v3, v3

    .line 168
    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->q:I

    .line 169
    .line 170
    int-to-float v4, v4

    .line 171
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->a:Landroid/graphics/Paint;

    .line 172
    .line 173
    invoke-virtual {p1, v1, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 174
    .line 175
    .line 176
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->a:Landroid/graphics/Paint;

    .line 177
    .line 178
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 179
    .line 180
    .line 181
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->a:Landroid/graphics/Paint;

    .line 182
    .line 183
    invoke-virtual {v0, v7}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 184
    .line 185
    .line 186
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->s:I

    .line 187
    .line 188
    int-to-float v0, v0

    .line 189
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->t:I

    .line 190
    .line 191
    int-to-float v1, v1

    .line 192
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->q:I

    .line 193
    .line 194
    int-to-float v3, v3

    .line 195
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->a:Landroid/graphics/Paint;

    .line 196
    .line 197
    invoke-virtual {p1, v0, v1, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 198
    .line 199
    .line 200
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->a:Landroid/graphics/Paint;

    .line 201
    .line 202
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 203
    .line 204
    .line 205
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->t:I

    .line 206
    .line 207
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->a:Landroid/graphics/Paint;

    .line 208
    .line 209
    invoke-virtual {v1}, Landroid/graphics/Paint;->descent()F

    .line 210
    .line 211
    .line 212
    move-result v1

    .line 213
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->a:Landroid/graphics/Paint;

    .line 214
    .line 215
    invoke-virtual {v2}, Landroid/graphics/Paint;->ascent()F

    .line 216
    .line 217
    .line 218
    move-result v2

    .line 219
    add-float/2addr v1, v2

    .line 220
    float-to-int v1, v1

    .line 221
    div-int/lit8 v1, v1, 0x2

    .line 222
    .line 223
    sub-int/2addr v0, v1

    .line 224
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->k:Ljava/lang/String;

    .line 225
    .line 226
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->r:I

    .line 227
    .line 228
    int-to-float v2, v2

    .line 229
    int-to-float v0, v0

    .line 230
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->a:Landroid/graphics/Paint;

    .line 231
    .line 232
    invoke-virtual {p1, v1, v2, v0, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 233
    .line 234
    .line 235
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->a:Landroid/graphics/Paint;

    .line 236
    .line 237
    invoke-virtual {v1, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 238
    .line 239
    .line 240
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->l:Ljava/lang/String;

    .line 241
    .line 242
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->s:I

    .line 243
    .line 244
    int-to-float v2, v2

    .line 245
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->a:Landroid/graphics/Paint;

    .line 246
    .line 247
    invoke-virtual {p1, v1, v2, v0, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 248
    .line 249
    .line 250
    :cond_8
    :goto_3
    return-void
.end method

.method public setAmOrPm(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->u:I

    .line 2
    .line 3
    return-void
.end method

.method public setAmOrPmPressed(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->v:I

    .line 2
    .line 3
    return-void
.end method
