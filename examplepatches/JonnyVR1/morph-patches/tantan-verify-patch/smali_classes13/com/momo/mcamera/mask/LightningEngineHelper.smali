.class public Lcom/momo/mcamera/mask/LightningEngineHelper;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/mask/detect/IPatternDetect$ExpressDetectListener;
.implements Lcom/momo/mcamera/mask/detect/IDetectManager$IGestureDetectListener;
.implements Lcom/momo/mcamera/mask/detect/IDetectManager$IObjectDetectListener;
.implements Lcom/momo/mcamera/mask/detect/IDetectManager$IPickNoseDetectListener;


# static fields
.field private static final PICK_NOSE_LEFT:Ljava/lang/String; = "pick_nose_left"

.field private static final PICK_NOSE_RIGHT:Ljava/lang/String; = "pick_nose_right"


# instance fields
.field private final DUCK_FACE:I

.field private final EYE_BLINK:I

.field private final FACE_STATE_CLOSE:I

.field private final FACE_STATE_OPEN:I

.field private INDEX_FACE_LEFT:I

.field private INDEX_FACE_RIGHT:I

.field private INDEX_MOUSE_DOWN:I

.field private INDEX_MOUSE_UP:I

.field private final LEFT_EYE_BLINK:I

.field private final LEFT_EYE_CLOSING:I

.field private final LEFT_EYE_OPEN:I

.field private final MOUSE_STATE_CLOSE:I

.field private final MOUSE_STATE_OPEN:I

.field private final NOD:I

.field private final NOD_STATE_DOWN:I

.field private final NOD_STATE_POSSIBLE:I

.field private final NOD_STATE_UP:I

.field private final POINTS_LENGTH:I

.field private final RIGHT_EYE_BLINK:I

.field private final RIGHT_EYE_CLOSING:I

.field private final RIGHT_EYE_OPEN:I

.field private final SMILE:I

