.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableCustomVideoCapture(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$enable:Z


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;->val$enable:Z

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
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;->val$enable:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;->NONE:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 12
    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 16
    .line 17
    const-string v0, "Has started capturing, ignore enableCustomVideoCapture"

    .line 18
    .line 19
    invoke-static {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$3200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-boolean v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;->val$enable:Z

    .line 24
    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget-object v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;->CUSTOM:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 34
    .line 35
    if-eq v0, v1, :cond_1

    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 39
    .line 40
    iget-boolean v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;->val$enable:Z

    .line 41
    .line 42
    if-eqz v1, :cond_2

    .line 43
    .line 44
    sget-object v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;->CUSTOM:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    sget-object v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;->NONE:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 48
    .line 49
    :goto_0
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1502(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;)Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 50
    .line 51
    .line 52
    iget-boolean v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;->val$enable:Z

    .line 53
    .line 54
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 55
    .line 56
    const/4 v2, 0x2

    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    iget-object v0, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 60
    .line 61
    iget v3, v0, Lcom/tencent/liteav/g;->R:I

    .line 62
    .line 63
    or-int/2addr v3, v2

    .line 64
    iput v3, v0, Lcom/tencent/liteav/g;->R:I

    .line 65
    .line 66
    const-wide/16 v3, 0x0

    .line 67
    .line 68
    invoke-static {v1, v3, v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$5102(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;J)J

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 72
    .line 73
    iget v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentRole:I

    .line 74
    .line 75
    const/16 v3, 0x15

    .line 76
    .line 77
    if-ne v1, v3, :cond_5

    .line 78
    .line 79
    new-instance v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82$1;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82$1;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 88
    .line 89
    const-string v1, "ignore enableCustomVideoCapture,for role audience"

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    goto :goto_2

    .line 95
    :cond_3
    iget-object v0, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 96
    .line 97
    iget v1, v0, Lcom/tencent/liteav/g;->R:I

    .line 98
    .line 99
    and-int/lit8 v1, v1, -0x3

    .line 100
    .line 101
    iput v1, v0, Lcom/tencent/liteav/g;->R:I

    .line 102
    .line 103
    monitor-enter p0

    .line 104
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 105
    .line 106
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$5200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    if-eqz v0, :cond_4

    .line 111
    .line 112
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 113
    .line 114
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$5200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->release()V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 122
    .line 123
    const/4 v1, 0x0

    .line 124
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$5202(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;)Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 125
    .line 126
    .line 127
    goto :goto_1

    .line 128
    :catchall_0
    move-exception v0

    .line 129
    goto :goto_4

    .line 130
    :cond_4
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 131
    :cond_5
    :goto_2
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 132
    .line 133
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 134
    .line 135
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 136
    .line 137
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/g;)V

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 141
    .line 142
    iget-boolean v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;->val$enable:Z

    .line 143
    .line 144
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2402(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Z)Z

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 148
    .line 149
    new-instance v1, Ljava/lang/StringBuilder;

    .line 150
    .line 151
    const-string v3, "enableCustomVideoCapture "

    .line 152
    .line 153
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    iget-boolean v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;->val$enable:Z

    .line 157
    .line 158
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    new-instance v0, Ljava/lang/StringBuilder;

    .line 169
    .line 170
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 171
    .line 172
    .line 173
    const-string v1, "enableCustomVideoCapture:%b"

    .line 174
    .line 175
    iget-boolean v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;->val$enable:Z

    .line 176
    .line 177
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 178
    .line 179
    .line 180
    move-result-object v3

    .line 181
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object v3

    .line 185
    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    const-string v1, " self:"

    .line 193
    .line 194
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 198
    .line 199
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    const-string v1, ""

    .line 211
    .line 212
    const/4 v3, 0x1

    .line 213
    const/4 v4, 0x0

    .line 214
    invoke-static {v3, v0, v1, v4}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 215
    .line 216
    .line 217
    iget-boolean v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;->val$enable:Z

    .line 218
    .line 219
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 220
    .line 221
    if-eqz v0, :cond_6

    .line 222
    .line 223
    invoke-virtual {v1, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableVideoStream(Z)V

    .line 224
    .line 225
    .line 226
    goto :goto_3

    .line 227
    :cond_6
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2000(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Z

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    if-nez v0, :cond_7

    .line 232
    .line 233
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 234
    .line 235
    invoke-virtual {v0, v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableVideoStream(Z)V

    .line 236
    .line 237
    .line 238
    :cond_7
    :goto_3
    const v0, 0x9c6e

    .line 239
    .line 240
    .line 241
    iget-boolean p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$82;->val$enable:Z

    .line 242
    .line 243
    invoke-static {v0, p0, v2}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a(III)V

    .line 244
    .line 245
    .line 246
    return-void

    .line 247
    :goto_4
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 248
    throw v0
.end method
