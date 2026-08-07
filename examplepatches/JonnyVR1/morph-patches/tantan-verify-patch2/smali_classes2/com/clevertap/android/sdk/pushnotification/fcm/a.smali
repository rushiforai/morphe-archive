.class public Lcom/clevertap/android/sdk/pushnotification/fcm/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ptl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/ptl;"
    }
.end annotation


# instance fields
.field private final a:Ll/b1m;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/b1m<",
            "Lcom/google/firebase/messaging/RemoteMessage;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/clevertap/android/sdk/pushnotification/fcm/b;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/clevertap/android/sdk/pushnotification/fcm/b;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/clevertap/android/sdk/pushnotification/fcm/a;-><init>(Ll/b1m;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ll/b1m;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/b1m<",
            "Lcom/google/firebase/messaging/RemoteMessage;",
            ">;)V"
        }
    .end annotation

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/clevertap/android/sdk/pushnotification/fcm/a;->a:Ll/b1m;

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;Lcom/google/firebase/messaging/RemoteMessage;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/pushnotification/fcm/a;->a:Ll/b1m;

    .line 2
    .line 3
    invoke-interface {p0, p2}, Ll/b1m;->a(Ljava/lang/Object;)Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ll/olg;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/olg;-><init>(Landroid/os/Bundle;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p2}, Ll/olg;->a(Lcom/google/firebase/messaging/RemoteMessage;)Ll/a1m;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p0}, Ll/a1m;->build()Landroid/os/Bundle;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {}, Lcom/clevertap/android/sdk/pushnotification/PushNotificationHandler;->d()Ll/oz40;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    const-string v0, "FCM"

    .line 27
    .line 28
    invoke-interface {p2, p1, p0, v0}, Ll/oz40;->a(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public b(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 3

    .line 1
    const-string p0, "PushProvider"

    .line 2
    .line 3
    const-string v0, "FCMNew token received from FCM - "

    .line 4
    .line 5
    :try_start_0
    invoke-static {}, Lcom/clevertap/android/sdk/pushnotification/PushNotificationHandler;->d()Ll/oz40;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget-object v2, Ll/gmb0;->a:Ll/kob0;

    .line 10
    .line 11
    invoke-interface {v1, p1, p2, v2}, Ll/oz40;->b(Landroid/content/Context;Ljava/lang/String;Ll/kob0;)Z

    .line 12
    .line 13
    .line 14
    new-instance p1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-static {p0, p1}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    const-string p2, "FCMError onNewToken"

    .line 33
    .line 34
    invoke-static {p0, p2, p1}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x0

    .line 38
    return p0
.end method
