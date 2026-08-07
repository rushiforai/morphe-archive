.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->startScreenCapture(Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;Lcom/tencent/trtc/TRTCCloudDef$TRTCScreenShareParams;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$param:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

.field final synthetic val$screenShareParams:Lcom/tencent/trtc/TRTCCloudDef$TRTCScreenShareParams;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;Lcom/tencent/trtc/TRTCCloudDef$TRTCScreenShareParams;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->val$param:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->val$screenShareParams:Lcom/tencent/trtc/TRTCCloudDef$TRTCScreenShareParams;

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
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

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
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 10
    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    const-string p0, "Has started capturing, ignore startScreenCapture"

    .line 14
    .line 15
    invoke-static {v2, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$3200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget-object v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;->SCREEN:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 20
    .line 21
    invoke-static {v2, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1502(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;)Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$3302(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)I

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2100(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$DisplayOrientationDetector;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Landroid/view/OrientationEventListener;->disable()V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->val$param:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 40
    .line 41
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 42
    .line 43
    const/4 v3, 0x1

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    invoke-static {v2, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$3402(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Z)Z

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 50
    .line 51
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->val$param:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 52
    .line 53
    invoke-static {v0, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$3500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    invoke-static {v2, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$3402(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Z)Z

    .line 58
    .line 59
    .line 60
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 61
    .line 62
    iget v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentRole:I

    .line 63
    .line 64
    const/16 v4, 0x15

    .line 65
    .line 66
    if-ne v2, v4, :cond_2

    .line 67
    .line 68
    new-instance v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25$1;

    .line 69
    .line 70
    invoke-direct {v2, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25$1;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 77
    .line 78
    const-string v2, "ignore startLocalPreview for audience"

    .line 79
    .line 80
    invoke-virtual {v0, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    const-string v2, "start screen capture self:"

    .line 86
    .line 87
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 91
    .line 92
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 104
    .line 105
    invoke-virtual {v2, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    const-string v2, ""

    .line 109
    .line 110
    invoke-static {v3, v0, v2, v1}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 114
    .line 115
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/d;->a(I)V

    .line 118
    .line 119
    .line 120
    iget-object v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 121
    .line 122
    iget-object v0, v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 123
    .line 124
    iget v1, v0, Lcom/tencent/liteav/g;->l:I

    .line 125
    .line 126
    if-eq v1, v3, :cond_4

    .line 127
    .line 128
    const/4 v2, 0x3

    .line 129
    if-ne v1, v2, :cond_3

    .line 130
    .line 131
    goto :goto_1

    .line 132
    :cond_3
    iget v6, v0, Lcom/tencent/liteav/g;->b:I

    .line 133
    .line 134
    iget v7, v0, Lcom/tencent/liteav/g;->a:I

    .line 135
    .line 136
    iget v8, v0, Lcom/tencent/liteav/g;->h:I

    .line 137
    .line 138
    iget v9, v0, Lcom/tencent/liteav/g;->c:I

    .line 139
    .line 140
    iget-boolean v10, v0, Lcom/tencent/liteav/g;->p:Z

    .line 141
    .line 142
    iget v11, v0, Lcom/tencent/liteav/g;->e:I

    .line 143
    .line 144
    const/4 v5, 0x0

    .line 145
    invoke-static/range {v4 .. v11}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$3600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ZIIIIZI)V

    .line 146
    .line 147
    .line 148
    goto :goto_2

    .line 149
    :cond_4
    :goto_1
    iget v6, v0, Lcom/tencent/liteav/g;->a:I

    .line 150
    .line 151
    iget v7, v0, Lcom/tencent/liteav/g;->b:I

    .line 152
    .line 153
    iget v8, v0, Lcom/tencent/liteav/g;->h:I

    .line 154
    .line 155
    iget v9, v0, Lcom/tencent/liteav/g;->c:I

    .line 156
    .line 157
    iget-boolean v10, v0, Lcom/tencent/liteav/g;->p:Z

    .line 158
    .line 159
    iget v11, v0, Lcom/tencent/liteav/g;->e:I

    .line 160
    .line 161
    const/4 v5, 0x1

    .line 162
    invoke-static/range {v4 .. v11}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$3600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ZIIIIZI)V

    .line 163
    .line 164
    .line 165
    :goto_2
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 166
    .line 167
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    iget v1, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoResolution:I

    .line 172
    .line 173
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 174
    .line 175
    invoke-static {v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    iget v2, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoResolutionMode:I

    .line 180
    .line 181
    invoke-static {v0, v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$3700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;II)Lcom/tencent/liteav/g$a;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    iget-object v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 186
    .line 187
    iget v5, v0, Lcom/tencent/liteav/g$a;->a:I

    .line 188
    .line 189
    iget v6, v0, Lcom/tencent/liteav/g$a;->b:I

    .line 190
    .line 191
    invoke-static {v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    iget v7, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoFps:I

    .line 196
    .line 197
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 198
    .line 199
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    iget v8, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoBitrate:I

    .line 204
    .line 205
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 206
    .line 207
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    iget v9, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->minVideoBitrate:I

    .line 212
    .line 213
    invoke-static/range {v4 .. v9}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$3800(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IIIII)V

    .line 214
    .line 215
    .line 216
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 217
    .line 218
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 219
    .line 220
    const/4 v2, 0x0

    .line 221
    iput-object v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->localView:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 222
    .line 223
    invoke-virtual {v0, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableVideoStream(Z)V

    .line 224
    .line 225
    .line 226
    const v0, 0x9c6e

    .line 227
    .line 228
    .line 229
    const/4 v1, 0x7

    .line 230
    invoke-static {v0, v3, v1}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a(III)V

    .line 231
    .line 232
    .line 233
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 234
    .line 235
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 236
    .line 237
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/screencapture/a$a;)V

    .line 238
    .line 239
    .line 240
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 241
    .line 242
    new-instance v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25$2;

    .line 243
    .line 244
    invoke-direct {v1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25$2;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;)V

    .line 245
    .line 246
    .line 247
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 248
    .line 249
    .line 250
    return-void
.end method
