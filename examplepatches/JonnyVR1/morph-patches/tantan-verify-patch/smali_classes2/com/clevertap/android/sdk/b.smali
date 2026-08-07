.class Lcom/clevertap/android/sdk/b;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final a:Ll/sk0;

.field private final b:Ll/ik2;

.field private final c:Ll/ch2;

.field private final d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

.field private final e:Landroid/content/Context;

.field private final f:Ll/bu9;

.field private final g:Lcom/clevertap/android/sdk/inapp/InAppController;

.field private final h:Ll/cob0;

.field private final i:Ll/xse0;

.field private final j:Ll/su3;

.field private final k:Ll/oa5;

.field private final l:Lcom/clevertap/android/sdk/inbox/InboxV2Bridge;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/sk0;Ll/bu9;Ll/xse0;Ll/cob0;Ll/ch2;Lcom/clevertap/android/sdk/inapp/InAppController;Ll/ik2;Ll/su3;Ll/oa5;Lcom/clevertap/android/sdk/inbox/InboxV2Bridge;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/clevertap/android/sdk/b;->e:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/clevertap/android/sdk/b;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/clevertap/android/sdk/b;->a:Ll/sk0;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/clevertap/android/sdk/b;->f:Ll/bu9;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/clevertap/android/sdk/b;->i:Ll/xse0;

    .line 13
    .line 14
    iput-object p6, p0, Lcom/clevertap/android/sdk/b;->h:Ll/cob0;

    .line 15
    .line 16
    iput-object p7, p0, Lcom/clevertap/android/sdk/b;->c:Ll/ch2;

    .line 17
    .line 18
    iput-object p8, p0, Lcom/clevertap/android/sdk/b;->g:Lcom/clevertap/android/sdk/inapp/InAppController;

    .line 19
    .line 20
    iput-object p9, p0, Lcom/clevertap/android/sdk/b;->b:Ll/ik2;

    .line 21
    .line 22
    iput-object p10, p0, Lcom/clevertap/android/sdk/b;->j:Ll/su3;

    .line 23
    .line 24
    iput-object p11, p0, Lcom/clevertap/android/sdk/b;->k:Ll/oa5;

    .line 25
    .line 26
    iput-object p12, p0, Lcom/clevertap/android/sdk/b;->l:Lcom/clevertap/android/sdk/inbox/InboxV2Bridge;

    .line 27
    .line 28
    return-void
.end method

.method public static synthetic a(Lcom/clevertap/android/sdk/b;)Ljava/lang/Void;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/b;->e:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/clevertap/android/sdk/b;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/clevertap/android/sdk/b;->k:Ll/oa5;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/clevertap/android/sdk/Utils;->b(Landroid/content/Context;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/oa5;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public static synthetic b(Lcom/clevertap/android/sdk/b;)Ll/bu9;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/b;->f:Ll/bu9;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Lcom/clevertap/android/sdk/b;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/b;->e:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Lcom/clevertap/android/sdk/b;)Lcom/clevertap/android/sdk/CleverTapInstanceConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/b;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Lcom/clevertap/android/sdk/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/clevertap/android/sdk/b;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/clevertap/android/sdk/b;)Ll/su3;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/b;->j:Ll/su3;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g(Lcom/clevertap/android/sdk/b;)Ll/sk0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/b;->a:Ll/sk0;

    .line 2
    .line 3
    return-object p0
.end method

