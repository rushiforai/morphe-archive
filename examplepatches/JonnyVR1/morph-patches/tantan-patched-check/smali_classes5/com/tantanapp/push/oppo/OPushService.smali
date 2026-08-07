.class public Lcom/tantanapp/push/oppo/OPushService;
.super Lcom/heytap/mcssdk/PushService;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/push/oppo/OPushService$a;
    }
.end annotation


# static fields
.field public static final PUSH_NAME:Ljava/lang/String; = "opush"

.field public static final TAG:Ljava/lang/String; = "OPushService"


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

.method public static isSupportPush()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/heytap/mcssdk/PushManager;->isSupportPush(Landroid/content/Context;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    return v0
.end method


# virtual methods
.method public processMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/AppMessage;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/heytap/mcssdk/PushService;->processMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/AppMessage;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Lcom/heytap/mcssdk/mode/AppMessage;->getContent()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    sget-object p0, Ll/kmk0;->a:Ljava/lang/String;

    .line 8
    .line 9
    return-void
.end method

.method public processMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/SptDataMessage;)V
    .locals 0

    .line 10
    invoke-super {p0, p1, p2}, Lcom/heytap/mcssdk/PushService;->processMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/SptDataMessage;)V

    .line 11
    invoke-virtual {p2}, Lcom/heytap/mcssdk/mode/SptDataMessage;->getContent()Ljava/lang/String;

    .line 12
    sget-object p0, Ll/kmk0;->a:Ljava/lang/String;

    return-void
.end method
