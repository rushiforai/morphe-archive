.class public final Lcom/immomo/svgaplayer/SVGAPath;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u000e\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u0006J \u0010\u000b\u001a\u00020\t2\u0006\u0010\u000c\u001a\u00020\u00062\u0006\u0010\r\u001a\u00020\u00032\u0006\u0010\u000e\u001a\u00020\u000fH\u0002R\u0010\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0010"
    }
    d2 = {
        "Lcom/immomo/svgaplayer/SVGAPath;",
        "",
        "originValue",
        "",
        "(Ljava/lang/String;)V",
        "cachedPath",
        "Landroid/graphics/Path;",
        "replacedValue",
        "buildPath",
        "",
        "toPath",
        "operate",
        "finalPath",
        "method",
        "args",
        "Ljava/util/StringTokenizer;",
        "svgalibrary_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xa
    }
.end annotation


# instance fields
.field private cachedPath:Landroid/graphics/Path;

.field private final replacedValue:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 7
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    const/4 v1, 0x0

    .line 9
    const-string v2, ","

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-static {p1, v2, v3, v0, v1}, Lkotlin/text/StringsKt;->P(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    const/4 v5, 0x4

    .line 19
    const/4 v6, 0x0

    .line 20
    const-string v2, ","

    .line 21
    .line 22
    const-string v3, " "

    .line 23
    .line 24
    const/4 v4, 0x0

    .line 25
    move-object v1, p1

    .line 26
    invoke-static/range {v1 .. v6}, Lkotlin/text/d;->F(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    move-object v1, p1

    .line 32
    :goto_0
    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAPath;->replacedValue:Ljava/lang/String;

    .line 33
    .line 34
    return-void
.end method

.method private final operate(Landroid/graphics/Path;Ljava/lang/String;Ljava/util/StringTokenizer;)V
    .locals 11

    .line 1
    const/4 v7, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v7

    .line 4
    move v3, v2

    .line 5
    move v4, v3

    .line 6
    move v5, v4

    .line 7
    move v6, v5

    .line 8
    move v8, v6

    .line 9
    :goto_0
    :try_start_0
    invoke-virtual {p3}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    .line 10
    .line 11
    .line 12
    move-result v9

    .line 13
    if-eqz v9, :cond_7

    .line 14
    .line 15
    invoke-virtual {p3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v9

    .line 19
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    invoke-interface {v9}, Ljava/lang/CharSequence;->length()I

    .line 23
    .line 24
    .line 25
    move-result v10

    .line 26
    if-nez v10, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    if-nez v1, :cond_1

    .line 30
    .line 31
    invoke-static {v9}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    :cond_1
    const/4 v10, 0x1

    .line 36
    if-ne v1, v10, :cond_2

    .line 37
    .line 38
    invoke-static {v9}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    :cond_2
    const/4 v10, 0x2

    .line 43
    if-ne v1, v10, :cond_3

    .line 44
    .line 45
    invoke-static {v9}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    :cond_3
    const/4 v10, 0x3

    .line 50
    if-ne v1, v10, :cond_4

    .line 51
    .line 52
    invoke-static {v9}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 53
    .line 54
    .line 55
    move-result v5

    .line 56
    :cond_4
    const/4 v10, 0x4

    .line 57
    if-ne v1, v10, :cond_5

    .line 58
    .line 59
    invoke-static {v9}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 60
    .line 61
    .line 62
    move-result v6

    .line 63
    :cond_5
    const/4 v10, 0x5

    .line 64
    if-ne v1, v10, :cond_6

    .line 65
    .line 66
    invoke-static {v9}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 67
    .line 68
    .line 69
    move-result v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    :cond_6
    add-int/lit8 v1, v1, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :catch_0
    :cond_7
    move v1, v2

    .line 74
    move v2, v3

    .line 75
    move v3, v4

    .line 76
    move v4, v5

    .line 77
    move v5, v6

    .line 78
    new-instance v6, Lcom/immomo/svgaplayer/SVGAPoint;

    .line 79
    .line 80
    invoke-direct {v6, v7, v7, v7}, Lcom/immomo/svgaplayer/SVGAPoint;-><init>(FFF)V

    .line 81
    .line 82
    .line 83
    const-string v9, "M"

    .line 84
    .line 85
    invoke-static {p2, v9}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v9

    .line 89
    if-eqz v9, :cond_9

    .line 90
    .line 91
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 92
    .line 93
    .line 94
    new-instance v6, Lcom/immomo/svgaplayer/SVGAPoint;

    .line 95
    .line 96
    invoke-direct {v6, v1, v2, v7}, Lcom/immomo/svgaplayer/SVGAPoint;-><init>(FFF)V

    .line 97
    .line 98
    .line 99
    :cond_8
    move-object v9, v6

    .line 100
    goto :goto_1

    .line 101
    :cond_9
    const-string v9, "m"

    .line 102
    .line 103
    invoke-static {p2, v9}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v9

    .line 107
    if-eqz v9, :cond_8

    .line 108
    .line 109
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Path;->rMoveTo(FF)V

    .line 110
    .line 111
    .line 112
    new-instance v9, Lcom/immomo/svgaplayer/SVGAPoint;

    .line 113
    .line 114
    invoke-virtual {v6}, Lcom/immomo/svgaplayer/SVGAPoint;->getX()F

    .line 115
    .line 116
    .line 117
    move-result v10

    .line 118
    add-float/2addr v10, v1

    .line 119
    invoke-virtual {v6}, Lcom/immomo/svgaplayer/SVGAPoint;->getY()F

    .line 120
    .line 121
    .line 122
    move-result v6

    .line 123
    add-float/2addr v6, v2

    .line 124
    invoke-direct {v9, v10, v6, v7}, Lcom/immomo/svgaplayer/SVGAPoint;-><init>(FFF)V

    .line 125
    .line 126
    .line 127
    :goto_1
    const-string v6, "L"

    .line 128
    .line 129
    invoke-static {p2, v6}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v6

    .line 133
    if-eqz v6, :cond_a

    .line 134
    .line 135
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 136
    .line 137
    .line 138
    goto :goto_2

    .line 139
    :cond_a
    const-string v6, "l"

    .line 140
    .line 141
    invoke-static {p2, v6}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result v6

    .line 145
    if-eqz v6, :cond_b

    .line 146
    .line 147
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 148
    .line 149
    .line 150
    :cond_b
    :goto_2
    const-string v6, "C"

    .line 151
    .line 152
    invoke-static {p2, v6}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result v6

    .line 156
    if-eqz v6, :cond_c

    .line 157
    .line 158
    move-object v0, p1

    .line 159
    move v6, v8

    .line 160
    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 161
    .line 162
    .line 163
    goto :goto_3

    .line 164
    :cond_c
    move v6, v8

    .line 165
    const-string v0, "c"

    .line 166
    .line 167
    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    if-eqz v0, :cond_d

    .line 172
    .line 173
    move-object v0, p1

    .line 174
    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->rCubicTo(FFFFFF)V

    .line 175
    .line 176
    .line 177
    :cond_d
    :goto_3
    const-string v5, "Q"

    .line 178
    .line 179
    invoke-static {p2, v5}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result v5

    .line 183
    if-eqz v5, :cond_e

    .line 184
    .line 185
    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 186
    .line 187
    .line 188
    goto :goto_4

    .line 189
    :cond_e
    const-string v5, "q"

    .line 190
    .line 191
    invoke-static {p2, v5}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    move-result v5

    .line 195
    if-eqz v5, :cond_f

    .line 196
    .line 197
    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Path;->rQuadTo(FFFF)V

    .line 198
    .line 199
    .line 200
    :cond_f
    :goto_4
    const-string v2, "H"

    .line 201
    .line 202
    invoke-static {p2, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    move-result v2

    .line 206
    if-eqz v2, :cond_10

    .line 207
    .line 208
    invoke-virtual {v9}, Lcom/immomo/svgaplayer/SVGAPoint;->getY()F

    .line 209
    .line 210
    .line 211
    move-result v2

    .line 212
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 213
    .line 214
    .line 215
    goto :goto_5

    .line 216
    :cond_10
    const-string v2, "h"

    .line 217
    .line 218
    invoke-static {p2, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 219
    .line 220
    .line 221
    move-result v2

    .line 222
    if-eqz v2, :cond_11

    .line 223
    .line 224
    invoke-virtual {p1, v1, v7}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 225
    .line 226
    .line 227
    :cond_11
    :goto_5
    const-string v2, "V"

    .line 228
    .line 229
    invoke-static {p2, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 230
    .line 231
    .line 232
    move-result v2

    .line 233
    if-eqz v2, :cond_12

    .line 234
    .line 235
    invoke-virtual {v9}, Lcom/immomo/svgaplayer/SVGAPoint;->getX()F

    .line 236
    .line 237
    .line 238
    move-result v2

    .line 239
    invoke-virtual {p1, v2, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 240
    .line 241
    .line 242
    goto :goto_6

    .line 243
    :cond_12
    const-string v2, "v"

    .line 244
    .line 245
    invoke-static {p2, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 246
    .line 247
    .line 248
    move-result v2

    .line 249
    if-eqz v2, :cond_13

    .line 250
    .line 251
    invoke-virtual {p1, v7, v1}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 252
    .line 253
    .line 254
    :cond_13
    :goto_6
    const-string v1, "Z"

    .line 255
    .line 256
    invoke-static {p2, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 257
    .line 258
    .line 259
    move-result v1

    .line 260
    if-eqz v1, :cond_14

    .line 261
    .line 262
    invoke-virtual {p1}, Landroid/graphics/Path;->close()V

    .line 263
    .line 264
    .line 265
    goto :goto_7

    .line 266
    :cond_14
    const-string v1, "z"

    .line 267
    .line 268
    invoke-static {p2, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 269
    .line 270
    .line 271
    move-result v1

    .line 272
    if-eqz v1, :cond_15

    .line 273
    .line 274
    invoke-virtual {p1}, Landroid/graphics/Path;->close()V

    .line 275
    .line 276
    .line 277
    :cond_15
    :goto_7
    return-void
.end method


# virtual methods
.method public final buildPath(Landroid/graphics/Path;)V
    .locals 7
    .param p1    # Landroid/graphics/Path;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/immomo/svgaplayer/SVGAPath;->cachedPath:Landroid/graphics/Path;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/graphics/Path;->set(Landroid/graphics/Path;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    new-instance v0, Landroid/graphics/Path;

    .line 13
    .line 14
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 15
    .line 16
    .line 17
    new-instance v1, Ljava/util/StringTokenizer;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/immomo/svgaplayer/SVGAPath;->replacedValue:Ljava/lang/String;

    .line 20
    .line 21
    const-string v3, "MLHVCSQRAZmlhvcsqraz"

    .line 22
    .line 23
    const/4 v4, 0x1

    .line 24
    invoke-direct {v1, v2, v3, v4}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 25
    .line 26
    .line 27
    const-string v2, ""

    .line 28
    .line 29
    move-object v3, v2

    .line 30
    :goto_0
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    if-eqz v4, :cond_5

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    if-nez v5, :cond_1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    invoke-static {}, Lcom/immomo/svgaplayer/SVGAPathKt;->access$getVALID_METHODS$p()Ljava/util/Set;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    invoke-interface {v5, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    if-eqz v5, :cond_4

    .line 59
    .line 60
    const-string v3, "Z"

    .line 61
    .line 62
    invoke-static {v4, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    if-nez v3, :cond_2

    .line 67
    .line 68
    const-string v3, "z"

    .line 69
    .line 70
    invoke-static {v4, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    if-eqz v3, :cond_3

    .line 75
    .line 76
    :cond_2
    new-instance v3, Ljava/util/StringTokenizer;

    .line 77
    .line 78
    invoke-direct {v3, v2, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-direct {p0, v0, v4, v3}, Lcom/immomo/svgaplayer/SVGAPath;->operate(Landroid/graphics/Path;Ljava/lang/String;Ljava/util/StringTokenizer;)V

    .line 82
    .line 83
    .line 84
    :cond_3
    move-object v3, v4

    .line 85
    goto :goto_0

    .line 86
    :cond_4
    new-instance v5, Ljava/util/StringTokenizer;

    .line 87
    .line 88
    const-string v6, " "

    .line 89
    .line 90
    invoke-direct {v5, v4, v6}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-direct {p0, v0, v3, v5}, Lcom/immomo/svgaplayer/SVGAPath;->operate(Landroid/graphics/Path;Ljava/lang/String;Ljava/util/StringTokenizer;)V

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_5
    iput-object v0, p0, Lcom/immomo/svgaplayer/SVGAPath;->cachedPath:Landroid/graphics/Path;

    .line 98
    .line 99
    invoke-virtual {p1, v0}, Landroid/graphics/Path;->set(Landroid/graphics/Path;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method