.method private j()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/b;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/clevertap/android/sdk/b;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "Starting to handle install referrer"

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :try_start_0
    iget-object v0, p0, Lcom/clevertap/android/sdk/b;->e:Landroid/content/Context;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/android/installreferrer/api/InstallReferrerClient;->newBuilder(Landroid/content/Context;)Lcom/android/installreferrer/api/InstallReferrerClient$Builder;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lcom/android/installreferrer/api/InstallReferrerClient$Builder;->build()Lcom/android/installreferrer/api/InstallReferrerClient;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Lcom/clevertap/android/sdk/b$c;

    .line 29
    .line 30
    invoke-direct {v1, p0, v0}, Lcom/clevertap/android/sdk/b$c;-><init>(Lcom/clevertap/android/sdk/b;Lcom/android/installreferrer/api/InstallReferrerClient;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/android/installreferrer/api/InstallReferrerClient;->startConnection(Lcom/android/installreferrer/api/InstallReferrerStateListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :catchall_0
    move-exception v0

    .line 38
    iget-object v1, p0, Lcom/clevertap/android/sdk/b;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iget-object p0, p0, Lcom/clevertap/android/sdk/b;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    new-instance v2, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v3, "Google Play Install Referrer\'s InstallReferrerClient Class not found - "

    .line 53
    .line 54
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string v0, " \n Please add implementation \'com.android.installreferrer:installreferrer:2.1\' to your build.gradle"

    .line 65
    .line 66
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v1, p0, v0}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method


# virtual methods
.method public h()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ll/bu9;->L(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/clevertap/android/sdk/b;->i:Ll/xse0;

    .line 6
    .line 7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 8
    .line 9
    .line 10
    move-result-wide v1

    .line 11
    invoke-virtual {v0, v1, v2}, Ll/xse0;->f(J)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/clevertap/android/sdk/b;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Lcom/clevertap/android/sdk/b;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const-string v2, "App in background"

    .line 27
    .line 28
    invoke-virtual {v0, v1, v2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/clevertap/android/sdk/b;->j:Ll/su3;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/su3;->d()Lcom/clevertap/android/sdk/task/Task;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Lcom/clevertap/android/sdk/b$a;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Lcom/clevertap/android/sdk/b$a;-><init>(Lcom/clevertap/android/sdk/b;)V

    .line 40
    .line 41
    .line 42
    const-string p0, "activityPaused"

    .line 43
    .line 44
    invoke-virtual {v0, p0, v1}, Lcom/clevertap/android/sdk/task/Task;->g(Ljava/lang/String;Ljava/util/concurrent/Callable;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public i(Landroid/app/Activity;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/clevertap/android/sdk/b;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Lcom/clevertap/android/sdk/b;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "App in foreground"

    .line 14
    .line 15
    invoke-virtual {p1, v0, v1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/clevertap/android/sdk/b;->i:Ll/xse0;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/xse0;->a()V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/clevertap/android/sdk/b;->f:Ll/bu9;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/bu9;->y()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-nez p1, :cond_0

    .line 30
    .line 31
    iget-object p1, p0, Lcom/clevertap/android/sdk/b;->a:Ll/sk0;

    .line 32
    .line 33
    invoke-virtual {p1}, Ll/sk0;->E()V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/clevertap/android/sdk/b;->a:Ll/sk0;

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/sk0;->a()V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/clevertap/android/sdk/b;->l:Lcom/clevertap/android/sdk/inbox/InboxV2Bridge;

    .line 42
    .line 43
    sget-object v0, Lcom/clevertap/android/sdk/network/fetch/FetchTrigger;->SYSTEM:Lcom/clevertap/android/sdk/network/fetch/FetchTrigger;

    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    invoke-virtual {p1, v0, v1}, Lcom/clevertap/android/sdk/inbox/InboxV2Bridge;->d(Lcom/clevertap/android/sdk/network/fetch/FetchTrigger;Ll/uhi;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/clevertap/android/sdk/b;->h:Ll/cob0;

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/cob0;->J()V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/clevertap/android/sdk/b;->j:Ll/su3;

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/su3;->d()Lcom/clevertap/android/sdk/task/Task;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    new-instance v0, Lcom/clevertap/android/sdk/b$b;

    .line 61
    .line 62
    invoke-direct {v0, p0}, Lcom/clevertap/android/sdk/b$b;-><init>(Lcom/clevertap/android/sdk/b;)V

    .line 63
    .line 64
    .line 65
    const-string v1, "HandlingInstallReferrer"

    .line 66
    .line 67
    invoke-virtual {p1, v1, v0}, Lcom/clevertap/android/sdk/task/Task;->g(Ljava/lang/String;Ljava/util/concurrent/Callable;)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/clevertap/android/sdk/b;->j:Ll/su3;

    .line 71
    .line 72
    invoke-virtual {p1}, Ll/su3;->a()Lcom/clevertap/android/sdk/task/Task;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    new-instance v0, Lcom/clevertap/android/sdk/a;

    .line 77
    .line 78
    invoke-direct {v0, p0}, Lcom/clevertap/android/sdk/a;-><init>(Lcom/clevertap/android/sdk/b;)V

    .line 79
    .line 80
    .line 81
    const-string v1, "CleanUpOldGIFs"

    .line 82
    .line 83
    invoke-virtual {p1, v1, v0}, Lcom/clevertap/android/sdk/task/Task;->g(Ljava/lang/String;Ljava/util/concurrent/Callable;)V

    .line 84
    .line 85
    .line 86
    :try_start_0
    iget-object p1, p0, Lcom/clevertap/android/sdk/b;->c:Ll/ch2;

    .line 87
    .line 88
    invoke-virtual {p1}, Ll/ch2;->k()Ll/hmj;
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 89
    .line 90
    .line 91
    goto :goto_1

    .line 92
    :catch_0
    move-exception p1

    .line 93
    goto :goto_0

    .line 94
    :catch_1
    iget-object p1, p0, Lcom/clevertap/android/sdk/b;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 95
    .line 96
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    iget-object v0, p0, Lcom/clevertap/android/sdk/b;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 101
    .line 102
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    const-string v1, "Failed to trigger location"

    .line 107
    .line 108
    invoke-virtual {p1, v0, v1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    goto :goto_1

    .line 112
    :goto_0
    iget-object v0, p0, Lcom/clevertap/android/sdk/b;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 113
    .line 114
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iget-object v1, p0, Lcom/clevertap/android/sdk/b;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 119
    .line 120
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-virtual {p1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-virtual {v0, v1, p1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    :cond_0
    :goto_1
    iget-object p1, p0, Lcom/clevertap/android/sdk/b;->b:Ll/ik2;

    .line 132
    .line 133
    invoke-virtual {p1}, Ll/ik2;->f()V

    .line 134
    .line 135
    .line 136
    iget-object p0, p0, Lcom/clevertap/android/sdk/b;->g:Lcom/clevertap/android/sdk/inapp/InAppController;

    .line 137
    .line 138
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/InAppController;->d0()V

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method public k(Landroid/os/Bundle;Landroid/net/Uri;Ljava/lang/String;)V
    .locals 1

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    :try_start_0
    iget-object v0, p0, Lcom/clevertap/android/sdk/b;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->isDefaultInstance()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/clevertap/android/sdk/b;->d:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p3

    .line 21
    if-eqz p3, :cond_3

    .line 22
    .line 23
    :cond_1
    if-eqz p1, :cond_2

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/os/BaseBundle;->isEmpty()Z

    .line 26
    .line 27
    .line 28
    move-result p3

    .line 29
    if-nez p3, :cond_2

    .line 30
    .line 31
    const-string p3, "wzrk_pn"

    .line 32
    .line 33
    invoke-virtual {p1, p3}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result p3

    .line 37
    if-eqz p3, :cond_2

    .line 38
    .line 39
    iget-object p3, p0, Lcom/clevertap/android/sdk/b;->a:Ll/sk0;

    .line 40
    .line 41
    invoke-virtual {p3, p1}, Ll/sk0;->L(Landroid/os/Bundle;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    .line 43
    .line 44
    :cond_2
    if-eqz p2, :cond_3

    .line 45
    .line 46
    :try_start_1
    iget-object p0, p0, Lcom/clevertap/android/sdk/b;->a:Ll/sk0;

    .line 47
    .line 48
    const/4 p1, 0x0

    .line 49
    invoke-virtual {p0, p2, p1}, Ll/sk0;->G(Landroid/net/Uri;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :catchall_0
    move-exception p0

    .line 54
    new-instance p1, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string p2, "Throwable - "

    .line 57
    .line 58
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-static {p0}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :catchall_1
    :cond_3
    :goto_0
    return-void
.end method
