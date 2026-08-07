.class public Lcom/vivo/push/ups/VUpsManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vivo/push/ups/VUpsManager$a;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getInstance()Lcom/vivo/push/ups/VUpsManager;
    .locals 1

    .line 1
    invoke-static {}, Lcom/vivo/push/ups/VUpsManager$a;->a()Lcom/vivo/push/ups/VUpsManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public onCommandResult(Landroid/content/Context;Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public registerToken(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/vivo/push/ups/UPSRegisterCallback;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/vivo/push/PushClient;->getInstance(Landroid/content/Context;)Lcom/vivo/push/PushClient;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    new-instance p3, Lcom/vivo/push/ups/a;

    .line 6
    .line 7
    invoke-direct {p3, p0, p5, p1}, Lcom/vivo/push/ups/a;-><init>(Lcom/vivo/push/ups/VUpsManager;Lcom/vivo/push/ups/UPSRegisterCallback;Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2, p3}, Lcom/vivo/push/PushClient;->turnOnPush(Lcom/vivo/push/IPushActionListener;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public turnOffPush(Landroid/content/Context;Lcom/vivo/push/ups/UPSTurnCallback;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/vivo/push/PushClient;->getInstance(Landroid/content/Context;)Lcom/vivo/push/PushClient;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Lcom/vivo/push/ups/d;

    .line 6
    .line 7
    invoke-direct {v0, p0, p2}, Lcom/vivo/push/ups/d;-><init>(Lcom/vivo/push/ups/VUpsManager;Lcom/vivo/push/ups/UPSTurnCallback;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lcom/vivo/push/PushClient;->turnOffPush(Lcom/vivo/push/IPushActionListener;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public turnOnPush(Landroid/content/Context;Lcom/vivo/push/ups/UPSTurnCallback;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/vivo/push/PushClient;->getInstance(Landroid/content/Context;)Lcom/vivo/push/PushClient;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Lcom/vivo/push/ups/c;

    .line 6
    .line 7
    invoke-direct {v0, p0, p2}, Lcom/vivo/push/ups/c;-><init>(Lcom/vivo/push/ups/VUpsManager;Lcom/vivo/push/ups/UPSTurnCallback;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lcom/vivo/push/PushClient;->turnOnPush(Lcom/vivo/push/IPushActionListener;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public unRegisterToken(Landroid/content/Context;Lcom/vivo/push/ups/UPSRegisterCallback;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/vivo/push/PushClient;->getInstance(Landroid/content/Context;)Lcom/vivo/push/PushClient;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Lcom/vivo/push/ups/b;

    .line 6
    .line 7
    invoke-direct {v0, p0, p2}, Lcom/vivo/push/ups/b;-><init>(Lcom/vivo/push/ups/VUpsManager;Lcom/vivo/push/ups/UPSRegisterCallback;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lcom/vivo/push/PushClient;->turnOffPush(Lcom/vivo/push/IPushActionListener;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
