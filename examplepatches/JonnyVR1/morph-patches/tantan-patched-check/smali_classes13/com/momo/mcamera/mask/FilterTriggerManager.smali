.class public Lcom/momo/mcamera/mask/FilterTriggerManager;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static INDEX_FACE_LEFT:I = 0x0

.field private static INDEX_FACE_RIGHT:I = 0x10

.field private static INDEX_MOUSE_DOWN:I = 0x42

.field private static INDEX_MOUSE_UP:I = 0x3e

.field public static final STATE_CLOSE:I = 0x1

.field public static final STATE_OPEN:I = 0x0

.field public static final TRIGER_CLICK:I = 0x800

.field public static final TRIGER_DUCK_FACE:I = 0x400

.field public static final TRIGER_EYE_BLINK:I = 0x100

.field public static final TRIGER_LEFT_EYE:I = 0x8

.field public static final TRIGER_LEFT_EYE_BLINK:I = 0x10

.field public static final TRIGER_MOUSE:I = 0x1

.field public static final TRIGER_RIGHT_EYE:I = 0x40

.field public static final TRIGER_RIGHT_EYE_BLINK:I = 0x80

.field public static final TRIGER_SMILE:I = 0x200


# instance fields
.field public duckFaceState:I

.field public expressionState:I

.field public eyeBlinkCount:I

.field public eyeBlinkState:I

.field private faceIndex:I

.field private flag:I

.field private hiddenFlag:I

.field public leftEyeBlinkCount:I

.field public leftEyeBlinkState:I

.field public leftEyeOpenAmount:F

.field public leftEyeOpenState:I

.field public mouseOpenState:I

.field public rightEyeBlinkCount:I

.field public rightEyeBlinkState:I

.field public rightEyeOpenAmount:F

.field public rightEyeOpenState:I

.field public smileState:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->mouseOpenState:I

    .line 6
    .line 7
    iput v0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->leftEyeBlinkState:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput v1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->leftEyeBlinkCount:I

    .line 11
    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->eyeBlinkState:I

    .line 13
    .line 14
    iput v1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->eyeBlinkCount:I

    .line 15
    .line 16
    iput v1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->rightEyeBlinkState:I

    .line 17
    .line 18
    iput v1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->rightEyeBlinkCount:I

    .line 19
    .line 20
    iput v1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->leftEyeOpenState:I

    .line 21
    .line 22
    iput v1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->rightEyeOpenState:I

    .line 23
    .line 24
    const/4 v2, -0x1

    .line 25
    iput v2, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->expressionState:I

    .line 26
    .line 27
    iput v0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->smileState:I

    .line 28
    .line 29
    iput v0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->duckFaceState:I

    .line 30
    .line 31
    const/high16 v0, 0x3f800000    # 1.0f

    .line 32
    .line 33
    iput v0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->leftEyeOpenAmount:F

    .line 34
    .line 35
    iput v0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->rightEyeOpenAmount:F

    .line 36
    .line 37
    iput v2, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->flag:I

    .line 38
    .line 39
    iput v2, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->hiddenFlag:I

    .line 40
    .line 41
    iput v1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->faceIndex:I

    .line 42
    .line 43
    return-void
.end method

