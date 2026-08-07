.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->stopScreenCapture()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;->SCREEN:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 8
    .line 9
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 10
    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    const-string p0, "stopScreenCapture been ignored for Screen capture is not started"

    .line 14
    .line 15
    invoke-virtual {v2, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget-object v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;->NONE:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 20
    .line 21
    invoke-static {v2, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1502(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;)Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 22
    .line 23
    .line 24
    new-instance v0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v1, "stopScreenCapture self:"

    .line 27
    .line 28
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 45
    .line 46
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    const/4 v1, 0x1

    .line 50
    const-string v2, ""

    .line 51
    .line 52
    const/4 v3, 0x0

    .line 53
    invoke-static {v1, v0, v2, v3}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 57
    .line 58
    new-instance v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26$1;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26$1;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/tencent/liteav/d;->k()V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 74
    .line 75
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 76
    .line 77
    const/4 v2, 0x0

    .line 78
    iput-object v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->localView:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 79
    .line 80
    invoke-virtual {v0, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableVideoStream(Z)V

    .line 81
    .line 82
    .line 83
    const v0, 0x9c6e

    .line 84
    .line 85
    .line 86
    const/4 v1, 0x7

    .line 87
    invoke-static {v0, v3, v1}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a(III)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 91
    .line 92
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 93
    .line 94
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$4100(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Landroid/os/Bundle;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 99
    .line 100
    iget-object v2, v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 101
    .line 102
    iget v2, v2, Lcom/tencent/liteav/g;->h:I

    .line 103
    .line 104
    const-string v3, "config_fps"

    .line 105
    .line 106
    invoke-virtual {v0, v3, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    iput v0, v1, Lcom/tencent/liteav/g;->h:I

    .line 111
    .line 112
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 113
    .line 114
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 115
    .line 116
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$4100(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Landroid/os/Bundle;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 121
    .line 122
    iget-object v2, v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 123
    .line 124
    iget v2, v2, Lcom/tencent/liteav/g;->i:I

    .line 125
    .line 126
    const-string v4, "config_gop"

    .line 127
    .line 128
    invoke-virtual {v0, v4, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    iput v0, v1, Lcom/tencent/liteav/g;->i:I

    .line 133
    .line 134
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 135
    .line 136
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 137
    .line 138
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$4100(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Landroid/os/Bundle;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 143
    .line 144
    iget-object v2, v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 145
    .line 146
    iget-boolean v2, v2, Lcom/tencent/liteav/g;->p:Z

    .line 147
    .line 148
    const-string v4, "config_adjust_resolution"

    .line 149
    .line 150
    invoke-virtual {v0, v4, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    iput-boolean v0, v1, Lcom/tencent/liteav/g;->p:Z

    .line 155
    .line 156
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 157
    .line 158
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 163
    .line 164
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$4200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Landroid/os/Bundle;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 169
    .line 170
    invoke-static {v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    iget v2, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoFps:I

    .line 175
    .line 176
    invoke-virtual {v1, v3, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    iput v1, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoFps:I

    .line 181
    .line 182
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 183
    .line 184
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 189
    .line 190
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$4200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Landroid/os/Bundle;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 195
    .line 196
    invoke-static {v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    iget-boolean v2, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->enableAdjustRes:Z

    .line 201
    .line 202
    invoke-virtual {v1, v4, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 203
    .line 204
    .line 205
    move-result v1

    .line 206
    iput-boolean v1, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->enableAdjustRes:Z

    .line 207
    .line 208
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 209
    .line 210
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 211
    .line 212
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 213
    .line 214
    iget v1, v1, Lcom/tencent/liteav/g;->h:I

    .line 215
    .line 216
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 217
    .line 218
    .line 219
    move-result-object v1

    .line 220
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 221
    .line 222
    iget-object v2, v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 223
    .line 224
    iget v2, v2, Lcom/tencent/liteav/g;->i:I

    .line 225
    .line 226
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 227
    .line 228
    .line 229
    move-result-object v2

    .line 230
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$26;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 231
    .line 232
    invoke-static {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    iget p0, p0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoFps:I

    .line 237
    .line 238
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 239
    .line 240
    .line 241
    move-result-object p0

    .line 242
    filled-new-array {v1, v2, p0}, [Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    const-string v1, "restore big encoder\'s fps: %d, gop: %d, small encoder\'s fps: %d"

    .line 247
    .line 248
    invoke-static {v0, v1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object p0

    .line 252
    const-string v0, "TRTCCloudImpl"

    .line 253
    .line 254
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 255
    .line 256
    .line 257
    return-void
.end method
