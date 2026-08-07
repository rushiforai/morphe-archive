.class public Ll/hsh0;
.super Lcom/ss/android/ttvecamera/framework/TECameraModeBase;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation


# static fields
.field private static final X:Ljava/lang/String; = "hsh0"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Lcom/ss/android/ttvecamera/b;Landroid/content/Context;Landroid/hardware/camera2/CameraManager;Landroid/os/Handler;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p4}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;-><init>(Lcom/ss/android/ttvecamera/b;Landroid/content/Context;Landroid/os/Handler;)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->e:Landroid/hardware/camera2/CameraManager;

    .line 5
    .line 6
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 7
    .line 8
    iget-boolean p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->m:Z

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    new-instance p1, Ll/jsh0;

    .line 13
    .line 14
    invoke-direct {p1, p0}, Ll/jsh0;-><init>(Ll/p6m$a;)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->i:Ll/orh0;

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    new-instance p1, Ll/ish0;

    .line 21
    .line 22
    invoke-direct {p1, p0}, Ll/ish0;-><init>(Ll/p6m$a;)V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->i:Ll/orh0;

    .line 26
    .line 27
    return-void
.end method

.method public static synthetic B0(Ll/hsh0;)Lcom/ss/android/ttvecamera/TECameraSettings;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic C0(Ll/hsh0;)Landroid/hardware/camera2/CameraDevice;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic D0(Ll/hsh0;)Lcom/ss/android/ttvecamera/c$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public E()I
    .locals 0

    .line 1
    const/4 p0, 0x3

    .line 2
    return p0
.end method

