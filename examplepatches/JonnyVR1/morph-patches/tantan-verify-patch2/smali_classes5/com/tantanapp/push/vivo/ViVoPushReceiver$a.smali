.class public Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;
.super Ll/hmb0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/push/vivo/ViVoPushReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public d:Z

.field public final synthetic e:Lcom/tantanapp/push/vivo/ViVoPushReceiver;


# direct methods
.method public constructor <init>(Lcom/tantanapp/push/vivo/ViVoPushReceiver;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;->e:Lcom/tantanapp/push/vivo/ViVoPushReceiver;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/hmb0;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;->d:Z

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic l(Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;->m(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Landroid/content/Intent;)Z
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const-string v1, "vivo_push_messageId"

    .line 6
    .line 7
    invoke-virtual {p1, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-nez v2, :cond_1

    .line 12
    .line 13
    return v0

    .line 14
    :cond_1
    const-wide/16 v2, 0x0

    .line 15
    .line 16
    invoke-virtual {p1, v1, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    .line 17
    .line 18
    .line 19
    move-result-wide v4

    .line 20
    cmp-long v1, v4, v2

    .line 21
    .line 22
    if-nez v1, :cond_2

    .line 23
    .line 24
    return v0

    .line 25
    :cond_2
    const-string v1, "custom"

    .line 26
    .line 27
    invoke-virtual {p1, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-nez v2, :cond_3

    .line 32
    .line 33
    return v0

    .line 34
    :cond_3
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_4

    .line 43
    .line 44
    return v0

    .line 45
    :cond_4
    iget-object p0, p0, Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;->e:Lcom/tantanapp/push/vivo/ViVoPushReceiver;

    .line 46
    .line 47
    invoke-static {p0}, Lcom/tantanapp/push/vivo/ViVoPushReceiver;->access$100(Lcom/tantanapp/push/vivo/ViVoPushReceiver;)Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const/4 v0, 0x1

    .line 52
    invoke-virtual {p0, p1, v0}, Ll/hmb0;->c(Ljava/lang/String;Z)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    return p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "vivopush"

    .line 2
    .line 3
    return-object p0
.end method

.method public i()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;->d:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    monitor-enter p0

    .line 7
    :try_start_0
    iget-boolean v0, p0, Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;->d:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    :try_start_1
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/vivo/push/PushClient;->getInstance(Landroid/content/Context;)Lcom/vivo/push/PushClient;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/vivo/push/PushClient;->initialize()V

    .line 20
    .line 21
    .line 22
    iput-boolean v1, p0, Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;->d:Z
    :try_end_1
    .catch Lcom/vivo/push/util/VivoPushException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception v0

    .line 26
    goto :goto_1

    .line 27
    :catch_0
    move-exception v0

    .line 28
    :try_start_2
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    const-string v0, "[common][push]"

    .line 32
    .line 33
    const-string v1, "ViVoPushReceiver initialize error!"

    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    monitor-exit p0

    .line 39
    goto :goto_3

    .line 40
    :cond_0
    :goto_0
    monitor-exit p0

    .line 41
    goto :goto_2

    .line 42
    :goto_1
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 43
    throw v0

    .line 44
    :cond_1
    :goto_2
    const-string v0, "[common][push]"

    .line 45
    .line 46
    const-string v2, "ViVoPushReceiver start!"

    .line 47
    .line 48
    invoke-static {v0, v2}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {v0}, Lcom/vivo/push/PushClient;->getInstance(Landroid/content/Context;)Lcom/vivo/push/PushClient;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v2, Lcom/tantanapp/push/vivo/ViVoPushReceiver$a$a;

    .line 60
    .line 61
    invoke-direct {v2, p0}, Lcom/tantanapp/push/vivo/ViVoPushReceiver$a$a;-><init>(Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v2}, Lcom/vivo/push/PushClient;->turnOnPush(Lcom/vivo/push/IPushActionListener;)V

    .line 65
    .line 66
    .line 67
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {v0}, Lcom/vivo/push/PushClient;->getInstance(Landroid/content/Context;)Lcom/vivo/push/PushClient;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Lcom/vivo/push/PushClient;->getRegId()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-nez v2, :cond_2

    .line 84
    .line 85
    iget-object v2, p0, Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;->e:Lcom/tantanapp/push/vivo/ViVoPushReceiver;

    .line 86
    .line 87
    invoke-static {v2}, Lcom/tantanapp/push/vivo/ViVoPushReceiver;->access$100(Lcom/tantanapp/push/vivo/ViVoPushReceiver;)Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-virtual {v2, v1}, Ll/hmb0;->f(Z)V

    .line 92
    .line 93
    .line 94
    iget-object p0, p0, Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;->e:Lcom/tantanapp/push/vivo/ViVoPushReceiver;

    .line 95
    .line 96
    invoke-static {p0}, Lcom/tantanapp/push/vivo/ViVoPushReceiver;->access$100(Lcom/tantanapp/push/vivo/ViVoPushReceiver;)Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {p0, v0}, Ll/hmb0;->h(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    :cond_2
    :goto_3
    return-void
.end method

.method public final m(I)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p1, v0, :cond_0

    .line 3
    .line 4
    if-nez p1, :cond_1

    .line 5
    .line 6
    :cond_0
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p1}, Lcom/vivo/push/PushClient;->getInstance(Landroid/content/Context;)Lcom/vivo/push/PushClient;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Lcom/vivo/push/PushClient;->getRegId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_1

    .line 23
    .line 24
    iget-object v1, p0, Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;->e:Lcom/tantanapp/push/vivo/ViVoPushReceiver;

    .line 25
    .line 26
    invoke-static {v1}, Lcom/tantanapp/push/vivo/ViVoPushReceiver;->access$100(Lcom/tantanapp/push/vivo/ViVoPushReceiver;)Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1, v0}, Ll/hmb0;->f(Z)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;->e:Lcom/tantanapp/push/vivo/ViVoPushReceiver;

    .line 34
    .line 35
    invoke-static {p0}, Lcom/tantanapp/push/vivo/ViVoPushReceiver;->access$100(Lcom/tantanapp/push/vivo/ViVoPushReceiver;)Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0, p1}, Ll/hmb0;->h(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method
