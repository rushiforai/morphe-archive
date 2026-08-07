.class Lcom/cosmos/photon/push/service/SchedulerPushService$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cosmos/photon/push/service/SchedulerPushService;->onStartCommand(Landroid/content/Intent;II)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cosmos/photon/push/service/SchedulerPushService;

.field final synthetic val$data:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/cosmos/photon/push/service/SchedulerPushService;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/service/SchedulerPushService$1;->this$0:Lcom/cosmos/photon/push/service/SchedulerPushService;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/cosmos/photon/push/service/SchedulerPushService$1;->val$data:Ljava/lang/String;

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
    .locals 7

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object p0, p0, Lcom/cosmos/photon/push/service/SchedulerPushService$1;->val$data:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/cosmos/photon/push/notification/MoNotify;->fromJson(Ljava/lang/String;)Lcom/cosmos/photon/push/notification/MoNotify;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-wide v2, p0, Lcom/cosmos/photon/push/notification/MoNotify;->showTime:J

    .line 12
    .line 13
    const-wide/16 v4, 0x0

    .line 14
    .line 15
    cmp-long v4, v2, v4

    .line 16
    .line 17
    if-lez v4, :cond_2

    .line 18
    .line 19
    cmp-long v2, v0, v2

    .line 20
    .line 21
    if-ltz v2, :cond_2

    .line 22
    .line 23
    iget-wide v2, p0, Lcom/cosmos/photon/push/notification/MoNotify;->showExpire:J

    .line 24
    .line 25
    cmp-long v2, v0, v2

    .line 26
    .line 27
    const-string v3, "MoPush-Notify"

    .line 28
    .line 29
    if-gtz v2, :cond_1

    .line 30
    .line 31
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getMessageReceiver()Lcom/cosmos/photon/push/PushMessageReceiver;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0, p0}, Lcom/cosmos/photon/push/PushMessageReceiver;->onNotificationShow(Lcom/cosmos/photon/push/notification/MoNotify;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/cosmos/photon/push/notification/MoNotify;->toJson()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v1, "show scheduler notify : %s"

    .line 50
    .line 51
    invoke-static {v3, v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {v0, p0}, Lcom/cosmos/photon/push/NotifyHelper;->sendNotify(Landroid/content/Context;Lcom/cosmos/photon/push/notification/MoNotify;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_0
    new-instance v0, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 63
    .line 64
    invoke-direct {v0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;-><init>()V

    .line 65
    .line 66
    .line 67
    const-string v1, "push:self"

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->pushSource(Ljava/lang/String;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    iget-wide v2, p0, Lcom/cosmos/photon/push/notification/MoNotify;->time:J

    .line 74
    .line 75
    invoke-virtual {v1, v2, v3}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->time(J)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    iget-object v2, p0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 80
    .line 81
    invoke-virtual {v1, v2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->data(Ljava/util/Map;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    iget p0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->logType:I

    .line 86
    .line 87
    invoke-virtual {v1, p0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->uploadType(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    sget v1, Lcom/cosmos/photon/push/statistic/EventLogBody;->TYPE_ARRIVED_NOT_SHOWN:I

    .line 92
    .line 93
    invoke-virtual {p0, v1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->type(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    const/4 v1, 0x7

    .line 98
    invoke-virtual {p0, v1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->reason(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->build()Lcom/cosmos/photon/push/statistic/EventLogBody;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-static {p0}, Lcom/cosmos/photon/push/statistic/PushEventStatistic;->logPushEventInfo(Lcom/cosmos/photon/push/statistic/EventLogBody;)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_1
    iget-object v2, p0, Lcom/cosmos/photon/push/notification/MoNotify;->id:Ljava/lang/String;

    .line 110
    .line 111
    new-instance v4, Ljava/text/SimpleDateFormat;

    .line 112
    .line 113
    const-string v5, "yyyy-MM-dd HH:mm:ss"

    .line 114
    .line 115
    invoke-direct {v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    new-instance v6, Ljava/util/Date;

    .line 119
    .line 120
    invoke-direct {v6, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v4, v6}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    new-instance v1, Ljava/text/SimpleDateFormat;

    .line 128
    .line 129
    invoke-direct {v1, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    new-instance v4, Ljava/util/Date;

    .line 133
    .line 134
    iget-wide v5, p0, Lcom/cosmos/photon/push/notification/MoNotify;->showExpire:J

    .line 135
    .line 136
    invoke-direct {v4, v5, v6}, Ljava/util/Date;-><init>(J)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v1, v4}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    filled-new-array {v2, v0, p0}, [Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    const-string v0, "notify(%s) expired currentTime(%s) > expireTime(%s)"

    .line 148
    .line 149
    invoke-static {v3, v0, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 150
    .line 151
    .line 152
    :cond_2
    return-void
.end method
