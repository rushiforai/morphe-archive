.class Lcom/cosmos/photon/push/DataProcessor$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cosmos/photon/push/DataProcessor;->onPushArrivedInner(Lcom/cosmos/photon/push/notification/MoNotify;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic val$notify:Lcom/cosmos/photon/push/notification/MoNotify;


# direct methods
.method public constructor <init>(Lcom/cosmos/photon/push/notification/MoNotify;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/DataProcessor$1;->val$notify:Lcom/cosmos/photon/push/notification/MoNotify;

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
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/push/DataProcessor$1;->val$notify:Lcom/cosmos/photon/push/notification/MoNotify;

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "MoPush-Notify"

    .line 8
    .line 9
    const-string v2, "onPushArrivedInner %s"

    .line 10
    .line 11
    invoke-static {v1, v2, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/cosmos/photon/push/DataProcessor$1;->val$notify:Lcom/cosmos/photon/push/notification/MoNotify;

    .line 15
    .line 16
    iget v2, v0, Lcom/cosmos/photon/push/notification/MoNotify;->multi:I

    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    if-ne v2, v3, :cond_1

    .line 20
    .line 21
    iget-object v0, v0, Lcom/cosmos/photon/push/notification/MoNotify;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/cosmos/photon/push/util/IDUtils;->exists(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget-object v2, p0, Lcom/cosmos/photon/push/DataProcessor$1;->val$notify:Lcom/cosmos/photon/push/notification/MoNotify;

    .line 28
    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, v2, Lcom/cosmos/photon/push/notification/MoNotify;->id:Ljava/lang/String;

    .line 32
    .line 33
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v2, "onPushArrivedInner duplicate id : %s "

    .line 38
    .line 39
    invoke-static {v1, v2, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    new-instance v0, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 43
    .line 44
    invoke-direct {v0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;-><init>()V

    .line 45
    .line 46
    .line 47
    :try_start_0
    iget-object v1, p0, Lcom/cosmos/photon/push/DataProcessor$1;->val$notify:Lcom/cosmos/photon/push/notification/MoNotify;

    .line 48
    .line 49
    iget-object v1, v1, Lcom/cosmos/photon/push/notification/MoNotify;->action:Ljava/lang/String;

    .line 50
    .line 51
    const/4 v2, 0x0

    .line 52
    invoke-static {v1, v2}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-static {v1}, Lcom/cosmos/photon/push/DataProcessor;->getPushSource(Landroid/content/Intent;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    goto :goto_0

    .line 61
    :catchall_0
    const-string v1, "unknown"

    .line 62
    .line 63
    :goto_0
    invoke-virtual {v0, v1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->pushSource(Ljava/lang/String;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iget-object v2, p0, Lcom/cosmos/photon/push/DataProcessor$1;->val$notify:Lcom/cosmos/photon/push/notification/MoNotify;

    .line 68
    .line 69
    iget-wide v2, v2, Lcom/cosmos/photon/push/notification/MoNotify;->time:J

    .line 70
    .line 71
    invoke-virtual {v1, v2, v3}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->time(J)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    iget-object v2, p0, Lcom/cosmos/photon/push/DataProcessor$1;->val$notify:Lcom/cosmos/photon/push/notification/MoNotify;

    .line 76
    .line 77
    iget-object v2, v2, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 78
    .line 79
    invoke-virtual {v1, v2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->data(Ljava/util/Map;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    iget-object p0, p0, Lcom/cosmos/photon/push/DataProcessor$1;->val$notify:Lcom/cosmos/photon/push/notification/MoNotify;

    .line 84
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
    const/16 v1, 0x65

    .line 98
    .line 99
    invoke-virtual {p0, v1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->reason(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->build()Lcom/cosmos/photon/push/statistic/EventLogBody;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-static {p0}, Lcom/cosmos/photon/push/statistic/PushEventStatistic;->logPushEventInfo(Lcom/cosmos/photon/push/statistic/EventLogBody;)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_0
    iget-object v0, v2, Lcom/cosmos/photon/push/notification/MoNotify;->id:Ljava/lang/String;

    .line 111
    .line 112
    invoke-static {v0}, Lcom/cosmos/photon/push/util/IDUtils;->saveId(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    :cond_1
    :try_start_1
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    iget-object p0, p0, Lcom/cosmos/photon/push/DataProcessor$1;->val$notify:Lcom/cosmos/photon/push/notification/MoNotify;

    .line 120
    .line 121
    invoke-static {v0, p0}, Lcom/cosmos/photon/push/NotifyHelper;->sendNotify(Landroid/content/Context;Lcom/cosmos/photon/push/notification/MoNotify;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :catchall_1
    move-exception p0

    .line 126
    const-string v0, "MoPush-"

    .line 127
    .line 128
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 129
    .line 130
    .line 131
    return-void
.end method
