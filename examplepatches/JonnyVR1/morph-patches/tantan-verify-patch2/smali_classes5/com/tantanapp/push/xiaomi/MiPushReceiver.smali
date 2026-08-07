.class public Lcom/tantanapp/push/xiaomi/MiPushReceiver;
.super Lcom/xiaomi/mipush/sdk/PushMessageReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/push/xiaomi/MiPushReceiver$a;
    }
.end annotation


# static fields
.field public static final PUSH_NAME:Ljava/lang/String; = "mipush"


# instance fields
.field private controller:Lcom/tantanapp/push/xiaomi/MiPushReceiver$a;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/PushMessageReceiver;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tantanapp/push/xiaomi/MiPushReceiver$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/tantanapp/push/xiaomi/MiPushReceiver$a;-><init>(Lcom/tantanapp/push/xiaomi/MiPushReceiver;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tantanapp/push/xiaomi/MiPushReceiver;->controller:Lcom/tantanapp/push/xiaomi/MiPushReceiver$a;

    .line 10
    .line 11
    return-void
.end method

.method public static shouldUseMIUIPush()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/MiPushClient;->shouldUseMIUIPush(Landroid/content/Context;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    return v0
.end method


# virtual methods
.method public getController()Lcom/tantanapp/push/xiaomi/MiPushReceiver$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/push/xiaomi/MiPushReceiver;->controller:Lcom/tantanapp/push/xiaomi/MiPushReceiver$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public onCommandResult(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/MiPushCommandMessage;)V
    .locals 5

    .line 1
    invoke-virtual {p2}, Lcom/xiaomi/mipush/sdk/MiPushCommandMessage;->getCommand()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p2}, Lcom/xiaomi/mipush/sdk/MiPushCommandMessage;->getCommandArguments()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-lez v3, :cond_0

    .line 18
    .line 19
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/String;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move-object v0, v1

    .line 27
    :goto_0
    const-string v3, "register"

    .line 28
    .line 29
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_2

    .line 34
    .line 35
    invoke-virtual {p2}, Lcom/xiaomi/mipush/sdk/MiPushCommandMessage;->getResultCode()J

    .line 36
    .line 37
    .line 38
    move-result-wide p1

    .line 39
    const-wide/16 v3, 0x0

    .line 40
    .line 41
    cmp-long p1, p1, v3

    .line 42
    .line 43
    if-nez p1, :cond_1

    .line 44
    .line 45
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-nez p1, :cond_1

    .line 50
    .line 51
    iget-object p1, p0, Lcom/tantanapp/push/xiaomi/MiPushReceiver;->controller:Lcom/tantanapp/push/xiaomi/MiPushReceiver$a;

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Ll/hmb0;->h(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/tantanapp/push/xiaomi/MiPushReceiver;->controller:Lcom/tantanapp/push/xiaomi/MiPushReceiver$a;

    .line 57
    .line 58
    const/4 p1, 0x1

    .line 59
    invoke-virtual {p0, p1}, Ll/hmb0;->f(Z)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    iget-object p1, p0, Lcom/tantanapp/push/xiaomi/MiPushReceiver;->controller:Lcom/tantanapp/push/xiaomi/MiPushReceiver$a;

    .line 64
    .line 65
    invoke-virtual {p1, v2}, Ll/hmb0;->f(Z)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/tantanapp/push/xiaomi/MiPushReceiver;->controller:Lcom/tantanapp/push/xiaomi/MiPushReceiver$a;

    .line 69
    .line 70
    invoke-virtual {p1, v1}, Ll/hmb0;->h(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Lcom/tantanapp/push/xiaomi/MiPushReceiver;->controller:Lcom/tantanapp/push/xiaomi/MiPushReceiver$a;

    .line 74
    .line 75
    iput-boolean v2, p0, Lcom/tantanapp/push/xiaomi/MiPushReceiver$a;->d:Z

    .line 76
    .line 77
    :cond_2
    return-void
.end method

.method public onNotificationMessageArrived(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/MiPushMessage;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Lcom/xiaomi/mipush/sdk/MiPushMessage;->getNotifyId()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p1, v0}, Lcom/xiaomi/mipush/sdk/MiPushClient;->clearNotification(Landroid/content/Context;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2}, Lcom/xiaomi/mipush/sdk/MiPushMessage;->getExtra()Ljava/util/Map;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    const-string p2, "custom"

    .line 19
    .line 20
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Ljava/lang/String;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/tantanapp/push/xiaomi/MiPushReceiver;->controller:Lcom/tantanapp/push/xiaomi/MiPushReceiver$a;

    .line 27
    .line 28
    const/4 p2, 0x0

    .line 29
    invoke-virtual {p0, p1, p2}, Ll/hmb0;->c(Ljava/lang/String;Z)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public onReceivePassThroughMessage(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/MiPushMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Lcom/xiaomi/mipush/sdk/MiPushMessage;->getExtra()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    const-string p2, "custom"

    .line 12
    .line 13
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Ljava/lang/String;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/tantanapp/push/xiaomi/MiPushReceiver;->controller:Lcom/tantanapp/push/xiaomi/MiPushReceiver$a;

    .line 20
    .line 21
    const/4 p2, 0x0

    .line 22
    invoke-virtual {p0, p1, p2}, Ll/hmb0;->c(Ljava/lang/String;Z)Z

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method
