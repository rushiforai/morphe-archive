.class public Lcom/core/glcore/util/XEFaceInfoHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final DUCK_FACE:I = 0x400

.field private static final EYE_BLINK:I = 0x100

.field private static final FACE_STATE_CLOSE:I = 0x1

.field private static final FACE_STATE_OPEN:I = 0x0

.field private static INDEX_FACE_LEFT:I = 0x0

.field private static INDEX_FACE_RIGHT:I = 0x10

.field private static INDEX_MOUSE_DOWN:I = 0x42

.field private static INDEX_MOUSE_UP:I = 0x3e

.field private static final LEFT_EYE_BLINK:I = 0x10

.field private static final LEFT_EYE_CLOSING:I = 0x8

.field private static final LEFT_EYE_OPEN:I = 0x4

.field private static final MOUSE_STATE_CLOSE:I = 0x2

.field private static final MOUSE_STATE_OPEN:I = 0x1

.field private static final NOD:I = 0x800

.field private static final NOD_STATE_DOWN:I = 0x3e9

.field private static final NOD_STATE_POSSIBLE:I = 0x3e8

.field private static final NOD_STATE_UP:I = 0x3ea

.field private static final POINTS_LENGTH:I = 0x44

.field private static final RIGHT_EYE_BLINK:I = 0x80

.field private static final RIGHT_EYE_CLOSING:I = 0x40

.field private static final RIGHT_EYE_OPEN:I = 0x20

.field private static final SMILE:I = 0x200

.field private static duckFaceState:I = 0x1

.field private static lastPitch:F = 0.0f

.field private static leftEyeBlinkCount:I = 0x0

.field private static leftEyeBlinkState:I = 0x1

.field private static leftEyeOpenState:I = 0x0

.field private static mouseOpenState:I = 0x2

.field private static nodFailedCount:I = 0x0

.field private static nodStartPitch:I = 0x0

.field private static nodStartTime:J = 0x0L

.field private static nodState:I = 0x0

.field private static pitchValues:Ljava/util/List; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private static rightEyeBlinkCount:I = 0x0

.field private static rightEyeBlinkState:I = 0x0

.field private static rightEyeOpenState:I = 0x0