.method private enable(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->flag:I

    .line 2
    .line 3
    or-int/2addr p1, v0

    .line 4
    iput p1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->flag:I

    .line 5
    .line 6
    return-void
.end method

.method private hiddenDisable(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->hiddenFlag:I

    .line 2
    .line 3
    not-int p1, p1

    .line 4
    and-int/2addr p1, v0

    .line 5
    iput p1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->hiddenFlag:I

    .line 6
    .line 7
    return-void
.end method

.method private hiddenEnable(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->hiddenFlag:I

    .line 2
    .line 3
    or-int/2addr p1, v0

    .line 4
    iput p1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->hiddenFlag:I

    .line 5
    .line 6
    return-void
.end method

.method private isContain(I)Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->flag:I

    .line 2
    .line 3
    and-int/2addr p0, p1

    .line 4
    if-ne p0, p1, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method private isHiddenContain(I)Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->hiddenFlag:I

    .line 2
    .line 3
    and-int/2addr p0, p1

    .line 4
    if-ne p0, p1, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public static isTriggerRegionMatches(Lcom/core/glcore/cv/MMCVBoxes;Ljava/lang/String;Lcom/momo/mcamera/mask/MaskModel;II)Z
    .locals 11

    .line 1
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/MaskModel;->getTriggerRegion()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_5

    .line 7
    .line 8
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/MaskModel;->getTriggerRegion()[I

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    array-length v0, v0

    .line 13
    const/4 v2, 0x3

    .line 14
    if-ne v0, v2, :cond_5

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v2, 0x0

    .line 21
    if-eqz v0, :cond_4

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    array-length v0, v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_0
    invoke-virtual {p0}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    array-length v0, p0

    .line 36
    const/4 v3, 0x0

    .line 37
    move v4, v2

    .line 38
    :goto_0
    if-ge v4, v0, :cond_2

    .line 39
    .line 40
    aget-object v5, p0, v4

    .line 41
    .line 42
    iget-object v6, v5, Lcom/momocv/MMBox;->class_name_:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v6

    .line 48
    if-eqz v6, :cond_1

    .line 49
    .line 50
    new-instance v3, Landroid/graphics/RectF;

    .line 51
    .line 52
    iget v6, v5, Lcom/momocv/MMRect;->x_:I

    .line 53
    .line 54
    int-to-float v7, v6

    .line 55
    iget v8, v5, Lcom/momocv/MMRect;->y_:I

    .line 56
    .line 57
    int-to-float v9, v8

    .line 58
    iget v10, v5, Lcom/momocv/MMRect;->width_:I

    .line 59
    .line 60
    add-int/2addr v6, v10

    .line 61
    int-to-float v6, v6

    .line 62
    iget v5, v5, Lcom/momocv/MMRect;->height_:I

    .line 63
    .line 64
    add-int/2addr v8, v5

    .line 65
    int-to-float v5, v8

    .line 66
    invoke-direct {v3, v7, v9, v6, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 67
    .line 68
    .line 69
    new-instance v5, Landroid/graphics/PointF;

    .line 70
    .line 71
    invoke-virtual {v3}, Landroid/graphics/RectF;->centerX()F

    .line 72
    .line 73
    .line 74
    move-result v6

    .line 75
    invoke-virtual {v3}, Landroid/graphics/RectF;->centerY()F

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    invoke-direct {v5, v6, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 80
    .line 81
    .line 82
    move-object v3, v5

    .line 83
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_2
    if-nez v3, :cond_3

    .line 87
    .line 88
    return v2

    .line 89
    :cond_3
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/MaskModel;->getTriggerRegion()[I

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    aget p1, p0, v2

    .line 94
    .line 95
    aget p2, p0, v1

    .line 96
    .line 97
    const/4 v0, 0x2

    .line 98
    aget p0, p0, v0

    .line 99
    .line 100
    div-int/2addr p3, p1

    .line 101
    int-to-float p3, p3

    .line 102
    div-int/2addr p4, p1

    .line 103
    int-to-float p4, p4

    .line 104
    new-instance v0, Landroid/graphics/RectF;

    .line 105
    .line 106
    rem-int p1, p0, p1

    .line 107
    .line 108
    int-to-float p1, p1

    .line 109
    mul-float/2addr p1, p3

    .line 110
    div-int/2addr p0, p2

    .line 111
    int-to-float p0, p0

    .line 112
    mul-float/2addr p0, p4

    .line 113
    add-float/2addr p3, p1

    .line 114
    add-float/2addr p4, p0

    .line 115
    invoke-direct {v0, p1, p0, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 116
    .line 117
    .line 118
    iget p0, v3, Landroid/graphics/PointF;->x:F

    .line 119
    .line 120
    iget p1, v3, Landroid/graphics/PointF;->y:F

    .line 121
    .line 122
    invoke-virtual {v0, p0, p1}, Landroid/graphics/RectF;->contains(FF)Z

    .line 123
    .line 124
    .line 125
    move-result p0

    .line 126
    return p0

    .line 127
    :cond_4
    :goto_1
    return v2

    .line 128
    :cond_5
    return v1
.end method


# virtual methods
.method public adjustStateBy(Ll/omw;)V
    .locals 8

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_4

    .line 4
    .line 5
    :cond_0
    iget v0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->faceIndex:I

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x0

    .line 12
    if-lt v0, v1, :cond_1

    .line 13
    .line 14
    iput v2, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->faceIndex:I

    .line 15
    .line 16
    :cond_1
    iget v0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->faceIndex:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Ll/omw;->j(I)Ll/nuf;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    if-eqz p1, :cond_11

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    invoke-direct {p0, v0}, Lcom/momo/mcamera/mask/FilterTriggerManager;->isContain(I)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_2

    .line 30
    .line 31
    invoke-direct {p0, v0}, Lcom/momo/mcamera/mask/FilterTriggerManager;->isHiddenContain(I)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_3

    .line 36
    .line 37
    :cond_2
    invoke-virtual {p1}, Ll/nuf;->l()[F

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {p0, v1}, Lcom/momo/mcamera/mask/FilterTriggerManager;->updateMouseState([F)V

    .line 42
    .line 43
    .line 44
    :cond_3
    const/16 v1, 0x400

    .line 45
    .line 46
    invoke-direct {p0, v1}, Lcom/momo/mcamera/mask/FilterTriggerManager;->isContain(I)Z

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    if-nez v3, :cond_4

    .line 51
    .line 52
    const/16 v3, 0x200

    .line 53
    .line 54
    invoke-direct {p0, v3}, Lcom/momo/mcamera/mask/FilterTriggerManager;->isContain(I)Z

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    if-nez v4, :cond_4

    .line 59
    .line 60
    invoke-direct {p0, v1}, Lcom/momo/mcamera/mask/FilterTriggerManager;->isHiddenContain(I)Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-nez v1, :cond_4

    .line 65
    .line 66
    invoke-direct {p0, v3}, Lcom/momo/mcamera/mask/FilterTriggerManager;->isHiddenContain(I)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_6

    .line 71
    .line 72
    :cond_4
    iput v0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->smileState:I

    .line 73
    .line 74
    iput v0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->duckFaceState:I

    .line 75
    .line 76
    invoke-virtual {p1}, Ll/nuf;->d()I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-ne v1, v0, :cond_5

    .line 81
    .line 82
    iput v2, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->duckFaceState:I

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_5
    invoke-virtual {p1}, Ll/nuf;->d()I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    const/4 v3, 0x2

    .line 90
    if-ne v1, v3, :cond_6

    .line 91
    .line 92
    iput v2, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->smileState:I

    .line 93
    .line 94
    :cond_6
    :goto_0
    const/16 v1, 0x8

    .line 95
    .line 96
    invoke-direct {p0, v1}, Lcom/momo/mcamera/mask/FilterTriggerManager;->isContain(I)Z

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    const/16 v4, 0x100

    .line 101
    .line 102
    const/16 v5, 0x80

    .line 103
    .line 104
    const/16 v6, 0x10

    .line 105
    .line 106
    if-nez v3, :cond_7

    .line 107
    .line 108
    const/16 v3, 0x40

    .line 109
    .line 110
    invoke-direct {p0, v3}, Lcom/momo/mcamera/mask/FilterTriggerManager;->isContain(I)Z

    .line 111
    .line 112
    .line 113
    move-result v7

    .line 114
    if-nez v7, :cond_7

    .line 115
    .line 116
    invoke-direct {p0, v6}, Lcom/momo/mcamera/mask/FilterTriggerManager;->isContain(I)Z

    .line 117
    .line 118
    .line 119
    move-result v7

    .line 120
    if-nez v7, :cond_7

    .line 121
    .line 122
    invoke-direct {p0, v5}, Lcom/momo/mcamera/mask/FilterTriggerManager;->isContain(I)Z

    .line 123
    .line 124
    .line 125
    move-result v7

    .line 126
    if-nez v7, :cond_7

    .line 127
    .line 128
    invoke-direct {p0, v1}, Lcom/momo/mcamera/mask/FilterTriggerManager;->isHiddenContain(I)Z

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    if-nez v1, :cond_7

    .line 133
    .line 134
    invoke-direct {p0, v3}, Lcom/momo/mcamera/mask/FilterTriggerManager;->isHiddenContain(I)Z

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    if-nez v1, :cond_7

    .line 139
    .line 140
    invoke-direct {p0, v4}, Lcom/momo/mcamera/mask/FilterTriggerManager;->isHiddenContain(I)Z

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    if-nez v1, :cond_7

    .line 145
    .line 146
    invoke-direct {p0, v6}, Lcom/momo/mcamera/mask/FilterTriggerManager;->isHiddenContain(I)Z

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    if-nez v1, :cond_7

    .line 151
    .line 152
    invoke-direct {p0, v5}, Lcom/momo/mcamera/mask/FilterTriggerManager;->isHiddenContain(I)Z

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    if-eqz v1, :cond_8

    .line 157
    .line 158
    :cond_7
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/FilterTriggerManager;->updateEyeState(Ll/nuf;)V

    .line 159
    .line 160
    .line 161
    :cond_8
    invoke-direct {p0, v6}, Lcom/momo/mcamera/mask/FilterTriggerManager;->isContain(I)Z

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    if-nez p1, :cond_9

    .line 166
    .line 167
    invoke-direct {p0, v5}, Lcom/momo/mcamera/mask/FilterTriggerManager;->isContain(I)Z

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    if-nez p1, :cond_9

    .line 172
    .line 173
    invoke-direct {p0, v4}, Lcom/momo/mcamera/mask/FilterTriggerManager;->isContain(I)Z

    .line 174
    .line 175
    .line 176
    move-result p1

    .line 177
    if-nez p1, :cond_9

    .line 178
    .line 179
    invoke-direct {p0, v6}, Lcom/momo/mcamera/mask/FilterTriggerManager;->isHiddenContain(I)Z

    .line 180
    .line 181
    .line 182
    move-result p1

    .line 183
    if-nez p1, :cond_9

    .line 184
    .line 185
    invoke-direct {p0, v5}, Lcom/momo/mcamera/mask/FilterTriggerManager;->isHiddenContain(I)Z

    .line 186
    .line 187
    .line 188
    move-result p1

    .line 189
    if-eqz p1, :cond_11

    .line 190
    .line 191
    :cond_9
    iget p1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->rightEyeOpenState:I

    .line 192
    .line 193
    if-nez p1, :cond_b

    .line 194
    .line 195
    iget v1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->leftEyeOpenState:I

    .line 196
    .line 197
    if-ne v1, v0, :cond_b

    .line 198
    .line 199
    iget v1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->leftEyeBlinkCount:I

    .line 200
    .line 201
    add-int/2addr v1, v0

    .line 202
    iput v1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->leftEyeBlinkCount:I

    .line 203
    .line 204
    if-le v1, v0, :cond_a

    .line 205
    .line 206
    iput v2, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->leftEyeBlinkState:I

    .line 207
    .line 208
    goto :goto_1

    .line 209
    :cond_a
    iput v0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->leftEyeBlinkState:I

    .line 210
    .line 211
    goto :goto_1

    .line 212
    :cond_b
    iput v2, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->leftEyeBlinkCount:I

    .line 213
    .line 214
    iput v0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->leftEyeBlinkState:I

    .line 215
    .line 216
    :goto_1
    if-ne p1, v0, :cond_d

    .line 217
    .line 218
    iget v1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->leftEyeOpenState:I

    .line 219
    .line 220
    if-nez v1, :cond_d

    .line 221
    .line 222
    iget v1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->rightEyeBlinkCount:I

    .line 223
    .line 224
    add-int/2addr v1, v0

    .line 225
    iput v1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->rightEyeBlinkCount:I

    .line 226
    .line 227
    if-le v1, v0, :cond_c

    .line 228
    .line 229
    iput v2, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->rightEyeBlinkState:I

    .line 230
    .line 231
    goto :goto_2

    .line 232
    :cond_c
    iput v0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->rightEyeBlinkState:I

    .line 233
    .line 234
    goto :goto_2

    .line 235
    :cond_d
    iput v2, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->rightEyeBlinkCount:I

    .line 236
    .line 237
    iput v0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->rightEyeBlinkState:I

    .line 238
    .line 239
    :goto_2
    if-eq p1, v0, :cond_f

    .line 240
    .line 241
    iget p1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->leftEyeOpenState:I

    .line 242
    .line 243
    if-ne p1, v0, :cond_e

    .line 244
    .line 245
    goto :goto_3

    .line 246
    :cond_e
    iput v2, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->eyeBlinkCount:I

    .line 247
    .line 248
    iput v0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->eyeBlinkState:I

    .line 249
    .line 250
    return-void

    .line 251
    :cond_f
    :goto_3
    iget p1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->eyeBlinkCount:I

    .line 252
    .line 253
    add-int/2addr p1, v0

    .line 254
    iput p1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->eyeBlinkCount:I

    .line 255
    .line 256
    if-le p1, v0, :cond_10

    .line 257
    .line 258
    iput v2, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->eyeBlinkState:I

    .line 259
    .line 260
    return-void

    .line 261
    :cond_10
    iput v0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->eyeBlinkState:I

    .line 262
    .line 263
    :cond_11
    :goto_4
    return-void
.end method

.method public disable(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->flag:I

    .line 2
    .line 3
    not-int p1, p1

    .line 4
    and-int/2addr p1, v0

    .line 5
    iput p1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->flag:I

    .line 6
    .line 7
    return-void
.end method

.method public getTriggerStateByTriggerType(I)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->mouseOpenState:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq p1, v1, :cond_7

    .line 5
    .line 6
    const/16 v1, 0x8

    .line 7
    .line 8
    if-eq p1, v1, :cond_6

    .line 9
    .line 10
    const/16 v1, 0x10

    .line 11
    .line 12
    if-eq p1, v1, :cond_5

    .line 13
    .line 14
    const/16 v1, 0x40

    .line 15
    .line 16
    if-eq p1, v1, :cond_4

    .line 17
    .line 18
    const/16 v1, 0x80

    .line 19
    .line 20
    if-eq p1, v1, :cond_3

    .line 21
    .line 22
    const/16 v1, 0x100

    .line 23
    .line 24
    if-eq p1, v1, :cond_2

    .line 25
    .line 26
    const/16 v1, 0x200

    .line 27
    .line 28
    if-eq p1, v1, :cond_1

    .line 29
    .line 30
    const/16 v1, 0x400

    .line 31
    .line 32
    if-eq p1, v1, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget p0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->duckFaceState:I

    .line 36
    .line 37
    return p0

    .line 38
    :cond_1
    iget p0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->smileState:I

    .line 39
    .line 40
    return p0

    .line 41
    :cond_2
    iget p0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->eyeBlinkState:I

    .line 42
    .line 43
    return p0

    .line 44
    :cond_3
    iget p0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->rightEyeBlinkState:I

    .line 45
    .line 46
    return p0

    .line 47
    :cond_4
    iget p0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->rightEyeOpenState:I

    .line 48
    .line 49
    return p0

    .line 50
    :cond_5
    iget p0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->leftEyeBlinkState:I

    .line 51
    .line 52
    return p0

    .line 53
    :cond_6
    iget p0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->leftEyeOpenState:I

    .line 54
    .line 55
    return p0

    .line 56
    :cond_7
    :goto_0
    return v0
.end method

.method public objectTriggerTypeProcess(Lcom/momo/mcamera/mask/Sticker;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;Z)Z
    .locals 5

    .line 1
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getHiddenObjectTriggerType()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    array-length v2, v0

    .line 29
    move v3, v1

    .line 30
    :goto_0
    if-ge v3, v2, :cond_1

    .line 31
    .line 32
    aget-object v4, v0, v3

    .line 33
    .line 34
    iget-object v4, v4, Lcom/momocv/MMBox;->class_name_:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    if-eqz v4, :cond_0

    .line 41
    .line 42
    return v1

    .line 43
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getObjectTriggerType()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    const/4 v0, 0x1

    .line 55
    if-nez p1, :cond_6

    .line 56
    .line 57
    const-string p1, "game_over"

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-eqz p1, :cond_2

    .line 64
    .line 65
    return p3

    .line 66
    :cond_2
    iget-object p1, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 67
    .line 68
    if-eqz p1, :cond_5

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    if-eqz p1, :cond_5

    .line 75
    .line 76
    iget-object p1, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    array-length p1, p1

    .line 83
    if-lez p1, :cond_5

    .line 84
    .line 85
    iget-object p1, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

    .line 86
    .line 87
    invoke-virtual {p1}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    array-length p2, p1

    .line 92
    move p3, v1

    .line 93
    :goto_1
    if-ge p3, p2, :cond_4

    .line 94
    .line 95
    aget-object v2, p1, p3

    .line 96
    .line 97
    iget-object v2, v2, Lcom/momocv/MMBox;->class_name_:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    if-eqz v2, :cond_3

    .line 104
    .line 105
    return v0

    .line 106
    :cond_3
    add-int/lit8 p3, p3, 0x1

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_4
    return v1

    .line 110
    :cond_5
    iget-object p0, p2, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->gestureRect:Landroid/graphics/RectF;

    .line 111
    .line 112
    if-nez p0, :cond_6

    .line 113
    .line 114
    return v1

    .line 115
    :cond_6
    return v0
.end method

.method public setHiddenTriggerType(I)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->hiddenFlag:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iput p1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->hiddenFlag:I

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/FilterTriggerManager;->hiddenEnable(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setTriggerFaceIndex(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->faceIndex:I

    .line 2
    .line 3
    return-void
.end method

.method public setTriggerType(I)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->flag:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iput p1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->flag:I

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/FilterTriggerManager;->enable(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public triggerTypeProcess(Lcom/momo/mcamera/mask/Sticker;Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;)Z
    .locals 5

    .line 1
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getTriggerType()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-lez v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getTriggerType()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/mask/FilterTriggerManager;->getTriggerStateByTriggerType(I)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p1, v0}, Lcom/momo/mcamera/mask/Sticker;->setTriggerState(I)V

    .line 18
    .line 19
    .line 20
    if-eqz p2, :cond_0

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getTriggerType()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getTriggerType()I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    invoke-virtual {p0, v3}, Lcom/momo/mcamera/mask/FilterTriggerManager;->getTriggerStateByTriggerType(I)I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    invoke-interface {p2, v0, v3}, Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;->stickerStateChanged(II)V

    .line 35
    .line 36
    .line 37
    :cond_0
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getTriggerState()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-ne v0, v2, :cond_1

    .line 42
    .line 43
    move v0, v1

    .line 44
    goto :goto_0

    .line 45
    :cond_1
    move v0, v2

    .line 46
    :goto_0
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getHiddenTriggerType()I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    if-lez v3, :cond_7

    .line 51
    .line 52
    invoke-virtual {p0, v3}, Lcom/momo/mcamera/mask/FilterTriggerManager;->getTriggerStateByTriggerType(I)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    invoke-virtual {p1, v0}, Lcom/momo/mcamera/mask/Sticker;->setTriggerState(I)V

    .line 57
    .line 58
    .line 59
    if-eqz p2, :cond_2

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getTriggerType()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getTriggerType()I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    invoke-virtual {p0, v4}, Lcom/momo/mcamera/mask/FilterTriggerManager;->getTriggerStateByTriggerType(I)I

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    invoke-interface {p2, v0, p0}, Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;->stickerStateChanged(II)V

    .line 74
    .line 75
    .line 76
    :cond_2
    const/16 p0, 0x8

    .line 77
    .line 78
    if-eq v3, p0, :cond_5

    .line 79
    .line 80
    const/16 p0, 0x40

    .line 81
    .line 82
    if-ne v3, p0, :cond_3

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_3
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getTriggerState()I

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-eqz p0, :cond_4

    .line 90
    .line 91
    return v2

    .line 92
    :cond_4
    return v1

    .line 93
    :cond_5
    :goto_1
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getTriggerState()I

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    if-nez p0, :cond_6

    .line 98
    .line 99
    return v2

    .line 100
    :cond_6
    return v1

    .line 101
    :cond_7
    return v0
.end method

.method public updateEyeState(Ll/nuf;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Ll/nuf;->n()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->leftEyeOpenAmount:F

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/nuf;->t()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->rightEyeOpenAmount:F

    .line 12
    .line 13
    iget v0, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->leftEyeOpenAmount:F

    .line 14
    .line 15
    float-to-double v0, v0

    .line 16
    const-wide v2, 0x3fe6666666666666L    # 0.7

    .line 17
    .line 18
    .line 19
    .line 20
    .line 21
    cmpl-double v0, v0, v2

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    const/4 v4, 0x1

    .line 25
    if-ltz v0, :cond_0

    .line 26
    .line 27
    iput v4, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->leftEyeOpenState:I

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iput v1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->leftEyeOpenState:I

    .line 31
    .line 32
    :goto_0
    float-to-double v5, p1

    .line 33
    cmpl-double p1, v5, v2

    .line 34
    .line 35
    if-ltz p1, :cond_1

    .line 36
    .line 37
    iput v4, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->rightEyeOpenState:I

    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    iput v1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->rightEyeOpenState:I

    .line 41
    .line 42
    return-void
.end method

.method public updateMouseState([F)V
    .locals 10

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    sget v0, Lcom/momo/mcamera/mask/FilterTriggerManager;->INDEX_FACE_LEFT:I

    .line 8
    .line 9
    aget v1, p1, v0

    .line 10
    .line 11
    add-int/lit8 v0, v0, 0x44

    .line 12
    .line 13
    aget v0, p1, v0

    .line 14
    .line 15
    sget v2, Lcom/momo/mcamera/mask/FilterTriggerManager;->INDEX_FACE_RIGHT:I

    .line 16
    .line 17
    aget v3, p1, v2

    .line 18
    .line 19
    add-int/lit8 v2, v2, 0x44

    .line 20
    .line 21
    aget v2, p1, v2

    .line 22
    .line 23
    sget v4, Lcom/momo/mcamera/mask/FilterTriggerManager;->INDEX_MOUSE_DOWN:I

    .line 24
    .line 25
    aget v5, p1, v4

    .line 26
    .line 27
    add-int/lit8 v4, v4, 0x44

    .line 28
    .line 29
    aget v4, p1, v4

    .line 30
    .line 31
    sget v6, Lcom/momo/mcamera/mask/FilterTriggerManager;->INDEX_MOUSE_UP:I

    .line 32
    .line 33
    aget v7, p1, v6

    .line 34
    .line 35
    add-int/lit8 v6, v6, 0x44

    .line 36
    .line 37
    aget p1, p1, v6

    .line 38
    .line 39
    sub-float/2addr v1, v3

    .line 40
    float-to-double v8, v1

    .line 41
    sub-float/2addr v0, v2

    .line 42
    float-to-double v0, v0

    .line 43
    invoke-static {v8, v9, v0, v1}, Ljava/lang/Math;->hypot(DD)D

    .line 44
    .line 45
    .line 46
    move-result-wide v0

    .line 47
    double-to-float v0, v0

    .line 48
    sub-float/2addr v7, v5

    .line 49
    float-to-double v1, v7

    .line 50
    sub-float/2addr p1, v4

    .line 51
    float-to-double v3, p1

    .line 52
    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->hypot(DD)D

    .line 53
    .line 54
    .line 55
    move-result-wide v1

    .line 56
    double-to-float p1, v1

    .line 57
    iget v1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->mouseOpenState:I

    .line 58
    .line 59
    const/4 v2, 0x1

    .line 60
    const/high16 v3, 0x3f800000    # 1.0f

    .line 61
    .line 62
    if-nez v1, :cond_1

    .line 63
    .line 64
    float-to-double v4, p1

    .line 65
    mul-float/2addr v0, v3

    .line 66
    float-to-double v0, v0

    .line 67
    const-wide/high16 v6, 0x402c000000000000L    # 14.0

    .line 68
    .line 69
    div-double/2addr v0, v6

    .line 70
    cmpg-double p1, v4, v0

    .line 71
    .line 72
    if-gez p1, :cond_3

    .line 73
    .line 74
    iput v2, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->mouseOpenState:I

    .line 75
    .line 76
    return-void

    .line 77
    :cond_1
    mul-float/2addr v0, v3

    .line 78
    const/high16 v1, 0x41200000    # 10.0f

    .line 79
    .line 80
    div-float/2addr v0, v1

    .line 81
    cmpl-float p1, p1, v0

    .line 82
    .line 83
    if-lez p1, :cond_2

    .line 84
    .line 85
    const/4 p1, 0x0

    .line 86
    iput p1, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->mouseOpenState:I

    .line 87
    .line 88
    return-void

    .line 89
    :cond_2
    iput v2, p0, Lcom/momo/mcamera/mask/FilterTriggerManager;->mouseOpenState:I

    .line 90
    .line 91
    :cond_3
    :goto_0
    return-void
.end method
