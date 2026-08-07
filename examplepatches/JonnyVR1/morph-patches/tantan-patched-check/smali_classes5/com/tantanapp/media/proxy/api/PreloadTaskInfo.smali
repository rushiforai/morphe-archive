.class public Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/media/proxy/api/PreloadTaskInfo$TaskEndReason;,
        Lcom/tantanapp/media/proxy/api/PreloadTaskInfo$TaskPriority;,
        Lcom/tantanapp/media/proxy/api/PreloadTaskInfo$TaskStatus;
    }
.end annotation


# instance fields
.field public mAddTimestamp:J

.field public mAverageRate:J

.field public mCdnIp:Ljava/lang/String;

.field public mCompleteTimestamp:J

.field public mConnectUsedTime:J

.field public mDNSServers:Ljava/lang/String;

.field public mDnsUsedTime:J

.field public mDownloadLimitRate:J

.field public mDownloadRate:J

.field public mDownloadedDuration:J

.field public mDownloadedSize:J

.field public mEndReasonCode:I

.field public mEndReasonStr:Ljava/lang/String;

.field public mEventCode:I

.field public mEventSubCode:I

.field public mFirstPacketTime:I

.field public mFirstWriteTimestamp:J

.field public mGetFileSizeCost:J

.field public mHeaderSize:I

.field public mHttpBodyTime:J

.field public mHttpCode:I

.field public mHttpHeader:Ljava/lang/String;

.field public mHttpHeaderTime:J

.field public mIsFirstNetworkPacket:Ljava/lang/Boolean;

.field public mKey:Ljava/lang/String;

.field public mPreloadThreadNumber:I

.field public mPriority:I

.field public mRequireDuration:J

.field public mRequireSize:J

.field public mRequireStart:J

.field public mSessionID:Ljava/lang/String;

.field public mStatus:I

.field public mTaskId:I

.field public mTcpConnectTime:J

.field public mTlsTime:I

.field public mUrl:Ljava/lang/String;

.field public mUsedTime:J

.field public mWaitTime:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public toJsonString()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "session_id"

    .line 7
    .line 8
    iget-object v2, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mSessionID:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    const-string v1, "task_end_code"

    .line 14
    .line 15
    iget v2, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mEndReasonCode:I

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 18
    .line 19
    .line 20
    const-string v1, "task_end_reason"

    .line 21
    .line 22
    iget-object v2, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mEndReasonStr:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 25
    .line 26
    .line 27
    const-string v1, "task_id"

    .line 28
    .line 29
    iget v2, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mTaskId:I

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 32
    .line 33
    .line 34
    const-string v1, "url"

    .line 35
    .line 36
    iget-object v2, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mUrl:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 39
    .line 40
    .line 41
    const-string v1, "key"

    .line 42
    .line 43
    iget-object v2, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mKey:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 46
    .line 47
    .line 48
    const-string v1, "http_header"

    .line 49
    .line 50
    iget-object v2, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mHttpHeader:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 53
    .line 54
    .line 55
    const-string v1, "dns_cost"

    .line 56
    .line 57
    iget-wide v2, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mDnsUsedTime:J

    .line 58
    .line 59
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 60
    .line 61
    .line 62
    const-string v1, "tcp_connect_cost"

    .line 63
    .line 64
    iget-wide v2, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mTcpConnectTime:J

    .line 65
    .line 66
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 67
    .line 68
    .line 69
    const-string v1, "http_header_cost"

    .line 70
    .line 71
    iget-wide v2, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mHttpHeaderTime:J

    .line 72
    .line 73
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 74
    .line 75
    .line 76
    const-string v1, "first_packet_cost"

    .line 77
    .line 78
    iget-wide v2, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mHttpBodyTime:J

    .line 79
    .line 80
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 81
    .line 82
    .line 83
    const-string v1, "http_status_code"

    .line 84
    .line 85
    iget v2, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mHttpCode:I

    .line 86
    .line 87
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 88
    .line 89
    .line 90
    const-string v1, "cdn_ip"

    .line 91
    .line 92
    iget-object v2, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mCdnIp:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 95
    .line 96
    .line 97
    const-string v1, "dns_ip"

    .line 98
    .line 99
    iget-object v2, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mDNSServers:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 102
    .line 103
    .line 104
    const-string v1, "downloaded_bytes"

    .line 105
    .line 106
    iget-wide v2, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mDownloadedSize:J

    .line 107
    .line 108
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 109
    .line 110
    .line 111
    const-string v1, "downloaded_duration"

    .line 112
    .line 113
    iget-wide v2, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mDownloadedDuration:J

    .line 114
    .line 115
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 116
    .line 117
    .line 118
    const-string v1, "task_add_timestamp"

    .line 119
    .line 120
    iget-wide v2, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mAddTimestamp:J

    .line 121
    .line 122
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 123
    .line 124
    .line 125
    const-string v1, "task_wait_time"

    .line 126
    .line 127
    iget-wide v2, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mWaitTime:J

    .line 128
    .line 129
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 130
    .line 131
    .line 132
    const-string v1, "task_use_cost"

    .line 133
    .line 134
    iget-wide v2, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mUsedTime:J

    .line 135
    .line 136
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 137
    .line 138
    .line 139
    const-string v1, "download_byterate"

    .line 140
    .line 141
    iget-wide v2, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mAverageRate:J

    .line 142
    .line 143
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 144
    .line 145
    .line 146
    const-string v1, "get_file_cost"

    .line 147
    .line 148
    iget-wide v2, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mGetFileSizeCost:J

    .line 149
    .line 150
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 151
    .line 152
    .line 153
    const-string v1, "tls_time"

    .line 154
    .line 155
    iget v2, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mTlsTime:I

    .line 156
    .line 157
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 158
    .line 159
    .line 160
    const-string v1, "first_packet_time"

    .line 161
    .line 162
    iget v2, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mFirstPacketTime:I

    .line 163
    .line 164
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 165
    .line 166
    .line 167
    const-string v1, "header_size"

    .line 168
    .line 169
    iget p0, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mHeaderSize:I

    .line 170
    .line 171
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 172
    .line 173
    .line 174
    :catch_0
    :catchall_0
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    return-object p0
.end method
