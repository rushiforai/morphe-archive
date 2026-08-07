.class public Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;
.super Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState$b;
    }
.end annotation


# static fields
.field public static q:I = 0xa


# instance fields
.field public a:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

.field public b:F

.field public c:F

.field public d:F

.field public e:F

.field public f:F

.field public g:F

.field public h:F

.field public i:F

.field public j:F

.field public k:Z

.field public l:Z

.field public m:I

.field public n:I

.field public o:I

.field public p:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x41c80000    # 25.0f

    .line 5
    .line 6
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->b:F

    .line 7
    .line 8
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->c:F

    .line 9
    .line 10
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->d:F

    .line 11
    .line 12
    const v0, 0x3f19999a    # 0.6f

    .line 13
    .line 14
    .line 15
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->e:F

    .line 16
    .line 17
    const v0, 0x3dcccccd    # 0.1f

    .line 18
    .line 19
    .line 20
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->f:F

    .line 21
    .line 22
    const v0, 0x3f733333    # 0.95f

    .line 23
    .line 24
    .line 25
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->g:F

    .line 26
    .line 27
    const/high16 v0, 0x3e800000    # 0.25f

    .line 28
    .line 29
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->h:F

    .line 30
    .line 31
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->i:F

    .line 32
    .line 33
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->j:F

    .line 34
    .line 35
    const/16 v0, 0x63

    .line 36
    .line 37
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->n:I

    .line 38
    .line 39
    const/16 v0, 0x5a

    .line 40
    .line 41
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->o:I

    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->p:Z

    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 222
    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    const-string v0, "ui_action"

    .line 223
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "ui_tips"

    .line 224
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    return-void
.end method

