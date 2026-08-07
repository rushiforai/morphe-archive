.class public Ll/p60;
.super Ll/ho0$a;
.source "SourceFile"


# instance fields
.field public f:Ll/g1g0;

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/c53;",
            ">;"
        }
    .end annotation
.end field

.field public h:I


# direct methods
.method public constructor <init>(Ll/g1g0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/ho0$a;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/p60;->f:Ll/g1g0;

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/p60;->g:Ljava/util/List;

    .line 13
    .line 14
    const/16 v0, 0xff

    .line 15
    .line 16
    iput v0, p0, Ll/p60;->h:I

    .line 17
    .line 18
    iput-object p1, p0, Ll/p60;->f:Ll/g1g0;

    .line 19
    .line 20
    return-void
.end method

.method private f(Ll/g1g0;Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/p60;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/c53;

    .line 18
    .line 19
    invoke-virtual {v0, p1, p2}, Ll/c53;->e(Ll/g1g0;Landroid/graphics/Canvas;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method


# virtual methods
.method public d()Ll/ho0;
    .locals 6

    .line 1
    new-instance v0, Ll/ho0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ho0;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/p60;->f:Ll/g1g0;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/sunshine/engine/base/a;->h:Ll/drf0;

    .line 9
    .line 10
    iget-object v1, v1, Ll/drf0;->a:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v1, Ljava/lang/Integer;

    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    int-to-float v1, v1

    .line 19
    const/high16 v2, 0x40000000    # 2.0f

    .line 20
    .line 21
    div-float/2addr v1, v2

    .line 22
    iget-object p0, p0, Ll/p60;->f:Ll/g1g0;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/sunshine/engine/base/a;->h:Ll/drf0;

    .line 25
    .line 26
    iget-object p0, p0, Ll/drf0;->b:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast p0, Ljava/lang/Integer;

    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    int-to-float p0, p0

    .line 35
    div-float/2addr p0, v2

    .line 36
    iget-object v3, v0, Ll/ho0;->b:Ll/kk90;

    .line 37
    .line 38
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    invoke-virtual {v3, v4, v5}, Ll/kk90;->m(Ljava/lang/Float;Ljava/lang/Float;)Ll/kk90;

    .line 47
    .line 48
    .line 49
    iget-object v3, v0, Ll/ho0;->c:Ll/kk90;

    .line 50
    .line 51
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    invoke-virtual {v3, v4, v5}, Ll/kk90;->m(Ljava/lang/Float;Ljava/lang/Float;)Ll/kk90;

    .line 60
    .line 61
    .line 62
    div-float/2addr v1, v2

    .line 63
    div-float/2addr p0, v2

    .line 64
    iget-object v2, v0, Ll/ho0;->d:Ll/drf0;

    .line 65
    .line 66
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    iput-object v3, v2, Ll/drf0;->a:Ljava/lang/Object;

    .line 71
    .line 72
    iget-object v2, v0, Ll/ho0;->d:Ll/drf0;

    .line 73
    .line 74
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    iput-object v3, v2, Ll/drf0;->b:Ljava/lang/Object;

    .line 79
    .line 80
    iget-object v2, v0, Ll/ho0;->g:Ll/li80;

    .line 81
    .line 82
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {v2, v1, p0}, Ll/li80;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    return-object v0
.end method

.method public e(Ll/g1g0;Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/ho0$a;->c()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/p60;->g:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-lez v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/sunshine/engine/base/a;->f()F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p0, v0}, Ll/ho0$a;->a(F)Ll/ho0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v1, 0x1

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v2, v0, Ll/ho0;->a:Ll/tfe;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/sunshine/engine/base/a;->f()F

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    invoke-virtual {v2, v3}, Ll/tfe;->b(F)F

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-virtual {v0, v2, p1}, Ll/ho0;->a(FLcom/sunshine/engine/base/a;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    iget-object v2, p1, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 40
    .line 41
    iget v2, v2, Ll/cce;->f:I

    .line 42
    .line 43
    iput v2, p0, Ll/p60;->h:I

    .line 44
    .line 45
    iput-boolean v1, p0, Ll/mrf0;->a:Z

    .line 46
    .line 47
    invoke-virtual {v0, p1}, Ll/ho0;->b(Lcom/sunshine/engine/base/a;)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Ll/mrf0;->b:Landroid/graphics/Matrix;

    .line 51
    .line 52
    invoke-virtual {p1, v1}, Lcom/sunshine/engine/base/a;->g(Landroid/graphics/Matrix;)V

    .line 53
    .line 54
    .line 55
    iget-object v1, p0, Ll/mrf0;->b:Landroid/graphics/Matrix;

    .line 56
    .line 57
    invoke-virtual {v1}, Landroid/graphics/Matrix;->reset()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p2}, Landroid/graphics/Canvas;->save()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    iget-object v2, p0, Ll/mrf0;->b:Landroid/graphics/Matrix;

    .line 65
    .line 66
    iget-object v3, v0, Ll/ho0;->h:Ll/lk90;

    .line 67
    .line 68
    invoke-virtual {v3}, Ll/ok90;->f()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    check-cast v3, Ljava/lang/Integer;

    .line 73
    .line 74
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    int-to-float v3, v3

    .line 79
    iget-object v4, p1, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 80
    .line 81
    iget-object v4, v4, Ll/cce;->e:Landroid/graphics/PointF;

    .line 82
    .line 83
    iget v5, v4, Landroid/graphics/PointF;->x:F

    .line 84
    .line 85
    iget v4, v4, Landroid/graphics/PointF;->y:F

    .line 86
    .line 87
    invoke-virtual {v2, v3, v5, v4}, Landroid/graphics/Matrix;->preRotate(FFF)Z

    .line 88
    .line 89
    .line 90
    iget-object v2, p0, Ll/mrf0;->b:Landroid/graphics/Matrix;

    .line 91
    .line 92
    iget-object v3, v0, Ll/ho0;->e:Ll/kk90;

    .line 93
    .line 94
    invoke-virtual {v3}, Ll/ok90;->f()Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    check-cast v3, Ljava/lang/Float;

    .line 99
    .line 100
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    iget-object v4, v0, Ll/ho0;->f:Ll/kk90;

    .line 105
    .line 106
    invoke-virtual {v4}, Ll/ok90;->f()Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v4

    .line 110
    check-cast v4, Ljava/lang/Float;

    .line 111
    .line 112
    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    .line 113
    .line 114
    .line 115
    move-result v4

    .line 116
    iget-object v5, p1, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 117
    .line 118
    iget-object v5, v5, Ll/cce;->c:Landroid/graphics/RectF;

    .line 119
    .line 120
    invoke-virtual {v5}, Landroid/graphics/RectF;->centerX()F

    .line 121
    .line 122
    .line 123
    move-result v5

    .line 124
    iget-object v6, p1, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 125
    .line 126
    iget-object v6, v6, Ll/cce;->c:Landroid/graphics/RectF;

    .line 127
    .line 128
    invoke-virtual {v6}, Landroid/graphics/RectF;->centerY()F

    .line 129
    .line 130
    .line 131
    move-result v6

    .line 132
    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    .line 133
    .line 134
    .line 135
    iget-object v2, p0, Ll/mrf0;->b:Landroid/graphics/Matrix;

    .line 136
    .line 137
    iget-object v3, v0, Ll/ho0;->b:Ll/kk90;

    .line 138
    .line 139
    invoke-virtual {v3}, Ll/ok90;->f()Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    check-cast v3, Ljava/lang/Float;

    .line 144
    .line 145
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 146
    .line 147
    .line 148
    move-result v3

    .line 149
    iget-object v4, p1, Lcom/sunshine/engine/base/a;->h:Ll/drf0;

    .line 150
    .line 151
    iget-object v4, v4, Ll/drf0;->a:Ljava/lang/Object;

    .line 152
    .line 153
    check-cast v4, Ljava/lang/Integer;

    .line 154
    .line 155
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 156
    .line 157
    .line 158
    move-result v4

    .line 159
    div-int/lit8 v4, v4, 0x2

    .line 160
    .line 161
    int-to-float v4, v4

    .line 162
    sub-float/2addr v3, v4

    .line 163
    iget v4, p1, Lcom/sunshine/engine/base/a;->g:F

    .line 164
    .line 165
    mul-float/2addr v3, v4

    .line 166
    iget-object v0, v0, Ll/ho0;->c:Ll/kk90;

    .line 167
    .line 168
    invoke-virtual {v0}, Ll/ok90;->f()Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    check-cast v0, Ljava/lang/Float;

    .line 173
    .line 174
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    iget-object v4, p1, Lcom/sunshine/engine/base/a;->h:Ll/drf0;

    .line 179
    .line 180
    iget-object v4, v4, Ll/drf0;->b:Ljava/lang/Object;

    .line 181
    .line 182
    check-cast v4, Ljava/lang/Integer;

    .line 183
    .line 184
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 185
    .line 186
    .line 187
    move-result v4

    .line 188
    div-int/lit8 v4, v4, 0x2

    .line 189
    .line 190
    int-to-float v4, v4

    .line 191
    sub-float/2addr v0, v4

    .line 192
    iget v4, p1, Lcom/sunshine/engine/base/a;->g:F

    .line 193
    .line 194
    mul-float/2addr v0, v4

    .line 195
    invoke-virtual {v2, v3, v0}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 196
    .line 197
    .line 198
    iget-object v0, p0, Ll/mrf0;->b:Landroid/graphics/Matrix;

    .line 199
    .line 200
    invoke-virtual {p2, v0}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 201
    .line 202
    .line 203
    invoke-direct {p0, p1, p2}, Ll/p60;->f(Ll/g1g0;Landroid/graphics/Canvas;)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {p2, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 207
    .line 208
    .line 209
    return-void

    .line 210
    :cond_0
    const/16 v0, 0xff

    .line 211
    .line 212
    iput v0, p0, Ll/p60;->h:I

    .line 213
    .line 214
    iput-boolean v1, p0, Ll/mrf0;->a:Z

    .line 215
    .line 216
    invoke-direct {p0, p1, p2}, Ll/p60;->f(Ll/g1g0;Landroid/graphics/Canvas;)V

    .line 217
    .line 218
    .line 219
    :cond_1
    return-void
.end method

.method public g()Ll/c53;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p60;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/p60;->g:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/lit8 v0, v0, -0x1

    .line 16
    .line 17
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ll/c53;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method
