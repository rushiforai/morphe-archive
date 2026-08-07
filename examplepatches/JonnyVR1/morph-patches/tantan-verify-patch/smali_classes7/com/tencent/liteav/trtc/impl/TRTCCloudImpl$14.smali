.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->switchRoom(Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$config:Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->val$config:Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 14

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->val$config:Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;

    .line 7
    .line 8
    iget v1, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;->roomId:I

    .line 9
    .line 10
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->val$config:Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;

    .line 15
    .line 16
    iget-object v2, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;->strRoomId:Ljava/lang/String;

    .line 17
    .line 18
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "switchRoom roomId:%d, strRoomId:%s"

    .line 23
    .line 24
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, " self:"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 50
    .line 51
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    const/4 v1, 0x1

    .line 55
    const-string v2, ""

    .line 56
    .line 57
    const/4 v3, 0x0

    .line 58
    invoke-static {v1, v0, v2, v3}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 62
    .line 63
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->val$config:Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;

    .line 64
    .line 65
    iget v1, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;->roomId:I

    .line 66
    .line 67
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_0

    .line 72
    .line 73
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->val$config:Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;

    .line 74
    .line 75
    iget-object v0, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;->strRoomId:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_0

    .line 82
    .line 83
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 84
    .line 85
    const-string v1, "Switch room failed with invalid room id"

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 91
    .line 92
    new-instance v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14$1;

    .line 93
    .line 94
    invoke-direct {v1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14$1;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 102
    .line 103
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->val$config:Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;

    .line 104
    .line 105
    iget v1, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;->roomId:I

    .line 106
    .line 107
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_1

    .line 112
    .line 113
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->val$config:Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;

    .line 114
    .line 115
    iget v0, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;->roomId:I

    .line 116
    .line 117
    int-to-long v0, v0

    .line 118
    iget-object v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 119
    .line 120
    iget-object v4, v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 121
    .line 122
    iget-wide v4, v4, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->roomId:J

    .line 123
    .line 124
    cmp-long v0, v0, v4

    .line 125
    .line 126
    if-eqz v0, :cond_2

    .line 127
    .line 128
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 129
    .line 130
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->val$config:Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;

    .line 131
    .line 132
    iget v1, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;->roomId:I

    .line 133
    .line 134
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)Z

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    if-nez v0, :cond_3

    .line 139
    .line 140
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->val$config:Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;

    .line 141
    .line 142
    iget-object v0, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;->strRoomId:Ljava/lang/String;

    .line 143
    .line 144
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 145
    .line 146
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 147
    .line 148
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->strRoomId:Ljava/lang/String;

    .line 149
    .line 150
    if-ne v0, v1, :cond_3

    .line 151
    .line 152
    :cond_2
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 153
    .line 154
    const-string v1, "Switch room to the same one"

    .line 155
    .line 156
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 160
    .line 161
    new-instance v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14$2;

    .line 162
    .line 163
    invoke-direct {v1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14$2;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 167
    .line 168
    .line 169
    return-void

    .line 170
    :cond_3
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 171
    .line 172
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 173
    .line 174
    new-instance v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14$3;

    .line 175
    .line 176
    invoke-direct {v1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14$3;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->forEachUser(Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserAction;)V

    .line 180
    .line 181
    .line 182
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 183
    .line 184
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 185
    .line 186
    invoke-virtual {v0}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->clearUserList()V

    .line 187
    .line 188
    .line 189
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 190
    .line 191
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->val$config:Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;

    .line 192
    .line 193
    iget v1, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;->roomId:I

    .line 194
    .line 195
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)Z

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->val$config:Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;

    .line 200
    .line 201
    if-eqz v0, :cond_5

    .line 202
    .line 203
    iget v3, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;->roomId:I

    .line 204
    .line 205
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 206
    .line 207
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 208
    .line 209
    int-to-long v4, v3

    .line 210
    iput-wide v4, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->roomId:J

    .line 211
    .line 212
    iput-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->strRoomId:Ljava/lang/String;

    .line 213
    .line 214
    :cond_4
    move-object v11, v2

    .line 215
    goto :goto_0

    .line 216
    :cond_5
    iget-object v0, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;->strRoomId:Ljava/lang/String;

    .line 217
    .line 218
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    if-nez v0, :cond_4

    .line 223
    .line 224
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 225
    .line 226
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 227
    .line 228
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->val$config:Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;

    .line 229
    .line 230
    iget-object v1, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;->strRoomId:Ljava/lang/String;

    .line 231
    .line 232
    iput-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->strRoomId:Ljava/lang/String;

    .line 233
    .line 234
    const-wide/16 v4, -0x1

    .line 235
    .line 236
    iput-wide v4, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->roomId:J

    .line 237
    .line 238
    move-object v11, v1

    .line 239
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->val$config:Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;

    .line 240
    .line 241
    iget-object v0, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;->userSig:Ljava/lang/String;

    .line 242
    .line 243
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 244
    .line 245
    .line 246
    move-result v0

    .line 247
    if-nez v0, :cond_6

    .line 248
    .line 249
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 250
    .line 251
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 252
    .line 253
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->val$config:Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;

    .line 254
    .line 255
    iget-object v1, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;->userSig:Ljava/lang/String;

    .line 256
    .line 257
    iput-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->userSig:Ljava/lang/String;

    .line 258
    .line 259
    move-object v12, v1

    .line 260
    goto :goto_1

    .line 261
    :cond_6
    move-object v12, v2

    .line 262
    :goto_1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->val$config:Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;

    .line 263
    .line 264
    iget-object v0, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;->privateMapKey:Ljava/lang/String;

    .line 265
    .line 266
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 267
    .line 268
    .line 269
    move-result v0

    .line 270
    if-nez v0, :cond_7

    .line 271
    .line 272
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 273
    .line 274
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 275
    .line 276
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->val$config:Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;

    .line 277
    .line 278
    iget-object v2, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCSwitchRoomConfig;->privateMapKey:Ljava/lang/String;

    .line 279
    .line 280
    iput-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->privateMapKey:Ljava/lang/String;

    .line 281
    .line 282
    :cond_7
    move-object v13, v2

    .line 283
    iget-object v6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$14;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 284
    .line 285
    iget-wide v7, v6, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 286
    .line 287
    int-to-long v9, v3

    .line 288
    invoke-virtual/range {v6 .. v13}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeSwitchRoom(JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    return-void
.end method