.field private static smileState:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/core/glcore/util/XEFaceInfoHelper;->pitchValues:Ljava/util/List;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    sput v0, Lcom/core/glcore/util/XEFaceInfoHelper;->nodStartPitch:I

    .line 10
    .line 11
    sput v0, Lcom/core/glcore/util/XEFaceInfoHelper;->nodFailedCount:I

    .line 12
    .line 13
    const-wide/16 v0, 0x0

    .line 14
    .line 15
    sput-wide v0, Lcom/core/glcore/util/XEFaceInfoHelper;->nodStartTime:J

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    sput v0, Lcom/core/glcore/util/XEFaceInfoHelper;->lastPitch:F

    .line 19
    .line 20
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static adjustState(Ll/omw;I)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    goto/16 :goto_4

    .line 5
    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/omw;->n()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-lt p1, v1, :cond_1

    .line 11
    .line 12
    move p1, v0

    .line 13
    :cond_1
    invoke-virtual {p0, p1}, Ll/omw;->j(I)Ll/nuf;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    if-eqz p0, :cond_b

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/nuf;->l()[F

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p1}, Lcom/core/glcore/util/XEFaceInfoHelper;->updateMouseState([F)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    const/4 v1, 0x2

    .line 28
    sput v1, Lcom/core/glcore/util/XEFaceInfoHelper;->smileState:I

    .line 29
    .line 30
    sput v1, Lcom/core/glcore/util/XEFaceInfoHelper;->duckFaceState:I

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/nuf;->d()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    const/4 v3, 0x1

    .line 37
    if-ne v2, v3, :cond_2

    .line 38
    .line 39
    sput v3, Lcom/core/glcore/util/XEFaceInfoHelper;->duckFaceState:I

    .line 40
    .line 41
    or-int/lit16 p1, p1, 0x400

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    invoke-virtual {p0}, Ll/nuf;->d()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-ne v2, v1, :cond_3

    .line 49
    .line 50
    sput v3, Lcom/core/glcore/util/XEFaceInfoHelper;->smileState:I

    .line 51
    .line 52
    or-int/lit16 p1, p1, 0x200

    .line 53
    .line 54
    :cond_3
    :goto_0
    invoke-static {p0}, Lcom/core/glcore/util/XEFaceInfoHelper;->updateEyeState(Ll/nuf;)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    or-int/2addr p1, v1

    .line 59
    invoke-static {p0}, Lcom/core/glcore/util/XEFaceInfoHelper;->updateNodState(Ll/nuf;)I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    or-int/2addr p0, p1

    .line 64
    sget p1, Lcom/core/glcore/util/XEFaceInfoHelper;->rightEyeOpenState:I

    .line 65
    .line 66
    if-nez p1, :cond_5

    .line 67
    .line 68
    sget v1, Lcom/core/glcore/util/XEFaceInfoHelper;->leftEyeOpenState:I

    .line 69
    .line 70
    if-ne v1, v3, :cond_5

    .line 71
    .line 72
    sget v1, Lcom/core/glcore/util/XEFaceInfoHelper;->leftEyeBlinkCount:I

    .line 73
    .line 74
    add-int/2addr v1, v3

    .line 75
    sput v1, Lcom/core/glcore/util/XEFaceInfoHelper;->leftEyeBlinkCount:I

    .line 76
    .line 77
    if-le v1, v3, :cond_4

    .line 78
    .line 79
    sput v0, Lcom/core/glcore/util/XEFaceInfoHelper;->leftEyeBlinkState:I

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_4
    sput v3, Lcom/core/glcore/util/XEFaceInfoHelper;->leftEyeBlinkState:I

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_5
    sput v0, Lcom/core/glcore/util/XEFaceInfoHelper;->leftEyeBlinkCount:I

    .line 86
    .line 87
    sput v3, Lcom/core/glcore/util/XEFaceInfoHelper;->leftEyeBlinkState:I

    .line 88
    .line 89
    :goto_1
    if-ne p1, v3, :cond_7

    .line 90
    .line 91
    sget p1, Lcom/core/glcore/util/XEFaceInfoHelper;->leftEyeOpenState:I

    .line 92
    .line 93
    if-nez p1, :cond_7

    .line 94
    .line 95
    sget p1, Lcom/core/glcore/util/XEFaceInfoHelper;->rightEyeBlinkCount:I

    .line 96
    .line 97
    add-int/2addr p1, v3

    .line 98
    sput p1, Lcom/core/glcore/util/XEFaceInfoHelper;->rightEyeBlinkCount:I

    .line 99
    .line 100
    if-le p1, v3, :cond_6

    .line 101
    .line 102
    sput v0, Lcom/core/glcore/util/XEFaceInfoHelper;->rightEyeBlinkState:I

    .line 103
    .line 104
    goto :goto_2

    .line 105
    :cond_6
    sput v3, Lcom/core/glcore/util/XEFaceInfoHelper;->rightEyeBlinkState:I

    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_7
    sput v0, Lcom/core/glcore/util/XEFaceInfoHelper;->rightEyeBlinkCount:I

    .line 109
    .line 110
    sput v3, Lcom/core/glcore/util/XEFaceInfoHelper;->rightEyeBlinkState:I

    .line 111
    .line 112
    :goto_2
    sget p1, Lcom/core/glcore/util/XEFaceInfoHelper;->leftEyeBlinkState:I

    .line 113
    .line 114
    if-nez p1, :cond_8

    .line 115
    .line 116
    or-int/lit8 p0, p0, 0x10

    .line 117
    .line 118
    move v0, v3

    .line 119
    :cond_8
    sget p1, Lcom/core/glcore/util/XEFaceInfoHelper;->rightEyeBlinkState:I

    .line 120
    .line 121
    if-nez p1, :cond_9

    .line 122
    .line 123
    or-int/lit16 p0, p0, 0x80

    .line 124
    .line 125
    goto :goto_3

    .line 126
    :cond_9
    move v3, v0

    .line 127
    :goto_3
    if-eqz v3, :cond_a

    .line 128
    .line 129
    or-int/lit16 p0, p0, 0x100

    .line 130
    .line 131
    :cond_a
    return p0

    .line 132
    :cond_b
    :goto_4
    return v0
.end method

.method public static setFaceInfo(Ll/omw;)V
    .locals 15

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto/16 :goto_6

    .line 4
    .line 5
    :cond_0
    invoke-static {}, Lcom/core/glcore/util/XEEngineHelper;->get()Lcom/momo/xeengine/XE3DEngine;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_11

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/momo/xeengine/XE3DEngine;->isRunning()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    goto/16 :goto_6

    .line 18
    .line 19
    :cond_1
    invoke-virtual {v0}, Lcom/momo/xeengine/XE3DEngine;->getEventDispatcher()Lcom/momo/xeengine/xnative/XEEventDispatcher;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    if-nez v1, :cond_2

    .line 24
    .line 25
    goto/16 :goto_6

    .line 26
    .line 27
    :cond_2
    new-instance v2, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/omw;->q()Ll/evf;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-static {}, Lcom/core/glcore/util/FacerigHelper;->getUseAnimojiFaceRig()Z

    .line 37
    .line 38
    .line 39
    const/4 v4, 0x2

    .line 40
    const/4 v5, 0x3

    .line 41
    const/4 v6, 0x1

    .line 42
    const/4 v7, 0x0

    .line 43
    if-eqz v3, :cond_7

    .line 44
    .line 45
    invoke-virtual {v3}, Ll/evf;->b()[F

    .line 46
    .line 47
    .line 48
    move-result-object v8

    .line 49
    if-eqz v8, :cond_7

    .line 50
    .line 51
    array-length v8, v8

    .line 52
    if-lez v8, :cond_7

    .line 53
    .line 54
    iget-object v0, p0, Ll/omw;->j:Ll/evf;

    .line 55
    .line 56
    iget-object v0, v0, Ll/evf;->b:Lcom/momocv/videoprocessor/VideoInfo;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    .line 59
    .line 60
    if-eqz v0, :cond_6

    .line 61
    .line 62
    array-length v8, v0

    .line 63
    if-lez v8, :cond_6

    .line 64
    .line 65
    move v8, v7

    .line 66
    :goto_0
    array-length v9, v0

    .line 67
    if-ge v8, v9, :cond_6

    .line 68
    .line 69
    new-instance v9, Lcom/momo/xeengine/cv/bean/XEFaceInfo;

    .line 70
    .line 71
    invoke-direct {v9}, Lcom/momo/xeengine/cv/bean/XEFaceInfo;-><init>()V

    .line 72
    .line 73
    .line 74
    aget-object v10, v0, v8

    .line 75
    .line 76
    iget v11, v10, Lcom/momocv/SingleFaceInfo;->tracking_id_:I

    .line 77
    .line 78
    iput v11, v9, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->trackId:I

    .line 79
    .line 80
    iget-object v10, v10, Lcom/momocv/SingleFaceInfo;->euler_angles_:[F

    .line 81
    .line 82
    if-eqz v10, :cond_3

    .line 83
    .line 84
    array-length v11, v10

    .line 85
    if-lt v11, v5, :cond_3

    .line 86
    .line 87
    aget v11, v10, v7

    .line 88
    .line 89
    iput v11, v9, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->pitch:F

    .line 90
    .line 91
    aget v11, v10, v6

    .line 92
    .line 93
    iput v11, v9, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->yaw:F

    .line 94
    .line 95
    aget v10, v10, v4

    .line 96
    .line 97
    iput v10, v9, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->roll:F

    .line 98
    .line 99
    :cond_3
    invoke-static {p0, v7}, Lcom/core/glcore/util/XEFaceInfoHelper;->adjustState(Ll/omw;I)I

    .line 100
    .line 101
    .line 102
    move-result v10

    .line 103
    iput v10, v9, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->expression:I

    .line 104
    .line 105
    aget-object v10, v0, v8

    .line 106
    .line 107
    iget-object v11, v10, Lcom/momocv/SingleFaceInfo;->landmarks_68_:[F

    .line 108
    .line 109
    iput-object v11, v9, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->landmarks68:[F

    .line 110
    .line 111
    iget-object v11, v10, Lcom/momocv/SingleFaceInfo;->face_rect_:[F

    .line 112
    .line 113
    iput-object v11, v9, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->faceBounds:[F

    .line 114
    .line 115
    iget-object v11, v10, Lcom/momocv/SingleFaceInfo;->camera_matrix_:[F

    .line 116
    .line 117
    iput-object v11, v9, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->cameraMatrix:[F

    .line 118
    .line 119
    iget-object v11, v10, Lcom/momocv/SingleFaceInfo;->rotation_matrix_:[F

    .line 120
    .line 121
    iput-object v11, v9, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->rotationMatrix:[F

    .line 122
    .line 123
    iget-object v11, v10, Lcom/momocv/SingleFaceInfo;->rotation_vector_:[F

    .line 124
    .line 125
    iput-object v11, v9, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->rotationVector:[F

    .line 126
    .line 127
    iget-object v11, v10, Lcom/momocv/SingleFaceInfo;->translation_vector_:[F

    .line 128
    .line 129
    iput-object v11, v9, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->translationVector:[F

    .line 130
    .line 131
    iget-object v11, v10, Lcom/momocv/SingleFaceInfo;->projection_matrix_:[F

    .line 132
    .line 133
    iput-object v11, v9, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->projectionMatrix:[F

    .line 134
    .line 135
    iget-object v11, v10, Lcom/momocv/SingleFaceInfo;->modelview_matrix_:[F

    .line 136
    .line 137
    iput-object v11, v9, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->modelViewMatrix:[F

    .line 138
    .line 139
    iget-object v10, v10, Lcom/momocv/SingleFaceInfo;->landmarks_96_:[F

    .line 140
    .line 141
    iput-object v10, v9, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->landmarks96:[F

    .line 142
    .line 143
    iget-object v10, v3, Ll/evf;->a:Lcom/momocv/facerigv3/FacerigV3Info;

    .line 144
    .line 145
    iget-object v10, v10, Lcom/momocv/facerigv3/FacerigV3Info;->facerigV3_eulers_:[F

    .line 146
    .line 147
    if-eqz v10, :cond_4

    .line 148
    .line 149
    iput-object v10, v9, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->facerigStates:[F

    .line 150
    .line 151
    const/16 v11, 0x36

    .line 152
    .line 153
    new-array v11, v11, [F

    .line 154
    .line 155
    invoke-static {v10, v7, v11, v7, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 156
    .line 157
    .line 158
    iget-object v10, v3, Ll/evf;->a:Lcom/momocv/facerigv3/FacerigV3Info;

    .line 159
    .line 160
    iget-object v10, v10, Lcom/momocv/facerigv3/FacerigV3Info;->facerigV3_scores_:[F

    .line 161
    .line 162
    const/16 v12, 0x33

    .line 163
    .line 164
    invoke-static {v10, v7, v11, v5, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 165
    .line 166
    .line 167
    iput-object v11, v9, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->facerigStates:[F

    .line 168
    .line 169
    :cond_4
    iput v6, v9, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->meType:I

    .line 170
    .line 171
    invoke-virtual {p0}, Ll/omw;->r()[[F

    .line 172
    .line 173
    .line 174
    move-result-object v10

    .line 175
    invoke-virtual {p0}, Ll/omw;->f()[[F

    .line 176
    .line 177
    .line 178
    move-result-object v11

    .line 179
    if-eqz v10, :cond_5

    .line 180
    .line 181
    array-length v12, v10

    .line 182
    if-le v12, v8, :cond_5

    .line 183
    .line 184
    if-eqz v11, :cond_5

    .line 185
    .line 186
    array-length v11, v11

    .line 187
    if-le v11, v8, :cond_5

    .line 188
    .line 189
    aget-object v10, v10, v8

    .line 190
    .line 191
    iput-object v10, v9, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->src_warp_points:[F

    .line 192
    .line 193
    invoke-virtual {p0}, Ll/omw;->f()[[F

    .line 194
    .line 195
    .line 196
    move-result-object v10

    .line 197
    aget-object v10, v10, v8

    .line 198
    .line 199
    iput-object v10, v9, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->dst_warp_points:[F

    .line 200
    .line 201
    :cond_5
    invoke-interface {v2, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    add-int/lit8 v8, v8, 0x1

    .line 205
    .line 206
    goto/16 :goto_0

    .line 207
    .line 208
    :cond_6
    invoke-virtual {v1, v2}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->dispatchFaceInfo(Ljava/util/List;)V

    .line 209
    .line 210
    .line 211
    return-void

    .line 212
    :cond_7
    invoke-virtual {p0}, Ll/omw;->n()I

    .line 213
    .line 214
    .line 215
    move-result v3

    .line 216
    if-gtz v3, :cond_8

    .line 217
    .line 218
    invoke-virtual {v0}, Lcom/momo/xeengine/XE3DEngine;->isRunning()Z

    .line 219
    .line 220
    .line 221
    move-result p0

    .line 222
    if-eqz p0, :cond_11

    .line 223
    .line 224
    const/4 p0, 0x0

    .line 225
    invoke-virtual {v1, p0}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->dispatchFaceInfo(Ljava/util/List;)V

    .line 226
    .line 227
    .line 228
    return-void

    .line 229
    :cond_8
    move v0, v7

    .line 230
    :goto_1
    if-ge v0, v3, :cond_10

    .line 231
    .line 232
    invoke-virtual {p0, v0}, Ll/omw;->j(I)Ll/nuf;

    .line 233
    .line 234
    .line 235
    move-result-object v8

    .line 236
    invoke-virtual {p0}, Ll/omw;->s()Lcom/momocv/videoprocessor/VideoInfo;

    .line 237
    .line 238
    .line 239
    move-result-object v9

    .line 240
    iget-object v9, v9, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    .line 241
    .line 242
    aget-object v9, v9, v0

    .line 243
    .line 244
    if-nez v8, :cond_9

    .line 245
    .line 246
    goto/16 :goto_5

    .line 247
    .line 248
    :cond_9
    new-instance v10, Lcom/momo/xeengine/cv/bean/XEFaceInfo;

    .line 249
    .line 250
    invoke-direct {v10}, Lcom/momo/xeengine/cv/bean/XEFaceInfo;-><init>()V

    .line 251
    .line 252
    .line 253
    invoke-static {p0, v0}, Lcom/core/glcore/util/XEFaceInfoHelper;->adjustState(Ll/omw;I)I

    .line 254
    .line 255
    .line 256
    move-result v11

    .line 257
    iput v11, v10, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->expression:I

    .line 258
    .line 259
    invoke-virtual {v8}, Ll/nuf;->A()[F

    .line 260
    .line 261
    .line 262
    move-result-object v11

    .line 263
    if-nez v11, :cond_a

    .line 264
    .line 265
    invoke-virtual {v8}, Ll/nuf;->l()[F

    .line 266
    .line 267
    .line 268
    move-result-object v11

    .line 269
    goto :goto_2

    .line 270
    :cond_a
    invoke-virtual {v8}, Ll/nuf;->A()[F

    .line 271
    .line 272
    .line 273
    move-result-object v11

    .line 274
    :goto_2
    iput-object v11, v10, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->landmarks68:[F

    .line 275
    .line 276
    invoke-virtual {v8}, Ll/nuf;->B()[F

    .line 277
    .line 278
    .line 279
    move-result-object v11

    .line 280
    if-nez v11, :cond_b

    .line 281
    .line 282
    invoke-virtual {v8}, Ll/nuf;->m()[F

    .line 283
    .line 284
    .line 285
    move-result-object v11

    .line 286
    goto :goto_3

    .line 287
    :cond_b
    invoke-virtual {v8}, Ll/nuf;->B()[F

    .line 288
    .line 289
    .line 290
    move-result-object v11

    .line 291
    :goto_3
    iput-object v11, v10, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->landmarks96:[F

    .line 292
    .line 293
    iget-object v9, v9, Lcom/momocv/SingleFaceInfo;->landmarks_137_:[F

    .line 294
    .line 295
    iput-object v9, v10, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->landmarks137:[F

    .line 296
    .line 297
    invoke-virtual {v8}, Ll/nuf;->x()I

    .line 298
    .line 299
    .line 300
    move-result v9

    .line 301
    iput v9, v10, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->trackId:I

    .line 302
    .line 303
    invoke-virtual {v8}, Ll/nuf;->c()[F

    .line 304
    .line 305
    .line 306
    move-result-object v9

    .line 307
    if-eqz v9, :cond_c

    .line 308
    .line 309
    array-length v11, v9

    .line 310
    if-lt v11, v5, :cond_c

    .line 311
    .line 312
    aget v11, v9, v7

    .line 313
    .line 314
    iput v11, v10, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->pitch:F

    .line 315
    .line 316
    aget v11, v9, v6

    .line 317
    .line 318
    iput v11, v10, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->yaw:F

    .line 319
    .line 320
    aget v9, v9, v4

    .line 321
    .line 322
    iput v9, v10, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->roll:F

    .line 323
    .line 324
    :cond_c
    invoke-virtual {v8}, Ll/nuf;->e()[F

    .line 325
    .line 326
    .line 327
    move-result-object v9

    .line 328
    aget v9, v9, v7

    .line 329
    .line 330
    invoke-virtual {v8}, Ll/nuf;->e()[F

    .line 331
    .line 332
    .line 333
    move-result-object v11

    .line 334
    aget v11, v11, v6

    .line 335
    .line 336
    invoke-virtual {v8}, Ll/nuf;->e()[F

    .line 337
    .line 338
    .line 339
    move-result-object v12

    .line 340
    aget v12, v12, v4

    .line 341
    .line 342
    invoke-virtual {v8}, Ll/nuf;->e()[F

    .line 343
    .line 344
    .line 345
    move-result-object v13

    .line 346
    aget v13, v13, v7

    .line 347
    .line 348
    sub-float/2addr v12, v13

    .line 349
    invoke-virtual {v8}, Ll/nuf;->e()[F

    .line 350
    .line 351
    .line 352
    move-result-object v13

    .line 353
    aget v13, v13, v5

    .line 354
    .line 355
    invoke-virtual {v8}, Ll/nuf;->e()[F

    .line 356
    .line 357
    .line 358
    move-result-object v14

    .line 359
    aget v14, v14, v6

    .line 360
    .line 361
    sub-float/2addr v13, v14

    .line 362
    const/4 v14, 0x4

    .line 363
    new-array v14, v14, [F

    .line 364
    .line 365
    aput v9, v14, v7

    .line 366
    .line 367
    aput v11, v14, v6

    .line 368
    .line 369
    aput v12, v14, v4

    .line 370
    .line 371
    aput v13, v14, v5

    .line 372
    .line 373
    iput-object v14, v10, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->faceBounds:[F

    .line 374
    .line 375
    invoke-virtual {v8}, Ll/nuf;->b()[F

    .line 376
    .line 377
    .line 378
    move-result-object v9

    .line 379
    iput-object v9, v10, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->cameraMatrix:[F

    .line 380
    .line 381
    invoke-virtual {v8}, Ll/nuf;->u()[F

    .line 382
    .line 383
    .line 384
    move-result-object v9

    .line 385
    iput-object v9, v10, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->rotationMatrix:[F

    .line 386
    .line 387
    invoke-virtual {v8}, Ll/nuf;->v()[F

    .line 388
    .line 389
    .line 390
    move-result-object v9

    .line 391
    iput-object v9, v10, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->rotationVector:[F

    .line 392
    .line 393
    invoke-virtual {v8}, Ll/nuf;->y()[F

    .line 394
    .line 395
    .line 396
    move-result-object v9

    .line 397
    iput-object v9, v10, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->translationVector:[F

    .line 398
    .line 399
    invoke-virtual {v8}, Ll/nuf;->s()[F

    .line 400
    .line 401
    .line 402
    move-result-object v9

    .line 403
    iput-object v9, v10, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->projectionMatrix:[F

    .line 404
    .line 405
    invoke-virtual {v8}, Ll/nuf;->o()[F

    .line 406
    .line 407
    .line 408
    move-result-object v8

    .line 409
    iput-object v8, v10, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->modelViewMatrix:[F

    .line 410
    .line 411
    invoke-virtual {p0}, Ll/omw;->q()Ll/evf;

    .line 412
    .line 413
    .line 414
    move-result-object v8

    .line 415
    if-eqz v8, :cond_d

    .line 416
    .line 417
    invoke-virtual {p0}, Ll/omw;->q()Ll/evf;

    .line 418
    .line 419
    .line 420
    move-result-object v8

    .line 421
    invoke-virtual {v8}, Ll/evf;->b()[F

    .line 422
    .line 423
    .line 424
    move-result-object v8

    .line 425
    iput-object v8, v10, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->facerigStates:[F

    .line 426
    .line 427
    :cond_d
    invoke-virtual {p0}, Ll/omw;->r()[[F

    .line 428
    .line 429
    .line 430
    move-result-object v8

    .line 431
    invoke-virtual {p0}, Ll/omw;->f()[[F

    .line 432
    .line 433
    .line 434
    move-result-object v9

    .line 435
    if-eqz v8, :cond_e

    .line 436
    .line 437
    array-length v8, v8

    .line 438
    if-le v8, v0, :cond_e

    .line 439
    .line 440
    if-eqz v9, :cond_e

    .line 441
    .line 442
    array-length v8, v9

    .line 443
    if-le v8, v0, :cond_e

    .line 444
    .line 445
    invoke-virtual {p0}, Ll/omw;->r()[[F

    .line 446
    .line 447
    .line 448
    move-result-object v8

    .line 449
    aget-object v8, v8, v0

    .line 450
    .line 451
    iput-object v8, v10, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->src_warp_points:[F

    .line 452
    .line 453
    invoke-virtual {p0}, Ll/omw;->f()[[F

    .line 454
    .line 455
    .line 456
    move-result-object v8

    .line 457
    aget-object v8, v8, v0

    .line 458
    .line 459
    iput-object v8, v10, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->dst_warp_points:[F

    .line 460
    .line 461
    :cond_e
    iget-object v8, v10, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->facerigStates:[F

    .line 462
    .line 463
    if-nez v8, :cond_f

    .line 464
    .line 465
    move v8, v7

    .line 466
    goto :goto_4

    .line 467
    :cond_f
    move v8, v6

    .line 468
    :goto_4
    iput v8, v10, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->meType:I

    .line 469
    .line 470
    invoke-interface {v2, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 471
    .line 472
    .line 473
    :goto_5
    add-int/lit8 v0, v0, 0x1

    .line 474
    .line 475
    goto/16 :goto_1

    .line 476
    .line 477
    :cond_10
    invoke-virtual {v1, v2}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->dispatchFaceInfo(Ljava/util/List;)V

    .line 478
    .line 479
    .line 480
    :cond_11
    :goto_6
    return-void
.end method

.method private static updateEyeState(Ll/nuf;)I
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/nuf;->n()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/nuf;->t()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    float-to-double v0, v0

    .line 10
    const-wide v2, 0x3fe6666666666666L    # 0.7

    .line 11
    .line 12
    .line 13
    .line 14
    .line 15
    cmpl-double v0, v0, v2

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    const/4 v4, 0x1

    .line 19
    if-ltz v0, :cond_0

    .line 20
    .line 21
    sput v4, Lcom/core/glcore/util/XEFaceInfoHelper;->leftEyeOpenState:I

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    sput v1, Lcom/core/glcore/util/XEFaceInfoHelper;->leftEyeOpenState:I

    .line 25
    .line 26
    :goto_0
    float-to-double v5, p0

    .line 27
    cmpl-double p0, v5, v2

    .line 28
    .line 29
    if-ltz p0, :cond_1

    .line 30
    .line 31
    sput v4, Lcom/core/glcore/util/XEFaceInfoHelper;->rightEyeOpenState:I

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    sput v1, Lcom/core/glcore/util/XEFaceInfoHelper;->rightEyeOpenState:I

    .line 35
    .line 36
    :goto_1
    sget p0, Lcom/core/glcore/util/XEFaceInfoHelper;->leftEyeOpenState:I

    .line 37
    .line 38
    if-nez p0, :cond_2

    .line 39
    .line 40
    const/4 p0, 0x4

    .line 41
    goto :goto_2

    .line 42
    :cond_2
    const/16 p0, 0x8

    .line 43
    .line 44
    :goto_2
    sget v0, Lcom/core/glcore/util/XEFaceInfoHelper;->rightEyeOpenState:I

    .line 45
    .line 46
    if-nez v0, :cond_3

    .line 47
    .line 48
    or-int/lit8 p0, p0, 0x20

    .line 49
    .line 50
    return p0

    .line 51
    :cond_3
    or-int/lit8 p0, p0, 0x40

    .line 52
    .line 53
    return p0
.end method

.method private static updateMouseState([F)I
    .locals 11

    .line 1
    const/4 v0, 0x2

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    sget v1, Lcom/core/glcore/util/XEFaceInfoHelper;->INDEX_FACE_LEFT:I

    .line 6
    .line 7
    aget v2, p0, v1

    .line 8
    .line 9
    add-int/lit8 v1, v1, 0x44

    .line 10
    .line 11
    aget v1, p0, v1

    .line 12
    .line 13
    sget v3, Lcom/core/glcore/util/XEFaceInfoHelper;->INDEX_FACE_RIGHT:I

    .line 14
    .line 15
    aget v4, p0, v3

    .line 16
    .line 17
    add-int/lit8 v3, v3, 0x44

    .line 18
    .line 19
    aget v3, p0, v3

    .line 20
    .line 21
    sget v5, Lcom/core/glcore/util/XEFaceInfoHelper;->INDEX_MOUSE_DOWN:I

    .line 22
    .line 23
    aget v6, p0, v5

    .line 24
    .line 25
    add-int/lit8 v5, v5, 0x44

    .line 26
    .line 27
    aget v5, p0, v5

    .line 28
    .line 29
    sget v7, Lcom/core/glcore/util/XEFaceInfoHelper;->INDEX_MOUSE_UP:I

    .line 30
    .line 31
    aget v8, p0, v7

    .line 32
    .line 33
    add-int/lit8 v7, v7, 0x44

    .line 34
    .line 35
    aget p0, p0, v7

    .line 36
    .line 37
    sub-float/2addr v2, v4

    .line 38
    float-to-double v9, v2

    .line 39
    sub-float/2addr v1, v3

    .line 40
    float-to-double v1, v1

    .line 41
    invoke-static {v9, v10, v1, v2}, Ljava/lang/Math;->hypot(DD)D

    .line 42
    .line 43
    .line 44
    move-result-wide v1

    .line 45
    double-to-float v1, v1

    .line 46
    sub-float/2addr v8, v6

    .line 47
    float-to-double v2, v8

    .line 48
    sub-float/2addr p0, v5

    .line 49
    float-to-double v4, p0

    .line 50
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->hypot(DD)D

    .line 51
    .line 52
    .line 53
    move-result-wide v2

    .line 54
    double-to-float p0, v2

    .line 55
    const/high16 v2, 0x3f800000    # 1.0f

    .line 56
    .line 57
    mul-float/2addr v1, v2

    .line 58
    const/high16 v2, 0x41200000    # 10.0f

    .line 59
    .line 60
    div-float/2addr v1, v2

    .line 61
    cmpl-float p0, p0, v1

    .line 62
    .line 63
    if-lez p0, :cond_1

    .line 64
    .line 65
    const/4 p0, 0x1

    .line 66
    return p0

    .line 67
    :cond_1
    return v0
.end method

.method private static updateNodState(Ll/nuf;)I
    .locals 10

    .line 1
    invoke-virtual {p0}, Ll/nuf;->c()[F

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_c

    .line 7
    .line 8
    array-length v0, v0

    .line 9
    const/4 v2, 0x3

    .line 10
    if-lt v0, v2, :cond_c

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/nuf;->c()[F

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    aget v0, v0, v1

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/nuf;->c()[F

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    const/4 v4, 0x1

    .line 23
    aget v3, v3, v4

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/nuf;->c()[F

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const/4 v5, 0x2

    .line 30
    aget p0, p0, v5

    .line 31
    .line 32
    const/high16 v5, 0x41200000    # 10.0f

    .line 33
    .line 34
    cmpl-float v6, v3, v5

    .line 35
    .line 36
    const/16 v7, 0x3e8

    .line 37
    .line 38
    const/high16 v8, 0x3f800000    # 1.0f

    .line 39
    .line 40
    if-lez v6, :cond_0

    .line 41
    .line 42
    sub-float v6, v3, v0

    .line 43
    .line 44
    cmpl-float v6, v6, v8

    .line 45
    .line 46
    if-gtz v6, :cond_1

    .line 47
    .line 48
    :cond_0
    const/high16 v6, -0x3ee00000    # -10.0f

    .line 49
    .line 50
    cmpg-float v9, v3, v6

    .line 51
    .line 52
    if-gez v9, :cond_2

    .line 53
    .line 54
    sub-float/2addr v3, v0

    .line 55
    cmpg-float v3, v3, v8

    .line 56
    .line 57
    if-gez v3, :cond_2

    .line 58
    .line 59
    :cond_1
    sput v7, Lcom/core/glcore/util/XEFaceInfoHelper;->nodState:I

    .line 60
    .line 61
    return v1

    .line 62
    :cond_2
    cmpl-float v3, p0, v5

    .line 63
    .line 64
    if-lez v3, :cond_3

    .line 65
    .line 66
    sub-float v3, p0, v0

    .line 67
    .line 68
    cmpl-float v3, v3, v8

    .line 69
    .line 70
    if-gtz v3, :cond_4

    .line 71
    .line 72
    :cond_3
    cmpg-float v3, p0, v6

    .line 73
    .line 74
    if-gez v3, :cond_5

    .line 75
    .line 76
    sub-float/2addr p0, v0

    .line 77
    cmpg-float p0, p0, v8

    .line 78
    .line 79
    if-gez p0, :cond_5

    .line 80
    .line 81
    :cond_4
    sput v7, Lcom/core/glcore/util/XEFaceInfoHelper;->nodState:I

    .line 82
    .line 83
    return v1

    .line 84
    :cond_5
    sget-object p0, Lcom/core/glcore/util/XEFaceInfoHelper;->pitchValues:Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    const/4 v3, 0x4

    .line 91
    if-le p0, v3, :cond_6

    .line 92
    .line 93
    sget-object p0, Lcom/core/glcore/util/XEFaceInfoHelper;->pitchValues:Ljava/util/List;

    .line 94
    .line 95
    invoke-interface {p0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    :cond_6
    sget-object p0, Lcom/core/glcore/util/XEFaceInfoHelper;->pitchValues:Ljava/util/List;

    .line 99
    .line 100
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    new-instance p0, Ljava/util/ArrayList;

    .line 108
    .line 109
    sget-object v0, Lcom/core/glcore/util/XEFaceInfoHelper;->pitchValues:Ljava/util/List;

    .line 110
    .line 111
    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 112
    .line 113
    .line 114
    invoke-static {p0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 115
    .line 116
    .line 117
    sget-object v0, Lcom/core/glcore/util/XEFaceInfoHelper;->pitchValues:Ljava/util/List;

    .line 118
    .line 119
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    shr-int/2addr v0, v4

    .line 124
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    check-cast p0, Ljava/lang/Float;

    .line 129
    .line 130
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    sget v0, Lcom/core/glcore/util/XEFaceInfoHelper;->nodState:I

    .line 135
    .line 136
    packed-switch v0, :pswitch_data_0

    .line 137
    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :pswitch_0
    sget v0, Lcom/core/glcore/util/XEFaceInfoHelper;->lastPitch:F

    .line 142
    .line 143
    sub-float v0, p0, v0

    .line 144
    .line 145
    cmpg-float v0, v0, v8

    .line 146
    .line 147
    if-gtz v0, :cond_8

    .line 148
    .line 149
    sput v1, Lcom/core/glcore/util/XEFaceInfoHelper;->nodFailedCount:I

    .line 150
    .line 151
    sget v0, Lcom/core/glcore/util/XEFaceInfoHelper;->nodStartPitch:I

    .line 152
    .line 153
    int-to-float v0, v0

    .line 154
    sub-float v0, p0, v0

    .line 155
    .line 156
    const/4 v2, 0x0

    .line 157
    cmpl-float v0, v0, v2

    .line 158
    .line 159
    if-lez v0, :cond_b

    .line 160
    .line 161
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 162
    .line 163
    .line 164
    move-result-wide v2

    .line 165
    sget-wide v4, Lcom/core/glcore/util/XEFaceInfoHelper;->nodStartTime:J

    .line 166
    .line 167
    sub-long/2addr v2, v4

    .line 168
    const-wide/16 v4, 0x7d0

    .line 169
    .line 170
    cmp-long v0, v2, v4

    .line 171
    .line 172
    if-gez v0, :cond_7

    .line 173
    .line 174
    sput v7, Lcom/core/glcore/util/XEFaceInfoHelper;->nodState:I

    .line 175
    .line 176
    const/16 p0, 0x800

    .line 177
    .line 178
    return p0

    .line 179
    :cond_7
    sput v7, Lcom/core/glcore/util/XEFaceInfoHelper;->nodState:I

    .line 180
    .line 181
    goto :goto_0

    .line 182
    :cond_8
    sget v0, Lcom/core/glcore/util/XEFaceInfoHelper;->nodFailedCount:I

    .line 183
    .line 184
    add-int/2addr v0, v4

    .line 185
    sput v0, Lcom/core/glcore/util/XEFaceInfoHelper;->nodFailedCount:I

    .line 186
    .line 187
    if-le v0, v4, :cond_b

    .line 188
    .line 189
    sput v7, Lcom/core/glcore/util/XEFaceInfoHelper;->nodState:I

    .line 190
    .line 191
    goto :goto_0

    .line 192
    :pswitch_1
    sget v0, Lcom/core/glcore/util/XEFaceInfoHelper;->lastPitch:F

    .line 193
    .line 194
    sub-float v0, p0, v0

    .line 195
    .line 196
    cmpl-float v0, v0, v8

    .line 197
    .line 198
    if-ltz v0, :cond_9

    .line 199
    .line 200
    sput v1, Lcom/core/glcore/util/XEFaceInfoHelper;->nodFailedCount:I

    .line 201
    .line 202
    goto :goto_0

    .line 203
    :cond_9
    sget v0, Lcom/core/glcore/util/XEFaceInfoHelper;->nodStartPitch:I

    .line 204
    .line 205
    add-int/2addr v0, v2

    .line 206
    int-to-float v0, v0

    .line 207
    cmpl-float v0, p0, v0

    .line 208
    .line 209
    if-lez v0, :cond_a

    .line 210
    .line 211
    const/16 v0, 0x3ea

    .line 212
    .line 213
    sput v0, Lcom/core/glcore/util/XEFaceInfoHelper;->nodState:I

    .line 214
    .line 215
    sput v1, Lcom/core/glcore/util/XEFaceInfoHelper;->nodStartPitch:I

    .line 216
    .line 217
    goto :goto_0

    .line 218
    :cond_a
    sget v0, Lcom/core/glcore/util/XEFaceInfoHelper;->nodFailedCount:I

    .line 219
    .line 220
    add-int/2addr v0, v4

    .line 221
    sput v0, Lcom/core/glcore/util/XEFaceInfoHelper;->nodFailedCount:I

    .line 222
    .line 223
    if-le v0, v4, :cond_b

    .line 224
    .line 225
    sput v7, Lcom/core/glcore/util/XEFaceInfoHelper;->nodState:I

    .line 226
    .line 227
    goto :goto_0

    .line 228
    :pswitch_2
    sget v0, Lcom/core/glcore/util/XEFaceInfoHelper;->lastPitch:F

    .line 229
    .line 230
    sub-float v0, p0, v0

    .line 231
    .line 232
    const/high16 v2, 0x40000000    # 2.0f

    .line 233
    .line 234
    cmpl-float v0, v0, v2

    .line 235
    .line 236
    if-ltz v0, :cond_b

    .line 237
    .line 238
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 239
    .line 240
    .line 241
    move-result-wide v2

    .line 242
    sput-wide v2, Lcom/core/glcore/util/XEFaceInfoHelper;->nodStartTime:J

    .line 243
    .line 244
    const/16 v0, 0x3e9

    .line 245
    .line 246
    sput v0, Lcom/core/glcore/util/XEFaceInfoHelper;->nodState:I

    .line 247
    .line 248
    :cond_b
    :goto_0
    sput p0, Lcom/core/glcore/util/XEFaceInfoHelper;->lastPitch:F

    .line 249
    .line 250
    :cond_c
    return v1

    .line 251
    :pswitch_data_0
    .packed-switch 0x3e8
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
