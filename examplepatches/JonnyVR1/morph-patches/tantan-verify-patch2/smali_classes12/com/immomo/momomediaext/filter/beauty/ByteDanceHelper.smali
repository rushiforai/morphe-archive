.class public Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IBeautyErrorListener;,
        Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IFaceDetectCompleteListener;
    }
.end annotation


# static fields
.field private static closeCheckResource:Z = false

.field private static licensePath:Ljava/lang/String; = ""

.field private static modelPath:Ljava/lang/String; = ""

.field private static openFaceDetectInterval:Z = false

.field private static removeMakeupFloat:Z = false

.field private static resourceRootPath:Ljava/lang/String; = ""

.field private static usePipeline:Z


# instance fields
.field private checkLicenseSuccess:Z

.field private composerNodes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private composerNodesIntensity:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/immomo/momomediaext/filter/beauty/ByteDanceNode;",
            ">;"
        }
    .end annotation
.end field

.field private context:Landroid/content/Context;

.field private errorCode:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private errorListener:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IBeautyErrorListener;

.field private faceFeatureHelper:Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;

.field private glFrameBuffer:Lcom/immomo/momomediaext/filter/beauty/FrameBufferCreator;

.field private isForbidBeauty:Z

.field private isInit:Z

.field private isResourceComplete:Z

.field private listener:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IFaceDetectCompleteListener;

.field private mmcvInfo:Ll/omw;

.field private renderManager:Lcom/effectsar/labcv/effectsdk/RenderManager;

.field private textureHeight:I

