.class public Lcom/cosmos/photon/push/thirdparty/oppo/OppoAppPushService;
.super Lcom/heytap/mcssdk/AppPushService;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/heytap/mcssdk/AppPushService;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public processMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/AppMessage;)V
    .locals 0

    .line 9
    invoke-super {p0, p1, p2}, Lcom/heytap/mcssdk/AppPushService;->processMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/AppMessage;)V

    return-void
.end method

.method public processMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/CommandMessage;)V
    .locals 0

    .line 10
    invoke-super {p0, p1, p2}, Lcom/heytap/mcssdk/AppPushService;->processMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/CommandMessage;)V

    return-void
.end method

.method public processMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/SptDataMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-super {p0, p1, p2}, Lcom/heytap/mcssdk/AppPushService;->processMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/SptDataMessage;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
