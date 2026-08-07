.class Lcom/clevertap/android/sdk/b$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/installreferrer/api/InstallReferrerStateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/clevertap/android/sdk/b;->j()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/installreferrer/api/InstallReferrerClient;

.field final synthetic b:Lcom/clevertap/android/sdk/b;


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/b;Lcom/android/installreferrer/api/InstallReferrerClient;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/sdk/b$c;->b:Lcom/clevertap/android/sdk/b;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/clevertap/android/sdk/b$c;->a:Lcom/android/installreferrer/api/InstallReferrerClient;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/clevertap/android/sdk/b$c;Lcom/android/installreferrer/api/InstallReferrerClient;)Lcom/android/installreferrer/api/ReferrerDetails;
    .locals 5

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-virtual {p1}, Lcom/android/installreferrer/api/InstallReferrerClient;->getInstallReferrer()Lcom/android/installreferrer/api/ReferrerDetails;

    .line 5
    .line 6
    .line 7
    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    return-object p0

    .line 9
    :catch_0
    move-exception v0

    .line 10
    iget-object v1, p0, Lcom/clevertap/android/sdk/b$c;->b:Lcom/clevertap/android/sdk/b;

    .line 11
    .line 12
    invoke-static {v1}, Lcom/clevertap/android/sdk/b;->d(Lcom/clevertap/android/sdk/b;)Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v2, p0, Lcom/clevertap/android/sdk/b$c;->b:Lcom/clevertap/android/sdk/b;

    .line 21
    .line 22
    invoke-static {v2}, Lcom/clevertap/android/sdk/b;->d(Lcom/clevertap/android/sdk/b;)Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    new-instance v3, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v4, "Remote exception caused by Google Play Install Referrer library - "

    .line 33
    .line 34
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v1, v2, v0}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/android/installreferrer/api/InstallReferrerClient;->endConnection()V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/clevertap/android/sdk/b$c;->b:Lcom/clevertap/android/sdk/b;

    .line 55
    .line 56
    invoke-static {p0}, Lcom/clevertap/android/sdk/b;->b(Lcom/clevertap/android/sdk/b;)Ll/bu9;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    const/4 p1, 0x0

    .line 61
    invoke-virtual {p0, p1}, Ll/bu9;->b0(Z)V

    .line 62
    .line 63
    .line 64
    const/4 p0, 0x0

    .line 65
    return-object p0
.end method

