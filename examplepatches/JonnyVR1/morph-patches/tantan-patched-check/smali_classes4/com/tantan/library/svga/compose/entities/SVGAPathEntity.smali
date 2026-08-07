.class public final Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u000e\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u0006J\u0008\u0010\u000b\u001a\u00020\u0006H\u0002J \u0010\u000c\u001a\u00020\t2\u0006\u0010\r\u001a\u00020\u00062\u0006\u0010\u000e\u001a\u00020\u00032\u0006\u0010\u000f\u001a\u00020\u0010H\u0002J\u0010\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0003H\u0002R\u0010\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0014"
    }
    d2 = {
        "Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;",
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
        "initPath",
        "operate",
        "finalPath",
        "method",
        "args",
        "Ljava/util/StringTokenizer;",
        "validMethods",
        "",
        "seg",
        "svga_lib_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private cachedPath:Landroid/graphics/Path;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final replacedValue:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 6
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
    const/4 v4, 0x4

    .line 8
    const/4 v5, 0x0

    .line 9
    const-string v1, ","

    .line 10
    .line 11
    const-string v2, " "

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    move-object v0, p1

    .line 15
    invoke-static/range {v0 .. v5}, Lkotlin/text/d;->F(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;->replacedValue:Ljava/lang/String;

    .line 20
    .line 21
    return-void
.end method

.method private final initPath()Landroid/graphics/Path;
    .locals 7

    .line 1
    new-instance v0, Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/StringTokenizer;

    .line 7
    .line 8
    iget-object v2, p0, Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;->replacedValue:Ljava/lang/String;

    .line 9
    .line 10
    const-string v3, "MLHVCSQRAZmlhvcsqraz"

    .line 11
    .line 12
    const/4 v4, 0x1

    .line 13
    invoke-direct {v1, v2, v3, v4}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 14
    .line 15
    .line 16
    const-string v2, ""

    .line 17
    .line 18
    move-object v3, v2

    .line 19
    :goto_0
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    if-eqz v4, :cond_4

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    if-eqz v5, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    invoke-direct {p0, v4}, Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;->validMethods(Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result v5

    .line 43
    if-eqz v5, :cond_3

    .line 44
    .line 45
    const-string v3, "Z"

    .line 46
    .line 47
    invoke-static {v4, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-nez v3, :cond_1

    .line 52
    .line 53
    const-string v3, "z"

    .line 54
    .line 55
    invoke-static {v4, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-eqz v3, :cond_2

    .line 60
    .line 61
    :cond_1
    new-instance v3, Ljava/util/StringTokenizer;

    .line 62
    .line 63
    invoke-direct {v3, v2, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-direct {p0, v0, v4, v3}, Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;->operate(Landroid/graphics/Path;Ljava/lang/String;Ljava/util/StringTokenizer;)V

    .line 67
    .line 68
    .line 69
    :cond_2
    move-object v3, v4

    .line 70
    goto :goto_0

    .line 71
    :cond_3
    new-instance v5, Ljava/util/StringTokenizer;

    .line 72
    .line 73
    const-string v6, " "

    .line 74
    .line 75
    invoke-direct {v5, v4, v6}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-direct {p0, v0, v3, v5}, Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;->operate(Landroid/graphics/Path;Ljava/lang/String;Ljava/util/StringTokenizer;)V

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_4
    return-object v0
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
    const-string v6, "M"

    .line 79
    .line 80
    invoke-static {p2, v6}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v6

    .line 84
    if-eqz v6, :cond_8

    .line 85
    .line 86
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 87
    .line 88
    .line 89
    new-instance v6, Lcom/tantan/library/svga/utils/FPoint;

    .line 90
    .line 91
    invoke-direct {v6, v1, v2}, Lcom/tantan/library/svga/utils/FPoint;-><init>(FF)V

    .line 92
    .line 93
    .line 94
    :goto_1
    move-object v9, v6

    .line 95
    goto :goto_2

    .line 96
    :cond_8
    const-string v6, "m"

    .line 97
    .line 98
    invoke-static {p2, v6}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v6

    .line 102
    if-eqz v6, :cond_9

    .line 103
    .line 104
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Path;->rMoveTo(FF)V

    .line 105
    .line 106
    .line 107
    new-instance v6, Lcom/tantan/library/svga/utils/FPoint;

    .line 108
    .line 109
    invoke-direct {v6, v1, v2}, Lcom/tantan/library/svga/utils/FPoint;-><init>(FF)V

    .line 110
    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_9
    new-instance v6, Lcom/tantan/library/svga/utils/FPoint;

    .line 114
    .line 115
    invoke-direct {v6, v7, v7}, Lcom/tantan/library/svga/utils/FPoint;-><init>(FF)V

    .line 116
    .line 117
    .line 118
    goto :goto_1

    .line 119
    :goto_2
    const-string v6, "L"

    .line 120
    .line 121
    invoke-static {p2, v6}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v6

    .line 125
    if-eqz v6, :cond_a

    .line 126
    .line 127
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 128
    .line 129
    .line 130
    goto :goto_3

    .line 131
    :cond_a
    const-string v6, "l"

    .line 132
    .line 133
    invoke-static {p2, v6}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v6

    .line 137
    if-eqz v6, :cond_b

    .line 138
    .line 139
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 140
    .line 141
    .line 142
    :cond_b
    :goto_3
    const-string v6, "C"

    .line 143
    .line 144
    invoke-static {p2, v6}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result v6

    .line 148
    if-eqz v6, :cond_c

    .line 149
    .line 150
    move-object v0, p1

    .line 151
    move v6, v8

    .line 152
    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 153
    .line 154
    .line 155
    goto :goto_4

    .line 156
    :cond_c
    move v6, v8

    .line 157
    const-string v0, "c"

    .line 158
    .line 159
    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    if-eqz v0, :cond_d

    .line 164
    .line 165
    move-object v0, p1

    .line 166
    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->rCubicTo(FFFFFF)V

    .line 167
    .line 168
    .line 169
    :cond_d
    :goto_4
    const-string v5, "Q"

    .line 170
    .line 171
    invoke-static {p2, v5}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v5

    .line 175
    if-eqz v5, :cond_e

    .line 176
    .line 177
    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 178
    .line 179
    .line 180
    goto :goto_5

    .line 181
    :cond_e
    const-string v5, "q"

    .line 182
    .line 183
    invoke-static {p2, v5}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result v5

    .line 187
    if-eqz v5, :cond_f

    .line 188
    .line 189
    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Path;->rQuadTo(FFFF)V

    .line 190
    .line 191
    .line 192
    :cond_f
    :goto_5
    const-string v2, "H"

    .line 193
    .line 194
    invoke-static {p2, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    move-result v2

    .line 198
    if-eqz v2, :cond_10

    .line 199
    .line 200
    invoke-virtual {v9}, Lcom/tantan/library/svga/utils/FPoint;->getY()F

    .line 201
    .line 202
    .line 203
    move-result v2

    .line 204
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 205
    .line 206
    .line 207
    goto :goto_6

    .line 208
    :cond_10
    const-string v2, "h"

    .line 209
    .line 210
    invoke-static {p2, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    move-result v2

    .line 214
    if-eqz v2, :cond_11

    .line 215
    .line 216
    invoke-virtual {p1, v1, v7}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 217
    .line 218
    .line 219
    :cond_11
    :goto_6
    const-string v2, "V"

    .line 220
    .line 221
    invoke-static {p2, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    move-result v2

    .line 225
    if-eqz v2, :cond_12

    .line 226
    .line 227
    invoke-virtual {v9}, Lcom/tantan/library/svga/utils/FPoint;->getX()F

    .line 228
    .line 229
    .line 230
    move-result v2

    .line 231
    invoke-virtual {p1, v2, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 232
    .line 233
    .line 234
    goto :goto_7

    .line 235
    :cond_12
    const-string v2, "v"

    .line 236
    .line 237
    invoke-static {p2, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    move-result v2

    .line 241
    if-eqz v2, :cond_13

    .line 242
    .line 243
    invoke-virtual {p1, v7, v1}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 244
    .line 245
    .line 246
    :cond_13
    :goto_7
    const-string v1, "Z"

    .line 247
    .line 248
    invoke-static {p2, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 249
    .line 250
    .line 251
    move-result v1

    .line 252
    if-nez v1, :cond_14

    .line 253
    .line 254
    const-string v1, "z"

    .line 255
    .line 256
    invoke-static {p2, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 257
    .line 258
    .line 259
    move-result v1

    .line 260
    if-eqz v1, :cond_15

    .line 261
    .line 262
    :cond_14
    invoke-virtual {p1}, Landroid/graphics/Path;->close()V

    .line 263
    .line 264
    .line 265
    :cond_15
    return-void
.end method

.method private final validMethods(Ljava/lang/String;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 v0, 0x41

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    if-eq p0, v0, :cond_e

    .line 9
    .line 10
    const/16 v0, 0x43

    .line 11
    .line 12
    if-eq p0, v0, :cond_d

    .line 13
    .line 14
    const/16 v0, 0x48

    .line 15
    .line 16
    if-eq p0, v0, :cond_c

    .line 17
    .line 18
    const/16 v0, 0x56

    .line 19
    .line 20
    if-eq p0, v0, :cond_b

    .line 21
    .line 22
    const/16 v0, 0x5a

    .line 23
    .line 24
    if-eq p0, v0, :cond_a

    .line 25
    .line 26
    const/16 v0, 0x61

    .line 27
    .line 28
    if-eq p0, v0, :cond_8

    .line 29
    .line 30
    const/16 v0, 0x63

    .line 31
    .line 32
    if-eq p0, v0, :cond_7

    .line 33
    .line 34
    const/16 v0, 0x68

    .line 35
    .line 36
    if-eq p0, v0, :cond_6

    .line 37
    .line 38
    const/16 v0, 0x76

    .line 39
    .line 40
    if-eq p0, v0, :cond_5

    .line 41
    .line 42
    const/16 v0, 0x7a

    .line 43
    .line 44
    if-eq p0, v0, :cond_4

    .line 45
    .line 46
    const/16 v0, 0x4c

    .line 47
    .line 48
    if-eq p0, v0, :cond_3

    .line 49
    .line 50
    const/16 v0, 0x4d

    .line 51
    .line 52
    if-eq p0, v0, :cond_2

    .line 53
    .line 54
    const/16 v0, 0x6c

    .line 55
    .line 56
    if-eq p0, v0, :cond_1

    .line 57
    .line 58
    const/16 v0, 0x6d

    .line 59
    .line 60
    if-eq p0, v0, :cond_0

    .line 61
    .line 62
    packed-switch p0, :pswitch_data_0

    .line 63
    .line 64
    .line 65
    packed-switch p0, :pswitch_data_1

    .line 66
    .line 67
    .line 68
    goto/16 :goto_0

    .line 69
    .line 70
    :pswitch_0
    const-string p0, "s"

    .line 71
    .line 72
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-nez p0, :cond_9

    .line 77
    .line 78
    goto/16 :goto_0

    .line 79
    .line 80
    :pswitch_1
    const-string p0, "r"

    .line 81
    .line 82
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    if-nez p0, :cond_9

    .line 87
    .line 88
    goto/16 :goto_0

    .line 89
    .line 90
    :pswitch_2
    const-string p0, "q"

    .line 91
    .line 92
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    if-nez p0, :cond_9

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :pswitch_3
    const-string p0, "S"

    .line 101
    .line 102
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    if-nez p0, :cond_f

    .line 107
    .line 108
    goto/16 :goto_0

    .line 109
    .line 110
    :pswitch_4
    const-string p0, "R"

    .line 111
    .line 112
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result p0

    .line 116
    if-nez p0, :cond_f

    .line 117
    .line 118
    goto/16 :goto_0

    .line 119
    .line 120
    :pswitch_5
    const-string p0, "Q"

    .line 121
    .line 122
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result p0

    .line 126
    if-nez p0, :cond_f

    .line 127
    .line 128
    goto/16 :goto_0

    .line 129
    .line 130
    :cond_0
    const-string p0, "m"

    .line 131
    .line 132
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    if-nez p0, :cond_9

    .line 137
    .line 138
    goto/16 :goto_0

    .line 139
    .line 140
    :cond_1
    const-string p0, "l"

    .line 141
    .line 142
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result p0

    .line 146
    if-nez p0, :cond_9

    .line 147
    .line 148
    goto/16 :goto_0

    .line 149
    .line 150
    :cond_2
    const-string p0, "M"

    .line 151
    .line 152
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result p0

    .line 156
    if-nez p0, :cond_f

    .line 157
    .line 158
    goto/16 :goto_0

    .line 159
    .line 160
    :cond_3
    const-string p0, "L"

    .line 161
    .line 162
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    move-result p0

    .line 166
    if-nez p0, :cond_f

    .line 167
    .line 168
    goto :goto_0

    .line 169
    :cond_4
    const-string p0, "z"

    .line 170
    .line 171
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result p0

    .line 175
    if-nez p0, :cond_9

    .line 176
    .line 177
    goto :goto_0

    .line 178
    :cond_5
    const-string p0, "v"

    .line 179
    .line 180
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    move-result p0

    .line 184
    if-nez p0, :cond_9

    .line 185
    .line 186
    goto :goto_0

    .line 187
    :cond_6
    const-string p0, "h"

    .line 188
    .line 189
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    move-result p0

    .line 193
    if-nez p0, :cond_9

    .line 194
    .line 195
    goto :goto_0

    .line 196
    :cond_7
    const-string p0, "c"

    .line 197
    .line 198
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    move-result p0

    .line 202
    if-nez p0, :cond_9

    .line 203
    .line 204
    goto :goto_0

    .line 205
    :cond_8
    const-string p0, "a"

    .line 206
    .line 207
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    move-result p0

    .line 211
    if-nez p0, :cond_9

    .line 212
    .line 213
    goto :goto_0

    .line 214
    :cond_9
    return v1

    .line 215
    :cond_a
    const-string p0, "Z"

    .line 216
    .line 217
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 218
    .line 219
    .line 220
    move-result p0

    .line 221
    if-nez p0, :cond_f

    .line 222
    .line 223
    goto :goto_0

    .line 224
    :cond_b
    const-string p0, "V"

    .line 225
    .line 226
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 227
    .line 228
    .line 229
    move-result p0

    .line 230
    if-nez p0, :cond_f

    .line 231
    .line 232
    goto :goto_0

    .line 233
    :cond_c
    const-string p0, "H"

    .line 234
    .line 235
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 236
    .line 237
    .line 238
    move-result p0

    .line 239
    if-nez p0, :cond_f

    .line 240
    .line 241
    goto :goto_0

    .line 242
    :cond_d
    const-string p0, "C"

    .line 243
    .line 244
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 245
    .line 246
    .line 247
    move-result p0

    .line 248
    if-nez p0, :cond_f

    .line 249
    .line 250
    goto :goto_0

    .line 251
    :cond_e
    const-string p0, "A"

    .line 252
    .line 253
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 254
    .line 255
    .line 256
    move-result p0

    .line 257
    if-nez p0, :cond_f

    .line 258
    .line 259
    :goto_0
    const/4 p0, 0x0

    .line 260
    return p0

    .line 261
    :cond_f
    return v1

    .line 262
    nop

    .line 263
    :pswitch_data_0
    .packed-switch 0x51
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch

    .line 264
    .line 265
    .line 266
    .line 267
    .line 268
    .line 269
    .line 270
    .line 271
    .line 272
    .line 273
    :pswitch_data_1
    .packed-switch 0x71
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final buildPath(Landroid/graphics/Path;)V
    .locals 1
    .param p1    # Landroid/graphics/Path;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;->cachedPath:Landroid/graphics/Path;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;->initPath()Landroid/graphics/Path;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :cond_0
    iput-object v0, p0, Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;->cachedPath:Landroid/graphics/Path;

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/graphics/Path;->set(Landroid/graphics/Path;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
