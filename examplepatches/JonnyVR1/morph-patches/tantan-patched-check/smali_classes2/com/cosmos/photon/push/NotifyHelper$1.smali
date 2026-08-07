.class Lcom/cosmos/photon/push/NotifyHelper$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cosmos/photon/push/NotifyHelper;->sendNotify(Landroid/content/Context;Lcom/cosmos/photon/push/notification/MoNotify;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic val$config:Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$intent:Landroid/content/Intent;

.field final synthetic val$notify:Lcom/cosmos/photon/push/notification/MoNotify;


# direct methods
.method public constructor <init>(Lcom/cosmos/photon/push/notification/MoNotify;Landroid/content/Context;Landroid/content/Intent;Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/NotifyHelper$1;->val$notify:Lcom/cosmos/photon/push/notification/MoNotify;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/cosmos/photon/push/NotifyHelper$1;->val$context:Landroid/content/Context;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/cosmos/photon/push/NotifyHelper$1;->val$intent:Landroid/content/Intent;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/cosmos/photon/push/NotifyHelper$1;->val$config:Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .line 1
    const-string v1, "MoPush-IMAGE"

    .line 2
    .line 3
    const-string v2, "MoPush-Notify"

    .line 4
    .line 5
    const/4 v3, 0x0

    .line 6
    :try_start_0
    new-instance v0, Lcom/cosmos/photon/push/NotifyHelper$1$1;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Lcom/cosmos/photon/push/NotifyHelper$1$1;-><init>(Lcom/cosmos/photon/push/NotifyHelper$1;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Lcom/cosmos/photon/push/util/ThreadUtils;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 12
    .line 13
    .line 14
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    goto :goto_4

    .line 18
    :catch_0
    move-exception v0

    .line 19
    :try_start_1
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    .line 21
    .line 22
    move-object v0, v3

    .line 23
    :goto_0
    :try_start_2
    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 24
    .line 25
    const-wide/16 v5, 0xa

    .line 26
    .line 27
    invoke-interface {v0, v5, v6, v4}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Landroid/graphics/Bitmap;
    :try_end_2
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 32
    .line 33
    move-object v3, v0

    .line 34
    goto :goto_5

    .line 35
    :catch_1
    move-exception v0

    .line 36
    goto :goto_1

    .line 37
    :catch_2
    move-exception v0

    .line 38
    goto :goto_2

    .line 39
    :catch_3
    move-exception v0

    .line 40
    goto :goto_3

    .line 41
    :goto_1
    :try_start_3
    invoke-static {v2, v0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 42
    .line 43
    .line 44
    goto :goto_5

    .line 45
    :goto_2
    invoke-static {v2, v0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 46
    .line 47
    .line 48
    goto :goto_5

    .line 49
    :goto_3
    invoke-static {v2, v0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 50
    .line 51
    .line 52
    goto :goto_5

    .line 53
    :goto_4
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    :goto_5
    if-nez v3, :cond_0

    .line 57
    .line 58
    iget-object v0, p0, Lcom/cosmos/photon/push/NotifyHelper$1;->val$context:Landroid/content/Context;

    .line 59
    .line 60
    iget-object v1, p0, Lcom/cosmos/photon/push/NotifyHelper$1;->val$notify:Lcom/cosmos/photon/push/notification/MoNotify;

    .line 61
    .line 62
    invoke-static {v0, v1}, Lcom/cosmos/photon/push/NotifyHelper;->access$000(Landroid/content/Context;Lcom/cosmos/photon/push/notification/MoNotify;)Landroid/graphics/Bitmap;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    :cond_0
    move-object v5, v3

    .line 67
    iget-object v4, p0, Lcom/cosmos/photon/push/NotifyHelper$1;->val$context:Landroid/content/Context;

    .line 68
    .line 69
    sget-object v0, Lcom/cosmos/photon/push/PhotonPushManager;->messageReceiver:Lcom/cosmos/photon/push/PushMessageReceiver;

    .line 70
    .line 71
    iget-object v1, p0, Lcom/cosmos/photon/push/NotifyHelper$1;->val$notify:Lcom/cosmos/photon/push/notification/MoNotify;

    .line 72
    .line 73
    iget-object v1, v1, Lcom/cosmos/photon/push/notification/MoNotify;->type:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Lcom/cosmos/photon/push/PushMessageReceiver;->getSmallIcon(Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v6

    .line 79
    iget-object v0, p0, Lcom/cosmos/photon/push/NotifyHelper$1;->val$notify:Lcom/cosmos/photon/push/notification/MoNotify;

    .line 80
    .line 81
    iget-object v7, v0, Lcom/cosmos/photon/push/notification/MoNotify;->title:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v8, v0, Lcom/cosmos/photon/push/notification/MoNotify;->desc:Ljava/lang/String;

    .line 84
    .line 85
    iget-object v9, v0, Lcom/cosmos/photon/push/notification/MoNotify;->type:Ljava/lang/String;

    .line 86
    .line 87
    iget-object v10, p0, Lcom/cosmos/photon/push/NotifyHelper$1;->val$intent:Landroid/content/Intent;

    .line 88
    .line 89
    iget-object v11, p0, Lcom/cosmos/photon/push/NotifyHelper$1;->val$config:Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;

    .line 90
    .line 91
    iget-wide v12, v0, Lcom/cosmos/photon/push/notification/MoNotify;->time:J

    .line 92
    .line 93
    iget-object v14, v0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 94
    .line 95
    invoke-static/range {v4 .. v14}, Lcom/cosmos/photon/push/NotifyHelper;->access$100(Landroid/content/Context;Landroid/graphics/Bitmap;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;JLjava/util/Map;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method
