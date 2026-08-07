.class public Lcom/core/glcore/util/FacerigHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static faceRigHandler:Lcom/core/glcore/util/FaceRigHandler;

.field private static volatile mFaceDetectLoadSucesss:Z

.field private static volatile mFaceRigLoadSucesss:Z

.field private static mFaceRigV3:Lcom/momocv/facerigv3/FaceRigV3;

.field private static volatile mLoadMode:Z

.field private static volatile mLoadSucess:Z

.field private static volatile mUseAnimojiFaceRig:Z

.field private static mVideoProcessor:Lcom/momocv/videoprocessor/VideoProcessor;

.field private static volatile started:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

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

.method public static synthetic access$002(Z)Z
    .locals 0

    .line 1
    sput-boolean p0, Lcom/core/glcore/util/FacerigHelper;->mFaceRigLoadSucesss:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$100()Lcom/momocv/facerigv3/FaceRigV3;
    .locals 1

    .line 1
    sget-object v0, Lcom/core/glcore/util/FacerigHelper;->mFaceRigV3:Lcom/momocv/facerigv3/FaceRigV3;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$200()Lcom/momocv/videoprocessor/VideoProcessor;
    .locals 1

    .line 1
    sget-object v0, Lcom/core/glcore/util/FacerigHelper;->mVideoProcessor:Lcom/momocv/videoprocessor/VideoProcessor;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$302(Z)Z
    .locals 0

    .line 1
    sput-boolean p0, Lcom/core/glcore/util/FacerigHelper;->mLoadSucess:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$402(Z)Z
    .locals 0

    .line 1
    sput-boolean p0, Lcom/core/glcore/util/FacerigHelper;->mLoadMode:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$500()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/core/glcore/util/FacerigHelper;->releseFaceRigInfoInner()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getUseAnimojiFaceRig()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/core/glcore/util/FacerigHelper;->mUseAnimojiFaceRig:Z

    .line 2
    .line 3
    return v0
.end method

.method public static isUseFacerig()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/core/glcore/util/FacerigHelper;->getUseAnimojiFaceRig()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    return v0
.end method

.method public static declared-synchronized process(Ll/umw;Ll/lnw;)Ll/evf;
    .locals 2

    .line 1
    const-class v0, Lcom/core/glcore/util/FacerigHelper;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    invoke-static {p0, p1, v1}, Lcom/core/glcore/util/FacerigHelper;->processFacrigFrame(Ll/umw;Ll/lnw;Ll/omw;)Ll/evf;

    .line 6
    .line 7
    .line 8
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    monitor-exit v0

    .line 10
    return-object p0

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    throw p0
.end method

