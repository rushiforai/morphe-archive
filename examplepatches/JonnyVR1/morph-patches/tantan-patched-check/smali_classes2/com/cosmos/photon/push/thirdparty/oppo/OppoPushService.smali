.class public Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushService;
.super Lcom/heytap/mcssdk/PushService;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/heytap/mcssdk/PushService;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public processMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/AppMessage;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/heytap/mcssdk/PushService;->processMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/AppMessage;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public processMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/CommandMessage;)V
    .locals 0

    .line 6
    invoke-super {p0, p1, p2}, Lcom/heytap/mcssdk/PushService;->processMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/CommandMessage;)V

    return-void
.end method

.method public processMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/SptDataMessage;)V
    .locals 0

    .line 5
    invoke-super {p0, p1, p2}, Lcom/heytap/mcssdk/PushService;->processMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/SptDataMessage;)V

    return-void
.end method
