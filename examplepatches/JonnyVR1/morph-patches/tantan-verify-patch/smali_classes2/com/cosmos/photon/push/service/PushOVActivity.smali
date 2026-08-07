.class public Lcom/cosmos/photon/push/service/PushOVActivity;
.super Landroid/app/Activity;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private dispatchPushArrived(Lcom/cosmos/photon/push/notification/MoNotify;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getMessageReceiver()Lcom/cosmos/photon/push/PushMessageReceiver;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/cosmos/photon/push/PushMessageReceiver;->onNotificationShow(Lcom/cosmos/photon/push/notification/MoNotify;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    invoke-static {p1}, Lcom/cosmos/photon/push/DataProcessor;->onPushArrivedInner(Lcom/cosmos/photon/push/notification/MoNotify;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    new-instance p0, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 16
    .line 17
    invoke-direct {p0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v0, "push:self"

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->pushSource(Ljava/lang/String;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-wide v1, p1, Lcom/cosmos/photon/push/notification/MoNotify;->time:J

    .line 27
    .line 28
    invoke-virtual {v0, v1, v2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->time(J)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object v1, p1, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->data(Ljava/util/Map;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget p1, p1, Lcom/cosmos/photon/push/notification/MoNotify;->logType:I

    .line 39
    .line 40
    invoke-virtual {v0, p1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->uploadType(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    sget v0, Lcom/cosmos/photon/push/statistic/EventLogBody;->TYPE_ARRIVED_NOT_SHOWN:I

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->type(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const/4 v0, 0x7

    .line 51
    invoke-virtual {p1, v0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->reason(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->build()Lcom/cosmos/photon/push/statistic/EventLogBody;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-static {p0}, Lcom/cosmos/photon/push/statistic/PushEventStatistic;->logPushEventInfo(Lcom/cosmos/photon/push/statistic/EventLogBody;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public static transData(Lcom/cosmos/photon/push/notification/MoNotify;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/ComponentName;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/cosmos/photon/push/notification/MoNotify;->toPkg:Ljava/lang/String;

    .line 4
    .line 5
    const-string v2, "com.cosmos.photon.push.service.PushOVActivity"

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Landroid/content/Intent;

    .line 11
    .line 12
    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string v0, "data"

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/cosmos/photon/push/notification/MoNotify;->toJson()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v1, v0, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    const/high16 p0, 0x10000000

    .line 28
    .line 29
    invoke-virtual {v1, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "trans data by PushOVActivity"

    .line 5
    .line 6
    const-string v0, "MoPush-Channel"

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-class v1, Lcom/cosmos/photon/push/notification/MoNotify;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p1, v1}, Landroid/content/Intent;->setExtrasClassLoader(Ljava/lang/ClassLoader;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string v1, "data"

    .line 29
    .line 30
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-static {p1}, Lcom/cosmos/photon/push/notification/MoNotify;->fromJson(Ljava/lang/String;)Lcom/cosmos/photon/push/notification/MoNotify;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-direct {p0, p1}, Lcom/cosmos/photon/push/service/PushOVActivity;->dispatchPushArrived(Lcom/cosmos/photon/push/notification/MoNotify;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :catchall_0
    move-exception p1

    .line 46
    :try_start_1
    invoke-static {v0, p1}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :catchall_1
    move-exception p1

    .line 54
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 55
    .line 56
    .line 57
    throw p1
.end method
