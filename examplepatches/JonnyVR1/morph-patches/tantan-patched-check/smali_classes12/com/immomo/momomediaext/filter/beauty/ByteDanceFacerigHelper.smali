.class public Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;
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
    sput-boolean p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->mFaceRigLoadSucesss:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$100()Lcom/momocv/facerigv3/FaceRigV3;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->mFaceRigV3:Lcom/momocv/facerigv3/FaceRigV3;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$202(Z)Z
    .locals 0

    .line 1
    sput-boolean p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->mLoadSucess:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$302(Z)Z
    .locals 0

    .line 1
    sput-boolean p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->mLoadMode:Z

    .line 2
    .line 3
    return p0
.end method

.method public static isUseAnimojiFaceRig()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->mUseAnimojiFaceRig:Z

    .line 2
    .line 3
    return v0
.end method

.method public static declared-synchronized processFacrigFrame(Ll/umw;Ll/lnw;Ll/omw;)Ll/evf;
    .locals 11

    .line 1
    const-class v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    invoke-virtual {p0}, Ll/umw;->c()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v0, :cond_9

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/umw;->e()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_9

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/umw;->a()[B

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_9

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/umw;->a()[B

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
    goto/16 :goto_4

    .line 31
    .line 32
    :cond_0
    invoke-virtual {p0}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget v0, v0, Lcom/momocv/MMFrame;->format_:I

    .line 37
    .line 38
    const/16 v3, 0x11

    .line 39
    .line 40
    if-ne v0, v3, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/umw;->a()[B

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    array-length v0, v0

    .line 47
    int-to-float v0, v0

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
    cmpg-float v0, v0, v3

    .line 62
    .line 63
    if-gez v0, :cond_1

    .line 64
    .line 65
    monitor-exit v1

    .line 66
    return-object v2

    .line 67
    :catchall_0
    move-exception v0

    .line 68
    move-object p0, v0

    .line 69
    goto/16 :goto_5

    .line 70
    .line 71
    :cond_1
    :try_start_1
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->mFaceRigV3:Lcom/momocv/facerigv3/FaceRigV3;

    .line 72
    .line 73
    if-nez v0, :cond_2

    .line 74
    .line 75
    new-instance v0, Lcom/momocv/facerigv3/FaceRigV3;

    .line 76
    .line 77
    invoke-direct {v0}, Lcom/momocv/facerigv3/FaceRigV3;-><init>()V

    .line 78
    .line 79
    .line 80
    sput-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->mFaceRigV3:Lcom/momocv/facerigv3/FaceRigV3;

    .line 81
    .line 82
    :cond_2
    sget-boolean v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->mLoadMode:Z

    .line 83
    .line 84
    if-nez v0, :cond_5

    .line 85
    .line 86
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->faceRigHandler:Lcom/core/glcore/util/FaceRigHandler;

    .line 87
    .line 88
    if-eqz v0, :cond_5

    .line 89
    .line 90
    invoke-interface {v0}, Lcom/core/glcore/util/FaceRigHandler;->onLoadFaceRigModel()[B

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    if-eqz v0, :cond_4

    .line 95
    .line 96
    array-length v3, v0

    .line 97
    if-gtz v3, :cond_3

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_3
    sget-boolean v3, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->mFaceRigLoadSucesss:Z

    .line 101
    .line 102
    if-nez v3, :cond_5

    .line 103
    .line 104
    sget-boolean v3, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->mFaceDetectLoadSucesss:Z

    .line 105
    .line 106
    if-nez v3, :cond_5

    .line 107
    .line 108
    sget-boolean v3, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->mLoadSucess:Z

    .line 109
    .line 110
    if-nez v3, :cond_5

    .line 111
    .line 112
    const/4 v3, 0x1

    .line 113
    sput-boolean v3, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->mLoadSucess:Z

    .line 114
    .line 115
    new-instance v3, Ljava/lang/Thread;

    .line 116
    .line 117
    new-instance v4, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper$1;

    .line 118
    .line 119
    invoke-direct {v4, v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper$1;-><init>([B)V

    .line 120
    .line 121
    .line 122
    invoke-direct {v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 126
    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_4
    :goto_0
    const-string p0, "FacerigHelper"

    .line 130
    .line 131
    const-string p1, "cv model is null"

    .line 132
    .line 133
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 134
    .line 135
    .line 136
    monitor-exit v1

    .line 137
    return-object v2

    .line 138
    :cond_5
    :goto_1
    :try_start_2
    sget-boolean v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->mLoadMode:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 139
    .line 140
    if-nez v0, :cond_6

    .line 141
    .line 142
    monitor-exit v1

    .line 143
    return-object v2

    .line 144
    :cond_6
    :try_start_3
    new-instance v0, Ll/evf;

    .line 145
    .line 146
    invoke-direct {v0}, Ll/evf;-><init>()V

    .line 147
    .line 148
    .line 149
    new-instance v2, Lcom/momocv/facerigv3/FacerigV3Params;

    .line 150
    .line 151
    invoke-direct {v2}, Lcom/momocv/facerigv3/FacerigV3Params;-><init>()V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p1}, Ll/lnw;->e()I

    .line 155
    .line 156
    .line 157
    move-result v3

    .line 158
    iput v3, v2, Lcom/momocv/BaseParams;->rotate_degree_:I

    .line 159
    .line 160
    invoke-virtual {p1}, Ll/lnw;->d()I

    .line 161
    .line 162
    .line 163
    move-result v3

    .line 164
    iput v3, v2, Lcom/momocv/BaseParams;->restore_degree_:I

    .line 165
    .line 166
    invoke-virtual {p1}, Ll/lnw;->g()Z

    .line 167
    .line 168
    .line 169
    move-result v3

    .line 170
    iput-boolean v3, v2, Lcom/momocv/BaseParams;->fliped_show_:Z

    .line 171
    .line 172
    iget-object v3, p2, Ll/omw;->k:Lcom/momocv/videoprocessor/VideoInfo;

    .line 173
    .line 174
    invoke-virtual {v0, v3}, Ll/evf;->c(Lcom/momocv/videoprocessor/VideoInfo;)V

    .line 175
    .line 176
    .line 177
    iget-object v3, p2, Ll/omw;->k:Lcom/momocv/videoprocessor/VideoInfo;

    .line 178
    .line 179
    iget-object v3, v3, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    .line 180
    .line 181
    if-eqz v3, :cond_8

    .line 182
    .line 183
    array-length v4, v3

    .line 184
    if-lez v4, :cond_8

    .line 185
    .line 186
    const/4 v4, 0x0

    .line 187
    aget-object v3, v3, v4

    .line 188
    .line 189
    iget-object v4, v3, Lcom/momocv/SingleFaceInfo;->orig_landmarks_96_:[F

    .line 190
    .line 191
    if-eqz v4, :cond_8

    .line 192
    .line 193
    array-length v4, v4

    .line 194
    if-lez v4, :cond_8

    .line 195
    .line 196
    iget-object v4, v3, Lcom/momocv/SingleFaceInfo;->euler_angles_:[F

    .line 197
    .line 198
    if-eqz v4, :cond_8

    .line 199
    .line 200
    array-length v4, v4

    .line 201
    const/4 v5, 0x2

    .line 202
    if-le v4, v5, :cond_8

    .line 203
    .line 204
    invoke-virtual {p1}, Ll/lnw;->g()Z

    .line 205
    .line 206
    .line 207
    move-result v4

    .line 208
    if-eqz v4, :cond_7

    .line 209
    .line 210
    const/16 v4, 0x5a

    .line 211
    .line 212
    :goto_2
    move v6, v4

    .line 213
    goto :goto_3

    .line 214
    :cond_7
    const/16 v4, 0x10e

    .line 215
    .line 216
    goto :goto_2

    .line 217
    :goto_3
    iget-object v5, v3, Lcom/momocv/SingleFaceInfo;->orig_landmarks_96_:[F

    .line 218
    .line 219
    invoke-virtual {p1}, Ll/lnw;->g()Z

    .line 220
    .line 221
    .line 222
    move-result v7

    .line 223
    invoke-virtual {p0}, Ll/umw;->e()I

    .line 224
    .line 225
    .line 226
    move-result v8

    .line 227
    invoke-virtual {p0}, Ll/umw;->c()I

    .line 228
    .line 229
    .line 230
    move-result v9

    .line 231
    iget v10, p2, Ll/omw;->A:F

    .line 232
    .line 233
    invoke-static/range {v5 .. v10}, Lcom/immomo/momomediaext/filter/beauty/ByteToMMUtils;->transBytePoint96ToOriginal96([FIZIIF)[F

    .line 234
    .line 235
    .line 236
    move-result-object p1

    .line 237
    iput-object p1, v3, Lcom/momocv/SingleFaceInfo;->orig_landmarks_96_:[F

    .line 238
    .line 239
    iput-object p1, v2, Lcom/momocv/facerigv3/FacerigV3Params;->orig_landmarks_96_:[F

    .line 240
    .line 241
    iget-object p1, v3, Lcom/momocv/SingleFaceInfo;->euler_angles_:[F

    .line 242
    .line 243
    iput-object p1, v2, Lcom/momocv/facerigv3/FacerigV3Params;->face_processor_eulers_:[F

    .line 244
    .line 245
    sget-object p1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->mFaceRigV3:Lcom/momocv/facerigv3/FaceRigV3;

    .line 246
    .line 247
    invoke-virtual {p0}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 248
    .line 249
    .line 250
    move-result-object p0

    .line 251
    iget-object p2, v0, Ll/evf;->a:Lcom/momocv/facerigv3/FacerigV3Info;

    .line 252
    .line 253
    invoke-virtual {p1, p0, v2, p2}, Lcom/momocv/facerigv3/FaceRigV3;->ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/facerigv3/FacerigV3Params;Lcom/momocv/facerigv3/FacerigV3Info;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 254
    .line 255
    .line 256
    :cond_8
    monitor-exit v1

    .line 257
    return-object v0

    .line 258
    :cond_9
    :goto_4
    monitor-exit v1

    .line 259
    return-object v2

    .line 260
    :goto_5
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 261
    throw p0
.end method

.method public static registerFaceRigHandler(Lcom/core/glcore/util/FaceRigHandler;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->faceRigHandler:Lcom/core/glcore/util/FaceRigHandler;

    .line 2
    .line 3
    return-void
.end method

.method public static declared-synchronized release()V
    .locals 2

    .line 1
    const-class v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->started:Z

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    sget-object v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->faceRigHandler:Lcom/core/glcore/util/FaceRigHandler;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    sput-boolean v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->started:Z

    .line 14
    .line 15
    sget-object v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->faceRigHandler:Lcom/core/glcore/util/FaceRigHandler;

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
    const-class v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->mFaceRigV3:Lcom/momocv/facerigv3/FaceRigV3;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/momocv/facerigv3/FaceRigV3;->Release()V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    sput-object v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->mFaceRigV3:Lcom/momocv/facerigv3/FaceRigV3;

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
    const/4 v1, 0x0

    .line 18
    sput-boolean v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->mFaceRigLoadSucesss:Z

    .line 19
    .line 20
    sput-boolean v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->mFaceDetectLoadSucesss:Z

    .line 21
    .line 22
    sput-boolean v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->mLoadSucess:Z

    .line 23
    .line 24
    sput-boolean v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->mLoadMode:Z

    .line 25
    .line 26
    sput-boolean v1, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->mUseAnimojiFaceRig:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    monitor-exit v0

    .line 29
    return-void

    .line 30
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    throw v1
.end method

.method public static setUseAnimojiFaceRig(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->mUseAnimojiFaceRig:Z

    .line 2
    .line 3
    return-void
.end method

.method public static unregisterFaceRigHandler()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-object v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->faceRigHandler:Lcom/core/glcore/util/FaceRigHandler;

    .line 3
    .line 4
    return-void
.end method
