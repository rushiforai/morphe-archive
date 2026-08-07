.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$47;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->startLocalAudio()V
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
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$47;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

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
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$47;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1300(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$47;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string p0, "startLocalAudio when enable custom audio capturing, ignore!!!"

    .line 12
    .line 13
    invoke-virtual {v1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1400(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$47;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    const-string p0, "startLocalAudio when capturing audio, ignore!!!"

    .line 26
    .line 27
    invoke-virtual {v1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    iget v0, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentRole:I

    .line 32
    .line 33
    const/16 v2, 0x15

    .line 34
    .line 35
    if-ne v0, v2, :cond_2

    .line 36
    .line 37
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$47$1;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$47$1;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$47;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$47;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 46
    .line 47
    const-string v1, "ignore startLocalAudio,for role audience"

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_2
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$47;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 53
    .line 54
    const-string v1, "startLocalAudio"

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    new-instance v0, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    const-string v1, "startLocalAudio self:"

    .line 62
    .line 63
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$47;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    const-string v1, ""

    .line 80
    .line 81
    const/4 v2, 0x1

    .line 82
    const/4 v3, 0x0

    .line 83
    invoke-static {v2, v0, v1, v3}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 84
    .line 85
    .line 86
    const-string v10, ""

    .line 87
    .line 88
    const/4 v11, 0x0

    .line 89
    const-string v4, "18446744073709551615"

    .line 90
    .line 91
    const/16 v5, 0xbb9

    .line 92
    .line 93
    const-wide/16 v6, 0x0

    .line 94
    .line 95
    const-wide/16 v8, -0x1

    .line 96
    .line 97
    invoke-static/range {v4 .. v11}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$47;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 101
    .line 102
    invoke-static {v0, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1402(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Z)Z

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$47;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 106
    .line 107
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 108
    .line 109
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 110
    .line 111
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/g;)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$47;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 115
    .line 116
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$4600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 117
    .line 118
    .line 119
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$47;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 124
    .line 125
    iget-boolean v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mEnableEosMode:Z

    .line 126
    .line 127
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/audio/TXCAudioEngine;->enableCaptureEOSMode(Z)Z

    .line 128
    .line 129
    .line 130
    invoke-static {v3}, Lcom/tencent/liteav/audio/impl/TXCAudioEngineJNI;->nativeUseSysAudioDevice(Z)V

    .line 131
    .line 132
    .line 133
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    const/16 v1, 0xb

    .line 138
    .line 139
    invoke-virtual {v0, v1, v3}, Lcom/tencent/liteav/audio/TXCAudioEngine;->startLocalAudio(IZ)I

    .line 140
    .line 141
    .line 142
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-virtual {v0, v2}, Lcom/tencent/liteav/audio/TXCAudioEngine;->enableEncodedDataPackWithTRAEHeaderCallback(Z)V

    .line 147
    .line 148
    .line 149
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$47;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 154
    .line 155
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 156
    .line 157
    iget-boolean v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->muteLocalAudio:Z

    .line 158
    .line 159
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/audio/TXCAudioEngine;->muteLocalAudio(Z)Z

    .line 160
    .line 161
    .line 162
    const-string v9, ""

    .line 163
    .line 164
    const/4 v10, 0x0

    .line 165
    const-string v3, "18446744073709551615"

    .line 166
    .line 167
    const/16 v4, 0xbbb

    .line 168
    .line 169
    const-wide/16 v5, 0xb

    .line 170
    .line 171
    const-wide/16 v7, -0x1

    .line 172
    .line 173
    invoke-static/range {v3 .. v10}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 174
    .line 175
    .line 176
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$47;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 177
    .line 178
    invoke-virtual {p0, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableAudioStream(Z)V

    .line 179
    .line 180
    .line 181
    const p0, 0x9c72

    .line 182
    .line 183
    .line 184
    invoke-static {p0, v2, v2}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a(III)V

    .line 185
    .line 186
    .line 187
    return-void
.end method
