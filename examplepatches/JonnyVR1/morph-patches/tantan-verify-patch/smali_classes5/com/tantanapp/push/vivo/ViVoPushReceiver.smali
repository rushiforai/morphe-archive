.class public Lcom/tantanapp/push/vivo/ViVoPushReceiver;
.super Lcom/vivo/push/sdk/OpenClientPushMessageReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;
    }
.end annotation


# static fields
.field public static final PUSH_NAME:Ljava/lang/String; = "vivopush"


# instance fields
.field private controller:Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/vivo/push/sdk/OpenClientPushMessageReceiver;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;-><init>(Lcom/tantanapp/push/vivo/ViVoPushReceiver;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tantanapp/push/vivo/ViVoPushReceiver;->controller:Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic access$100(Lcom/tantanapp/push/vivo/ViVoPushReceiver;)Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/push/vivo/ViVoPushReceiver;->controller:Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public static shouldApplyVivoPush()Z
    .locals 2

    .line 1
    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "vivo"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/vivo/push/PushClient;->getInstance(Landroid/content/Context;)Lcom/vivo/push/PushClient;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lcom/vivo/push/PushClient;->isSupport()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    return v0

    .line 31
    :cond_0
    const/4 v0, 0x0

    .line 32
    return v0
.end method


# virtual methods
.method public getController()Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/push/vivo/ViVoPushReceiver;->controller:Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public onNotificationMessageClicked(Landroid/content/Context;Lcom/vivo/push/model/UPSNotificationMessage;)V
    .locals 0

    return-void
.end method

.method public onReceiveRegId(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/tantanapp/push/vivo/ViVoPushReceiver;->controller:Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p1, v0}, Ll/hmb0;->f(Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/tantanapp/push/vivo/ViVoPushReceiver;->controller:Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;

    .line 14
    .line 15
    invoke-virtual {p0, p2}, Ll/hmb0;->h(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
