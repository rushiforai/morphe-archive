.class public Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$a;,
        Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$b;,
        Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$c;
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "YoutuFaceDetect"

.field public static final VERSION:Ljava/lang/String; = "3.6.0"

.field public static mCheckResult:Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$c; = null

.field public static mInitModel:I = 0x0

.field public static mIsStarted:Z = false

.field public static mModelRetainCount:I = 0x0

.field public static mPoseDetectProcessManager:Lcom/tencent/youtu/ytposedetect/manager/a; = null

.field public static mRotateTag:I = 0x1

.field public static sPoseDetectOnFrame:Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$b;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$000()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->noticeSuccess()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$100(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->noticeFailed(ILjava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static callbackFrame([BIII)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->sPoseDetectOnFrame:Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a([BIII)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public static callbackFrameList([Lcom/tencent/youtu/ytposedetect/data/YTActRefImage;)V
    .locals 12

    .line 1
    sget-object v0, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->sPoseDetectOnFrame:Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$b;

    .line 2
    .line 3
    if-eqz v0, :cond_9

    .line 4
    .line 5
    check-cast v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;

    .line 6
    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "action video error,conservation video,frame count:"

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    array-length v2, p0

    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "ActionLivenessState"

    .line 23
    .line 24
    invoke-static {v2, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->m:Lcom/tencent/youtu/sdkkitframework/liveness/p;

    .line 30
    .line 31
    iget-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/p;->f:Ljava/lang/String;

    .line 32
    .line 33
    const-string v2, "&"

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    array-length v3, v1

    .line 40
    const-string v4, "action_video_shorten_strategy"

    .line 41
    .line 42
    const-string v5, "="

    .line 43
    .line 44
    const/4 v6, 0x1

    .line 45
    const/4 v7, 0x0

    .line 46
    if-lez v3, :cond_1

    .line 47
    .line 48
    array-length v3, v1

    .line 49
    move v8, v7

    .line 50
    move v9, v8

    .line 51
    :goto_0
    if-ge v8, v3, :cond_2

    .line 52
    .line 53
    aget-object v10, v1, v8

    .line 54
    .line 55
    invoke-virtual {v10, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v10

    .line 59
    array-length v11, v10

    .line 60
    if-le v11, v6, :cond_0

    .line 61
    .line 62
    aget-object v11, v10, v7

    .line 63
    .line 64
    invoke-virtual {v11, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v11

    .line 68
    if-eqz v11, :cond_0

    .line 69
    .line 70
    aget-object v9, v10, v6

    .line 71
    .line 72
    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    move-result v9

    .line 76
    :cond_0
    add-int/lit8 v8, v8, 0x1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_1
    move v9, v7

    .line 80
    :cond_2
    if-eq v9, v6, :cond_5

    .line 81
    .line 82
    new-instance v3, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 85
    .line 86
    .line 87
    array-length v8, v1

    .line 88
    if-lez v8, :cond_4

    .line 89
    .line 90
    move v8, v7

    .line 91
    :goto_1
    array-length v9, v1

    .line 92
    if-ge v8, v9, :cond_4

    .line 93
    .line 94
    aget-object v9, v1, v8

    .line 95
    .line 96
    invoke-virtual {v9, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v9

    .line 100
    array-length v10, v9

    .line 101
    if-le v10, v6, :cond_3

    .line 102
    .line 103
    aget-object v10, v9, v7

    .line 104
    .line 105
    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v10

    .line 109
    if-nez v10, :cond_3

    .line 110
    .line 111
    aget-object v10, v9, v7

    .line 112
    .line 113
    const-string v11, "reflect_images_shorten_strategy"

    .line 114
    .line 115
    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v10

    .line 119
    if-nez v10, :cond_3

    .line 120
    .line 121
    aget-object v10, v9, v7

    .line 122
    .line 123
    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    aget-object v9, v9, v6

    .line 130
    .line 131
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    :cond_3
    add-int/lit8 v8, v8, 0x1

    .line 138
    .line 139
    goto :goto_1

    .line 140
    :cond_4
    const-string v1, "reflect_images_shorten_strategy=1&action_video_shorten_strategy=1"

    .line 141
    .line 142
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/p;->f:Ljava/lang/String;

    .line 150
    .line 151
    :cond_5
    iget-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/p;->a:Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;

    .line 152
    .line 153
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->getSupportCodecJSONStr()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/p;->h:Ljava/lang/String;

    .line 158
    .line 159
    new-instance v1, Lorg/json/JSONArray;

    .line 160
    .line 161
    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 162
    .line 163
    .line 164
    move v2, v7

    .line 165
    :goto_2
    array-length v3, p0

    .line 166
    if-ge v2, v3, :cond_7

    .line 167
    .line 168
    aget-object v3, p0, v2

    .line 169
    .line 170
    if-eqz v3, :cond_6

    .line 171
    .line 172
    iget-object v3, v3, Lcom/tencent/youtu/ytposedetect/data/YTActRefImage;->encodeImage:Ljava/lang/String;

    .line 173
    .line 174
    if-eqz v3, :cond_6

    .line 175
    .line 176
    new-instance v3, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;

    .line 177
    .line 178
    aget-object v4, p0, v2

    .line 179
    .line 180
    iget v5, v4, Lcom/tencent/youtu/ytposedetect/data/YTActRefImage;->w:I

    .line 181
    .line 182
    iget v6, v4, Lcom/tencent/youtu/ytposedetect/data/YTActRefImage;->h:I

    .line 183
    .line 184
    iget-object v4, v4, Lcom/tencent/youtu/ytposedetect/data/YTActRefImage;->encodeImage:Ljava/lang/String;

    .line 185
    .line 186
    invoke-direct {v3, v5, v6, v4}, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;-><init>(IILjava/lang/String;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v3}, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->toJSON64Img()Lorg/json/JSONObject;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 194
    .line 195
    .line 196
    :cond_6
    add-int/lit8 v2, v2, 0x1

    .line 197
    .line 198
    goto :goto_2

    .line 199
    :cond_7
    iget-object p0, v0, Lcom/tencent/youtu/sdkkitframework/liveness/p;->g:Lorg/json/JSONArray;

    .line 200
    .line 201
    if-nez p0, :cond_8

    .line 202
    .line 203
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/p;->g:Lorg/json/JSONArray;

    .line 204
    .line 205
    return-void

    .line 206
    :cond_8
    :goto_3
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    .line 207
    .line 208
    .line 209
    move-result p0

    .line 210
    if-ge v7, p0, :cond_9

    .line 211
    .line 212
    :try_start_0
    iget-object p0, v0, Lcom/tencent/youtu/sdkkitframework/liveness/p;->g:Lorg/json/JSONArray;

    .line 213
    .line 214
    invoke-virtual {v1, v7}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object v2

    .line 218
    invoke-virtual {p0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 219
    .line 220
    .line 221
    goto :goto_4

    .line 222
    :catch_0
    move-exception p0

    .line 223
    const-string v2, "p"

    .line 224
    .line 225
    const-string v3, "JSONArray put error"

    .line 226
    .line 227
    invoke-static {v2, v3, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 228
    .line 229
    .line 230
    :goto_4
    add-int/lit8 v7, v7, 0x1

    .line 231
    .line 232
    goto :goto_3

    .line 233
    :cond_9
    return-void
.end method

.method public static getActReflectData()Lcom/tencent/youtu/ytposedetect/data/YTActRefData;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mPoseDetectProcessManager:Lcom/tencent/youtu/ytposedetect/manager/a;

    .line 2
    .line 3
    iget v0, v0, Lcom/tencent/youtu/ytposedetect/manager/a;->b:I

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->getActionReflectData(I)Lcom/tencent/youtu/ytposedetect/data/YTActRefData;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static getBestImage(I)Lcom/tencent/youtu/ytposedetect/a;
    .locals 2

    .line 47
    new-instance v0, Lcom/tencent/youtu/ytposedetect/a;

    invoke-direct {v0}, Lcom/tencent/youtu/ytposedetect/a;-><init>()V

    .line 48
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->getBestImage()[B

    const/4 v1, 0x5

    if-eq p0, v1, :cond_1

    const/4 v1, 0x6

    if-eq p0, v1, :cond_1

    const/4 v1, 0x7

    if-eq p0, v1, :cond_1

    const/16 v1, 0x8

    if-ne p0, v1, :cond_0

    goto :goto_0

    .line 49
    :cond_0
    sget-object p0, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mPoseDetectProcessManager:Lcom/tencent/youtu/ytposedetect/manager/a;

    iget p0, p0, Lcom/tencent/youtu/ytposedetect/manager/a;->c:I

    return-object v0

    .line 50
    :cond_1
    :goto_0
    sget-object p0, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mPoseDetectProcessManager:Lcom/tencent/youtu/ytposedetect/manager/a;

    iget p0, p0, Lcom/tencent/youtu/ytposedetect/manager/a;->d:I

    return-object v0
.end method

.method public static getBestImage(Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$a;Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object p1, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mPoseDetectProcessManager:Lcom/tencent/youtu/ytposedetect/manager/a;

    .line 4
    .line 5
    iget p1, p1, Lcom/tencent/youtu/ytposedetect/manager/a;->b:I

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p1, 0x1

    .line 9
    :goto_0
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->getBestImage()[B

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x5

    .line 14
    if-eq p1, v1, :cond_2

    .line 15
    .line 16
    const/4 v1, 0x6

    .line 17
    if-eq p1, v1, :cond_2

    .line 18
    .line 19
    const/4 v1, 0x7

    .line 20
    if-eq p1, v1, :cond_2

    .line 21
    .line 22
    const/16 v1, 0x8

    .line 23
    .line 24
    if-ne p1, v1, :cond_1

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    sget-object p1, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mPoseDetectProcessManager:Lcom/tencent/youtu/ytposedetect/manager/a;

    .line 28
    .line 29
    iget v1, p1, Lcom/tencent/youtu/ytposedetect/manager/a;->c:I

    .line 30
    .line 31
    iget p1, p1, Lcom/tencent/youtu/ytposedetect/manager/a;->d:I

    .line 32
    .line 33
    invoke-interface {p0, v0, v1, p1}, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$a;->a([BII)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    :goto_1
    sget-object p1, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mPoseDetectProcessManager:Lcom/tencent/youtu/ytposedetect/manager/a;

    .line 38
    .line 39
    iget v1, p1, Lcom/tencent/youtu/ytposedetect/manager/a;->d:I

    .line 40
    .line 41
    iget p1, p1, Lcom/tencent/youtu/ytposedetect/manager/a;->c:I

    .line 42
    .line 43
    invoke-interface {p0, v0, v1, p1}, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$a;->a([BII)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static getEyeImage(I)Lcom/tencent/youtu/ytposedetect/a;
    .locals 2

    .line 1
    new-instance v0, Lcom/tencent/youtu/ytposedetect/a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/youtu/ytposedetect/a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->getEyeImage(I)[B

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x5

    .line 10
    if-eq p0, v1, :cond_1

    .line 11
    .line 12
    const/4 v1, 0x6

    .line 13
    if-eq p0, v1, :cond_1

    .line 14
    .line 15
    const/4 v1, 0x7

    .line 16
    if-eq p0, v1, :cond_1

    .line 17
    .line 18
    const/16 v1, 0x8

    .line 19
    .line 20
    if-ne p0, v1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    sget-object p0, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mPoseDetectProcessManager:Lcom/tencent/youtu/ytposedetect/manager/a;

    .line 24
    .line 25
    iget p0, p0, Lcom/tencent/youtu/ytposedetect/manager/a;->c:I

    .line 26
    .line 27
    return-object v0

    .line 28
    :cond_1
    :goto_0
    sget-object p0, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mPoseDetectProcessManager:Lcom/tencent/youtu/ytposedetect/manager/a;

    .line 29
    .line 30
    iget p0, p0, Lcom/tencent/youtu/ytposedetect/manager/a;->d:I

    .line 31
    .line 32
    return-object v0
.end method

.method public static getMouthImage(I)Lcom/tencent/youtu/ytposedetect/a;
    .locals 2

    .line 1
    new-instance v0, Lcom/tencent/youtu/ytposedetect/a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/youtu/ytposedetect/a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->getMouthImage(I)[B

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x5

    .line 10
    if-eq p0, v1, :cond_1

    .line 11
    .line 12
    const/4 v1, 0x6

    .line 13
    if-eq p0, v1, :cond_1

    .line 14
    .line 15
    const/4 v1, 0x7

    .line 16
    if-eq p0, v1, :cond_1

    .line 17
    .line 18
    const/16 v1, 0x8

    .line 19
    .line 20
    if-ne p0, v1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    sget-object p0, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mPoseDetectProcessManager:Lcom/tencent/youtu/ytposedetect/manager/a;

    .line 24
    .line 25
    iget p0, p0, Lcom/tencent/youtu/ytposedetect/manager/a;->c:I

    .line 26
    .line 27
    return-object v0

    .line 28
    :cond_1
    :goto_0
    sget-object p0, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mPoseDetectProcessManager:Lcom/tencent/youtu/ytposedetect/manager/a;

    .line 29
    .line 30
    iget p0, p0, Lcom/tencent/youtu/ytposedetect/manager/a;->d:I

    .line 31
    .line 32
    return-object v0
.end method

.method public static getVersion()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "jar3.6.0_native"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->getVersion()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    return-object v0
.end method

.method public static initModel()I
    .locals 5

    .line 1
    const-string v0, "YoutuFaceDetect"

    .line 2
    .line 3
    :try_start_0
    const-string v1, "[YTFacePreviewInterface.initModel] ---"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->nativeLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget v1, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mInitModel:I

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    if-lez v1, :cond_0

    .line 12
    .line 13
    const-string v1, "[YTFacePreviewInterface.initModel] has already inited."

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->nativeLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    sget v1, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mInitModel:I

    .line 19
    .line 20
    add-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    sput v1, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mInitModel:I

    .line 23
    .line 24
    return v2

    .line 25
    :catch_0
    move-exception v1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const-string v1, ""

    .line 28
    .line 29
    invoke-static {v1}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->initModel(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_1

    .line 34
    .line 35
    new-instance v1, Lcom/tencent/youtu/ytposedetect/manager/a;

    .line 36
    .line 37
    invoke-direct {v1}, Lcom/tencent/youtu/ytposedetect/manager/a;-><init>()V

    .line 38
    .line 39
    .line 40
    sput-object v1, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mPoseDetectProcessManager:Lcom/tencent/youtu/ytposedetect/manager/a;

    .line 41
    .line 42
    sget v1, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mInitModel:I

    .line 43
    .line 44
    add-int/lit8 v1, v1, 0x1

    .line 45
    .line 46
    sput v1, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mInitModel:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    return v2

    .line 49
    :cond_1
    return v1

    .line 50
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v3, "initModel failed. message: "

    .line 53
    .line 54
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-static {v0, v2}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->nativeLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    new-instance v2, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    const/16 v0, 0xa

    .line 91
    .line 92
    return v0
.end method

.method public static isDetecting()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mPoseDetectProcessManager:Lcom/tencent/youtu/ytposedetect/manager/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, v0, Lcom/tencent/youtu/ytposedetect/manager/a;->a:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    return v0

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    return v0
.end method

.method public static noticeFailed(ILjava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "[YTPoseDetectInterface.noticeFailed] resultCode: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " \r\nmessage: "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, " \r\ntips: "

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "YoutuFaceDetect"

    .line 32
    .line 33
    invoke-static {v1, v0}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->nativeLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sget-object v0, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mCheckResult:Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$c;

    .line 37
    .line 38
    invoke-interface {v0, p0, p1, p2}, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$c;->onFailed(ILjava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    sput-object p0, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mCheckResult:Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$c;

    .line 43
    .line 44
    const/4 p0, 0x0

    .line 45
    sput-boolean p0, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mIsStarted:Z

    .line 46
    .line 47
    return-void
.end method

.method public static noticeSuccess()V
    .locals 2

    .line 1
    const-string v0, "YoutuFaceDetect"

    .line 2
    .line 3
    const-string v1, "[YTPoseDetectInterface.noticeSuccess] ---"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->nativeLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mCheckResult:Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$c;

    .line 9
    .line 10
    invoke-interface {v0}, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$c;->a()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    sput-object v0, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mCheckResult:Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$c;

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    sput-boolean v0, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mIsStarted:Z

    .line 18
    .line 19
    return-void
.end method

.method public static poseDetect(Lcom/tencent/youtu/ytposedetect/data/PoseDetectData;Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$b;I)V
    .locals 8

    .line 1
    sput-object p1, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->sPoseDetectOnFrame:Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$b;

    .line 2
    .line 3
    sget v0, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mInitModel:I

    .line 4
    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    check-cast p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;

    .line 8
    .line 9
    const-string p0, "Not init model on poseDetect."

    .line 10
    .line 11
    const-string p2, "Call YTPoseDetectInterface.initModel() before."

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    invoke-virtual {p1, v0, p0, p2}, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    sget-boolean v0, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mIsStarted:Z

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    check-cast p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;

    .line 23
    .line 24
    const-string p0, "Not call start() interface before."

    .line 25
    .line 26
    const-string p2, "Call YTPoseDetectInterface.start() before."

    .line 27
    .line 28
    const/4 v0, 0x3

    .line 29
    invoke-virtual {p1, v0, p0, p2}, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    sget-object v0, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mPoseDetectProcessManager:Lcom/tencent/youtu/ytposedetect/manager/a;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/tencent/youtu/ytposedetect/data/PoseDetectData;->frameW:I

    .line 39
    .line 40
    iput v1, v0, Lcom/tencent/youtu/ytposedetect/manager/a;->c:I

    .line 41
    .line 42
    iget v1, p0, Lcom/tencent/youtu/ytposedetect/data/PoseDetectData;->frameH:I

    .line 43
    .line 44
    iput v1, v0, Lcom/tencent/youtu/ytposedetect/manager/a;->d:I

    .line 45
    .line 46
    invoke-static {p0}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->poseDetect(Lcom/tencent/youtu/ytposedetect/data/PoseDetectData;)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    check-cast p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;

    .line 51
    .line 52
    iget-object v0, p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 53
    .line 54
    const-string v1, ""

    .line 55
    .line 56
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->u:Ljava/lang/String;

    .line 57
    .line 58
    const/4 v1, 0x0

    .line 59
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->v:Ljava/lang/String;

    .line 60
    .line 61
    const/4 v2, 0x1

    .line 62
    const-string v3, "ActionLivenessState"

    .line 63
    .line 64
    if-ne p0, v2, :cond_4

    .line 65
    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    const-string v1, "Detect pose with sequence "

    .line 69
    .line 70
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    iget-object v1, p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 74
    .line 75
    iget-object v1, v1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->h:[Ljava/lang/String;

    .line 76
    .line 77
    array-length v1, v1

    .line 78
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-static {v3, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iget-object v0, v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->baseFunctionListener:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYTBaseFunctionListener;

    .line 97
    .line 98
    if-eqz v0, :cond_2

    .line 99
    .line 100
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iget-object v0, v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->baseFunctionListener:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYTBaseFunctionListener;

    .line 109
    .line 110
    iget-object v1, p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 111
    .line 112
    iget v1, v1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 113
    .line 114
    invoke-interface {v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYTBaseFunctionListener;->detectActionDone(I)V

    .line 115
    .line 116
    .line 117
    :cond_2
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/liveness/a;

    .line 122
    .line 123
    invoke-direct {v1, p1}, Lcom/tencent/youtu/sdkkitframework/liveness/a;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 130
    .line 131
    iget-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->h:[Ljava/lang/String;

    .line 132
    .line 133
    iget v4, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->i:I

    .line 134
    .line 135
    add-int/2addr v4, v2

    .line 136
    invoke-virtual {v0, v1, v4}, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->a([Ljava/lang/String;I)Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-eqz v0, :cond_3

    .line 141
    .line 142
    new-instance v0, Ljava/lang/StringBuilder;

    .line 143
    .line 144
    const-string v1, "start check pose: "

    .line 145
    .line 146
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    iget-object v1, p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 150
    .line 151
    iget v1, v1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 152
    .line 153
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-static {v3, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :cond_3
    const-string v0, "action seq all done"

    .line 166
    .line 167
    invoke-static {v3, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    iget-object v0, p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 171
    .line 172
    invoke-static {v0, v2}, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->a(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;Z)Z

    .line 173
    .line 174
    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :cond_4
    const/4 v4, -0x3

    .line 178
    const-string v5, "not_pass"

    .line 179
    .line 180
    if-ne p0, v4, :cond_5

    .line 181
    .line 182
    const-string v1, "fl_incomplete_face"

    .line 183
    .line 184
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->v:Ljava/lang/String;

    .line 185
    .line 186
    iput-object v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->w:Ljava/lang/String;

    .line 187
    .line 188
    goto/16 :goto_0

    .line 189
    .line 190
    :cond_5
    const/16 v4, -0x402

    .line 191
    .line 192
    const-string v6, "pass"

    .line 193
    .line 194
    if-ne p0, v4, :cond_6

    .line 195
    .line 196
    const-string v1, "fl_pose_keep"

    .line 197
    .line 198
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->v:Ljava/lang/String;

    .line 199
    .line 200
    iput-object v6, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->w:Ljava/lang/String;

    .line 201
    .line 202
    goto/16 :goto_0

    .line 203
    .line 204
    :cond_6
    const/16 v4, -0x401

    .line 205
    .line 206
    if-ne p0, v4, :cond_7

    .line 207
    .line 208
    iget v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->d:I

    .line 209
    .line 210
    invoke-static {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a(I)Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->v:Ljava/lang/String;

    .line 215
    .line 216
    iget-object v0, p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 217
    .line 218
    iput-object v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->w:Ljava/lang/String;

    .line 219
    .line 220
    goto/16 :goto_0

    .line 221
    .line 222
    :cond_7
    const/16 v4, -0x405

    .line 223
    .line 224
    if-ne p0, v4, :cond_8

    .line 225
    .line 226
    iget v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->e:I

    .line 227
    .line 228
    invoke-static {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->b(I)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v1

    .line 232
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->v:Ljava/lang/String;

    .line 233
    .line 234
    iget-object v0, p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 235
    .line 236
    iput-object v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->w:Ljava/lang/String;

    .line 237
    .line 238
    goto :goto_0

    .line 239
    :cond_8
    const/16 v4, -0x406

    .line 240
    .line 241
    if-ne p0, v4, :cond_9

    .line 242
    .line 243
    const-string v1, "fl_pose_incorrect"

    .line 244
    .line 245
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->v:Ljava/lang/String;

    .line 246
    .line 247
    iput-object v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->w:Ljava/lang/String;

    .line 248
    .line 249
    goto :goto_0

    .line 250
    :cond_9
    const/16 v4, -0x407

    .line 251
    .line 252
    if-ne p0, v4, :cond_a

    .line 253
    .line 254
    const-string v1, "fl_pose_open_eye"

    .line 255
    .line 256
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->v:Ljava/lang/String;

    .line 257
    .line 258
    iput-object v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->w:Ljava/lang/String;

    .line 259
    .line 260
    goto :goto_0

    .line 261
    :cond_a
    const/16 v4, -0x408

    .line 262
    .line 263
    if-ne p0, v4, :cond_b

    .line 264
    .line 265
    const-string v1, "fl_close_mouth"

    .line 266
    .line 267
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->v:Ljava/lang/String;

    .line 268
    .line 269
    iput-object v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->w:Ljava/lang/String;

    .line 270
    .line 271
    goto :goto_0

    .line 272
    :cond_b
    const/16 v4, -0x409

    .line 273
    .line 274
    const-string v7, "fl_act_screen_shaking"

    .line 275
    .line 276
    if-ne p0, v4, :cond_c

    .line 277
    .line 278
    iput-object v7, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->v:Ljava/lang/String;

    .line 279
    .line 280
    iput-object v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->w:Ljava/lang/String;

    .line 281
    .line 282
    goto :goto_0

    .line 283
    :cond_c
    if-nez p0, :cond_d

    .line 284
    .line 285
    iput-object v6, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->w:Ljava/lang/String;

    .line 286
    .line 287
    goto :goto_0

    .line 288
    :cond_d
    const/4 v0, -0x5

    .line 289
    const-string v4, "Act failed "

    .line 290
    .line 291
    if-ne p0, v0, :cond_e

    .line 292
    .line 293
    new-instance v0, Ljava/lang/StringBuilder;

    .line 294
    .line 295
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 296
    .line 297
    .line 298
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 299
    .line 300
    .line 301
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object v0

    .line 305
    invoke-static {v3, v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 306
    .line 307
    .line 308
    iget-object v0, p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 309
    .line 310
    iput-object v7, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->u:Ljava/lang/String;

    .line 311
    .line 312
    goto :goto_0

    .line 313
    :cond_e
    const/4 v0, -0x1

    .line 314
    if-eq p0, v0, :cond_f

    .line 315
    .line 316
    if-eqz p0, :cond_f

    .line 317
    .line 318
    new-instance v0, Ljava/lang/StringBuilder;

    .line 319
    .line 320
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 321
    .line 322
    .line 323
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 324
    .line 325
    .line 326
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 327
    .line 328
    .line 329
    move-result-object v0

    .line 330
    invoke-static {v3, v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 331
    .line 332
    .line 333
    :cond_f
    :goto_0
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    .line 334
    .line 335
    .line 336
    move-result-object v0

    .line 337
    new-instance v1, Ljava/lang/StringBuilder;

    .line 338
    .line 339
    const-string v4, "pose state "

    .line 340
    .line 341
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 342
    .line 343
    .line 344
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 345
    .line 346
    .line 347
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 348
    .line 349
    .line 350
    move-result-object p0

    .line 351
    invoke-virtual {v0, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->reportInfo(Ljava/lang/String;)V

    .line 352
    .line 353
    .line 354
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->canReflect()Z

    .line 355
    .line 356
    .line 357
    move-result p0

    .line 358
    if-eqz p0, :cond_12

    .line 359
    .line 360
    const-string p0, "make_pack_use_time_best_img"

    .line 361
    .line 362
    invoke-static {p0}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->benchMarkBegin(Ljava/lang/String;)V

    .line 363
    .line 364
    .line 365
    iget-object v0, p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 366
    .line 367
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->getActReflectData()Lcom/tencent/youtu/ytposedetect/data/YTActRefData;

    .line 368
    .line 369
    .line 370
    move-result-object v1

    .line 371
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->p:Lcom/tencent/youtu/ytposedetect/data/YTActRefData;

    .line 372
    .line 373
    iget-object v0, p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 374
    .line 375
    iget-object v0, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->p:Lcom/tencent/youtu/ytposedetect/data/YTActRefData;

    .line 376
    .line 377
    iget-object v0, v0, Lcom/tencent/youtu/ytposedetect/data/YTActRefData;->best:Lcom/tencent/youtu/ytposedetect/data/YTActRefImage;

    .line 378
    .line 379
    if-eqz v0, :cond_11

    .line 380
    .line 381
    iget-object v0, v0, Lcom/tencent/youtu/ytposedetect/data/YTActRefImage;->image:[B

    .line 382
    .line 383
    array-length v0, v0

    .line 384
    if-nez v0, :cond_10

    .line 385
    .line 386
    goto :goto_1

    .line 387
    :cond_10
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;

    .line 388
    .line 389
    .line 390
    move-result-object v0

    .line 391
    invoke-static {p0}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->benchMarkEnd(Ljava/lang/String;)J

    .line 392
    .line 393
    .line 394
    move-result-wide v4

    .line 395
    invoke-virtual {v0, v4, v5}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->setPackUseTime(J)V

    .line 396
    .line 397
    .line 398
    goto :goto_2

    .line 399
    :cond_11
    :goto_1
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    .line 400
    .line 401
    .line 402
    move-result-object p0

    .line 403
    const/high16 v0, 0x400000

    .line 404
    .line 405
    const-string v1, "pose detect error"

    .line 406
    .line 407
    invoke-virtual {p0, v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->reportError(ILjava/lang/String;)V

    .line 408
    .line 409
    .line 410
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 411
    .line 412
    .line 413
    move-result-object p0

    .line 414
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/liveness/b;

    .line 415
    .line 416
    invoke-direct {v0, p1}, Lcom/tencent/youtu/sdkkitframework/liveness/b;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;)V

    .line 417
    .line 418
    .line 419
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 420
    .line 421
    .line 422
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->reset()V

    .line 423
    .line 424
    .line 425
    :cond_12
    :goto_2
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->isRecordingDone()Z

    .line 426
    .line 427
    .line 428
    move-result p0

    .line 429
    if-eqz p0, :cond_1c

    .line 430
    .line 431
    sget-object p0, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mPoseDetectProcessManager:Lcom/tencent/youtu/ytposedetect/manager/a;

    .line 432
    .line 433
    iget v0, p0, Lcom/tencent/youtu/ytposedetect/manager/a;->b:I

    .line 434
    .line 435
    const/16 v1, 0x8

    .line 436
    .line 437
    const/4 v4, 0x7

    .line 438
    const/4 v5, 0x6

    .line 439
    const/4 v6, 0x5

    .line 440
    if-ne p2, v2, :cond_14

    .line 441
    .line 442
    if-eq v0, v6, :cond_13

    .line 443
    .line 444
    if-eq v0, v5, :cond_13

    .line 445
    .line 446
    if-eq v0, v4, :cond_13

    .line 447
    .line 448
    if-ne v0, v1, :cond_14

    .line 449
    .line 450
    :cond_13
    iget v7, p0, Lcom/tencent/youtu/ytposedetect/manager/a;->d:I

    .line 451
    .line 452
    goto :goto_3

    .line 453
    :cond_14
    iget v7, p0, Lcom/tencent/youtu/ytposedetect/manager/a;->c:I

    .line 454
    .line 455
    :goto_3
    if-ne p2, v2, :cond_16

    .line 456
    .line 457
    if-eq v0, v6, :cond_15

    .line 458
    .line 459
    if-eq v0, v5, :cond_15

    .line 460
    .line 461
    if-eq v0, v4, :cond_15

    .line 462
    .line 463
    if-ne v0, v1, :cond_16

    .line 464
    .line 465
    :cond_15
    iget p0, p0, Lcom/tencent/youtu/ytposedetect/manager/a;->c:I

    .line 466
    .line 467
    goto :goto_4

    .line 468
    :cond_16
    iget p0, p0, Lcom/tencent/youtu/ytposedetect/manager/a;->d:I

    .line 469
    .line 470
    :goto_4
    invoke-static {p0, v7}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->getOneActionFrame(II)V

    .line 471
    .line 472
    .line 473
    iget-object p2, p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 474
    .line 475
    iget-boolean v0, p2, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->l:Z

    .line 476
    .line 477
    if-nez v0, :cond_17

    .line 478
    .line 479
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->reset()V

    .line 480
    .line 481
    .line 482
    return-void

    .line 483
    :cond_17
    :try_start_0
    iget-object p2, p2, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->m:Lcom/tencent/youtu/sdkkitframework/liveness/p;

    .line 484
    .line 485
    if-eqz p2, :cond_18

    .line 486
    .line 487
    iget-object p2, p2, Lcom/tencent/youtu/sdkkitframework/liveness/p;->a:Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;

    .line 488
    .line 489
    invoke-virtual {p2}, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->stopEncoding()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 490
    .line 491
    .line 492
    goto :goto_5

    .line 493
    :catch_0
    move-exception p2

    .line 494
    new-instance v0, Ljava/lang/StringBuilder;

    .line 495
    .line 496
    const-string v1, "encode stop error! "

    .line 497
    .line 498
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 499
    .line 500
    .line 501
    invoke-static {p2}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 502
    .line 503
    .line 504
    move-result-object p2

    .line 505
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 506
    .line 507
    .line 508
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 509
    .line 510
    .line 511
    move-result-object p2

    .line 512
    invoke-static {v3, p2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 513
    .line 514
    .line 515
    :cond_18
    :goto_5
    iget-object p2, p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 516
    .line 517
    iget-object v0, p2, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->m:Lcom/tencent/youtu/sdkkitframework/liveness/p;

    .line 518
    .line 519
    const-string v1, "frames"

    .line 520
    .line 521
    if-eqz v0, :cond_19

    .line 522
    .line 523
    iget-object v0, v0, Lcom/tencent/youtu/sdkkitframework/liveness/p;->g:Lorg/json/JSONArray;

    .line 524
    .line 525
    if-eqz v0, :cond_19

    .line 526
    .line 527
    iget-object p2, p2, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    .line 528
    .line 529
    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    .line 530
    .line 531
    .line 532
    move-result-object v0

    .line 533
    invoke-virtual {p2, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 534
    .line 535
    .line 536
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;

    .line 537
    .line 538
    .line 539
    move-result-object p2

    .line 540
    iget-object v0, p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 541
    .line 542
    iget-object v0, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->m:Lcom/tencent/youtu/sdkkitframework/liveness/p;

    .line 543
    .line 544
    iget-object v0, v0, Lcom/tencent/youtu/sdkkitframework/liveness/p;->h:Ljava/lang/String;

    .line 545
    .line 546
    const v1, 0x61ae8

    .line 547
    .line 548
    .line 549
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 550
    .line 551
    .line 552
    move-result-object v1

    .line 553
    invoke-virtual {p2, v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->conservationVideoErrorData(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/String;

    .line 554
    .line 555
    .line 556
    move-result-object p2

    .line 557
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 558
    .line 559
    .line 560
    move-result-object v0

    .line 561
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/liveness/c;

    .line 562
    .line 563
    invoke-direct {v1, p1, p2}, Lcom/tencent/youtu/sdkkitframework/liveness/c;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;Ljava/lang/String;)V

    .line 564
    .line 565
    .line 566
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 567
    .line 568
    .line 569
    iget-object p2, p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 570
    .line 571
    iget-object v0, p2, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->m:Lcom/tencent/youtu/sdkkitframework/liveness/p;

    .line 572
    .line 573
    iget-object v0, v0, Lcom/tencent/youtu/sdkkitframework/liveness/p;->f:Ljava/lang/String;

    .line 574
    .line 575
    iput-object v0, p2, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->C:Ljava/lang/String;

    .line 576
    .line 577
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 578
    .line 579
    .line 580
    move-result-object p2

    .line 581
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->NET_FETCH_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 582
    .line 583
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 584
    .line 585
    .line 586
    move-result-object v0

    .line 587
    invoke-virtual {p2, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getStateByName(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 588
    .line 589
    .line 590
    move-result-object p2

    .line 591
    iget-object v0, p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 592
    .line 593
    iget-object v0, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->C:Ljava/lang/String;

    .line 594
    .line 595
    const-string v1, "control_config"

    .line 596
    .line 597
    invoke-virtual {p2, v1, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->updateDataBy(Ljava/lang/String;Ljava/lang/Object;)V

    .line 598
    .line 599
    .line 600
    goto :goto_6

    .line 601
    :cond_19
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->getActionData()Lcom/tencent/youtu/ytposedetect/data/ActionData;

    .line 602
    .line 603
    .line 604
    move-result-object p2

    .line 605
    iget-boolean v0, p2, Lcom/tencent/youtu/ytposedetect/data/ActionData;->isSuccess:Z

    .line 606
    .line 607
    if-nez v0, :cond_1a

    .line 608
    .line 609
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 610
    .line 611
    .line 612
    move-result-object p0

    .line 613
    new-instance p2, Lcom/tencent/youtu/sdkkitframework/liveness/d;

    .line 614
    .line 615
    invoke-direct {p2, p1}, Lcom/tencent/youtu/sdkkitframework/liveness/d;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;)V

    .line 616
    .line 617
    .line 618
    invoke-virtual {p0, p2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 619
    .line 620
    .line 621
    goto :goto_7

    .line 622
    :cond_1a
    iget-object v0, p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 623
    .line 624
    iget-object v0, v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    .line 625
    .line 626
    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 627
    .line 628
    .line 629
    :goto_6
    iget-object p1, p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 630
    .line 631
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 632
    .line 633
    .line 634
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 635
    .line 636
    .line 637
    move-result-object p2

    .line 638
    invoke-virtual {p2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getWorkMode()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    .line 639
    .line 640
    .line 641
    move-result-object p2

    .line 642
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;->YT_FW_ACTREFLECT_TYPE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    .line 643
    .line 644
    if-ne p2, v0, :cond_1b

    .line 645
    .line 646
    iget-object p0, p1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    .line 647
    .line 648
    iget-object p2, p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->p:Lcom/tencent/youtu/ytposedetect/data/YTActRefData;

    .line 649
    .line 650
    const-string v0, "act_reflect_data"

    .line 651
    .line 652
    invoke-virtual {p0, v0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 653
    .line 654
    .line 655
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->REFLECT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 656
    .line 657
    iput-object p0, p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->k:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 658
    .line 659
    goto :goto_7

    .line 660
    :cond_1b
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->getBestImage()[B

    .line 661
    .line 662
    .line 663
    move-result-object p2

    .line 664
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;

    .line 665
    .line 666
    invoke-direct {v0, p2, p0, v7}, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;-><init>([BII)V

    .line 667
    .line 668
    .line 669
    const/16 p0, 0x64

    .line 670
    .line 671
    invoke-virtual {v0, p0}, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->bgr2JPEG(I)[B

    .line 672
    .line 673
    .line 674
    move-result-object p0

    .line 675
    iput-object p0, v0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->imgData:[B

    .line 676
    .line 677
    iget-object p0, p1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    .line 678
    .line 679
    const-string p2, "best_frame"

    .line 680
    .line 681
    invoke-virtual {p0, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 682
    .line 683
    .line 684
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->NET_LIVENESS_REQ_RESULT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 685
    .line 686
    iput-object p0, p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->k:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 687
    .line 688
    :cond_1c
    :goto_7
    return-void
.end method

.method public static releaseModel()V
    .locals 2

    .line 1
    const-string v0, "YoutuFaceDetect"

    .line 2
    .line 3
    const-string v1, "[YTFacePreviewInterface.finalize] ---"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->nativeLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    sput-object v0, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->sPoseDetectOnFrame:Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$b;

    .line 10
    .line 11
    sget v0, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mInitModel:I

    .line 12
    .line 13
    add-int/lit8 v0, v0, -0x1

    .line 14
    .line 15
    sput v0, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mInitModel:I

    .line 16
    .line 17
    if-gtz v0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->releaseAll()V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    sput v0, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mInitModel:I

    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public static reset()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->resetDetect()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static setSafetyLevel(I)V
    .locals 1

    .line 1
    if-ltz p0, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    if-ge p0, v0, :cond_0

    .line 5
    .line 6
    invoke-static {p0}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->setSafetyLevel(I)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public static start(Landroid/content/Context;ILcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$c;)I
    .locals 1

    .line 1
    const-string p0, "YoutuFaceDetect"

    .line 2
    .line 3
    const-string v0, "[YTPoseDetectInterface.start] ---"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->nativeLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    if-nez p2, :cond_0

    .line 9
    .line 10
    const/4 p0, -0x1

    .line 11
    return p0

    .line 12
    :cond_0
    sput-object p2, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mCheckResult:Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$c;

    .line 13
    .line 14
    sget p0, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mInitModel:I

    .line 15
    .line 16
    if-lez p0, :cond_2

    .line 17
    .line 18
    sget-object p0, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mPoseDetectProcessManager:Lcom/tencent/youtu/ytposedetect/manager/a;

    .line 19
    .line 20
    iget-boolean p2, p0, Lcom/tencent/youtu/ytposedetect/manager/a;->a:Z

    .line 21
    .line 22
    if-eqz p2, :cond_1

    .line 23
    .line 24
    const-string p2, "FaceDetectProcess"

    .line 25
    .line 26
    const-string v0, "Restart FaceDetect process. YTPoseDetectInterface.stop() should be called before the next start, or maybe camera\'s parameter may be setting wrong."

    .line 27
    .line 28
    invoke-static {p2, v0}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->nativeLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    iput p1, p0, Lcom/tencent/youtu/ytposedetect/manager/a;->b:I

    .line 32
    .line 33
    const/4 p1, 0x1

    .line 34
    iput-boolean p1, p0, Lcom/tencent/youtu/ytposedetect/manager/a;->a:Z

    .line 35
    .line 36
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->access$000()V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    const-string p0, "Not init model."

    .line 41
    .line 42
    const-string p1, "Call YTPoseDetectInterface.initModel() before."

    .line 43
    .line 44
    const/4 p2, 0x2

    .line 45
    invoke-static {p2, p0, p1}, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->noticeFailed(ILjava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :goto_0
    const/4 p0, 0x0

    .line 49
    return p0
.end method

.method public static stop()V
    .locals 3

    .line 1
    const-string v0, "YoutuFaceDetect"

    .line 2
    .line 3
    const-string v1, "[YTPoseDetectInterface.stop] ---"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->nativeLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mPoseDetectProcessManager:Lcom/tencent/youtu/ytposedetect/manager/a;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-boolean v2, v0, Lcom/tencent/youtu/ytposedetect/manager/a;->a:Z

    .line 14
    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    iput-boolean v1, v0, Lcom/tencent/youtu/ytposedetect/manager/a;->a:Z

    .line 18
    .line 19
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->resetDetect()V

    .line 20
    .line 21
    .line 22
    :cond_0
    sput-boolean v1, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->mIsStarted:Z

    .line 23
    .line 24
    return-void
.end method
