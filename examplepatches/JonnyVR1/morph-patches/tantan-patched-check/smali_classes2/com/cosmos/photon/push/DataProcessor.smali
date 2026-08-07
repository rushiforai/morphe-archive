.class public Lcom/cosmos/photon/push/DataProcessor;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static handler:Landroid/os/Handler; = null

.field private static handlerThread:Landroid/os/HandlerThread; = null

.field private static volatile needAwake:Z = true


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getPushSource(I)Ljava/lang/String;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p0, v0, :cond_6

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eq p0, v0, :cond_5

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    if-eq p0, v0, :cond_4

    .line 9
    .line 10
    const/4 v0, 0x4

    .line 11
    if-eq p0, v0, :cond_3

    .line 12
    .line 13
    const/4 v0, 0x6

    .line 14
    if-eq p0, v0, :cond_2

    .line 15
    .line 16
    const/16 v0, 0xa

    .line 17
    .line 18
    if-eq p0, v0, :cond_1

    .line 19
    .line 20
    const/16 v0, 0xb

    .line 21
    .line 22
    if-eq p0, v0, :cond_0

    .line 23
    .line 24
    packed-switch p0, :pswitch_data_0

    .line 25
    .line 26
    .line 27
    const-string p0, "unknown"

    .line 28
    .line 29
    return-object p0

    .line 30
    :pswitch_0
    const-string p0, "push:xmsilent"

    .line 31
    .line 32
    return-object p0

    .line 33
    :pswitch_1
    const-string p0, "push:ali"

    .line 34
    .line 35
    return-object p0

    .line 36
    :pswitch_2
    const-string p0, "push:jiguang"

    .line 37
    .line 38
    return-object p0

    .line 39
    :pswitch_3
    const-string p0, "push:getui"

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_0
    const-string p0, "push:self"

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_1
    const-string p0, "push:honor"

    .line 46
    .line 47
    return-object p0

    .line 48
    :cond_2
    const-string p0, "push:meizu"

    .line 49
    .line 50
    return-object p0

    .line 51
    :cond_3
    const-string p0, "push:vivo"

    .line 52
    .line 53
    return-object p0

    .line 54
    :cond_4
    const-string p0, "push:oppo"

    .line 55
    .line 56
    return-object p0

    .line 57
    :cond_5
    const-string p0, "push:xiaomi"

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_6
    const-string p0, "push:huawei"

    .line 61
    .line 62
    return-object p0

    .line 63
    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getPushSource(Landroid/content/Intent;)Ljava/lang/String;
    .locals 4

    .line 63
    const-string v0, "pushType"

    const/4 v1, -0x1

    .line 64
    :try_start_0
    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 65
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 66
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    :cond_0
    move v2, v1

    :goto_0
    if-ne v2, v1, :cond_1

    .line 67
    :try_start_1
    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 68
    :catch_1
    :cond_1
    invoke-static {v2}, Lcom/cosmos/photon/push/DataProcessor;->getPushSource(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getPushSource(Lcom/cosmos/photon/push/notification/MoNotify;)Ljava/lang/String;
    .locals 1

    .line 69
    :try_start_0
    iget-object p0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->action:Ljava/lang/String;

    const/4 v0, 0x0

    invoke-static {p0, v0}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p0

    .line 70
    invoke-static {p0}, Lcom/cosmos/photon/push/DataProcessor;->getPushSource(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    .line 71
    :catchall_0
    const-string p0, "unknown"

    return-object p0
.end method

.method private static isIntentAvailable(Landroid/content/Context;Landroid/content/Intent;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, v0}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-lez p0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    return v0
.end method

.method private static onMsgArrived(Lcom/cosmos/photon/push/msg/MoMessage;)Z
    .locals 3

    .line 1
    const-string v0, "onMsgArrived %s"

    .line 2
    .line 3
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "MoPush-Notify"

    .line 8
    .line 9
    invoke-static {v2, v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Landroid/os/Bundle;

    .line 13
    .line 14
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v1, "key_msg"

    .line 18
    .line 19
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/cosmos/photon/push/msg/MoMessage;->toPkg:Ljava/lang/String;

    .line 23
    .line 24
    const-string v1, "channel_msg"

    .line 25
    .line 26
    invoke-static {p0, v1, v0}, Lcom/cosmos/photon/push/channel/PushContentHelper;->executeAction(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    if-eqz p0, :cond_0

    .line 31
    .line 32
    const-string v0, "key_ret"

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    return p0

    .line 42
    :cond_0
    const/4 p0, 0x0

    .line 43
    return p0
.end method

.method public static onMsgArrived(Lcom/immomo/push/pb/Msg;)Z
    .locals 0

    .line 44
    invoke-static {p0}, Lcom/cosmos/photon/push/msg/MoMessage;->create(Lcom/immomo/push/pb/Msg;)Lcom/cosmos/photon/push/msg/MoMessage;

    move-result-object p0

    .line 45
    invoke-static {p0}, Lcom/cosmos/photon/push/DataProcessor;->onMsgArrived(Lcom/cosmos/photon/push/msg/MoMessage;)Z

    move-result p0

    return p0
.end method

.method public static onMsgArrived(Lcom/immomo/push/pb/MsgV2;)Z
    .locals 0

    .line 46
    invoke-static {p0}, Lcom/cosmos/photon/push/msg/MoMessage;->create(Lcom/immomo/push/pb/MsgV2;)Lcom/cosmos/photon/push/msg/MoMessage;

    move-result-object p0

    .line 47
    invoke-static {p0}, Lcom/cosmos/photon/push/DataProcessor;->onMsgArrived(Lcom/cosmos/photon/push/msg/MoMessage;)Z

    move-result p0

    return p0
.end method

.method public static onMsgArrivedInner(Lcom/cosmos/photon/push/msg/MoMessage;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/cosmos/photon/push/PhotonPushManager;->messageReceiver:Lcom/cosmos/photon/push/PushMessageReceiver;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/cosmos/photon/push/PushMessageReceiver;->onReceivePassThroughMessage(Lcom/cosmos/photon/push/msg/MoMessage;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "onMsgArrivedInner %s"

    .line 7
    .line 8
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string v1, "MoPush-Notify"

    .line 13
    .line 14
    invoke-static {v1, v0, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private static onPushArrived(Lcom/cosmos/photon/push/notification/MoNotify;)Z
    .locals 8

    .line 1
    const-string v0, "onPushArrived %s"

    .line 2
    .line 3
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "MoPush-Notify"

    .line 8
    .line 9
    invoke-static {v2, v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 13
    .line 14
    invoke-direct {v0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v1, "push:self"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->pushSource(Ljava/lang/String;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-wide v3, p0, Lcom/cosmos/photon/push/notification/MoNotify;->time:J

    .line 24
    .line 25
    invoke-virtual {v0, v3, v4}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->time(J)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v3, p0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 30
    .line 31
    invoke-virtual {v0, v3}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->data(Ljava/util/Map;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sget v3, Lcom/cosmos/photon/push/statistic/EventLogBody;->TYPE_ARRIVED:I

    .line 36
    .line 37
    invoke-virtual {v0, v3}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->type(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget v3, p0, Lcom/cosmos/photon/push/notification/MoNotify;->logType:I

    .line 42
    .line 43
    invoke-virtual {v0, v3}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->uploadType(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->build()Lcom/cosmos/photon/push/statistic/EventLogBody;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v0}, Lcom/cosmos/photon/push/statistic/PushEventStatistic;->logPushEventInfo(Lcom/cosmos/photon/push/statistic/EventLogBody;)V

    .line 52
    .line 53
    .line 54
    iget-wide v3, p0, Lcom/cosmos/photon/push/notification/MoNotify;->showTime:J

    .line 55
    .line 56
    const-wide/16 v5, 0x0

    .line 57
    .line 58
    cmp-long v0, v3, v5

    .line 59
    .line 60
    const/4 v3, 0x1

    .line 61
    if-lez v0, :cond_0

    .line 62
    .line 63
    invoke-static {p0}, Lcom/cosmos/photon/push/DataProcessor;->scheduleNotify(Lcom/cosmos/photon/push/notification/MoNotify;)V

    .line 64
    .line 65
    .line 66
    return v3

    .line 67
    :cond_0
    iget v0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->actionType:I

    .line 68
    .line 69
    const/4 v4, 0x2

    .line 70
    const/4 v5, 0x0

    .line 71
    if-ne v0, v4, :cond_1

    .line 72
    .line 73
    iget-object v0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->action:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_1

    .line 80
    .line 81
    :try_start_0
    iget-object v0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->action:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {v0, v5}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    const-string v4, "pushType"

    .line 88
    .line 89
    const/16 v6, 0xb

    .line 90
    .line 91
    invoke-virtual {v0, v4, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0, v5}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iput-object v0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->action:Ljava/lang/String;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :catch_0
    move-exception v0

    .line 102
    const-string v4, "MoPush-STATISTIC"

    .line 103
    .line 104
    invoke-static {v4, v0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 105
    .line 106
    .line 107
    :cond_1
    :goto_0
    new-instance v0, Landroid/os/Bundle;

    .line 108
    .line 109
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 110
    .line 111
    .line 112
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getPackageName()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    iget-object v6, p0, Lcom/cosmos/photon/push/notification/MoNotify;->toPkg:Ljava/lang/String;

    .line 117
    .line 118
    invoke-static {v4, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 119
    .line 120
    .line 121
    move-result v4

    .line 122
    const-string v6, "key_push_data"

    .line 123
    .line 124
    const-string v7, "key_push_datatype"

    .line 125
    .line 126
    if-eqz v4, :cond_2

    .line 127
    .line 128
    invoke-virtual {v0, v7, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v0, v6, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 132
    .line 133
    .line 134
    const-string v4, "key_push_json_data"

    .line 135
    .line 136
    invoke-virtual {p0}, Lcom/cosmos/photon/push/notification/MoNotify;->toJson()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v6

    .line 140
    invoke-virtual {v0, v4, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    goto :goto_1

    .line 144
    :cond_2
    invoke-virtual {v0, v7, v5}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {p0}, Lcom/cosmos/photon/push/notification/MoNotify;->toJson()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v4

    .line 151
    invoke-virtual {v0, v6, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    :goto_1
    iget-object v4, p0, Lcom/cosmos/photon/push/notification/MoNotify;->toPkg:Ljava/lang/String;

    .line 155
    .line 156
    const-string v6, "channel_push"

    .line 157
    .line 158
    invoke-static {v4, v6, v0}, Lcom/cosmos/photon/push/channel/PushContentHelper;->executeAction(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    if-eqz v0, :cond_3

    .line 163
    .line 164
    const-string v4, "key_ret"

    .line 165
    .line 166
    invoke-virtual {v0, v4}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    if-nez v0, :cond_4

    .line 171
    .line 172
    :cond_3
    const-string v0, "onPushArrived contentUri failed"

    .line 173
    .line 174
    invoke-static {v2, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    sget-boolean v0, Lcom/cosmos/photon/push/DataProcessor;->needAwake:Z

    .line 178
    .line 179
    if-eqz v0, :cond_5

    .line 180
    .line 181
    :try_start_1
    invoke-static {p0}, Lcom/cosmos/photon/push/service/PushOVActivity;->transData(Lcom/cosmos/photon/push/notification/MoNotify;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 182
    .line 183
    .line 184
    :cond_4
    return v3

    .line 185
    :catch_1
    move-exception v0

    .line 186
    const-string v2, "MoPush-Channel"

    .line 187
    .line 188
    invoke-static {v2, v0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 189
    .line 190
    .line 191
    new-instance v0, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 192
    .line 193
    invoke-direct {v0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;-><init>()V

    .line 194
    .line 195
    .line 196
    invoke-virtual {v0, v1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->pushSource(Ljava/lang/String;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    iget-wide v2, p0, Lcom/cosmos/photon/push/notification/MoNotify;->time:J

    .line 201
    .line 202
    invoke-virtual {v1, v2, v3}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->time(J)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    iget-object v2, p0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 207
    .line 208
    invoke-virtual {v1, v2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->data(Ljava/util/Map;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    iget p0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->logType:I

    .line 213
    .line 214
    invoke-virtual {v1, p0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->uploadType(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    sget v1, Lcom/cosmos/photon/push/statistic/EventLogBody;->TYPE_ARRIVED_NOT_SHOWN:I

    .line 219
    .line 220
    invoke-virtual {p0, v1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->type(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    const/16 v1, 0x8

    .line 225
    .line 226
    invoke-virtual {p0, v1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->reason(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 227
    .line 228
    .line 229
    invoke-virtual {v0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->build()Lcom/cosmos/photon/push/statistic/EventLogBody;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    invoke-static {p0}, Lcom/cosmos/photon/push/statistic/PushEventStatistic;->logPushEventInfo(Lcom/cosmos/photon/push/statistic/EventLogBody;)V

    .line 234
    .line 235
    .line 236
    :cond_5
    return v5
.end method

.method public static onPushArrived(Lcom/immomo/push/pb/Notify;)Z
    .locals 1

    .line 237
    invoke-static {p0}, Lcom/cosmos/photon/push/notification/MoNotify;->create(Lcom/immomo/push/pb/Notify;)Lcom/cosmos/photon/push/notification/MoNotify;

    move-result-object p0

    .line 238
    :try_start_0
    invoke-static {p0}, Lcom/cosmos/photon/push/DataProcessor;->onPushArrived(Lcom/cosmos/photon/push/notification/MoNotify;)Z

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return p0

    :catchall_0
    move-exception p0

    .line 239
    const-string v0, "MoPush-"

    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return p0
.end method

.method public static onPushArrived(Lcom/immomo/push/pb/NotifyV2;)Z
    .locals 1

    .line 240
    invoke-static {p0}, Lcom/cosmos/photon/push/notification/MoNotify;->create(Lcom/immomo/push/pb/NotifyV2;)Lcom/cosmos/photon/push/notification/MoNotify;

    move-result-object p0

    .line 241
    :try_start_0
    invoke-static {p0}, Lcom/cosmos/photon/push/DataProcessor;->onPushArrived(Lcom/cosmos/photon/push/notification/MoNotify;)Z

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return p0

    :catchall_0
    move-exception p0

    .line 242
    const-string v0, "MoPush-"

    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return p0
.end method

.method public static onPushArrivedInner(Lcom/cosmos/photon/push/notification/MoNotify;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/cosmos/photon/push/DataProcessor;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/os/HandlerThread;

    .line 6
    .line 7
    const-string v1, "mmpush_msg_proc"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lcom/cosmos/photon/push/DataProcessor;->handlerThread:Landroid/os/HandlerThread;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 15
    .line 16
    .line 17
    new-instance v0, Landroid/os/Handler;

    .line 18
    .line 19
    sget-object v1, Lcom/cosmos/photon/push/DataProcessor;->handlerThread:Landroid/os/HandlerThread;

    .line 20
    .line 21
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 26
    .line 27
    .line 28
    sput-object v0, Lcom/cosmos/photon/push/DataProcessor;->handler:Landroid/os/Handler;

    .line 29
    .line 30
    :cond_0
    sget-object v0, Lcom/cosmos/photon/push/DataProcessor;->handler:Landroid/os/Handler;

    .line 31
    .line 32
    new-instance v1, Lcom/cosmos/photon/push/DataProcessor$1;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Lcom/cosmos/photon/push/DataProcessor$1;-><init>(Lcom/cosmos/photon/push/notification/MoNotify;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static onPushClick(Lcom/cosmos/photon/push/notification/MoNotify;)Z
    .locals 5

    .line 1
    const-string v0, "pushType"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    iget-object v2, p0, Lcom/cosmos/photon/push/notification/MoNotify;->action:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v2, v1}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object v2
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    goto :goto_0

    .line 11
    :catch_0
    const/4 v2, 0x0

    .line 12
    :goto_0
    const/4 v3, -0x1

    .line 13
    :try_start_1
    invoke-virtual {v2, v0, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 14
    .line 15
    .line 16
    move-result v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 17
    goto :goto_1

    .line 18
    :catch_1
    move-exception v4

    .line 19
    invoke-virtual {v4}, Ljava/lang/Throwable;->printStackTrace()V

    .line 20
    .line 21
    .line 22
    move v4, v3

    .line 23
    :goto_1
    if-ne v4, v3, :cond_0

    .line 24
    .line 25
    :try_start_2
    invoke-virtual {v2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-nez v2, :cond_0

    .line 34
    .line 35
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v4
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 39
    :catch_2
    :cond_0
    const/16 v0, 0xb

    .line 40
    .line 41
    if-eq v4, v0, :cond_1

    .line 42
    .line 43
    const/16 v0, 0x64

    .line 44
    .line 45
    if-eq v4, v0, :cond_1

    .line 46
    .line 47
    const/16 v0, 0x65

    .line 48
    .line 49
    if-eq v4, v0, :cond_1

    .line 50
    .line 51
    const/16 v0, 0x66

    .line 52
    .line 53
    if-eq v4, v0, :cond_1

    .line 54
    .line 55
    const/16 v0, 0x67

    .line 56
    .line 57
    if-ne v4, v0, :cond_2

    .line 58
    .line 59
    :cond_1
    invoke-static {v4}, Lcom/cosmos/photon/push/DataProcessor;->getPushSource(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v2, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 64
    .line 65
    invoke-direct {v2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2, v0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->pushSource(Ljava/lang/String;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    sget v3, Lcom/cosmos/photon/push/statistic/EventLogBody;->TYPE_CLICKED:I

    .line 73
    .line 74
    invoke-virtual {v2, v3}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->type(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    iget v3, p0, Lcom/cosmos/photon/push/notification/MoNotify;->logType:I

    .line 79
    .line 80
    invoke-virtual {v2, v3}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->uploadType(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 85
    .line 86
    .line 87
    move-result-wide v3

    .line 88
    invoke-virtual {v2, v3, v4}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->time(J)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    iget-object v3, p0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 93
    .line 94
    invoke-virtual {v2, v3}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->data(Ljava/util/Map;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-virtual {v2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->build()Lcom/cosmos/photon/push/statistic/EventLogBody;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-static {v2}, Lcom/cosmos/photon/push/statistic/PushEventStatistic;->logPushEventInfo(Lcom/cosmos/photon/push/statistic/EventLogBody;)V

    .line 103
    .line 104
    .line 105
    invoke-static {}, Lcom/cosmos/photon/push/PhotonPushManager;->getInstance()Lcom/cosmos/photon/push/PhotonPushManager;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    iget-boolean v2, v2, Lcom/cosmos/photon/push/PhotonPushManager;->isForeGround:Z

    .line 110
    .line 111
    if-nez v2, :cond_2

    .line 112
    .line 113
    new-instance v2, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 114
    .line 115
    invoke-direct {v2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;-><init>()V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v2, v0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->pushSource(Ljava/lang/String;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    sget v2, Lcom/cosmos/photon/push/statistic/EventLogBody;->TYPE_FORGROUND_NOT_SHOWN:I

    .line 123
    .line 124
    invoke-virtual {v0, v2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->type(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iget v2, p0, Lcom/cosmos/photon/push/notification/MoNotify;->logType:I

    .line 129
    .line 130
    invoke-virtual {v0, v2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->uploadType(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 135
    .line 136
    .line 137
    move-result-wide v2

    .line 138
    invoke-virtual {v0, v2, v3}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->time(J)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    iget-object v2, p0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 143
    .line 144
    invoke-virtual {v0, v2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->data(Ljava/util/Map;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-virtual {v0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->build()Lcom/cosmos/photon/push/statistic/EventLogBody;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-static {v0}, Lcom/cosmos/photon/push/statistic/PushEventStatistic;->logPushEventInfo(Lcom/cosmos/photon/push/statistic/EventLogBody;)V

    .line 153
    .line 154
    .line 155
    :cond_2
    iget-object v0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->toPkg:Ljava/lang/String;

    .line 156
    .line 157
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getPackageName()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    const-string v2, "MoPush-Notify"

    .line 166
    .line 167
    if-eqz v0, :cond_3

    .line 168
    .line 169
    const-string v0, "onPushClick %s"

    .line 170
    .line 171
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    invoke-static {v2, v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 176
    .line 177
    .line 178
    sget-object v0, Lcom/cosmos/photon/push/PhotonPushManager;->messageReceiver:Lcom/cosmos/photon/push/PushMessageReceiver;

    .line 179
    .line 180
    invoke-virtual {v0, p0}, Lcom/cosmos/photon/push/PushMessageReceiver;->onNotificationMessageClicked(Lcom/cosmos/photon/push/notification/MoNotify;)Z

    .line 181
    .line 182
    .line 183
    move-result p0

    .line 184
    return p0

    .line 185
    :cond_3
    const-string v0, "onPushClick \u4ee3\u5176\u4ed6APP\u4ea7\u751f\u7684\u901a\u77e5\u88ab\u70b9\u51fb\u4e86"

    .line 186
    .line 187
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    invoke-static {v2, v0, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 192
    .line 193
    .line 194
    return v1
.end method

.method public static onPushClickFromBusiness(Lcom/cosmos/photon/push/notification/MoNotify;)V
    .locals 5

    .line 1
    const-string v0, "pushType"

    .line 2
    .line 3
    const-string v1, "click push from business"

    .line 4
    .line 5
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const-string v3, "MoPush-Notify"

    .line 10
    .line 11
    invoke-static {v3, v1, v2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    goto/16 :goto_1

    .line 17
    .line 18
    :cond_0
    const/4 v1, -0x1

    .line 19
    const/4 v2, 0x0

    .line 20
    :try_start_0
    iget-object v3, p0, Lcom/cosmos/photon/push/notification/MoNotify;->action:Ljava/lang/String;

    .line 21
    .line 22
    const/4 v4, 0x0

    .line 23
    invoke-static {v3, v4}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 28
    .line 29
    .line 30
    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    goto :goto_0

    .line 32
    :catch_0
    move-exception v3

    .line 33
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 34
    .line 35
    .line 36
    move v3, v1

    .line 37
    :goto_0
    if-eqz v2, :cond_1

    .line 38
    .line 39
    if-ne v3, v1, :cond_1

    .line 40
    .line 41
    :try_start_1
    invoke-virtual {v2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-nez v1, :cond_1

    .line 50
    .line 51
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 55
    :catch_1
    :cond_1
    invoke-static {v3}, Lcom/cosmos/photon/push/DataProcessor;->getPushSource(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 60
    .line 61
    invoke-direct {v1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1, v0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->pushSource(Ljava/lang/String;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    sget v2, Lcom/cosmos/photon/push/statistic/EventLogBody;->TYPE_CLICKED:I

    .line 69
    .line 70
    invoke-virtual {v1, v2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->type(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    iget v2, p0, Lcom/cosmos/photon/push/notification/MoNotify;->logType:I

    .line 75
    .line 76
    invoke-virtual {v1, v2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->uploadType(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 81
    .line 82
    .line 83
    move-result-wide v2

    .line 84
    invoke-virtual {v1, v2, v3}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->time(J)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    iget-object v2, p0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 89
    .line 90
    invoke-virtual {v1, v2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->data(Ljava/util/Map;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    const/4 v2, 0x1

    .line 95
    invoke-virtual {v1, v2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->clickFromBusiness(Z)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->build()Lcom/cosmos/photon/push/statistic/EventLogBody;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-static {v1}, Lcom/cosmos/photon/push/statistic/PushEventStatistic;->logPushEventInfo(Lcom/cosmos/photon/push/statistic/EventLogBody;)V

    .line 104
    .line 105
    .line 106
    invoke-static {}, Lcom/cosmos/photon/push/PhotonPushManager;->getInstance()Lcom/cosmos/photon/push/PhotonPushManager;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    iget-boolean v1, v1, Lcom/cosmos/photon/push/PhotonPushManager;->isForeGround:Z

    .line 111
    .line 112
    if-nez v1, :cond_2

    .line 113
    .line 114
    new-instance v1, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 115
    .line 116
    invoke-direct {v1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;-><init>()V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v1, v0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->pushSource(Ljava/lang/String;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    sget v1, Lcom/cosmos/photon/push/statistic/EventLogBody;->TYPE_FORGROUND_NOT_SHOWN:I

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->type(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iget v1, p0, Lcom/cosmos/photon/push/notification/MoNotify;->logType:I

    .line 130
    .line 131
    invoke-virtual {v0, v1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->uploadType(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 136
    .line 137
    .line 138
    move-result-wide v3

    .line 139
    invoke-virtual {v0, v3, v4}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->time(J)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    iget-object p0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 144
    .line 145
    invoke-virtual {v0, p0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->data(Ljava/util/Map;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-virtual {p0, v2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->clickFromBusiness(Z)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-virtual {p0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->build()Lcom/cosmos/photon/push/statistic/EventLogBody;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    invoke-static {p0}, Lcom/cosmos/photon/push/statistic/PushEventStatistic;->logPushEventInfo(Lcom/cosmos/photon/push/statistic/EventLogBody;)V

    .line 158
    .line 159
    .line 160
    :cond_2
    :goto_1
    return-void
.end method

.method public static onPushShowFromBusiness(Lcom/cosmos/photon/push/notification/MoNotify;Z)V
    .locals 4

    .line 1
    const-string v0, "onPushShowFromBusiness"

    .line 2
    .line 3
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "MoPush-Notify"

    .line 8
    .line 9
    invoke-static {v2, v0, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {p0}, Lcom/cosmos/photon/push/DataProcessor;->getPushSource(Lcom/cosmos/photon/push/notification/MoNotify;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 20
    .line 21
    invoke-direct {v1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->pushSource(Ljava/lang/String;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget v2, p0, Lcom/cosmos/photon/push/notification/MoNotify;->logType:I

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->uploadType(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-wide v2, p0, Lcom/cosmos/photon/push/notification/MoNotify;->time:J

    .line 35
    .line 36
    invoke-virtual {v0, v2, v3}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->time(J)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object p0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 41
    .line 42
    invoke-virtual {v0, p0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->data(Ljava/util/Map;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 43
    .line 44
    .line 45
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p0}, Ll/c050;->e(Landroid/content/Context;)Ll/c050;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Ll/c050;->a()Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-nez p0, :cond_1

    .line 58
    .line 59
    sget p0, Lcom/cosmos/photon/push/statistic/EventLogBody;->TYPE_ARRIVED_NOT_SHOWN:I

    .line 60
    .line 61
    invoke-virtual {v1, p0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->type(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const/4 p1, 0x6

    .line 66
    invoke-virtual {p0, p1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->reason(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    if-eqz p1, :cond_2

    .line 71
    .line 72
    sget p0, Lcom/cosmos/photon/push/statistic/EventLogBody;->TYPE_SHOWN:I

    .line 73
    .line 74
    invoke-virtual {v1, p0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->type(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_2
    sget p0, Lcom/cosmos/photon/push/statistic/EventLogBody;->TYPE_ARRIVED_NOT_SHOWN:I

    .line 79
    .line 80
    invoke-virtual {v1, p0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->type(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const/4 p1, 0x1

    .line 85
    invoke-virtual {p0, p1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->reason(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 86
    .line 87
    .line 88
    :goto_0
    invoke-virtual {v1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->build()Lcom/cosmos/photon/push/statistic/EventLogBody;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-static {p0}, Lcom/cosmos/photon/push/statistic/PushEventStatistic;->logPushEventInfo(Lcom/cosmos/photon/push/statistic/EventLogBody;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method private static scheduleNotify(Lcom/cosmos/photon/push/notification/MoNotify;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->id:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/text/SimpleDateFormat;

    .line 4
    .line 5
    const-string v2, "yyyy-MM-dd HH:mm:ss"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    new-instance v2, Ljava/util/Date;

    .line 11
    .line 12
    iget-wide v3, p0, Lcom/cosmos/photon/push/notification/MoNotify;->showTime:J

    .line 13
    .line 14
    invoke-direct {v2, v3, v4}, Ljava/util/Date;-><init>(J)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "MoPush-Notify"

    .line 26
    .line 27
    const-string v2, "scheduler notify(%s) at %s"

    .line 28
    .line 29
    invoke-static {v1, v2, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    :try_start_0
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getPackageName()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v2, Landroid/content/Intent;

    .line 37
    .line 38
    invoke-static {v0}, Lcom/cosmos/photon/push/channel/ChannelConstant;->getSchedulerPushServiceAction(Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v2, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 46
    .line 47
    .line 48
    new-instance v3, Landroid/content/ComponentName;

    .line 49
    .line 50
    const-class v4, Lcom/cosmos/photon/push/service/SchedulerPushService;

    .line 51
    .line 52
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    invoke-direct {v3, v0, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2, v3}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 60
    .line 61
    .line 62
    const-string v0, "data"

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/cosmos/photon/push/notification/MoNotify;->toJson()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-virtual {v2, v0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 69
    .line 70
    .line 71
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {v0, v2}, Lcom/cosmos/photon/push/DataProcessor;->isIntentAvailable(Landroid/content/Context;Landroid/content/Intent;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_0

    .line 80
    .line 81
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    new-instance v3, Ljava/util/Random;

    .line 86
    .line 87
    invoke-direct {v3}, Ljava/util/Random;-><init>()V

    .line 88
    .line 89
    .line 90
    const v4, 0x7fffffff

    .line 91
    .line 92
    .line 93
    invoke-virtual {v3, v4}, Ljava/util/Random;->nextInt(I)I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    iget-wide v4, p0, Lcom/cosmos/photon/push/notification/MoNotify;->showTime:J

    .line 98
    .line 99
    invoke-static {v0, v2, v3, v4, v5}, Lcom/cosmos/photon/push/util/AlarmTimerUtil;->setAlarmTimer(Landroid/content/Context;Landroid/content/Intent;IJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :catchall_0
    move-exception p0

    .line 104
    goto :goto_0

    .line 105
    :cond_0
    return-void

    .line 106
    :goto_0
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 107
    .line 108
    .line 109
    return-void
.end method
