.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$86;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableCustomAudioCapture(Z)V
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
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$86;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$86;->val$enable:Z

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
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$86;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1300(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-boolean v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$86;->val$enable:Z

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$86;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 13
    .line 14
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1302(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Z)Z

    .line 15
    .line 16
    .line 17
    iget-boolean v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$86;->val$enable:Z

    .line 18
    .line 19
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$86;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 20
    .line 21
    const/4 v2, 0x1

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object v0, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 25
    .line 26
    iget v3, v0, Lcom/tencent/liteav/g;->R:I

    .line 27
    .line 28
    or-int/2addr v3, v2

    .line 29
    iput v3, v0, Lcom/tencent/liteav/g;->R:I

    .line 30
    .line 31
    iget v0, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentRole:I

    .line 32
    .line 33
    const/16 v3, 0x15

    .line 34
    .line 35
    if-ne v0, v3, :cond_2

    .line 36
    .line 37
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$86$1;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$86$1;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$86;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$86;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 46
    .line 47
    const-string v1, "ignore enableCustomAudioCapture,for role audience"

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    iget-object v0, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 54
    .line 55
    iget v1, v0, Lcom/tencent/liteav/g;->R:I

    .line 56
    .line 57
    and-int/lit8 v1, v1, -0x2

    .line 58
    .line 59
    iput v1, v0, Lcom/tencent/liteav/g;->R:I

    .line 60
    .line 61
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$86;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 62
    .line 63
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 66
    .line 67
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/g;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$86;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 71
    .line 72
    new-instance v1, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    const-string v3, "enableCustomAudioCapture "

    .line 75
    .line 76
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    iget-boolean v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$86;->val$enable:Z

    .line 80
    .line 81
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    new-instance v0, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 94
    .line 95
    .line 96
    iget-boolean v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$86;->val$enable:Z

    .line 97
    .line 98
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    const-string v3, "enableCustomAudioCapture:%b"

    .line 107
    .line 108
    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string v1, " self:"

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$86;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 121
    .line 122
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    const-string v1, ""

    .line 134
    .line 135
    const/4 v3, 0x0

    .line 136
    invoke-static {v2, v0, v1, v3}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$86;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 140
    .line 141
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1400(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-nez v0, :cond_3

    .line 146
    .line 147
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$86;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 148
    .line 149
    iget-boolean v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$86;->val$enable:Z

    .line 150
    .line 151
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableAudioStream(Z)V

    .line 152
    .line 153
    .line 154
    :cond_3
    iget-boolean v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$86;->val$enable:Z

    .line 155
    .line 156
    if-eqz v0, :cond_4

    .line 157
    .line 158
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$86;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 159
    .line 160
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$4600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 161
    .line 162
    .line 163
    invoke-static {v3}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeUseSysAudioDevice(Z)V

    .line 164
    .line 165
    .line 166
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    const/16 v1, 0xb

    .line 171
    .line 172
    invoke-virtual {v0, v1, v2}, Lcom/tencent/liteav/audio/TXCAudioEngine;->startLocalAudio(IZ)I

    .line 173
    .line 174
    .line 175
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    invoke-virtual {v0, v2}, Lcom/tencent/liteav/audio/TXCAudioEngine;->enableEncodedDataPackWithTRAEHeaderCallback(Z)V

    .line 180
    .line 181
    .line 182
    const-string v9, ""

    .line 183
    .line 184
    const/4 v10, 0x0

    .line 185
    const-string v3, "18446744073709551615"

    .line 186
    .line 187
    const/16 v4, 0xbbb

    .line 188
    .line 189
    const-wide/16 v5, 0xb

    .line 190
    .line 191
    const-wide/16 v7, -0x1

    .line 192
    .line 193
    invoke-static/range {v3 .. v10}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 194
    .line 195
    .line 196
    goto :goto_1

    .line 197
    :cond_4
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    invoke-virtual {v0}, Lcom/tencent/liteav/audio/TXCAudioEngine;->stopLocalAudio()I

    .line 202
    .line 203
    .line 204
    :goto_1
    const v0, 0x9c72

    .line 205
    .line 206
    .line 207
    iget-boolean p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$86;->val$enable:Z

    .line 208
    .line 209
    invoke-static {v0, p0, v2}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a(III)V

    .line 210
    .line 211
    .line 212
    return-void
.end method
