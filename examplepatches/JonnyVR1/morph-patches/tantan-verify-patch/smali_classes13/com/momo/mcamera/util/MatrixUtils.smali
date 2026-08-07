.class public final enum Lcom/momo/mcamera/util/MatrixUtils;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/momo/mcamera/util/MatrixUtils;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/momo/mcamera/util/MatrixUtils;

.field public static final TYPE_CENTERCROP:I = 0x1

.field public static final TYPE_CENTERINSIDE:I = 0x2

.field public static final TYPE_FITEND:I = 0x4

.field public static final TYPE_FITSTART:I = 0x3

.field public static final TYPE_FITXY:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Lcom/momo/mcamera/util/MatrixUtils;

    .line 3
    .line 4
    sput-object v0, Lcom/momo/mcamera/util/MatrixUtils;->$VALUES:[Lcom/momo/mcamera/util/MatrixUtils;

    .line 5
    .line 6
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static flip([FZZ)[F
    .locals 2

    .line 1
    if-nez p1, :cond_1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    return-object p0

    .line 7
    :cond_1
    :goto_0
    const/high16 v0, -0x40800000    # -1.0f

    .line 8
    .line 9
    const/high16 v1, 0x3f800000    # 1.0f

    .line 10
    .line 11
    if-eqz p1, :cond_2

    .line 12
    .line 13
    move p1, v0

    .line 14
    goto :goto_1

    .line 15
    :cond_2
    move p1, v1

    .line 16
    :goto_1
    if-eqz p2, :cond_3

    .line 17
    .line 18
    goto :goto_2

    .line 19
    :cond_3
    move v0, v1

    .line 20
    :goto_2
    const/4 p2, 0x0

    .line 21
    invoke-static {p0, p2, p1, v0, v1}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 22
    .line 23
    .line 24
    return-object p0
.end method

.method public static getMatrix([FIIIII)V
    .locals 18

    .line 1
    move/from16 v0, p1

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    move/from16 v2, p3

    .line 6
    .line 7
    move/from16 v3, p4

    .line 8
    .line 9
    move/from16 v4, p5

    .line 10
    .line 11
    if-lez v2, :cond_a

    .line 12
    .line 13
    if-lez v1, :cond_a

    .line 14
    .line 15
    if-lez v3, :cond_a

    .line 16
    .line 17
    if-lez v4, :cond_a

    .line 18
    .line 19
    const/16 v5, 0x10

    .line 20
    .line 21
    new-array v6, v5, [F

    .line 22
    .line 23
    new-array v5, v5, [F

    .line 24
    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    const/high16 v12, 0x3f800000    # 1.0f

    .line 28
    .line 29
    const/high16 v13, 0x40400000    # 3.0f

    .line 30
    .line 31
    const/4 v7, 0x0

    .line 32
    const/high16 v8, -0x40800000    # -1.0f

    .line 33
    .line 34
    const/high16 v9, 0x3f800000    # 1.0f

    .line 35
    .line 36
    const/high16 v10, -0x40800000    # -1.0f

    .line 37
    .line 38
    const/high16 v11, 0x3f800000    # 1.0f

    .line 39
    .line 40
    invoke-static/range {v6 .. v13}, Landroid/opengl/Matrix;->orthoM([FIFFFFFF)V

    .line 41
    .line 42
    .line 43
    const/high16 v16, 0x3f800000    # 1.0f

    .line 44
    .line 45
    const/16 v17, 0x0

    .line 46
    .line 47
    const/4 v8, 0x0

    .line 48
    const/4 v9, 0x0

    .line 49
    const/4 v10, 0x0

    .line 50
    const/4 v12, 0x0

    .line 51
    const/4 v13, 0x0

    .line 52
    const/4 v14, 0x0

    .line 53
    const/4 v15, 0x0

    .line 54
    move-object v7, v5

    .line 55
    invoke-static/range {v7 .. v17}, Landroid/opengl/Matrix;->setLookAtM([FIFFFFFFFFF)V

    .line 56
    .line 57
    .line 58
    move-object v10, v7

    .line 59
    const/4 v9, 0x0

    .line 60
    const/4 v11, 0x0

    .line 61
    const/4 v7, 0x0

    .line 62
    move-object v8, v6

    .line 63
    move-object/from16 v6, p0

    .line 64
    .line 65
    invoke-static/range {v6 .. v11}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_0
    int-to-float v3, v3

    .line 70
    int-to-float v4, v4

    .line 71
    div-float/2addr v3, v4

    .line 72
    int-to-float v1, v1

    .line 73
    int-to-float v2, v2

    .line 74
    div-float/2addr v1, v2

    .line 75
    cmpl-float v2, v1, v3

    .line 76
    .line 77
    const/4 v4, 0x4

    .line 78
    const/4 v7, 0x3

    .line 79
    const/4 v8, 0x2

    .line 80
    const/4 v9, 0x1

    .line 81
    const/high16 v10, 0x3f800000    # 1.0f

    .line 82
    .line 83
    const/high16 v11, 0x40000000    # 2.0f

    .line 84
    .line 85
    if-lez v2, :cond_5

    .line 86
    .line 87
    if-eq v0, v9, :cond_4

    .line 88
    .line 89
    if-eq v0, v8, :cond_3

    .line 90
    .line 91
    if-eq v0, v7, :cond_2

    .line 92
    .line 93
    if-eq v0, v4, :cond_1

    .line 94
    .line 95
    goto/16 :goto_0

    .line 96
    .line 97
    :cond_1
    mul-float/2addr v1, v11

    .line 98
    div-float/2addr v1, v3

    .line 99
    sub-float v11, v1, v10

    .line 100
    .line 101
    const/high16 v12, 0x3f800000    # 1.0f

    .line 102
    .line 103
    const/high16 v13, 0x40400000    # 3.0f

    .line 104
    .line 105
    const/4 v7, 0x0

    .line 106
    const/high16 v8, -0x40800000    # -1.0f

    .line 107
    .line 108
    const/high16 v9, 0x3f800000    # 1.0f

    .line 109
    .line 110
    const/high16 v10, -0x40800000    # -1.0f

    .line 111
    .line 112
    invoke-static/range {v6 .. v13}, Landroid/opengl/Matrix;->orthoM([FIFFFFFF)V

    .line 113
    .line 114
    .line 115
    goto/16 :goto_0

    .line 116
    .line 117
    :cond_2
    mul-float/2addr v1, v11

    .line 118
    div-float/2addr v1, v3

    .line 119
    sub-float/2addr v10, v1

    .line 120
    const/high16 v12, 0x3f800000    # 1.0f

    .line 121
    .line 122
    const/high16 v13, 0x40400000    # 3.0f

    .line 123
    .line 124
    const/4 v7, 0x0

    .line 125
    const/high16 v8, -0x40800000    # -1.0f

    .line 126
    .line 127
    const/high16 v9, 0x3f800000    # 1.0f

    .line 128
    .line 129
    const/high16 v11, 0x3f800000    # 1.0f

    .line 130
    .line 131
    invoke-static/range {v6 .. v13}, Landroid/opengl/Matrix;->orthoM([FIFFFFFF)V

    .line 132
    .line 133
    .line 134
    goto/16 :goto_0

    .line 135
    .line 136
    :cond_3
    neg-float v0, v1

    .line 137
    div-float v10, v0, v3

    .line 138
    .line 139
    div-float v11, v1, v3

    .line 140
    .line 141
    const/high16 v12, 0x3f800000    # 1.0f

    .line 142
    .line 143
    const/high16 v13, 0x40400000    # 3.0f

    .line 144
    .line 145
    const/4 v7, 0x0

    .line 146
    const/high16 v8, -0x40800000    # -1.0f

    .line 147
    .line 148
    const/high16 v9, 0x3f800000    # 1.0f

    .line 149
    .line 150
    invoke-static/range {v6 .. v13}, Landroid/opengl/Matrix;->orthoM([FIFFFFFF)V

    .line 151
    .line 152
    .line 153
    goto :goto_0

    .line 154
    :cond_4
    neg-float v0, v3

    .line 155
    div-float v8, v0, v1

    .line 156
    .line 157
    div-float v9, v3, v1

    .line 158
    .line 159
    const/high16 v12, 0x3f800000    # 1.0f

    .line 160
    .line 161
    const/high16 v13, 0x40400000    # 3.0f

    .line 162
    .line 163
    const/4 v7, 0x0

    .line 164
    const/high16 v10, -0x40800000    # -1.0f

    .line 165
    .line 166
    const/high16 v11, 0x3f800000    # 1.0f

    .line 167
    .line 168
    invoke-static/range {v6 .. v13}, Landroid/opengl/Matrix;->orthoM([FIFFFFFF)V

    .line 169
    .line 170
    .line 171
    goto :goto_0

    .line 172
    :cond_5
    if-eq v0, v9, :cond_9

    .line 173
    .line 174
    if-eq v0, v8, :cond_8

    .line 175
    .line 176
    if-eq v0, v7, :cond_7

    .line 177
    .line 178
    if-eq v0, v4, :cond_6

    .line 179
    .line 180
    goto :goto_0

    .line 181
    :cond_6
    mul-float/2addr v3, v11

    .line 182
    div-float/2addr v3, v1

    .line 183
    sub-float v8, v10, v3

    .line 184
    .line 185
    const/high16 v12, 0x3f800000    # 1.0f

    .line 186
    .line 187
    const/high16 v13, 0x40400000    # 3.0f

    .line 188
    .line 189
    const/4 v7, 0x0

    .line 190
    const/high16 v9, 0x3f800000    # 1.0f

    .line 191
    .line 192
    const/high16 v10, -0x40800000    # -1.0f

    .line 193
    .line 194
    const/high16 v11, 0x3f800000    # 1.0f

    .line 195
    .line 196
    invoke-static/range {v6 .. v13}, Landroid/opengl/Matrix;->orthoM([FIFFFFFF)V

    .line 197
    .line 198
    .line 199
    goto :goto_0

    .line 200
    :cond_7
    mul-float/2addr v3, v11

    .line 201
    div-float/2addr v3, v1

    .line 202
    sub-float v9, v3, v10

    .line 203
    .line 204
    const/high16 v12, 0x3f800000    # 1.0f

    .line 205
    .line 206
    const/high16 v13, 0x40400000    # 3.0f

    .line 207
    .line 208
    const/4 v7, 0x0

    .line 209
    const/high16 v8, -0x40800000    # -1.0f

    .line 210
    .line 211
    const/high16 v10, -0x40800000    # -1.0f

    .line 212
    .line 213
    const/high16 v11, 0x3f800000    # 1.0f

    .line 214
    .line 215
    invoke-static/range {v6 .. v13}, Landroid/opengl/Matrix;->orthoM([FIFFFFFF)V

    .line 216
    .line 217
    .line 218
    goto :goto_0

    .line 219
    :cond_8
    neg-float v0, v3

    .line 220
    div-float v8, v0, v1

    .line 221
    .line 222
    div-float v9, v3, v1

    .line 223
    .line 224
    const/high16 v12, 0x3f800000    # 1.0f

    .line 225
    .line 226
    const/high16 v13, 0x40400000    # 3.0f

    .line 227
    .line 228
    const/4 v7, 0x0

    .line 229
    const/high16 v10, -0x40800000    # -1.0f

    .line 230
    .line 231
    const/high16 v11, 0x3f800000    # 1.0f

    .line 232
    .line 233
    invoke-static/range {v6 .. v13}, Landroid/opengl/Matrix;->orthoM([FIFFFFFF)V

    .line 234
    .line 235
    .line 236
    goto :goto_0

    .line 237
    :cond_9
    neg-float v0, v1

    .line 238
    div-float v10, v0, v3

    .line 239
    .line 240
    div-float v11, v1, v3

    .line 241
    .line 242
    const/high16 v12, 0x3f800000    # 1.0f

    .line 243
    .line 244
    const/high16 v13, 0x40400000    # 3.0f

    .line 245
    .line 246
    const/4 v7, 0x0

    .line 247
    const/high16 v8, -0x40800000    # -1.0f

    .line 248
    .line 249
    const/high16 v9, 0x3f800000    # 1.0f

    .line 250
    .line 251
    invoke-static/range {v6 .. v13}, Landroid/opengl/Matrix;->orthoM([FIFFFFFF)V

    .line 252
    .line 253
    .line 254
    :goto_0
    const/high16 v16, 0x3f800000    # 1.0f

    .line 255
    .line 256
    const/16 v17, 0x0

    .line 257
    .line 258
    const/4 v8, 0x0

    .line 259
    const/4 v9, 0x0

    .line 260
    const/4 v10, 0x0

    .line 261
    const/high16 v11, 0x3f800000    # 1.0f

    .line 262
    .line 263
    const/4 v12, 0x0

    .line 264
    const/4 v13, 0x0

    .line 265
    const/4 v14, 0x0

    .line 266
    const/4 v15, 0x0

    .line 267
    move-object v7, v5

    .line 268
    invoke-static/range {v7 .. v17}, Landroid/opengl/Matrix;->setLookAtM([FIFFFFFFFFF)V

    .line 269
    .line 270
    .line 271
    move-object v10, v7

    .line 272
    const/4 v9, 0x0

    .line 273
    const/4 v11, 0x0

    .line 274
    const/4 v7, 0x0

    .line 275
    move-object v8, v6

    .line 276
    move-object/from16 v6, p0

    .line 277
    .line 278
    invoke-static/range {v6 .. v11}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 279
    .line 280
    .line 281
    :cond_a
    return-void
.end method

.method public static getOriginalMatrix()[F
    .locals 1

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v0, v0, [F

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    return-object v0

    .line 9
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static getOriginalTextureCo()[F
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v0, v0, [F

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    return-object v0

    .line 9
    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static getOriginalVertexCo()[F
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v0, v0, [F

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    return-object v0

    .line 9
    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/momo/mcamera/util/MatrixUtils;
    .locals 1

    .line 1
    const-class v0, Lcom/momo/mcamera/util/MatrixUtils;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/momo/mcamera/util/MatrixUtils;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/momo/mcamera/util/MatrixUtils;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/mcamera/util/MatrixUtils;->$VALUES:[Lcom/momo/mcamera/util/MatrixUtils;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/momo/mcamera/util/MatrixUtils;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/momo/mcamera/util/MatrixUtils;

    .line 8
    .line 9
    return-object v0
.end method
