.class Lio/agora/rtc2/video/VideoCaptureCamera2$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/rtc2/video/VideoCaptureCamera2;->startCaptureMaybeAsync()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

.field final synthetic val$manager:Landroid/hardware/camera2/CameraManager;

.field final synthetic val$stateListener:Lio/agora/rtc2/video/VideoCaptureCamera2$CrStateListener;


# direct methods
.method public constructor <init>(Lio/agora/rtc2/video/VideoCaptureCamera2;Landroid/hardware/camera2/CameraManager;Lio/agora/rtc2/video/VideoCaptureCamera2$CrStateListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$3;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 2
    .line 3
    iput-object p2, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$3;->val$manager:Landroid/hardware/camera2/CameraManager;

    .line 4
    .line 5
    iput-object p3, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$3;->val$stateListener:Lio/agora/rtc2/video/VideoCaptureCamera2$CrStateListener;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Boolean;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const-string v0, "allocate: manager.openCamera: "

    .line 2
    .line 3
    const-string v1, "allocate openCamera: "

    .line 4
    .line 5
    const-string v2, "Invalid camera Id: "

    .line 6
    .line 7
    const-string v3, "allocate openCamera camera name:"

    .line 8
    .line 9
    :try_start_0
    iget-object v4, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$3;->val$manager:Landroid/hardware/camera2/CameraManager;

    .line 10
    .line 11
    invoke-virtual {v4}, Landroid/hardware/camera2/CameraManager;->getCameraIdList()[Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    iget-object v5, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$3;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 16
    .line 17
    invoke-static {v5}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$2200(Lio/agora/rtc2/video/VideoCaptureCamera2;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    if-eqz v5, :cond_0

    .line 22
    .line 23
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$100()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    new-instance v2, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v3, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$3;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 33
    .line 34
    invoke-static {v3}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$2200(Lio/agora/rtc2/video/VideoCaptureCamera2;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-static {v1, v2}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$3;->val$manager:Landroid/hardware/camera2/CameraManager;

    .line 49
    .line 50
    iget-object v2, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$3;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 51
    .line 52
    invoke-static {v2}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$2200(Lio/agora/rtc2/video/VideoCaptureCamera2;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    iget-object v3, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$3;->val$stateListener:Lio/agora/rtc2/video/VideoCaptureCamera2$CrStateListener;

    .line 57
    .line 58
    iget-object v4, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$3;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 59
    .line 60
    invoke-static {v4}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$1200(Lio/agora/rtc2/video/VideoCaptureCamera2;)Landroid/os/Handler;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-virtual {v1, v2, v3, v4}, Landroid/hardware/camera2/CameraManager;->openCamera(Ljava/lang/String;Landroid/hardware/camera2/CameraDevice$StateCallback;Landroid/os/Handler;)V

    .line 65
    .line 66
    .line 67
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$3;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 68
    .line 69
    invoke-static {v1}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$2200(Lio/agora/rtc2/video/VideoCaptureCamera2;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-static {v1, v2}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$2302(Lio/agora/rtc2/video/VideoCaptureCamera2;Ljava/lang/String;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    goto/16 :goto_3

    .line 77
    .line 78
    :catch_0
    move-exception v1

    .line 79
    goto :goto_0

    .line 80
    :catch_1
    move-exception v1

    .line 81
    goto/16 :goto_1

    .line 82
    .line 83
    :catch_2
    move-exception v1

    .line 84
    goto/16 :goto_2

    .line 85
    .line 86
    :cond_0
    iget-object v3, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$3;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 87
    .line 88
    iget v3, v3, Lio/agora/rtc2/video/VideoCaptureCamera;->mId:I

    .line 89
    .line 90
    array-length v5, v4

    .line 91
    if-lt v3, v5, :cond_1

    .line 92
    .line 93
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$100()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    new-instance v3, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    iget-object v2, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$3;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 103
    .line 104
    iget v2, v2, Lio/agora/rtc2/video/VideoCaptureCamera;->mId:I

    .line 105
    .line 106
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-static {v1, v2}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 117
    .line 118
    return-object p0

    .line 119
    :cond_1
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$100()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    new-instance v3, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$3;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 129
    .line 130
    iget v1, v1, Lio/agora/rtc2/video/VideoCaptureCamera;->mId:I

    .line 131
    .line 132
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    const-string v1, " camera name:"

    .line 136
    .line 137
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$3;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 141
    .line 142
    iget v1, v1, Lio/agora/rtc2/video/VideoCaptureCamera;->mId:I

    .line 143
    .line 144
    aget-object v1, v4, v1

    .line 145
    .line 146
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-static {v2, v1}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$3;->val$manager:Landroid/hardware/camera2/CameraManager;

    .line 157
    .line 158
    iget-object v2, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$3;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 159
    .line 160
    iget v3, v2, Lio/agora/rtc2/video/VideoCaptureCamera;->mId:I

    .line 161
    .line 162
    aget-object v3, v4, v3

    .line 163
    .line 164
    iget-object v5, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$3;->val$stateListener:Lio/agora/rtc2/video/VideoCaptureCamera2$CrStateListener;

    .line 165
    .line 166
    invoke-static {v2}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$1200(Lio/agora/rtc2/video/VideoCaptureCamera2;)Landroid/os/Handler;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    invoke-virtual {v1, v3, v5, v2}, Landroid/hardware/camera2/CameraManager;->openCamera(Ljava/lang/String;Landroid/hardware/camera2/CameraDevice$StateCallback;Landroid/os/Handler;)V

    .line 171
    .line 172
    .line 173
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$3;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 174
    .line 175
    iget v2, v1, Lio/agora/rtc2/video/VideoCaptureCamera;->mId:I

    .line 176
    .line 177
    aget-object v2, v4, v2

    .line 178
    .line 179
    invoke-static {v1, v2}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$2302(Lio/agora/rtc2/video/VideoCaptureCamera2;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 180
    .line 181
    .line 182
    goto :goto_3

    .line 183
    :goto_0
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$100()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v2

    .line 187
    new-instance v3, Ljava/lang/StringBuilder;

    .line 188
    .line 189
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    invoke-static {v2, v0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$3;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 207
    .line 208
    invoke-static {v0}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$2200(Lio/agora/rtc2/video/VideoCaptureCamera2;)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    if-nez v0, :cond_2

    .line 213
    .line 214
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 215
    .line 216
    return-object p0

    .line 217
    :goto_1
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$100()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v2

    .line 221
    new-instance v3, Ljava/lang/StringBuilder;

    .line 222
    .line 223
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 224
    .line 225
    .line 226
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    invoke-static {v2, v0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 238
    .line 239
    .line 240
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$3;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 241
    .line 242
    invoke-static {v0}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$2200(Lio/agora/rtc2/video/VideoCaptureCamera2;)Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    if-nez v0, :cond_2

    .line 247
    .line 248
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 249
    .line 250
    return-object p0

    .line 251
    :goto_2
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$100()Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v2

    .line 255
    new-instance v3, Ljava/lang/StringBuilder;

    .line 256
    .line 257
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    invoke-static {v2, v0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$3;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 275
    .line 276
    invoke-static {v0}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$2200(Lio/agora/rtc2/video/VideoCaptureCamera2;)Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    if-nez v0, :cond_2

    .line 281
    .line 282
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 283
    .line 284
    return-object p0

    .line 285
    :cond_2
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$3;->this$0:Lio/agora/rtc2/video/VideoCaptureCamera2;

    .line 286
    .line 287
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$3;->val$manager:Landroid/hardware/camera2/CameraManager;

    .line 288
    .line 289
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCamera2$3;->val$stateListener:Lio/agora/rtc2/video/VideoCaptureCamera2$CrStateListener;

    .line 290
    .line 291
    invoke-static {v0, v1, p0}, Lio/agora/rtc2/video/VideoCaptureCamera2;->access$2400(Lio/agora/rtc2/video/VideoCaptureCamera2;Landroid/hardware/camera2/CameraManager;Lio/agora/rtc2/video/VideoCaptureCamera2$CrStateListener;)Z

    .line 292
    .line 293
    .line 294
    move-result p0

    .line 295
    if-nez p0, :cond_3

    .line 296
    .line 297
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 298
    .line 299
    return-object p0

    .line 300
    :cond_3
    :goto_3
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 301
    .line 302
    return-object p0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 303
    invoke-virtual {p0}, Lio/agora/rtc2/video/VideoCaptureCamera2$3;->call()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
