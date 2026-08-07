.class public final Ll/hwy0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Landroid/media/MediaCodecInfo$CodecCapabilities;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final e:Z

.field public final f:Z

.field public final g:Z

.field public final h:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/media/MediaCodecInfo$CodecCapabilities;ZZZZZZ)V
    .locals 0
    .param p4    # Landroid/media/MediaCodecInfo$CodecCapabilities;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/hwy0;->a:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p2, p0, Ll/hwy0;->b:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p3, p0, Ll/hwy0;->c:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p4, p0, Ll/hwy0;->d:Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 14
    .line 15
    iput-boolean p5, p0, Ll/hwy0;->g:Z

    .line 16
    .line 17
    iput-boolean p8, p0, Ll/hwy0;->e:Z

    .line 18
    .line 19
    iput-boolean p10, p0, Ll/hwy0;->f:Z

    .line 20
    .line 21
    invoke-static {p2}, Ll/a8t0;->h(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iput-boolean p1, p0, Ll/hwy0;->h:Z

    .line 26
    .line 27
    return-void
.end method

.method public static c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/media/MediaCodecInfo$CodecCapabilities;ZZZZZ)Ll/hwy0;
    .locals 11
    .param p3    # Landroid/media/MediaCodecInfo$CodecCapabilities;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/hwy0;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz p3, :cond_2

    .line 6
    .line 7
    sget v3, Ll/mpw0;->a:I

    .line 8
    .line 9
    const-string v3, "adaptive-playback"

    .line 10
    .line 11
    invoke-virtual {p3, v3}, Landroid/media/MediaCodecInfo$CodecCapabilities;->isFeatureSupported(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-eqz v3, :cond_2

    .line 16
    .line 17
    sget v3, Ll/mpw0;->a:I

    .line 18
    .line 19
    const/16 v4, 0x16

    .line 20
    .line 21
    if-gt v3, v4, :cond_0

    .line 22
    .line 23
    sget-object v3, Ll/mpw0;->d:Ljava/lang/String;

    .line 24
    .line 25
    const-string v4, "ODROID-XU3"

    .line 26
    .line 27
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    if-nez v4, :cond_1

    .line 32
    .line 33
    const-string v4, "Nexus 10"

    .line 34
    .line 35
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-eqz v3, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    move v8, v1

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    :goto_0
    const-string v3, "OMX.Exynos.AVC.Decoder"

    .line 45
    .line 46
    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    if-nez v3, :cond_2

    .line 51
    .line 52
    const-string v3, "OMX.Exynos.AVC.Decoder.secure"

    .line 53
    .line 54
    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-eqz v3, :cond_0

    .line 59
    .line 60
    :cond_2
    move v8, v2

    .line 61
    :goto_1
    if-eqz p3, :cond_3

    .line 62
    .line 63
    sget v3, Ll/mpw0;->a:I

    .line 64
    .line 65
    const-string v3, "tunneled-playback"

    .line 66
    .line 67
    invoke-virtual {p3, v3}, Landroid/media/MediaCodecInfo$CodecCapabilities;->isFeatureSupported(Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    if-eqz v3, :cond_3

    .line 72
    .line 73
    move v9, v1

    .line 74
    goto :goto_2

    .line 75
    :cond_3
    move v9, v2

    .line 76
    :goto_2
    if-nez p8, :cond_4

    .line 77
    .line 78
    if-eqz p3, :cond_5

    .line 79
    .line 80
    sget v3, Ll/mpw0;->a:I

    .line 81
    .line 82
    const-string v3, "secure-playback"

    .line 83
    .line 84
    invoke-virtual {p3, v3}, Landroid/media/MediaCodecInfo$CodecCapabilities;->isFeatureSupported(Ljava/lang/String;)Z

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    if-eqz v3, :cond_5

    .line 89
    .line 90
    :cond_4
    move-object v2, p1

    .line 91
    move-object v3, p2

    .line 92
    move-object v4, p3

    .line 93
    move v5, p4

    .line 94
    move/from16 v6, p5

    .line 95
    .line 96
    move/from16 v7, p6

    .line 97
    .line 98
    move v10, v1

    .line 99
    move-object v1, p0

    .line 100
    goto :goto_3

    .line 101
    :cond_5
    move-object v1, p0

    .line 102
    move-object v3, p2

    .line 103
    move-object v4, p3

    .line 104
    move v5, p4

    .line 105
    move/from16 v6, p5

    .line 106
    .line 107
    move/from16 v7, p6

    .line 108
    .line 109
    move v10, v2

    .line 110
    move-object v2, p1

    .line 111
    :goto_3
    invoke-direct/range {v0 .. v10}, Ll/hwy0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/media/MediaCodecInfo$CodecCapabilities;ZZZZZZ)V

    .line 112
    .line 113
    .line 114
    return-object v0
.end method

.method public static i(Landroid/media/MediaCodecInfo$VideoCapabilities;II)Landroid/graphics/Point;
    .locals 3
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x15
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/media/MediaCodecInfo$VideoCapabilities;->getWidthAlignment()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/media/MediaCodecInfo$VideoCapabilities;->getHeightAlignment()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    new-instance v1, Landroid/graphics/Point;

    .line 10
    .line 11
    sget v2, Ll/mpw0;->a:I

    .line 12
    .line 13
    add-int/2addr p1, v0

    .line 14
    add-int/lit8 p1, p1, -0x1

    .line 15
    .line 16
    div-int/2addr p1, v0

    .line 17
    mul-int/2addr p1, v0

    .line 18
    add-int/2addr p2, p0

    .line 19
    add-int/lit8 p2, p2, -0x1

    .line 20
    .line 21
    div-int/2addr p2, p0

    .line 22
    mul-int/2addr p2, p0

    .line 23
    invoke-direct {v1, p1, p2}, Landroid/graphics/Point;-><init>(II)V

    .line 24
    .line 25
    .line 26
    return-object v1
.end method

.method public static k(Landroid/media/MediaCodecInfo$VideoCapabilities;IID)Z
    .locals 2
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x15
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Ll/hwy0;->i(Landroid/media/MediaCodecInfo$VideoCapabilities;II)Landroid/graphics/Point;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget p2, p1, Landroid/graphics/Point;->x:I

    .line 6
    .line 7
    iget p1, p1, Landroid/graphics/Point;->y:I

    .line 8
    .line 9
    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    .line 10
    .line 11
    cmpl-double v0, p3, v0

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 16
    .line 17
    cmpg-double v0, p3, v0

    .line 18
    .line 19
    if-gez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-static {p3, p4}, Ljava/lang/Math;->floor(D)D

    .line 23
    .line 24
    .line 25
    move-result-wide p3

    .line 26
    invoke-virtual {p0, p2, p1, p3, p4}, Landroid/media/MediaCodecInfo$VideoCapabilities;->areSizeAndRateSupported(IID)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0

    .line 31
    :cond_1
    :goto_0
    invoke-virtual {p0, p2, p1}, Landroid/media/MediaCodecInfo$VideoCapabilities;->isSizeSupported(II)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0
.end method


# virtual methods
.method public final a(II)Landroid/graphics/Point;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x15
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hwy0;->d:Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getVideoCapabilities()Landroid/media/MediaCodecInfo$VideoCapabilities;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-static {p0, p1, p2}, Ll/hwy0;->i(Landroid/media/MediaCodecInfo$VideoCapabilities;II)Landroid/graphics/Point;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method public final b(Ll/sqr0;Ll/sqr0;)Ll/zwx0;
    .locals 9

    .line 1
    iget-object v0, p1, Ll/sqr0;->l:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p2, Ll/sqr0;->l:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/mpw0;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-eq v1, v0, :cond_0

    .line 11
    .line 12
    const/16 v0, 0x8

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    :goto_0
    iget-boolean v2, p0, Ll/hwy0;->h:Z

    .line 17
    .line 18
    if-eqz v2, :cond_9

    .line 19
    .line 20
    iget v2, p1, Ll/sqr0;->t:I

    .line 21
    .line 22
    iget v3, p2, Ll/sqr0;->t:I

    .line 23
    .line 24
    if-eq v2, v3, :cond_1

    .line 25
    .line 26
    or-int/lit16 v0, v0, 0x400

    .line 27
    .line 28
    :cond_1
    iget-boolean v2, p0, Ll/hwy0;->e:Z

    .line 29
    .line 30
    if-nez v2, :cond_3

    .line 31
    .line 32
    iget v2, p1, Ll/sqr0;->q:I

    .line 33
    .line 34
    iget v3, p2, Ll/sqr0;->q:I

    .line 35
    .line 36
    if-ne v2, v3, :cond_2

    .line 37
    .line 38
    iget v2, p1, Ll/sqr0;->r:I

    .line 39
    .line 40
    iget v3, p2, Ll/sqr0;->r:I

    .line 41
    .line 42
    if-eq v2, v3, :cond_3

    .line 43
    .line 44
    :cond_2
    or-int/lit16 v0, v0, 0x200

    .line 45
    .line 46
    :cond_3
    iget-object v2, p1, Ll/sqr0;->x:Ll/wwy0;

    .line 47
    .line 48
    iget-object v3, p2, Ll/sqr0;->x:Ll/wwy0;

    .line 49
    .line 50
    invoke-static {v2, v3}, Ll/mpw0;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-nez v2, :cond_4

    .line 55
    .line 56
    or-int/lit16 v0, v0, 0x800

    .line 57
    .line 58
    :cond_4
    iget-object v2, p0, Ll/hwy0;->a:Ljava/lang/String;

    .line 59
    .line 60
    sget-object v3, Ll/mpw0;->d:Ljava/lang/String;

    .line 61
    .line 62
    const-string v4, "SM-T230"

    .line 63
    .line 64
    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    if-eqz v3, :cond_5

    .line 69
    .line 70
    const-string v3, "OMX.MARVELL.VIDEO.HW.CODA7542DECODER"

    .line 71
    .line 72
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_5

    .line 77
    .line 78
    invoke-virtual {p1, p2}, Ll/sqr0;->d(Ll/sqr0;)Z

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    if-nez v2, :cond_5

    .line 83
    .line 84
    or-int/lit8 v0, v0, 0x2

    .line 85
    .line 86
    :cond_5
    if-nez v0, :cond_7

    .line 87
    .line 88
    iget-object v3, p0, Ll/hwy0;->a:Ljava/lang/String;

    .line 89
    .line 90
    new-instance v2, Ll/zwx0;

    .line 91
    .line 92
    invoke-virtual {p1, p2}, Ll/sqr0;->d(Ll/sqr0;)Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    if-eq v1, p0, :cond_6

    .line 97
    .line 98
    const/4 p0, 0x2

    .line 99
    :goto_1
    move v6, p0

    .line 100
    goto :goto_2

    .line 101
    :cond_6
    const/4 p0, 0x3

    .line 102
    goto :goto_1

    .line 103
    :goto_2
    const/4 v7, 0x0

    .line 104
    move-object v4, p1

    .line 105
    move-object v5, p2

    .line 106
    invoke-direct/range {v2 .. v7}, Ll/zwx0;-><init>(Ljava/lang/String;Ll/sqr0;Ll/sqr0;II)V

    .line 107
    .line 108
    .line 109
    return-object v2

    .line 110
    :cond_7
    move-object v5, p1

    .line 111
    move-object v6, p2

    .line 112
    :cond_8
    move v8, v0

    .line 113
    goto/16 :goto_4

    .line 114
    .line 115
    :cond_9
    move-object v5, p1

    .line 116
    move-object v6, p2

    .line 117
    iget p1, v5, Ll/sqr0;->y:I

    .line 118
    .line 119
    iget p2, v6, Ll/sqr0;->y:I

    .line 120
    .line 121
    if-eq p1, p2, :cond_a

    .line 122
    .line 123
    or-int/lit16 v0, v0, 0x1000

    .line 124
    .line 125
    :cond_a
    iget p1, v5, Ll/sqr0;->z:I

    .line 126
    .line 127
    iget p2, v6, Ll/sqr0;->z:I

    .line 128
    .line 129
    if-eq p1, p2, :cond_b

    .line 130
    .line 131
    or-int/lit16 v0, v0, 0x2000

    .line 132
    .line 133
    :cond_b
    iget p1, v5, Ll/sqr0;->A:I

    .line 134
    .line 135
    iget p2, v6, Ll/sqr0;->A:I

    .line 136
    .line 137
    if-eq p1, p2, :cond_c

    .line 138
    .line 139
    or-int/lit16 v0, v0, 0x4000

    .line 140
    .line 141
    :cond_c
    if-nez v0, :cond_e

    .line 142
    .line 143
    iget-object p1, p0, Ll/hwy0;->b:Ljava/lang/String;

    .line 144
    .line 145
    const-string p2, "audio/mp4a-latm"

    .line 146
    .line 147
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    if-eqz p1, :cond_e

    .line 152
    .line 153
    invoke-static {v5}, Ll/oxy0;->a(Ll/sqr0;)Landroid/util/Pair;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    invoke-static {v6}, Ll/oxy0;->a(Ll/sqr0;)Landroid/util/Pair;

    .line 158
    .line 159
    .line 160
    move-result-object p2

    .line 161
    if-eqz p1, :cond_e

    .line 162
    .line 163
    if-eqz p2, :cond_e

    .line 164
    .line 165
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 166
    .line 167
    check-cast p1, Ljava/lang/Integer;

    .line 168
    .line 169
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    iget-object p2, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 174
    .line 175
    check-cast p2, Ljava/lang/Integer;

    .line 176
    .line 177
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 178
    .line 179
    .line 180
    move-result p2

    .line 181
    const/16 v1, 0x2a

    .line 182
    .line 183
    if-ne p1, v1, :cond_e

    .line 184
    .line 185
    if-eq p2, v1, :cond_d

    .line 186
    .line 187
    goto :goto_3

    .line 188
    :cond_d
    iget-object v4, p0, Ll/hwy0;->a:Ljava/lang/String;

    .line 189
    .line 190
    new-instance v3, Ll/zwx0;

    .line 191
    .line 192
    const/4 v7, 0x3

    .line 193
    const/4 v8, 0x0

    .line 194
    invoke-direct/range {v3 .. v8}, Ll/zwx0;-><init>(Ljava/lang/String;Ll/sqr0;Ll/sqr0;II)V

    .line 195
    .line 196
    .line 197
    return-object v3

    .line 198
    :cond_e
    :goto_3
    invoke-virtual {v5, v6}, Ll/sqr0;->d(Ll/sqr0;)Z

    .line 199
    .line 200
    .line 201
    move-result p1

    .line 202
    if-nez p1, :cond_f

    .line 203
    .line 204
    or-int/lit8 v0, v0, 0x20

    .line 205
    .line 206
    :cond_f
    iget-object p1, p0, Ll/hwy0;->b:Ljava/lang/String;

    .line 207
    .line 208
    const-string p2, "audio/opus"

    .line 209
    .line 210
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    move-result p1

    .line 214
    if-eqz p1, :cond_10

    .line 215
    .line 216
    or-int/lit8 p1, v0, 0x2

    .line 217
    .line 218
    move v0, p1

    .line 219
    :cond_10
    if-nez v0, :cond_8

    .line 220
    .line 221
    iget-object v4, p0, Ll/hwy0;->a:Ljava/lang/String;

    .line 222
    .line 223
    new-instance v3, Ll/zwx0;

    .line 224
    .line 225
    const/4 v7, 0x1

    .line 226
    const/4 v8, 0x0

    .line 227
    invoke-direct/range {v3 .. v8}, Ll/zwx0;-><init>(Ljava/lang/String;Ll/sqr0;Ll/sqr0;II)V

    .line 228
    .line 229
    .line 230
    return-object v3

    .line 231
    :goto_4
    iget-object v4, p0, Ll/hwy0;->a:Ljava/lang/String;

    .line 232
    .line 233
    new-instance v3, Ll/zwx0;

    .line 234
    .line 235
    const/4 v7, 0x0

    .line 236
    invoke-direct/range {v3 .. v8}, Ll/zwx0;-><init>(Ljava/lang/String;Ll/sqr0;Ll/sqr0;II)V

    .line 237
    .line 238
    .line 239
    return-object v3
.end method

.method public final d(Ll/sqr0;)Z
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/hwy0;->m(Ll/sqr0;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1, v1}, Ll/hwy0;->l(Ll/sqr0;Z)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    return v1
.end method

.method public final e(Ll/sqr0;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzth;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/hwy0;->m(Ll/sqr0;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p0, p1, v0}, Ll/hwy0;->l(Ll/sqr0;Z)Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-nez v2, :cond_1

    .line 15
    .line 16
    return v1

    .line 17
    :cond_1
    iget-boolean v2, p0, Ll/hwy0;->h:Z

    .line 18
    .line 19
    if-eqz v2, :cond_4

    .line 20
    .line 21
    iget v1, p1, Ll/sqr0;->q:I

    .line 22
    .line 23
    if-lez v1, :cond_3

    .line 24
    .line 25
    iget v2, p1, Ll/sqr0;->r:I

    .line 26
    .line 27
    if-gtz v2, :cond_2

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    sget v0, Ll/mpw0;->a:I

    .line 31
    .line 32
    iget p1, p1, Ll/sqr0;->s:F

    .line 33
    .line 34
    float-to-double v3, p1

    .line 35
    invoke-virtual {p0, v1, v2, v3, v4}, Ll/hwy0;->g(IID)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0

    .line 40
    :cond_3
    :goto_0
    return v0

    .line 41
    :cond_4
    sget v2, Ll/mpw0;->a:I

    .line 42
    .line 43
    iget v2, p1, Ll/sqr0;->z:I

    .line 44
    .line 45
    const/4 v3, -0x1

    .line 46
    if-eq v2, v3, :cond_7

    .line 47
    .line 48
    iget-object v4, p0, Ll/hwy0;->d:Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 49
    .line 50
    if-nez v4, :cond_5

    .line 51
    .line 52
    const-string p1, "sampleRate.caps"

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ll/hwy0;->j(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return v1

    .line 58
    :cond_5
    invoke-virtual {v4}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getAudioCapabilities()Landroid/media/MediaCodecInfo$AudioCapabilities;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    if-nez v4, :cond_6

    .line 63
    .line 64
    const-string p1, "sampleRate.aCaps"

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Ll/hwy0;->j(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return v1

    .line 70
    :cond_6
    invoke-virtual {v4, v2}, Landroid/media/MediaCodecInfo$AudioCapabilities;->isSampleRateSupported(I)Z

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    if-nez v4, :cond_7

    .line 75
    .line 76
    new-instance p1, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    const-string v0, "sampleRate.support, "

    .line 79
    .line 80
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p0, p1}, Ll/hwy0;->j(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    return v1

    .line 94
    :cond_7
    iget p1, p1, Ll/sqr0;->y:I

    .line 95
    .line 96
    if-eq p1, v3, :cond_f

    .line 97
    .line 98
    iget-object v2, p0, Ll/hwy0;->d:Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 99
    .line 100
    if-nez v2, :cond_8

    .line 101
    .line 102
    const-string p1, "channelCount.caps"

    .line 103
    .line 104
    invoke-virtual {p0, p1}, Ll/hwy0;->j(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    goto/16 :goto_3

    .line 108
    .line 109
    :cond_8
    invoke-virtual {v2}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getAudioCapabilities()Landroid/media/MediaCodecInfo$AudioCapabilities;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    if-nez v2, :cond_9

    .line 114
    .line 115
    const-string p1, "channelCount.aCaps"

    .line 116
    .line 117
    invoke-virtual {p0, p1}, Ll/hwy0;->j(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    goto/16 :goto_3

    .line 121
    .line 122
    :cond_9
    iget-object v3, p0, Ll/hwy0;->a:Ljava/lang/String;

    .line 123
    .line 124
    iget-object v4, p0, Ll/hwy0;->b:Ljava/lang/String;

    .line 125
    .line 126
    invoke-virtual {v2}, Landroid/media/MediaCodecInfo$AudioCapabilities;->getMaxInputChannelCount()I

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    if-gt v2, v0, :cond_e

    .line 131
    .line 132
    sget v5, Ll/mpw0;->a:I

    .line 133
    .line 134
    const/16 v6, 0x1a

    .line 135
    .line 136
    if-lt v5, v6, :cond_a

    .line 137
    .line 138
    if-lez v2, :cond_a

    .line 139
    .line 140
    goto/16 :goto_2

    .line 141
    .line 142
    :cond_a
    const-string v5, "audio/mpeg"

    .line 143
    .line 144
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result v5

    .line 148
    if-nez v5, :cond_e

    .line 149
    .line 150
    const-string v5, "audio/3gpp"

    .line 151
    .line 152
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result v5

    .line 156
    if-nez v5, :cond_e

    .line 157
    .line 158
    const-string v5, "audio/amr-wb"

    .line 159
    .line 160
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result v5

    .line 164
    if-nez v5, :cond_e

    .line 165
    .line 166
    const-string v5, "audio/mp4a-latm"

    .line 167
    .line 168
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    move-result v5

    .line 172
    if-nez v5, :cond_e

    .line 173
    .line 174
    const-string v5, "audio/vorbis"

    .line 175
    .line 176
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    move-result v5

    .line 180
    if-nez v5, :cond_e

    .line 181
    .line 182
    const-string v5, "audio/opus"

    .line 183
    .line 184
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    move-result v5

    .line 188
    if-nez v5, :cond_e

    .line 189
    .line 190
    const-string v5, "audio/raw"

    .line 191
    .line 192
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    move-result v5

    .line 196
    if-nez v5, :cond_e

    .line 197
    .line 198
    const-string v5, "audio/flac"

    .line 199
    .line 200
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result v5

    .line 204
    if-nez v5, :cond_e

    .line 205
    .line 206
    const-string v5, "audio/g711-alaw"

    .line 207
    .line 208
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 209
    .line 210
    .line 211
    move-result v5

    .line 212
    if-nez v5, :cond_e

    .line 213
    .line 214
    const-string v5, "audio/g711-mlaw"

    .line 215
    .line 216
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    move-result v5

    .line 220
    if-nez v5, :cond_e

    .line 221
    .line 222
    const-string v5, "audio/gsm"

    .line 223
    .line 224
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 225
    .line 226
    .line 227
    move-result v5

    .line 228
    if-eqz v5, :cond_b

    .line 229
    .line 230
    goto :goto_2

    .line 231
    :cond_b
    const-string v5, "audio/ac3"

    .line 232
    .line 233
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    move-result v5

    .line 237
    if-eqz v5, :cond_c

    .line 238
    .line 239
    const/4 v4, 0x6

    .line 240
    goto :goto_1

    .line 241
    :cond_c
    const-string v5, "audio/eac3"

    .line 242
    .line 243
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 244
    .line 245
    .line 246
    move-result v4

    .line 247
    if-eqz v4, :cond_d

    .line 248
    .line 249
    const/16 v4, 0x10

    .line 250
    .line 251
    goto :goto_1

    .line 252
    :cond_d
    const/16 v4, 0x1e

    .line 253
    .line 254
    :goto_1
    new-instance v5, Ljava/lang/StringBuilder;

    .line 255
    .line 256
    const-string v6, "AssumedMaxChannelAdjustment: "

    .line 257
    .line 258
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    const-string v3, ", ["

    .line 265
    .line 266
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 267
    .line 268
    .line 269
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    const-string v2, " to "

    .line 273
    .line 274
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 278
    .line 279
    .line 280
    const-string v2, "]"

    .line 281
    .line 282
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v2

    .line 289
    const-string v3, "MediaCodecInfo"

    .line 290
    .line 291
    invoke-static {v3, v2}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 292
    .line 293
    .line 294
    move v2, v4

    .line 295
    :cond_e
    :goto_2
    if-ge v2, p1, :cond_f

    .line 296
    .line 297
    new-instance v0, Ljava/lang/StringBuilder;

    .line 298
    .line 299
    const-string v2, "channelCount.support, "

    .line 300
    .line 301
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 302
    .line 303
    .line 304
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 305
    .line 306
    .line 307
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object p1

    .line 311
    invoke-virtual {p0, p1}, Ll/hwy0;->j(Ljava/lang/String;)V

    .line 312
    .line 313
    .line 314
    :goto_3
    return v1

    .line 315
    :cond_f
    return v0
.end method

.method public final f(Ll/sqr0;)Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/hwy0;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Ll/hwy0;->e:Z

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    invoke-static {p1}, Ll/oxy0;->a(Ll/sqr0;)Landroid/util/Pair;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    iget-object p0, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    const/16 p1, 0x2a

    .line 23
    .line 24
    if-ne p0, p1, :cond_1

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_1
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public final g(IID)Z
    .locals 11
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x15
    .end annotation

    .line 1
    iget-object v0, p0, Ll/hwy0;->d:Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const-string p1, "sizeAndRate.caps"

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/hwy0;->j(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return v1

    .line 12
    :cond_0
    invoke-virtual {v0}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getVideoCapabilities()Landroid/media/MediaCodecInfo$VideoCapabilities;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    if-nez v2, :cond_1

    .line 17
    .line 18
    const-string p1, "sizeAndRate.vCaps"

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/hwy0;->j(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    sget v0, Ll/mpw0;->a:I

    .line 25
    .line 26
    const/16 v3, 0x1d

    .line 27
    .line 28
    const/4 v8, 0x1

    .line 29
    const-string v9, "@"

    .line 30
    .line 31
    const-string v10, "x"

    .line 32
    .line 33
    if-lt v0, v3, :cond_4

    .line 34
    .line 35
    iget-object v3, p0, Ll/hwy0;->b:Ljava/lang/String;

    .line 36
    .line 37
    move v4, p1

    .line 38
    move v5, p2

    .line 39
    move-wide v6, p3

    .line 40
    invoke-static/range {v2 .. v7}, Ll/fwy0;->a(Landroid/media/MediaCodecInfo$VideoCapabilities;Ljava/lang/String;IID)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    const/4 p2, 0x2

    .line 45
    if-ne p1, p2, :cond_2

    .line 46
    .line 47
    goto/16 :goto_2

    .line 48
    .line 49
    :cond_2
    if-eq p1, v8, :cond_3

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    const-string p2, "sizeAndRate.cover, "

    .line 55
    .line 56
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p0, p1}, Ll/hwy0;->j(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    return v1

    .line 82
    :cond_4
    move v4, p1

    .line 83
    move v5, p2

    .line 84
    move-wide v6, p3

    .line 85
    :goto_0
    invoke-static {v2, v4, v5, v6, v7}, Ll/hwy0;->k(Landroid/media/MediaCodecInfo$VideoCapabilities;IID)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-nez p1, :cond_8

    .line 90
    .line 91
    if-ge v4, v5, :cond_7

    .line 92
    .line 93
    iget-object p1, p0, Ll/hwy0;->a:Ljava/lang/String;

    .line 94
    .line 95
    const-string p2, "OMX.MTK.VIDEO.DECODER.HEVC"

    .line 96
    .line 97
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-eqz p1, :cond_5

    .line 102
    .line 103
    const-string p1, "mcv5a"

    .line 104
    .line 105
    sget-object p2, Ll/mpw0;->b:Ljava/lang/String;

    .line 106
    .line 107
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    if-nez p1, :cond_7

    .line 112
    .line 113
    :cond_5
    invoke-static {v2, v5, v4, v6, v7}, Ll/hwy0;->k(Landroid/media/MediaCodecInfo$VideoCapabilities;IID)Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    if-nez p1, :cond_6

    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_6
    new-instance p1, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    const-string p2, "sizeAndRate.rotated, "

    .line 123
    .line 124
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {p1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {p1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {p1, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    iget-object p2, p0, Ll/hwy0;->a:Ljava/lang/String;

    .line 147
    .line 148
    iget-object p0, p0, Ll/hwy0;->b:Ljava/lang/String;

    .line 149
    .line 150
    sget-object p3, Ll/mpw0;->e:Ljava/lang/String;

    .line 151
    .line 152
    new-instance p4, Ljava/lang/StringBuilder;

    .line 153
    .line 154
    const-string v0, "AssumedSupport ["

    .line 155
    .line 156
    invoke-direct {p4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    const-string p1, "] ["

    .line 163
    .line 164
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    const-string p2, ", "

    .line 171
    .line 172
    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {p4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    const-string p0, "]"

    .line 185
    .line 186
    invoke-virtual {p4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    const-string p1, "MediaCodecInfo"

    .line 194
    .line 195
    invoke-static {p1, p0}, Ll/y4w0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    goto :goto_2

    .line 199
    :cond_7
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 200
    .line 201
    const-string p2, "sizeAndRate.support, "

    .line 202
    .line 203
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {p1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {p1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    invoke-virtual {p1, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    invoke-virtual {p0, p1}, Ll/hwy0;->j(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    return v1

    .line 229
    :cond_8
    :goto_2
    return v8
.end method

.method public final h()[Landroid/media/MediaCodecInfo$CodecProfileLevel;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hwy0;->d:Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Landroid/media/MediaCodecInfo$CodecCapabilities;->profileLevels:[Landroid/media/MediaCodecInfo$CodecProfileLevel;

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-object p0

    .line 11
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 12
    new-array p0, p0, [Landroid/media/MediaCodecInfo$CodecProfileLevel;

    .line 13
    .line 14
    return-object p0
.end method

.method public final j(Ljava/lang/String;)V
    .locals 3

    .line 1
    sget-object v0, Ll/mpw0;->e:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "NoSupport ["

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p1, "] ["

    .line 14
    .line 15
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v2, p0, Ll/hwy0;->a:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v2, ", "

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/hwy0;->b:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string p0, "]"

    .line 40
    .line 41
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const-string p1, "MediaCodecInfo"

    .line 49
    .line 50
    invoke-static {p1, p0}, Ll/y4w0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final l(Ll/sqr0;Z)Z
    .locals 11

    .line 1
    invoke-static {p1}, Ll/oxy0;->a(Ll/sqr0;)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    goto/16 :goto_5

    .line 9
    .line 10
    :cond_0
    iget-object v2, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v2, Ljava/lang/Integer;

    .line 13
    .line 14
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v0, Ljava/lang/Integer;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget-object v3, p1, Ll/sqr0;->l:Ljava/lang/String;

    .line 27
    .line 28
    const-string v4, "video/dolby-vision"

    .line 29
    .line 30
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    const-string v4, "video/hevc"

    .line 35
    .line 36
    const/16 v5, 0x8

    .line 37
    .line 38
    const/4 v6, 0x2

    .line 39
    const/4 v7, 0x0

    .line 40
    if-eqz v3, :cond_2

    .line 41
    .line 42
    iget-object v3, p0, Ll/hwy0;->b:Ljava/lang/String;

    .line 43
    .line 44
    const-string v8, "video/avc"

    .line 45
    .line 46
    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    if-eqz v3, :cond_1

    .line 51
    .line 52
    move v2, v5

    .line 53
    :goto_0
    move v0, v7

    .line 54
    goto :goto_1

    .line 55
    :cond_1
    iget-object v3, p0, Ll/hwy0;->b:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    if-eqz v3, :cond_2

    .line 62
    .line 63
    move v2, v6

    .line 64
    goto :goto_0

    .line 65
    :cond_2
    :goto_1
    iget-boolean v3, p0, Ll/hwy0;->h:Z

    .line 66
    .line 67
    if-nez v3, :cond_3

    .line 68
    .line 69
    const/16 v3, 0x2a

    .line 70
    .line 71
    if-ne v2, v3, :cond_11

    .line 72
    .line 73
    move v2, v3

    .line 74
    :cond_3
    invoke-virtual {p0}, Ll/hwy0;->h()[Landroid/media/MediaCodecInfo$CodecProfileLevel;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    sget v8, Ll/mpw0;->a:I

    .line 79
    .line 80
    const/16 v9, 0x17

    .line 81
    .line 82
    if-gt v8, v9, :cond_f

    .line 83
    .line 84
    iget-object v8, p0, Ll/hwy0;->b:Ljava/lang/String;

    .line 85
    .line 86
    const-string v9, "video/x-vnd.on2.vp9"

    .line 87
    .line 88
    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v8

    .line 92
    if-eqz v8, :cond_f

    .line 93
    .line 94
    array-length v8, v3

    .line 95
    if-nez v8, :cond_f

    .line 96
    .line 97
    iget-object v3, p0, Ll/hwy0;->d:Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 98
    .line 99
    if-eqz v3, :cond_4

    .line 100
    .line 101
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getVideoCapabilities()Landroid/media/MediaCodecInfo$VideoCapabilities;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    if-eqz v3, :cond_4

    .line 106
    .line 107
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo$VideoCapabilities;->getBitrateRange()Landroid/util/Range;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-virtual {v3}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    check-cast v3, Ljava/lang/Integer;

    .line 116
    .line 117
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 118
    .line 119
    .line 120
    move-result v3

    .line 121
    goto :goto_2

    .line 122
    :cond_4
    move v3, v7

    .line 123
    :goto_2
    const v8, 0xaba9500

    .line 124
    .line 125
    .line 126
    if-lt v3, v8, :cond_5

    .line 127
    .line 128
    const/16 v5, 0x400

    .line 129
    .line 130
    goto :goto_3

    .line 131
    :cond_5
    const v8, 0x7270e00

    .line 132
    .line 133
    .line 134
    if-lt v3, v8, :cond_6

    .line 135
    .line 136
    const/16 v5, 0x200

    .line 137
    .line 138
    goto :goto_3

    .line 139
    :cond_6
    const v8, 0x3938700

    .line 140
    .line 141
    .line 142
    if-lt v3, v8, :cond_7

    .line 143
    .line 144
    const/16 v5, 0x100

    .line 145
    .line 146
    goto :goto_3

    .line 147
    :cond_7
    const v8, 0x1c9c380

    .line 148
    .line 149
    .line 150
    if-lt v3, v8, :cond_8

    .line 151
    .line 152
    const/16 v5, 0x80

    .line 153
    .line 154
    goto :goto_3

    .line 155
    :cond_8
    const v8, 0x112a880

    .line 156
    .line 157
    .line 158
    if-lt v3, v8, :cond_9

    .line 159
    .line 160
    const/16 v5, 0x40

    .line 161
    .line 162
    goto :goto_3

    .line 163
    :cond_9
    const v8, 0xb71b00

    .line 164
    .line 165
    .line 166
    if-lt v3, v8, :cond_a

    .line 167
    .line 168
    const/16 v5, 0x20

    .line 169
    .line 170
    goto :goto_3

    .line 171
    :cond_a
    const v8, 0x6ddd00

    .line 172
    .line 173
    .line 174
    if-lt v3, v8, :cond_b

    .line 175
    .line 176
    const/16 v5, 0x10

    .line 177
    .line 178
    goto :goto_3

    .line 179
    :cond_b
    const v8, 0x36ee80

    .line 180
    .line 181
    .line 182
    if-lt v3, v8, :cond_c

    .line 183
    .line 184
    goto :goto_3

    .line 185
    :cond_c
    const v5, 0x1b7740

    .line 186
    .line 187
    .line 188
    if-lt v3, v5, :cond_d

    .line 189
    .line 190
    const/4 v5, 0x4

    .line 191
    goto :goto_3

    .line 192
    :cond_d
    const v5, 0xc3500

    .line 193
    .line 194
    .line 195
    if-lt v3, v5, :cond_e

    .line 196
    .line 197
    move v5, v6

    .line 198
    goto :goto_3

    .line 199
    :cond_e
    move v5, v1

    .line 200
    :goto_3
    new-instance v3, Landroid/media/MediaCodecInfo$CodecProfileLevel;

    .line 201
    .line 202
    invoke-direct {v3}, Landroid/media/MediaCodecInfo$CodecProfileLevel;-><init>()V

    .line 203
    .line 204
    .line 205
    iput v1, v3, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    .line 206
    .line 207
    iput v5, v3, Landroid/media/MediaCodecInfo$CodecProfileLevel;->level:I

    .line 208
    .line 209
    new-array v5, v1, [Landroid/media/MediaCodecInfo$CodecProfileLevel;

    .line 210
    .line 211
    aput-object v3, v5, v7

    .line 212
    .line 213
    move-object v3, v5

    .line 214
    :cond_f
    array-length v5, v3

    .line 215
    move v8, v7

    .line 216
    :goto_4
    if-ge v8, v5, :cond_13

    .line 217
    .line 218
    aget-object v9, v3, v8

    .line 219
    .line 220
    iget v10, v9, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    .line 221
    .line 222
    if-ne v10, v2, :cond_12

    .line 223
    .line 224
    iget v9, v9, Landroid/media/MediaCodecInfo$CodecProfileLevel;->level:I

    .line 225
    .line 226
    if-ge v9, v0, :cond_10

    .line 227
    .line 228
    if-nez p2, :cond_12

    .line 229
    .line 230
    :cond_10
    iget-object v9, p0, Ll/hwy0;->b:Ljava/lang/String;

    .line 231
    .line 232
    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 233
    .line 234
    .line 235
    move-result v9

    .line 236
    if-eqz v9, :cond_11

    .line 237
    .line 238
    if-ne v2, v6, :cond_11

    .line 239
    .line 240
    sget-object v9, Ll/mpw0;->b:Ljava/lang/String;

    .line 241
    .line 242
    const-string v10, "sailfish"

    .line 243
    .line 244
    invoke-virtual {v10, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 245
    .line 246
    .line 247
    move-result v10

    .line 248
    if-nez v10, :cond_12

    .line 249
    .line 250
    const-string v10, "marlin"

    .line 251
    .line 252
    invoke-virtual {v10, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 253
    .line 254
    .line 255
    move-result v9

    .line 256
    if-eqz v9, :cond_11

    .line 257
    .line 258
    goto :goto_6

    .line 259
    :cond_11
    :goto_5
    return v1

    .line 260
    :cond_12
    :goto_6
    add-int/lit8 v8, v8, 0x1

    .line 261
    .line 262
    goto :goto_4

    .line 263
    :cond_13
    iget-object p1, p1, Ll/sqr0;->i:Ljava/lang/String;

    .line 264
    .line 265
    iget-object p2, p0, Ll/hwy0;->c:Ljava/lang/String;

    .line 266
    .line 267
    new-instance v0, Ljava/lang/StringBuilder;

    .line 268
    .line 269
    const-string v1, "codec.profileLevel, "

    .line 270
    .line 271
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    const-string p1, ", "

    .line 278
    .line 279
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object p1

    .line 289
    invoke-virtual {p0, p1}, Ll/hwy0;->j(Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    return v7
.end method

.method public final m(Ll/sqr0;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hwy0;->b:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p1, Ll/sqr0;->l:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Ll/hwy0;->b:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p1}, Ll/oxy0;->c(Ll/sqr0;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 27
    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hwy0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
