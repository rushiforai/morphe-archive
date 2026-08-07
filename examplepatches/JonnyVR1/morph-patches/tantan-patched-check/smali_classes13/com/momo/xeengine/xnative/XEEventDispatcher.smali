.class public final Lcom/momo/xeengine/xnative/XEEventDispatcher;
.super Lcom/momo/xeengine/xnative/XETouchDispatcher;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/event/IXEventDispatcher;


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xeengine/xnative/XEEventDispatcher$EventExecutor;
    }
.end annotation


# instance fields
.field private hasDeliverFaceLost:Z

.field private isHandSetNullInfo:Z

.field private pointer:J


# direct methods
.method public constructor <init>(J)V
    .locals 2

    .line 1
    new-instance v0, Lcom/momo/xeengine/xnative/XEEventDispatcher$EventExecutor;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/momo/xeengine/xnative/XEEventDispatcher$EventExecutor;-><init>(Lcom/momo/xeengine/xnative/XEEventDispatcher$1;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, v0, p1, p2}, Lcom/momo/xeengine/xnative/XETouchDispatcher;-><init>(Ljava/util/concurrent/Executor;J)V

    .line 8
    .line 9
    .line 10
    iput-wide p1, p0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->pointer:J

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic d(Lcom/momo/xeengine/xnative/XEEventDispatcher;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->pointer:J

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    invoke-static {v0, v1, p0}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeOnFaceEntityDetected(J[J)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic e(Lcom/momo/xeengine/xnative/XEEventDispatcher;[J)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->pointer:J

    .line 2
    .line 3
    invoke-static {v0, v1, p1}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeOnFaceEntityDetected(J[J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic f(Lcom/momo/xeengine/xnative/XEEventDispatcher;)V
    .locals 8

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->pointer:J

    .line 2
    .line 3
    const/4 v6, 0x0

    .line 4
    const/4 v7, 0x0

    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x0

    .line 7
    const/4 v4, 0x0

    .line 8
    const/4 v5, 0x0

    .line 9
    invoke-static/range {v0 .. v7}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeSetSegment(J[BI[FIIZ)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic g(Lcom/momo/xeengine/xnative/XEEventDispatcher;Ljava/util/List;)V
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-wide v1, v0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->pointer:J

    .line 4
    .line 5
    invoke-static {v1, v2}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeClearMutableData(J)V

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    :goto_0
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    if-ge v2, v3, :cond_5

    .line 14
    .line 15
    move-object/from16 v3, p1

    .line 16
    .line 17
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    check-cast v4, Lcom/momo/xeengine/cv/bean/XEMutableInfo;

    .line 22
    .line 23
    if-nez v4, :cond_0

    .line 24
    .line 25
    goto/16 :goto_2

    .line 26
    .line 27
    :cond_0
    iget-wide v5, v0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->pointer:J

    .line 28
    .line 29
    invoke-static {v5, v6, v2}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeGetMutablePointer(JI)J

    .line 30
    .line 31
    .line 32
    move-result-wide v9

    .line 33
    const-wide/16 v5, 0x0

    .line 34
    .line 35
    cmp-long v5, v9, v5

    .line 36
    .line 37
    if-nez v5, :cond_1

    .line 38
    .line 39
    goto/16 :goto_2

    .line 40
    .line 41
    :cond_1
    invoke-virtual {v4}, Lcom/momo/xeengine/cv/bean/XEMutableInfo;->getMaskInfo1()Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    if-eqz v5, :cond_2

    .line 46
    .line 47
    invoke-virtual {v5}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getLength()I

    .line 48
    .line 49
    .line 50
    move-result v6

    .line 51
    if-lez v6, :cond_2

    .line 52
    .line 53
    invoke-virtual {v5}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getWidth()I

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    if-lez v6, :cond_2

    .line 58
    .line 59
    invoke-virtual {v5}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getHeight()I

    .line 60
    .line 61
    .line 62
    move-result v6

    .line 63
    if-lez v6, :cond_2

    .line 64
    .line 65
    iget-wide v7, v0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->pointer:J

    .line 66
    .line 67
    invoke-virtual {v5}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getDatas()[B

    .line 68
    .line 69
    .line 70
    move-result-object v12

    .line 71
    invoke-virtual {v5}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getLength()I

    .line 72
    .line 73
    .line 74
    move-result v13

    .line 75
    invoke-virtual {v5}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getWarpMat()[F

    .line 76
    .line 77
    .line 78
    move-result-object v14

    .line 79
    invoke-virtual {v5}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getWidth()I

    .line 80
    .line 81
    .line 82
    move-result v15

    .line 83
    invoke-virtual {v5}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getHeight()I

    .line 84
    .line 85
    .line 86
    move-result v16

    .line 87
    invoke-virtual {v5}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->isFlipShowX()Z

    .line 88
    .line 89
    .line 90
    move-result v17

    .line 91
    const/4 v11, 0x0

    .line 92
    invoke-static/range {v7 .. v17}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeSetMutableMaskInfo(JJI[BI[FIIZ)V

    .line 93
    .line 94
    .line 95
    :cond_2
    invoke-virtual {v4}, Lcom/momo/xeengine/cv/bean/XEMutableInfo;->getMaskInfo2()Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 96
    .line 97
    .line 98
    move-result-object v5

    .line 99
    if-eqz v5, :cond_3

    .line 100
    .line 101
    invoke-virtual {v5}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getLength()I

    .line 102
    .line 103
    .line 104
    move-result v6

    .line 105
    if-lez v6, :cond_3

    .line 106
    .line 107
    invoke-virtual {v5}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getWidth()I

    .line 108
    .line 109
    .line 110
    move-result v6

    .line 111
    if-lez v6, :cond_3

    .line 112
    .line 113
    invoke-virtual {v5}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getHeight()I

    .line 114
    .line 115
    .line 116
    move-result v6

    .line 117
    if-lez v6, :cond_3

    .line 118
    .line 119
    iget-wide v7, v0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->pointer:J

    .line 120
    .line 121
    invoke-virtual {v5}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getDatas()[B

    .line 122
    .line 123
    .line 124
    move-result-object v12

    .line 125
    invoke-virtual {v5}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getLength()I

    .line 126
    .line 127
    .line 128
    move-result v13

    .line 129
    invoke-virtual {v5}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getWarpMat()[F

    .line 130
    .line 131
    .line 132
    move-result-object v14

    .line 133
    invoke-virtual {v5}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getWidth()I

    .line 134
    .line 135
    .line 136
    move-result v15

    .line 137
    invoke-virtual {v5}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getHeight()I

    .line 138
    .line 139
    .line 140
    move-result v16

    .line 141
    invoke-virtual {v5}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->isFlipShowX()Z

    .line 142
    .line 143
    .line 144
    move-result v17

    .line 145
    const/4 v11, 0x1

    .line 146
    invoke-static/range {v7 .. v17}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeSetMutableMaskInfo(JJI[BI[FIIZ)V

    .line 147
    .line 148
    .line 149
    :cond_3
    invoke-virtual {v4}, Lcom/momo/xeengine/cv/bean/XEMutableInfo;->getMutableDatas()Ljava/util/List;

    .line 150
    .line 151
    .line 152
    move-result-object v5

    .line 153
    if-eqz v5, :cond_4

    .line 154
    .line 155
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 156
    .line 157
    .line 158
    move-result v6

    .line 159
    if-lez v6, :cond_4

    .line 160
    .line 161
    const/4 v11, 0x0

    .line 162
    :goto_1
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 163
    .line 164
    .line 165
    move-result v6

    .line 166
    if-ge v11, v6, :cond_4

    .line 167
    .line 168
    invoke-interface {v5, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v6

    .line 172
    check-cast v6, Lcom/momo/xeengine/cv/bean/XEMutableData;

    .line 173
    .line 174
    iget-wide v7, v0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->pointer:J

    .line 175
    .line 176
    invoke-virtual {v6}, Lcom/momo/xeengine/cv/bean/XEMutableData;->getInts()[I

    .line 177
    .line 178
    .line 179
    move-result-object v12

    .line 180
    invoke-virtual {v6}, Lcom/momo/xeengine/cv/bean/XEMutableData;->getFloats()[F

    .line 181
    .line 182
    .line 183
    move-result-object v13

    .line 184
    iget-object v14, v6, Lcom/momo/xeengine/cv/bean/XEMutableData;->str1:Ljava/lang/String;

    .line 185
    .line 186
    iget-object v15, v6, Lcom/momo/xeengine/cv/bean/XEMutableData;->str2:Ljava/lang/String;

    .line 187
    .line 188
    iget-object v1, v6, Lcom/momo/xeengine/cv/bean/XEMutableData;->vec1:[F

    .line 189
    .line 190
    move-object/from16 v16, v1

    .line 191
    .line 192
    iget-object v1, v6, Lcom/momo/xeengine/cv/bean/XEMutableData;->vec2:[F

    .line 193
    .line 194
    move-object/from16 v17, v1

    .line 195
    .line 196
    iget-object v1, v6, Lcom/momo/xeengine/cv/bean/XEMutableData;->mat1:[F

    .line 197
    .line 198
    move-object/from16 v18, v1

    .line 199
    .line 200
    iget-object v1, v6, Lcom/momo/xeengine/cv/bean/XEMutableData;->mat2:[F

    .line 201
    .line 202
    move-object/from16 v19, v1

    .line 203
    .line 204
    iget-object v1, v6, Lcom/momo/xeengine/cv/bean/XEMutableData;->floatArray1:[F

    .line 205
    .line 206
    move-object/from16 v20, v1

    .line 207
    .line 208
    iget-object v1, v6, Lcom/momo/xeengine/cv/bean/XEMutableData;->floatArray2:[F

    .line 209
    .line 210
    move-object/from16 v21, v1

    .line 211
    .line 212
    iget-object v1, v6, Lcom/momo/xeengine/cv/bean/XEMutableData;->floatArray3:[F

    .line 213
    .line 214
    iget-object v6, v6, Lcom/momo/xeengine/cv/bean/XEMutableData;->floatArray4:[F

    .line 215
    .line 216
    move-object/from16 v22, v1

    .line 217
    .line 218
    move-object/from16 v23, v6

    .line 219
    .line 220
    invoke-static/range {v7 .. v23}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeSetMutableData(JJI[I[FLjava/lang/String;Ljava/lang/String;[F[F[F[F[F[F[F[F)V

    .line 221
    .line 222
    .line 223
    add-int/lit8 v11, v11, 0x1

    .line 224
    .line 225
    goto :goto_1

    .line 226
    :cond_4
    iget-wide v5, v0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->pointer:J

    .line 227
    .line 228
    invoke-virtual {v4}, Lcom/momo/xeengine/cv/bean/XEMutableInfo;->getBusiness()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v1

    .line 232
    invoke-static {v5, v6, v9, v10, v1}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeUpdateMutableData(JJLjava/lang/String;)V

    .line 233
    .line 234
    .line 235
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 236
    .line 237
    goto/16 :goto_0

    .line 238
    .line 239
    :cond_5
    iget-wide v0, v0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->pointer:J

    .line 240
    .line 241
    invoke-static {v0, v1}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeUpdateMutableDatas(J)V

    .line 242
    .line 243
    .line 244
    return-void
.end method

.method public static synthetic h(Lcom/momo/xeengine/xnative/XEEventDispatcher;)V
    .locals 3

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->pointer:J

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    invoke-static {v0, v1, v2}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeSetHands(JLjava/util/List;)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->isHandSetNullInfo:Z

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic i(Lcom/momo/xeengine/xnative/XEEventDispatcher;[J)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->pointer:J

    .line 2
    .line 3
    invoke-static {v0, v1, p1}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeSetObjects(J[J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private isRunning()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->pointer:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public static synthetic j(Lcom/momo/xeengine/xnative/XEEventDispatcher;[J)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->pointer:J

    .line 2
    .line 3
    invoke-static {v0, v1, p1}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeSetBodys(J[J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic k(Lcom/momo/xeengine/xnative/XEEventDispatcher;Lcom/momo/xeengine/cv/bean/CVSegmentInfo;)V
    .locals 8

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->pointer:J

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getDatas()[B

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    invoke-virtual {p1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getLength()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    invoke-virtual {p1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getWarpMat()[F

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    invoke-virtual {p1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result v5

    .line 19
    invoke-virtual {p1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result v6

    .line 23
    invoke-virtual {p1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->isFlipShowX()Z

    .line 24
    .line 25
    .line 26
    move-result v7

    .line 27
    invoke-static/range {v0 .. v7}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeSetSegment(J[BI[FIIZ)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic l(Lcom/momo/xeengine/xnative/XEEventDispatcher;Ljava/util/List;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->isHandSetNullInfo:Z

    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->pointer:J

    .line 5
    .line 6
    invoke-static {v0, v1, p1}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeSetHands(JLjava/util/List;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic m(Lcom/momo/xeengine/xnative/XEEventDispatcher;Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;)V
    .locals 8

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->pointer:J

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getDatas()[B

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    invoke-virtual {p1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getLength()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    invoke-virtual {p1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getWarpMat()[F

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    invoke-virtual {p1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result v5

    .line 19
    invoke-virtual {p1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result v6

    .line 23
    invoke-virtual {p1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->isFlipShowX()Z

    .line 24
    .line 25
    .line 26
    move-result v7

    .line 27
    invoke-static/range {v0 .. v7}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeSetCartoonFaceData(J[BI[FIIZ)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic n(Lcom/momo/xeengine/xnative/XEEventDispatcher;)V
    .locals 8

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->pointer:J

    .line 2
    .line 3
    const/4 v6, 0x0

    .line 4
    const/4 v7, 0x0

    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x0

    .line 7
    const/4 v4, 0x0

    .line 8
    const/4 v5, 0x0

    .line 9
    invoke-static/range {v0 .. v7}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeSetCartoonFaceData(J[BI[FIIZ)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private static native nativeBodySrcAndDstWarpPoints(JJ[F[F)J
.end method

.method private static native nativeClearMutableData(J)V
.end method

.method private static native nativeFace106LandMarks(J[F)J
.end method

.method private static native nativeFace222LandMarks(J[F)J
.end method

.method private static native nativeFace96LandMarks(J[F)J
.end method

.method private static native nativeFaceBounds(JFFFF)J
.end method

.method private static native nativeFaceEexpression(JI)J
.end method

.method private static native nativeFaceMask(JJ[BI[FIIZ)J
.end method

.method private static native nativeFaceModelViewMatrix(J[F)J
.end method

.method private static native nativeFacerigStates(J[F)J
.end method

.method private static native nativeGetFace(JI)J
.end method

.method private static native nativeGetMutablePointer(JI)J
.end method

.method private static native nativeOnFaceEntityDetected(J[J)V
.end method

.method private static native nativeSetBody([F[F[F)J
.end method

.method private static native nativeSetBodys(J[J)V
.end method

.method private static native nativeSetCartoonFaceData(J[BI[FIIZ)V
.end method

.method private static native nativeSetFaceEuler(JFFF)J
.end method

.method private static native nativeSetFaceLiquefyInfos(JJIFFFFFF[F)V
.end method

.method private static native nativeSetFaceTrackId(JI)J
.end method

.method private static native nativeSetHands(JLjava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/XEHandInfo;",
            ">;)V"
        }
    .end annotation
.end method

.method private static native nativeSetMutableData(JJI[I[FLjava/lang/String;Ljava/lang/String;[F[F[F[F[F[F[F[F)V
.end method

.method private static native nativeSetMutableMaskInfo(JJI[BI[FIIZ)V
.end method

.method private static native nativeSetObject(Ljava/lang/String;[FF)J
.end method

.method private static native nativeSetObjects(J[J)V
.end method

.method private static native nativeSetSegment(J[BI[FIIZ)V
.end method

.method private static native nativeSkinThreshold(J[F)J
.end method

.method private static native nativeSrcAndDstWarpPoints(JJ[F[F)J
.end method

.method private static native nativeUpdateMutableData(JJLjava/lang/String;)V
.end method

.method private static native nativeUpdateMutableDatas(J)V
.end method

.method public static synthetic o(Lcom/momo/xeengine/xnative/XEEventDispatcher;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->pointer:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeClearMutableData(J)V

    .line 4
    .line 5
    .line 6
    iget-wide v0, p0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->pointer:J

    .line 7
    .line 8
    invoke-static {v0, v1}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeUpdateMutableDatas(J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public dispatchBodyInfo(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/CVBodyInfo;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 138
    invoke-virtual {p0, p1, v0}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->dispatchBodyInfo(Ljava/util/List;Z)V

    return-void
.end method

.method public dispatchBodyInfo(Ljava/util/List;Z)V
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/CVBodyInfo;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-direct {v0}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    if-eqz v1, :cond_7

    .line 13
    .line 14
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    goto/16 :goto_4

    .line 21
    .line 22
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    new-array v3, v2, [J

    .line 27
    .line 28
    const/4 v4, 0x0

    .line 29
    move v5, v4

    .line 30
    :goto_0
    if-ge v5, v2, :cond_8

    .line 31
    .line 32
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v6

    .line 36
    check-cast v6, Lcom/momo/xeengine/cv/bean/CVBodyInfo;

    .line 37
    .line 38
    if-eqz v6, :cond_6

    .line 39
    .line 40
    iget-object v7, v6, Lcom/momo/xeengine/cv/bean/CVBodyInfo;->joints:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    .line 43
    .line 44
    .line 45
    move-result v7

    .line 46
    if-eqz v7, :cond_2

    .line 47
    .line 48
    goto :goto_3

    .line 49
    :cond_2
    iget-object v7, v6, Lcom/momo/xeengine/cv/bean/CVBodyInfo;->joints:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 52
    .line 53
    .line 54
    move-result v7

    .line 55
    new-array v8, v7, [F

    .line 56
    .line 57
    new-array v9, v7, [F

    .line 58
    .line 59
    new-array v10, v7, [F

    .line 60
    .line 61
    move v11, v4

    .line 62
    :goto_1
    if-ge v11, v7, :cond_4

    .line 63
    .line 64
    iget-object v12, v6, Lcom/momo/xeengine/cv/bean/CVBodyInfo;->joints:Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {v12, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v12

    .line 70
    check-cast v12, Lcom/momo/xeengine/cv/bean/CVBodyInfo$Joint;

    .line 71
    .line 72
    if-nez v12, :cond_3

    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_3
    iget v13, v12, Lcom/momo/xeengine/cv/bean/CVBodyInfo$Joint;->x:F

    .line 76
    .line 77
    aput v13, v8, v11

    .line 78
    .line 79
    iget v13, v12, Lcom/momo/xeengine/cv/bean/CVBodyInfo$Joint;->y:F

    .line 80
    .line 81
    aput v13, v9, v11

    .line 82
    .line 83
    iget v12, v12, Lcom/momo/xeengine/cv/bean/CVBodyInfo$Joint;->score:F

    .line 84
    .line 85
    aput v12, v10, v11

    .line 86
    .line 87
    :goto_2
    add-int/lit8 v11, v11, 0x1

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_4
    invoke-static {v8, v9, v10}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeSetBody([F[F[F)J

    .line 91
    .line 92
    .line 93
    move-result-wide v14

    .line 94
    if-eqz p2, :cond_5

    .line 95
    .line 96
    if-nez v5, :cond_5

    .line 97
    .line 98
    iget-object v7, v6, Lcom/momo/xeengine/cv/bean/CVBodyInfo;->src_warp_points:[F

    .line 99
    .line 100
    if-eqz v7, :cond_5

    .line 101
    .line 102
    array-length v8, v7

    .line 103
    if-lez v8, :cond_5

    .line 104
    .line 105
    iget-object v6, v6, Lcom/momo/xeengine/cv/bean/CVBodyInfo;->dst_warp_points:[F

    .line 106
    .line 107
    if-eqz v6, :cond_5

    .line 108
    .line 109
    array-length v8, v6

    .line 110
    if-lez v8, :cond_5

    .line 111
    .line 112
    iget-wide v12, v0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->pointer:J

    .line 113
    .line 114
    move-object/from16 v17, v6

    .line 115
    .line 116
    move-object/from16 v16, v7

    .line 117
    .line 118
    invoke-static/range {v12 .. v17}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeBodySrcAndDstWarpPoints(JJ[F[F)J

    .line 119
    .line 120
    .line 121
    :cond_5
    aput-wide v14, v3, v5

    .line 122
    .line 123
    :cond_6
    :goto_3
    add-int/lit8 v5, v5, 0x1

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_7
    :goto_4
    const/4 v3, 0x0

    .line 127
    :cond_8
    iget-object v1, v0, Lcom/momo/xeengine/xnative/XETouchDispatcher;->executor:Ljava/util/concurrent/Executor;

    .line 128
    .line 129
    new-instance v2, Ll/wkq0;

    .line 130
    .line 131
    invoke-direct {v2, v0, v3}, Ll/wkq0;-><init>(Lcom/momo/xeengine/xnative/XEEventDispatcher;[J)V

    .line 132
    .line 133
    .line 134
    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method public dispatchCartoonFaceInfo(Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XETouchDispatcher;->executor:Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/dlq0;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/dlq0;-><init>(Lcom/momo/xeengine/xnative/XEEventDispatcher;Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    new-instance p1, Ll/elq0;

    .line 15
    .line 16
    invoke-direct {p1, p0}, Ll/elq0;-><init>(Lcom/momo/xeengine/xnative/XEEventDispatcher;)V

    .line 17
    .line 18
    .line 19
    invoke-interface {v0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public dispatchExpressInfo(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/CVExpressInfo;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public dispatchFaceInfo(Ljava/util/List;)V
    .locals 26
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/XEFaceInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-direct {v0}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    goto/16 :goto_2

    .line 12
    .line 13
    :cond_0
    const/4 v2, 0x1

    .line 14
    if-eqz v1, :cond_c

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    if-nez v3, :cond_c

    .line 21
    .line 22
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    new-array v4, v3, [J

    .line 27
    .line 28
    const/4 v5, 0x0

    .line 29
    move v6, v5

    .line 30
    :goto_0
    if-ge v6, v3, :cond_b

    .line 31
    .line 32
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v7

    .line 36
    check-cast v7, Lcom/momo/xeengine/cv/bean/XEFaceInfo;

    .line 37
    .line 38
    iget-wide v8, v0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->pointer:J

    .line 39
    .line 40
    invoke-static {v8, v9, v6}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeGetFace(JI)J

    .line 41
    .line 42
    .line 43
    move-result-wide v12

    .line 44
    iget-object v14, v7, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->src_warp_points:[F

    .line 45
    .line 46
    if-eqz v14, :cond_1

    .line 47
    .line 48
    array-length v8, v14

    .line 49
    if-lez v8, :cond_1

    .line 50
    .line 51
    iget-object v15, v7, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->dst_warp_points:[F

    .line 52
    .line 53
    if-eqz v15, :cond_1

    .line 54
    .line 55
    array-length v8, v15

    .line 56
    if-lez v8, :cond_1

    .line 57
    .line 58
    iget-wide v10, v0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->pointer:J

    .line 59
    .line 60
    invoke-static/range {v10 .. v15}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeSrcAndDstWarpPoints(JJ[F[F)J

    .line 61
    .line 62
    .line 63
    :cond_1
    iget v8, v7, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->trackId:I

    .line 64
    .line 65
    invoke-static {v12, v13, v8}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeSetFaceTrackId(JI)J

    .line 66
    .line 67
    .line 68
    move-result-wide v8

    .line 69
    iget v10, v7, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->pitch:F

    .line 70
    .line 71
    iget v11, v7, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->yaw:F

    .line 72
    .line 73
    iget v12, v7, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->roll:F

    .line 74
    .line 75
    invoke-static {v8, v9, v10, v11, v12}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeSetFaceEuler(JFFF)J

    .line 76
    .line 77
    .line 78
    move-result-wide v13

    .line 79
    iget-object v8, v7, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->faceBounds:[F

    .line 80
    .line 81
    if-eqz v8, :cond_2

    .line 82
    .line 83
    array-length v9, v8

    .line 84
    const/4 v10, 0x4

    .line 85
    if-lt v9, v10, :cond_2

    .line 86
    .line 87
    aget v15, v8, v5

    .line 88
    .line 89
    aget v16, v8, v2

    .line 90
    .line 91
    const/4 v9, 0x2

    .line 92
    aget v17, v8, v9

    .line 93
    .line 94
    const/4 v9, 0x3

    .line 95
    aget v18, v8, v9

    .line 96
    .line 97
    invoke-static/range {v13 .. v18}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeFaceBounds(JFFFF)J

    .line 98
    .line 99
    .line 100
    move-result-wide v13

    .line 101
    :cond_2
    iget-object v8, v7, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->landmarks96:[F

    .line 102
    .line 103
    if-eqz v8, :cond_3

    .line 104
    .line 105
    array-length v9, v8

    .line 106
    if-lez v9, :cond_3

    .line 107
    .line 108
    invoke-static {v13, v14, v8}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeFace96LandMarks(J[F)J

    .line 109
    .line 110
    .line 111
    move-result-wide v13

    .line 112
    :cond_3
    iget-object v8, v7, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->landmarks106:[F

    .line 113
    .line 114
    if-eqz v8, :cond_4

    .line 115
    .line 116
    array-length v9, v8

    .line 117
    if-lez v9, :cond_4

    .line 118
    .line 119
    invoke-static {v13, v14, v8}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeFace106LandMarks(J[F)J

    .line 120
    .line 121
    .line 122
    move-result-wide v13

    .line 123
    :cond_4
    iget-object v8, v7, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->landmarks222:[F

    .line 124
    .line 125
    if-eqz v8, :cond_5

    .line 126
    .line 127
    array-length v9, v8

    .line 128
    if-lez v9, :cond_5

    .line 129
    .line 130
    invoke-static {v13, v14, v8}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeFace222LandMarks(J[F)J

    .line 131
    .line 132
    .line 133
    move-result-wide v13

    .line 134
    :cond_5
    iget v8, v7, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->expression:I

    .line 135
    .line 136
    invoke-static {v13, v14, v8}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeFaceEexpression(JI)J

    .line 137
    .line 138
    .line 139
    move-result-wide v8

    .line 140
    iget-object v10, v7, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->modelViewMatrix:[F

    .line 141
    .line 142
    if-eqz v10, :cond_6

    .line 143
    .line 144
    array-length v11, v10

    .line 145
    const/16 v12, 0x10

    .line 146
    .line 147
    if-lt v11, v12, :cond_6

    .line 148
    .line 149
    invoke-static {v8, v9, v10}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeFaceModelViewMatrix(J[F)J

    .line 150
    .line 151
    .line 152
    move-result-wide v8

    .line 153
    :cond_6
    iget-object v10, v7, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->facerigStates:[F

    .line 154
    .line 155
    if-eqz v10, :cond_7

    .line 156
    .line 157
    array-length v11, v10

    .line 158
    const/16 v12, 0x24

    .line 159
    .line 160
    if-lt v11, v12, :cond_7

    .line 161
    .line 162
    invoke-static {v8, v9, v10}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeFacerigStates(J[F)J

    .line 163
    .line 164
    .line 165
    move-result-wide v8

    .line 166
    :cond_7
    iget-object v10, v7, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->skin_threshold:[F

    .line 167
    .line 168
    if-eqz v10, :cond_8

    .line 169
    .line 170
    array-length v11, v10

    .line 171
    if-lez v11, :cond_8

    .line 172
    .line 173
    invoke-static {v8, v9, v10}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeSkinThreshold(J[F)J

    .line 174
    .line 175
    .line 176
    move-result-wide v8

    .line 177
    :cond_8
    move-wide v12, v8

    .line 178
    iget-object v8, v7, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->faceMask:Lcom/momo/xeengine/cv/bean/XEFaceMask;

    .line 179
    .line 180
    if-eqz v8, :cond_9

    .line 181
    .line 182
    invoke-virtual {v8}, Lcom/momo/xeengine/cv/bean/XEFaceMask;->getLength()I

    .line 183
    .line 184
    .line 185
    move-result v8

    .line 186
    if-lez v8, :cond_9

    .line 187
    .line 188
    iget-object v8, v7, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->faceMask:Lcom/momo/xeengine/cv/bean/XEFaceMask;

    .line 189
    .line 190
    invoke-virtual {v8}, Lcom/momo/xeengine/cv/bean/XEFaceMask;->getMaskWidth()I

    .line 191
    .line 192
    .line 193
    move-result v8

    .line 194
    if-lez v8, :cond_9

    .line 195
    .line 196
    iget-object v8, v7, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->faceMask:Lcom/momo/xeengine/cv/bean/XEFaceMask;

    .line 197
    .line 198
    invoke-virtual {v8}, Lcom/momo/xeengine/cv/bean/XEFaceMask;->getMaskHeight()I

    .line 199
    .line 200
    .line 201
    move-result v8

    .line 202
    if-lez v8, :cond_9

    .line 203
    .line 204
    iget-wide v10, v0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->pointer:J

    .line 205
    .line 206
    iget-object v8, v7, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->faceMask:Lcom/momo/xeengine/cv/bean/XEFaceMask;

    .line 207
    .line 208
    invoke-virtual {v8}, Lcom/momo/xeengine/cv/bean/XEFaceMask;->getDatas()[B

    .line 209
    .line 210
    .line 211
    move-result-object v14

    .line 212
    iget-object v8, v7, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->faceMask:Lcom/momo/xeengine/cv/bean/XEFaceMask;

    .line 213
    .line 214
    invoke-virtual {v8}, Lcom/momo/xeengine/cv/bean/XEFaceMask;->getLength()I

    .line 215
    .line 216
    .line 217
    move-result v15

    .line 218
    iget-object v8, v7, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->faceMask:Lcom/momo/xeengine/cv/bean/XEFaceMask;

    .line 219
    .line 220
    invoke-virtual {v8}, Lcom/momo/xeengine/cv/bean/XEFaceMask;->getWarpMat()[F

    .line 221
    .line 222
    .line 223
    move-result-object v16

    .line 224
    iget-object v8, v7, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->faceMask:Lcom/momo/xeengine/cv/bean/XEFaceMask;

    .line 225
    .line 226
    invoke-virtual {v8}, Lcom/momo/xeengine/cv/bean/XEFaceMask;->getMaskWidth()I

    .line 227
    .line 228
    .line 229
    move-result v17

    .line 230
    iget-object v8, v7, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->faceMask:Lcom/momo/xeengine/cv/bean/XEFaceMask;

    .line 231
    .line 232
    invoke-virtual {v8}, Lcom/momo/xeengine/cv/bean/XEFaceMask;->getMaskHeight()I

    .line 233
    .line 234
    .line 235
    move-result v18

    .line 236
    iget-object v8, v7, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->faceMask:Lcom/momo/xeengine/cv/bean/XEFaceMask;

    .line 237
    .line 238
    invoke-virtual {v8}, Lcom/momo/xeengine/cv/bean/XEFaceMask;->isFlipShowX()Z

    .line 239
    .line 240
    .line 241
    move-result v19

    .line 242
    invoke-static/range {v10 .. v19}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeFaceMask(JJ[BI[FIIZ)J

    .line 243
    .line 244
    .line 245
    move-result-wide v12

    .line 246
    :cond_9
    move-wide/from16 v16, v12

    .line 247
    .line 248
    iget-object v8, v7, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->liquefyInfos:Ljava/util/List;

    .line 249
    .line 250
    if-eqz v8, :cond_a

    .line 251
    .line 252
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 253
    .line 254
    .line 255
    move-result v8

    .line 256
    if-lez v8, :cond_a

    .line 257
    .line 258
    move v8, v5

    .line 259
    :goto_1
    iget-object v9, v7, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->liquefyInfos:Ljava/util/List;

    .line 260
    .line 261
    invoke-interface {v9}, Ljava/util/List;->size()I

    .line 262
    .line 263
    .line 264
    move-result v9

    .line 265
    if-ge v8, v9, :cond_a

    .line 266
    .line 267
    iget-object v9, v7, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->liquefyInfos:Ljava/util/List;

    .line 268
    .line 269
    invoke-interface {v9, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 270
    .line 271
    .line 272
    move-result-object v9

    .line 273
    check-cast v9, Lcom/momo/xeengine/cv/bean/XEFaceLiquefy;

    .line 274
    .line 275
    iget-wide v14, v0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->pointer:J

    .line 276
    .line 277
    iget v10, v9, Lcom/momo/xeengine/cv/bean/XEFaceLiquefy;->circleType:I

    .line 278
    .line 279
    iget v11, v9, Lcom/momo/xeengine/cv/bean/XEFaceLiquefy;->circleCenterX:F

    .line 280
    .line 281
    iget v12, v9, Lcom/momo/xeengine/cv/bean/XEFaceLiquefy;->circleCenterY:F

    .line 282
    .line 283
    iget v13, v9, Lcom/momo/xeengine/cv/bean/XEFaceLiquefy;->circleSizeX:F

    .line 284
    .line 285
    iget v2, v9, Lcom/momo/xeengine/cv/bean/XEFaceLiquefy;->circleSizeY:F

    .line 286
    .line 287
    iget v5, v9, Lcom/momo/xeengine/cv/bean/XEFaceLiquefy;->circleIntensityX:F

    .line 288
    .line 289
    iget v1, v9, Lcom/momo/xeengine/cv/bean/XEFaceLiquefy;->circleIntensityY:F

    .line 290
    .line 291
    iget-object v9, v9, Lcom/momo/xeengine/cv/bean/XEFaceLiquefy;->mat:[F

    .line 292
    .line 293
    move/from16 v24, v1

    .line 294
    .line 295
    move/from16 v22, v2

    .line 296
    .line 297
    move/from16 v23, v5

    .line 298
    .line 299
    move-object/from16 v25, v9

    .line 300
    .line 301
    move/from16 v18, v10

    .line 302
    .line 303
    move/from16 v19, v11

    .line 304
    .line 305
    move/from16 v20, v12

    .line 306
    .line 307
    move/from16 v21, v13

    .line 308
    .line 309
    invoke-static/range {v14 .. v25}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeSetFaceLiquefyInfos(JJIFFFFFF[F)V

    .line 310
    .line 311
    .line 312
    add-int/lit8 v8, v8, 0x1

    .line 313
    .line 314
    move-object/from16 v1, p1

    .line 315
    .line 316
    const/4 v2, 0x1

    .line 317
    const/4 v5, 0x0

    .line 318
    goto :goto_1

    .line 319
    :cond_a
    aput-wide v16, v4, v6

    .line 320
    .line 321
    add-int/lit8 v6, v6, 0x1

    .line 322
    .line 323
    move-object/from16 v1, p1

    .line 324
    .line 325
    const/4 v2, 0x1

    .line 326
    const/4 v5, 0x0

    .line 327
    goto/16 :goto_0

    .line 328
    .line 329
    :cond_b
    move v1, v5

    .line 330
    iput-boolean v1, v0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->hasDeliverFaceLost:Z

    .line 331
    .line 332
    iget-object v1, v0, Lcom/momo/xeengine/xnative/XETouchDispatcher;->executor:Ljava/util/concurrent/Executor;

    .line 333
    .line 334
    new-instance v2, Ll/blq0;

    .line 335
    .line 336
    invoke-direct {v2, v0, v4}, Ll/blq0;-><init>(Lcom/momo/xeengine/xnative/XEEventDispatcher;[J)V

    .line 337
    .line 338
    .line 339
    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 340
    .line 341
    .line 342
    return-void

    .line 343
    :cond_c
    iget-boolean v1, v0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->hasDeliverFaceLost:Z

    .line 344
    .line 345
    if-nez v1, :cond_d

    .line 346
    .line 347
    const/4 v1, 0x1

    .line 348
    iput-boolean v1, v0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->hasDeliverFaceLost:Z

    .line 349
    .line 350
    iget-object v1, v0, Lcom/momo/xeengine/xnative/XETouchDispatcher;->executor:Ljava/util/concurrent/Executor;

    .line 351
    .line 352
    new-instance v2, Ll/clq0;

    .line 353
    .line 354
    invoke-direct {v2, v0}, Ll/clq0;-><init>(Lcom/momo/xeengine/xnative/XEEventDispatcher;)V

    .line 355
    .line 356
    .line 357
    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 358
    .line 359
    .line 360
    :cond_d
    :goto_2
    return-void
.end method

.method public dispatchFaceSegmentInfo(Lcom/momo/xeengine/cv/bean/XEFaceSegmentInfo;)V
    .locals 0

    return-void
.end method

.method public dispatchHandInfo(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/XEHandInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->isRunning()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    if-eqz p1, :cond_2

    .line 9
    .line 10
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-boolean v0, p0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->isHandSetNullInfo:Z

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XETouchDispatcher;->executor:Ljava/util/concurrent/Executor;

    .line 22
    .line 23
    new-instance v1, Ll/ykq0;

    .line 24
    .line 25
    invoke-direct {v1, p0, p1}, Ll/ykq0;-><init>(Lcom/momo/xeengine/xnative/XEEventDispatcher;Ljava/util/List;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/momo/xeengine/xnative/XETouchDispatcher;->executor:Ljava/util/concurrent/Executor;

    .line 33
    .line 34
    new-instance v0, Ll/xkq0;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/xkq0;-><init>(Lcom/momo/xeengine/xnative/XEEventDispatcher;)V

    .line 37
    .line 38
    .line 39
    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public dispatchMutableInfo(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/XEMutableInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XETouchDispatcher;->executor:Ljava/util/concurrent/Executor;

    .line 10
    .line 11
    new-instance v1, Ll/zkq0;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Ll/zkq0;-><init>(Lcom/momo/xeengine/xnative/XEEventDispatcher;Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p1, p0, Lcom/momo/xeengine/xnative/XETouchDispatcher;->executor:Ljava/util/concurrent/Executor;

    .line 21
    .line 22
    new-instance v0, Ll/alq0;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/alq0;-><init>(Lcom/momo/xeengine/xnative/XEEventDispatcher;)V

    .line 25
    .line 26
    .line 27
    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public dispatchObjectInfo(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/CVObjectInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->isRunning()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    if-eqz p1, :cond_3

    .line 9
    .line 10
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    goto :goto_2

    .line 17
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    new-array v1, v0, [J

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    :goto_0
    if-ge v2, v0, :cond_4

    .line 25
    .line 26
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    check-cast v3, Lcom/momo/xeengine/cv/bean/CVObjectInfo;

    .line 31
    .line 32
    if-nez v3, :cond_2

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_2
    invoke-virtual {v3}, Lcom/momo/xeengine/cv/bean/CVObjectInfo;->getType()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-virtual {v3}, Lcom/momo/xeengine/cv/bean/CVObjectInfo;->getBounds()[F

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    invoke-virtual {v3}, Lcom/momo/xeengine/cv/bean/CVObjectInfo;->getScore()F

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    invoke-static {v4, v5, v3}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->nativeSetObject(Ljava/lang/String;[FF)J

    .line 48
    .line 49
    .line 50
    move-result-wide v3

    .line 51
    aput-wide v3, v1, v2

    .line 52
    .line 53
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    :goto_2
    const/4 v1, 0x0

    .line 57
    :cond_4
    iget-object p1, p0, Lcom/momo/xeengine/xnative/XETouchDispatcher;->executor:Ljava/util/concurrent/Executor;

    .line 58
    .line 59
    new-instance v0, Ll/flq0;

    .line 60
    .line 61
    invoke-direct {v0, p0, v1}, Ll/flq0;-><init>(Lcom/momo/xeengine/xnative/XEEventDispatcher;[J)V

    .line 62
    .line 63
    .line 64
    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public dispatchSegmentInfo(Lcom/momo/xeengine/cv/bean/CVSegmentInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XETouchDispatcher;->executor:Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/glq0;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/glq0;-><init>(Lcom/momo/xeengine/xnative/XEEventDispatcher;Lcom/momo/xeengine/cv/bean/CVSegmentInfo;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    new-instance p1, Ll/hlq0;

    .line 15
    .line 16
    invoke-direct {p1, p0}, Ll/hlq0;-><init>(Lcom/momo/xeengine/xnative/XEEventDispatcher;)V

    .line 17
    .line 18
    .line 19
    invoke-interface {v0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public dispatchTTHeartInfo(Lcom/momo/xeengine/cv/bean/XETTHeartInfo;)V
    .locals 0

    return-void
.end method

.method public executeQueue()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/xnative/XETouchDispatcher;->executor:Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    check-cast p0, Lcom/momo/xeengine/xnative/XEEventDispatcher$EventExecutor;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/xeengine/xnative/XEEventDispatcher$EventExecutor;->apply()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public release()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/momo/xeengine/xnative/XETouchDispatcher;->release()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/xeengine/xnative/XETouchDispatcher;->executor:Ljava/util/concurrent/Executor;

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/momo/xeengine/xnative/XEEventDispatcher;->pointer:J

    .line 10
    .line 11
    return-void
.end method