.field private textureWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IBeautyErrorListener;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->checkLicenseSuccess:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->isInit:Z

    .line 8
    .line 9
    new-instance v1, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodes:Ljava/util/List;

    .line 15
    .line 16
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    .line 17
    .line 18
    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodesIntensity:Ljava/util/Map;

    .line 22
    .line 23
    iput-boolean v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->isResourceComplete:Z

    .line 24
    .line 25
    new-instance v1, Ljava/util/HashMap;

    .line 26
    .line 27
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->errorCode:Ljava/util/HashMap;

    .line 31
    .line 32
    iput-boolean v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->isForbidBeauty:Z

    .line 33
    .line 34
    iput-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->context:Landroid/content/Context;

    .line 35
    .line 36
    iput-object p2, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->errorListener:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IBeautyErrorListener;

    .line 37
    .line 38
    new-instance p1, Lcom/effectsar/labcv/effectsdk/RenderManager;

    .line 39
    .line 40
    invoke-direct {p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->renderManager:Lcom/effectsar/labcv/effectsdk/RenderManager;

    .line 44
    .line 45
    new-instance p1, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;

    .line 46
    .line 47
    invoke-direct {p1}, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->faceFeatureHelper:Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;

    .line 51
    .line 52
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->initErrorCode()V

    .line 53
    .line 54
    .line 55
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->checkLicense()Z

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method private canUse()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->checkLicenseSuccess:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->checkLicense()Z

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-boolean v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->isResourceComplete:Z

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->checkResource()Z

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-boolean v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->checkLicenseSuccess:Z

    .line 16
    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    iget-boolean p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->isResourceComplete:Z

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_2
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method private declared-synchronized checkLicense()Z
    .locals 13

    .line 1
    const-string v0, "byte dance beauty modelPath === "

    .line 2
    .line 3
    const-string v1, "byte dance beauty init modelPath === "

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    iget-boolean v2, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->checkLicenseSuccess:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    const/4 v3, 0x1

    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    monitor-exit p0

    .line 12
    return v3

    .line 13
    :cond_0
    :try_start_1
    sget-object v2, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->modelPath:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/4 v4, 0x0

    .line 20
    if-nez v2, :cond_7

    .line 21
    .line 22
    sget-object v2, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->licensePath:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_1

    .line 29
    .line 30
    goto/16 :goto_4

    .line 31
    .line 32
    :cond_1
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->renderManager:Lcom/effectsar/labcv/effectsdk/RenderManager;

    .line 33
    .line 34
    if-nez v0, :cond_2

    .line 35
    .line 36
    new-instance v0, Lcom/effectsar/labcv/effectsdk/RenderManager;

    .line 37
    .line 38
    invoke-direct {v0}, Lcom/effectsar/labcv/effectsdk/RenderManager;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->renderManager:Lcom/effectsar/labcv/effectsdk/RenderManager;

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception v0

    .line 45
    goto/16 :goto_5

    .line 46
    .line 47
    :cond_2
    :goto_0
    iget-boolean v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->isInit:Z

    .line 48
    .line 49
    if-nez v0, :cond_6

    .line 50
    .line 51
    iput-boolean v3, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->isInit:Z

    .line 52
    .line 53
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->renderManager:Lcom/effectsar/labcv/effectsdk/RenderManager;

    .line 54
    .line 55
    iget-object v2, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->context:Landroid/content/Context;

    .line 56
    .line 57
    sget-object v5, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->modelPath:Ljava/lang/String;

    .line 58
    .line 59
    sget-object v6, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->licensePath:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v0, v2, v5, v6}, Lcom/effectsar/labcv/effectsdk/RenderManager;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result v10

    .line 65
    if-nez v10, :cond_3

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_3
    move v3, v4

    .line 69
    :goto_1
    iput-boolean v3, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->checkLicenseSuccess:Z

    .line 70
    .line 71
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    const-string v2, "ByteDanceHelper"

    .line 76
    .line 77
    new-instance v3, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    sget-object v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->modelPath:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v1, " licensePath === "

    .line 88
    .line 89
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    sget-object v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->licensePath:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    const-string v1, " code === "

    .line 98
    .line 99
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->renderManager:Lcom/effectsar/labcv/effectsdk/RenderManager;

    .line 117
    .line 118
    sget-boolean v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->usePipeline:Z

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->setPipeline(Z)Z

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->renderManager:Lcom/effectsar/labcv/effectsdk/RenderManager;

    .line 124
    .line 125
    invoke-virtual {v0, v4}, Lcom/effectsar/labcv/effectsdk/RenderManager;->set3Buffer(Z)Z

    .line 126
    .line 127
    .line 128
    sget-boolean v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->openFaceDetectInterval:Z

    .line 129
    .line 130
    if-eqz v0, :cond_4

    .line 131
    .line 132
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->renderManager:Lcom/effectsar/labcv/effectsdk/RenderManager;

    .line 133
    .line 134
    const/4 v1, 0x3

    .line 135
    invoke-virtual {v0, v1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->SetFaceDetectInterval(I)I

    .line 136
    .line 137
    .line 138
    :cond_4
    iget-boolean v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->checkLicenseSuccess:Z

    .line 139
    .line 140
    if-nez v0, :cond_6

    .line 141
    .line 142
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->errorListener:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IBeautyErrorListener;

    .line 143
    .line 144
    if-eqz v0, :cond_6

    .line 145
    .line 146
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->errorCode:Ljava/util/HashMap;

    .line 147
    .line 148
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    if-eqz v0, :cond_5

    .line 157
    .line 158
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->errorCode:Ljava/util/HashMap;

    .line 159
    .line 160
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    check-cast v0, Ljava/lang/String;

    .line 169
    .line 170
    :goto_2
    move-object v11, v0

    .line 171
    goto :goto_3

    .line 172
    :cond_5
    const-string v0, ""

    .line 173
    .line 174
    goto :goto_2

    .line 175
    :goto_3
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->errorListener:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IBeautyErrorListener;

    .line 176
    .line 177
    invoke-interface {v0, v10, v11}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IBeautyErrorListener;->onBeautyError(ILjava/lang/String;)V

    .line 178
    .line 179
    .line 180
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 181
    .line 182
    .line 183
    move-result-object v7

    .line 184
    const-string v8, "beauty"

    .line 185
    .line 186
    const-string v9, "bytedance_beauty"

    .line 187
    .line 188
    sget-object v0, Lcom/immomo/medialog/LogLevel;->FATAL:Lcom/immomo/medialog/LogLevel;

    .line 189
    .line 190
    invoke-virtual {v0}, Lcom/immomo/medialog/LogLevel;->value()I

    .line 191
    .line 192
    .line 193
    move-result v12

    .line 194
    invoke-virtual/range {v7 .. v12}, Ll/b7y;->e(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 195
    .line 196
    .line 197
    :cond_6
    iget-boolean v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->checkLicenseSuccess:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 198
    .line 199
    monitor-exit p0

    .line 200
    return v0

    .line 201
    :cond_7
    :goto_4
    :try_start_2
    iget-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->errorListener:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IBeautyErrorListener;

    .line 202
    .line 203
    if-eqz v1, :cond_8

    .line 204
    .line 205
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    const-string v2, "ByteDanceHelper"

    .line 210
    .line 211
    new-instance v3, Ljava/lang/StringBuilder;

    .line 212
    .line 213
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->modelPath:Ljava/lang/String;

    .line 217
    .line 218
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    const-string v0, " licensePath === "

    .line 222
    .line 223
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->licensePath:Ljava/lang/String;

    .line 227
    .line 228
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    filled-new-array {v2, v0}, [Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    invoke-virtual {v1, v0}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 240
    .line 241
    .line 242
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->errorListener:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IBeautyErrorListener;

    .line 243
    .line 244
    iget-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->errorCode:Ljava/util/HashMap;

    .line 245
    .line 246
    const/16 v2, -0x12c

    .line 247
    .line 248
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 249
    .line 250
    .line 251
    move-result-object v3

    .line 252
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    move-result-object v1

    .line 256
    check-cast v1, Ljava/lang/String;

    .line 257
    .line 258
    invoke-interface {v0, v2, v1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IBeautyErrorListener;->onBeautyError(ILjava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 259
    .line 260
    .line 261
    :cond_8
    monitor-exit p0

    .line 262
    return v4

    .line 263
    :goto_5
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 264
    throw v0
.end method

.method private declared-synchronized checkResource()Z
    .locals 8

    .line 1
    const-string v0, "byte dance beauty isResourceComplete === "

    .line 2
    .line 3
    const-string v1, "byte dance beauty beautyPath === "

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    iget-boolean v2, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->isResourceComplete:Z

    .line 7
    .line 8
    if-nez v2, :cond_4

    .line 9
    .line 10
    sget-boolean v2, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->closeCheckResource:Z

    .line 11
    .line 12
    const/4 v3, 0x1

    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    iput-boolean v3, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->isResourceComplete:Z

    .line 16
    .line 17
    goto/16 :goto_1

    .line 18
    .line 19
    :catchall_0
    move-exception v0

    .line 20
    goto/16 :goto_2

    .line 21
    .line 22
    :cond_0
    invoke-static {}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->availableBeautyPath()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-static {}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->availableReshapePath()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    const-string v6, "ByteDanceHelper"

    .line 35
    .line 36
    new-instance v7, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {v7, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v1, " reshapePath === "

    .line 45
    .line 46
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    filled-new-array {v6, v1}, [Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v5, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-nez v1, :cond_4

    .line 68
    .line 69
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-nez v1, :cond_4

    .line 74
    .line 75
    iget-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodes:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-nez v1, :cond_1

    .line 82
    .line 83
    iget-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodes:Ljava/util/List;

    .line 84
    .line 85
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    :cond_1
    iget-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodes:Ljava/util/List;

    .line 89
    .line 90
    invoke-interface {v1, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    if-nez v1, :cond_2

    .line 95
    .line 96
    iget-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodes:Ljava/util/List;

    .line 97
    .line 98
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    :cond_2
    iget-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->renderManager:Lcom/effectsar/labcv/effectsdk/RenderManager;

    .line 102
    .line 103
    if-eqz v1, :cond_4

    .line 104
    .line 105
    iget-object v2, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodes:Ljava/util/List;

    .line 106
    .line 107
    const/4 v4, 0x0

    .line 108
    new-array v5, v4, [Ljava/lang/String;

    .line 109
    .line 110
    invoke-interface {v2, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    check-cast v2, [Ljava/lang/String;

    .line 115
    .line 116
    invoke-virtual {v1, v2}, Lcom/effectsar/labcv/effectsdk/RenderManager;->setComposerNodes([Ljava/lang/String;)I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    const-string v5, "ByteDanceHelper"

    .line 125
    .line 126
    new-instance v6, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    iget-boolean v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->isResourceComplete:Z

    .line 132
    .line 133
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    const-string v0, " ret === "

    .line 137
    .line 138
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    filled-new-array {v5, v0}, [Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {v2, v0}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 153
    .line 154
    .line 155
    if-nez v1, :cond_3

    .line 156
    .line 157
    goto :goto_0

    .line 158
    :cond_3
    move v3, v4

    .line 159
    :goto_0
    iput-boolean v3, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->isResourceComplete:Z

    .line 160
    .line 161
    :cond_4
    :goto_1
    iget-boolean v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->isResourceComplete:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 162
    .line 163
    monitor-exit p0

    .line 164
    return v0

    .line 165
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 166
    throw v0
.end method

.method public static closeCheckResource(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->closeCheckResource:Z

    .line 2
    .line 3
    return-void
.end method

.method private forbidComposerNodes()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->availableBeautyPath()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceConfig;->availableReshapePath()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->renderManager:Lcom/effectsar/labcv/effectsdk/RenderManager;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    new-array v1, v1, [Ljava/lang/String;

    .line 24
    .line 25
    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, [Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lcom/effectsar/labcv/effectsdk/RenderManager;->setComposerNodes([Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private forbidComposerNodesIntensity()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodesIntensity:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

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
    check-cast v1, Ljava/util/Map$Entry;

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Lcom/immomo/momomediaext/filter/beauty/ByteDanceNode;

    .line 28
    .line 29
    iget-object v2, v2, Lcom/immomo/momomediaext/filter/beauty/ByteDanceNode;->path:Ljava/lang/String;

    .line 30
    .line 31
    invoke-direct {p0, v2}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->isComposerNodesContainsPath(Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceNode;

    .line 42
    .line 43
    new-instance v2, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    sget-object v3, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->resourceRootPath:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object v3, v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceNode;->path:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    iget-object v3, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->renderManager:Lcom/effectsar/labcv/effectsdk/RenderManager;

    .line 68
    .line 69
    iget-object v1, v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceNode;->key:Ljava/lang/String;

    .line 70
    .line 71
    const/4 v4, 0x0

    .line 72
    invoke-virtual {v3, v2, v1, v4}, Lcom/effectsar/labcv/effectsdk/RenderManager;->updateComposerNodes(Ljava/lang/String;Ljava/lang/String;F)I

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_1
    return-void
.end method

.method private initErrorCode()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->errorCode:Ljava/util/HashMap;

    .line 2
    .line 3
    const/16 v1, -0x72

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "\u65e0\u6548\u7684license\uff0c\u8bf7\u68c0\u67e5\u6388\u6743\u6587\u4ef6\u8def\u5f84\u662f\u5426\u6b63\u786e\uff0c\u6a21\u578b\u6587\u4ef6\u662f\u5426\u53d7\u635f"

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->errorCode:Ljava/util/HashMap;

    .line 15
    .line 16
    const/16 v1, -0x74

    .line 17
    .line 18
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "\u975e\u6cd5\u6388\u6743\u6587\u4ef6\uff0c\u8bf7\u68c0\u67e5\u6388\u6743\u6587\u4ef6\u662f\u5426\u6b63\u786e"

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->errorCode:Ljava/util/HashMap;

    .line 28
    .line 29
    const/16 v1, -0x75

    .line 30
    .line 31
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v2, "\u6388\u6743\u6587\u4ef6\u8fc7\u671f\uff0c\u8bf7\u68c0\u67e5\u6388\u6743\u6587\u4ef6\u662f\u5426\u6b63\u786e\uff0c\u662f\u5426\u9700\u8981\u66f4\u65b0"

    .line 36
    .line 37
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->errorCode:Ljava/util/HashMap;

    .line 41
    .line 42
    const/16 v1, -0x77

    .line 43
    .line 44
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    const-string v2, "Application/BundleID\u4e0d\u5339\u914d\uff0c\u8bf7\u68c0\u67e5\u7533\u8bf7\u6388\u6743\u6587\u4ef6\u548c\u5e94\u7528\u7684Application/BundleId\u662f\u5426\u4e00\u81f4"

    .line 49
    .line 50
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->errorCode:Ljava/util/HashMap;

    .line 54
    .line 55
    const/16 v1, -0x78

    .line 56
    .line 57
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    const-string v2, "\u6388\u6743\u5305\u8def\u5f84\u4e3a\u7a7a\uff0c\u8bf7\u68c0\u67e5\u6388\u6743\u6587\u4ef6\u8def\u5f84\u662f\u5426\u6b63\u786e"

    .line 62
    .line 63
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->errorCode:Ljava/util/HashMap;

    .line 67
    .line 68
    const/16 v1, -0x79

    .line 69
    .line 70
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    const-string v2, "\u9519\u8bef\u7684\u6388\u6743\u5305\u8def\u5f84\uff0c\u8bf7\u68c0\u67e5\u4f20\u5165sdk\u7684\u8def\u5f84\u662f\u5426\u6b63\u786e"

    .line 75
    .line 76
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->errorCode:Ljava/util/HashMap;

    .line 80
    .line 81
    const/16 v1, -0x7a

    .line 82
    .line 83
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    const-string v2, "\u6388\u6743\u5305\u7c7b\u578b\u4e0d\u5339\u914d\uff0c\u8bf7\u68c0\u67e5\u6388\u6743\u6587\u4ef6\u662f\u5426\u6b63\u786e\uff0c\u662f\u5426\u635f\u574f"

    .line 88
    .line 89
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->errorCode:Ljava/util/HashMap;

    .line 93
    .line 94
    const/16 v1, -0x7b

    .line 95
    .line 96
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    const-string v2, "\u65e0\u6548\u7684\u7248\u672c\uff0c\u8bf7\u68c0\u67e5\u662f\u5426\u7528\u4e86\u65e7\u7248\u672c\u7684\u6388\u6743\u6587\u4ef6"

    .line 101
    .line 102
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->errorCode:Ljava/util/HashMap;

    .line 106
    .line 107
    const/16 v1, -0x7c

    .line 108
    .line 109
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    const-string v2, "\u65e0\u6548\u7684\u6570\u636e\u5757\uff0c\u8bf7\u68c0\u67e5\u6388\u6743\u6587\u4ef6\u662f\u5426\u6b63\u786e\uff0c\u662f\u5426\u635f\u574f"

    .line 114
    .line 115
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->errorCode:Ljava/util/HashMap;

    .line 119
    .line 120
    const/16 v1, -0x7d

    .line 121
    .line 122
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    const-string v2, "\u65e0\u6548\u7684\u6570\u636e\u5757\u957f\u5ea6\uff0c\u8bf7\u68c0\u67e5\u6388\u6743\u6587\u4ef6\u662f\u5426\u6b63\u786e\uff0c\u662f\u5426\u635f\u574f"

    .line 127
    .line 128
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->errorCode:Ljava/util/HashMap;

    .line 132
    .line 133
    const/16 v1, -0x7e

    .line 134
    .line 135
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    const-string v2, "\u6570\u636e\u5757\u4e0d\u5b8c\u6574\uff0c\u8bf7\u68c0\u67e5\u6388\u6743\u6587\u4ef6\u662f\u5426\u6b63\u786e\uff0c\u662f\u5426\u635f\u574f"

    .line 140
    .line 141
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->errorCode:Ljava/util/HashMap;

    .line 145
    .line 146
    const/16 v1, -0x7f

    .line 147
    .line 148
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    const-string v2, "\u672a\u6388\u6743\u7684\u529f\u80fd\uff0c\u8bf7\u68c0\u67e5\u662f\u5426\u8d2d\u4e70\u5bf9\u5e94\u529f\u80fd"

    .line 153
    .line 154
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->errorCode:Ljava/util/HashMap;

    .line 158
    .line 159
    const/16 v0, -0x12c

    .line 160
    .line 161
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    const-string v1, "\u6388\u6743\u6587\u4ef6\u8def\u5f84\u6216\u8005\u6a21\u578b\u8def\u5f84\u4e3a\u7a7a"

    .line 166
    .line 167
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    return-void
.end method

.method private isComposerNodesContainsPath(Ljava/lang/String;)Z
    .locals 4

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

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
    return v1

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodes:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    move v2, v1

    .line 16
    :goto_0
    if-ge v2, v0, :cond_3

    .line 17
    .line 18
    iget-object v3, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodes:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    check-cast v3, Ljava/lang/CharSequence;

    .line 25
    .line 26
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-eqz v3, :cond_1

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    iget-object v3, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodes:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    check-cast v3, Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v3, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-eqz v3, :cond_2

    .line 46
    .line 47
    const/4 p0, 0x1

    .line 48
    return p0

    .line 49
    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_3
    return v1
.end method

.method public static openFaceDetectInterval(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->openFaceDetectInterval:Z

    .line 2
    .line 3
    return-void
.end method

.method public static removeMakeupFloat(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->removeMakeupFloat:Z

    .line 2
    .line 3
    return-void
.end method

.method private restoreComposerNodes()V
    .locals 6

    .line 1
    sget-boolean v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->removeMakeupFloat:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodes:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    new-array v2, v0, [Ljava/lang/String;

    .line 13
    .line 14
    move v3, v1

    .line 15
    :goto_0
    if-ge v3, v0, :cond_1

    .line 16
    .line 17
    iget-object v4, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodes:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    check-cast v4, Ljava/lang/CharSequence;

    .line 24
    .line 25
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    if-nez v4, :cond_0

    .line 30
    .line 31
    iget-object v4, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodes:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    check-cast v4, Ljava/lang/String;

    .line 38
    .line 39
    const-string v5, "MakeupStyle"

    .line 40
    .line 41
    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-eqz v4, :cond_0

    .line 46
    .line 47
    const-string v4, "{\"effectsdk_config\":\"{\\\"minV\\\":\\\"6.9.0\\\",\\\"FaceMakeupV2AMG\\\":true}\"}"

    .line 48
    .line 49
    aput-object v4, v2, v3

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_0
    const-string v4, "{\"effectsdk_config\":\"{\\\"minV\\\":\\\"6.9.0\\\",\\\"FaceMakeupV2AMG\\\":false}\"}"

    .line 53
    .line 54
    aput-object v4, v2, v3

    .line 55
    .line 56
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->renderManager:Lcom/effectsar/labcv/effectsdk/RenderManager;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodes:Ljava/util/List;

    .line 62
    .line 63
    new-array v1, v1, [Ljava/lang/String;

    .line 64
    .line 65
    invoke-interface {p0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    check-cast p0, [Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v0, p0, v2}, Lcom/effectsar/labcv/effectsdk/RenderManager;->setComposerNodesWithTags([Ljava/lang/String;[Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_2
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->renderManager:Lcom/effectsar/labcv/effectsdk/RenderManager;

    .line 76
    .line 77
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodes:Ljava/util/List;

    .line 78
    .line 79
    new-array v1, v1, [Ljava/lang/String;

    .line 80
    .line 81
    invoke-interface {p0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    check-cast p0, [Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {v0, p0}, Lcom/effectsar/labcv/effectsdk/RenderManager;->setComposerNodes([Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method private restoreComposerNodesIntensity()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodesIntensity:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

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
    check-cast v1, Ljava/util/Map$Entry;

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Lcom/immomo/momomediaext/filter/beauty/ByteDanceNode;

    .line 28
    .line 29
    iget-object v2, v2, Lcom/immomo/momomediaext/filter/beauty/ByteDanceNode;->path:Ljava/lang/String;

    .line 30
    .line 31
    invoke-direct {p0, v2}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->isComposerNodesContainsPath(Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceNode;

    .line 42
    .line 43
    new-instance v2, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    sget-object v3, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->resourceRootPath:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object v3, v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceNode;->path:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    iget-object v3, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->renderManager:Lcom/effectsar/labcv/effectsdk/RenderManager;

    .line 68
    .line 69
    iget-object v4, v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceNode;->key:Ljava/lang/String;

    .line 70
    .line 71
    iget v1, v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceNode;->value:F

    .line 72
    .line 73
    invoke-virtual {v3, v2, v4, v1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->updateComposerNodes(Ljava/lang/String;Ljava/lang/String;F)I

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_1
    return-void
.end method

.method public static setLicensePath(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->licensePath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static setModelPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->modelPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static setResourceRootPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->resourceRootPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static usePipeline(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->usePipeline:Z

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public forbidBeauty(Z)Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->canUse()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->renderManager:Lcom/effectsar/labcv/effectsdk/RenderManager;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->forbidComposerNodes()V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->forbidComposerNodesIntensity()V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->restoreComposerNodes()V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->restoreComposerNodesIntensity()V

    .line 24
    .line 25
    .line 26
    :goto_0
    iput-boolean p1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->isForbidBeauty:Z

    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :cond_1
    const/4 p0, 0x0

    .line 31
    return p0
.end method

.method public getResourceRootPath()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->resourceRootPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isEnable()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->checkLicense()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->checkResource()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public processFaceFeature(Ll/omw;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->mmcvInfo:Ll/omw;

    .line 2
    .line 3
    iput p2, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->textureWidth:I

    .line 4
    .line 5
    iput p3, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->textureHeight:I

    .line 6
    .line 7
    return-void
.end method

.method public processTexture(IIILcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;J)I
    .locals 10

    .line 1
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->checkLicense()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->listener:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IFaceDetectCompleteListener;

    .line 8
    .line 9
    if-eqz p2, :cond_8

    .line 10
    .line 11
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->mmcvInfo:Ll/omw;

    .line 12
    .line 13
    invoke-interface {p2, p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IFaceDetectCompleteListener;->onFaceDetectComplete(Ll/omw;)V

    .line 14
    .line 15
    .line 16
    return p1

    .line 17
    :cond_0
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->checkResource()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object p2, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->listener:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IFaceDetectCompleteListener;

    .line 24
    .line 25
    if-eqz p2, :cond_8

    .line 26
    .line 27
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->mmcvInfo:Ll/omw;

    .line 28
    .line 29
    invoke-interface {p2, p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IFaceDetectCompleteListener;->onFaceDetectComplete(Ll/omw;)V

    .line 30
    .line 31
    .line 32
    return p1

    .line 33
    :cond_1
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->glFrameBuffer:Lcom/immomo/momomediaext/filter/beauty/FrameBufferCreator;

    .line 34
    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    new-instance v0, Lcom/immomo/momomediaext/filter/beauty/FrameBufferCreator;

    .line 38
    .line 39
    invoke-direct {v0, p2, p3}, Lcom/immomo/momomediaext/filter/beauty/FrameBufferCreator;-><init>(II)V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->glFrameBuffer:Lcom/immomo/momomediaext/filter/beauty/FrameBufferCreator;

    .line 43
    .line 44
    :cond_2
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->glFrameBuffer:Lcom/immomo/momomediaext/filter/beauty/FrameBufferCreator;

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/FrameBufferCreator;->getBufferWidth()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-ne v0, p2, :cond_3

    .line 51
    .line 52
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->glFrameBuffer:Lcom/immomo/momomediaext/filter/beauty/FrameBufferCreator;

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/FrameBufferCreator;->getBufferHigh()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eq v0, p3, :cond_4

    .line 59
    .line 60
    :cond_3
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->glFrameBuffer:Lcom/immomo/momomediaext/filter/beauty/FrameBufferCreator;

    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/FrameBufferCreator;->destoryBuffer()V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->glFrameBuffer:Lcom/immomo/momomediaext/filter/beauty/FrameBufferCreator;

    .line 66
    .line 67
    invoke-virtual {v0, p2, p3}, Lcom/immomo/momomediaext/filter/beauty/FrameBufferCreator;->activityDepthFrameBuffer(II)V

    .line 68
    .line 69
    .line 70
    :cond_4
    iget-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->renderManager:Lcom/effectsar/labcv/effectsdk/RenderManager;

    .line 71
    .line 72
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->glFrameBuffer:Lcom/immomo/momomediaext/filter/beauty/FrameBufferCreator;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/FrameBufferCreator;->getTexture_out()[I

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    const/4 v9, 0x0

    .line 79
    aget v3, v0, v9

    .line 80
    .line 81
    move v2, p1

    .line 82
    move v4, p2

    .line 83
    move v5, p3

    .line 84
    move-object v6, p4

    .line 85
    move-wide v7, p5

    .line 86
    invoke-virtual/range {v1 .. v8}, Lcom/effectsar/labcv/effectsdk/RenderManager;->processTexture(IIIILcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;J)Z

    .line 87
    .line 88
    .line 89
    move-result p2

    .line 90
    if-eqz p2, :cond_7

    .line 91
    .line 92
    iget-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->renderManager:Lcom/effectsar/labcv/effectsdk/RenderManager;

    .line 93
    .line 94
    invoke-virtual {p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->getFaceDetectResult()Lcom/effectsar/labcv/effectsdk/BefFaceInfo;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    iget-object p2, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->faceFeatureHelper:Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;

    .line 99
    .line 100
    if-eqz p2, :cond_5

    .line 101
    .line 102
    if-eqz p1, :cond_5

    .line 103
    .line 104
    iget-object p3, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->mmcvInfo:Ll/omw;

    .line 105
    .line 106
    iget p4, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->textureWidth:I

    .line 107
    .line 108
    iget v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->textureHeight:I

    .line 109
    .line 110
    invoke-virtual {p2, p1, p3, p4, v0}, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->transformFaceFeature(Lcom/effectsar/labcv/effectsdk/BefFaceInfo;Ll/omw;II)V

    .line 111
    .line 112
    .line 113
    :cond_5
    iget-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->listener:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IFaceDetectCompleteListener;

    .line 114
    .line 115
    if-eqz p1, :cond_6

    .line 116
    .line 117
    iget-object p2, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->mmcvInfo:Ll/omw;

    .line 118
    .line 119
    invoke-interface {p1, p2}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IFaceDetectCompleteListener;->onFaceDetectComplete(Ll/omw;)V

    .line 120
    .line 121
    .line 122
    :cond_6
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->glFrameBuffer:Lcom/immomo/momomediaext/filter/beauty/FrameBufferCreator;

    .line 123
    .line 124
    invoke-virtual {p0}, Lcom/immomo/momomediaext/filter/beauty/FrameBufferCreator;->getTexture_out()[I

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    aget p0, p0, v9

    .line 129
    .line 130
    return p0

    .line 131
    :cond_7
    iget-object p2, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->listener:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IFaceDetectCompleteListener;

    .line 132
    .line 133
    if-eqz p2, :cond_8

    .line 134
    .line 135
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->mmcvInfo:Ll/omw;

    .line 136
    .line 137
    invoke-interface {p2, p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IFaceDetectCompleteListener;->onFaceDetectComplete(Ll/omw;)V

    .line 138
    .line 139
    .line 140
    :cond_8
    return p1
.end method

.method public release()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->renderManager:Lcom/effectsar/labcv/effectsdk/RenderManager;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/effectsar/labcv/effectsdk/RenderManager;->release()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->renderManager:Lcom/effectsar/labcv/effectsdk/RenderManager;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodes:Ljava/util/List;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 16
    .line 17
    .line 18
    :cond_1
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->glFrameBuffer:Lcom/immomo/momomediaext/filter/beauty/FrameBufferCreator;

    .line 19
    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/FrameBufferCreator;->destoryBuffer()V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->glFrameBuffer:Lcom/immomo/momomediaext/filter/beauty/FrameBufferCreator;

    .line 26
    .line 27
    :cond_2
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodesIntensity:Ljava/util/Map;

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    iput-boolean v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->checkLicenseSuccess:Z

    .line 34
    .line 35
    iput-boolean v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->isInit:Z

    .line 36
    .line 37
    iput-boolean v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->isResourceComplete:Z

    .line 38
    .line 39
    return-void
.end method

.method public setCameraPosition(Z)Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->canUse()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->renderManager:Lcom/effectsar/labcv/effectsdk/RenderManager;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->setCameraPostion(Z)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public setOnDetectCompleteListener(Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IFaceDetectCompleteListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->listener:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IFaceDetectCompleteListener;

    .line 2
    .line 3
    return-void
.end method

.method public updateComposerNodes(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->resourceRootPath:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

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
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodes:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    new-instance p1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 37
    .line 38
    .line 39
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->resourceRootPath:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iget-object p2, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodes:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {p2, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    if-nez p2, :cond_0

    .line 61
    .line 62
    iget-object p2, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodes:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    :cond_0
    iget-boolean p1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->isForbidBeauty:Z

    .line 68
    .line 69
    const/4 p2, 0x1

    .line 70
    if-eqz p1, :cond_1

    .line 71
    .line 72
    return p2

    .line 73
    :cond_1
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->canUse()Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    const/4 v0, 0x0

    .line 78
    if-eqz p1, :cond_6

    .line 79
    .line 80
    iget-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->renderManager:Lcom/effectsar/labcv/effectsdk/RenderManager;

    .line 81
    .line 82
    if-eqz p1, :cond_6

    .line 83
    .line 84
    sget-boolean v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->removeMakeupFloat:Z

    .line 85
    .line 86
    iget-object v2, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodes:Ljava/util/List;

    .line 87
    .line 88
    if-eqz v1, :cond_5

    .line 89
    .line 90
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    new-array v1, p1, [Ljava/lang/String;

    .line 95
    .line 96
    move v2, v0

    .line 97
    :goto_0
    if-ge v2, p1, :cond_3

    .line 98
    .line 99
    iget-object v3, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodes:Ljava/util/List;

    .line 100
    .line 101
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    check-cast v3, Ljava/lang/CharSequence;

    .line 106
    .line 107
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    if-nez v3, :cond_2

    .line 112
    .line 113
    iget-object v3, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodes:Ljava/util/List;

    .line 114
    .line 115
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    check-cast v3, Ljava/lang/String;

    .line 120
    .line 121
    const-string v4, "MakeupStyle"

    .line 122
    .line 123
    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    if-eqz v3, :cond_2

    .line 128
    .line 129
    const-string v3, "{\"effectsdk_config\":\"{\\\"minV\\\":\\\"6.9.0\\\",\\\"FaceMakeupV2AMG\\\":true}\"}"

    .line 130
    .line 131
    aput-object v3, v1, v2

    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_2
    const-string v3, "{\"effectsdk_config\":\"{\\\"minV\\\":\\\"6.9.0\\\",\\\"FaceMakeupV2AMG\\\":false}\"}"

    .line 135
    .line 136
    aput-object v3, v1, v2

    .line 137
    .line 138
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 139
    .line 140
    goto :goto_0

    .line 141
    :cond_3
    iget-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->renderManager:Lcom/effectsar/labcv/effectsdk/RenderManager;

    .line 142
    .line 143
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodes:Ljava/util/List;

    .line 144
    .line 145
    new-array v2, v0, [Ljava/lang/String;

    .line 146
    .line 147
    invoke-interface {p0, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    check-cast p0, [Ljava/lang/String;

    .line 152
    .line 153
    invoke-virtual {p1, p0, v1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->setComposerNodesWithTags([Ljava/lang/String;[Ljava/lang/String;)I

    .line 154
    .line 155
    .line 156
    move-result p0

    .line 157
    if-nez p0, :cond_4

    .line 158
    .line 159
    return p2

    .line 160
    :cond_4
    return v0

    .line 161
    :cond_5
    new-array p0, v0, [Ljava/lang/String;

    .line 162
    .line 163
    invoke-interface {v2, p0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    check-cast p0, [Ljava/lang/String;

    .line 168
    .line 169
    invoke-virtual {p1, p0}, Lcom/effectsar/labcv/effectsdk/RenderManager;->setComposerNodes([Ljava/lang/String;)I

    .line 170
    .line 171
    .line 172
    move-result p0

    .line 173
    if-nez p0, :cond_6

    .line 174
    .line 175
    return p2

    .line 176
    :cond_6
    return v0
.end method

.method public updateComposerNodesIntensity(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->canUse()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->renderManager:Lcom/effectsar/labcv/effectsdk/RenderManager;

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodesIntensity:Ljava/util/Map;

    .line 13
    .line 14
    invoke-interface {v0, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v2, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->composerNodesIntensity:Ljava/util/Map;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-interface {v2, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceNode;

    .line 27
    .line 28
    iput-object p1, v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceNode;->path:Ljava/lang/String;

    .line 29
    .line 30
    iput-object p2, v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceNode;->key:Ljava/lang/String;

    .line 31
    .line 32
    iput p3, v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceNode;->value:F

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    new-instance v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceNode;

    .line 36
    .line 37
    invoke-direct {v0, p1, p2, p3}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceNode;-><init>(Ljava/lang/String;Ljava/lang/String;F)V

    .line 38
    .line 39
    .line 40
    invoke-interface {v2, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    :goto_0
    iget-boolean v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->isForbidBeauty:Z

    .line 44
    .line 45
    const/4 v2, 0x1

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    return v2

    .line 49
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    sget-object v3, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->resourceRootPath:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->renderManager:Lcom/effectsar/labcv/effectsdk/RenderManager;

    .line 72
    .line 73
    invoke-virtual {p0, p1, p2, p3}, Lcom/effectsar/labcv/effectsdk/RenderManager;->updateComposerNodes(Ljava/lang/String;Ljava/lang/String;F)I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    if-nez p0, :cond_2

    .line 78
    .line 79
    return v2

    .line 80
    :cond_2
    return v1
.end method

.method public updateFilter(Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->canUse()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->renderManager:Lcom/effectsar/labcv/effectsdk/RenderManager;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->setFilter(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public updateFilterIntensity(F)Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->canUse()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->renderManager:Lcom/effectsar/labcv/effectsdk/RenderManager;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/16 v0, 0xc

    .line 12
    .line 13
    invoke-virtual {p0, v0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->updateIntensity(IF)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method