.method public c(I)V
    .locals 14

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    if-nez v2, :cond_1

    .line 10
    .line 11
    sget-object v1, Ll/hsh0;->X:Ljava/lang/String;

    .line 12
    .line 13
    const-string v2, "[VE_UI_TEST]Failed event: TOGGLE_TORCH. Code: -100. Reason: mCaptureRequestBuilder is null"

    .line 14
    .line 15
    invoke-static {v1, v2}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const-string v2, "switchFlashMode: CaptureRequest.Builder is null"

    .line 19
    .line 20
    invoke-static {v1, v2}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 24
    .line 25
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 26
    .line 27
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 28
    .line 29
    const-string v4, "switchFlashMode:CaptureRequest.Builder is null"

    .line 30
    .line 31
    iget-object v5, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 32
    .line 33
    const/16 v6, -0x64

    .line 34
    .line 35
    invoke-interface {v1, v2, v6, v4, v5}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    iget-object v7, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 41
    .line 42
    iget v8, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 43
    .line 44
    if-nez p1, :cond_0

    .line 45
    .line 46
    move v10, v3

    .line 47
    goto :goto_0

    .line 48
    :cond_0
    move v10, v0

    .line 49
    :goto_0
    const-string v11, "switchFlashMode:CaptureRequest.Builder is null"

    .line 50
    .line 51
    iget-object v12, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 52
    .line 53
    const/16 v9, -0x64

    .line 54
    .line 55
    invoke-interface/range {v7 .. v12}, Lcom/ss/android/ttvecamera/c$a;->g(IIILjava/lang/String;Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    if-eqz p1, :cond_3

    .line 60
    .line 61
    const/4 v4, 0x2

    .line 62
    if-eq p1, v4, :cond_2

    .line 63
    .line 64
    sget-object v0, Ll/hsh0;->X:Ljava/lang/String;

    .line 65
    .line 66
    new-instance v1, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    const-string v2, "[VE_UI_TEST]Failed event: TOGGLE_TORCH. Code: -100. Reason: not support flash mode "

    .line 69
    .line 70
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    new-instance v1, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    const-string v2, "Video Mode not support this mode : "

    .line 86
    .line 87
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget-object v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 101
    .line 102
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 103
    .line 104
    iget v4, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 105
    .line 106
    new-instance v0, Ljava/lang/StringBuilder;

    .line 107
    .line 108
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v7

    .line 118
    iget-object v8, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 119
    .line 120
    const/16 v5, -0x64

    .line 121
    .line 122
    const/4 v6, -0x1

    .line 123
    invoke-interface/range {v3 .. v8}, Lcom/ss/android/ttvecamera/c$a;->g(IIILjava/lang/String;Ljava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_2
    sget-object v5, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 128
    .line 129
    invoke-virtual {v2, v5, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 130
    .line 131
    .line 132
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 133
    .line 134
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 135
    .line 136
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 137
    .line 138
    .line 139
    move-result-object v4

    .line 140
    invoke-virtual {v1, v2, v4}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 141
    .line 142
    .line 143
    goto :goto_1

    .line 144
    :cond_3
    sget-object v4, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 145
    .line 146
    invoke-virtual {v2, v4, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 147
    .line 148
    .line 149
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 150
    .line 151
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 152
    .line 153
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 154
    .line 155
    .line 156
    move-result-object v4

    .line 157
    invoke-virtual {v1, v2, v4}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 158
    .line 159
    .line 160
    :goto_1
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 161
    .line 162
    iput p1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->d0:I

    .line 163
    .line 164
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 165
    .line 166
    new-instance v2, Ljava/lang/StringBuilder;

    .line 167
    .line 168
    const-string v4, "camera2 will change flash mode "

    .line 169
    .line 170
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    const/16 v4, 0x68

    .line 181
    .line 182
    const/4 v5, 0x0

    .line 183
    invoke-interface {v1, v4, v3, v2, v5}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 184
    .line 185
    .line 186
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 187
    .line 188
    invoke-virtual {p0, v1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 193
    .line 194
    new-instance v4, Ljava/lang/StringBuilder;

    .line 195
    .line 196
    const-string v6, "camera2 did change flash mode "

    .line 197
    .line 198
    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v4

    .line 208
    const/16 v6, 0x69

    .line 209
    .line 210
    invoke-interface {v2, v6, v3, v4, v5}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {v1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->c()Z

    .line 214
    .line 215
    .line 216
    move-result v2

    .line 217
    if-nez v2, :cond_5

    .line 218
    .line 219
    sget-object v2, Ll/hsh0;->X:Ljava/lang/String;

    .line 220
    .line 221
    new-instance v4, Ljava/lang/StringBuilder;

    .line 222
    .line 223
    const-string v5, "[VE_UI_TEST]Failed event: TOGGLE_TORCH. Code: -418. Reason: "

    .line 224
    .line 225
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    invoke-virtual {v1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v5

    .line 232
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v4

    .line 239
    invoke-static {v2, v4}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 243
    .line 244
    new-instance v4, Ljava/lang/StringBuilder;

    .line 245
    .line 246
    const-string v5, "switch flash failed."

    .line 247
    .line 248
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    invoke-virtual {v1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a()Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v6

    .line 255
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v4

    .line 262
    iget-object v6, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 263
    .line 264
    const/16 v7, -0x1a2

    .line 265
    .line 266
    invoke-interface {v2, v7, v7, v4, v6}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 267
    .line 268
    .line 269
    iget-object v8, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 270
    .line 271
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 272
    .line 273
    iget v9, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 274
    .line 275
    if-nez p1, :cond_4

    .line 276
    .line 277
    move v11, v3

    .line 278
    goto :goto_2

    .line 279
    :cond_4
    move v11, v0

    .line 280
    :goto_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 281
    .line 282
    invoke-direct {p1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    invoke-virtual {v1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 290
    .line 291
    .line 292
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object v12

    .line 296
    iget-object v13, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 297
    .line 298
    const/16 v10, -0x1a2

    .line 299
    .line 300
    invoke-interface/range {v8 .. v13}, Lcom/ss/android/ttvecamera/c$a;->g(IIILjava/lang/String;Ljava/lang/Object;)V

    .line 301
    .line 302
    .line 303
    return-void

    .line 304
    :cond_5
    move v1, v0

    .line 305
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 306
    .line 307
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 308
    .line 309
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 310
    .line 311
    if-nez p1, :cond_6

    .line 312
    .line 313
    goto :goto_3

    .line 314
    :cond_6
    move v3, v1

    .line 315
    :goto_3
    const-string v4, "torch success"

    .line 316
    .line 317
    iget-object v5, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 318
    .line 319
    move v1, v2

    .line 320
    const/4 v2, 0x0

    .line 321
    invoke-interface/range {v0 .. v5}, Lcom/ss/android/ttvecamera/c$a;->h(IIILjava/lang/String;Ljava/lang/Object;)V

    .line 322
    .line 323
    .line 324
    return-void
.end method

.method public m0()I
    .locals 8
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x1c
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/c;->K()Ll/jrh0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 8
    .line 9
    if-eqz v1, :cond_10

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_7

    .line 14
    .line 15
    :cond_0
    invoke-super {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->R()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    return v1

    .line 22
    :cond_1
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 23
    .line 24
    iget-boolean v2, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->o0:Z

    .line 25
    .line 26
    const/4 v3, 0x1

    .line 27
    if-eqz v2, :cond_2

    .line 28
    .line 29
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 30
    .line 31
    if-nez v2, :cond_4

    .line 32
    .line 33
    :cond_2
    iget-object v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->E:Landroid/os/Bundle;

    .line 34
    .line 35
    const-string v2, "enablePreviewTemplate"

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 42
    .line 43
    if-eqz v1, :cond_3

    .line 44
    .line 45
    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iput-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_3
    const/4 v1, 0x3

    .line 53
    invoke-virtual {v2, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iput-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 58
    .line 59
    :cond_4
    :goto_0
    new-instance v1, Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ll/jrh0;->f()Ll/irh0;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v2}, Ll/irh0;->g()I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    const/16 v4, 0x8

    .line 73
    .line 74
    if-ne v2, v4, :cond_5

    .line 75
    .line 76
    invoke-virtual {v0}, Ll/jrh0;->e()[Landroid/view/Surface;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_5
    invoke-virtual {v0}, Ll/jrh0;->f()Ll/irh0;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-virtual {v2}, Ll/irh0;->g()I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    const/16 v4, 0x10

    .line 97
    .line 98
    if-ne v2, v4, :cond_6

    .line 99
    .line 100
    invoke-virtual {v0}, Ll/jrh0;->d()Landroid/view/Surface;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0}, Ll/jrh0;->f()Ll/irh0;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {v0}, Ll/irh0;->b()Landroid/view/Surface;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_6
    invoke-virtual {v0}, Ll/jrh0;->d()Landroid/view/Surface;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    :goto_1
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    const/4 v2, 0x0

    .line 131
    move v4, v2

    .line 132
    :cond_7
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 133
    .line 134
    .line 135
    move-result v5

    .line 136
    if-eqz v5, :cond_8

    .line 137
    .line 138
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v5

    .line 142
    check-cast v5, Landroid/view/Surface;

    .line 143
    .line 144
    iget-object v6, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 145
    .line 146
    invoke-virtual {v6, v5}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v5}, Landroid/view/Surface;->isValid()Z

    .line 150
    .line 151
    .line 152
    move-result v5

    .line 153
    if-nez v5, :cond_7

    .line 154
    .line 155
    move v4, v3

    .line 156
    goto :goto_2

    .line 157
    :cond_8
    new-instance v0, Landroid/util/Range;

    .line 158
    .line 159
    iget-object v5, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->B:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 160
    .line 161
    iget v5, v5, Lcom/ss/android/ttvecamera/TEFrameRateRange;->min:I

    .line 162
    .line 163
    iget-object v6, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 164
    .line 165
    iget-object v6, v6, Lcom/ss/android/ttvecamera/TECameraSettings;->c:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 166
    .line 167
    iget v6, v6, Lcom/ss/android/ttvecamera/TEFrameRateRange;->fpsUnitFactor:I

    .line 168
    .line 169
    div-int/2addr v5, v6

    .line 170
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 171
    .line 172
    .line 173
    move-result-object v5

    .line 174
    iget-object v6, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->B:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 175
    .line 176
    iget v6, v6, Lcom/ss/android/ttvecamera/TEFrameRateRange;->max:I

    .line 177
    .line 178
    iget-object v7, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 179
    .line 180
    iget-object v7, v7, Lcom/ss/android/ttvecamera/TECameraSettings;->c:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 181
    .line 182
    iget v7, v7, Lcom/ss/android/ttvecamera/TEFrameRateRange;->fpsUnitFactor:I

    .line 183
    .line 184
    div-int/2addr v6, v7

    .line 185
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 186
    .line 187
    .line 188
    move-result-object v6

    .line 189
    invoke-direct {v0, v5, v6}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->r(Landroid/util/Range;)Landroid/util/Range;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    iget-object v5, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 197
    .line 198
    sget-object v6, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 199
    .line 200
    invoke-virtual {v5, v6, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 201
    .line 202
    .line 203
    if-eqz v4, :cond_9

    .line 204
    .line 205
    sget-object v0, Ll/hsh0;->X:Ljava/lang/String;

    .line 206
    .line 207
    const-string v4, "start preview may be failed, surface invalid..."

    .line 208
    .line 209
    invoke-static {v0, v4}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    :cond_9
    iput-boolean v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->G:Z

    .line 213
    .line 214
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 215
    .line 216
    .line 217
    move-result-wide v4

    .line 218
    iput-wide v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->H:J

    .line 219
    .line 220
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 221
    .line 222
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->k:Z

    .line 223
    .line 224
    if-eqz v0, :cond_a

    .line 225
    .line 226
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->D()Landroid/os/Handler;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    goto :goto_3

    .line 231
    :cond_a
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->k:Landroid/os/Handler;

    .line 232
    .line 233
    :goto_3
    iget-object v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 234
    .line 235
    iget-boolean v4, v4, Lcom/ss/android/ttvecamera/TECameraSettings;->o0:Z

    .line 236
    .line 237
    if-nez v4, :cond_b

    .line 238
    .line 239
    const/4 v3, 0x0

    .line 240
    iput-object v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 241
    .line 242
    iget-object v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->V:Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

    .line 243
    .line 244
    invoke-virtual {p0, v1, v3, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->t(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V

    .line 245
    .line 246
    .line 247
    goto :goto_6

    .line 248
    :cond_b
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->S:Ljava/util/List;

    .line 249
    .line 250
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 251
    .line 252
    .line 253
    move-result v0

    .line 254
    if-nez v0, :cond_c

    .line 255
    .line 256
    iget-boolean v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->R:Z

    .line 257
    .line 258
    if-nez v0, :cond_c

    .line 259
    .line 260
    move v0, v2

    .line 261
    :goto_4
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 262
    .line 263
    .line 264
    move-result v4

    .line 265
    if-ge v0, v4, :cond_c

    .line 266
    .line 267
    iget-object v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->S:Ljava/util/List;

    .line 268
    .line 269
    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 270
    .line 271
    .line 272
    move-result-object v4

    .line 273
    check-cast v4, Landroid/hardware/camera2/params/OutputConfiguration;

    .line 274
    .line 275
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 276
    .line 277
    .line 278
    move-result-object v5

    .line 279
    check-cast v5, Landroid/view/Surface;

    .line 280
    .line 281
    invoke-static {v4, v5}, Ll/fsh0;->a(Landroid/hardware/camera2/params/OutputConfiguration;Landroid/view/Surface;)V

    .line 282
    .line 283
    .line 284
    iput-boolean v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->R:Z

    .line 285
    .line 286
    add-int/lit8 v0, v0, 0x1

    .line 287
    .line 288
    goto :goto_4

    .line 289
    :cond_c
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 290
    .line 291
    const/16 v1, 0x1c

    .line 292
    .line 293
    if-lt v0, v1, :cond_e

    .line 294
    .line 295
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 296
    .line 297
    if-eqz v0, :cond_e

    .line 298
    .line 299
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 300
    .line 301
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->S:Ljava/util/List;

    .line 302
    .line 303
    invoke-static {v0, v1}, Ll/gsh0;->a(Landroid/hardware/camera2/CameraCaptureSession;Ljava/util/List;)V

    .line 304
    .line 305
    .line 306
    iput-boolean v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->Q:Z

    .line 307
    .line 308
    sget-object v0, Ll/hsh0;->X:Ljava/lang/String;

    .line 309
    .line 310
    const-string v1, "finalizeOutputConfigurations in startPreview"

    .line 311
    .line 312
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 313
    .line 314
    .line 315
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->u0()I

    .line 316
    .line 317
    .line 318
    move-result v0

    .line 319
    if-eqz v0, :cond_e

    .line 320
    .line 321
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->Q()V

    .line 322
    .line 323
    .line 324
    new-instance v1, Ll/hsh0$a;

    .line 325
    .line 326
    invoke-direct {v1, p0, v0}, Ll/hsh0$a;-><init>(Ll/hsh0;I)V

    .line 327
    .line 328
    .line 329
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 330
    .line 331
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->k:Z

    .line 332
    .line 333
    if-eqz v0, :cond_d

    .line 334
    .line 335
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->k:Landroid/os/Handler;

    .line 336
    .line 337
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 338
    .line 339
    .line 340
    goto :goto_6

    .line 341
    :catch_0
    move-exception v0

    .line 342
    goto :goto_5

    .line 343
    :cond_d
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 344
    .line 345
    .line 346
    goto :goto_6

    .line 347
    :goto_5
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->Q()V

    .line 348
    .line 349
    .line 350
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 351
    .line 352
    .line 353
    :cond_e
    :goto_6
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 354
    .line 355
    if-nez v0, :cond_f

    .line 356
    .line 357
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->z0()V

    .line 358
    .line 359
    .line 360
    :cond_f
    return v2

    .line 361
    :cond_10
    :goto_7
    sget-object p0, Ll/hsh0;->X:Ljava/lang/String;

    .line 362
    .line 363
    const-string v0, "CameraDevice or ProviderManager is null!"

    .line 364
    .line 365
    invoke-static {p0, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 366
    .line 367
    .line 368
    const/16 p0, -0x64

    .line 369
    .line 370
    return p0
.end method

.method public n0()I
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->n0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public p0()I
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->p0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
