.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->muteLocalVideo(ZLcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$cloud:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$mute:Z


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ZLcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->val$mute:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->val$cloud:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

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
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 15
    .line 16
    iget-boolean v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->val$mute:Z

    .line 17
    .line 18
    iget-object v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->val$cloud:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 19
    .line 20
    if-nez v3, :cond_2

    .line 21
    .line 22
    const/4 v3, 0x3

    .line 23
    if-eq v0, v4, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 26
    .line 27
    const/4 v4, 0x0

    .line 28
    invoke-virtual {v0, v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableVideoStream(Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 32
    .line 33
    iget-object v4, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 34
    .line 35
    monitor-enter v4

    .line 36
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 39
    .line 40
    iget-object v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->val$cloud:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 41
    .line 42
    invoke-virtual {v0, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 48
    .line 49
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    iget-object v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->val$cloud:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 54
    .line 55
    invoke-virtual {v0, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentPublishClouds:Ljava/util/HashMap;

    .line 61
    .line 62
    const/4 v2, 0x7

    .line 63
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    iget-object v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->val$cloud:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 68
    .line 69
    invoke-virtual {v0, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 73
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 74
    .line 75
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 76
    .line 77
    invoke-virtual {v2}, Lcom/tencent/liteav/d;->h()Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    invoke-virtual {v0, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableNetworkBlackStream(Z)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 85
    .line 86
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Z

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    invoke-virtual {v0, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableNetworkSmallStream(Z)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 94
    .line 95
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)I

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    iget-object v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 100
    .line 101
    invoke-static {v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$300(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)I

    .line 102
    .line 103
    .line 104
    move-result v4

    .line 105
    invoke-static {v0, v2, v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$400(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;II)V

    .line 106
    .line 107
    .line 108
    iget-object v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 109
    .line 110
    iget-object v0, v5, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 111
    .line 112
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->bigEncSize:Lcom/tencent/liteav/g$a;

    .line 113
    .line 114
    iget v7, v0, Lcom/tencent/liteav/g$a;->a:I

    .line 115
    .line 116
    iget v8, v0, Lcom/tencent/liteav/g$a;->b:I

    .line 117
    .line 118
    iget-object v0, v5, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 119
    .line 120
    iget v9, v0, Lcom/tencent/liteav/g;->h:I

    .line 121
    .line 122
    iget v10, v0, Lcom/tencent/liteav/g;->c:I

    .line 123
    .line 124
    iget-boolean v11, v0, Lcom/tencent/liteav/g;->p:Z

    .line 125
    .line 126
    iget v12, v0, Lcom/tencent/liteav/g;->e:I

    .line 127
    .line 128
    const/4 v6, 0x2

    .line 129
    invoke-static/range {v5 .. v12}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IIIIIZI)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 133
    .line 134
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Z

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    iget-object v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 139
    .line 140
    if-eqz v0, :cond_0

    .line 141
    .line 142
    iget-object v0, v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 143
    .line 144
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->smallEncSize:Lcom/tencent/liteav/g$a;

    .line 145
    .line 146
    iget v6, v0, Lcom/tencent/liteav/g$a;->a:I

    .line 147
    .line 148
    iget v7, v0, Lcom/tencent/liteav/g$a;->b:I

    .line 149
    .line 150
    invoke-static {v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    iget v8, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoFps:I

    .line 155
    .line 156
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 157
    .line 158
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    iget v9, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoBitrate:I

    .line 163
    .line 164
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 165
    .line 166
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 167
    .line 168
    iget-boolean v10, v2, Lcom/tencent/liteav/g;->p:Z

    .line 169
    .line 170
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    iget v11, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->minVideoBitrate:I

    .line 175
    .line 176
    const/4 v5, 0x3

    .line 177
    invoke-static/range {v4 .. v11}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IIIIIZI)V

    .line 178
    .line 179
    .line 180
    goto :goto_0

    .line 181
    :cond_0
    iget-object v0, v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 182
    .line 183
    iget-boolean v11, v0, Lcom/tencent/liteav/g;->p:Z

    .line 184
    .line 185
    const/4 v12, 0x0

    .line 186
    const/4 v5, 0x3

    .line 187
    const/4 v6, 0x0

    .line 188
    const/4 v7, 0x0

    .line 189
    const/4 v8, 0x0

    .line 190
    const/4 v9, 0x0

    .line 191
    const/4 v10, 0x0

    .line 192
    invoke-static/range {v4 .. v12}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$800(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IIIIIIZI)V

    .line 193
    .line 194
    .line 195
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 196
    .line 197
    const/4 v2, 0x1

    .line 198
    invoke-virtual {v0, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableVideoStream(Z)V

    .line 199
    .line 200
    .line 201
    goto :goto_1

    .line 202
    :catchall_0
    move-exception v0

    .line 203
    move-object p0, v0

    .line 204
    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 205
    throw p0

    .line 206
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 207
    .line 208
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 209
    .line 210
    invoke-virtual {v0}, Lcom/tencent/liteav/d;->g()V

    .line 211
    .line 212
    .line 213
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 214
    .line 215
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 216
    .line 217
    iget-boolean v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->val$mute:Z

    .line 218
    .line 219
    iput-boolean v4, v2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->muteLocalVideo:Z

    .line 220
    .line 221
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 222
    .line 223
    invoke-virtual {v2}, Lcom/tencent/liteav/d;->h()Z

    .line 224
    .line 225
    .line 226
    move-result v2

    .line 227
    invoke-virtual {v0, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableNetworkBlackStream(Z)V

    .line 228
    .line 229
    .line 230
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 231
    .line 232
    iget-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->val$mute:Z

    .line 233
    .line 234
    invoke-static {v0, v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$4300(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IZ)V

    .line 235
    .line 236
    .line 237
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 238
    .line 239
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 240
    .line 241
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/d;->j(I)V

    .line 242
    .line 243
    .line 244
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 245
    .line 246
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Z

    .line 247
    .line 248
    .line 249
    move-result v0

    .line 250
    if-eqz v0, :cond_4

    .line 251
    .line 252
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 253
    .line 254
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 255
    .line 256
    invoke-virtual {p0, v3}, Lcom/tencent/liteav/d;->j(I)V

    .line 257
    .line 258
    .line 259
    return-void

    .line 260
    :cond_2
    if-ne v0, v4, :cond_4

    .line 261
    .line 262
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 263
    .line 264
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 265
    .line 266
    iput-boolean v3, v2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->muteLocalVideo:Z

    .line 267
    .line 268
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 269
    .line 270
    invoke-virtual {v2}, Lcom/tencent/liteav/d;->h()Z

    .line 271
    .line 272
    .line 273
    move-result v2

    .line 274
    invoke-virtual {v0, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableNetworkBlackStream(Z)V

    .line 275
    .line 276
    .line 277
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 278
    .line 279
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 280
    .line 281
    iget-object v2, v2, Lcom/tencent/liteav/g;->A:Landroid/graphics/Bitmap;

    .line 282
    .line 283
    if-eqz v2, :cond_3

    .line 284
    .line 285
    iget-object p0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 286
    .line 287
    invoke-virtual {p0}, Lcom/tencent/liteav/d;->f()V

    .line 288
    .line 289
    .line 290
    return-void

    .line 291
    :cond_3
    iget-boolean p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$31;->val$mute:Z

    .line 292
    .line 293
    invoke-static {v0, v1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$4300(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IZ)V

    .line 294
    .line 295
    .line 296
    :cond_4
    return-void
.end method
