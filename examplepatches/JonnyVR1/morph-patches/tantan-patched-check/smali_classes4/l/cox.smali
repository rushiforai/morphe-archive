.class public final Ll/cox;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/cox;->i:I

    .line 6
    .line 7
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/cox;->a:Ljava/lang/ref/WeakReference;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(II)V
    .locals 10

    .line 1
    iget v0, p0, Ll/cox;->f:I

    .line 2
    .line 3
    const/16 v1, 0x10e

    .line 4
    .line 5
    const/16 v2, 0x5a

    .line 6
    .line 7
    if-eq v0, v2, :cond_0

    .line 8
    .line 9
    if-ne v0, v1, :cond_1

    .line 10
    .line 11
    :cond_0
    move v9, p2

    .line 12
    move p2, p1

    .line 13
    move p1, v9

    .line 14
    :cond_1
    iget v0, p0, Ll/cox;->b:I

    .line 15
    .line 16
    invoke-static {v0, p1}, Landroid/view/View;->getDefaultSize(II)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget v3, p0, Ll/cox;->c:I

    .line 21
    .line 22
    invoke-static {v3, p2}, Landroid/view/View;->getDefaultSize(II)I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    iget v4, p0, Ll/cox;->i:I

    .line 27
    .line 28
    const/4 v5, 0x3

    .line 29
    if-ne v4, v5, :cond_2

    .line 30
    .line 31
    goto/16 :goto_6

    .line 32
    .line 33
    :cond_2
    iget v4, p0, Ll/cox;->b:I

    .line 34
    .line 35
    if-lez v4, :cond_19

    .line 36
    .line 37
    iget v4, p0, Ll/cox;->c:I

    .line 38
    .line 39
    if-lez v4, :cond_19

    .line 40
    .line 41
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    const/high16 v4, -0x80000000

    .line 58
    .line 59
    if-ne v0, v4, :cond_10

    .line 60
    .line 61
    if-ne v3, v4, :cond_10

    .line 62
    .line 63
    int-to-float v0, p1

    .line 64
    int-to-float v3, p2

    .line 65
    div-float v4, v0, v3

    .line 66
    .line 67
    iget v5, p0, Ll/cox;->i:I

    .line 68
    .line 69
    const/4 v6, 0x5

    .line 70
    const/4 v7, 0x4

    .line 71
    if-eq v5, v7, :cond_6

    .line 72
    .line 73
    if-eq v5, v6, :cond_3

    .line 74
    .line 75
    iget v1, p0, Ll/cox;->b:I

    .line 76
    .line 77
    int-to-float v1, v1

    .line 78
    iget v2, p0, Ll/cox;->c:I

    .line 79
    .line 80
    int-to-float v2, v2

    .line 81
    div-float/2addr v1, v2

    .line 82
    iget v2, p0, Ll/cox;->d:I

    .line 83
    .line 84
    if-lez v2, :cond_9

    .line 85
    .line 86
    iget v8, p0, Ll/cox;->e:I

    .line 87
    .line 88
    if-lez v8, :cond_9

    .line 89
    .line 90
    int-to-float v2, v2

    .line 91
    mul-float/2addr v1, v2

    .line 92
    int-to-float v2, v8

    .line 93
    div-float/2addr v1, v2

    .line 94
    goto :goto_2

    .line 95
    :cond_3
    iget v8, p0, Ll/cox;->f:I

    .line 96
    .line 97
    if-eq v8, v2, :cond_5

    .line 98
    .line 99
    if-ne v8, v1, :cond_4

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_4
    const v1, 0x3faaaaab

    .line 103
    .line 104
    .line 105
    goto :goto_2

    .line 106
    :cond_5
    :goto_0
    const/high16 v1, 0x3f400000    # 0.75f

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_6
    iget v8, p0, Ll/cox;->f:I

    .line 110
    .line 111
    if-eq v8, v2, :cond_8

    .line 112
    .line 113
    if-ne v8, v1, :cond_7

    .line 114
    .line 115
    goto :goto_1

    .line 116
    :cond_7
    const v1, 0x3fe38e39

    .line 117
    .line 118
    .line 119
    goto :goto_2

    .line 120
    :cond_8
    :goto_1
    const/high16 v1, 0x3f100000    # 0.5625f

    .line 121
    .line 122
    :cond_9
    :goto_2
    cmpl-float v2, v1, v4

    .line 123
    .line 124
    const/4 v4, 0x1

    .line 125
    if-lez v2, :cond_a

    .line 126
    .line 127
    move v2, v4

    .line 128
    goto :goto_3

    .line 129
    :cond_a
    const/4 v2, 0x0

    .line 130
    :goto_3
    if-eqz v5, :cond_f

    .line 131
    .line 132
    if-eq v5, v4, :cond_c

    .line 133
    .line 134
    if-eq v5, v7, :cond_f

    .line 135
    .line 136
    if-eq v5, v6, :cond_f

    .line 137
    .line 138
    if-eqz v2, :cond_b

    .line 139
    .line 140
    iget p2, p0, Ll/cox;->b:I

    .line 141
    .line 142
    invoke-static {p2, p1}, Ljava/lang/Math;->min(II)I

    .line 143
    .line 144
    .line 145
    move-result p1

    .line 146
    int-to-float p2, p1

    .line 147
    div-float/2addr p2, v1

    .line 148
    float-to-int p2, p2

    .line 149
    goto/16 :goto_6

    .line 150
    .line 151
    :cond_b
    iget p1, p0, Ll/cox;->c:I

    .line 152
    .line 153
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    .line 154
    .line 155
    .line 156
    move-result p1

    .line 157
    int-to-float p2, p1

    .line 158
    mul-float/2addr p2, v1

    .line 159
    float-to-int p2, p2

    .line 160
    move v9, p2

    .line 161
    move p2, p1

    .line 162
    move p1, v9

    .line 163
    goto/16 :goto_6

    .line 164
    .line 165
    :cond_c
    if-eqz v2, :cond_e

    .line 166
    .line 167
    :cond_d
    mul-float/2addr v3, v1

    .line 168
    float-to-int p1, v3

    .line 169
    goto/16 :goto_6

    .line 170
    .line 171
    :cond_e
    :goto_4
    div-float/2addr v0, v1

    .line 172
    float-to-int p2, v0

    .line 173
    goto/16 :goto_6

    .line 174
    .line 175
    :cond_f
    if-eqz v2, :cond_d

    .line 176
    .line 177
    goto :goto_4

    .line 178
    :cond_10
    const/high16 v1, 0x40000000    # 2.0f

    .line 179
    .line 180
    if-ne v0, v1, :cond_12

    .line 181
    .line 182
    if-ne v3, v1, :cond_12

    .line 183
    .line 184
    iget v0, p0, Ll/cox;->b:I

    .line 185
    .line 186
    mul-int v1, v0, p2

    .line 187
    .line 188
    iget v2, p0, Ll/cox;->c:I

    .line 189
    .line 190
    mul-int v3, p1, v2

    .line 191
    .line 192
    if-ge v1, v3, :cond_11

    .line 193
    .line 194
    mul-int/2addr v0, p2

    .line 195
    div-int p1, v0, v2

    .line 196
    .line 197
    goto :goto_6

    .line 198
    :cond_11
    mul-int v1, v0, p2

    .line 199
    .line 200
    mul-int v3, p1, v2

    .line 201
    .line 202
    if-le v1, v3, :cond_1a

    .line 203
    .line 204
    mul-int/2addr v2, p1

    .line 205
    div-int p2, v2, v0

    .line 206
    .line 207
    goto :goto_6

    .line 208
    :cond_12
    if-ne v0, v1, :cond_14

    .line 209
    .line 210
    iget v0, p0, Ll/cox;->c:I

    .line 211
    .line 212
    mul-int/2addr v0, p1

    .line 213
    iget v1, p0, Ll/cox;->b:I

    .line 214
    .line 215
    div-int/2addr v0, v1

    .line 216
    if-ne v3, v4, :cond_13

    .line 217
    .line 218
    if-le v0, p2, :cond_13

    .line 219
    .line 220
    goto :goto_6

    .line 221
    :cond_13
    move p2, v0

    .line 222
    goto :goto_6

    .line 223
    :cond_14
    iget v2, p0, Ll/cox;->b:I

    .line 224
    .line 225
    if-ne v3, v1, :cond_16

    .line 226
    .line 227
    mul-int/2addr v2, p2

    .line 228
    iget v1, p0, Ll/cox;->c:I

    .line 229
    .line 230
    div-int v1, v2, v1

    .line 231
    .line 232
    if-ne v0, v4, :cond_15

    .line 233
    .line 234
    if-le v1, p1, :cond_15

    .line 235
    .line 236
    goto :goto_6

    .line 237
    :cond_15
    move p1, v1

    .line 238
    goto :goto_6

    .line 239
    :cond_16
    iget v1, p0, Ll/cox;->c:I

    .line 240
    .line 241
    if-ne v3, v4, :cond_17

    .line 242
    .line 243
    if-le v1, p2, :cond_17

    .line 244
    .line 245
    mul-int v3, p2, v2

    .line 246
    .line 247
    div-int/2addr v3, v1

    .line 248
    goto :goto_5

    .line 249
    :cond_17
    move p2, v1

    .line 250
    move v3, v2

    .line 251
    :goto_5
    if-ne v0, v4, :cond_18

    .line 252
    .line 253
    if-le v3, p1, :cond_18

    .line 254
    .line 255
    mul-int/2addr v1, p1

    .line 256
    div-int p2, v1, v2

    .line 257
    .line 258
    goto :goto_6

    .line 259
    :cond_18
    move p1, v3

    .line 260
    goto :goto_6

    .line 261
    :cond_19
    move p1, v0

    .line 262
    move p2, v3

    .line 263
    :cond_1a
    :goto_6
    iput p1, p0, Ll/cox;->g:I

    .line 264
    .line 265
    iput p2, p0, Ll/cox;->h:I

    .line 266
    .line 267
    return-void
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Ll/cox;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/cox;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public d(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/cox;->i:I

    .line 2
    .line 3
    return-void
.end method

.method public e(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/cox;->f:I

    .line 2
    .line 3
    return-void
.end method