.method public static declared-synchronized process(Ll/umw;Ll/lnw;Ll/omw;)Ll/evf;
    .locals 1

    const-class v0, Lcom/core/glcore/util/FacerigHelper;

    monitor-enter v0

    .line 14
    :try_start_0
    invoke-static {p0, p1, p2}, Lcom/core/glcore/util/FacerigHelper;->processFacrigFrame(Ll/umw;Ll/lnw;Ll/omw;)Ll/evf;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method private static declared-synchronized processFacrigFrame(Ll/umw;Ll/lnw;Ll/omw;)Ll/evf;
    .locals 8

    .line 1
    const-class v0, Lcom/core/glcore/util/FacerigHelper;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-virtual {p0}, Ll/umw;->c()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v1, :cond_a

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/umw;->e()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_a

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/umw;->a()[B

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    if-eqz v1, :cond_a

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/umw;->a()[B

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    array-length v1, v1

    .line 28
    if-nez v1, :cond_0

    .line 29
    .line 30
    goto/16 :goto_2

    .line 31
    .line 32
    :cond_0
    invoke-virtual {p0}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget v1, v1, Lcom/momocv/MMFrame;->format_:I

    .line 37
    .line 38
    const/16 v3, 0x11

    .line 39
    .line 40
    if-ne v1, v3, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/umw;->a()[B

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    array-length v1, v1

    .line 47
    int-to-float v1, v1

    .line 48
    invoke-virtual {p0}, Ll/umw;->e()I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    invoke-virtual {p0}, Ll/umw;->c()I

    .line 53
    .line 54
    .line 55
    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    mul-int/2addr v3, v4

    .line 57
    int-to-float v3, v3

    .line 58
    const/high16 v4, 0x3fc00000    # 1.5f

    .line 59
    .line 60
    mul-float/2addr v3, v4

    .line 61
    cmpg-float v1, v1, v3

    .line 62
    .line 63
    if-gez v1, :cond_1

    .line 64
    .line 65
    monitor-exit v0

    .line 66
    return-object v2

    .line 67
    :catchall_0
    move-exception p0

    .line 68
    goto/16 :goto_3

    .line 69
    .line 70
    :cond_1
    :try_start_1
    sget-object v1, Lcom/core/glcore/util/FacerigHelper;->mFaceRigV3:Lcom/momocv/facerigv3/FaceRigV3;

    .line 71
    .line 72
    if-nez v1, :cond_2

    .line 73
    .line 74
    new-instance v1, Lcom/momocv/facerigv3/FaceRigV3;

    .line 75
    .line 76
    invoke-direct {v1}, Lcom/momocv/facerigv3/FaceRigV3;-><init>()V

    .line 77
    .line 78
    .line 79
    sput-object v1, Lcom/core/glcore/util/FacerigHelper;->mFaceRigV3:Lcom/momocv/facerigv3/FaceRigV3;

    .line 80
    .line 81
    :cond_2
    sget-object v1, Lcom/core/glcore/util/FacerigHelper;->mVideoProcessor:Lcom/momocv/videoprocessor/VideoProcessor;

    .line 82
    .line 83
    if-nez v1, :cond_3

    .line 84
    .line 85
    new-instance v1, Lcom/momocv/videoprocessor/VideoProcessor;

    .line 86
    .line 87
    invoke-direct {v1}, Lcom/momocv/videoprocessor/VideoProcessor;-><init>()V

    .line 88
    .line 89
    .line 90
    sput-object v1, Lcom/core/glcore/util/FacerigHelper;->mVideoProcessor:Lcom/momocv/videoprocessor/VideoProcessor;

    .line 91
    .line 92
    :cond_3
    sget-boolean v1, Lcom/core/glcore/util/FacerigHelper;->mLoadMode:Z

    .line 93
    .line 94
    const/4 v3, 0x1

    .line 95
    if-nez v1, :cond_6

    .line 96
    .line 97
    sget-object v1, Lcom/core/glcore/util/FacerigHelper;->faceRigHandler:Lcom/core/glcore/util/FaceRigHandler;

    .line 98
    .line 99
    if-eqz v1, :cond_6

    .line 100
    .line 101
    invoke-interface {v1}, Lcom/core/glcore/util/FaceRigHandler;->onLoadFaceRigModel()[B

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    sget-object v4, Lcom/core/glcore/util/FacerigHelper;->faceRigHandler:Lcom/core/glcore/util/FaceRigHandler;

    .line 106
    .line 107
    invoke-interface {v4}, Lcom/core/glcore/util/FaceRigHandler;->onLoadFaModel()[B

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    sget-object v5, Lcom/core/glcore/util/FacerigHelper;->faceRigHandler:Lcom/core/glcore/util/FaceRigHandler;

    .line 112
    .line 113
    invoke-interface {v5}, Lcom/core/glcore/util/FaceRigHandler;->onLoadFdModel()[B

    .line 114
    .line 115
    .line 116
    move-result-object v5

    .line 117
    if-eqz v1, :cond_5

    .line 118
    .line 119
    array-length v6, v1

    .line 120
    if-lez v6, :cond_5

    .line 121
    .line 122
    if-eqz v5, :cond_5

    .line 123
    .line 124
    array-length v6, v5

    .line 125
    if-lez v6, :cond_5

    .line 126
    .line 127
    if-eqz v4, :cond_5

    .line 128
    .line 129
    array-length v6, v4

    .line 130
    if-gtz v6, :cond_4

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_4
    sget-boolean v6, Lcom/core/glcore/util/FacerigHelper;->mFaceRigLoadSucesss:Z

    .line 134
    .line 135
    if-nez v6, :cond_6

    .line 136
    .line 137
    sget-boolean v6, Lcom/core/glcore/util/FacerigHelper;->mFaceDetectLoadSucesss:Z

    .line 138
    .line 139
    if-nez v6, :cond_6

    .line 140
    .line 141
    sget-boolean v6, Lcom/core/glcore/util/FacerigHelper;->mLoadSucess:Z

    .line 142
    .line 143
    if-nez v6, :cond_6

    .line 144
    .line 145
    sput-boolean v3, Lcom/core/glcore/util/FacerigHelper;->mLoadSucess:Z

    .line 146
    .line 147
    new-instance v6, Ljava/lang/Thread;

    .line 148
    .line 149
    new-instance v7, Lcom/core/glcore/util/FacerigHelper$1;

    .line 150
    .line 151
    invoke-direct {v7, v1, v5, v4}, Lcom/core/glcore/util/FacerigHelper$1;-><init>([B[B[B)V

    .line 152
    .line 153
    .line 154
    invoke-direct {v6, v7}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v6}, Ljava/lang/Thread;->start()V

    .line 158
    .line 159
    .line 160
    goto :goto_1

    .line 161
    :cond_5
    :goto_0
    const-string p0, "FacerigHelper"

    .line 162
    .line 163
    const-string p1, "cv model is null"

    .line 164
    .line 165
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 166
    .line 167
    .line 168
    monitor-exit v0

    .line 169
    return-object v2

    .line 170
    :cond_6
    :goto_1
    :try_start_2
    sget-boolean v1, Lcom/core/glcore/util/FacerigHelper;->mLoadMode:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 171
    .line 172
    if-nez v1, :cond_7

    .line 173
    .line 174
    monitor-exit v0

    .line 175
    return-object v2

    .line 176
    :cond_7
    const/4 v1, 0x0

    .line 177
    :try_start_3
    invoke-virtual {p1, v1}, Ll/lnw;->m(I)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p1, v3}, Ll/lnw;->x(I)V

    .line 181
    .line 182
    .line 183
    new-instance v2, Ll/evf;

    .line 184
    .line 185
    invoke-direct {v2}, Ll/evf;-><init>()V

    .line 186
    .line 187
    .line 188
    new-instance v3, Lcom/momocv/videoprocessor/VideoInfo;

    .line 189
    .line 190
    invoke-direct {v3}, Lcom/momocv/videoprocessor/VideoInfo;-><init>()V

    .line 191
    .line 192
    .line 193
    new-instance v4, Lcom/momocv/facerigv3/FacerigV3Params;

    .line 194
    .line 195
    invoke-direct {v4}, Lcom/momocv/facerigv3/FacerigV3Params;-><init>()V

    .line 196
    .line 197
    .line 198
    invoke-virtual {p1}, Ll/lnw;->e()I

    .line 199
    .line 200
    .line 201
    move-result v5

    .line 202
    iput v5, v4, Lcom/momocv/BaseParams;->rotate_degree_:I

    .line 203
    .line 204
    invoke-virtual {p1}, Ll/lnw;->d()I

    .line 205
    .line 206
    .line 207
    move-result v5

    .line 208
    iput v5, v4, Lcom/momocv/BaseParams;->restore_degree_:I

    .line 209
    .line 210
    invoke-virtual {p1}, Ll/lnw;->g()Z

    .line 211
    .line 212
    .line 213
    move-result v5

    .line 214
    iput-boolean v5, v4, Lcom/momocv/BaseParams;->fliped_show_:Z

    .line 215
    .line 216
    if-eqz p2, :cond_8

    .line 217
    .line 218
    invoke-virtual {p1}, Ll/lnw;->c()Lcom/momocv/BaseParams;

    .line 219
    .line 220
    .line 221
    move-result-object v5

    .line 222
    invoke-virtual {p2, v5}, Ll/omw;->B(Lcom/momocv/BaseParams;)V

    .line 223
    .line 224
    .line 225
    :cond_8
    sget-object p2, Lcom/core/glcore/util/FacerigHelper;->mVideoProcessor:Lcom/momocv/videoprocessor/VideoProcessor;

    .line 226
    .line 227
    invoke-virtual {p0}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 228
    .line 229
    .line 230
    move-result-object v5

    .line 231
    invoke-virtual {p1}, Ll/lnw;->c()Lcom/momocv/BaseParams;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    check-cast p1, Lcom/momocv/videoprocessor/VideoParams;

    .line 236
    .line 237
    invoke-virtual {p2, v5, p1, v3}, Lcom/momocv/videoprocessor/VideoProcessor;->ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/videoprocessor/VideoParams;Lcom/momocv/videoprocessor/VideoInfo;)Z

    .line 238
    .line 239
    .line 240
    invoke-virtual {v2, v3}, Ll/evf;->c(Lcom/momocv/videoprocessor/VideoInfo;)V

    .line 241
    .line 242
    .line 243
    iget-object p1, v3, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    .line 244
    .line 245
    if-eqz p1, :cond_9

    .line 246
    .line 247
    array-length p2, p1

    .line 248
    if-lez p2, :cond_9

    .line 249
    .line 250
    aget-object p1, p1, v1

    .line 251
    .line 252
    iget-object p2, p1, Lcom/momocv/SingleFaceInfo;->orig_landmarks_96_:[F

    .line 253
    .line 254
    if-eqz p2, :cond_9

    .line 255
    .line 256
    array-length v1, p2

    .line 257
    if-lez v1, :cond_9

    .line 258
    .line 259
    iget-object p1, p1, Lcom/momocv/SingleFaceInfo;->euler_angles_:[F

    .line 260
    .line 261
    if-eqz p1, :cond_9

    .line 262
    .line 263
    array-length v1, p1

    .line 264
    const/4 v3, 0x2

    .line 265
    if-le v1, v3, :cond_9

    .line 266
    .line 267
    iput-object p2, v4, Lcom/momocv/facerigv3/FacerigV3Params;->orig_landmarks_96_:[F

    .line 268
    .line 269
    iput-object p1, v4, Lcom/momocv/facerigv3/FacerigV3Params;->face_processor_eulers_:[F

    .line 270
    .line 271
    sget-object p1, Lcom/core/glcore/util/FacerigHelper;->mFaceRigV3:Lcom/momocv/facerigv3/FaceRigV3;

    .line 272
    .line 273
    invoke-virtual {p0}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 274
    .line 275
    .line 276
    move-result-object p0

    .line 277
    iget-object p2, v2, Ll/evf;->a:Lcom/momocv/facerigv3/FacerigV3Info;

    .line 278
    .line 279
    invoke-virtual {p1, p0, v4, p2}, Lcom/momocv/facerigv3/FaceRigV3;->ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/facerigv3/FacerigV3Params;Lcom/momocv/facerigv3/FacerigV3Info;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 280
    .line 281
    .line 282
    :cond_9
    monitor-exit v0

    .line 283
    return-object v2

    .line 284
    :cond_a
    :goto_2
    monitor-exit v0

    .line 285
    return-object v2

    .line 286
    :goto_3
    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 287
    throw p0
.end method

.method public static registerFaceRigHandler(Lcom/core/glcore/util/FaceRigHandler;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/core/glcore/util/FacerigHelper;->faceRigHandler:Lcom/core/glcore/util/FaceRigHandler;

    .line 2
    .line 3
    return-void
.end method

.method public static declared-synchronized release()V
    .locals 2

    .line 1
    const-class v0, Lcom/core/glcore/util/FacerigHelper;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/core/glcore/util/FacerigHelper;->started:Z

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    sget-object v1, Lcom/core/glcore/util/FacerigHelper;->faceRigHandler:Lcom/core/glcore/util/FaceRigHandler;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    sput-boolean v1, Lcom/core/glcore/util/FacerigHelper;->started:Z

    .line 14
    .line 15
    sget-object v1, Lcom/core/glcore/util/FacerigHelper;->faceRigHandler:Lcom/core/glcore/util/FaceRigHandler;

    .line 16
    .line 17
    invoke-interface {v1}, Lcom/core/glcore/util/FaceRigHandler;->onStopFaceRigModel()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception v1

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    monitor-exit v0

    .line 24
    return-void

    .line 25
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    throw v1
.end method

.method public static declared-synchronized releseFaceRigInfo()V
    .locals 2

    .line 1
    const-class v0, Lcom/core/glcore/util/FacerigHelper;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-static {}, Lcom/core/glcore/util/FacerigHelper;->releseFaceRigInfoInner()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    .line 7
    monitor-exit v0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception v1

    .line 10
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw v1
.end method

.method private static declared-synchronized releseFaceRigInfoInner()V
    .locals 3

    .line 1
    const-class v0, Lcom/core/glcore/util/FacerigHelper;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/core/glcore/util/FacerigHelper;->mFaceRigV3:Lcom/momocv/facerigv3/FaceRigV3;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/momocv/facerigv3/FaceRigV3;->Release()V

    .line 10
    .line 11
    .line 12
    sput-object v2, Lcom/core/glcore/util/FacerigHelper;->mFaceRigV3:Lcom/momocv/facerigv3/FaceRigV3;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception v1

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    :goto_0
    sget-object v1, Lcom/core/glcore/util/FacerigHelper;->mVideoProcessor:Lcom/momocv/videoprocessor/VideoProcessor;

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/momocv/videoprocessor/VideoProcessor;->Release()V

    .line 22
    .line 23
    .line 24
    sput-object v2, Lcom/core/glcore/util/FacerigHelper;->mVideoProcessor:Lcom/momocv/videoprocessor/VideoProcessor;

    .line 25
    .line 26
    :cond_1
    const/4 v1, 0x0

    .line 27
    sput-boolean v1, Lcom/core/glcore/util/FacerigHelper;->mFaceRigLoadSucesss:Z

    .line 28
    .line 29
    sput-boolean v1, Lcom/core/glcore/util/FacerigHelper;->mFaceDetectLoadSucesss:Z

    .line 30
    .line 31
    sput-boolean v1, Lcom/core/glcore/util/FacerigHelper;->mLoadSucess:Z

    .line 32
    .line 33
    sput-boolean v1, Lcom/core/glcore/util/FacerigHelper;->mLoadMode:Z

    .line 34
    .line 35
    sput-boolean v1, Lcom/core/glcore/util/FacerigHelper;->mUseAnimojiFaceRig:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    .line 37
    monitor-exit v0

    .line 38
    return-void

    .line 39
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    throw v1
.end method

.method public static setIsSetFacerig(Z)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-static {p0}, Lcom/core/glcore/util/FacerigHelper;->setUseAnimojiFaceRig(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static setUseAnimojiFaceRig(Z)V
    .locals 2

    .line 1
    const/16 v0, 0x2aa

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    sput-boolean p0, Lcom/core/glcore/util/FacerigHelper;->mUseAnimojiFaceRig:Z

    .line 7
    .line 8
    invoke-static {}, Lcom/core/glcore/util/DetectDelayStopHelper;->getInstance()Lcom/core/glcore/util/DetectDelayStopHelper;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    new-instance v1, Lcom/core/glcore/util/FacerigHelper$2;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/core/glcore/util/FacerigHelper$2;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0, v1}, Lcom/core/glcore/util/DetectDelayStopHelper;->delayRelease(ILjava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-static {}, Lcom/core/glcore/util/DetectDelayStopHelper;->getInstance()Lcom/core/glcore/util/DetectDelayStopHelper;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0, v0}, Lcom/core/glcore/util/DetectDelayStopHelper;->cancelRelease(I)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    sput-boolean p0, Lcom/core/glcore/util/FacerigHelper;->mUseAnimojiFaceRig:Z

    .line 30
    .line 31
    return-void
.end method

.method public static unregisterFaceRigHandler()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-object v0, Lcom/core/glcore/util/FacerigHelper;->faceRigHandler:Lcom/core/glcore/util/FaceRigHandler;

    .line 3
    .line 4
    return-void
.end method
