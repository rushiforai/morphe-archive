.class public Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final TAG:Ljava/lang/String; = "YtCameraSetting"

.field public static customFPS:I = 0x3a98

.field public static mCameraFacing:I = 0x1

.field public static mDesiredPreviewHeight:I = 0x1e0

.field public static mDesiredPreviewWidth:I = 0x280

.field public static mRotate:I


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

.method public static chooseFixedPreviewFps(Landroid/hardware/Camera$Parameters;I)I
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFpsRange()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x1

    .line 14
    const/4 v3, 0x0

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, [I

    .line 22
    .line 23
    sget-object v4, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->TAG:Ljava/lang/String;

    .line 24
    .line 25
    new-instance v5, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v6, "entry: "

    .line 28
    .line 29
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    aget v6, v1, v3

    .line 33
    .line 34
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v6, " - "

    .line 38
    .line 39
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    aget v6, v1, v2

    .line 43
    .line 44
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    invoke-static {v4, v5}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    aget v5, v1, v3

    .line 55
    .line 56
    aget v6, v1, v2

    .line 57
    .line 58
    if-ne v5, v6, :cond_0

    .line 59
    .line 60
    if-ne v5, p1, :cond_0

    .line 61
    .line 62
    invoke-virtual {p0, v5, v6}, Landroid/hardware/Camera$Parameters;->setPreviewFpsRange(II)V

    .line 63
    .line 64
    .line 65
    new-instance p0, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    const-string p1, "use preview fps range: "

    .line 68
    .line 69
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    aget p1, v1, v3

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string p1, " "

    .line 78
    .line 79
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    aget p1, v1, v2

    .line 83
    .line 84
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-static {v4, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    aget p0, v1, v3

    .line 95
    .line 96
    return p0

    .line 97
    :cond_1
    const/4 v0, 0x2

    .line 98
    new-array v0, v0, [I

    .line 99
    .line 100
    invoke-virtual {p0, v0}, Landroid/hardware/Camera$Parameters;->getPreviewFpsRange([I)V

    .line 101
    .line 102
    .line 103
    aget v1, v0, v3

    .line 104
    .line 105
    aget v0, v0, v2

    .line 106
    .line 107
    if-ne v1, v0, :cond_2

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_2
    if-le p1, v0, :cond_3

    .line 111
    .line 112
    move p1, v0

    .line 113
    :cond_3
    if-ge p1, v1, :cond_4

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_4
    move v1, p1

    .line 117
    :goto_0
    const-string p1, "preview-frame-rate-values"

    .line 118
    .line 119
    invoke-virtual {p0, p1}, Landroid/hardware/Camera$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-nez v0, :cond_7

    .line 128
    .line 129
    new-instance v0, Ljava/lang/StringBuilder;

    .line 130
    .line 131
    const-string v4, ""

    .line 132
    .line 133
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    div-int/lit16 v4, v1, 0x3e8

    .line 137
    .line 138
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-nez v0, :cond_7

    .line 150
    .line 151
    const-string v0, ","

    .line 152
    .line 153
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    array-length v0, p1

    .line 158
    :goto_1
    if-ge v3, v0, :cond_6

    .line 159
    .line 160
    aget-object v4, p1, v3

    .line 161
    .line 162
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 163
    .line 164
    .line 165
    move-result v4

    .line 166
    mul-int/lit16 v4, v4, 0x3e8

    .line 167
    .line 168
    if-ge v1, v4, :cond_5

    .line 169
    .line 170
    div-int/lit16 p1, v4, 0x3e8

    .line 171
    .line 172
    invoke-virtual {p0, p1}, Landroid/hardware/Camera$Parameters;->setPreviewFrameRate(I)V

    .line 173
    .line 174
    .line 175
    return v4

    .line 176
    :cond_5
    add-int/lit8 v3, v3, 0x1

    .line 177
    .line 178
    goto :goto_1

    .line 179
    :cond_6
    array-length v0, p1

    .line 180
    if-lez v0, :cond_7

    .line 181
    .line 182
    array-length v0, p1

    .line 183
    sub-int/2addr v0, v2

    .line 184
    aget-object p1, p1, v0

    .line 185
    .line 186
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 187
    .line 188
    .line 189
    move-result p1

    .line 190
    mul-int/lit16 p1, p1, 0x3e8

    .line 191
    .line 192
    if-le v1, p1, :cond_7

    .line 193
    .line 194
    move v1, p1

    .line 195
    :cond_7
    div-int/lit16 p1, v1, 0x3e8

    .line 196
    .line 197
    invoke-virtual {p0, p1}, Landroid/hardware/Camera$Parameters;->setPreviewFrameRate(I)V

    .line 198
    .line 199
    .line 200
    return v1
.end method

.method public static getDesiredPreviewHeight()I
    .locals 1

    .line 1
    sget v0, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->mDesiredPreviewHeight:I

    .line 2
    .line 3
    return v0
.end method

.method public static getDesiredPreviewWidth()I
    .locals 1

    .line 1
    sget v0, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->mDesiredPreviewWidth:I

    .line 2
    .line 3
    return v0
.end method

.method public static getOptimalPreviewSize(Ljava/util/List;II)Landroid/hardware/Camera$Size;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/hardware/Camera$Size;",
            ">;II)",
            "Landroid/hardware/Camera$Size;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    int-to-double v1, v1

    .line 14
    int-to-double v3, p1

    .line 15
    div-double/2addr v1, v3

    .line 16
    sget-object p2, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->TAG:Ljava/lang/String;

    .line 17
    .line 18
    new-instance v3, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v4, "sizes size="

    .line 21
    .line 22
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-static {p2, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    const-wide v3, 0x7fefffffffffffffL    # Double.MAX_VALUE

    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    move-wide v5, v3

    .line 49
    :cond_1
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 50
    .line 51
    .line 52
    move-result v7

    .line 53
    if-eqz v7, :cond_2

    .line 54
    .line 55
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v7

    .line 59
    check-cast v7, Landroid/hardware/Camera$Size;

    .line 60
    .line 61
    iget v8, v7, Landroid/hardware/Camera$Size;->width:I

    .line 62
    .line 63
    int-to-double v8, v8

    .line 64
    iget v10, v7, Landroid/hardware/Camera$Size;->height:I

    .line 65
    .line 66
    int-to-double v10, v10

    .line 67
    div-double/2addr v8, v10

    .line 68
    sub-double/2addr v8, v1

    .line 69
    invoke-static {v8, v9}, Ljava/lang/Math;->abs(D)D

    .line 70
    .line 71
    .line 72
    move-result-wide v8

    .line 73
    const-wide v10, 0x3f50624dd2f1a9fcL    # 0.001

    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    cmpg-double v8, v8, v10

    .line 79
    .line 80
    if-gtz v8, :cond_1

    .line 81
    .line 82
    iget v8, v7, Landroid/hardware/Camera$Size;->height:I

    .line 83
    .line 84
    sub-int/2addr v8, p1

    .line 85
    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    .line 86
    .line 87
    .line 88
    move-result v8

    .line 89
    int-to-double v8, v8

    .line 90
    cmpg-double v8, v8, v5

    .line 91
    .line 92
    if-gez v8, :cond_1

    .line 93
    .line 94
    iget v0, v7, Landroid/hardware/Camera$Size;->height:I

    .line 95
    .line 96
    sub-int/2addr v0, p1

    .line 97
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    int-to-double v5, v0

    .line 102
    move-object v0, v7

    .line 103
    goto :goto_0

    .line 104
    :cond_2
    if-nez v0, :cond_4

    .line 105
    .line 106
    sget-object p2, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->TAG:Ljava/lang/String;

    .line 107
    .line 108
    const-string v1, "No preview size match the aspect ratio"

    .line 109
    .line 110
    invoke-static {p2, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 111
    .line 112
    .line 113
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    :cond_3
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 118
    .line 119
    .line 120
    move-result p2

    .line 121
    if-eqz p2, :cond_4

    .line 122
    .line 123
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object p2

    .line 127
    check-cast p2, Landroid/hardware/Camera$Size;

    .line 128
    .line 129
    iget v1, p2, Landroid/hardware/Camera$Size;->height:I

    .line 130
    .line 131
    sub-int/2addr v1, p1

    .line 132
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    int-to-double v1, v1

    .line 137
    cmpg-double v1, v1, v3

    .line 138
    .line 139
    if-gez v1, :cond_3

    .line 140
    .line 141
    iget v0, p2, Landroid/hardware/Camera$Size;->height:I

    .line 142
    .line 143
    sub-int/2addr v0, p1

    .line 144
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    int-to-double v3, v0

    .line 149
    move-object v0, p2

    .line 150
    goto :goto_1

    .line 151
    :cond_4
    return-object v0
.end method

.method public static getRotate(Landroid/content/Context;II)I
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->getVideoRotate(Landroid/content/Context;I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0, p2}, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->getRotateTag(II)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static getRotateTag(II)I
    .locals 4

    .line 1
    const/16 v0, 0x5a

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x7

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/16 v0, 0xb4

    .line 9
    .line 10
    if-ne p0, v0, :cond_1

    .line 11
    .line 12
    const/4 p0, 0x3

    .line 13
    goto :goto_0

    .line 14
    :cond_1
    const/16 v0, 0x10e

    .line 15
    .line 16
    if-ne p0, v0, :cond_2

    .line 17
    .line 18
    const/4 p0, 0x5

    .line 19
    goto :goto_0

    .line 20
    :cond_2
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->TAG:Ljava/lang/String;

    .line 21
    .line 22
    new-instance v2, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v3, "camera rotate not 90degree or 180degree, input: "

    .line 25
    .line 26
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {v0, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    move p0, v1

    .line 40
    :goto_0
    if-ne p1, v1, :cond_3

    .line 41
    .line 42
    return p0

    .line 43
    :cond_3
    invoke-static {p0}, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->transBackFacingCameraRatateTag(I)I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    return p0
.end method

.method public static getVideoRotate(Landroid/content/Context;I)I
    .locals 4

    .line 1
    new-instance v0, Landroid/hardware/Camera$CameraInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 7
    .line 8
    .line 9
    const-string p1, "window"

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Landroid/view/WindowManager;

    .line 16
    .line 17
    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Landroid/view/Display;->getRotation()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    const/4 p1, 0x1

    .line 26
    const/4 v1, 0x0

    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    if-eq p0, p1, :cond_2

    .line 30
    .line 31
    const/4 v2, 0x2

    .line 32
    if-eq p0, v2, :cond_1

    .line 33
    .line 34
    const/4 v2, 0x3

    .line 35
    if-eq p0, v2, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/16 v1, 0x10e

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/16 v1, 0xb4

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    const/16 v1, 0x5a

    .line 45
    .line 46
    :cond_3
    :goto_0
    iget p0, v0, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 47
    .line 48
    iget v2, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    .line 49
    .line 50
    if-ne p0, p1, :cond_4

    .line 51
    .line 52
    add-int/2addr v2, v1

    .line 53
    rem-int/lit16 v2, v2, 0x168

    .line 54
    .line 55
    rsub-int p0, v2, 0x168

    .line 56
    .line 57
    rem-int/lit16 p0, p0, 0x168

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_4
    sub-int/2addr v2, v1

    .line 61
    add-int/lit16 v2, v2, 0x168

    .line 62
    .line 63
    rem-int/lit16 p0, v2, 0x168

    .line 64
    .line 65
    :goto_1
    sget-object p1, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->TAG:Ljava/lang/String;

    .line 66
    .line 67
    new-instance v2, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    const-string v3, "debug camera orientation is "

    .line 70
    .line 71
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iget v0, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    .line 75
    .line 76
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v0, " ui degrees is "

    .line 80
    .line 81
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-static {p1, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    return p0
.end method

.method public static initCamera(Landroid/content/Context;Landroid/hardware/Camera;I)I
    .locals 2

    const/4 v0, 0x4

    const/4 v1, 0x0

    .line 63
    invoke-static {p0, p1, p2, v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->initCamera(Landroid/content/Context;Landroid/hardware/Camera;IIZ)I

    move-result p0

    return p0
.end method

.method public static initCamera(Landroid/content/Context;Landroid/hardware/Camera;II)I
    .locals 1

    const/4 v0, 0x0

    .line 62
    invoke-static {p0, p1, p2, p3, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->initCamera(Landroid/content/Context;Landroid/hardware/Camera;IIZ)I

    move-result p0

    return p0
.end method

.method public static initCamera(Landroid/content/Context;Landroid/hardware/Camera;IIZ)I
    .locals 9

    const-string v0, "Camera.setParameters.setPreviewSize failed!!: "

    const/16 v1, 0x280

    .line 1
    sput v1, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->mDesiredPreviewWidth:I

    const/16 v1, 0x1e0

    .line 2
    sput v1, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->mDesiredPreviewHeight:I

    const/4 v1, 0x1

    .line 3
    :try_start_0
    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    .line 4
    invoke-virtual {v2}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    move-result-object v3

    const/4 v4, 0x0

    move v5, v4

    .line 5
    :goto_0
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v6

    if-ge v5, v6, :cond_0

    .line 6
    sget-object v6, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "suporrtedFocusModes "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, " :"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->v(Ljava/lang/String;Ljava/lang/Object;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 7
    :cond_0
    const-string v5, "continuous-video"

    invoke-interface {v3, v5}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v6

    if-ltz v6, :cond_1

    .line 8
    invoke-virtual {v2, v5}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 9
    sget-object v3, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->TAG:Ljava/lang/String;

    const-string v5, "set camera focus mode continuous video"

    invoke-static {v3, v5}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    .line 10
    :cond_1
    const-string v5, "auto"

    invoke-interface {v3, v5}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v3

    if-ltz v3, :cond_2

    .line 11
    invoke-virtual {v2, v5}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 12
    sget-object v3, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->TAG:Ljava/lang/String;

    const-string v5, "set camera focus mode auto"

    invoke-static {v3, v5}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    .line 13
    :cond_2
    sget-object v3, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->TAG:Ljava/lang/String;

    const-string v5, "NOT set camera focus mode"

    invoke-static {v3, v5}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 14
    :goto_1
    :try_start_1
    invoke-virtual {p1, v2}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception p0

    goto/16 :goto_8

    :catch_0
    move-exception v2

    .line 15
    :try_start_2
    sget-object v3, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->TAG:Ljava/lang/String;

    invoke-static {v3, v0, v2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 16
    :goto_2
    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v2

    .line 17
    invoke-static {p0, p2}, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->getVideoRotate(Landroid/content/Context;I)I

    move-result p0

    .line 18
    invoke-virtual {p1, p0}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    .line 19
    sget-object v3, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "videoOrietation is"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v3, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 20
    invoke-static {p2, p3}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result p0

    const-string v5, "x"

    if-eqz p0, :cond_3

    .line 21
    invoke-static {p2, p3}, Landroid/media/CamcorderProfile;->get(II)Landroid/media/CamcorderProfile;

    move-result-object p0

    .line 22
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "custom camcorderProfile:"

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p3, p0, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p3, p0, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v3, p2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_3

    :cond_3
    const/4 p0, 0x4

    .line 23
    invoke-static {p2, p0}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result p3

    if-eqz p3, :cond_4

    .line 24
    invoke-static {p2, p0}, Landroid/media/CamcorderProfile;->get(II)Landroid/media/CamcorderProfile;

    move-result-object p0

    .line 25
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "480P camcorderProfile:"

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p3, p0, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p3, p0, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v3, p2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_3

    :cond_4
    const/4 p0, 0x5

    .line 26
    invoke-static {p2, p0}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result p3

    if-eqz p3, :cond_5

    .line 27
    invoke-static {p2, p0}, Landroid/media/CamcorderProfile;->get(II)Landroid/media/CamcorderProfile;

    move-result-object p0

    .line 28
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "720P camcorderProfile:"

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p3, p0, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p3, p0, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v3, p2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_3

    .line 29
    :cond_5
    invoke-static {p2, v1}, Landroid/media/CamcorderProfile;->get(II)Landroid/media/CamcorderProfile;

    move-result-object p0

    .line 30
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "High camcorderProfile:"

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p3, p0, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p3, p0, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v3, p2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 31
    :goto_3
    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object p2

    invoke-virtual {p2}, Landroid/hardware/Camera$Parameters;->getSupportedPictureSizes()Ljava/util/List;

    move-result-object p2

    .line 32
    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object p3

    invoke-virtual {p3}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    move-result-object p3

    move v3, v4

    .line 33
    :goto_4
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v5

    const-string v6, " x "

    if-ge v3, v5, :cond_6

    .line 34
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/hardware/Camera$Size;

    .line 35
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget v8, v5, Landroid/hardware/Camera$Size;->width:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, v5, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "pictureSize"

    invoke-static {v6, v5}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    :cond_6
    move p2, v4

    .line 36
    :goto_5
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v3

    if-ge p2, v3, :cond_7

    .line 37
    invoke-interface {p3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/hardware/Camera$Size;

    .line 38
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget v7, v3, Landroid/hardware/Camera$Size;->width:I

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v3, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v5, "previewSize"

    invoke-static {v5, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_5

    .line 39
    :cond_7
    invoke-static {v2, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->setVideoSize(Landroid/hardware/Camera$Parameters;Landroid/media/CamcorderProfile;)V

    if-eqz p4, :cond_8

    .line 40
    iget p2, p0, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    sput p2, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->mDesiredPreviewWidth:I

    .line 41
    iget p0, p0, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    sput p0, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->mDesiredPreviewHeight:I

    .line 42
    :cond_8
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "mDesiredPreviewWidth: "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget p3, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->mDesiredPreviewWidth:I

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, ", mDesiredPreviewHeight: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget p3, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->mDesiredPreviewHeight:I

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 43
    sget p0, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->mDesiredPreviewWidth:I

    sget p2, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->mDesiredPreviewHeight:I

    invoke-virtual {v2, p0, p2}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    const/16 p0, 0x11

    .line 44
    invoke-virtual {v2, p0}, Landroid/hardware/Camera$Parameters;->setPreviewFormat(I)V

    .line 45
    :try_start_3
    invoke-virtual {p1, v2}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_6

    :catch_1
    move-exception p0

    .line 46
    sget-object p2, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->TAG:Ljava/lang/String;

    invoke-static {p2, v0, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 47
    :goto_6
    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object p0

    .line 48
    sget p2, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->customFPS:I

    invoke-static {p0, p2}, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->chooseFixedPreviewFps(Landroid/hardware/Camera$Parameters;I)I

    move-result p2

    .line 49
    sget-object p3, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->TAG:Ljava/lang/String;

    new-instance p4, Ljava/lang/StringBuilder;

    const-string v0, "choose camera fps is : "

    invoke-direct {p4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p3, p2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 50
    :try_start_4
    invoke-virtual {p1, p0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_7

    :catch_2
    move-exception p0

    .line 51
    sget-object p2, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->TAG:Ljava/lang/String;

    const-string p3, "Camera.setParameters.preview fps failed!!: "

    invoke-static {p2, p3, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 52
    :goto_7
    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object p0

    const/4 p1, 0x2

    .line 53
    new-array p1, p1, [I

    .line 54
    invoke-virtual {p0, p1}, Landroid/hardware/Camera$Parameters;->getPreviewFpsRange([I)V

    .line 55
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getPreviewFrameRate()I

    move-result p2

    .line 56
    sget-object p3, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->TAG:Ljava/lang/String;

    new-instance p4, Ljava/lang/StringBuilder;

    const-string v0, "after set parameters getPreviewFpsRange="

    invoke-direct {p4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget v0, p1, v4

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "-"

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget p1, p1, v1

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " ;after set parameter fps="

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p3, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 57
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object p0

    .line 58
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "camera preview size is "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p2, p0, Landroid/hardware/Camera$Size;->width:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p3, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    return v4

    .line 59
    :goto_8
    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 60
    throw p0

    :catch_3
    move-exception p0

    .line 61
    sget-object p1, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->TAG:Ljava/lang/String;

    const-string p2, "get camera parameters failed. 1. Check Camera.getParameters() interface. 2. Get logs for more detail."

    invoke-static {p1, p2, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return v1
.end method

.method public static setCameraFacing(I)V
    .locals 0

    .line 1
    sput p0, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->mCameraFacing:I

    .line 2
    .line 3
    return-void
.end method

.method public static setCameraRotate(I)V
    .locals 0

    .line 1
    sput p0, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->mRotate:I

    .line 2
    .line 3
    return-void
.end method

.method public static setCustomFPS(I)V
    .locals 0

    .line 1
    sput p0, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->customFPS:I

    .line 2
    .line 3
    return-void
.end method

.method public static setVideoSize(Landroid/hardware/Camera$Parameters;Landroid/media/CamcorderProfile;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedVideoSizes()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/16 v2, 0x1e0

    .line 10
    .line 11
    const/16 v3, 0x280

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->TAG:Ljava/lang/String;

    .line 16
    .line 17
    new-instance v4, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v5, "video size from profile is : "

    .line 20
    .line 21
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget v5, p1, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    .line 25
    .line 26
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v5, " "

    .line 30
    .line 31
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget v5, p1, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    .line 35
    .line 36
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-static {v1, v4}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    iget v4, p1, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    .line 47
    .line 48
    iget v5, p1, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    .line 49
    .line 50
    invoke-static {v0, v4, v5}, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->getOptimalPreviewSize(Ljava/util/List;II)Landroid/hardware/Camera$Size;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    if-nez v0, :cond_0

    .line 55
    .line 56
    const-string v0, "do not find proper preview size, use default"

    .line 57
    .line 58
    invoke-static {v1, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    iput v3, p1, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    .line 62
    .line 63
    iput v2, p1, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    .line 64
    .line 65
    :cond_0
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedVideoSizes()Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    if-eqz p0, :cond_3

    .line 70
    .line 71
    const/4 v0, 0x0

    .line 72
    move v1, v0

    .line 73
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    if-ge v0, v4, :cond_2

    .line 78
    .line 79
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    check-cast v4, Landroid/hardware/Camera$Size;

    .line 84
    .line 85
    iget v5, v4, Landroid/hardware/Camera$Size;->width:I

    .line 86
    .line 87
    iget v6, p1, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    .line 88
    .line 89
    if-ne v5, v6, :cond_1

    .line 90
    .line 91
    iget v4, v4, Landroid/hardware/Camera$Size;->height:I

    .line 92
    .line 93
    iget v5, p1, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    .line 94
    .line 95
    if-ne v4, v5, :cond_1

    .line 96
    .line 97
    const/4 v1, 0x1

    .line 98
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_2
    if-nez v1, :cond_3

    .line 102
    .line 103
    iput v3, p1, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    .line 104
    .line 105
    iput v2, p1, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    .line 106
    .line 107
    :cond_3
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->TAG:Ljava/lang/String;

    .line 108
    .line 109
    new-instance v0, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    const-string v1, "select video size camcorderProfile:"

    .line 112
    .line 113
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    iget v1, p1, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    const-string v1, "x"

    .line 122
    .line 123
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    iget p1, p1, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    .line 127
    .line 128
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-static {p0, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public static transBackFacingCameraRatateTag(I)I
    .locals 4

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x1

    .line 3
    if-ne p0, v1, :cond_0

    .line 4
    .line 5
    return v0

    .line 6
    :cond_0
    if-ne p0, v0, :cond_1

    .line 7
    .line 8
    return v1

    .line 9
    :cond_1
    const/4 v0, 0x4

    .line 10
    const/4 v1, 0x3

    .line 11
    if-ne p0, v1, :cond_2

    .line 12
    .line 13
    return v0

    .line 14
    :cond_2
    if-ne p0, v0, :cond_3

    .line 15
    .line 16
    return v1

    .line 17
    :cond_3
    const/16 v0, 0x8

    .line 18
    .line 19
    const/4 v1, 0x5

    .line 20
    if-ne p0, v1, :cond_4

    .line 21
    .line 22
    return v0

    .line 23
    :cond_4
    const/4 v2, 0x7

    .line 24
    const/4 v3, 0x6

    .line 25
    if-ne p0, v3, :cond_5

    .line 26
    .line 27
    return v2

    .line 28
    :cond_5
    if-ne p0, v2, :cond_6

    .line 29
    .line 30
    return v3

    .line 31
    :cond_6
    if-ne p0, v0, :cond_7

    .line 32
    .line 33
    return v1

    .line 34
    :cond_7
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/YtCameraSetting;->TAG:Ljava/lang/String;

    .line 35
    .line 36
    new-instance v1, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    const-string v2, "[YtCameraSetting.transBackFacingCameraRatateTag] unsurported rotateTag: "

    .line 39
    .line 40
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const/4 v1, 0x0

    .line 51
    invoke-static {v0, p0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    const/4 p0, 0x0

    .line 55
    return p0
.end method
