.class public Ll/jqf;
.super Ll/hqf;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/jqf$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/hqf<",
        "Ll/f2m;",
        ">;"
    }
.end annotation


# instance fields
.field g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/jqf$a;",
            ">;"
        }
    .end annotation
.end field

.field h:Ll/jqf$a;

.field i:Ll/jqf$a;

.field j:I

.field k:Landroid/animation/TypeEvaluator;

.field l:Landroid/animation/TimeInterpolator;


# direct methods
.method private varargs constructor <init>(Ll/f2m;[Ll/jqf$a;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/hqf;-><init>(Ll/yol;)V

    .line 2
    .line 3
    .line 4
    array-length p1, p2

    .line 5
    iput p1, p0, Ll/jqf;->j:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    aget-object v0, p2, v0

    .line 9
    .line 10
    iput-object v0, p0, Ll/jqf;->h:Ll/jqf$a;

    .line 11
    .line 12
    add-int/lit8 p1, p1, -0x1

    .line 13
    .line 14
    aget-object p1, p2, p1

    .line 15
    .line 16
    iput-object p1, p0, Ll/jqf;->i:Ll/jqf$a;

    .line 17
    .line 18
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Ll/jqf;->g:Ljava/util/List;

    .line 23
    .line 24
    iget-object p1, p0, Ll/jqf;->i:Ll/jqf$a;

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/jqf$a;->b()Landroid/animation/TimeInterpolator;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Ll/jqf;->l:Landroid/animation/TimeInterpolator;

    .line 31
    .line 32
    return-void
.end method

.method private static varargs l([Ljava/lang/Object;)F
    .locals 10

    .line 1
    new-instance v0, Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v7, 0x0

    .line 7
    aget-object v1, p0, v7

    .line 8
    .line 9
    check-cast v1, Ll/dj60;

    .line 10
    .line 11
    iget v2, v1, Ll/dj60;->a:F

    .line 12
    .line 13
    iget v1, v1, Ll/dj60;->b:F

    .line 14
    .line 15
    invoke-virtual {v0, v2, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 16
    .line 17
    .line 18
    const/4 v8, 0x1

    .line 19
    move v9, v8

    .line 20
    :goto_0
    array-length v1, p0

    .line 21
    if-ge v9, v1, :cond_4

    .line 22
    .line 23
    aget-object v1, p0, v9

    .line 24
    .line 25
    check-cast v1, Ll/dj60;

    .line 26
    .line 27
    iget v2, v1, Ll/dj60;->g:I

    .line 28
    .line 29
    if-eqz v2, :cond_3

    .line 30
    .line 31
    if-eq v2, v8, :cond_2

    .line 32
    .line 33
    const/4 v3, 0x2

    .line 34
    if-eq v2, v3, :cond_1

    .line 35
    .line 36
    const/4 v3, 0x3

    .line 37
    if-eq v2, v3, :cond_0

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_0
    move-object v2, v1

    .line 41
    iget v1, v2, Ll/dj60;->c:F

    .line 42
    .line 43
    move-object v3, v2

    .line 44
    iget v2, v3, Ll/dj60;->d:F

    .line 45
    .line 46
    move-object v4, v3

    .line 47
    iget v3, v4, Ll/dj60;->e:F

    .line 48
    .line 49
    move-object v5, v4

    .line 50
    iget v4, v5, Ll/dj60;->f:F

    .line 51
    .line 52
    move-object v6, v5

    .line 53
    iget v5, v6, Ll/dj60;->a:F

    .line 54
    .line 55
    iget v6, v6, Ll/dj60;->b:F

    .line 56
    .line 57
    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_1
    move-object v6, v1

    .line 62
    iget v1, v6, Ll/dj60;->c:F

    .line 63
    .line 64
    iget v2, v6, Ll/dj60;->d:F

    .line 65
    .line 66
    iget v3, v6, Ll/dj60;->a:F

    .line 67
    .line 68
    iget v4, v6, Ll/dj60;->b:F

    .line 69
    .line 70
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 71
    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_2
    move-object v6, v1

    .line 75
    iget v1, v6, Ll/dj60;->a:F

    .line 76
    .line 77
    iget v2, v6, Ll/dj60;->b:F

    .line 78
    .line 79
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_3
    move-object v6, v1

    .line 84
    iget v1, v6, Ll/dj60;->a:F

    .line 85
    .line 86
    iget v2, v6, Ll/dj60;->b:F

    .line 87
    .line 88
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 89
    .line 90
    .line 91
    :goto_1
    add-int/lit8 v9, v9, 0x1

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_4
    new-instance p0, Landroid/graphics/PathMeasure;

    .line 95
    .line 96
    invoke-direct {p0, v0, v7}, Landroid/graphics/PathMeasure;-><init>(Landroid/graphics/Path;Z)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Landroid/graphics/PathMeasure;->getLength()F

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    return p0
.end method

.method private m(Landroid/animation/TypeEvaluator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jqf;->k:Landroid/animation/TypeEvaluator;

    .line 2
    .line 3
    return-void
.end method

.method public static varargs n(Ll/f2m;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Ll/jqf;
    .locals 6

    .line 1
    array-length v0, p2

    .line 2
    const/4 v1, 0x2

    .line 3
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    new-array v1, v1, [Ll/jqf$a;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v3, 0x0

    .line 11
    const/4 v4, 0x1

    .line 12
    if-ne v0, v4, :cond_0

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-static {v2, v0}, Ll/jqf$a;->d(FLl/dj60;)Ll/jqf$a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    aput-object v0, v1, v3

    .line 20
    .line 21
    aget-object p2, p2, v3

    .line 22
    .line 23
    check-cast p2, Ll/dj60;

    .line 24
    .line 25
    const/high16 v0, 0x3f800000    # 1.0f

    .line 26
    .line 27
    invoke-static {v0, p2}, Ll/jqf$a;->d(FLl/dj60;)Ll/jqf$a;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    aput-object p2, v1, v4

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_0
    aget-object v5, p2, v3

    .line 35
    .line 36
    check-cast v5, Ll/dj60;

    .line 37
    .line 38
    invoke-static {v2, v5}, Ll/jqf$a;->d(FLl/dj60;)Ll/jqf$a;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    aput-object v2, v1, v3

    .line 43
    .line 44
    invoke-static {p2}, Ll/jqf;->l([Ljava/lang/Object;)F

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    :goto_0
    if-ge v4, v0, :cond_1

    .line 49
    .line 50
    add-int/lit8 v3, v4, -0x1

    .line 51
    .line 52
    aget-object v3, p2, v3

    .line 53
    .line 54
    aget-object v5, p2, v4

    .line 55
    .line 56
    filled-new-array {v3, v5}, [Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-static {v3}, Ll/jqf;->l([Ljava/lang/Object;)F

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    div-float/2addr v3, v2

    .line 65
    aget-object v5, p2, v4

    .line 66
    .line 67
    check-cast v5, Ll/dj60;

    .line 68
    .line 69
    invoke-static {v3, v5}, Ll/jqf$a;->d(FLl/dj60;)Ll/jqf$a;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    aput-object v3, v1, v4

    .line 74
    .line 75
    add-int/lit8 v4, v4, 0x1

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_1
    :goto_1
    new-instance p2, Ll/jqf;

    .line 79
    .line 80
    invoke-direct {p2, p0, v1}, Ll/jqf;-><init>(Ll/f2m;[Ll/jqf$a;)V

    .line 81
    .line 82
    .line 83
    invoke-direct {p2, p1}, Ll/jqf;->m(Landroid/animation/TypeEvaluator;)V

    .line 84
    .line 85
    .line 86
    return-object p2
.end method


# virtual methods
.method public d(F)V
    .locals 5

    .line 1
    iget v0, p0, Ll/jqf;->j:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_1

    .line 5
    .line 6
    iget-object v0, p0, Ll/jqf;->l:Landroid/animation/TimeInterpolator;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-interface {v0, p1}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    :cond_0
    iget-object v0, p0, Ll/hqf;->a:Ll/yol;

    .line 15
    .line 16
    check-cast v0, Ll/f2m;

    .line 17
    .line 18
    iget-object v1, p0, Ll/jqf;->k:Landroid/animation/TypeEvaluator;

    .line 19
    .line 20
    iget-object v2, p0, Ll/jqf;->h:Ll/jqf$a;

    .line 21
    .line 22
    invoke-virtual {v2}, Ll/jqf$a;->c()Ll/dj60;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    iget-object p0, p0, Ll/jqf;->i:Ll/jqf$a;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/jqf$a;->c()Ll/dj60;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {v1, p1, v2, p0}, Landroid/animation/TypeEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Ll/dj60;

    .line 37
    .line 38
    invoke-interface {v0, p0}, Ll/f2m;->f(Ll/dj60;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    const/4 v2, 0x0

    .line 43
    cmpg-float v2, p1, v2

    .line 44
    .line 45
    const/4 v3, 0x1

    .line 46
    if-gtz v2, :cond_3

    .line 47
    .line 48
    iget-object v0, p0, Ll/jqf;->g:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Ll/jqf$a;

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/jqf$a;->b()Landroid/animation/TimeInterpolator;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    if-eqz v1, :cond_2

    .line 61
    .line 62
    invoke-interface {v1, p1}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    :cond_2
    iget-object v1, p0, Ll/jqf;->h:Ll/jqf$a;

    .line 67
    .line 68
    invoke-virtual {v1}, Ll/jqf$a;->a()F

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    sub-float/2addr p1, v1

    .line 73
    invoke-virtual {v0}, Ll/jqf$a;->a()F

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    sub-float/2addr v2, v1

    .line 78
    div-float/2addr p1, v2

    .line 79
    iget-object v1, p0, Ll/hqf;->a:Ll/yol;

    .line 80
    .line 81
    check-cast v1, Ll/f2m;

    .line 82
    .line 83
    iget-object v2, p0, Ll/jqf;->k:Landroid/animation/TypeEvaluator;

    .line 84
    .line 85
    iget-object p0, p0, Ll/jqf;->h:Ll/jqf$a;

    .line 86
    .line 87
    invoke-virtual {p0}, Ll/jqf$a;->c()Ll/dj60;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {v0}, Ll/jqf$a;->c()Ll/dj60;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-interface {v2, p1, p0, v0}, Landroid/animation/TypeEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    check-cast p0, Ll/dj60;

    .line 100
    .line 101
    invoke-interface {v1, p0}, Ll/f2m;->f(Ll/dj60;)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_3
    const/high16 v2, 0x3f800000    # 1.0f

    .line 106
    .line 107
    cmpl-float v2, p1, v2

    .line 108
    .line 109
    if-ltz v2, :cond_5

    .line 110
    .line 111
    iget-object v2, p0, Ll/jqf;->g:Ljava/util/List;

    .line 112
    .line 113
    sub-int/2addr v0, v1

    .line 114
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    check-cast v0, Ll/jqf$a;

    .line 119
    .line 120
    iget-object v1, p0, Ll/jqf;->i:Ll/jqf$a;

    .line 121
    .line 122
    invoke-virtual {v1}, Ll/jqf$a;->b()Landroid/animation/TimeInterpolator;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    if-eqz v1, :cond_4

    .line 127
    .line 128
    invoke-interface {v1, p1}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    :cond_4
    invoke-virtual {v0}, Ll/jqf$a;->a()F

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    sub-float/2addr p1, v1

    .line 137
    iget-object v2, p0, Ll/jqf;->i:Ll/jqf$a;

    .line 138
    .line 139
    invoke-virtual {v2}, Ll/jqf$a;->a()F

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    sub-float/2addr v2, v1

    .line 144
    div-float/2addr p1, v2

    .line 145
    iget-object v1, p0, Ll/hqf;->a:Ll/yol;

    .line 146
    .line 147
    check-cast v1, Ll/f2m;

    .line 148
    .line 149
    iget-object v2, p0, Ll/jqf;->k:Landroid/animation/TypeEvaluator;

    .line 150
    .line 151
    invoke-virtual {v0}, Ll/jqf$a;->c()Ll/dj60;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    iget-object p0, p0, Ll/jqf;->i:Ll/jqf$a;

    .line 156
    .line 157
    invoke-virtual {p0}, Ll/jqf$a;->c()Ll/dj60;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    invoke-interface {v2, p1, v0, p0}, Landroid/animation/TypeEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    check-cast p0, Ll/dj60;

    .line 166
    .line 167
    invoke-interface {v1, p0}, Ll/f2m;->f(Ll/dj60;)V

    .line 168
    .line 169
    .line 170
    return-void

    .line 171
    :cond_5
    iget-object v0, p0, Ll/jqf;->h:Ll/jqf$a;

    .line 172
    .line 173
    :goto_0
    iget v1, p0, Ll/jqf;->j:I

    .line 174
    .line 175
    if-ge v3, v1, :cond_8

    .line 176
    .line 177
    iget-object v1, p0, Ll/jqf;->g:Ljava/util/List;

    .line 178
    .line 179
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    check-cast v1, Ll/jqf$a;

    .line 184
    .line 185
    invoke-virtual {v1}, Ll/jqf$a;->a()F

    .line 186
    .line 187
    .line 188
    move-result v2

    .line 189
    cmpg-float v2, p1, v2

    .line 190
    .line 191
    if-gez v2, :cond_7

    .line 192
    .line 193
    invoke-virtual {v1}, Ll/jqf$a;->b()Landroid/animation/TimeInterpolator;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    invoke-virtual {v0}, Ll/jqf$a;->a()F

    .line 198
    .line 199
    .line 200
    move-result v3

    .line 201
    sub-float/2addr p1, v3

    .line 202
    invoke-virtual {v1}, Ll/jqf$a;->a()F

    .line 203
    .line 204
    .line 205
    move-result v4

    .line 206
    sub-float/2addr v4, v3

    .line 207
    div-float/2addr p1, v4

    .line 208
    if-eqz v2, :cond_6

    .line 209
    .line 210
    invoke-interface {v2, p1}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 211
    .line 212
    .line 213
    move-result p1

    .line 214
    :cond_6
    iget-object v2, p0, Ll/hqf;->a:Ll/yol;

    .line 215
    .line 216
    check-cast v2, Ll/f2m;

    .line 217
    .line 218
    iget-object p0, p0, Ll/jqf;->k:Landroid/animation/TypeEvaluator;

    .line 219
    .line 220
    invoke-virtual {v0}, Ll/jqf$a;->c()Ll/dj60;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    invoke-virtual {v1}, Ll/jqf$a;->c()Ll/dj60;

    .line 225
    .line 226
    .line 227
    move-result-object v1

    .line 228
    invoke-interface {p0, p1, v0, v1}, Landroid/animation/TypeEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    .line 230
    .line 231
    move-result-object p0

    .line 232
    check-cast p0, Ll/dj60;

    .line 233
    .line 234
    invoke-interface {v2, p0}, Ll/f2m;->f(Ll/dj60;)V

    .line 235
    .line 236
    .line 237
    return-void

    .line 238
    :cond_7
    add-int/lit8 v3, v3, 0x1

    .line 239
    .line 240
    move-object v0, v1

    .line 241
    goto :goto_0

    .line 242
    :cond_8
    return-void
.end method
