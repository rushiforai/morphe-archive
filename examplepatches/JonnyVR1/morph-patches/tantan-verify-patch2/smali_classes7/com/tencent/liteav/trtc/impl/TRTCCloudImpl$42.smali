.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableEncSmallVideoStream(ZLcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$enable:Z

.field final synthetic val$param:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ZLcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->val$enable:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->val$param:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

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
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v3, "enableEncSmallVideoStream "

    .line 8
    .line 9
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-boolean v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->val$enable:Z

    .line 13
    .line 14
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 25
    .line 26
    iget-boolean v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->val$enable:Z

    .line 27
    .line 28
    invoke-static {v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$602(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Z)Z

    .line 29
    .line 30
    .line 31
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 32
    .line 33
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableNetworkSmallStream(Z)V

    .line 38
    .line 39
    .line 40
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->val$param:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 41
    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 45
    .line 46
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->val$param:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 51
    .line 52
    iget v2, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoBitrate:I

    .line 53
    .line 54
    iput v2, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoBitrate:I

    .line 55
    .line 56
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 57
    .line 58
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->val$param:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 63
    .line 64
    iget v2, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->minVideoBitrate:I

    .line 65
    .line 66
    iput v2, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->minVideoBitrate:I

    .line 67
    .line 68
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 69
    .line 70
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->val$param:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 75
    .line 76
    iget v2, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoFps:I

    .line 77
    .line 78
    iput v2, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoFps:I

    .line 79
    .line 80
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 81
    .line 82
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->val$param:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 87
    .line 88
    iget v2, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoResolution:I

    .line 89
    .line 90
    iput v2, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoResolution:I

    .line 91
    .line 92
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 93
    .line 94
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->val$param:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 99
    .line 100
    iget v2, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoResolutionMode:I

    .line 101
    .line 102
    iput v2, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoResolutionMode:I

    .line 103
    .line 104
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 105
    .line 106
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$4200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Landroid/os/Bundle;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->val$param:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 111
    .line 112
    iget v2, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoFps:I

    .line 113
    .line 114
    const-string v3, "config_fps"

    .line 115
    .line 116
    invoke-virtual {v1, v3, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 117
    .line 118
    .line 119
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 120
    .line 121
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$4200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Landroid/os/Bundle;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->val$param:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 126
    .line 127
    iget-boolean v2, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->enableAdjustRes:Z

    .line 128
    .line 129
    const-string v3, "config_adjust_resolution"

    .line 130
    .line 131
    invoke-virtual {v1, v3, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 132
    .line 133
    .line 134
    :cond_0
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 135
    .line 136
    iget-object v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 137
    .line 138
    iget-boolean v3, v2, Lcom/tencent/liteav/g;->p:Z

    .line 139
    .line 140
    iget v2, v2, Lcom/tencent/liteav/g;->i:I

    .line 141
    .line 142
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    sget-object v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;->SCREEN:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 147
    .line 148
    const/4 v5, 0x3

    .line 149
    if-ne v1, v4, :cond_2

    .line 150
    .line 151
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 152
    .line 153
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$3400(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Z

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    if-eqz v1, :cond_1

    .line 158
    .line 159
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 160
    .line 161
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    const/16 v2, 0xa

    .line 166
    .line 167
    iput v2, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoFps:I

    .line 168
    .line 169
    :cond_1
    const/4 v3, 0x0

    .line 170
    move v12, v5

    .line 171
    :goto_0
    move/from16 v19, v3

    .line 172
    .line 173
    goto :goto_1

    .line 174
    :cond_2
    move v12, v2

    .line 175
    goto :goto_0

    .line 176
    :goto_1
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 177
    .line 178
    iget-object v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 179
    .line 180
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    iget v3, v3, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoResolution:I

    .line 185
    .line 186
    iget-object v4, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 187
    .line 188
    invoke-static {v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 189
    .line 190
    .line 191
    move-result-object v4

    .line 192
    iget v4, v4, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoResolutionMode:I

    .line 193
    .line 194
    invoke-static {v1, v3, v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$3700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;II)Lcom/tencent/liteav/g$a;

    .line 195
    .line 196
    .line 197
    move-result-object v1

    .line 198
    iput-object v1, v2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->smallEncSize:Lcom/tencent/liteav/g$a;

    .line 199
    .line 200
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 201
    .line 202
    iget-object v6, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 203
    .line 204
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Z

    .line 205
    .line 206
    .line 207
    move-result v7

    .line 208
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 209
    .line 210
    iget-object v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 211
    .line 212
    iget-object v2, v2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->smallEncSize:Lcom/tencent/liteav/g$a;

    .line 213
    .line 214
    iget v8, v2, Lcom/tencent/liteav/g$a;->a:I

    .line 215
    .line 216
    iget v9, v2, Lcom/tencent/liteav/g$a;->b:I

    .line 217
    .line 218
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    iget v10, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoFps:I

    .line 223
    .line 224
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 225
    .line 226
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    iget v11, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoBitrate:I

    .line 231
    .line 232
    invoke-virtual/range {v6 .. v12}, Lcom/tencent/liteav/d;->a(ZIIIII)I

    .line 233
    .line 234
    .line 235
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 236
    .line 237
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Z

    .line 238
    .line 239
    .line 240
    move-result v1

    .line 241
    iget-object v6, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 242
    .line 243
    if-eqz v1, :cond_3

    .line 244
    .line 245
    iget-object v1, v6, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 246
    .line 247
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->smallEncSize:Lcom/tencent/liteav/g$a;

    .line 248
    .line 249
    iget v15, v1, Lcom/tencent/liteav/g$a;->a:I

    .line 250
    .line 251
    iget v1, v1, Lcom/tencent/liteav/g$a;->b:I

    .line 252
    .line 253
    invoke-static {v6}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 254
    .line 255
    .line 256
    move-result-object v2

    .line 257
    iget v2, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoFps:I

    .line 258
    .line 259
    iget-object v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 260
    .line 261
    invoke-static {v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 262
    .line 263
    .line 264
    move-result-object v3

    .line 265
    iget v3, v3, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoBitrate:I

    .line 266
    .line 267
    iget-object v4, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 268
    .line 269
    invoke-static {v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 270
    .line 271
    .line 272
    move-result-object v4

    .line 273
    iget v4, v4, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->minVideoBitrate:I

    .line 274
    .line 275
    const/4 v14, 0x3

    .line 276
    move/from16 v16, v1

    .line 277
    .line 278
    move/from16 v17, v2

    .line 279
    .line 280
    move/from16 v18, v3

    .line 281
    .line 282
    move/from16 v20, v4

    .line 283
    .line 284
    move-object v13, v6

    .line 285
    invoke-static/range {v13 .. v20}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IIIIIZI)V

    .line 286
    .line 287
    .line 288
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 289
    .line 290
    invoke-static {v0, v5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 291
    .line 292
    .line 293
    return-void

    .line 294
    :cond_3
    iget-object v1, v6, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 295
    .line 296
    iget-boolean v13, v1, Lcom/tencent/liteav/g;->p:Z

    .line 297
    .line 298
    const/4 v14, 0x0

    .line 299
    const/4 v7, 0x3

    .line 300
    const/4 v8, 0x0

    .line 301
    const/4 v9, 0x0

    .line 302
    const/4 v10, 0x0

    .line 303
    const/4 v11, 0x0

    .line 304
    const/4 v12, 0x0

    .line 305
    invoke-static/range {v6 .. v14}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$800(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IIIIIIZI)V

    .line 306
    .line 307
    .line 308
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$42;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 309
    .line 310
    invoke-static {v0, v5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$4400(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 311
    .line 312
    .line 313
    return-void
.end method