.method public static synthetic b(Lcom/clevertap/android/sdk/b$c;Lcom/android/installreferrer/api/InstallReferrerClient;Lcom/android/installreferrer/api/ReferrerDetails;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string v0, "Install Referrer data set [Referrer URL-"

    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p2}, Lcom/android/installreferrer/api/ReferrerDetails;->getInstallReferrer()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iget-object v2, p0, Lcom/clevertap/android/sdk/b$c;->b:Lcom/clevertap/android/sdk/b;

    .line 11
    .line 12
    invoke-static {v2}, Lcom/clevertap/android/sdk/b;->b(Lcom/clevertap/android/sdk/b;)Ll/bu9;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {p2}, Lcom/android/installreferrer/api/ReferrerDetails;->getReferrerClickTimestampSeconds()J

    .line 17
    .line 18
    .line 19
    move-result-wide v3

    .line 20
    invoke-virtual {v2, v3, v4}, Ll/bu9;->h0(J)V

    .line 21
    .line 22
    .line 23
    iget-object v2, p0, Lcom/clevertap/android/sdk/b$c;->b:Lcom/clevertap/android/sdk/b;

    .line 24
    .line 25
    invoke-static {v2}, Lcom/clevertap/android/sdk/b;->b(Lcom/clevertap/android/sdk/b;)Ll/bu9;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {p2}, Lcom/android/installreferrer/api/ReferrerDetails;->getInstallBeginTimestampSeconds()J

    .line 30
    .line 31
    .line 32
    move-result-wide v3

    .line 33
    invoke-virtual {v2, v3, v4}, Ll/bu9;->N(J)V

    .line 34
    .line 35
    .line 36
    iget-object p2, p0, Lcom/clevertap/android/sdk/b$c;->b:Lcom/clevertap/android/sdk/b;

    .line 37
    .line 38
    invoke-static {p2}, Lcom/clevertap/android/sdk/b;->g(Lcom/clevertap/android/sdk/b;)Ll/sk0;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-virtual {p2, v1}, Ll/sk0;->K(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object p2, p0, Lcom/clevertap/android/sdk/b$c;->b:Lcom/clevertap/android/sdk/b;

    .line 46
    .line 47
    invoke-static {p2}, Lcom/clevertap/android/sdk/b;->b(Lcom/clevertap/android/sdk/b;)Ll/bu9;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    const/4 v2, 0x1

    .line 52
    invoke-virtual {p2, v2}, Ll/bu9;->b0(Z)V

    .line 53
    .line 54
    .line 55
    iget-object p2, p0, Lcom/clevertap/android/sdk/b$c;->b:Lcom/clevertap/android/sdk/b;

    .line 56
    .line 57
    invoke-static {p2}, Lcom/clevertap/android/sdk/b;->d(Lcom/clevertap/android/sdk/b;)Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    iget-object v2, p0, Lcom/clevertap/android/sdk/b$c;->b:Lcom/clevertap/android/sdk/b;

    .line 66
    .line 67
    invoke-static {v2}, Lcom/clevertap/android/sdk/b;->d(Lcom/clevertap/android/sdk/b;)Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    new-instance v3, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v0, "]"

    .line 84
    .line 85
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {p2, v2, v0}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :catch_0
    move-exception p2

    .line 97
    iget-object v0, p0, Lcom/clevertap/android/sdk/b$c;->b:Lcom/clevertap/android/sdk/b;

    .line 98
    .line 99
    invoke-static {v0}, Lcom/clevertap/android/sdk/b;->d(Lcom/clevertap/android/sdk/b;)Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    iget-object v1, p0, Lcom/clevertap/android/sdk/b$c;->b:Lcom/clevertap/android/sdk/b;

    .line 108
    .line 109
    invoke-static {v1}, Lcom/clevertap/android/sdk/b;->d(Lcom/clevertap/android/sdk/b;)Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    new-instance v2, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    const-string v3, "Install referrer client null pointer exception caused by Google Play Install Referrer library - "

    .line 120
    .line 121
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p2

    .line 128
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p2

    .line 135
    invoke-virtual {v0, v1, p2}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    iget-object p2, p0, Lcom/clevertap/android/sdk/b$c;->b:Lcom/clevertap/android/sdk/b;

    .line 139
    .line 140
    invoke-static {p2}, Lcom/clevertap/android/sdk/b;->f(Lcom/clevertap/android/sdk/b;)Ll/su3;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    invoke-virtual {p2}, Ll/su3;->b()Lcom/clevertap/android/sdk/task/Task;

    .line 145
    .line 146
    .line 147
    move-result-object p2

    .line 148
    new-instance v0, Lcom/clevertap/android/sdk/b$c$b;

    .line 149
    .line 150
    invoke-direct {v0, p0, p1}, Lcom/clevertap/android/sdk/b$c$b;-><init>(Lcom/clevertap/android/sdk/b$c;Lcom/android/installreferrer/api/InstallReferrerClient;)V

    .line 151
    .line 152
    .line 153
    const-string p1, "EndReferrerConnection"

    .line 154
    .line 155
    invoke-virtual {p2, p1, v0}, Lcom/clevertap/android/sdk/task/Task;->g(Ljava/lang/String;Ljava/util/concurrent/Callable;)V

    .line 156
    .line 157
    .line 158
    iget-object p0, p0, Lcom/clevertap/android/sdk/b$c;->b:Lcom/clevertap/android/sdk/b;

    .line 159
    .line 160
    invoke-static {p0}, Lcom/clevertap/android/sdk/b;->b(Lcom/clevertap/android/sdk/b;)Ll/bu9;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    const/4 p1, 0x0

    .line 165
    invoke-virtual {p0, p1}, Ll/bu9;->b0(Z)V

    .line 166
    .line 167
    .line 168
    return-void
.end method


# virtual methods
.method public onInstallReferrerServiceDisconnected()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/b$c;->b:Lcom/clevertap/android/sdk/b;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/clevertap/android/sdk/b;->b(Lcom/clevertap/android/sdk/b;)Ll/bu9;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/bu9;->E()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/clevertap/android/sdk/b$c;->b:Lcom/clevertap/android/sdk/b;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/clevertap/android/sdk/b;->f(Lcom/clevertap/android/sdk/b;)Ll/su3;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/su3;->d()Lcom/clevertap/android/sdk/task/Task;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Lcom/clevertap/android/sdk/b$c$a;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Lcom/clevertap/android/sdk/b$c$a;-><init>(Lcom/clevertap/android/sdk/b$c;)V

    .line 26
    .line 27
    .line 28
    const-string p0, "RetryInstallReferrer"

    .line 29
    .line 30
    invoke-virtual {v0, p0, v1}, Lcom/clevertap/android/sdk/task/Task;->g(Ljava/lang/String;Ljava/util/concurrent/Callable;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public onInstallReferrerSetupFinished(I)V
    .locals 2

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p1, v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p1, p0, Lcom/clevertap/android/sdk/b$c;->b:Lcom/clevertap/android/sdk/b;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/clevertap/android/sdk/b;->d(Lcom/clevertap/android/sdk/b;)Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object p0, p0, Lcom/clevertap/android/sdk/b$c;->b:Lcom/clevertap/android/sdk/b;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/clevertap/android/sdk/b;->d(Lcom/clevertap/android/sdk/b;)Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string v0, "Install Referrer data not set, API not supported by Play Store on device"

    .line 31
    .line 32
    invoke-virtual {p1, p0, v0}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    iget-object p1, p0, Lcom/clevertap/android/sdk/b$c;->b:Lcom/clevertap/android/sdk/b;

    .line 37
    .line 38
    invoke-static {p1}, Lcom/clevertap/android/sdk/b;->d(Lcom/clevertap/android/sdk/b;)Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object p0, p0, Lcom/clevertap/android/sdk/b$c;->b:Lcom/clevertap/android/sdk/b;

    .line 47
    .line 48
    invoke-static {p0}, Lcom/clevertap/android/sdk/b;->d(Lcom/clevertap/android/sdk/b;)Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const-string v0, "Install Referrer data not set, connection to Play Store unavailable"

    .line 57
    .line 58
    invoke-virtual {p1, p0, v0}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_2
    iget-object p1, p0, Lcom/clevertap/android/sdk/b$c;->b:Lcom/clevertap/android/sdk/b;

    .line 63
    .line 64
    invoke-static {p1}, Lcom/clevertap/android/sdk/b;->f(Lcom/clevertap/android/sdk/b;)Ll/su3;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1}, Ll/su3;->d()Lcom/clevertap/android/sdk/task/Task;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iget-object v0, p0, Lcom/clevertap/android/sdk/b$c;->a:Lcom/android/installreferrer/api/InstallReferrerClient;

    .line 73
    .line 74
    new-instance v1, Lcom/clevertap/android/sdk/c;

    .line 75
    .line 76
    invoke-direct {v1, p0, v0}, Lcom/clevertap/android/sdk/c;-><init>(Lcom/clevertap/android/sdk/b$c;Lcom/android/installreferrer/api/InstallReferrerClient;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1, v1}, Lcom/clevertap/android/sdk/task/Task;->f(Ll/vo50;)Lcom/clevertap/android/sdk/task/Task;

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/clevertap/android/sdk/b$c;->a:Lcom/android/installreferrer/api/InstallReferrerClient;

    .line 83
    .line 84
    new-instance v1, Lcom/clevertap/android/sdk/d;

    .line 85
    .line 86
    invoke-direct {v1, p0, v0}, Lcom/clevertap/android/sdk/d;-><init>(Lcom/clevertap/android/sdk/b$c;Lcom/android/installreferrer/api/InstallReferrerClient;)V

    .line 87
    .line 88
    .line 89
    const-string p0, "ActivityLifeCycleManager#getInstallReferrer"

    .line 90
    .line 91
    invoke-virtual {p1, p0, v1}, Lcom/clevertap/android/sdk/task/Task;->g(Ljava/lang/String;Ljava/util/concurrent/Callable;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method
