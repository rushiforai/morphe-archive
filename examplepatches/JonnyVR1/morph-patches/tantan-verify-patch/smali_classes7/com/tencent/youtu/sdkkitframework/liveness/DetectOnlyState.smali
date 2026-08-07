.class public Lcom/tencent/youtu/sdkkitframework/liveness/DetectOnlyState;
.super Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Ljava/lang/String;

.field public c:Z

.field public d:I

.field public e:Lcom/tencent/youtu/liveness/YTFaceTracker;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/DetectOnlyState;->a:Z

    .line 6
    .line 7
    const-string v1, ""

    .line 8
    .line 9
    iput-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/DetectOnlyState;->b:Ljava/lang/String;

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/DetectOnlyState;->c:Z

    .line 12
    .line 13
    const/16 v0, 0x50

    .line 14
    .line 15
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/DetectOnlyState;->d:I

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public enterFirst()V
    .locals 0

    return-void
.end method

.method public loadStateWith(Ljava/lang/String;Lorg/json/JSONObject;Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig;)V
    .locals 5

    .line 1
    const-string v0, "min_face_size"

    .line 2
    .line 3
    const-string v1, "need_big_face_mode"

    .line 4
    .line 5
    const-string v2, "resource_download_path"

    .line 6
    .line 7
    const-string v3, "resource_online"

    .line 8
    .line 9
    const-string v4, "DetectOnlyState"

    .line 10
    .line 11
    invoke-super {p0, p1, p2, p3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->loadStateWith(Ljava/lang/String;Lorg/json/JSONObject;Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig;)V

    .line 12
    .line 13
    .line 14
    :try_start_0
    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iput-boolean p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/DetectOnlyState;->a:Z

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catch_0
    move-exception p1

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    :goto_0
    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/DetectOnlyState;->b:Ljava/lang/String;

    .line 40
    .line 41
    :cond_1
    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_2

    .line 46
    .line 47
    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    iput-boolean p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/DetectOnlyState;->c:Z

    .line 52
    .line 53
    :cond_2
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_3

    .line 58
    .line 59
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    iput p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/DetectOnlyState;->d:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    .line 65
    goto :goto_2

    .line 66
    :goto_1
    const-string p2, "Failed to parse json:"

    .line 67
    .line 68
    invoke-static {v4, p2, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 69
    .line 70
    .line 71
    :cond_3
    :goto_2
    iget-boolean p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/DetectOnlyState;->a:Z

    .line 72
    .line 73
    if-nez p1, :cond_4

    .line 74
    .line 75
    const-string p1, "YTFaceTracker"

    .line 76
    .line 77
    invoke-static {p1}, Lcom/tencent/youtu/sdkkitframework/common/FileUtils;->loadLibrary(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    :cond_4
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iget-object p1, p1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->currentAppContext:Landroid/content/Context;

    .line 89
    .line 90
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    iget-boolean p3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/DetectOnlyState;->a:Z

    .line 99
    .line 100
    if-eqz p3, :cond_5

    .line 101
    .line 102
    iget-object p2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/DetectOnlyState;->b:Ljava/lang/String;

    .line 103
    .line 104
    new-instance p3, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    const-string v0, "Use online path:"

    .line 107
    .line 108
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p3

    .line 118
    invoke-static {v4, p3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    goto :goto_3

    .line 122
    :cond_5
    new-instance p3, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    const-string v0, "Use local path:"

    .line 125
    .line 126
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p3

    .line 136
    invoke-static {v4, p3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    :goto_3
    :try_start_1
    iget-boolean p3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/DetectOnlyState;->a:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 140
    .line 141
    const-string v0, "config.ini"

    .line 142
    .line 143
    if-nez p3, :cond_6

    .line 144
    .line 145
    :try_start_2
    new-instance p2, Lcom/tencent/youtu/liveness/YTFaceTracker;

    .line 146
    .line 147
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    const-string p3, "models/face-tracker-v001"

    .line 152
    .line 153
    invoke-direct {p2, p1, p3, v0}, Lcom/tencent/youtu/liveness/YTFaceTracker;-><init>(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    iput-object p2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/DetectOnlyState;->e:Lcom/tencent/youtu/liveness/YTFaceTracker;

    .line 157
    .line 158
    goto :goto_4

    .line 159
    :catch_1
    move-exception p1

    .line 160
    goto :goto_5

    .line 161
    :cond_6
    new-instance p1, Lcom/tencent/youtu/liveness/YTFaceTracker;

    .line 162
    .line 163
    invoke-direct {p1, p2, v0}, Lcom/tencent/youtu/liveness/YTFaceTracker;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/DetectOnlyState;->e:Lcom/tencent/youtu/liveness/YTFaceTracker;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 167
    .line 168
    :goto_4
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/DetectOnlyState;->e:Lcom/tencent/youtu/liveness/YTFaceTracker;

    .line 169
    .line 170
    invoke-virtual {p1}, Lcom/tencent/youtu/liveness/YTFaceTracker;->getParam()Lcom/tencent/youtu/liveness/YTFaceTracker$Param;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    new-instance p2, Ljava/lang/StringBuilder;

    .line 175
    .line 176
    const-string p3, "big face mode"

    .line 177
    .line 178
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    iget-boolean p3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/DetectOnlyState;->c:Z

    .line 182
    .line 183
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object p2

    .line 190
    invoke-static {v4, p2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    iget-boolean p2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/DetectOnlyState;->c:Z

    .line 194
    .line 195
    iput p2, p1, Lcom/tencent/youtu/liveness/YTFaceTracker$Param;->biggerFaceMode:I

    .line 196
    .line 197
    iget p2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/DetectOnlyState;->d:I

    .line 198
    .line 199
    iput p2, p1, Lcom/tencent/youtu/liveness/YTFaceTracker$Param;->minFaceSize:I

    .line 200
    .line 201
    const/4 p2, -0x1

    .line 202
    iput p2, p1, Lcom/tencent/youtu/liveness/YTFaceTracker$Param;->detInterval:I

    .line 203
    .line 204
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/DetectOnlyState;->e:Lcom/tencent/youtu/liveness/YTFaceTracker;

    .line 205
    .line 206
    invoke-virtual {p0, p1}, Lcom/tencent/youtu/liveness/YTFaceTracker;->setParam(Lcom/tencent/youtu/liveness/YTFaceTracker$Param;)V

    .line 207
    .line 208
    .line 209
    new-instance p0, Ljava/lang/StringBuilder;

    .line 210
    .line 211
    const-string p1, "Detect version:"

    .line 212
    .line 213
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    invoke-static {}, Lcom/tencent/youtu/liveness/YTFaceTracker;->getVersion()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object p0

    .line 227
    invoke-static {v4, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    return-void

    .line 231
    :goto_5
    const-string p2, "init YTFaceTracker error"

    .line 232
    .line 233
    invoke-static {v4, p2, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 234
    .line 235
    .line 236
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 237
    .line 238
    .line 239
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    const/4 p2, 0x1

    .line 244
    const-string p3, "failed to init face trace sdk"

    .line 245
    .line 246
    invoke-virtual {p1, p2, p3}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->reportError(ILjava/lang/String;)V

    .line 247
    .line 248
    .line 249
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 250
    .line 251
    .line 252
    move-result-object p1

    .line 253
    new-instance p2, Lcom/tencent/youtu/sdkkitframework/liveness/DetectOnlyState$a;

    .line 254
    .line 255
    invoke-direct {p2, p0}, Lcom/tencent/youtu/sdkkitframework/liveness/DetectOnlyState$a;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/DetectOnlyState;)V

    .line 256
    .line 257
    .line 258
    invoke-virtual {p1, p2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 259
    .line 260
    .line 261
    return-void
.end method

.method public update(Lcom/tencent/youtu/sdkkitframework/common/YTImageData;J)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->update(Lcom/tencent/youtu/sdkkitframework/common/YTImageData;J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
