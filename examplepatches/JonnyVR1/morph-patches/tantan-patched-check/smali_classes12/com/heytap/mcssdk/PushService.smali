.class public Lcom/heytap/mcssdk/PushService;
.super Landroid/app/Service;

# interfaces
.implements Lcom/heytap/mcssdk/callback/MessageCallback;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 1

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1, p0}, Lcom/heytap/mcssdk/PushParseHelper;->parseIntent(Landroid/content/Context;Landroid/content/Intent;Lcom/heytap/mcssdk/callback/MessageCallback;)V

    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result p0

    return p0
.end method

.method public processMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/AppMessage;)V
    .locals 0

    .line 2
    return-void
.end method

.method public processMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/CommandMessage;)V
    .locals 1

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "mcssdk-processMessage:"

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/heytap/mcssdk/mode/CommandMessage;->getCommand()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/heytap/mcssdk/utils/LogUtil;->d(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {}, Lcom/heytap/mcssdk/PushManager;->getInstance()Lcom/heytap/mcssdk/PushManager;

    move-result-object p1

    invoke-static {p0, p2, p1}, Lcom/heytap/mcssdk/PushParseHelper;->parseCommandMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/CommandMessage;Lcom/heytap/mcssdk/PushManager;)V

    return-void
.end method

.method public processMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/SptDataMessage;)V
    .locals 0

    .line 3
    return-void
.end method