.field private final cartoonMatrix:[F

.field private final cryingMatrix:[F

.field private duckFaceState:I

.field private faceMatrix:[[F

.field private lastPitch:F

.field private leftEyeBlinkCount:I

.field private leftEyeBlinkState:I

.field private leftEyeOpenState:I

.field private final lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

.field private mouseOpenState:I

.field private mouthMatrix:[[F

.field private nodFailedCount:I

.field private nodStartPitch:I

.field private nodStartTime:J

.field private nodState:I

.field private pitchValues:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private rightEyeBlinkCount:I

.field private rightEyeBlinkState:I

.field private rightEyeOpenState:I

.field private final segMatrix:[F

.field private smileState:I

.field private xeCartoonFaceInfo:Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;


# direct methods
.method public constructor <init>(Lcom/momo/xeengine/lightningrender/ILightningRender;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->MOUSE_STATE_OPEN:I

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    iput v1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->MOUSE_STATE_CLOSE:I

    .line 9
    .line 10
    const/4 v2, 0x4

    .line 11
    iput v2, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->LEFT_EYE_OPEN:I

    .line 12
    .line 13
    const/16 v2, 0x8

    .line 14
    .line 15
    iput v2, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->LEFT_EYE_CLOSING:I

    .line 16
    .line 17
    const/16 v2, 0x10

    .line 18
    .line 19
    iput v2, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->LEFT_EYE_BLINK:I

    .line 20
    .line 21
    const/16 v3, 0x20

    .line 22
    .line 23
    iput v3, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->RIGHT_EYE_OPEN:I

    .line 24
    .line 25
    const/16 v3, 0x40

    .line 26
    .line 27
    iput v3, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->RIGHT_EYE_CLOSING:I

    .line 28
    .line 29
    const/16 v3, 0x80

    .line 30
    .line 31
    iput v3, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->RIGHT_EYE_BLINK:I

    .line 32
    .line 33
    const/16 v3, 0x100

    .line 34
    .line 35
    iput v3, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->EYE_BLINK:I

    .line 36
    .line 37
    const/16 v3, 0x200

    .line 38
    .line 39
    iput v3, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->SMILE:I

    .line 40
    .line 41
    const/16 v3, 0x400

    .line 42
    .line 43
    iput v3, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->DUCK_FACE:I

    .line 44
    .line 45
    const/16 v3, 0x800

    .line 46
    .line 47
    iput v3, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->NOD:I

    .line 48
    .line 49
    const/4 v3, 0x0

    .line 50
    iput v3, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->INDEX_FACE_LEFT:I

    .line 51
    .line 52
    iput v2, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->INDEX_FACE_RIGHT:I

    .line 53
    .line 54
    const/16 v2, 0x3e

    .line 55
    .line 56
    iput v2, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->INDEX_MOUSE_UP:I

    .line 57
    .line 58
    const/16 v2, 0x42

    .line 59
    .line 60
    iput v2, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->INDEX_MOUSE_DOWN:I

    .line 61
    .line 62
    iput v1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->mouseOpenState:I

    .line 63
    .line 64
    const/16 v1, 0x44

    .line 65
    .line 66
    iput v1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->POINTS_LENGTH:I

    .line 67
    .line 68
    iput v3, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->FACE_STATE_OPEN:I

    .line 69
    .line 70
    iput v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->FACE_STATE_CLOSE:I

    .line 71
    .line 72
    const/16 v1, 0x3e8

    .line 73
    .line 74
    iput v1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->NOD_STATE_POSSIBLE:I

    .line 75
    .line 76
    const/16 v2, 0x3e9

    .line 77
    .line 78
    iput v2, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->NOD_STATE_DOWN:I

    .line 79
    .line 80
    const/16 v2, 0x3ea

    .line 81
    .line 82
    iput v2, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->NOD_STATE_UP:I

    .line 83
    .line 84
    iput v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->smileState:I

    .line 85
    .line 86
    iput v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->duckFaceState:I

    .line 87
    .line 88
    iput v3, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->leftEyeOpenState:I

    .line 89
    .line 90
    iput v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->leftEyeBlinkState:I

    .line 91
    .line 92
    iput v3, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->leftEyeBlinkCount:I

    .line 93
    .line 94
    iput v3, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->rightEyeOpenState:I

    .line 95
    .line 96
    iput v3, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->rightEyeBlinkState:I

    .line 97
    .line 98
    iput v3, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->rightEyeBlinkCount:I

    .line 99
    .line 100
    iput v1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->nodState:I

    .line 101
    .line 102
    new-instance v0, Ljava/util/ArrayList;

    .line 103
    .line 104
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 105
    .line 106
    .line 107
    iput-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->pitchValues:Ljava/util/List;

    .line 108
    .line 109
    iput v3, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->nodStartPitch:I

    .line 110
    .line 111
    iput v3, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->nodFailedCount:I

    .line 112
    .line 113
    const-wide/16 v0, 0x0

    .line 114
    .line 115
    iput-wide v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->nodStartTime:J

    .line 116
    .line 117
    const/4 v0, 0x0

    .line 118
    iput v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lastPitch:F

    .line 119
    .line 120
    const/16 v0, 0x9

    .line 121
    .line 122
    new-array v1, v0, [F

    .line 123
    .line 124
    fill-array-data v1, :array_0

    .line 125
    .line 126
    .line 127
    new-array v2, v0, [F

    .line 128
    .line 129
    fill-array-data v2, :array_1

    .line 130
    .line 131
    .line 132
    new-array v3, v0, [F

    .line 133
    .line 134
    fill-array-data v3, :array_2

    .line 135
    .line 136
    .line 137
    filled-new-array {v1, v2, v3}, [[F

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    iput-object v1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->faceMatrix:[[F

    .line 142
    .line 143
    new-array v1, v0, [F

    .line 144
    .line 145
    fill-array-data v1, :array_3

    .line 146
    .line 147
    .line 148
    iput-object v1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->cartoonMatrix:[F

    .line 149
    .line 150
    new-array v1, v0, [F

    .line 151
    .line 152
    fill-array-data v1, :array_4

    .line 153
    .line 154
    .line 155
    iput-object v1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->segMatrix:[F

    .line 156
    .line 157
    new-array v0, v0, [F

    .line 158
    .line 159
    fill-array-data v0, :array_5

    .line 160
    .line 161
    .line 162
    iput-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->cryingMatrix:[F

    .line 163
    .line 164
    iput-object p1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 165
    .line 166
    return-void

    .line 167
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    :array_3
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 234
    .line 235
    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    .line 243
    .line 244
    .line 245
    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    .line 255
    :array_4
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 256
    .line 257
    .line 258
    .line 259
    .line 260
    .line 261
    .line 262
    .line 263
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
    .line 274
    .line 275
    .line 276
    .line 277
    :array_5
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private adjustState(Ll/omw;I)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    goto/16 :goto_4

    .line 5
    .line 6
    :cond_0
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-lt p2, v1, :cond_1

    .line 11
    .line 12
    move p2, v0

    .line 13
    :cond_1
    invoke-virtual {p1, p2}, Ll/omw;->j(I)Ll/nuf;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    if-eqz p1, :cond_b

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/nuf;->l()[F

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-direct {p0, p2}, Lcom/momo/mcamera/mask/LightningEngineHelper;->updateMouseState([F)I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    const/4 v1, 0x2

    .line 28
    iput v1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->smileState:I

    .line 29
    .line 30
    iput v1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->duckFaceState:I

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/nuf;->d()I

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
    iput v3, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->duckFaceState:I

    .line 40
    .line 41
    or-int/lit16 p2, p2, 0x400

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    invoke-virtual {p1}, Ll/nuf;->d()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-ne v2, v1, :cond_3

    .line 49
    .line 50
    iput v3, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->smileState:I

    .line 51
    .line 52
    or-int/lit16 p2, p2, 0x200

    .line 53
    .line 54
    :cond_3
    :goto_0
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/LightningEngineHelper;->updateEyeState(Ll/nuf;)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    or-int/2addr p2, v1

    .line 59
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/LightningEngineHelper;->updateNodState(Ll/nuf;)I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    or-int/2addr p1, p2

    .line 64
    iget p2, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->rightEyeOpenState:I

    .line 65
    .line 66
    if-nez p2, :cond_5

    .line 67
    .line 68
    iget v1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->leftEyeOpenState:I

    .line 69
    .line 70
    if-ne v1, v3, :cond_5

    .line 71
    .line 72
    iget v1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->leftEyeBlinkCount:I

    .line 73
    .line 74
    add-int/2addr v1, v3

    .line 75
    iput v1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->leftEyeBlinkCount:I

    .line 76
    .line 77
    if-le v1, v3, :cond_4

    .line 78
    .line 79
    iput v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->leftEyeBlinkState:I

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_4
    iput v3, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->leftEyeBlinkState:I

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_5
    iput v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->leftEyeBlinkCount:I

    .line 86
    .line 87
    iput v3, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->leftEyeBlinkState:I

    .line 88
    .line 89
    :goto_1
    if-ne p2, v3, :cond_7

    .line 90
    .line 91
    iget p2, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->leftEyeOpenState:I

    .line 92
    .line 93
    if-nez p2, :cond_7

    .line 94
    .line 95
    iget p2, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->rightEyeBlinkCount:I

    .line 96
    .line 97
    add-int/2addr p2, v3

    .line 98
    iput p2, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->rightEyeBlinkCount:I

    .line 99
    .line 100
    if-le p2, v3, :cond_6

    .line 101
    .line 102
    iput v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->rightEyeBlinkState:I

    .line 103
    .line 104
    goto :goto_2

    .line 105
    :cond_6
    iput v3, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->rightEyeBlinkState:I

    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_7
    iput v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->rightEyeBlinkCount:I

    .line 109
    .line 110
    iput v3, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->rightEyeBlinkState:I

    .line 111
    .line 112
    :goto_2
    iget p2, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->leftEyeBlinkState:I

    .line 113
    .line 114
    if-nez p2, :cond_8

    .line 115
    .line 116
    or-int/lit8 p1, p1, 0x10

    .line 117
    .line 118
    move v0, v3

    .line 119
    :cond_8
    iget p0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->rightEyeBlinkState:I

    .line 120
    .line 121
    if-nez p0, :cond_9

    .line 122
    .line 123
    or-int/lit16 p1, p1, 0x80

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
    or-int/lit16 p0, p1, 0x100

    .line 130
    .line 131
    return p0

    .line 132
    :cond_a
    return p1

    .line 133
    :cond_b
    :goto_4
    return v0
.end method

.method private setHandGestureInfo([Lcom/momocv/MMBox;)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 13
    .line 14
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    if-eqz p1, :cond_3

    .line 19
    .line 20
    new-instance v0, Ljava/util/ArrayList;

    .line 21
    .line 22
    array-length v1, p1

    .line 23
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 24
    .line 25
    .line 26
    array-length v1, p1

    .line 27
    const/4 v2, 0x0

    .line 28
    move v3, v2

    .line 29
    :goto_0
    if-ge v3, v1, :cond_2

    .line 30
    .line 31
    aget-object v4, p1, v3

    .line 32
    .line 33
    if-eqz v4, :cond_1

    .line 34
    .line 35
    new-instance v5, Lcom/momo/xeengine/cv/bean/XEGestureInfo;

    .line 36
    .line 37
    invoke-direct {v5}, Lcom/momo/xeengine/cv/bean/XEGestureInfo;-><init>()V

    .line 38
    .line 39
    .line 40
    iget-object v6, v4, Lcom/momocv/MMBox;->class_name_:Ljava/lang/String;

    .line 41
    .line 42
    iput-object v6, v5, Lcom/momo/xeengine/cv/bean/XEGestureInfo;->type:Ljava/lang/String;

    .line 43
    .line 44
    iget v6, v4, Lcom/momocv/MMRect;->x_:I

    .line 45
    .line 46
    int-to-float v6, v6

    .line 47
    iget v7, v4, Lcom/momocv/MMRect;->y_:I

    .line 48
    .line 49
    int-to-float v7, v7

    .line 50
    iget v8, v4, Lcom/momocv/MMRect;->width_:I

    .line 51
    .line 52
    int-to-float v8, v8

    .line 53
    iget v9, v4, Lcom/momocv/MMRect;->height_:I

    .line 54
    .line 55
    int-to-float v9, v9

    .line 56
    const/4 v10, 0x4

    .line 57
    new-array v10, v10, [F

    .line 58
    .line 59
    aput v6, v10, v2

    .line 60
    .line 61
    const/4 v6, 0x1

    .line 62
    aput v7, v10, v6

    .line 63
    .line 64
    const/4 v6, 0x2

    .line 65
    aput v8, v10, v6

    .line 66
    .line 67
    const/4 v6, 0x3

    .line 68
    aput v9, v10, v6

    .line 69
    .line 70
    iput-object v10, v5, Lcom/momo/xeengine/cv/bean/XEGestureInfo;->bounds:[F

    .line 71
    .line 72
    iget v4, v4, Lcom/momocv/MMBox;->score_:F

    .line 73
    .line 74
    iput v4, v5, Lcom/momo/xeengine/cv/bean/XEGestureInfo;->score:F

    .line 75
    .line 76
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_2
    new-instance p1, Ljava/util/ArrayList;

    .line 83
    .line 84
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 85
    .line 86
    .line 87
    new-instance v1, Lcom/momo/xeengine/cv/bean/XEHandInfo;

    .line 88
    .line 89
    invoke-direct {v1}, Lcom/momo/xeengine/cv/bean/XEHandInfo;-><init>()V

    .line 90
    .line 91
    .line 92
    iput-object v0, v1, Lcom/momo/xeengine/cv/bean/XEHandInfo;->gestures:Ljava/util/List;

    .line 93
    .line 94
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    invoke-interface {p0, p1}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchHandInfo(Ljava/util/List;)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_3
    const/4 p1, 0x0

    .line 102
    invoke-interface {p0, p1}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchHandInfo(Ljava/util/List;)V

    .line 103
    .line 104
    .line 105
    :cond_4
    :goto_1
    return-void
.end method

.method private setPickNoseInfo(Lcom/momocv/handdetectlandmark/HandDetectLandmarkPostInfo;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 13
    .line 14
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    if-eqz p1, :cond_2

    .line 19
    .line 20
    iget v0, p1, Lcom/momocv/handdetectlandmark/HandDetectLandmarkPostInfo;->result_:I

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    if-ne v0, v1, :cond_2

    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 28
    .line 29
    .line 30
    new-instance v2, Lcom/momo/xeengine/cv/bean/CVObjectInfo;

    .line 31
    .line 32
    invoke-direct {v2}, Lcom/momo/xeengine/cv/bean/CVObjectInfo;-><init>()V

    .line 33
    .line 34
    .line 35
    iget p1, p1, Lcom/momocv/handdetectlandmark/HandDetectLandmarkPostInfo;->is_righ_nose_:I

    .line 36
    .line 37
    if-ne p1, v1, :cond_1

    .line 38
    .line 39
    const-string p1, "pick_nose_right"

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    const-string p1, "pick_nose_left"

    .line 43
    .line 44
    :goto_0
    invoke-virtual {v2, p1}, Lcom/momo/xeengine/cv/bean/CVObjectInfo;->setType(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    const/4 p1, 0x4

    .line 48
    new-array p1, p1, [F

    .line 49
    .line 50
    fill-array-data p1, :array_0

    .line 51
    .line 52
    .line 53
    invoke-virtual {v2, p1}, Lcom/momo/xeengine/cv/bean/CVObjectInfo;->setBounds([F)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2}, Lcom/momo/xeengine/cv/bean/CVObjectInfo;->getScore()F

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    invoke-virtual {v2, p1}, Lcom/momo/xeengine/cv/bean/CVObjectInfo;->setScore(F)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    invoke-interface {p0, v0}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchObjectInfo(Ljava/util/List;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    const/4 p1, 0x0

    .line 71
    invoke-interface {p0, p1}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchObjectInfo(Ljava/util/List;)V

    .line 72
    .line 73
    .line 74
    :cond_3
    :goto_1
    return-void

    .line 75
    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method private updateEyeState(Ll/nuf;)I
    .locals 7

    .line 1
    invoke-virtual {p1}, Ll/nuf;->n()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Ll/nuf;->t()F

    .line 6
    .line 7
    .line 8
    move-result p1

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
    iput v4, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->leftEyeOpenState:I

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iput v1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->leftEyeOpenState:I

    .line 25
    .line 26
    :goto_0
    float-to-double v5, p1

    .line 27
    cmpl-double p1, v5, v2

    .line 28
    .line 29
    if-ltz p1, :cond_1

    .line 30
    .line 31
    iput v4, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->rightEyeOpenState:I

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    iput v1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->rightEyeOpenState:I

    .line 35
    .line 36
    :goto_1
    iget p1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->leftEyeOpenState:I

    .line 37
    .line 38
    if-nez p1, :cond_2

    .line 39
    .line 40
    const/4 p1, 0x4

    .line 41
    goto :goto_2

    .line 42
    :cond_2
    const/16 p1, 0x8

    .line 43
    .line 44
    :goto_2
    iget p0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->rightEyeOpenState:I

    .line 45
    .line 46
    if-nez p0, :cond_3

    .line 47
    .line 48
    or-int/lit8 p0, p1, 0x20

    .line 49
    .line 50
    return p0

    .line 51
    :cond_3
    or-int/lit8 p0, p1, 0x40

    .line 52
    .line 53
    return p0
.end method

.method private updateMouseState([F)I
    .locals 10

    .line 1
    const/4 v0, 0x2

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    array-length v1, p1

    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget v1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->INDEX_FACE_LEFT:I

    .line 9
    .line 10
    aget v2, p1, v1

    .line 11
    .line 12
    add-int/lit8 v1, v1, 0x44

    .line 13
    .line 14
    aget v1, p1, v1

    .line 15
    .line 16
    iget v3, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->INDEX_FACE_RIGHT:I

    .line 17
    .line 18
    aget v4, p1, v3

    .line 19
    .line 20
    add-int/lit8 v3, v3, 0x44

    .line 21
    .line 22
    aget v3, p1, v3

    .line 23
    .line 24
    iget v5, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->INDEX_MOUSE_DOWN:I

    .line 25
    .line 26
    aget v6, p1, v5

    .line 27
    .line 28
    add-int/lit8 v5, v5, 0x44

    .line 29
    .line 30
    aget v5, p1, v5

    .line 31
    .line 32
    iget p0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->INDEX_MOUSE_UP:I

    .line 33
    .line 34
    aget v7, p1, p0

    .line 35
    .line 36
    add-int/lit8 p0, p0, 0x44

    .line 37
    .line 38
    aget p0, p1, p0

    .line 39
    .line 40
    sub-float/2addr v2, v4

    .line 41
    float-to-double v8, v2

    .line 42
    sub-float/2addr v1, v3

    .line 43
    float-to-double v1, v1

    .line 44
    invoke-static {v8, v9, v1, v2}, Ljava/lang/Math;->hypot(DD)D

    .line 45
    .line 46
    .line 47
    move-result-wide v1

    .line 48
    double-to-float p1, v1

    .line 49
    sub-float/2addr v7, v6

    .line 50
    float-to-double v1, v7

    .line 51
    sub-float/2addr p0, v5

    .line 52
    float-to-double v3, p0

    .line 53
    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->hypot(DD)D

    .line 54
    .line 55
    .line 56
    move-result-wide v1

    .line 57
    double-to-float p0, v1

    .line 58
    const/high16 v1, 0x3f800000    # 1.0f

    .line 59
    .line 60
    mul-float/2addr p1, v1

    .line 61
    const/high16 v1, 0x41200000    # 10.0f

    .line 62
    .line 63
    div-float/2addr p1, v1

    .line 64
    cmpl-float p0, p0, p1

    .line 65
    .line 66
    if-lez p0, :cond_1

    .line 67
    .line 68
    const/4 p0, 0x1

    .line 69
    return p0

    .line 70
    :cond_1
    :goto_0
    return v0
.end method

.method private updateNodState(Ll/nuf;)I
    .locals 10

    .line 1
    invoke-virtual {p1}, Ll/nuf;->c()[F

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
    invoke-virtual {p1}, Ll/nuf;->c()[F

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    aget v0, v0, v1

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/nuf;->c()[F

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
    invoke-virtual {p1}, Ll/nuf;->c()[F

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const/4 v5, 0x2

    .line 30
    aget p1, p1, v5

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
    iput v7, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->nodState:I

    .line 60
    .line 61
    return v1

    .line 62
    :cond_2
    cmpl-float v3, p1, v5

    .line 63
    .line 64
    if-lez v3, :cond_3

    .line 65
    .line 66
    sub-float v3, p1, v0

    .line 67
    .line 68
    cmpl-float v3, v3, v8

    .line 69
    .line 70
    if-gtz v3, :cond_4

    .line 71
    .line 72
    :cond_3
    cmpg-float v3, p1, v6

    .line 73
    .line 74
    if-gez v3, :cond_5

    .line 75
    .line 76
    sub-float/2addr p1, v0

    .line 77
    cmpg-float p1, p1, v8

    .line 78
    .line 79
    if-gez p1, :cond_5

    .line 80
    .line 81
    :cond_4
    iput v7, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->nodState:I

    .line 82
    .line 83
    return v1

    .line 84
    :cond_5
    iget-object p1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->pitchValues:Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    const/4 v3, 0x4

    .line 91
    if-le p1, v3, :cond_6

    .line 92
    .line 93
    iget-object p1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->pitchValues:Ljava/util/List;

    .line 94
    .line 95
    invoke-interface {p1, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    :cond_6
    iget-object p1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->pitchValues:Ljava/util/List;

    .line 99
    .line 100
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    new-instance p1, Ljava/util/ArrayList;

    .line 108
    .line 109
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->pitchValues:Ljava/util/List;

    .line 110
    .line 111
    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 112
    .line 113
    .line 114
    invoke-static {p1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->pitchValues:Ljava/util/List;

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
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    check-cast p1, Ljava/lang/Float;

    .line 129
    .line 130
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    iget v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->nodState:I

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
    iget v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lastPitch:F

    .line 142
    .line 143
    sub-float v0, p1, v0

    .line 144
    .line 145
    cmpg-float v0, v0, v8

    .line 146
    .line 147
    if-gtz v0, :cond_8

    .line 148
    .line 149
    iput v1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->nodFailedCount:I

    .line 150
    .line 151
    iget v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->nodStartPitch:I

    .line 152
    .line 153
    int-to-float v0, v0

    .line 154
    sub-float v0, p1, v0

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
    iget-wide v4, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->nodStartTime:J

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
    iput v7, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->nodState:I

    .line 175
    .line 176
    const/16 p0, 0x800

    .line 177
    .line 178
    return p0

    .line 179
    :cond_7
    iput v7, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->nodState:I

    .line 180
    .line 181
    goto :goto_0

    .line 182
    :cond_8
    iget v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->nodFailedCount:I

    .line 183
    .line 184
    add-int/2addr v0, v4

    .line 185
    iput v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->nodFailedCount:I

    .line 186
    .line 187
    if-le v0, v4, :cond_b

    .line 188
    .line 189
    iput v7, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->nodState:I

    .line 190
    .line 191
    goto :goto_0

    .line 192
    :pswitch_1
    iget v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lastPitch:F

    .line 193
    .line 194
    sub-float v0, p1, v0

    .line 195
    .line 196
    cmpl-float v0, v0, v8

    .line 197
    .line 198
    if-ltz v0, :cond_9

    .line 199
    .line 200
    iput v1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->nodFailedCount:I

    .line 201
    .line 202
    goto :goto_0

    .line 203
    :cond_9
    iget v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->nodStartPitch:I

    .line 204
    .line 205
    add-int/2addr v0, v2

    .line 206
    int-to-float v0, v0

    .line 207
    cmpl-float v0, p1, v0

    .line 208
    .line 209
    if-lez v0, :cond_a

    .line 210
    .line 211
    const/16 v0, 0x3ea

    .line 212
    .line 213
    iput v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->nodState:I

    .line 214
    .line 215
    iput v1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->nodStartPitch:I

    .line 216
    .line 217
    goto :goto_0

    .line 218
    :cond_a
    iget v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->nodFailedCount:I

    .line 219
    .line 220
    add-int/2addr v0, v4

    .line 221
    iput v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->nodFailedCount:I

    .line 222
    .line 223
    if-le v0, v4, :cond_b

    .line 224
    .line 225
    iput v7, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->nodState:I

    .line 226
    .line 227
    goto :goto_0

    .line 228
    :pswitch_2
    iget v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lastPitch:F

    .line 229
    .line 230
    sub-float v0, p1, v0

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
    iput-wide v2, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->nodStartTime:J

    .line 243
    .line 244
    const/16 v0, 0x3e9

    .line 245
    .line 246
    iput v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->nodState:I

    .line 247
    .line 248
    :cond_b
    :goto_0
    iput p1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lastPitch:F

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


# virtual methods
.method public clearFaceInfos()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    invoke-interface {p0, v0}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchFaceInfo(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public handEvent(Landroid/view/MotionEvent;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-nez p0, :cond_1

    .line 11
    .line 12
    :goto_0
    return-void

    .line 13
    :cond_1
    invoke-interface {p0, p1, p2}, Lcom/momo/xeengine/event/ITouchEventHandler;->handleTouchEvent(Landroid/view/MotionEvent;Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onExpressDetect(Lcom/momocv/express/ExpressInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/LightningEngineHelper;->setExpressionInfo(Lcom/momocv/express/ExpressInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onGestureDetected(Lcom/core/glcore/cv/MMCVBoxes;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/LightningEngineHelper;->setHandGestureInfo([Lcom/momocv/MMBox;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onObjectDetected(Lcom/core/glcore/cv/MMCVBoxes;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/LightningEngineHelper;->setObjectInfos([Lcom/momocv/MMBox;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onPickNoseDetected(Lcom/momocv/handdetectlandmark/HandDetectLandmarkPostInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/LightningEngineHelper;->setPickNoseInfo(Lcom/momocv/handdetectlandmark/HandDetectLandmarkPostInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setARGift(Lcom/momocv/ardetect/ArDetectInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 13
    .line 14
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    if-eqz p1, :cond_2

    .line 19
    .line 20
    iget-object v0, p1, Lcom/momocv/ardetect/ArDetectInfo;->corners_points:[F

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    array-length v0, v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    new-instance v0, Lcom/momo/xeengine/cv/bean/XEMutableInfo;

    .line 29
    .line 30
    const-string v1, "ardetector_gift"

    .line 31
    .line 32
    invoke-direct {v0, v1}, Lcom/momo/xeengine/cv/bean/XEMutableInfo;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    new-instance v1, Lcom/momo/xeengine/cv/bean/XEMutableData;

    .line 36
    .line 37
    invoke-direct {v1}, Lcom/momo/xeengine/cv/bean/XEMutableData;-><init>()V

    .line 38
    .line 39
    .line 40
    iget-object p1, p1, Lcom/momocv/ardetect/ArDetectInfo;->corners_points:[F

    .line 41
    .line 42
    iput-object p1, v1, Lcom/momo/xeengine/cv/bean/XEMutableData;->floatArray1:[F

    .line 43
    .line 44
    new-instance p1, Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, p1}, Lcom/momo/xeengine/cv/bean/XEMutableInfo;->setMutableDatas(Ljava/util/List;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-interface {p0, p1}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchMutableInfo(Ljava/util/List;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_2
    :goto_0
    const/4 p1, 0x0

    .line 64
    invoke-interface {p0, p1}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchMutableInfo(Ljava/util/List;)V

    .line 65
    .line 66
    .line 67
    :cond_3
    :goto_1
    return-void
.end method

.method public setBodyInfos(Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;)V
    .locals 1

    const/4 v0, 0x0

    .line 127
    invoke-virtual {p0, p1, v0}, Lcom/momo/mcamera/mask/LightningEngineHelper;->setBodyInfos(Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;Lcom/momo/xeengine/cv/bean/CVBodyInfo;)V

    return-void
.end method

.method public setBodyInfos(Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;Lcom/momo/xeengine/cv/bean/CVBodyInfo;)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz v0, :cond_7

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_3

    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 14
    .line 15
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p1, :cond_6

    .line 20
    .line 21
    iget-object p1, p1, Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;->multi_person_:[[Lcom/momocv/MMJoint;

    .line 22
    .line 23
    if-eqz p1, :cond_6

    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    array-length v1, p1

    .line 28
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 29
    .line 30
    .line 31
    array-length v1, p1

    .line 32
    const/4 v2, 0x0

    .line 33
    move v3, v2

    .line 34
    :goto_0
    if-ge v3, v1, :cond_4

    .line 35
    .line 36
    aget-object v4, p1, v3

    .line 37
    .line 38
    array-length v5, v4

    .line 39
    new-instance v6, Lcom/momo/xeengine/cv/bean/CVBodyInfo;

    .line 40
    .line 41
    invoke-direct {v6}, Lcom/momo/xeengine/cv/bean/CVBodyInfo;-><init>()V

    .line 42
    .line 43
    .line 44
    new-instance v7, Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-direct {v7, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 47
    .line 48
    .line 49
    iput-object v7, v6, Lcom/momo/xeengine/cv/bean/CVBodyInfo;->joints:Ljava/util/List;

    .line 50
    .line 51
    array-length v5, v4

    .line 52
    move v7, v2

    .line 53
    :goto_1
    if-ge v7, v5, :cond_2

    .line 54
    .line 55
    aget-object v8, v4, v7

    .line 56
    .line 57
    if-nez v8, :cond_1

    .line 58
    .line 59
    goto :goto_2

    .line 60
    :cond_1
    new-instance v9, Lcom/momo/xeengine/cv/bean/CVBodyInfo$Joint;

    .line 61
    .line 62
    invoke-direct {v9}, Lcom/momo/xeengine/cv/bean/CVBodyInfo$Joint;-><init>()V

    .line 63
    .line 64
    .line 65
    iget v10, v8, Lcom/momocv/MMPoint;->x_:I

    .line 66
    .line 67
    int-to-float v10, v10

    .line 68
    iput v10, v9, Lcom/momo/xeengine/cv/bean/CVBodyInfo$Joint;->x:F

    .line 69
    .line 70
    iget v10, v8, Lcom/momocv/MMPoint;->y_:I

    .line 71
    .line 72
    int-to-float v10, v10

    .line 73
    iput v10, v9, Lcom/momo/xeengine/cv/bean/CVBodyInfo$Joint;->y:F

    .line 74
    .line 75
    iget v8, v8, Lcom/momocv/MMJoint;->score_:F

    .line 76
    .line 77
    iput v8, v9, Lcom/momo/xeengine/cv/bean/CVBodyInfo$Joint;->score:F

    .line 78
    .line 79
    iget-object v8, v6, Lcom/momo/xeengine/cv/bean/CVBodyInfo;->joints:Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    :goto_2
    add-int/lit8 v7, v7, 0x1

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_2
    if-eqz p2, :cond_3

    .line 88
    .line 89
    iget-object v4, p2, Lcom/momo/xeengine/cv/bean/CVBodyInfo;->dst_warp_points:[F

    .line 90
    .line 91
    iput-object v4, v6, Lcom/momo/xeengine/cv/bean/CVBodyInfo;->dst_warp_points:[F

    .line 92
    .line 93
    iget-object v4, p2, Lcom/momo/xeengine/cv/bean/CVBodyInfo;->src_warp_points:[F

    .line 94
    .line 95
    iput-object v4, v6, Lcom/momo/xeengine/cv/bean/CVBodyInfo;->src_warp_points:[F

    .line 96
    .line 97
    :cond_3
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    add-int/lit8 v3, v3, 0x1

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_4
    if-eqz p2, :cond_5

    .line 104
    .line 105
    iget-object p1, p2, Lcom/momo/xeengine/cv/bean/CVBodyInfo;->dst_warp_points:[F

    .line 106
    .line 107
    if-eqz p1, :cond_5

    .line 108
    .line 109
    iget-object p1, p2, Lcom/momo/xeengine/cv/bean/CVBodyInfo;->src_warp_points:[F

    .line 110
    .line 111
    if-eqz p1, :cond_5

    .line 112
    .line 113
    const/4 p1, 0x1

    .line 114
    invoke-interface {p0, v0, p1}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchBodyInfo(Ljava/util/List;Z)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_5
    invoke-interface {p0, v0}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchBodyInfo(Ljava/util/List;)V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :cond_6
    const/4 p1, 0x0

    .line 123
    invoke-interface {p0, p1}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchBodyInfo(Ljava/util/List;)V

    .line 124
    .line 125
    .line 126
    :cond_7
    :goto_3
    return-void
.end method

.method public setBodyWarpInfo(Ll/omw;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    if-eqz p1, :cond_3

    .line 11
    .line 12
    iget-object v0, p1, Ll/omw;->l:Lcom/core/glcore/util/BodyLandData;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    new-instance v1, Lcom/momo/xeengine/cv/bean/CVBodyInfo;

    .line 18
    .line 19
    invoke-direct {v1}, Lcom/momo/xeengine/cv/bean/CVBodyInfo;-><init>()V

    .line 20
    .line 21
    .line 22
    iget-object p1, p1, Ll/omw;->m:Lcom/momocv/beauty/BodyWarpInfo;

    .line 23
    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    iget-object v2, p1, Lcom/momocv/beauty/BodyWarpInfo;->dst_warp_points_:[F

    .line 27
    .line 28
    iput-object v2, v1, Lcom/momo/xeengine/cv/bean/CVBodyInfo;->dst_warp_points:[F

    .line 29
    .line 30
    iget-object p1, p1, Lcom/momocv/beauty/BodyWarpInfo;->src_warp_points_:[F

    .line 31
    .line 32
    iput-object p1, v1, Lcom/momo/xeengine/cv/bean/CVBodyInfo;->src_warp_points:[F

    .line 33
    .line 34
    :cond_2
    iget-object p1, v0, Lcom/core/glcore/util/BodyLandData;->info:Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    .line 35
    .line 36
    invoke-virtual {p0, p1, v1}, Lcom/momo/mcamera/mask/LightningEngineHelper;->setBodyInfos(Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;Lcom/momo/xeengine/cv/bean/CVBodyInfo;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_3
    :goto_0
    const/4 p1, 0x0

    .line 41
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/LightningEngineHelper;->setBodyInfos(Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public setCartoonFaceInfo(Ll/omw;Lcom/momocv/cartoonface/CartoonfaceInfo;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    if-eqz p2, :cond_2

    .line 11
    .line 12
    iget-object v1, p2, Lcom/momocv/cartoonface/CartoonfaceInfo;->mask_:[B

    .line 13
    .line 14
    if-eqz v1, :cond_2

    .line 15
    .line 16
    array-length v1, v1

    .line 17
    if-lez v1, :cond_2

    .line 18
    .line 19
    iget v1, p2, Lcom/momocv/cartoonface/CartoonfaceInfo;->mask_width:I

    .line 20
    .line 21
    if-lez v1, :cond_2

    .line 22
    .line 23
    iget v1, p2, Lcom/momocv/cartoonface/CartoonfaceInfo;->mask_height:I

    .line 24
    .line 25
    if-lez v1, :cond_2

    .line 26
    .line 27
    iget-object v1, p2, Lcom/momocv/cartoonface/CartoonfaceInfo;->warp_mat:[F

    .line 28
    .line 29
    if-eqz v1, :cond_2

    .line 30
    .line 31
    array-length v1, v1

    .line 32
    const/4 v2, 0x6

    .line 33
    if-lt v1, v2, :cond_2

    .line 34
    .line 35
    iget-object v1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->xeCartoonFaceInfo:Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;

    .line 36
    .line 37
    if-nez v1, :cond_1

    .line 38
    .line 39
    new-instance v1, Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;

    .line 40
    .line 41
    invoke-direct {v1}, Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->xeCartoonFaceInfo:Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;

    .line 45
    .line 46
    :cond_1
    iget-object v1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->xeCartoonFaceInfo:Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;

    .line 47
    .line 48
    iget-object v3, p2, Lcom/momocv/cartoonface/CartoonfaceInfo;->mask_:[B

    .line 49
    .line 50
    invoke-virtual {v1, v3}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setDatas([B)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->xeCartoonFaceInfo:Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;

    .line 54
    .line 55
    iget v3, p2, Lcom/momocv/cartoonface/CartoonfaceInfo;->mask_height:I

    .line 56
    .line 57
    invoke-virtual {v1, v3}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setHeight(I)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->xeCartoonFaceInfo:Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;

    .line 61
    .line 62
    iget v3, p2, Lcom/momocv/cartoonface/CartoonfaceInfo;->mask_width:I

    .line 63
    .line 64
    invoke-virtual {v1, v3}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setWidth(I)V

    .line 65
    .line 66
    .line 67
    iget-object v1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->xeCartoonFaceInfo:Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;

    .line 68
    .line 69
    iget-object v3, p2, Lcom/momocv/cartoonface/CartoonfaceInfo;->mask_:[B

    .line 70
    .line 71
    array-length v3, v3

    .line 72
    invoke-virtual {v1, v3}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setLength(I)V

    .line 73
    .line 74
    .line 75
    iget-object v1, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->cartoonMatrix:[F

    .line 76
    .line 77
    iget-object p2, p2, Lcom/momocv/cartoonface/CartoonfaceInfo;->warp_mat:[F

    .line 78
    .line 79
    const/4 v3, 0x0

    .line 80
    aget v4, p2, v3

    .line 81
    .line 82
    aput v4, v1, v3

    .line 83
    .line 84
    const/4 v3, 0x1

    .line 85
    aget v4, p2, v3

    .line 86
    .line 87
    const/4 v5, 0x3

    .line 88
    aput v4, v1, v5

    .line 89
    .line 90
    const/4 v4, 0x2

    .line 91
    aget v4, p2, v4

    .line 92
    .line 93
    aput v4, v1, v2

    .line 94
    .line 95
    aget v2, p2, v5

    .line 96
    .line 97
    aput v2, v1, v3

    .line 98
    .line 99
    const/4 v2, 0x4

    .line 100
    aget v3, p2, v2

    .line 101
    .line 102
    aput v3, v1, v2

    .line 103
    .line 104
    const/4 v2, 0x5

    .line 105
    aget p2, p2, v2

    .line 106
    .line 107
    const/4 v2, 0x7

    .line 108
    aput p2, v1, v2

    .line 109
    .line 110
    iget-object p2, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->xeCartoonFaceInfo:Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;

    .line 111
    .line 112
    invoke-virtual {p2, v1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setWarpMat([F)V

    .line 113
    .line 114
    .line 115
    iget-object p2, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->xeCartoonFaceInfo:Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;

    .line 116
    .line 117
    iget-boolean p1, p1, Ll/omw;->a:Z

    .line 118
    .line 119
    invoke-virtual {p2, p1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setFlipShowX(Z)V

    .line 120
    .line 121
    .line 122
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->xeCartoonFaceInfo:Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;

    .line 123
    .line 124
    invoke-interface {v0, p0}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchCartoonFaceInfo(Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;)V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :cond_2
    const/4 p0, 0x0

    .line 129
    invoke-interface {v0, p0}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchCartoonFaceInfo(Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;)V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public setCryingFaceInfo(Lcom/momocv/cartoonface/CartoonfaceInfo;Z)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_1

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 14
    .line 15
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz p1, :cond_2

    .line 20
    .line 21
    iget v1, p1, Lcom/momocv/cartoonface/CartoonfaceInfo;->mask_width:I

    .line 22
    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    iget v1, p1, Lcom/momocv/cartoonface/CartoonfaceInfo;->mask_height:I

    .line 26
    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    new-instance v1, Lcom/momo/xeengine/cv/bean/XEMutableInfo;

    .line 31
    .line 32
    const-string v2, "crying_face"

    .line 33
    .line 34
    invoke-direct {v1, v2}, Lcom/momo/xeengine/cv/bean/XEMutableInfo;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    new-instance v2, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 38
    .line 39
    invoke-direct {v2}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;-><init>()V

    .line 40
    .line 41
    .line 42
    iget-object v3, p1, Lcom/momocv/cartoonface/CartoonfaceInfo;->mask_:[B

    .line 43
    .line 44
    invoke-virtual {v2, v3}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setDatas([B)V

    .line 45
    .line 46
    .line 47
    iget v3, p1, Lcom/momocv/cartoonface/CartoonfaceInfo;->mask_height:I

    .line 48
    .line 49
    invoke-virtual {v2, v3}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setHeight(I)V

    .line 50
    .line 51
    .line 52
    iget v3, p1, Lcom/momocv/cartoonface/CartoonfaceInfo;->mask_width:I

    .line 53
    .line 54
    invoke-virtual {v2, v3}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setWidth(I)V

    .line 55
    .line 56
    .line 57
    iget-object v3, p1, Lcom/momocv/cartoonface/CartoonfaceInfo;->mask_:[B

    .line 58
    .line 59
    array-length v3, v3

    .line 60
    invoke-virtual {v2, v3}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setLength(I)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->cryingMatrix:[F

    .line 64
    .line 65
    iget-object v3, p1, Lcom/momocv/cartoonface/CartoonfaceInfo;->warp_mat:[F

    .line 66
    .line 67
    const/4 v4, 0x0

    .line 68
    aget v5, v3, v4

    .line 69
    .line 70
    aput v5, p0, v4

    .line 71
    .line 72
    const/4 v4, 0x1

    .line 73
    aget v5, v3, v4

    .line 74
    .line 75
    const/4 v6, 0x3

    .line 76
    aput v5, p0, v6

    .line 77
    .line 78
    const/4 v5, 0x2

    .line 79
    aget v5, v3, v5

    .line 80
    .line 81
    const/4 v7, 0x6

    .line 82
    aput v5, p0, v7

    .line 83
    .line 84
    aget v5, v3, v6

    .line 85
    .line 86
    aput v5, p0, v4

    .line 87
    .line 88
    const/4 v4, 0x4

    .line 89
    aget v5, v3, v4

    .line 90
    .line 91
    aput v5, p0, v4

    .line 92
    .line 93
    const/4 v4, 0x5

    .line 94
    aget v3, v3, v4

    .line 95
    .line 96
    const/4 v4, 0x7

    .line 97
    aput v3, p0, v4

    .line 98
    .line 99
    invoke-virtual {v2, p0}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setWarpMat([F)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v2, p2}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setFlipShowX(Z)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v1, v2}, Lcom/momo/xeengine/cv/bean/XEMutableInfo;->setMaskInfo1(Lcom/momo/xeengine/cv/bean/CVSegmentInfo;)V

    .line 106
    .line 107
    .line 108
    new-instance p0, Lcom/momo/xeengine/cv/bean/XEMutableData;

    .line 109
    .line 110
    invoke-direct {p0}, Lcom/momo/xeengine/cv/bean/XEMutableData;-><init>()V

    .line 111
    .line 112
    .line 113
    iget p1, p1, Lcom/momocv/cartoonface/CartoonfaceInfo;->diff_stress:F

    .line 114
    .line 115
    iput p1, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->float1:F

    .line 116
    .line 117
    new-instance p1, Ljava/util/ArrayList;

    .line 118
    .line 119
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    invoke-virtual {v1, p1}, Lcom/momo/xeengine/cv/bean/XEMutableInfo;->setMutableDatas(Ljava/util/List;)V

    .line 126
    .line 127
    .line 128
    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-interface {v0, p0}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchMutableInfo(Ljava/util/List;)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 137
    invoke-interface {v0, p0}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchMutableInfo(Ljava/util/List;)V

    .line 138
    .line 139
    .line 140
    :cond_3
    :goto_1
    return-void
.end method

.method public setExpressionInfo(Lcom/momocv/express/ExpressInfo;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 13
    .line 14
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    if-eqz p1, :cond_2

    .line 19
    .line 20
    iget-object v0, p1, Lcom/momocv/express/ExpressInfo;->express_infos_:[Lcom/momocv/express/SingleExpressInfo;

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    new-instance v0, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .line 28
    .line 29
    iget-object p1, p1, Lcom/momocv/express/ExpressInfo;->express_infos_:[Lcom/momocv/express/SingleExpressInfo;

    .line 30
    .line 31
    array-length v1, p1

    .line 32
    const/4 v2, 0x0

    .line 33
    :goto_0
    if-ge v2, v1, :cond_1

    .line 34
    .line 35
    aget-object v3, p1, v2

    .line 36
    .line 37
    new-instance v4, Lcom/momo/xeengine/cv/bean/CVExpressInfo;

    .line 38
    .line 39
    invoke-direct {v4}, Lcom/momo/xeengine/cv/bean/CVExpressInfo;-><init>()V

    .line 40
    .line 41
    .line 42
    iget v5, v3, Lcom/momocv/express/SingleExpressInfo;->head_:I

    .line 43
    .line 44
    invoke-virtual {v4, v5}, Lcom/momo/xeengine/cv/bean/CVExpressInfo;->setHead(I)V

    .line 45
    .line 46
    .line 47
    iget v5, v3, Lcom/momocv/express/SingleExpressInfo;->lefteye_:I

    .line 48
    .line 49
    invoke-virtual {v4, v5}, Lcom/momo/xeengine/cv/bean/CVExpressInfo;->setLeftEye(I)V

    .line 50
    .line 51
    .line 52
    iget v5, v3, Lcom/momocv/express/SingleExpressInfo;->righteye_:I

    .line 53
    .line 54
    invoke-virtual {v4, v5}, Lcom/momo/xeengine/cv/bean/CVExpressInfo;->setRightEye(I)V

    .line 55
    .line 56
    .line 57
    iget v5, v3, Lcom/momocv/express/SingleExpressInfo;->mouth_:I

    .line 58
    .line 59
    invoke-virtual {v4, v5}, Lcom/momo/xeengine/cv/bean/CVExpressInfo;->setMouth(I)V

    .line 60
    .line 61
    .line 62
    iget v3, v3, Lcom/momocv/express/SingleExpressInfo;->neck_:I

    .line 63
    .line 64
    invoke-virtual {v4, v3}, Lcom/momo/xeengine/cv/bean/CVExpressInfo;->setNeck(I)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    add-int/lit8 v2, v2, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    invoke-interface {p0, v0}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchExpressInfo(Ljava/util/List;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_2
    const/4 p1, 0x0

    .line 78
    invoke-interface {p0, p1}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchExpressInfo(Ljava/util/List;)V

    .line 79
    .line 80
    .line 81
    :cond_3
    :goto_1
    return-void
.end method

.method public setFaceInfo(Ll/omw;)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v2, v0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 9
    .line 10
    invoke-interface {v2}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    if-nez v2, :cond_1

    .line 15
    .line 16
    :goto_0
    return-void

    .line 17
    :cond_1
    invoke-virtual {v1}, Ll/omw;->n()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-gtz v3, :cond_2

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-interface {v2, v0}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchFaceInfo(Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_2
    iget v4, v1, Ll/omw;->y:I

    .line 29
    .line 30
    const/4 v5, 0x1

    .line 31
    if-lt v4, v5, :cond_3

    .line 32
    .line 33
    if-ge v4, v3, :cond_3

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_3
    move v4, v3

    .line 37
    :goto_1
    iget-object v6, v0, Lcom/momo/mcamera/mask/LightningEngineHelper;->mouthMatrix:[[F

    .line 38
    .line 39
    const/4 v7, 0x2

    .line 40
    const/4 v8, 0x0

    .line 41
    if-eqz v6, :cond_4

    .line 42
    .line 43
    array-length v6, v6

    .line 44
    if-eq v6, v4, :cond_5

    .line 45
    .line 46
    :cond_4
    new-array v6, v7, [I

    .line 47
    .line 48
    const/16 v9, 0x9

    .line 49
    .line 50
    aput v9, v6, v5

    .line 51
    .line 52
    aput v3, v6, v8

    .line 53
    .line 54
    sget-object v3, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 55
    .line 56
    invoke-static {v3, v6}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    check-cast v3, [[F

    .line 61
    .line 62
    iput-object v3, v0, Lcom/momo/mcamera/mask/LightningEngineHelper;->mouthMatrix:[[F

    .line 63
    .line 64
    move v3, v8

    .line 65
    :goto_2
    iget-object v6, v0, Lcom/momo/mcamera/mask/LightningEngineHelper;->mouthMatrix:[[F

    .line 66
    .line 67
    array-length v10, v6

    .line 68
    if-ge v3, v10, :cond_5

    .line 69
    .line 70
    new-array v10, v9, [F

    .line 71
    .line 72
    fill-array-data v10, :array_0

    .line 73
    .line 74
    .line 75
    aput-object v10, v6, v3

    .line 76
    .line 77
    add-int/lit8 v3, v3, 0x1

    .line 78
    .line 79
    goto :goto_2

    .line 80
    :cond_5
    new-instance v3, Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .line 84
    .line 85
    move v6, v8

    .line 86
    :goto_3
    if-ge v6, v4, :cond_12

    .line 87
    .line 88
    invoke-virtual {v1, v6}, Ll/omw;->j(I)Ll/nuf;

    .line 89
    .line 90
    .line 91
    move-result-object v9

    .line 92
    invoke-virtual {v1}, Ll/omw;->s()Lcom/momocv/videoprocessor/VideoInfo;

    .line 93
    .line 94
    .line 95
    move-result-object v10

    .line 96
    iget-object v10, v10, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    .line 97
    .line 98
    aget-object v10, v10, v6

    .line 99
    .line 100
    if-nez v9, :cond_6

    .line 101
    .line 102
    move/from16 v17, v5

    .line 103
    .line 104
    move/from16 v18, v7

    .line 105
    .line 106
    goto/16 :goto_a

    .line 107
    .line 108
    :cond_6
    new-instance v11, Lcom/momo/xeengine/cv/bean/XEFaceInfo;

    .line 109
    .line 110
    invoke-direct {v11}, Lcom/momo/xeengine/cv/bean/XEFaceInfo;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-direct {v0, v1, v6}, Lcom/momo/mcamera/mask/LightningEngineHelper;->adjustState(Ll/omw;I)I

    .line 114
    .line 115
    .line 116
    move-result v12

    .line 117
    iput v12, v11, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->expression:I

    .line 118
    .line 119
    invoke-virtual {v9}, Ll/nuf;->A()[F

    .line 120
    .line 121
    .line 122
    move-result-object v12

    .line 123
    if-nez v12, :cond_7

    .line 124
    .line 125
    invoke-virtual {v9}, Ll/nuf;->l()[F

    .line 126
    .line 127
    .line 128
    move-result-object v12

    .line 129
    goto :goto_4

    .line 130
    :cond_7
    invoke-virtual {v9}, Ll/nuf;->A()[F

    .line 131
    .line 132
    .line 133
    move-result-object v12

    .line 134
    :goto_4
    iput-object v12, v11, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->landmarks68:[F

    .line 135
    .line 136
    invoke-virtual {v9}, Ll/nuf;->B()[F

    .line 137
    .line 138
    .line 139
    move-result-object v12

    .line 140
    if-nez v12, :cond_8

    .line 141
    .line 142
    invoke-virtual {v9}, Ll/nuf;->m()[F

    .line 143
    .line 144
    .line 145
    move-result-object v12

    .line 146
    goto :goto_5

    .line 147
    :cond_8
    invoke-virtual {v9}, Ll/nuf;->B()[F

    .line 148
    .line 149
    .line 150
    move-result-object v12

    .line 151
    :goto_5
    iput-object v12, v11, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->landmarks96:[F

    .line 152
    .line 153
    iget-object v12, v10, Lcom/momocv/SingleFaceInfo;->landmarks_137_:[F

    .line 154
    .line 155
    iput-object v12, v11, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->landmarks137:[F

    .line 156
    .line 157
    iget-object v12, v10, Lcom/momocv/SingleFaceInfo;->landmarks_222_:[F

    .line 158
    .line 159
    iput-object v12, v11, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->landmarks222:[F

    .line 160
    .line 161
    iget-object v12, v10, Lcom/momocv/SingleFaceInfo;->landmarks_106_:[F

    .line 162
    .line 163
    iput-object v12, v11, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->landmarks106:[F

    .line 164
    .line 165
    invoke-virtual {v9}, Ll/nuf;->x()I

    .line 166
    .line 167
    .line 168
    move-result v12

    .line 169
    iput v12, v11, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->trackId:I

    .line 170
    .line 171
    invoke-virtual {v9}, Ll/nuf;->c()[F

    .line 172
    .line 173
    .line 174
    move-result-object v12

    .line 175
    const/4 v13, 0x3

    .line 176
    if-eqz v12, :cond_9

    .line 177
    .line 178
    array-length v14, v12

    .line 179
    if-lt v14, v13, :cond_9

    .line 180
    .line 181
    aget v14, v12, v8

    .line 182
    .line 183
    iput v14, v11, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->pitch:F

    .line 184
    .line 185
    aget v14, v12, v5

    .line 186
    .line 187
    iput v14, v11, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->yaw:F

    .line 188
    .line 189
    aget v12, v12, v7

    .line 190
    .line 191
    iput v12, v11, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->roll:F

    .line 192
    .line 193
    :cond_9
    invoke-virtual {v9}, Ll/nuf;->e()[F

    .line 194
    .line 195
    .line 196
    move-result-object v12

    .line 197
    aget v12, v12, v8

    .line 198
    .line 199
    invoke-virtual {v9}, Ll/nuf;->e()[F

    .line 200
    .line 201
    .line 202
    move-result-object v14

    .line 203
    aget v14, v14, v5

    .line 204
    .line 205
    invoke-virtual {v9}, Ll/nuf;->e()[F

    .line 206
    .line 207
    .line 208
    move-result-object v15

    .line 209
    aget v15, v15, v7

    .line 210
    .line 211
    invoke-virtual {v9}, Ll/nuf;->e()[F

    .line 212
    .line 213
    .line 214
    move-result-object v16

    .line 215
    aget v16, v16, v8

    .line 216
    .line 217
    sub-float v15, v15, v16

    .line 218
    .line 219
    invoke-virtual {v9}, Ll/nuf;->e()[F

    .line 220
    .line 221
    .line 222
    move-result-object v16

    .line 223
    aget v16, v16, v13

    .line 224
    .line 225
    invoke-virtual {v9}, Ll/nuf;->e()[F

    .line 226
    .line 227
    .line 228
    move-result-object v17

    .line 229
    aget v17, v17, v5

    .line 230
    .line 231
    sub-float v16, v16, v17

    .line 232
    .line 233
    move/from16 v17, v5

    .line 234
    .line 235
    const/4 v5, 0x4

    .line 236
    move/from16 v18, v7

    .line 237
    .line 238
    new-array v7, v5, [F

    .line 239
    .line 240
    aput v12, v7, v8

    .line 241
    .line 242
    aput v14, v7, v17

    .line 243
    .line 244
    aput v15, v7, v18

    .line 245
    .line 246
    aput v16, v7, v13

    .line 247
    .line 248
    iput-object v7, v11, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->faceBounds:[F

    .line 249
    .line 250
    invoke-virtual {v9}, Ll/nuf;->b()[F

    .line 251
    .line 252
    .line 253
    move-result-object v7

    .line 254
    iput-object v7, v11, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->cameraMatrix:[F

    .line 255
    .line 256
    invoke-virtual {v9}, Ll/nuf;->u()[F

    .line 257
    .line 258
    .line 259
    move-result-object v7

    .line 260
    iput-object v7, v11, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->rotationMatrix:[F

    .line 261
    .line 262
    invoke-virtual {v9}, Ll/nuf;->v()[F

    .line 263
    .line 264
    .line 265
    move-result-object v7

    .line 266
    iput-object v7, v11, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->rotationVector:[F

    .line 267
    .line 268
    invoke-virtual {v9}, Ll/nuf;->y()[F

    .line 269
    .line 270
    .line 271
    move-result-object v7

    .line 272
    iput-object v7, v11, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->translationVector:[F

    .line 273
    .line 274
    invoke-virtual {v9}, Ll/nuf;->s()[F

    .line 275
    .line 276
    .line 277
    move-result-object v7

    .line 278
    iput-object v7, v11, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->projectionMatrix:[F

    .line 279
    .line 280
    invoke-virtual {v9}, Ll/nuf;->o()[F

    .line 281
    .line 282
    .line 283
    move-result-object v7

    .line 284
    iput-object v7, v11, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->modelViewMatrix:[F

    .line 285
    .line 286
    invoke-virtual {v9}, Ll/nuf;->w()[I

    .line 287
    .line 288
    .line 289
    move-result-object v7

    .line 290
    if-eqz v7, :cond_a

    .line 291
    .line 292
    invoke-virtual {v9}, Ll/nuf;->w()[I

    .line 293
    .line 294
    .line 295
    move-result-object v7

    .line 296
    array-length v7, v7

    .line 297
    new-array v7, v7, [F

    .line 298
    .line 299
    iput-object v7, v11, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->skin_threshold:[F

    .line 300
    .line 301
    move v7, v8

    .line 302
    :goto_6
    invoke-virtual {v9}, Ll/nuf;->w()[I

    .line 303
    .line 304
    .line 305
    move-result-object v12

    .line 306
    array-length v12, v12

    .line 307
    if-ge v7, v12, :cond_a

    .line 308
    .line 309
    iget-object v12, v11, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->skin_threshold:[F

    .line 310
    .line 311
    invoke-virtual {v9}, Ll/nuf;->w()[I

    .line 312
    .line 313
    .line 314
    move-result-object v14

    .line 315
    aget v14, v14, v7

    .line 316
    .line 317
    int-to-float v14, v14

    .line 318
    aput v14, v12, v7

    .line 319
    .line 320
    add-int/lit8 v7, v7, 0x1

    .line 321
    .line 322
    goto :goto_6

    .line 323
    :cond_a
    if-nez v6, :cond_b

    .line 324
    .line 325
    invoke-virtual {v1}, Ll/omw;->q()Ll/evf;

    .line 326
    .line 327
    .line 328
    move-result-object v7

    .line 329
    if-eqz v7, :cond_b

    .line 330
    .line 331
    iget-object v9, v7, Ll/evf;->a:Lcom/momocv/facerigv3/FacerigV3Info;

    .line 332
    .line 333
    if-eqz v9, :cond_b

    .line 334
    .line 335
    iget-object v12, v9, Lcom/momocv/facerigv3/FacerigV3Info;->facerigV3_eulers_:[F

    .line 336
    .line 337
    if-eqz v12, :cond_b

    .line 338
    .line 339
    iget-object v9, v9, Lcom/momocv/facerigv3/FacerigV3Info;->facerigV3_scores_:[F

    .line 340
    .line 341
    if-eqz v9, :cond_b

    .line 342
    .line 343
    const/16 v9, 0x36

    .line 344
    .line 345
    new-array v9, v9, [F

    .line 346
    .line 347
    invoke-static {v12, v8, v9, v8, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 348
    .line 349
    .line 350
    iget-object v7, v7, Ll/evf;->a:Lcom/momocv/facerigv3/FacerigV3Info;

    .line 351
    .line 352
    iget-object v7, v7, Lcom/momocv/facerigv3/FacerigV3Info;->facerigV3_scores_:[F

    .line 353
    .line 354
    const/16 v12, 0x33

    .line 355
    .line 356
    invoke-static {v7, v8, v9, v13, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 357
    .line 358
    .line 359
    iput-object v9, v11, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->facerigStates:[F

    .line 360
    .line 361
    :cond_b
    invoke-virtual {v1}, Ll/omw;->r()[[F

    .line 362
    .line 363
    .line 364
    move-result-object v7

    .line 365
    if-eqz v7, :cond_c

    .line 366
    .line 367
    array-length v7, v7

    .line 368
    if-le v7, v6, :cond_c

    .line 369
    .line 370
    invoke-virtual {v1}, Ll/omw;->r()[[F

    .line 371
    .line 372
    .line 373
    move-result-object v7

    .line 374
    aget-object v7, v7, v6

    .line 375
    .line 376
    iput-object v7, v11, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->src_warp_points:[F

    .line 377
    .line 378
    invoke-virtual {v1}, Ll/omw;->f()[[F

    .line 379
    .line 380
    .line 381
    move-result-object v7

    .line 382
    aget-object v7, v7, v6

    .line 383
    .line 384
    iput-object v7, v11, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->dst_warp_points:[F

    .line 385
    .line 386
    :cond_c
    iget-object v7, v11, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->facerigStates:[F

    .line 387
    .line 388
    if-nez v7, :cond_d

    .line 389
    .line 390
    move v7, v8

    .line 391
    goto :goto_7

    .line 392
    :cond_d
    move/from16 v7, v17

    .line 393
    .line 394
    :goto_7
    iput v7, v11, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->meType:I

    .line 395
    .line 396
    iget-object v7, v10, Lcom/momocv/SingleFaceInfo;->face_warp_mat:[F

    .line 397
    .line 398
    const/4 v9, 0x5

    .line 399
    const/4 v12, 0x7

    .line 400
    const/4 v14, 0x6

    .line 401
    if-eqz v7, :cond_e

    .line 402
    .line 403
    iget v7, v10, Lcom/momocv/SingleFaceInfo;->face_mask_width:I

    .line 404
    .line 405
    if-eqz v7, :cond_e

    .line 406
    .line 407
    iget v7, v10, Lcom/momocv/SingleFaceInfo;->face_mask_height:I

    .line 408
    .line 409
    if-eqz v7, :cond_e

    .line 410
    .line 411
    new-instance v7, Lcom/momo/xeengine/cv/bean/XEFaceMask;

    .line 412
    .line 413
    invoke-direct {v7}, Lcom/momo/xeengine/cv/bean/XEFaceMask;-><init>()V

    .line 414
    .line 415
    .line 416
    iget-object v15, v0, Lcom/momo/mcamera/mask/LightningEngineHelper;->faceMatrix:[[F

    .line 417
    .line 418
    aget-object v15, v15, v6

    .line 419
    .line 420
    move/from16 v16, v5

    .line 421
    .line 422
    iget-object v5, v10, Lcom/momocv/SingleFaceInfo;->face_warp_mat:[F

    .line 423
    .line 424
    aget v19, v5, v8

    .line 425
    .line 426
    aput v19, v15, v8

    .line 427
    .line 428
    aget v19, v5, v17

    .line 429
    .line 430
    aput v19, v15, v13

    .line 431
    .line 432
    aget v19, v5, v18

    .line 433
    .line 434
    aput v19, v15, v14

    .line 435
    .line 436
    aget v19, v5, v13

    .line 437
    .line 438
    aput v19, v15, v17

    .line 439
    .line 440
    aget v19, v5, v16

    .line 441
    .line 442
    aput v19, v15, v16

    .line 443
    .line 444
    aget v5, v5, v9

    .line 445
    .line 446
    aput v5, v15, v12

    .line 447
    .line 448
    invoke-virtual {v7, v15}, Lcom/momo/xeengine/cv/bean/XEFaceMask;->setWarpMat([F)V

    .line 449
    .line 450
    .line 451
    iget-object v5, v10, Lcom/momocv/SingleFaceInfo;->face_mask:[B

    .line 452
    .line 453
    invoke-virtual {v7, v5}, Lcom/momo/xeengine/cv/bean/XEFaceMask;->setDatas([B)V

    .line 454
    .line 455
    .line 456
    iget v5, v10, Lcom/momocv/SingleFaceInfo;->face_mask_width:I

    .line 457
    .line 458
    invoke-virtual {v7, v5}, Lcom/momo/xeengine/cv/bean/XEFaceMask;->setMaskWidth(I)V

    .line 459
    .line 460
    .line 461
    iget v5, v10, Lcom/momocv/SingleFaceInfo;->face_mask_height:I

    .line 462
    .line 463
    invoke-virtual {v7, v5}, Lcom/momo/xeengine/cv/bean/XEFaceMask;->setMaskHeight(I)V

    .line 464
    .line 465
    .line 466
    invoke-virtual {v7}, Lcom/momo/xeengine/cv/bean/XEFaceMask;->getMaskHeight()I

    .line 467
    .line 468
    .line 469
    move-result v5

    .line 470
    invoke-virtual {v7}, Lcom/momo/xeengine/cv/bean/XEFaceMask;->getMaskWidth()I

    .line 471
    .line 472
    .line 473
    move-result v15

    .line 474
    mul-int/2addr v5, v15

    .line 475
    invoke-virtual {v7, v5}, Lcom/momo/xeengine/cv/bean/XEFaceMask;->setLength(I)V

    .line 476
    .line 477
    .line 478
    iget-boolean v5, v1, Ll/omw;->a:Z

    .line 479
    .line 480
    invoke-virtual {v7, v5}, Lcom/momo/xeengine/cv/bean/XEFaceMask;->setFlipShowX(Z)V

    .line 481
    .line 482
    .line 483
    invoke-virtual {v11, v7}, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->setFaceMask(Lcom/momo/xeengine/cv/bean/XEFaceMask;)V

    .line 484
    .line 485
    .line 486
    goto :goto_8

    .line 487
    :cond_e
    move/from16 v16, v5

    .line 488
    .line 489
    :goto_8
    iget-object v5, v10, Lcom/momocv/SingleFaceInfo;->mouth_warp_mat:[F

    .line 490
    .line 491
    if-eqz v5, :cond_f

    .line 492
    .line 493
    iget v5, v10, Lcom/momocv/SingleFaceInfo;->mouth_mask_width:I

    .line 494
    .line 495
    if-eqz v5, :cond_f

    .line 496
    .line 497
    iget v5, v10, Lcom/momocv/SingleFaceInfo;->mouth_mask_height:I

    .line 498
    .line 499
    if-eqz v5, :cond_f

    .line 500
    .line 501
    new-instance v5, Lcom/momo/xeengine/cv/bean/XEFaceMask;

    .line 502
    .line 503
    invoke-direct {v5}, Lcom/momo/xeengine/cv/bean/XEFaceMask;-><init>()V

    .line 504
    .line 505
    .line 506
    iget-object v7, v0, Lcom/momo/mcamera/mask/LightningEngineHelper;->mouthMatrix:[[F

    .line 507
    .line 508
    aget-object v7, v7, v6

    .line 509
    .line 510
    iget-object v15, v10, Lcom/momocv/SingleFaceInfo;->mouth_warp_mat:[F

    .line 511
    .line 512
    aget v19, v15, v8

    .line 513
    .line 514
    aput v19, v7, v8

    .line 515
    .line 516
    aget v19, v15, v17

    .line 517
    .line 518
    aput v19, v7, v13

    .line 519
    .line 520
    aget v19, v15, v18

    .line 521
    .line 522
    aput v19, v7, v14

    .line 523
    .line 524
    aget v13, v15, v13

    .line 525
    .line 526
    aput v13, v7, v17

    .line 527
    .line 528
    aget v13, v15, v16

    .line 529
    .line 530
    aput v13, v7, v16

    .line 531
    .line 532
    aget v9, v15, v9

    .line 533
    .line 534
    aput v9, v7, v12

    .line 535
    .line 536
    invoke-virtual {v5, v7}, Lcom/momo/xeengine/cv/bean/XEFaceMask;->setWarpMat([F)V

    .line 537
    .line 538
    .line 539
    iget-object v7, v10, Lcom/momocv/SingleFaceInfo;->mouth_mask:[B

    .line 540
    .line 541
    invoke-virtual {v5, v7}, Lcom/momo/xeengine/cv/bean/XEFaceMask;->setDatas([B)V

    .line 542
    .line 543
    .line 544
    iget v7, v10, Lcom/momocv/SingleFaceInfo;->mouth_mask_width:I

    .line 545
    .line 546
    invoke-virtual {v5, v7}, Lcom/momo/xeengine/cv/bean/XEFaceMask;->setMaskWidth(I)V

    .line 547
    .line 548
    .line 549
    iget v7, v10, Lcom/momocv/SingleFaceInfo;->mouth_mask_height:I

    .line 550
    .line 551
    invoke-virtual {v5, v7}, Lcom/momo/xeengine/cv/bean/XEFaceMask;->setMaskHeight(I)V

    .line 552
    .line 553
    .line 554
    invoke-virtual {v5}, Lcom/momo/xeengine/cv/bean/XEFaceMask;->getMaskHeight()I

    .line 555
    .line 556
    .line 557
    move-result v7

    .line 558
    invoke-virtual {v5}, Lcom/momo/xeengine/cv/bean/XEFaceMask;->getMaskWidth()I

    .line 559
    .line 560
    .line 561
    move-result v9

    .line 562
    mul-int/2addr v7, v9

    .line 563
    invoke-virtual {v5, v7}, Lcom/momo/xeengine/cv/bean/XEFaceMask;->setLength(I)V

    .line 564
    .line 565
    .line 566
    iget-boolean v7, v1, Ll/omw;->a:Z

    .line 567
    .line 568
    invoke-virtual {v5, v7}, Lcom/momo/xeengine/cv/bean/XEFaceMask;->setFlipShowX(Z)V

    .line 569
    .line 570
    .line 571
    invoke-virtual {v11, v5}, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->setMouthMask(Lcom/momo/xeengine/cv/bean/XEFaceMask;)V

    .line 572
    .line 573
    .line 574
    :cond_f
    iget-object v5, v1, Ll/omw;->x:[[Lcom/momocv/LiquefyInfo;

    .line 575
    .line 576
    if-eqz v5, :cond_11

    .line 577
    .line 578
    array-length v7, v5

    .line 579
    if-lez v7, :cond_11

    .line 580
    .line 581
    aget-object v5, v5, v6

    .line 582
    .line 583
    new-instance v7, Ljava/util/ArrayList;

    .line 584
    .line 585
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 586
    .line 587
    .line 588
    if-eqz v5, :cond_10

    .line 589
    .line 590
    array-length v9, v5

    .line 591
    if-lez v9, :cond_10

    .line 592
    .line 593
    move v9, v8

    .line 594
    :goto_9
    array-length v10, v5

    .line 595
    if-ge v9, v10, :cond_10

    .line 596
    .line 597
    aget-object v10, v5, v9

    .line 598
    .line 599
    new-instance v12, Lcom/momo/xeengine/cv/bean/XEFaceLiquefy;

    .line 600
    .line 601
    invoke-direct {v12}, Lcom/momo/xeengine/cv/bean/XEFaceLiquefy;-><init>()V

    .line 602
    .line 603
    .line 604
    iget v13, v10, Lcom/momocv/LiquefyInfo;->circleCenterX:F

    .line 605
    .line 606
    iput v13, v12, Lcom/momo/xeengine/cv/bean/XEFaceLiquefy;->circleCenterX:F

    .line 607
    .line 608
    iget v13, v10, Lcom/momocv/LiquefyInfo;->circleCenterY:F

    .line 609
    .line 610
    iput v13, v12, Lcom/momo/xeengine/cv/bean/XEFaceLiquefy;->circleCenterY:F

    .line 611
    .line 612
    iget v13, v10, Lcom/momocv/LiquefyInfo;->circleSizeX:F

    .line 613
    .line 614
    iput v13, v12, Lcom/momo/xeengine/cv/bean/XEFaceLiquefy;->circleSizeX:F

    .line 615
    .line 616
    iget v13, v10, Lcom/momocv/LiquefyInfo;->circleSizeY:F

    .line 617
    .line 618
    iput v13, v12, Lcom/momo/xeengine/cv/bean/XEFaceLiquefy;->circleSizeY:F

    .line 619
    .line 620
    iget v13, v10, Lcom/momocv/LiquefyInfo;->circleType:I

    .line 621
    .line 622
    iput v13, v12, Lcom/momo/xeengine/cv/bean/XEFaceLiquefy;->circleType:I

    .line 623
    .line 624
    iget v13, v10, Lcom/momocv/LiquefyInfo;->intensityX:F

    .line 625
    .line 626
    iput v13, v12, Lcom/momo/xeengine/cv/bean/XEFaceLiquefy;->circleIntensityX:F

    .line 627
    .line 628
    iget v13, v10, Lcom/momocv/LiquefyInfo;->intensityY:F

    .line 629
    .line 630
    iput v13, v12, Lcom/momo/xeengine/cv/bean/XEFaceLiquefy;->circleIntensityY:F

    .line 631
    .line 632
    iget-object v10, v10, Lcom/momocv/LiquefyInfo;->m:[F

    .line 633
    .line 634
    iput-object v10, v12, Lcom/momo/xeengine/cv/bean/XEFaceLiquefy;->mat:[F

    .line 635
    .line 636
    invoke-virtual {v7, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 637
    .line 638
    .line 639
    add-int/lit8 v9, v9, 0x1

    .line 640
    .line 641
    goto :goto_9

    .line 642
    :cond_10
    invoke-virtual {v11, v7}, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->setLiquefyInfos(Ljava/util/List;)V

    .line 643
    .line 644
    .line 645
    :cond_11
    invoke-interface {v3, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 646
    .line 647
    .line 648
    :goto_a
    add-int/lit8 v6, v6, 0x1

    .line 649
    .line 650
    move/from16 v5, v17

    .line 651
    .line 652
    move/from16 v7, v18

    .line 653
    .line 654
    goto/16 :goto_3

    .line 655
    .line 656
    :cond_12
    invoke-interface {v2, v3}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchFaceInfo(Ljava/util/List;)V

    .line 657
    .line 658
    .line 659
    return-void

    .line 660
    nop

    .line 661
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public setHandGestureInfo(Lcom/momocv/handgesture/HandGestureInfo;)V
    .locals 0

    if-eqz p1, :cond_0

    .line 106
    iget-object p1, p1, Lcom/momocv/handgesture/HandGestureInfo;->hand_gesture_results_:[Lcom/momocv/MMBox;

    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/LightningEngineHelper;->setHandGestureInfo([Lcom/momocv/MMBox;)V

    return-void

    :cond_0
    const/4 p1, 0x0

    .line 107
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/LightningEngineHelper;->setHandGestureInfo([Lcom/momocv/MMBox;)V

    return-void
.end method

.method public setObjectInfos(Lcom/momocv/objectdetect/ObjectDetectInfo;)V
    .locals 0

    if-eqz p1, :cond_0

    .line 97
    iget-object p1, p1, Lcom/momocv/objectdetect/ObjectDetectInfo;->detect_results_:[Lcom/momocv/MMBox;

    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/LightningEngineHelper;->setObjectInfos([Lcom/momocv/MMBox;)V

    return-void

    :cond_0
    const/4 p1, 0x0

    .line 98
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/LightningEngineHelper;->setObjectInfos([Lcom/momocv/MMBox;)V

    return-void
.end method

.method public setObjectInfos([Lcom/momocv/MMBox;)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_2

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 13
    .line 14
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    if-eqz p1, :cond_3

    .line 19
    .line 20
    new-instance v0, Ljava/util/ArrayList;

    .line 21
    .line 22
    array-length v1, p1

    .line 23
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 24
    .line 25
    .line 26
    array-length v1, p1

    .line 27
    const/4 v2, 0x0

    .line 28
    move v3, v2

    .line 29
    :goto_0
    if-ge v3, v1, :cond_2

    .line 30
    .line 31
    aget-object v4, p1, v3

    .line 32
    .line 33
    if-nez v4, :cond_1

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    new-instance v5, Lcom/momo/xeengine/cv/bean/CVObjectInfo;

    .line 37
    .line 38
    invoke-direct {v5}, Lcom/momo/xeengine/cv/bean/CVObjectInfo;-><init>()V

    .line 39
    .line 40
    .line 41
    iget-object v6, v4, Lcom/momocv/MMBox;->class_name_:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v5, v6}, Lcom/momo/xeengine/cv/bean/CVObjectInfo;->setType(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget v6, v4, Lcom/momocv/MMRect;->x_:I

    .line 47
    .line 48
    int-to-float v6, v6

    .line 49
    iget v7, v4, Lcom/momocv/MMRect;->y_:I

    .line 50
    .line 51
    int-to-float v7, v7

    .line 52
    iget v8, v4, Lcom/momocv/MMRect;->width_:I

    .line 53
    .line 54
    int-to-float v8, v8

    .line 55
    iget v4, v4, Lcom/momocv/MMRect;->height_:I

    .line 56
    .line 57
    int-to-float v4, v4

    .line 58
    const/4 v9, 0x4

    .line 59
    new-array v9, v9, [F

    .line 60
    .line 61
    aput v6, v9, v2

    .line 62
    .line 63
    const/4 v6, 0x1

    .line 64
    aput v7, v9, v6

    .line 65
    .line 66
    const/4 v6, 0x2

    .line 67
    aput v8, v9, v6

    .line 68
    .line 69
    const/4 v6, 0x3

    .line 70
    aput v4, v9, v6

    .line 71
    .line 72
    invoke-virtual {v5, v9}, Lcom/momo/xeengine/cv/bean/CVObjectInfo;->setBounds([F)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v5}, Lcom/momo/xeengine/cv/bean/CVObjectInfo;->getScore()F

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    invoke-virtual {v5, v4}, Lcom/momo/xeengine/cv/bean/CVObjectInfo;->setScore(F)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_2
    invoke-interface {p0, v0}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchObjectInfo(Ljava/util/List;)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_3
    const/4 p1, 0x0

    .line 93
    invoke-interface {p0, p1}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchObjectInfo(Ljava/util/List;)V

    .line 94
    .line 95
    .line 96
    :cond_4
    :goto_2
    return-void
.end method

.method public setQRCodeInfo(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 13
    .line 14
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    invoke-interface {p0, p1}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchMutableInfo(Ljava/util/List;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    new-instance v0, Lcom/momo/xeengine/cv/bean/XEMutableInfo;

    .line 30
    .line 31
    const-string v1, "qrcode_detector"

    .line 32
    .line 33
    invoke-direct {v0, v1}, Lcom/momo/xeengine/cv/bean/XEMutableInfo;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    new-instance v1, Lcom/momo/xeengine/cv/bean/XEMutableData;

    .line 37
    .line 38
    invoke-direct {v1}, Lcom/momo/xeengine/cv/bean/XEMutableData;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object p1, v1, Lcom/momo/xeengine/cv/bean/XEMutableData;->str1:Ljava/lang/String;

    .line 42
    .line 43
    new-instance p1, Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, p1}, Lcom/momo/xeengine/cv/bean/XEMutableInfo;->setMutableDatas(Ljava/util/List;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-interface {p0, p1}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchMutableInfo(Ljava/util/List;)V

    .line 59
    .line 60
    .line 61
    :cond_2
    :goto_0
    return-void
.end method

.method public setSegmentInfo(Lcom/momocv/segmentation/SegmentationInfo;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 13
    .line 14
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p1, Lcom/momocv/segmentation/SegmentationInfo;->mask_:[B

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    array-length v1, v1

    .line 23
    if-lez v1, :cond_1

    .line 24
    .line 25
    iget v1, p1, Lcom/momocv/segmentation/SegmentationInfo;->mask_width:I

    .line 26
    .line 27
    if-lez v1, :cond_1

    .line 28
    .line 29
    iget v1, p1, Lcom/momocv/segmentation/SegmentationInfo;->mask_height:I

    .line 30
    .line 31
    if-lez v1, :cond_1

    .line 32
    .line 33
    new-instance v1, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 34
    .line 35
    invoke-direct {v1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;-><init>()V

    .line 36
    .line 37
    .line 38
    iget-object v2, p1, Lcom/momocv/segmentation/SegmentationInfo;->mask_:[B

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setDatas([B)V

    .line 41
    .line 42
    .line 43
    iget v2, p1, Lcom/momocv/segmentation/SegmentationInfo;->mask_height:I

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setHeight(I)V

    .line 46
    .line 47
    .line 48
    iget v2, p1, Lcom/momocv/segmentation/SegmentationInfo;->mask_width:I

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setWidth(I)V

    .line 51
    .line 52
    .line 53
    iget-object v2, p1, Lcom/momocv/segmentation/SegmentationInfo;->mask_:[B

    .line 54
    .line 55
    array-length v2, v2

    .line 56
    invoke-virtual {v1, v2}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setLength(I)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->segMatrix:[F

    .line 60
    .line 61
    iget-object p1, p1, Lcom/momocv/segmentation/SegmentationInfo;->warp_mat:[F

    .line 62
    .line 63
    const/4 v2, 0x0

    .line 64
    aget v3, p1, v2

    .line 65
    .line 66
    aput v3, p0, v2

    .line 67
    .line 68
    const/4 v2, 0x1

    .line 69
    aget v3, p1, v2

    .line 70
    .line 71
    const/4 v4, 0x3

    .line 72
    aput v3, p0, v4

    .line 73
    .line 74
    const/4 v3, 0x2

    .line 75
    aget v3, p1, v3

    .line 76
    .line 77
    const/4 v5, 0x6

    .line 78
    aput v3, p0, v5

    .line 79
    .line 80
    aget v3, p1, v4

    .line 81
    .line 82
    aput v3, p0, v2

    .line 83
    .line 84
    const/4 v2, 0x4

    .line 85
    aget v3, p1, v2

    .line 86
    .line 87
    aput v3, p0, v2

    .line 88
    .line 89
    const/4 v2, 0x5

    .line 90
    aget p1, p1, v2

    .line 91
    .line 92
    const/4 v2, 0x7

    .line 93
    aput p1, p0, v2

    .line 94
    .line 95
    invoke-virtual {v1, p0}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setWarpMat([F)V

    .line 96
    .line 97
    .line 98
    invoke-interface {v0, v1}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchSegmentInfo(Lcom/momo/xeengine/cv/bean/CVSegmentInfo;)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_1
    new-instance p0, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 103
    .line 104
    invoke-direct {p0}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-interface {v0, p0}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchSegmentInfo(Lcom/momo/xeengine/cv/bean/CVSegmentInfo;)V

    .line 108
    .line 109
    .line 110
    :cond_2
    :goto_0
    return-void
.end method

.method public setSegmentInfo([BII)V
    .locals 1

    .line 111
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    if-eqz v0, :cond_2

    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 112
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    move-result-object p0

    if-eqz p1, :cond_1

    .line 113
    array-length v0, p1

    if-lez v0, :cond_1

    if-lez p2, :cond_1

    if-lez p3, :cond_1

    .line 114
    new-instance v0, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    invoke-direct {v0}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;-><init>()V

    .line 115
    invoke-virtual {v0, p1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setDatas([B)V

    .line 116
    invoke-virtual {v0, p3}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setHeight(I)V

    .line 117
    invoke-virtual {v0, p2}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setWidth(I)V

    .line 118
    array-length p1, p1

    invoke-virtual {v0, p1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setLength(I)V

    .line 119
    invoke-interface {p0, v0}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchSegmentInfo(Lcom/momo/xeengine/cv/bean/CVSegmentInfo;)V

    return-void

    :cond_1
    const/4 p1, 0x0

    .line 120
    invoke-interface {p0, p1}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchSegmentInfo(Lcom/momo/xeengine/cv/bean/CVSegmentInfo;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public setStylizeFaceInfo(Lcom/momocv/stylizeface/StylizefaceInfo;Z)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 6
    .line 7
    if-eqz v2, :cond_5

    .line 8
    .line 9
    invoke-interface {v2}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    goto/16 :goto_2

    .line 16
    .line 17
    :cond_0
    iget-object v0, v0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 18
    .line 19
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v2, 0x0

    .line 24
    if-eqz v1, :cond_4

    .line 25
    .line 26
    iget v3, v1, Lcom/momocv/stylizeface/StylizefaceInfo;->mask_width:I

    .line 27
    .line 28
    if-nez v3, :cond_1

    .line 29
    .line 30
    iget v3, v1, Lcom/momocv/stylizeface/StylizefaceInfo;->mask_height:I

    .line 31
    .line 32
    if-nez v3, :cond_1

    .line 33
    .line 34
    goto/16 :goto_1

    .line 35
    .line 36
    :cond_1
    iget-object v3, v1, Lcom/momocv/stylizeface/StylizefaceInfo;->mask_all:[[B

    .line 37
    .line 38
    if-eqz v3, :cond_3

    .line 39
    .line 40
    array-length v3, v3

    .line 41
    if-lez v3, :cond_3

    .line 42
    .line 43
    new-instance v2, Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .line 47
    .line 48
    const/4 v3, 0x0

    .line 49
    move v4, v3

    .line 50
    :goto_0
    iget-object v5, v1, Lcom/momocv/stylizeface/StylizefaceInfo;->mask_all:[[B

    .line 51
    .line 52
    array-length v6, v5

    .line 53
    if-ge v4, v6, :cond_2

    .line 54
    .line 55
    const/16 v6, 0x9

    .line 56
    .line 57
    new-array v6, v6, [F

    .line 58
    .line 59
    const/4 v7, 0x0

    .line 60
    aput v7, v6, v3

    .line 61
    .line 62
    const/4 v8, 0x1

    .line 63
    aput v7, v6, v8

    .line 64
    .line 65
    const/4 v9, 0x2

    .line 66
    aput v7, v6, v9

    .line 67
    .line 68
    const/4 v10, 0x3

    .line 69
    aput v7, v6, v10

    .line 70
    .line 71
    const/4 v11, 0x4

    .line 72
    const/high16 v12, 0x3f800000    # 1.0f

    .line 73
    .line 74
    aput v12, v6, v11

    .line 75
    .line 76
    const/4 v13, 0x5

    .line 77
    aput v7, v6, v13

    .line 78
    .line 79
    const/4 v14, 0x6

    .line 80
    aput v7, v6, v14

    .line 81
    .line 82
    const/4 v15, 0x7

    .line 83
    aput v7, v6, v15

    .line 84
    .line 85
    const/16 v7, 0x8

    .line 86
    .line 87
    aput v12, v6, v7

    .line 88
    .line 89
    aget-object v5, v5, v4

    .line 90
    .line 91
    new-instance v7, Lcom/momo/xeengine/cv/bean/XEMutableInfo;

    .line 92
    .line 93
    const-string v12, "stylizeface"

    .line 94
    .line 95
    invoke-direct {v7, v12}, Lcom/momo/xeengine/cv/bean/XEMutableInfo;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    new-instance v12, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 99
    .line 100
    invoke-direct {v12}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;-><init>()V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v12, v5}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setDatas([B)V

    .line 104
    .line 105
    .line 106
    iget v5, v1, Lcom/momocv/stylizeface/StylizefaceInfo;->mask_height:I

    .line 107
    .line 108
    invoke-virtual {v12, v5}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setHeight(I)V

    .line 109
    .line 110
    .line 111
    iget v5, v1, Lcom/momocv/stylizeface/StylizefaceInfo;->mask_width:I

    .line 112
    .line 113
    invoke-virtual {v12, v5}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setWidth(I)V

    .line 114
    .line 115
    .line 116
    iget-object v5, v1, Lcom/momocv/stylizeface/StylizefaceInfo;->mask_all:[[B

    .line 117
    .line 118
    aget-object v5, v5, v4

    .line 119
    .line 120
    array-length v5, v5

    .line 121
    invoke-virtual {v12, v5}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setLength(I)V

    .line 122
    .line 123
    .line 124
    iget-object v5, v1, Lcom/momocv/stylizeface/StylizefaceInfo;->warp_mat_all:[[F

    .line 125
    .line 126
    aget-object v5, v5, v4

    .line 127
    .line 128
    aget v16, v5, v3

    .line 129
    .line 130
    aput v16, v6, v3

    .line 131
    .line 132
    aget v16, v5, v8

    .line 133
    .line 134
    aput v16, v6, v10

    .line 135
    .line 136
    aget v9, v5, v9

    .line 137
    .line 138
    aput v9, v6, v14

    .line 139
    .line 140
    aget v9, v5, v10

    .line 141
    .line 142
    aput v9, v6, v8

    .line 143
    .line 144
    aget v8, v5, v11

    .line 145
    .line 146
    aput v8, v6, v11

    .line 147
    .line 148
    aget v5, v5, v13

    .line 149
    .line 150
    aput v5, v6, v15

    .line 151
    .line 152
    invoke-virtual {v12, v6}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setWarpMat([F)V

    .line 153
    .line 154
    .line 155
    move/from16 v5, p2

    .line 156
    .line 157
    invoke-virtual {v12, v5}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setFlipShowX(Z)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v7, v12}, Lcom/momo/xeengine/cv/bean/XEMutableInfo;->setMaskInfo1(Lcom/momo/xeengine/cv/bean/CVSegmentInfo;)V

    .line 161
    .line 162
    .line 163
    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    add-int/lit8 v4, v4, 0x1

    .line 167
    .line 168
    goto :goto_0

    .line 169
    :cond_2
    invoke-interface {v0, v2}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchMutableInfo(Ljava/util/List;)V

    .line 170
    .line 171
    .line 172
    return-void

    .line 173
    :cond_3
    invoke-interface {v0, v2}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchMutableInfo(Ljava/util/List;)V

    .line 174
    .line 175
    .line 176
    return-void

    .line 177
    :cond_4
    :goto_1
    invoke-interface {v0, v2}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchMutableInfo(Ljava/util/List;)V

    .line 178
    .line 179
    .line 180
    :cond_5
    :goto_2
    return-void
.end method

.method public touchHitTest(FFII)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineHelper;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-interface {p0}, Lcom/momo/xeengine/event/ITouchEventHandler;->handleTouchHitTest()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method
