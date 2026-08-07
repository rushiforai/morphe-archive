.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$151;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onRecvSEIMsg(J[B)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$message:[B

.field final synthetic val$tinyId:J


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;J[B)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$151;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$151;->val$tinyId:J

    .line 4
    .line 5
    iput-object p4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$151;->val$message:[B

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
    const-string v0, "TRTCCloudImpl"

    .line 2
    .line 3
    const-string v1, "onRecvSEIMsg Error, user id is null for tinyId="

    .line 4
    .line 5
    const-string v2, "onRecvSEIMsg. userId="

    .line 6
    .line 7
    iget-object v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$151;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 8
    .line 9
    iget-object v4, v3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mTRTCListener:Lcom/tencent/trtc/TRTCCloudListener;

    .line 10
    .line 11
    if-eqz v4, :cond_2

    .line 12
    .line 13
    :try_start_0
    iget-object v3, v3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 14
    .line 15
    iget-wide v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$151;->val$tinyId:J

    .line 16
    .line 17
    invoke-virtual {v3, v5, v6}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUserIdByTinyId(J)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    const-string v5, " self:"

    .line 22
    .line 23
    if-eqz v3, :cond_1

    .line 24
    .line 25
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 26
    .line 27
    .line 28
    move-result-wide v6

    .line 29
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$151;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 30
    .line 31
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$8108(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)J

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$151;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 35
    .line 36
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$8200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)J

    .line 37
    .line 38
    .line 39
    move-result-wide v8

    .line 40
    sub-long v8, v6, v8

    .line 41
    .line 42
    const-wide/16 v10, 0x2710

    .line 43
    .line 44
    cmp-long v1, v8, v10

    .line 45
    .line 46
    if-lez v1, :cond_0

    .line 47
    .line 48
    new-instance v1, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v2, ", message = "

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    new-instance v2, Ljava/lang/String;

    .line 62
    .line 63
    iget-object v8, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$151;->val$message:[B

    .line 64
    .line 65
    invoke-direct {v2, v8}, Ljava/lang/String;-><init>([B)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v2, ", recvSEIMsgCountInPeriod = "

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$151;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 77
    .line 78
    invoke-static {v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$8100(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)J

    .line 79
    .line 80
    .line 81
    move-result-wide v8

    .line 82
    invoke-virtual {v1, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$151;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 89
    .line 90
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$151;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 105
    .line 106
    invoke-static {v1, v6, v7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$8202(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;J)J

    .line 107
    .line 108
    .line 109
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$151;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 110
    .line 111
    const-wide/16 v5, 0x0

    .line 112
    .line 113
    invoke-static {v1, v5, v6}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$8102(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;J)J

    .line 114
    .line 115
    .line 116
    goto :goto_0

    .line 117
    :catch_0
    move-exception p0

    .line 118
    goto :goto_1

    .line 119
    :cond_0
    :goto_0
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$151;->val$message:[B

    .line 120
    .line 121
    invoke-virtual {v4, v3, p0}, Lcom/tencent/trtc/TRTCCloudListener;->onRecvSEIMsg(Ljava/lang/String;[B)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    iget-wide v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$151;->val$tinyId:J

    .line 131
    .line 132
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$151;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 139
    .line 140
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 141
    .line 142
    .line 143
    move-result p0

    .line 144
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :goto_1
    const-string v1, "onRecvSEIMsg failed."

    .line 156
    .line 157
    invoke-static {v0, v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 158
    .line 159
    .line 160
    :cond_2
    return-void
.end method