.method public final a(Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;)Z
    .locals 7

    .line 1
    const-string v0, "FaceQualityState"

    .line 2
    .line 3
    const-string v1, ","

    .line 4
    .line 5
    iget-object p1, p1, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceShape:[F

    .line 6
    .line 7
    const/16 v2, 0x20

    .line 8
    .line 9
    aget v2, p1, v2

    .line 10
    .line 11
    const/16 v3, 0x28

    .line 12
    .line 13
    aget v3, p1, v3

    .line 14
    .line 15
    sub-float/2addr v2, v3

    .line 16
    const/16 v3, 0x21

    .line 17
    .line 18
    aget v3, p1, v3

    .line 19
    .line 20
    const/16 v4, 0x29

    .line 21
    .line 22
    aget v4, p1, v4

    .line 23
    .line 24
    sub-float/2addr v3, v4

    .line 25
    mul-float/2addr v2, v2

    .line 26
    mul-float/2addr v3, v3

    .line 27
    add-float/2addr v2, v3

    .line 28
    float-to-double v2, v2

    .line 29
    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    .line 30
    .line 31
    .line 32
    move-result-wide v2

    .line 33
    double-to-float v2, v2

    .line 34
    const/16 v3, 0x24

    .line 35
    .line 36
    aget v3, p1, v3

    .line 37
    .line 38
    const/16 v4, 0x2c

    .line 39
    .line 40
    aget v4, p1, v4

    .line 41
    .line 42
    sub-float/2addr v3, v4

    .line 43
    const/16 v4, 0x25

    .line 44
    .line 45
    aget v4, p1, v4

    .line 46
    .line 47
    const/16 v5, 0x2d

    .line 48
    .line 49
    aget v5, p1, v5

    .line 50
    .line 51
    sub-float/2addr v4, v5

    .line 52
    mul-float/2addr v3, v3

    .line 53
    mul-float/2addr v4, v4

    .line 54
    add-float/2addr v3, v4

    .line 55
    float-to-double v3, v3

    .line 56
    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    .line 57
    .line 58
    .line 59
    move-result-wide v3

    .line 60
    double-to-float v3, v3

    .line 61
    div-float/2addr v3, v2

    .line 62
    const/16 v2, 0x38

    .line 63
    .line 64
    aget v2, p1, v2

    .line 65
    .line 66
    const/16 v4, 0x30

    .line 67
    .line 68
    aget v4, p1, v4

    .line 69
    .line 70
    sub-float/2addr v2, v4

    .line 71
    const/16 v4, 0x39

    .line 72
    .line 73
    aget v4, p1, v4

    .line 74
    .line 75
    const/16 v5, 0x31

    .line 76
    .line 77
    aget v5, p1, v5

    .line 78
    .line 79
    sub-float/2addr v4, v5

    .line 80
    mul-float/2addr v2, v2

    .line 81
    mul-float/2addr v4, v4

    .line 82
    add-float/2addr v2, v4

    .line 83
    float-to-double v4, v2

    .line 84
    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    .line 85
    .line 86
    .line 87
    move-result-wide v4

    .line 88
    double-to-float v2, v4

    .line 89
    const/16 v4, 0x34

    .line 90
    .line 91
    aget v4, p1, v4

    .line 92
    .line 93
    const/16 v5, 0x3c

    .line 94
    .line 95
    aget v5, p1, v5

    .line 96
    .line 97
    sub-float/2addr v4, v5

    .line 98
    const/16 v5, 0x35

    .line 99
    .line 100
    aget v5, p1, v5

    .line 101
    .line 102
    const/16 v6, 0x3d

    .line 103
    .line 104
    aget p1, p1, v6

    .line 105
    .line 106
    sub-float/2addr v5, p1

    .line 107
    mul-float/2addr v4, v4

    .line 108
    mul-float/2addr v5, v5

    .line 109
    add-float/2addr v4, v5

    .line 110
    float-to-double v4, v4

    .line 111
    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    .line 112
    .line 113
    .line 114
    move-result-wide v4

    .line 115
    double-to-float p1, v4

    .line 116
    div-float/2addr p1, v2

    .line 117
    iget v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->h:F

    .line 118
    .line 119
    cmpl-float v2, v3, v2

    .line 120
    .line 121
    if-lez v2, :cond_0

    .line 122
    .line 123
    iget v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->i:F

    .line 124
    .line 125
    cmpl-float v2, p1, v2

    .line 126
    .line 127
    if-lez v2, :cond_0

    .line 128
    .line 129
    const/4 v2, 0x1

    .line 130
    goto :goto_0

    .line 131
    :cond_0
    const/4 v2, 0x0

    .line 132
    :goto_0
    if-nez v2, :cond_1

    .line 133
    .line 134
    new-instance v4, Lorg/json/JSONObject;

    .line 135
    .line 136
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 137
    .line 138
    .line 139
    :try_start_0
    const-string v5, "quality_type"

    .line 140
    .line 141
    const-string v6, "eye_close"

    .line 142
    .line 143
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 144
    .line 145
    .line 146
    const-string v5, "quality_score"

    .line 147
    .line 148
    :try_start_1
    new-instance v6, Ljava/lang/StringBuilder;

    .line 149
    .line 150
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    invoke-virtual {v4, v5, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 167
    .line 168
    .line 169
    const-string p1, "quality_thr"

    .line 170
    .line 171
    :try_start_2
    new-instance v3, Ljava/lang/StringBuilder;

    .line 172
    .line 173
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 174
    .line 175
    .line 176
    iget v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->h:F

    .line 177
    .line 178
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    iget p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->i:F

    .line 185
    .line 186
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    invoke-virtual {v4, p1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    .line 194
    .line 195
    .line 196
    goto :goto_1

    .line 197
    :catch_0
    move-exception p0

    .line 198
    const-string p1, "make log json error"

    .line 199
    .line 200
    invoke-static {v0, p1, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 201
    .line 202
    .line 203
    :goto_1
    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    invoke-static {v0, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 208
    .line 209
    .line 210
    :cond_1
    return v2
.end method

.method public final a(Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;FF)Z
    .locals 11

    .line 211
    const-string v0, "FaceQualityState"

    const-string v1, "x:"

    iget-object v2, p1, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceRect:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    .line 212
    iget-object v3, p1, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceRect:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v3

    .line 213
    iget v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->e:F

    mul-float v5, p3, v4

    int-to-float v2, v2

    cmpg-float v5, v2, v5

    const/4 v6, 0x1

    if-gez v5, :cond_3

    div-float v5, p2, p3

    div-float v7, v2, p3

    cmpg-float v8, v7, v4

    if-gez v8, :cond_0

    .line 214
    iget p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->f:F

    cmpg-float v8, p0, v4

    if-gez v8, :cond_0

    sub-float/2addr v7, p0

    sub-float/2addr v4, p0

    div-float/2addr v7, v4

    float-to-double v7, v7

    const-wide v9, 0x3fb999999999999aL    # 0.1

    mul-double/2addr v7, v9

    double-to-float p0, v7

    goto :goto_0

    :cond_0
    const p0, 0x3c23d70a    # 0.01f

    :goto_0
    const v4, 0x3f1c28f6    # 0.61f

    add-float/2addr p0, v4

    div-float/2addr v2, p0

    mul-float/2addr v5, v2

    int-to-float p0, v3

    cmpl-float v3, p0, v5

    if-lez v3, :cond_1

    move v5, p0

    .line 215
    :cond_1
    iget-object p0, p1, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceRect:Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result p0

    int-to-float p0, p0

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr p0, v3

    iget-object v4, p1, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceRect:Landroid/graphics/Rect;

    iget v7, v4, Landroid/graphics/Rect;->left:I

    int-to-float v7, v7

    add-float/2addr p0, v7

    .line 216
    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v4, v3

    iget-object p1, p1, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->top:I

    int-to-float p1, p1

    add-float/2addr v4, p1

    div-float p1, v2, v3

    sub-float/2addr v4, p1

    div-float p1, v5, v3

    sub-float/2addr p0, p1

    add-float p1, v5, p0

    cmpg-float p1, p1, p2

    if-gez p1, :cond_2

    add-float p1, v2, v4

    cmpg-float p1, p1, p3

    if-gez p1, :cond_2

    const/4 p1, 0x0

    cmpl-float p2, p0, p1

    if-lez p2, :cond_2

    cmpl-float p1, v4, p1

    if-lez p1, :cond_2

    goto :goto_1

    :cond_2
    const/4 v6, 0x0

    :goto_1
    if-nez v6, :cond_3

    .line 217
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string p2, "quality_type"

    const-string p3, "face_not_center"

    .line 218
    invoke-virtual {p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const-string p2, "quality_score"

    .line 219
    :try_start_1
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p0, ",y:"

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p0, "height:"

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p0, ",width:"

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    :catch_0
    move-exception p0

    const-string p2, "make log json error"

    .line 220
    invoke-static {v0, p2, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 221
    :goto_2
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_3
    return v6
.end method

.method public final b(Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;)Z
    .locals 5

    .line 1
    const-string v0, "FaceQualityState"

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceShape:[F

    .line 4
    .line 5
    const/16 v1, 0x81

    .line 6
    .line 7
    aget v1, p1, v1

    .line 8
    .line 9
    const/16 v2, 0x6d

    .line 10
    .line 11
    aget v2, p1, v2

    .line 12
    .line 13
    add-float/2addr v1, v2

    .line 14
    const/high16 v2, 0x40000000    # 2.0f

    .line 15
    .line 16
    div-float/2addr v1, v2

    .line 17
    const/16 v3, 0x77

    .line 18
    .line 19
    aget v3, p1, v3

    .line 20
    .line 21
    const/16 v4, 0x61

    .line 22
    .line 23
    aget v4, p1, v4

    .line 24
    .line 25
    add-float/2addr v3, v4

    .line 26
    div-float/2addr v3, v2

    .line 27
    sub-float/2addr v1, v3

    .line 28
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    const/16 v2, 0x5a

    .line 33
    .line 34
    aget v2, p1, v2

    .line 35
    .line 36
    const/16 v3, 0x66

    .line 37
    .line 38
    aget p1, p1, v3

    .line 39
    .line 40
    sub-float/2addr v2, p1

    .line 41
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    div-float/2addr v1, p1

    .line 46
    iget p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->j:F

    .line 47
    .line 48
    cmpg-float p1, v1, p1

    .line 49
    .line 50
    if-gez p1, :cond_0

    .line 51
    .line 52
    const/4 p1, 0x1

    .line 53
    goto :goto_0

    .line 54
    :cond_0
    const/4 p1, 0x0

    .line 55
    :goto_0
    if-nez p1, :cond_1

    .line 56
    .line 57
    new-instance v2, Lorg/json/JSONObject;

    .line 58
    .line 59
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 60
    .line 61
    .line 62
    :try_start_0
    const-string v3, "quality_type"

    .line 63
    .line 64
    const-string v4, "mouth_cLose"

    .line 65
    .line 66
    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 67
    .line 68
    .line 69
    float-to-double v3, v1

    .line 70
    const-string v1, "quality_score"

    .line 71
    .line 72
    invoke-virtual {v2, v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .line 74
    .line 75
    const-string v1, "quality_thr"

    .line 76
    .line 77
    :try_start_1
    iget p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->j:F

    .line 78
    .line 79
    float-to-double v3, p0

    .line 80
    invoke-virtual {v2, v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :catch_0
    move-exception p0

    .line 85
    const-string v1, "make log json error"

    .line 86
    .line 87
    invoke-static {v0, v1, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 88
    .line 89
    .line 90
    :goto_1
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-static {v0, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    :cond_1
    return p1
.end method

.method public enter()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->enter()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public enterFirst()V
    .locals 8

    .line 1
    const-string v0, "FaceQualityState"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {p0, v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->makeStateInfo(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    invoke-static {v0, v2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v2, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->NET_FETCH_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 16
    .line 17
    invoke-static {v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v0, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getStateByName(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    goto :goto_2

    .line 28
    :cond_0
    const-string v2, "control_config"

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_1

    .line 41
    .line 42
    goto :goto_2

    .line 43
    :cond_1
    const-string v2, "&"

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    array-length v2, v0

    .line 50
    const/4 v3, 0x0

    .line 51
    move v4, v3

    .line 52
    :goto_0
    if-ge v4, v2, :cond_5

    .line 53
    .line 54
    aget-object v5, v0, v4

    .line 55
    .line 56
    const-string v6, "="

    .line 57
    .line 58
    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    array-length v6, v5

    .line 63
    if-le v6, v1, :cond_2

    .line 64
    .line 65
    aget-object v6, v5, v3

    .line 66
    .line 67
    const-string v7, "quality_close_mouth_threshold"

    .line 68
    .line 69
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v6

    .line 73
    if-eqz v6, :cond_2

    .line 74
    .line 75
    aget-object v6, v5, v1

    .line 76
    .line 77
    invoke-static {v6}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 78
    .line 79
    .line 80
    move-result v6

    .line 81
    iput v6, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->j:F

    .line 82
    .line 83
    :cond_2
    array-length v6, v5

    .line 84
    if-le v6, v1, :cond_4

    .line 85
    .line 86
    aget-object v6, v5, v3

    .line 87
    .line 88
    const-string v7, "compress_pose_image_score"

    .line 89
    .line 90
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    if-eqz v6, :cond_4

    .line 95
    .line 96
    aget-object v5, v5, v1

    .line 97
    .line 98
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    move-result v5

    .line 102
    iput v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->n:I

    .line 103
    .line 104
    const/16 v6, 0x50

    .line 105
    .line 106
    if-ge v5, v6, :cond_3

    .line 107
    .line 108
    iput v6, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->n:I

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_3
    const/16 v6, 0x64

    .line 112
    .line 113
    if-le v5, v6, :cond_4

    .line 114
    .line 115
    const/16 v5, 0x63

    .line 116
    .line 117
    iput v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->n:I

    .line 118
    .line 119
    :cond_4
    :goto_1
    add-int/lit8 v4, v4, 0x1

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_5
    :goto_2
    return-void
.end method

.method public exit()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->exit()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public loadStateWith(Ljava/lang/String;Lorg/json/JSONObject;Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->loadStateWith(Ljava/lang/String;Lorg/json/JSONObject;Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->SILENT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->a:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->m:I

    .line 10
    .line 11
    return-void
.end method

.method public moveToNextState()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->moveToNextState()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->a:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 5
    .line 6
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->SILENT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 7
    .line 8
    if-ne v0, v1, :cond_1

    .line 9
    .line 10
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->a:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 15
    .line 16
    invoke-static {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->transitNextRound(Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v1, -0x1

    .line 25
    if-ne v0, v1, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->a:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->sendFSMTransitError(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void

    .line 37
    :cond_1
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->a:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 42
    .line 43
    invoke-static {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v0, p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->transitNow(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public reset()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->reset()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->m:I

    .line 6
    .line 7
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->SILENT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->a:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 10
    .line 11
    return-void
.end method

.method public update(Lcom/tencent/youtu/sdkkitframework/common/YTImageData;J)V
    .locals 16

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    invoke-super/range {p0 .. p3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->update(Lcom/tencent/youtu/sdkkitframework/common/YTImageData;J)V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->p:Z

    .line 9
    .line 10
    const-string v3, "FaceQualityState"

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->isPause:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v2, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState$a;

    .line 27
    .line 28
    invoke-direct {v2, v1}, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState$a;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 32
    .line 33
    .line 34
    const-wide/16 v0, 0x1e

    .line 35
    .line 36
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :catch_0
    move-exception v0

    .line 41
    const-string v1, "Thread sleep error"

    .line 42
    .line 43
    invoke-static {v3, v1, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    iget-object v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->a:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 48
    .line 49
    sget-object v4, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->SILENT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 50
    .line 51
    if-eq v0, v4, :cond_1

    .line 52
    .line 53
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->moveToNextState()V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    iget-boolean v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->k:Z

    .line 58
    .line 59
    const/4 v5, 0x2

    .line 60
    const/4 v6, 0x0

    .line 61
    if-eqz v0, :cond_12

    .line 62
    .line 63
    iget-boolean v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->l:Z

    .line 64
    .line 65
    if-eqz v0, :cond_12

    .line 66
    .line 67
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-virtual {v0, v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getStateByName(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    const-string v4, "pose_state"

    .line 80
    .line 81
    invoke-virtual {v0, v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    check-cast v4, Ljava/lang/Integer;

    .line 86
    .line 87
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    const-string v7, "shelter_state"

    .line 92
    .line 93
    invoke-virtual {v0, v7}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v7

    .line 97
    check-cast v7, Ljava/lang/Integer;

    .line 98
    .line 99
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 100
    .line 101
    .line 102
    move-result v7

    .line 103
    if-eqz v4, :cond_2

    .line 104
    .line 105
    const/16 v8, 0x9

    .line 106
    .line 107
    if-eq v4, v8, :cond_2

    .line 108
    .line 109
    iput v6, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->m:I

    .line 110
    .line 111
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->moveToNextState()V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_2
    const-string v4, "face_status"

    .line 116
    .line 117
    invoke-virtual {v0, v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    check-cast v0, [Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;

    .line 122
    .line 123
    if-eqz v0, :cond_3

    .line 124
    .line 125
    array-length v4, v0

    .line 126
    if-gtz v4, :cond_4

    .line 127
    .line 128
    :cond_3
    move v9, v6

    .line 129
    goto/16 :goto_5

    .line 130
    .line 131
    :cond_4
    aget-object v4, v0, v6

    .line 132
    .line 133
    const-string v8, "not_pass"

    .line 134
    .line 135
    if-eqz v7, :cond_5

    .line 136
    .line 137
    iput v6, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->m:I

    .line 138
    .line 139
    invoke-static {v7}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->b(I)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {v1, v8, v0}, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->moveToNextState()V

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :cond_5
    iget v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->b:F

    .line 151
    .line 152
    iget v7, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->c:F

    .line 153
    .line 154
    iget v9, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->d:F

    .line 155
    .line 156
    invoke-static {v4, v0, v7, v9}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a(Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;FFF)Z

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    if-nez v0, :cond_6

    .line 161
    .line 162
    new-instance v0, Ljava/lang/StringBuilder;

    .line 163
    .line 164
    const-string v2, "correctionFace  angle not pass, threshold y:"

    .line 165
    .line 166
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    iget v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->b:F

    .line 170
    .line 171
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    const-string v2, "|p="

    .line 175
    .line 176
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    iget v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->c:F

    .line 180
    .line 181
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    const-string v2, "|r="

    .line 185
    .line 186
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    iget v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->d:F

    .line 190
    .line 191
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-static {v3, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 199
    .line 200
    .line 201
    iput v6, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->m:I

    .line 202
    .line 203
    const-string v0, "fl_pose_incorrect"

    .line 204
    .line 205
    invoke-virtual {v1, v8, v0}, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->moveToNextState()V

    .line 209
    .line 210
    .line 211
    return-void

    .line 212
    :cond_6
    iget v0, v2, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->height:I

    .line 213
    .line 214
    iget v7, v2, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->width:I

    .line 215
    .line 216
    invoke-static {v0, v7}, Ljava/lang/Math;->max(II)I

    .line 217
    .line 218
    .line 219
    move-result v0

    .line 220
    iget-object v7, v4, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceRect:Landroid/graphics/Rect;

    .line 221
    .line 222
    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    .line 223
    .line 224
    .line 225
    move-result v7

    .line 226
    int-to-float v0, v0

    .line 227
    iget v9, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->f:F

    .line 228
    .line 229
    mul-float/2addr v9, v0

    .line 230
    iget v10, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->g:F

    .line 231
    .line 232
    mul-float/2addr v0, v10

    .line 233
    int-to-float v10, v7

    .line 234
    cmpg-float v11, v10, v9

    .line 235
    .line 236
    const-string v12, "make log json error"

    .line 237
    .line 238
    const-string v13, "quality_thr"

    .line 239
    .line 240
    const-string v14, "quality_score"

    .line 241
    .line 242
    const-string v15, "quality_type"

    .line 243
    .line 244
    const/4 v6, 0x1

    .line 245
    if-gez v11, :cond_7

    .line 246
    .line 247
    new-instance v10, Lorg/json/JSONObject;

    .line 248
    .line 249
    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    .line 250
    .line 251
    .line 252
    :try_start_1
    const-string v0, "face_too_near"

    .line 253
    .line 254
    invoke-virtual {v10, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 255
    .line 256
    .line 257
    invoke-virtual {v10, v14, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 258
    .line 259
    .line 260
    float-to-double v14, v9

    .line 261
    invoke-virtual {v10, v13, v14, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 262
    .line 263
    .line 264
    goto :goto_0

    .line 265
    :catch_1
    move-exception v0

    .line 266
    invoke-static {v3, v12, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 267
    .line 268
    .line 269
    :goto_0
    invoke-virtual {v10}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    invoke-static {v3, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 274
    .line 275
    .line 276
    move v0, v6

    .line 277
    goto :goto_2

    .line 278
    :cond_7
    cmpl-float v9, v10, v0

    .line 279
    .line 280
    if-lez v9, :cond_8

    .line 281
    .line 282
    new-instance v9, Lorg/json/JSONObject;

    .line 283
    .line 284
    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    .line 285
    .line 286
    .line 287
    :try_start_2
    const-string v10, "face_too_far"

    .line 288
    .line 289
    invoke-virtual {v9, v15, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 290
    .line 291
    .line 292
    invoke-virtual {v9, v14, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 293
    .line 294
    .line 295
    float-to-double v10, v0

    .line 296
    invoke-virtual {v9, v13, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    .line 297
    .line 298
    .line 299
    goto :goto_1

    .line 300
    :catch_2
    move-exception v0

    .line 301
    invoke-static {v3, v12, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 302
    .line 303
    .line 304
    :goto_1
    invoke-virtual {v9}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 305
    .line 306
    .line 307
    move-result-object v0

    .line 308
    invoke-static {v3, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 309
    .line 310
    .line 311
    move v0, v5

    .line 312
    goto :goto_2

    .line 313
    :cond_8
    const/4 v0, 0x0

    .line 314
    :goto_2
    const-string v7, "fl_pose_closer"

    .line 315
    .line 316
    if-eq v0, v6, :cond_11

    .line 317
    .line 318
    if-eq v0, v5, :cond_10

    .line 319
    .line 320
    invoke-virtual {v1, v4}, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->b(Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;)Z

    .line 321
    .line 322
    .line 323
    move-result v0

    .line 324
    if-nez v0, :cond_9

    .line 325
    .line 326
    const/4 v9, 0x0

    .line 327
    iput v9, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->m:I

    .line 328
    .line 329
    const-string v0, "fl_close_mouth"

    .line 330
    .line 331
    invoke-virtual {v1, v8, v0}, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 332
    .line 333
    .line 334
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->moveToNextState()V

    .line 335
    .line 336
    .line 337
    return-void

    .line 338
    :cond_9
    const/4 v9, 0x0

    .line 339
    invoke-virtual {v1, v4}, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->a(Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;)Z

    .line 340
    .line 341
    .line 342
    move-result v0

    .line 343
    if-nez v0, :cond_a

    .line 344
    .line 345
    iput v9, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->m:I

    .line 346
    .line 347
    const-string v0, "fl_pose_open_eye"

    .line 348
    .line 349
    invoke-virtual {v1, v8, v0}, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 350
    .line 351
    .line 352
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->moveToNextState()V

    .line 353
    .line 354
    .line 355
    return-void

    .line 356
    :cond_a
    iget v0, v2, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->width:I

    .line 357
    .line 358
    int-to-float v0, v0

    .line 359
    iget v9, v2, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->height:I

    .line 360
    .line 361
    int-to-float v9, v9

    .line 362
    invoke-virtual {v1, v4, v0, v9}, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->a(Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;FF)Z

    .line 363
    .line 364
    .line 365
    move-result v0

    .line 366
    iget-boolean v9, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->l:Z

    .line 367
    .line 368
    if-eqz v9, :cond_b

    .line 369
    .line 370
    if-nez v0, :cond_b

    .line 371
    .line 372
    const/4 v9, 0x0

    .line 373
    iput v9, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->m:I

    .line 374
    .line 375
    invoke-virtual {v1, v8, v7}, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 376
    .line 377
    .line 378
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->moveToNextState()V

    .line 379
    .line 380
    .line 381
    return-void

    .line 382
    :cond_b
    iget v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->m:I

    .line 383
    .line 384
    add-int/2addr v0, v6

    .line 385
    iput v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->m:I

    .line 386
    .line 387
    sget v6, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->q:I

    .line 388
    .line 389
    const-string v7, "pass"

    .line 390
    .line 391
    if-ge v0, v6, :cond_c

    .line 392
    .line 393
    const-string v0, "fl_pose_keep"

    .line 394
    .line 395
    invoke-virtual {v1, v7, v0}, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 396
    .line 397
    .line 398
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->moveToNextState()V

    .line 399
    .line 400
    .line 401
    return-void

    .line 402
    :cond_c
    iget-object v0, v4, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceRect:Landroid/graphics/Rect;

    .line 403
    .line 404
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 405
    .line 406
    .line 407
    move-result v0

    .line 408
    iget-object v6, v4, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceRect:Landroid/graphics/Rect;

    .line 409
    .line 410
    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    .line 411
    .line 412
    .line 413
    move-result v6

    .line 414
    iget v8, v2, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->height:I

    .line 415
    .line 416
    int-to-float v8, v8

    .line 417
    iget v9, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->e:F

    .line 418
    .line 419
    mul-float/2addr v8, v9

    .line 420
    iget v9, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->o:I

    .line 421
    .line 422
    invoke-virtual {v2, v9}, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->bgr2JPEG(I)[B

    .line 423
    .line 424
    .line 425
    move-result-object v9

    .line 426
    int-to-float v0, v0

    .line 427
    cmpg-float v8, v0, v8

    .line 428
    .line 429
    if-gez v8, :cond_f

    .line 430
    .line 431
    iget v8, v2, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->width:I

    .line 432
    .line 433
    int-to-float v8, v8

    .line 434
    iget v10, v2, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->height:I

    .line 435
    .line 436
    int-to-float v10, v10

    .line 437
    div-float/2addr v8, v10

    .line 438
    div-float v10, v0, v10

    .line 439
    .line 440
    iget v11, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->e:F

    .line 441
    .line 442
    cmpg-float v12, v10, v11

    .line 443
    .line 444
    if-gez v12, :cond_d

    .line 445
    .line 446
    iget v12, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->f:F

    .line 447
    .line 448
    cmpg-float v13, v12, v11

    .line 449
    .line 450
    if-gez v13, :cond_d

    .line 451
    .line 452
    sub-float/2addr v10, v12

    .line 453
    sub-float/2addr v11, v12

    .line 454
    div-float/2addr v10, v11

    .line 455
    float-to-double v10, v10

    .line 456
    const-wide v12, 0x3fb999999999999aL    # 0.1

    .line 457
    .line 458
    .line 459
    .line 460
    .line 461
    mul-double/2addr v10, v12

    .line 462
    double-to-float v10, v10

    .line 463
    goto :goto_3

    .line 464
    :cond_d
    const v10, 0x3c23d70a    # 0.01f

    .line 465
    .line 466
    .line 467
    :goto_3
    const v11, 0x3f1c28f6    # 0.61f

    .line 468
    .line 469
    .line 470
    add-float/2addr v10, v11

    .line 471
    div-float/2addr v0, v10

    .line 472
    mul-float/2addr v8, v0

    .line 473
    int-to-float v6, v6

    .line 474
    cmpl-float v10, v6, v8

    .line 475
    .line 476
    if-lez v10, :cond_e

    .line 477
    .line 478
    move v8, v6

    .line 479
    :cond_e
    iget-object v6, v4, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceRect:Landroid/graphics/Rect;

    .line 480
    .line 481
    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    .line 482
    .line 483
    .line 484
    move-result v6

    .line 485
    int-to-float v6, v6

    .line 486
    const/high16 v10, 0x40000000    # 2.0f

    .line 487
    .line 488
    div-float/2addr v6, v10

    .line 489
    iget-object v11, v4, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceRect:Landroid/graphics/Rect;

    .line 490
    .line 491
    iget v12, v11, Landroid/graphics/Rect;->left:I

    .line 492
    .line 493
    int-to-float v12, v12

    .line 494
    add-float/2addr v6, v12

    .line 495
    invoke-virtual {v11}, Landroid/graphics/Rect;->height()I

    .line 496
    .line 497
    .line 498
    move-result v11

    .line 499
    int-to-float v11, v11

    .line 500
    div-float/2addr v11, v10

    .line 501
    iget-object v4, v4, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceRect:Landroid/graphics/Rect;

    .line 502
    .line 503
    iget v4, v4, Landroid/graphics/Rect;->top:I

    .line 504
    .line 505
    int-to-float v4, v4

    .line 506
    add-float/2addr v11, v4

    .line 507
    div-float v4, v0, v10

    .line 508
    .line 509
    sub-float/2addr v11, v4

    .line 510
    div-float v4, v8, v10

    .line 511
    .line 512
    sub-float/2addr v6, v4

    .line 513
    array-length v4, v9

    .line 514
    const/4 v10, 0x0

    .line 515
    invoke-static {v9, v10, v4}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    .line 516
    .line 517
    .line 518
    move-result-object v4

    .line 519
    float-to-int v6, v6

    .line 520
    float-to-int v9, v11

    .line 521
    float-to-int v8, v8

    .line 522
    float-to-int v0, v0

    .line 523
    invoke-static {v4, v6, v9, v8, v0}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    .line 524
    .line 525
    .line 526
    move-result-object v6

    .line 527
    iget v0, v2, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->width:I

    .line 528
    .line 529
    iget v8, v2, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->height:I

    .line 530
    .line 531
    invoke-static {v6, v0, v8, v10}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 532
    .line 533
    .line 534
    move-result-object v8

    .line 535
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 536
    .line 537
    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 538
    .line 539
    .line 540
    sget-object v9, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 541
    .line 542
    iget v10, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->o:I

    .line 543
    .line 544
    invoke-virtual {v8, v9, v10, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 545
    .line 546
    .line 547
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 548
    .line 549
    .line 550
    move-result-object v9

    .line 551
    :try_start_3
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    .line 552
    .line 553
    .line 554
    goto :goto_4

    .line 555
    :catch_3
    move-exception v0

    .line 556
    const-string v10, "LocalFaceBestImage close IO error"

    .line 557
    .line 558
    invoke-static {v3, v10, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 559
    .line 560
    .line 561
    :goto_4
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V

    .line 562
    .line 563
    .line 564
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->recycle()V

    .line 565
    .line 566
    .line 567
    invoke-virtual {v8}, Landroid/graphics/Bitmap;->recycle()V

    .line 568
    .line 569
    .line 570
    :cond_f
    new-instance v0, Ljava/util/HashMap;

    .line 571
    .line 572
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 573
    .line 574
    .line 575
    new-instance v3, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState$b;

    .line 576
    .line 577
    iget v4, v2, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->width:I

    .line 578
    .line 579
    iget v2, v2, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->height:I

    .line 580
    .line 581
    invoke-direct {v3, v9, v4, v2}, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState$b;-><init>([BII)V

    .line 582
    .line 583
    .line 584
    const-string v2, "face_best_image"

    .line 585
    .line 586
    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 587
    .line 588
    .line 589
    const-string v2, "ui_action"

    .line 590
    .line 591
    invoke-virtual {v0, v2, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 592
    .line 593
    .line 594
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 595
    .line 596
    .line 597
    move-result-object v2

    .line 598
    invoke-virtual {v2, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 599
    .line 600
    .line 601
    goto :goto_6

    .line 602
    :cond_10
    const/4 v9, 0x0

    .line 603
    iput v9, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->m:I

    .line 604
    .line 605
    const-string v0, "fl_pose_farer"

    .line 606
    .line 607
    invoke-virtual {v1, v8, v0}, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 608
    .line 609
    .line 610
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->moveToNextState()V

    .line 611
    .line 612
    .line 613
    return-void

    .line 614
    :cond_11
    const/4 v9, 0x0

    .line 615
    iput v9, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->m:I

    .line 616
    .line 617
    invoke-virtual {v1, v8, v7}, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 618
    .line 619
    .line 620
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->moveToNextState()V

    .line 621
    .line 622
    .line 623
    return-void

    .line 624
    :goto_5
    iput v9, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->m:I

    .line 625
    .line 626
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->moveToNextState()V

    .line 627
    .line 628
    .line 629
    return-void

    .line 630
    :cond_12
    :goto_6
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 631
    .line 632
    .line 633
    move-result-object v0

    .line 634
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getWorkMode()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    .line 635
    .line 636
    .line 637
    move-result-object v0

    .line 638
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 639
    .line 640
    .line 641
    move-result v0

    .line 642
    if-eq v0, v5, :cond_14

    .line 643
    .line 644
    const/4 v2, 0x3

    .line 645
    if-eq v0, v2, :cond_14

    .line 646
    .line 647
    const/4 v2, 0x4

    .line 648
    if-eq v0, v2, :cond_13

    .line 649
    .line 650
    const/4 v2, 0x5

    .line 651
    if-eq v0, v2, :cond_14

    .line 652
    .line 653
    :goto_7
    const/4 v9, 0x0

    .line 654
    goto :goto_8

    .line 655
    :cond_13
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->REFLECT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 656
    .line 657
    iput-object v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->a:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 658
    .line 659
    goto :goto_7

    .line 660
    :cond_14
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->ACTION_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 661
    .line 662
    iput-object v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->a:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 663
    .line 664
    goto :goto_7

    .line 665
    :goto_8
    iput v9, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->m:I

    .line 666
    .line 667
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->moveToNextState()V

    .line 668
    .line 669
    .line 670
    return-void
.end method

.method public updateSDKSetting(Lorg/json/JSONObject;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const-string v2, "need_close_timeout"

    .line 6
    .line 7
    const-string v3, "quality_face_real_min_height_threshold"

    .line 8
    .line 9
    const-string v4, "continuous_quality_num_threshold"

    .line 10
    .line 11
    const-string v5, "local_face_best_image_quality"

    .line 12
    .line 13
    const-string v6, "need_local_face_best_image"

    .line 14
    .line 15
    const-string v7, "need_face_quality"

    .line 16
    .line 17
    const-string v8, "secondary_roll_threshold"

    .line 18
    .line 19
    const-string v9, "secondary_pitch_threshold"

    .line 20
    .line 21
    const-string v10, "secondary_yaw_threshold"

    .line 22
    .line 23
    const-string v11, "quality_face_max_height_threshold"

    .line 24
    .line 25
    const-string v12, "quality_face_min_height_threshold"

    .line 26
    .line 27
    const-string v13, "quality_close_mouth_threshold"

    .line 28
    .line 29
    const-string v14, "quality_close_eye_right_threshold"

    .line 30
    .line 31
    const-string v15, "quality_close_eye_left_threshold"

    .line 32
    .line 33
    invoke-super/range {p0 .. p1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->updateSDKSetting(Lorg/json/JSONObject;)V

    .line 34
    .line 35
    .line 36
    :try_start_0
    invoke-virtual {v1, v15}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v16

    .line 40
    if-eqz v16, :cond_0

    .line 41
    .line 42
    move-object/from16 v16, v2

    .line 43
    .line 44
    move-object/from16 v17, v3

    .line 45
    .line 46
    invoke-virtual {v1, v15}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 47
    .line 48
    .line 49
    move-result-wide v2

    .line 50
    double-to-float v2, v2

    .line 51
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->h:F

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    move-object/from16 v16, v2

    .line 55
    .line 56
    move-object/from16 v17, v3

    .line 57
    .line 58
    :goto_0
    invoke-virtual {v1, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-eqz v2, :cond_1

    .line 63
    .line 64
    invoke-virtual {v1, v14}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 65
    .line 66
    .line 67
    move-result-wide v2

    .line 68
    double-to-float v2, v2

    .line 69
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->i:F

    .line 70
    .line 71
    :cond_1
    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    if-eqz v2, :cond_2

    .line 76
    .line 77
    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 78
    .line 79
    .line 80
    move-result-wide v2

    .line 81
    double-to-float v2, v2

    .line 82
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->j:F

    .line 83
    .line 84
    :cond_2
    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    if-eqz v2, :cond_3

    .line 89
    .line 90
    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 91
    .line 92
    .line 93
    move-result-wide v2

    .line 94
    double-to-float v2, v2

    .line 95
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->e:F

    .line 96
    .line 97
    :cond_3
    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    if-eqz v2, :cond_4

    .line 102
    .line 103
    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 104
    .line 105
    .line 106
    move-result-wide v2

    .line 107
    double-to-float v2, v2

    .line 108
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->g:F

    .line 109
    .line 110
    :cond_4
    invoke-virtual {v1, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    if-eqz v2, :cond_5

    .line 115
    .line 116
    invoke-virtual {v1, v10}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 117
    .line 118
    .line 119
    move-result-wide v2

    .line 120
    double-to-float v2, v2

    .line 121
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->b:F

    .line 122
    .line 123
    :cond_5
    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    if-eqz v2, :cond_6

    .line 128
    .line 129
    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 130
    .line 131
    .line 132
    move-result-wide v2

    .line 133
    double-to-float v2, v2

    .line 134
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->c:F

    .line 135
    .line 136
    :cond_6
    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    if-eqz v2, :cond_7

    .line 141
    .line 142
    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 143
    .line 144
    .line 145
    move-result-wide v2

    .line 146
    double-to-float v2, v2

    .line 147
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->d:F

    .line 148
    .line 149
    :cond_7
    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 150
    .line 151
    .line 152
    move-result v2

    .line 153
    if-eqz v2, :cond_8

    .line 154
    .line 155
    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 156
    .line 157
    .line 158
    move-result v2

    .line 159
    iput-boolean v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->k:Z

    .line 160
    .line 161
    :cond_8
    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 162
    .line 163
    .line 164
    move-result v2

    .line 165
    if-eqz v2, :cond_9

    .line 166
    .line 167
    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 168
    .line 169
    .line 170
    move-result v2

    .line 171
    iput-boolean v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->l:Z

    .line 172
    .line 173
    :cond_9
    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 174
    .line 175
    .line 176
    move-result v2

    .line 177
    if-eqz v2, :cond_a

    .line 178
    .line 179
    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 180
    .line 181
    .line 182
    move-result v2

    .line 183
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->o:I

    .line 184
    .line 185
    :cond_a
    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 186
    .line 187
    .line 188
    move-result v2

    .line 189
    if-eqz v2, :cond_b

    .line 190
    .line 191
    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 192
    .line 193
    .line 194
    move-result v2

    .line 195
    sput v2, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->q:I

    .line 196
    .line 197
    :cond_b
    move-object/from16 v2, v17

    .line 198
    .line 199
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 200
    .line 201
    .line 202
    move-result v3

    .line 203
    if-eqz v3, :cond_c

    .line 204
    .line 205
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 206
    .line 207
    .line 208
    move-result-wide v2

    .line 209
    double-to-float v2, v2

    .line 210
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->f:F

    .line 211
    .line 212
    :cond_c
    move-object/from16 v2, v16

    .line 213
    .line 214
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 215
    .line 216
    .line 217
    move-result v3

    .line 218
    if-eqz v3, :cond_d

    .line 219
    .line 220
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    iput-boolean v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->p:Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 225
    .line 226
    :cond_d
    return-void

    .line 227
    :catch_0
    move-exception v0

    .line 228
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 229
    .line 230
    .line 231
    return-void
.end method
