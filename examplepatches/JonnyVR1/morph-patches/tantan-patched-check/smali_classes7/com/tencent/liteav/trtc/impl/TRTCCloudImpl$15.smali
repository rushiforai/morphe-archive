.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->startLocalPreview(ZLcom/tencent/rtmp/ui/TXCloudVideoView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$frontCamera:Z

.field final synthetic val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ZLcom/tencent/rtmp/ui/TXCloudVideoView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->val$frontCamera:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;->NONE:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v3, 0x1

    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    move v0, v3

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v0, v2

    .line 16
    :goto_0
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 19
    .line 20
    const-string v5, "startLocalPreview just reset view when is started"

    .line 21
    .line 22
    invoke-virtual {v4, v5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 26
    .line 27
    iget v5, v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentRole:I

    .line 28
    .line 29
    const/16 v6, 0x15

    .line 30
    .line 31
    if-ne v5, v6, :cond_2

    .line 32
    .line 33
    new-instance v5, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15$1;

    .line 34
    .line 35
    invoke-direct {v5, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15$1;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v4, v5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 39
    .line 40
    .line 41
    iget-object v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 42
    .line 43
    const-string v5, "ignore startLocalPreview for audience"

    .line 44
    .line 45
    invoke-virtual {v4, v5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    const-string v5, "startLocalPreview front:"

    .line 51
    .line 52
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-boolean v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->val$frontCamera:Z

    .line 56
    .line 57
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v5, ", view:"

    .line 61
    .line 62
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    iget-object v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 66
    .line 67
    const-string v6, ""

    .line 68
    .line 69
    if-eqz v5, :cond_3

    .line 70
    .line 71
    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    goto :goto_1

    .line 80
    :cond_3
    move-object v5, v6

    .line 81
    :goto_1
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const-string v5, " "

    .line 85
    .line 86
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    iget-object v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 90
    .line 91
    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    iget-object v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 103
    .line 104
    invoke-virtual {v5, v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-static {v3, v4, v6, v2}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 108
    .line 109
    .line 110
    iget-object v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 111
    .line 112
    iget-object v5, v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 113
    .line 114
    iget-object v6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 115
    .line 116
    iput-object v6, v5, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->localView:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 117
    .line 118
    iget-object v5, v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 119
    .line 120
    iget-boolean v6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->val$frontCamera:Z

    .line 121
    .line 122
    iput-boolean v6, v5, Lcom/tencent/liteav/g;->m:Z

    .line 123
    .line 124
    iget v6, v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mPerformanceMode:I

    .line 125
    .line 126
    if-nez v6, :cond_4

    .line 127
    .line 128
    move v7, v3

    .line 129
    goto :goto_2

    .line 130
    :cond_4
    move v7, v2

    .line 131
    :goto_2
    iput-boolean v7, v5, Lcom/tencent/liteav/g;->W:Z

    .line 132
    .line 133
    if-ne v6, v3, :cond_5

    .line 134
    .line 135
    move v6, v3

    .line 136
    goto :goto_3

    .line 137
    :cond_5
    move v6, v2

    .line 138
    :goto_3
    iput-boolean v6, v5, Lcom/tencent/liteav/g;->U:Z

    .line 139
    .line 140
    iget-object v4, v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 141
    .line 142
    invoke-virtual {v4, v5}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/g;)V

    .line 143
    .line 144
    .line 145
    const v4, 0x9c6e

    .line 146
    .line 147
    .line 148
    const/4 v5, 0x2

    .line 149
    invoke-static {v4, v3, v5}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a(III)V

    .line 150
    .line 151
    .line 152
    iget-object v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 153
    .line 154
    invoke-static {v4, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2002(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Z)Z

    .line 155
    .line 156
    .line 157
    iget-object v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 158
    .line 159
    invoke-static {v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2100(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$DisplayOrientationDetector;

    .line 160
    .line 161
    .line 162
    move-result-object v4

    .line 163
    invoke-virtual {v4}, Landroid/view/OrientationEventListener;->enable()V

    .line 164
    .line 165
    .line 166
    iget-object v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 167
    .line 168
    invoke-static {v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 169
    .line 170
    .line 171
    iget-object v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 172
    .line 173
    invoke-virtual {v4, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableVideoStream(Z)V

    .line 174
    .line 175
    .line 176
    iget-object v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 177
    .line 178
    const/4 v5, 0x0

    .line 179
    if-eqz v4, :cond_6

    .line 180
    .line 181
    invoke-virtual {v4}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->getSurfaceView()Landroid/view/SurfaceView;

    .line 182
    .line 183
    .line 184
    move-result-object v4

    .line 185
    goto :goto_4

    .line 186
    :cond_6
    move-object v4, v5

    .line 187
    :goto_4
    if-eqz v4, :cond_8

    .line 188
    .line 189
    if-nez v0, :cond_7

    .line 190
    .line 191
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 192
    .line 193
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    if-ne v0, v1, :cond_7

    .line 198
    .line 199
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 200
    .line 201
    sget-object v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;->CAMERA:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 202
    .line 203
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1502(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;)Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 204
    .line 205
    .line 206
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 207
    .line 208
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 209
    .line 210
    invoke-virtual {v0, v5}, Lcom/tencent/liteav/d;->a(Lcom/tencent/rtmp/ui/TXCloudVideoView;)V

    .line 211
    .line 212
    .line 213
    goto :goto_5

    .line 214
    :cond_7
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 215
    .line 216
    const-string v1, "startLocalPreview with surface view when is started"

    .line 217
    .line 218
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    goto :goto_5

    .line 222
    :cond_8
    if-nez v0, :cond_9

    .line 223
    .line 224
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 225
    .line 226
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    if-ne v0, v1, :cond_9

    .line 231
    .line 232
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 233
    .line 234
    sget-object v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;->CAMERA:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 235
    .line 236
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1502(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;)Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 237
    .line 238
    .line 239
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 240
    .line 241
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 242
    .line 243
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 244
    .line 245
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/d;->a(Lcom/tencent/rtmp/ui/TXCloudVideoView;)V

    .line 246
    .line 247
    .line 248
    goto :goto_5

    .line 249
    :cond_9
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 250
    .line 251
    const-string v1, "startLocalPreview with view view when is started"

    .line 252
    .line 253
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    :goto_5
    new-array v0, v3, [Landroid/view/Surface;

    .line 257
    .line 258
    new-instance v1, Lcom/tencent/liteav/basic/util/d;

    .line 259
    .line 260
    invoke-direct {v1}, Lcom/tencent/liteav/basic/util/d;-><init>()V

    .line 261
    .line 262
    .line 263
    iget-object v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 264
    .line 265
    new-instance v5, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15$2;

    .line 266
    .line 267
    invoke-direct {v5, p0, v4, v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15$2;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;Landroid/view/SurfaceView;[Landroid/view/Surface;Lcom/tencent/liteav/basic/util/d;)V

    .line 268
    .line 269
    .line 270
    invoke-static {v3, v5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2300(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/Runnable;)V

    .line 271
    .line 272
    .line 273
    aget-object v0, v0, v2

    .line 274
    .line 275
    if-eqz v0, :cond_a

    .line 276
    .line 277
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 278
    .line 279
    iget-object v2, v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 280
    .line 281
    invoke-virtual {v2, v0}, Lcom/tencent/liteav/d;->a(Landroid/view/Surface;)V

    .line 282
    .line 283
    .line 284
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 285
    .line 286
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 287
    .line 288
    iget v0, v1, Lcom/tencent/liteav/basic/util/d;->a:I

    .line 289
    .line 290
    iget v1, v1, Lcom/tencent/liteav/basic/util/d;->b:I

    .line 291
    .line 292
    invoke-virtual {p0, v0, v1}, Lcom/tencent/liteav/d;->a(II)V

    .line 293
    .line 294
    .line 295
    :cond_a
    return-void
.end method
