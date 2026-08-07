.class public Ll/de00;
.super Ll/hmb0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/de00$c;
    }
.end annotation


# static fields
.field public static volatile f:Ll/de00;


# instance fields
.field public final d:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public e:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/hmb0;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/de00;->d:Lrx/subjects/a;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Ll/de00;->e:Z

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic l(Ll/de00;)Lrx/subjects/a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/de00;->d:Lrx/subjects/a;

    return-object p0
.end method

.method public static bridge synthetic m(Ll/de00;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/de00;->e:Z

    return-void
.end method

.method public static n()Ll/de00;
    .locals 2

    .line 1
    sget-object v0, Ll/de00;->f:Ll/de00;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/de00;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/de00;->f:Ll/de00;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/de00;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/de00;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/de00;->f:Ll/de00;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/de00;->f:Ll/de00;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public a(Landroid/content/Intent;)Z
    .locals 4

    .line 1
    const-string v0, "custom"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    :try_start_0
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1, v2}, Ll/hmb0;->c(Ljava/lang/String;Z)Z

    .line 15
    .line 16
    .line 17
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    return p0

    .line 19
    :catch_0
    move-exception p0

    .line 20
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_0
    const-string v1, "key_message"

    .line 25
    .line 26
    invoke-virtual {p1, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-eqz v3, :cond_2

    .line 31
    .line 32
    :try_start_1
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Lcom/xiaomi/mipush/sdk/MiPushMessage;

    .line 37
    .line 38
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/xiaomi/mipush/sdk/MiPushMessage;->getExtra()Ljava/util/Map;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_1

    .line 53
    .line 54
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    check-cast p1, Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p0, p1, v2}, Ll/hmb0;->c(Ljava/lang/String;Z)Z

    .line 61
    .line 62
    .line 63
    move-result p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 64
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/MiPushClient;->clearNotification(Landroid/content/Context;)V

    .line 69
    .line 70
    .line 71
    return p0

    .line 72
    :cond_1
    :goto_0
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/MiPushClient;->clearNotification(Landroid/content/Context;)V

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :catch_1
    move-exception p0

    .line 81
    :try_start_2
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :catchall_0
    move-exception p0

    .line 86
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/MiPushClient;->clearNotification(Landroid/content/Context;)V

    .line 91
    .line 92
    .line 93
    throw p0

    .line 94
    :cond_2
    :goto_1
    const/4 p0, 0x0

    .line 95
    return p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "mopushT"

    .line 2
    .line 3
    return-object p0
.end method

.method public i()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/de00;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    monitor-enter p0

    .line 7
    :try_start_0
    iget-boolean v0, p0, Ll/de00;->e:Z

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Ll/de00;->e:Z

    .line 13
    .line 14
    const-string v0, "[common][push]"

    .line 15
    .line 16
    const-string v1, "MoPush start!"

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Lcom/cosmos/photon/push/PhotonPushManager;->getInstance()Lcom/cosmos/photon/push/PhotonPushManager;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lcom/cosmos/photon/push/PhotonPushManager;->register()V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/de00;->d:Lrx/subjects/a;

    .line 29
    .line 30
    new-instance v1, Ll/de00$a;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/de00$a;-><init>(Ll/de00;)V

    .line 33
    .line 34
    .line 35
    new-instance v2, Ll/de00$b;

    .line 36
    .line 37
    invoke-direct {v2, p0}, Ll/de00$b;-><init>(Ll/de00;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catchall_0
    move-exception v0

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    :goto_0
    monitor-exit p0

    .line 51
    return-void

    .line 52
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    throw v0
.end method

.method public o(Landroid/app/Application;)V
    .locals 3

    .line 1
    const-string v0, "[common][push]"

    .line 2
    .line 3
    const-string v1, "MoPush init!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/rr2;->b()Ll/rr2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "sp_protocal"

    .line 13
    .line 14
    const-string v2, "https"

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Ll/rr2;->c(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v1, 0x0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-static {}, Lcom/cosmos/photon/push/PhotonPushManager;->getInstance()Lcom/cosmos/photon/push/PhotonPushManager;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v2, Ll/de00$c;

    .line 32
    .line 33
    invoke-direct {v2, p0, v1}, Ll/de00$c;-><init>(Ll/de00;Ll/ee00;)V

    .line 34
    .line 35
    .line 36
    const-string p0, "7d619d2a0cc234d97768aecf533d7aa9"

    .line 37
    .line 38
    invoke-virtual {v0, p1, p0, v2}, Lcom/cosmos/photon/push/PhotonPushManager;->init(Landroid/app/Application;Ljava/lang/String;Lcom/cosmos/photon/push/PushMessageReceiver;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    invoke-static {}, Lcom/cosmos/photon/push/PhotonPushManager;->getInstance()Lcom/cosmos/photon/push/PhotonPushManager;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v2, Ll/de00$c;

    .line 47
    .line 48
    invoke-direct {v2, p0, v1}, Ll/de00$c;-><init>(Ll/de00;Ll/ee00;)V

    .line 49
    .line 50
    .line 51
    const-string p0, "f5cdebeda60c5cd421d53c3e5c03a2d5"

    .line 52
    .line 53
    invoke-virtual {v0, p1, p0, v2}, Lcom/cosmos/photon/push/PhotonPushManager;->init(Landroid/app/Application;Ljava/lang/String;Lcom/cosmos/photon/push/PushMessageReceiver;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method
