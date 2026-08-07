.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

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
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 4
    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "onAVMemberExit "

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 13
    .line 14
    iget-wide v2, v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->val$tinyID:J

    .line 15
    .line 16
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v2, ", "

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget-object v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 25
    .line 26
    iget-object v3, v3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->val$userID:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 35
    .line 36
    iget v2, v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->val$videoState:I

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 49
    .line 50
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 51
    .line 52
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mTRTCListener:Lcom/tencent/trtc/TRTCCloudListener;

    .line 53
    .line 54
    if-eqz v1, :cond_4

    .line 55
    .line 56
    iget v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->val$videoState:I

    .line 57
    .line 58
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->hasAudio(I)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    const-string v2, ""

    .line 63
    .line 64
    const-string v3, " self:"

    .line 65
    .line 66
    const/4 v4, 0x2

    .line 67
    const/4 v5, 0x0

    .line 68
    if-eqz v0, :cond_0

    .line 69
    .line 70
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 71
    .line 72
    iget v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->val$videoState:I

    .line 73
    .line 74
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->isMuteAudio(I)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_0

    .line 79
    .line 80
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 81
    .line 82
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->val$userID:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v1, v0, v5}, Lcom/tencent/trtc/TRTCCloudListener;->onUserAudioAvailable(Ljava/lang/String;Z)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 88
    .line 89
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 90
    .line 91
    iget-object v6, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 92
    .line 93
    invoke-virtual {v6}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUserId()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v6

    .line 97
    iget-object v7, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 98
    .line 99
    iget-object v7, v7, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->val$userID:Ljava/lang/String;

    .line 100
    .line 101
    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 102
    .line 103
    filled-new-array {v7, v8}, [Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v7

    .line 107
    const-string v9, "[%s]audio Available[%b]"

    .line 108
    .line 109
    invoke-static {v9, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v7

    .line 113
    invoke-static {v0, v6, v5, v7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$8000(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;ILjava/lang/String;)V

    .line 114
    .line 115
    .line 116
    new-instance v0, Ljava/lang/StringBuilder;

    .line 117
    .line 118
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 119
    .line 120
    .line 121
    iget-object v6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 122
    .line 123
    iget-object v6, v6, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->val$userID:Ljava/lang/String;

    .line 124
    .line 125
    filled-new-array {v6, v8}, [Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v6

    .line 129
    const-string v7, "onUserAudioAvailable userID:%s, bAvailable:%b"

    .line 130
    .line 131
    invoke-static {v7, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v6

    .line 135
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    iget-object v6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 142
    .line 143
    iget-object v6, v6, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 144
    .line 145
    invoke-virtual {v6}, Ljava/lang/Object;->hashCode()I

    .line 146
    .line 147
    .line 148
    move-result v6

    .line 149
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-static {v4, v0, v2, v5}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 157
    .line 158
    .line 159
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 160
    .line 161
    iget v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->val$videoState:I

    .line 162
    .line 163
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->hasMainVideo(I)Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    if-nez v0, :cond_1

    .line 168
    .line 169
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 170
    .line 171
    iget v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->val$videoState:I

    .line 172
    .line 173
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->hasSmallVideo(I)Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-eqz v0, :cond_2

    .line 178
    .line 179
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 180
    .line 181
    iget v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->val$videoState:I

    .line 182
    .line 183
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->isMuteMainVideo(I)Z

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    if-nez v0, :cond_2

    .line 188
    .line 189
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 190
    .line 191
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->val$userID:Ljava/lang/String;

    .line 192
    .line 193
    invoke-virtual {v1, v0, v5}, Lcom/tencent/trtc/TRTCCloudListener;->onUserVideoAvailable(Ljava/lang/String;Z)V

    .line 194
    .line 195
    .line 196
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 197
    .line 198
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 199
    .line 200
    iget-object v6, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 201
    .line 202
    invoke-virtual {v6}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUserId()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v6

    .line 206
    iget-object v7, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 207
    .line 208
    iget-object v7, v7, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->val$userID:Ljava/lang/String;

    .line 209
    .line 210
    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 211
    .line 212
    filled-new-array {v7, v8}, [Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    move-result-object v7

    .line 216
    const-string v9, "[%s]video Available[%b]"

    .line 217
    .line 218
    invoke-static {v9, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v7

    .line 222
    invoke-static {v0, v6, v5, v7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$8000(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;ILjava/lang/String;)V

    .line 223
    .line 224
    .line 225
    new-instance v0, Ljava/lang/StringBuilder;

    .line 226
    .line 227
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 228
    .line 229
    .line 230
    iget-object v6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 231
    .line 232
    iget-object v6, v6, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->val$userID:Ljava/lang/String;

    .line 233
    .line 234
    filled-new-array {v6, v8}, [Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    move-result-object v6

    .line 238
    const-string v7, "onUserVideoAvailable userID:%s, bAvailable:%b"

    .line 239
    .line 240
    invoke-static {v7, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v6

    .line 244
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    .line 249
    .line 250
    iget-object v6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 251
    .line 252
    iget-object v6, v6, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 253
    .line 254
    invoke-virtual {v6}, Ljava/lang/Object;->hashCode()I

    .line 255
    .line 256
    .line 257
    move-result v6

    .line 258
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    invoke-static {v4, v0, v2, v5}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 266
    .line 267
    .line 268
    :cond_2
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 269
    .line 270
    iget v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->val$videoState:I

    .line 271
    .line 272
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->hasSubVideo(I)Z

    .line 273
    .line 274
    .line 275
    move-result v0

    .line 276
    if-eqz v0, :cond_3

    .line 277
    .line 278
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 279
    .line 280
    iget v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->val$videoState:I

    .line 281
    .line 282
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->isMuteSubVideo(I)Z

    .line 283
    .line 284
    .line 285
    move-result v0

    .line 286
    if-nez v0, :cond_3

    .line 287
    .line 288
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 289
    .line 290
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->val$userID:Ljava/lang/String;

    .line 291
    .line 292
    invoke-virtual {v1, v0, v5}, Lcom/tencent/trtc/TRTCCloudListener;->onUserSubStreamAvailable(Ljava/lang/String;Z)V

    .line 293
    .line 294
    .line 295
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 296
    .line 297
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 298
    .line 299
    iget-object v6, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 300
    .line 301
    invoke-virtual {v6}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUserId()Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object v6

    .line 305
    iget-object v7, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 306
    .line 307
    iget-object v7, v7, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->val$userID:Ljava/lang/String;

    .line 308
    .line 309
    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 310
    .line 311
    filled-new-array {v7, v8}, [Ljava/lang/Object;

    .line 312
    .line 313
    .line 314
    move-result-object v7

    .line 315
    const-string v9, "[%s]subVideo Available[%b]"

    .line 316
    .line 317
    invoke-static {v9, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object v7

    .line 321
    invoke-static {v0, v6, v5, v7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$8000(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;ILjava/lang/String;)V

    .line 322
    .line 323
    .line 324
    new-instance v0, Ljava/lang/StringBuilder;

    .line 325
    .line 326
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 327
    .line 328
    .line 329
    iget-object v6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 330
    .line 331
    iget-object v6, v6, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->val$userID:Ljava/lang/String;

    .line 332
    .line 333
    filled-new-array {v6, v8}, [Ljava/lang/Object;

    .line 334
    .line 335
    .line 336
    move-result-object v6

    .line 337
    const-string v7, "onUserSubStreamAvailable userID:%s, bAvailable:%b"

    .line 338
    .line 339
    invoke-static {v7, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 340
    .line 341
    .line 342
    move-result-object v6

    .line 343
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 344
    .line 345
    .line 346
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 347
    .line 348
    .line 349
    iget-object v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 350
    .line 351
    iget-object v3, v3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 352
    .line 353
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 354
    .line 355
    .line 356
    move-result v3

    .line 357
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 358
    .line 359
    .line 360
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    move-result-object v0

    .line 364
    invoke-static {v4, v0, v2, v5}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 365
    .line 366
    .line 367
    :cond_3
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;

    .line 368
    .line 369
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$139;->val$userID:Ljava/lang/String;

    .line 370
    .line 371
    invoke-virtual {v1, p0, v5}, Lcom/tencent/trtc/TRTCCloudListener;->onUserExit(Ljava/lang/String;I)V

    .line 372
    .line 373
    .line 374
    :cond_4
    return-void
.end method
