.class public Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;
    }
.end annotation


# static fields
.field static s_nSessionIdAllocator:I


# instance fields
.field final TRAE_ACTION_PHONE_STATE:Ljava/lang/String;

.field private _canSwtich2Earphone:Z

.field private _connectedDev:Ljava/lang/String;

.field private mCallback:Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;

.field private mContext:Landroid/content/Context;

.field private mIsHostside:Z

.field private mSessionId:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;)V
    .locals 7

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mIsHostside:Z

    .line 6
    .line 7
    const-wide/high16 v1, -0x8000000000000000L

    .line 8
    .line 9
    iput-wide v1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 10
    .line 11
    const-string v1, "DEVICE_NONE"

    .line 12
    .line 13
    iput-object v1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->_connectedDev:Ljava/lang/String;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    iput-boolean v1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->_canSwtich2Earphone:Z

    .line 17
    .line 18
    const-string v2, "android.intent.action.PHONE_STATE"

    .line 19
    .line 20
    iput-object v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->TRAE_ACTION_PHONE_STATE:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    sget v3, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_gHostProcessId:I

    .line 27
    .line 28
    if-ne v2, v3, :cond_0

    .line 29
    .line 30
    move v0, v1

    .line 31
    :cond_0
    iput-boolean v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mIsHostside:Z

    .line 32
    .line 33
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->requestSessionId()J

    .line 34
    .line 35
    .line 36
    move-result-wide v2

    .line 37
    iput-wide v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 38
    .line 39
    iput-object p2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mCallback:Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;

    .line 40
    .line 41
    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 42
    .line 43
    const/4 v0, 0x2

    .line 44
    const-string v2, "TRAE"

    .line 45
    .line 46
    if-nez p1, :cond_3

    .line 47
    .line 48
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    if-eqz v3, :cond_3

    .line 53
    .line 54
    new-instance v3, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v4, "AudioSession | Invalid parameters: ctx = "

    .line 57
    .line 58
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    const-string v4, "{object}"

    .line 62
    .line 63
    const-string v5, "null"

    .line 64
    .line 65
    if-nez p1, :cond_1

    .line 66
    .line 67
    move-object v6, v5

    .line 68
    goto :goto_0

    .line 69
    :cond_1
    move-object v6, v4

    .line 70
    :goto_0
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v6, "; cb = "

    .line 74
    .line 75
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    if-nez p2, :cond_2

    .line 79
    .line 80
    move-object v4, v5

    .line 81
    :cond_2
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    invoke-static {v2, v0, p2}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 89
    .line 90
    .line 91
    :cond_3
    new-instance p2, Landroid/content/IntentFilter;

    .line 92
    .line 93
    invoke-direct {p2}, Landroid/content/IntentFilter;-><init>()V

    .line 94
    .line 95
    .line 96
    const-string v3, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_RES"

    .line 97
    .line 98
    invoke-virtual {p2, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    const-string v3, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_NOTIFY"

    .line 102
    .line 103
    invoke-virtual {p2, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    if-eqz p1, :cond_4

    .line 107
    .line 108
    :try_start_0
    invoke-static {p1, p0, p2}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    .line 110
    .line 111
    goto :goto_1

    .line 112
    :catch_0
    move-exception p1

    .line 113
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 114
    .line 115
    .line 116
    move-result p2

    .line 117
    if-eqz p2, :cond_4

    .line 118
    .line 119
    new-instance p2, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    const-string v3, "registerReceiver Exception: "

    .line 122
    .line 123
    invoke-direct {p2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-static {v2, v0, p1}, Lcom/tencent/rtmp/sharp/jni/QLog;->e(Ljava/lang/String;ILjava/lang/String;)V

    .line 138
    .line 139
    .line 140
    :cond_4
    :goto_1
    invoke-direct {p0, p0, v1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->registerAudioSession(Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;Z)I

    .line 141
    .line 142
    .line 143
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    if-eqz p1, :cond_5

    .line 148
    .line 149
    new-instance p1, Ljava/lang/StringBuilder;

    .line 150
    .line 151
    const-string p2, "TraeAudioSession create, mSessionId: "

    .line 152
    .line 153
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    iget-wide v3, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 157
    .line 158
    invoke-virtual {p1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-static {v2, v0, p0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 166
    .line 167
    .line 168
    :cond_5
    return-void
.end method

.method public static ExConnectDevice(Landroid/content/Context;Ljava/lang/String;)V
    .locals 4

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-gtz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance v0, Landroid/content/Intent;

    .line 13
    .line 14
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v1, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_REQUEST"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    const-string v1, "PARAM_SESSIONID"

    .line 23
    .line 24
    const-wide/high16 v2, -0x8000000000000000L

    .line 25
    .line 26
    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    const-string v1, "PARAM_OPERATION"

    .line 30
    .line 31
    const-string v2, "OPERATION_CONNECTDEVICE"

    .line 32
    .line 33
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    const-string v1, "CONNECTDEVICE_DEVICENAME"

    .line 37
    .line 38
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    :goto_0
    return-void
.end method

.method private registerAudioSession(Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;Z)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    iget-wide v1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 8
    .line 9
    invoke-static {p1, p2, v1, v2, v0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->registerAudioSession(Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;ZJLandroid/content/Context;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static requestSessionId()J
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-long v0, v0

    .line 6
    const/16 v2, 0x20

    .line 7
    .line 8
    shl-long/2addr v0, v2

    .line 9
    sget v2, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->s_nSessionIdAllocator:I

    .line 10
    .line 11
    add-int/lit8 v2, v2, 0x1

    .line 12
    .line 13
    sput v2, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->s_nSessionIdAllocator:I

    .line 14
    .line 15
    int-to-long v2, v2

    .line 16
    add-long/2addr v0, v2

    .line 17
    return-wide v0
.end method


# virtual methods
.method public EarAction(I)I
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mIsHostside:Z

    .line 2
    .line 3
    const-string v1, "OPERATION_EARACTION"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-wide v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 8
    .line 9
    invoke-static {v1, v2, v3, v0, p1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->earAction(Ljava/lang/String;JZI)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    if-eq p1, v0, :cond_1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    new-instance v0, Landroid/content/Intent;

    .line 25
    .line 26
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v2, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_REQUEST"

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    const-string v2, "PARAM_SESSIONID"

    .line 35
    .line 36
    iget-wide v3, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 37
    .line 38
    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    const-string v2, "PARAM_OPERATION"

    .line 42
    .line 43
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 44
    .line 45
    .line 46
    const-string v1, "EXTRA_EARACTION"

    .line 47
    .line 48
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 54
    .line 55
    .line 56
    const/4 p0, 0x0

    .line 57
    return p0

    .line 58
    :cond_2
    :goto_0
    const/4 p0, -0x1

    .line 59
    return p0
.end method

.method public connectDevice(Ljava/lang/String;)I
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mIsHostside:Z

    .line 2
    .line 3
    const-string v1, "OPERATION_CONNECTDEVICE"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-wide v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 8
    .line 9
    invoke-static {v1, v2, v3, v0, p1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->connectDevice(Ljava/lang/String;JZLjava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    if-eqz p1, :cond_2

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-gtz v0, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    new-instance v0, Landroid/content/Intent;

    .line 28
    .line 29
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v2, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_REQUEST"

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    const-string v2, "PARAM_SESSIONID"

    .line 38
    .line 39
    iget-wide v3, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 40
    .line 41
    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 42
    .line 43
    .line 44
    const-string v2, "PARAM_OPERATION"

    .line 45
    .line 46
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 47
    .line 48
    .line 49
    const-string v1, "CONNECTDEVICE_DEVICENAME"

    .line 50
    .line 51
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 57
    .line 58
    .line 59
    const/4 p0, 0x0

    .line 60
    return p0

    .line 61
    :cond_2
    :goto_0
    const/4 p0, -0x1

    .line 62
    return p0
.end method

.method public connectHighestPriorityDevice()I
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mIsHostside:Z

    .line 2
    .line 3
    const-string v1, "OPERATION_CONNECT_HIGHEST_PRIORITY_DEVICE"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-wide v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 8
    .line 9
    invoke-static {v1, v2, v3, v0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->connectHighestPriorityDevice(Ljava/lang/String;JZ)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    const/4 p0, -0x1

    .line 19
    return p0

    .line 20
    :cond_1
    new-instance v0, Landroid/content/Intent;

    .line 21
    .line 22
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v2, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_REQUEST"

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    const-string v2, "PARAM_SESSIONID"

    .line 31
    .line 32
    iget-wide v3, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 33
    .line 34
    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    const-string v2, "PARAM_OPERATION"

    .line 38
    .line 39
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method public disableDeviceSwitch()I
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->disableDeviceSwitch()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getConnectedDevice()I
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mIsHostside:Z

    .line 2
    .line 3
    const-string v1, "OPERATION_GETCONNECTEDDEVICE"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-wide v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 8
    .line 9
    invoke-static {v1, v2, v3, v0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->getConnectedDevice(Ljava/lang/String;JZ)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    const/4 p0, -0x1

    .line 19
    return p0

    .line 20
    :cond_1
    new-instance v0, Landroid/content/Intent;

    .line 21
    .line 22
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v2, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_REQUEST"

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    const-string v2, "PARAM_SESSIONID"

    .line 31
    .line 32
    iget-wide v3, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 33
    .line 34
    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    const-string v2, "PARAM_OPERATION"

    .line 38
    .line 39
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method public getConnectingDevice()I
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mIsHostside:Z

    .line 2
    .line 3
    const-string v1, "OPERATION_GETCONNECTINGDEVICE"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-wide v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 8
    .line 9
    invoke-static {v1, v2, v3, v0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->getConnectingDevice(Ljava/lang/String;JZ)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    const/4 p0, -0x1

    .line 19
    return p0

    .line 20
    :cond_1
    new-instance v0, Landroid/content/Intent;

    .line 21
    .line 22
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v2, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_REQUEST"

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    const-string v2, "PARAM_SESSIONID"

    .line 31
    .line 32
    iget-wide v3, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 33
    .line 34
    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    const-string v2, "PARAM_OPERATION"

    .line 38
    .line 39
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method public getDeviceList()I
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mIsHostside:Z

    .line 2
    .line 3
    const-string v1, "OPERATION_GETDEVICELIST"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-wide v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 8
    .line 9
    invoke-static {v1, v2, v3, v0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->getDeviceList(Ljava/lang/String;JZ)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    const/4 p0, -0x1

    .line 19
    return p0

    .line 20
    :cond_1
    new-instance v0, Landroid/content/Intent;

    .line 21
    .line 22
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v2, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_REQUEST"

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    const-string v2, "PARAM_SESSIONID"

    .line 31
    .line 32
    iget-wide v3, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 33
    .line 34
    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    const-string v2, "PARAM_OPERATION"

    .line 38
    .line 39
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method public getStreamType()I
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mIsHostside:Z

    .line 2
    .line 3
    const-string v1, "OPERATION_GETSTREAMTYPE"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-wide v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 8
    .line 9
    invoke-static {v1, v2, v3, v0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->getStreamType(Ljava/lang/String;JZ)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    const/4 p0, -0x1

    .line 19
    return p0

    .line 20
    :cond_1
    new-instance v0, Landroid/content/Intent;

    .line 21
    .line 22
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v2, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_REQUEST"

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    const-string v2, "PARAM_SESSIONID"

    .line 31
    .line 32
    iget-wide v3, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 33
    .line 34
    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    const-string v2, "PARAM_OPERATION"

    .line 38
    .line 39
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method public isDeviceChangabled()I
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mIsHostside:Z

    .line 2
    .line 3
    const-string v1, "OPERATION_ISDEVICECHANGABLED"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-wide v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 8
    .line 9
    invoke-static {v1, v2, v3, v0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->isDeviceChangabled(Ljava/lang/String;JZ)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    const/4 p0, -0x1

    .line 19
    return p0

    .line 20
    :cond_1
    new-instance v0, Landroid/content/Intent;

    .line 21
    .line 22
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v2, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_REQUEST"

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    const-string v2, "PARAM_SESSIONID"

    .line 31
    .line 32
    iget-wide v3, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 33
    .line 34
    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    const-string v2, "PARAM_OPERATION"

    .line 38
    .line 39
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 33

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    .line 1
    const-string v0, "AudioSession|[onVoicecallPreprocess] err:"

    const-string v3, "AudioSession|[onRingCompletion] err:"

    const-string v4, "AudioSession|[onGetStreamTypeRes] err:"

    const-string v5, "AudioSession|[onGetConnectingDeviceRes] err:"

    const-string v6, "AudioSession|[onGetConnectedDeviceRes] err:"

    const-string v7, "AudioSession|[onIsDeviceChangabledRes] err:"

    const-string v8, "AudioSession|[onStreamTypeUpdate] err:"

    const-string v9, "AudioSession|[onDeviceChangabledUpdate]"

    const-string v10, "AudioSession|[onServiceStateUpdate]"

    const/4 v11, 0x2

    .line 2
    const-string v12, "TRAE"

    if-nez v2, :cond_0

    .line 3
    :try_start_0
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    move-result v0

    if-eqz v0, :cond_26

    .line 4
    const-string v0, "[ERROR] intent = null!!"

    invoke-static {v12, v11, v0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    return-void

    :catch_0
    move-exception v0

    :goto_0
    move-object v7, v12

    goto/16 :goto_9

    .line 5
    :cond_0
    const-string v13, "PARAM_SESSIONID"

    const-wide/high16 v14, -0x8000000000000000L

    invoke-virtual {v2, v13, v14, v15}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v13

    .line 6
    const-string v15, "PARAM_OPERATION"

    .line 7
    invoke-virtual {v2, v15}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 8
    const-string v11, "PARAM_RES_ERRCODE"

    move-wide/from16 v16, v13

    const/4 v13, 0x0

    invoke-virtual {v2, v11, v13}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v11

    .line 9
    const-string v14, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_NOTIFY"

    .line 10
    invoke-virtual {v2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v13

    .line 11
    invoke-virtual {v14, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v14, " st:"

    move/from16 v19, v13

    const-string v13, "EXTRA_DATA_STREAMTYPE"

    move-object/from16 v20, v0

    const-string v0, " Num:"

    move-object/from16 v21, v3

    const-string v3, " bt:"

    move-object/from16 v22, v4

    const-string v4, " prevConnected:"

    move-object/from16 v23, v5

    const-string v5, "DEVICE_BLUETOOTHHEADSET"

    move-object/from16 v24, v6

    const-string v6, "DEVICE_WIREDHEADSET"

    move-object/from16 v25, v7

    const-string v7, " "

    move-object/from16 v26, v14

    const-string v14, "AudioSession|    "

    move/from16 v27, v11

    const-string v11, "EXTRA_DATA_IF_HAS_BLUETOOTH_THIS_IS_NAME"

    move-object/from16 v28, v8

    const-string v8, "EXTRA_DATA_PREV_CONNECTEDDEVICE"

    move-object/from16 v29, v13

    const-string v13, "EXTRA_DATA_CONNECTEDDEVICE"

    move-object/from16 v30, v9

    const-string v9, "EXTRA_DATA_AVAILABLEDEVICE_LIST"

    move-object/from16 v31, v0

    const-string v0, "\n"

    if-eqz v19, :cond_e

    move-object/from16 v19, v3

    .line 12
    :try_start_1
    const-string v3, "NOTIFY_SERVICE_STATE"

    invoke-virtual {v3, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 13
    const-string v0, "NOTIFY_SERVICE_STATE_DATE"

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    .line 14
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    move-result v3

    if-eqz v3, :cond_2

    if-eqz v0, :cond_1

    const-string v3, "on"

    goto :goto_1

    :cond_1
    const-string v3, "off"

    :goto_1
    invoke-virtual {v10, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    invoke-static {v12, v4, v3}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 15
    :cond_2
    iget-object v3, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mCallback:Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;

    if-eqz v3, :cond_26

    .line 16
    invoke-interface {v3, v0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;->onServiceStateUpdate(Z)V

    return-void

    .line 17
    :cond_3
    const-string v3, "NOTIFY_DEVICELISTUPDATE"

    .line 18
    invoke-virtual {v3, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    if-eqz v3, :cond_8

    .line 19
    :try_start_2
    invoke-virtual {v2, v9}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 20
    invoke-virtual {v2, v13}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 21
    invoke-virtual {v2, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 22
    invoke-virtual {v2, v11}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    move-object v15, v0

    const/4 v11, 0x1

    const/4 v13, 0x0

    .line 23
    :goto_2
    array-length v2, v3

    if-ge v13, v2, :cond_6

    .line 24
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v15, v3, v13

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 25
    aget-object v2, v3, v13

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    aget-object v2, v3, v13

    .line 26
    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    goto :goto_3

    :catch_1
    move-exception v0

    move-object/from16 v2, p2

    goto/16 :goto_0

    :cond_4
    :goto_3
    const/4 v11, 0x0

    :cond_5
    add-int/lit8 v13, v13, 0x1

    goto :goto_2

    .line 27
    :cond_6
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 28
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    move-result v2

    if-eqz v2, :cond_7

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "AudioSession|[onDeviceListUpdate]  connected:"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v4, v19

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v4, v31

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v4, v3

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v4, 0x2

    invoke-static {v12, v4, v0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 29
    :cond_7
    iput-boolean v11, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->_canSwtich2Earphone:Z

    .line 30
    iput-object v9, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->_connectedDev:Ljava/lang/String;

    .line 31
    iget-object v0, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mCallback:Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;

    if-eqz v0, :cond_26

    .line 32
    invoke-interface {v0, v3, v9, v8, v10}, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;->onDeviceListUpdate([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 33
    :cond_8
    const-string v0, "NOTIFY_DEVICECHANGABLE_UPDATE"

    .line 34
    invoke-virtual {v0, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 35
    const-string v0, "NOTIFY_DEVICECHANGABLE_UPDATE_DATE"
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-object/from16 v2, p2

    const/4 v3, 0x1

    :try_start_3
    invoke-virtual {v2, v0, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    .line 36
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    move-result v3

    if-eqz v3, :cond_9

    new-instance v3, Ljava/lang/StringBuilder;

    move-object/from16 v4, v30

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    invoke-static {v12, v4, v3}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 37
    :cond_9
    iget-object v3, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mCallback:Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;

    if-eqz v3, :cond_26

    .line 38
    invoke-interface {v3, v0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;->onDeviceChangabledUpdate(Z)V

    return-void

    :cond_a
    move-object/from16 v2, p2

    .line 39
    const-string v0, "NOTIFY_STREAMTYPE_UPDATE"

    .line 40
    invoke-virtual {v0, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    move-object/from16 v10, v29

    const/4 v0, -0x1

    .line 41
    invoke-virtual {v2, v10, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    if-eqz v27, :cond_b

    .line 42
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    move-result v3

    if-eqz v3, :cond_b

    new-instance v3, Ljava/lang/StringBuilder;

    move-object/from16 v4, v28

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move/from16 v4, v27

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-object/from16 v4, v26

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    invoke-static {v12, v4, v3}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 43
    :cond_b
    iget-object v3, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mCallback:Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;

    if-eqz v3, :cond_26

    .line 44
    invoke-interface {v3, v0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;->onStreamTypeUpdate(I)V

    return-void

    .line 45
    :cond_c
    const-string v0, "NOTIFY_ROUTESWITCHSTART"

    invoke-virtual {v0, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 46
    const-string v0, "EXTRA_DATA_ROUTESWITCHSTART_FROM"

    invoke-virtual {v2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 47
    const-string v3, "EXTRA_DATA_ROUTESWITCHSTART_TO"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 48
    iget-object v4, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mCallback:Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;

    if-eqz v4, :cond_26

    if-eqz v0, :cond_26

    if-eqz v3, :cond_26

    .line 49
    invoke-interface {v4, v0, v3}, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;->onAudioRouteSwitchStart(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 50
    :cond_d
    const-string v0, "NOTIFY_ROUTESWITCHEND"

    invoke-virtual {v0, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    .line 51
    const-string v0, "EXTRA_DATA_ROUTESWITCHEND_DEV"

    invoke-virtual {v2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 52
    const-string v3, "EXTRA_DATA_ROUTESWITCHEND_TIME"

    const-wide/16 v4, -0x1

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v6

    .line 53
    iget-object v3, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mCallback:Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;

    if-eqz v3, :cond_26

    if-eqz v0, :cond_26

    cmp-long v4, v6, v4

    if-eqz v4, :cond_26

    .line 54
    invoke-interface {v3, v0, v6, v7}, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;->onAudioRouteSwitchEnd(Ljava/lang/String;J)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    return-void

    :cond_e
    move-object/from16 v32, v26

    move-object/from16 v26, v12

    move-object v12, v3

    move/from16 v3, v27

    .line 55
    :try_start_4
    const-string v10, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_RES"

    move-object/from16 v19, v12

    .line 56
    invoke-virtual {v2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v12

    .line 57
    invoke-virtual {v10, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_26

    move/from16 v27, v3

    move-object v10, v4

    .line 58
    iget-wide v3, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    cmp-long v3, v3, v16

    if-eqz v3, :cond_f

    goto/16 :goto_a

    .line 59
    :cond_f
    const-string v3, "OPERATION_GETDEVICELIST"

    invoke-virtual {v3, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_14

    .line 60
    invoke-virtual {v2, v9}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 61
    invoke-virtual {v2, v13}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 62
    invoke-virtual {v2, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 63
    invoke-virtual {v2, v11}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    move-object v13, v0

    const/4 v11, 0x1

    const/4 v12, 0x0

    .line 64
    :goto_4
    array-length v15, v3

    if-ge v12, v15, :cond_12

    .line 65
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v13, v3, v12

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 66
    aget-object v15, v3, v12

    invoke-virtual {v15, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_10

    aget-object v15, v3, v12

    .line 67
    invoke-virtual {v15, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_11

    goto :goto_5

    :catch_2
    move-exception v0

    move-object/from16 v7, v26

    goto/16 :goto_9

    :cond_10
    :goto_5
    const/4 v11, 0x0

    :cond_11
    add-int/lit8 v12, v12, 0x1

    goto :goto_4

    .line 68
    :cond_12
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 69
    iput-boolean v11, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->_canSwtich2Earphone:Z

    .line 70
    iput-object v4, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->_connectedDev:Ljava/lang/String;

    .line 71
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    move-result v5

    if-eqz v5, :cond_13

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "AudioSession|[onGetDeviceListRes] err:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v6, v27

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, " connected:"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v12, v19

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v7, v31

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v7, v3

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    move-object/from16 v7, v26

    const/4 v5, 0x2

    :try_start_5
    invoke-static {v7, v5, v0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_6

    :catch_3
    move-exception v0

    goto/16 :goto_9

    :cond_13
    move-object/from16 v7, v26

    move/from16 v6, v27

    .line 72
    :goto_6
    iget-object v0, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mCallback:Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;

    if-eqz v0, :cond_26

    move-object/from16 v18, v0

    move-object/from16 v20, v3

    move-object/from16 v21, v4

    move/from16 v19, v6

    move-object/from16 v22, v8

    move-object/from16 v23, v9

    .line 73
    invoke-interface/range {v18 .. v23}, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;->onGetDeviceListRes(I[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_14
    move-object/from16 v7, v26

    move/from16 v3, v27

    .line 74
    const-string v0, "OPERATION_CONNECTDEVICE"

    invoke-virtual {v0, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    const-string v4, " dev:"

    const-string v5, "AudioSession|[onConnectDeviceRes] err:"

    if-eqz v0, :cond_17

    .line 75
    :try_start_6
    const-string v0, "CONNECTDEVICE_RESULT_DEVICENAME"

    .line 76
    invoke-virtual {v2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 77
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    move-result v6

    if-eqz v6, :cond_15

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x2

    invoke-static {v7, v5, v4}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 78
    :cond_15
    iget-object v4, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mCallback:Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;

    if-eqz v4, :cond_26

    if-nez v3, :cond_16

    const/4 v13, 0x1

    goto :goto_7

    :cond_16
    const/4 v13, 0x0

    .line 79
    :goto_7
    invoke-interface {v4, v3, v0, v13}, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;->onConnectDeviceRes(ILjava/lang/String;Z)V

    return-void

    .line 80
    :cond_17
    const-string v0, "OPERATION_EARACTION"

    invoke-virtual {v0, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    .line 81
    const-string v0, "EXTRA_EARACTION"

    const/4 v4, -0x1

    invoke-virtual {v2, v0, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 82
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    move-result v4

    if-eqz v4, :cond_18

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " earAction:"

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v4, 0x2

    invoke-static {v7, v4, v0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    :cond_18
    return-void

    .line 83
    :cond_19
    const-string v0, "OPERATION_ISDEVICECHANGABLED"

    .line 84
    invoke-virtual {v0, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 85
    const-string v0, "ISDEVICECHANGABLED_REULT_ISCHANGABLED"

    const/4 v4, 0x0

    .line 86
    invoke-virtual {v2, v0, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    .line 87
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    move-result v4

    if-eqz v4, :cond_1b

    new-instance v4, Ljava/lang/StringBuilder;

    move-object/from16 v5, v25

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " Changabled:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v0, :cond_1a

    const-string v5, "Y"

    goto :goto_8

    :cond_1a
    const-string v5, "N"

    :goto_8
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x2

    invoke-static {v7, v5, v4}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 88
    :cond_1b
    iget-object v4, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mCallback:Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;

    if-eqz v4, :cond_26

    .line 89
    invoke-interface {v4, v3, v0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;->onIsDeviceChangabledRes(IZ)V

    return-void

    .line 90
    :cond_1c
    const-string v0, "OPERATION_GETCONNECTEDDEVICE"

    .line 91
    invoke-virtual {v0, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 92
    const-string v0, "GETCONNECTEDDEVICE_REULT_LIST"

    .line 93
    invoke-virtual {v2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 94
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    move-result v5

    if-eqz v5, :cond_1d

    new-instance v5, Ljava/lang/StringBuilder;

    move-object/from16 v6, v24

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x2

    invoke-static {v7, v5, v4}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 95
    :cond_1d
    iget-object v4, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mCallback:Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;

    if-eqz v4, :cond_26

    .line 96
    invoke-interface {v4, v3, v0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;->onGetConnectedDeviceRes(ILjava/lang/String;)V

    return-void

    .line 97
    :cond_1e
    const-string v0, "OPERATION_GETCONNECTINGDEVICE"

    .line 98
    invoke-virtual {v0, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_20

    .line 99
    const-string v0, "GETCONNECTINGDEVICE_REULT_LIST"

    .line 100
    invoke-virtual {v2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 101
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    move-result v5

    if-eqz v5, :cond_1f

    new-instance v5, Ljava/lang/StringBuilder;

    move-object/from16 v6, v23

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x2

    invoke-static {v7, v5, v4}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 102
    :cond_1f
    iget-object v4, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mCallback:Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;

    if-eqz v4, :cond_26

    .line 103
    invoke-interface {v4, v3, v0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;->onGetConnectingDeviceRes(ILjava/lang/String;)V

    return-void

    .line 104
    :cond_20
    const-string v0, "OPERATION_GETSTREAMTYPE"

    .line 105
    invoke-virtual {v0, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    move-object/from16 v10, v29

    const/4 v0, -0x1

    .line 106
    invoke-virtual {v2, v10, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 107
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    move-result v4

    if-eqz v4, :cond_21

    new-instance v4, Ljava/lang/StringBuilder;

    move-object/from16 v5, v22

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-object/from16 v5, v32

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x2

    invoke-static {v7, v5, v4}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 108
    :cond_21
    iget-object v4, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mCallback:Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;

    if-eqz v4, :cond_26

    .line 109
    invoke-interface {v4, v3, v0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;->onGetStreamTypeRes(II)V

    return-void

    .line 110
    :cond_22
    const-string v0, "NOTIFY_RING_COMPLETION"

    .line 111
    invoke-virtual {v0, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_24

    .line 112
    const-string v0, "PARAM_RING_USERDATA_STRING"

    .line 113
    invoke-virtual {v2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 114
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    move-result v4

    if-eqz v4, :cond_23

    new-instance v4, Ljava/lang/StringBuilder;

    move-object/from16 v5, v21

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " userData:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x2

    invoke-static {v7, v5, v4}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 115
    :cond_23
    iget-object v4, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mCallback:Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;

    if-eqz v4, :cond_26

    .line 116
    invoke-interface {v4, v3, v0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;->onRingCompletion(ILjava/lang/String;)V

    return-void

    .line 117
    :cond_24
    const-string v0, "OPERATION_VOICECALL_PREPROCESS"

    invoke-virtual {v0, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    .line 118
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    move-result v0

    if-eqz v0, :cond_25

    new-instance v0, Ljava/lang/StringBuilder;

    move-object/from16 v4, v20

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v5, 0x2

    invoke-static {v7, v5, v0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 119
    :cond_25
    iget-object v0, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mCallback:Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;

    if-eqz v0, :cond_26

    .line 120
    invoke-interface {v0, v3}, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;->onVoicecallPreprocessRes(I)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3

    return-void

    .line 121
    :goto_9
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    move-result v3

    if-eqz v3, :cond_26

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "AudioSession| nSessinId = "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v4, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, " onReceive::intent:"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    invoke-virtual {v2}, Landroid/content/Intent;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " intent.getAction():"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " Exception:"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v5, 0x2

    .line 123
    invoke-static {v7, v5, v0}, Lcom/tencent/rtmp/sharp/jni/QLog;->e(Ljava/lang/String;ILjava/lang/String;)V

    :cond_26
    :goto_a
    return-void
.end method

.method public onReceiveCallback(Landroid/content/Intent;)V
    .locals 9

    .line 1
    const-string v0, "AudioSession|[onReceiveCallback onVoicecallPreprocess] err:"

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const-string v2, "TRAE"

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    :try_start_0
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_3

    .line 13
    .line 14
    const-string v0, "[ERROR] intent = null!!"

    .line 15
    .line 16
    invoke-static {v2, v1, v0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception v0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const-string v3, "PARAM_SESSIONID"

    .line 23
    .line 24
    const-wide/high16 v4, -0x8000000000000000L

    .line 25
    .line 26
    invoke-virtual {p1, v3, v4, v5}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    .line 27
    .line 28
    .line 29
    move-result-wide v3

    .line 30
    const-string v5, "PARAM_OPERATION"

    .line 31
    .line 32
    invoke-virtual {p1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    const-string v6, "PARAM_RES_ERRCODE"

    .line 37
    .line 38
    const/4 v7, 0x0

    .line 39
    invoke-virtual {p1, v6, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 40
    .line 41
    .line 42
    move-result v6

    .line 43
    const-string v7, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_RES"

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v8

    .line 49
    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v7

    .line 53
    if-eqz v7, :cond_3

    .line 54
    .line 55
    iget-wide v7, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 56
    .line 57
    cmp-long v3, v7, v3

    .line 58
    .line 59
    if-eqz v3, :cond_1

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_1
    const-string v3, "OPERATION_VOICECALL_PREPROCESS"

    .line 63
    .line 64
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    if-eqz v3, :cond_3

    .line 69
    .line 70
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    if-eqz v3, :cond_2

    .line 75
    .line 76
    new-instance v3, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-static {v2, v1, v0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 89
    .line 90
    .line 91
    :cond_2
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mCallback:Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;

    .line 92
    .line 93
    if-eqz v0, :cond_3

    .line 94
    .line 95
    invoke-interface {v0, v6}, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;->onVoicecallPreprocessRes(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :goto_0
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    if-eqz v3, :cond_3

    .line 104
    .line 105
    new-instance v3, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    const-string v4, "AudioSession| nSessinId = "

    .line 108
    .line 109
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    iget-wide v4, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 113
    .line 114
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    const-string p0, " onReceive::intent:"

    .line 118
    .line 119
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1}, Landroid/content/Intent;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    const-string p0, " intent.getAction():"

    .line 130
    .line 131
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    const-string p0, " Exception:"

    .line 142
    .line 143
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    invoke-static {v2, v1, p0}, Lcom/tencent/rtmp/sharp/jni/QLog;->e(Ljava/lang/String;ILjava/lang/String;)V

    .line 158
    .line 159
    .line 160
    :cond_3
    :goto_1
    return-void
.end method

.method public recoverAudioFocus()I
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mIsHostside:Z

    .line 2
    .line 3
    const-string v1, "OPERATION_RECOVER_AUDIO_FOCUS"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-wide v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 8
    .line 9
    invoke-static {v1, v2, v3, v0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->recoverAudioFocus(Ljava/lang/String;JZ)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    const/4 p0, -0x1

    .line 19
    return p0

    .line 20
    :cond_1
    new-instance v0, Landroid/content/Intent;

    .line 21
    .line 22
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v2, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_REQUEST"

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    const-string v2, "PARAM_SESSIONID"

    .line 31
    .line 32
    iget-wide v3, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 33
    .line 34
    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    const-string v2, "PARAM_OPERATION"

    .line 38
    .line 39
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method public release()V
    .locals 5

    .line 1
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    const-string v2, "TRAE"

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v3, "TraeAudioSession release, mSessionId: "

    .line 13
    .line 14
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-wide v3, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 18
    .line 19
    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v2, v1, v0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    :try_start_0
    invoke-virtual {v0, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catch_0
    move-exception v0

    .line 38
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-eqz v3, :cond_1

    .line 43
    .line 44
    new-instance v3, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v4, "unregisterReceiver failed."

    .line 47
    .line 48
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {v2, v1, v0}, Lcom/tencent/rtmp/sharp/jni/QLog;->e(Ljava/lang/String;ILjava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 66
    invoke-direct {p0, p0, v0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->registerAudioSession(Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;Z)I

    .line 67
    .line 68
    .line 69
    const/4 v0, 0x0

    .line 70
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 71
    .line 72
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mCallback:Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;

    .line 73
    .line 74
    return-void
.end method

.method public requestReleaseAudioFocus()I
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mIsHostside:Z

    .line 2
    .line 3
    const-string v1, "OPERATION_REQUEST_RELEASE_AUDIO_FOCUS"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-wide v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 8
    .line 9
    invoke-static {v1, v2, v3, v0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->requestReleaseAudioFocus(Ljava/lang/String;JZ)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    const/4 p0, -0x1

    .line 19
    return p0

    .line 20
    :cond_1
    new-instance v0, Landroid/content/Intent;

    .line 21
    .line 22
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v2, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_REQUEST"

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    const-string v2, "PARAM_SESSIONID"

    .line 31
    .line 32
    iget-wide v3, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 33
    .line 34
    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    const-string v2, "PARAM_OPERATION"

    .line 38
    .line 39
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method public setCallback(Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mCallback:Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;

    .line 2
    .line 3
    return-void
.end method

.method public startRing(IILandroid/net/Uri;Ljava/lang/String;Z)I
    .locals 12

    .line 130
    iget-boolean v3, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mIsHostside:Z

    if-eqz v3, :cond_0

    .line 131
    iget-wide v1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    const-string v10, "normal-ring"

    const/4 v11, 0x0

    const-string v0, "OPERATION_STARTRING"

    const/4 v9, 0x1

    move v4, p1

    move v5, p2

    move-object v6, p3

    move-object/from16 v7, p4

    move/from16 v8, p5

    invoke-static/range {v0 .. v11}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->startRing(Ljava/lang/String;JZIILandroid/net/Uri;Ljava/lang/String;ZILjava/lang/String;Z)I

    move-result p0

    return p0

    .line 132
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    if-nez v0, :cond_1

    const/4 p0, -0x1

    return p0

    .line 133
    :cond_1
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 134
    const-string v1, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_REQUEST"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 135
    const-string v1, "PARAM_SESSIONID"

    iget-wide v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 136
    const-string v1, "PARAM_RING_DATASOURCE"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 137
    const-string p1, "PARAM_RING_RSID"

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 138
    const-string p1, "PARAM_RING_URI"

    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 139
    const-string p1, "PARAM_RING_FILEPATH"

    move-object/from16 v7, p4

    invoke-virtual {v0, p1, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 140
    const-string p1, "PARAM_RING_LOOP"

    move/from16 v8, p5

    invoke-virtual {v0, p1, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 141
    const-string p1, "PARAM_RING_MODE"

    const/4 p2, 0x0

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 142
    const-string p1, "PARAM_RING_USERDATA_STRING"

    const-string p3, "normal-ring"

    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 143
    const-string p1, "PARAM_OPERATION"

    const-string p3, "OPERATION_STARTRING"

    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 144
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    return p2
.end method

.method public startRing(IILandroid/net/Uri;Ljava/lang/String;ZILjava/lang/String;)I
    .locals 12

    .line 114
    iget-boolean v3, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mIsHostside:Z

    if-eqz v3, :cond_0

    .line 115
    iget-wide v1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    const/4 v11, 0x0

    const-string v0, "OPERATION_STARTRING"

    move v4, p1

    move v5, p2

    move-object v6, p3

    move-object/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    move-object/from16 v10, p7

    invoke-static/range {v0 .. v11}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->startRing(Ljava/lang/String;JZIILandroid/net/Uri;Ljava/lang/String;ZILjava/lang/String;Z)I

    move-result p0

    return p0

    .line 116
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    if-nez v0, :cond_1

    const/4 p0, -0x1

    return p0

    .line 117
    :cond_1
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 118
    const-string v1, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_REQUEST"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 119
    const-string v1, "PARAM_SESSIONID"

    iget-wide v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 120
    const-string v1, "PARAM_RING_DATASOURCE"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 121
    const-string p1, "PARAM_RING_RSID"

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 122
    const-string p1, "PARAM_RING_URI"

    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 123
    const-string p1, "PARAM_RING_FILEPATH"

    move-object/from16 v7, p4

    invoke-virtual {v0, p1, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 124
    const-string p1, "PARAM_RING_LOOP"

    move/from16 v8, p5

    invoke-virtual {v0, p1, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 125
    const-string p1, "PARAM_RING_LOOPCOUNT"

    move/from16 v9, p6

    invoke-virtual {v0, p1, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 126
    const-string p1, "PARAM_RING_MODE"

    const/4 p2, 0x0

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 127
    const-string p1, "PARAM_RING_USERDATA_STRING"

    move-object/from16 v10, p7

    invoke-virtual {v0, p1, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 128
    const-string p1, "PARAM_OPERATION"

    const-string p3, "OPERATION_STARTRING"

    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 129
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    return p2
.end method

.method public startRing(IILandroid/net/Uri;Ljava/lang/String;ZILjava/lang/String;Z)I
    .locals 12

    .line 1
    iget-boolean v3, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mIsHostside:Z

    .line 2
    .line 3
    if-eqz v3, :cond_0

    .line 4
    .line 5
    const-string v0, "OPERATION_STARTRING"

    .line 6
    .line 7
    iget-wide v1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 8
    .line 9
    move v4, p1

    .line 10
    move v5, p2

    .line 11
    move-object v6, p3

    .line 12
    move-object/from16 v7, p4

    .line 13
    .line 14
    move/from16 v8, p5

    .line 15
    .line 16
    move/from16 v9, p6

    .line 17
    .line 18
    move-object/from16 v10, p7

    .line 19
    .line 20
    move/from16 v11, p8

    .line 21
    .line 22
    invoke-static/range {v0 .. v11}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->startRing(Ljava/lang/String;JZIILandroid/net/Uri;Ljava/lang/String;ZILjava/lang/String;Z)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 28
    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    const/4 p0, -0x1

    .line 32
    return p0

    .line 33
    :cond_1
    new-instance v0, Landroid/content/Intent;

    .line 34
    .line 35
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 36
    .line 37
    .line 38
    const-string v1, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_REQUEST"

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 41
    .line 42
    .line 43
    const-string v1, "PARAM_SESSIONID"

    .line 44
    .line 45
    iget-wide v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 46
    .line 47
    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 48
    .line 49
    .line 50
    const-string v1, "PARAM_RING_DATASOURCE"

    .line 51
    .line 52
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    const-string p1, "PARAM_RING_RSID"

    .line 56
    .line 57
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 58
    .line 59
    .line 60
    const-string p1, "PARAM_RING_URI"

    .line 61
    .line 62
    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 63
    .line 64
    .line 65
    const-string p1, "PARAM_RING_FILEPATH"

    .line 66
    .line 67
    move-object/from16 v7, p4

    .line 68
    .line 69
    invoke-virtual {v0, p1, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 70
    .line 71
    .line 72
    const-string p1, "PARAM_RING_LOOP"

    .line 73
    .line 74
    move/from16 v8, p5

    .line 75
    .line 76
    invoke-virtual {v0, p1, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 77
    .line 78
    .line 79
    const-string p1, "PARAM_RING_LOOPCOUNT"

    .line 80
    .line 81
    move/from16 v9, p6

    .line 82
    .line 83
    invoke-virtual {v0, p1, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 84
    .line 85
    .line 86
    const-string p1, "PARAM_RING_MODE"

    .line 87
    .line 88
    move/from16 v11, p8

    .line 89
    .line 90
    invoke-virtual {v0, p1, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 91
    .line 92
    .line 93
    const-string p1, "PARAM_RING_USERDATA_STRING"

    .line 94
    .line 95
    move-object/from16 v10, p7

    .line 96
    .line 97
    invoke-virtual {v0, p1, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 98
    .line 99
    .line 100
    const-string p1, "PARAM_OPERATION"

    .line 101
    .line 102
    const-string p2, "OPERATION_STARTRING"

    .line 103
    .line 104
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 105
    .line 106
    .line 107
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 108
    .line 109
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 110
    .line 111
    .line 112
    const/4 p0, 0x0

    .line 113
    return p0
.end method

.method public startService(Ljava/lang/String;)I
    .locals 5

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-gtz v0, :cond_1

    .line 8
    .line 9
    :cond_0
    const-string p1, "internal_disable_dev_switch"

    .line 10
    .line 11
    :cond_1
    iget-boolean v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mIsHostside:Z

    .line 12
    .line 13
    const-string v1, "OPERATION_STARTSERVICE"

    .line 14
    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    iget-wide v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 18
    .line 19
    invoke-static {v1, v2, v3, v0, p1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->startService(Ljava/lang/String;JZLjava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :cond_2
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 25
    .line 26
    if-nez v0, :cond_3

    .line 27
    .line 28
    const/4 p0, -0x1

    .line 29
    return p0

    .line 30
    :cond_3
    new-instance v0, Landroid/content/Intent;

    .line 31
    .line 32
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 33
    .line 34
    .line 35
    const-string v2, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_REQUEST"

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    const-string v2, "PARAM_SESSIONID"

    .line 41
    .line 42
    iget-wide v3, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 43
    .line 44
    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    const-string v2, "PARAM_OPERATION"

    .line 48
    .line 49
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 50
    .line 51
    .line 52
    const-string v1, "EXTRA_DATA_DEVICECONFIG"

    .line 53
    .line 54
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 60
    .line 61
    .line 62
    const/4 p0, 0x0

    .line 63
    return p0
.end method

.method public stopRing()I
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mIsHostside:Z

    .line 2
    .line 3
    const-string v1, "OPERATION_STOPRING"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-wide v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 8
    .line 9
    invoke-static {v1, v2, v3, v0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->stopRing(Ljava/lang/String;JZ)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    const/4 p0, -0x1

    .line 19
    return p0

    .line 20
    :cond_1
    new-instance v0, Landroid/content/Intent;

    .line 21
    .line 22
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v2, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_REQUEST"

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    const-string v2, "PARAM_SESSIONID"

    .line 31
    .line 32
    iget-wide v3, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 33
    .line 34
    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    const-string v2, "PARAM_OPERATION"

    .line 38
    .line 39
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method public stopService()I
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mIsHostside:Z

    .line 2
    .line 3
    const-string v1, "OPERATION_STOPSERVICE"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-wide v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 8
    .line 9
    invoke-static {v1, v2, v3, v0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->stopService(Ljava/lang/String;JZ)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    const/4 p0, -0x1

    .line 19
    return p0

    .line 20
    :cond_1
    new-instance v0, Landroid/content/Intent;

    .line 21
    .line 22
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v2, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_REQUEST"

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    const-string v2, "PARAM_SESSIONID"

    .line 31
    .line 32
    iget-wide v3, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 33
    .line 34
    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    const-string v2, "PARAM_OPERATION"

    .line 38
    .line 39
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method public voiceCallAudioParamChanged(II)I
    .locals 6

    .line 1
    iget-boolean v3, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mIsHostside:Z

    .line 2
    .line 3
    if-eqz v3, :cond_0

    .line 4
    .line 5
    const-string v0, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_REQUEST"

    .line 6
    .line 7
    iget-wide v1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 8
    .line 9
    move v4, p1

    .line 10
    move v5, p2

    .line 11
    invoke-static/range {v0 .. v5}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->voiceCallAudioParamChanged(Ljava/lang/String;JZII)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    move v4, p1

    .line 17
    move v5, p2

    .line 18
    iget-object p1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 19
    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    const/4 p0, -0x1

    .line 23
    return p0

    .line 24
    :cond_1
    new-instance p1, Landroid/content/Intent;

    .line 25
    .line 26
    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string p2, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_REQUEST"

    .line 30
    .line 31
    invoke-virtual {p1, p2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    const-string p2, "PARAM_SESSIONID"

    .line 35
    .line 36
    iget-wide v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 37
    .line 38
    invoke-virtual {p1, p2, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    const-string p2, "PARAM_MODEPOLICY"

    .line 42
    .line 43
    invoke-virtual {p1, p2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 44
    .line 45
    .line 46
    const-string p2, "PARAM_STREAMTYPE"

    .line 47
    .line 48
    invoke-virtual {p1, p2, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 49
    .line 50
    .line 51
    const-string p2, "PARAM_OPERATION"

    .line 52
    .line 53
    const-string v0, "OPERATION_VOICECALL_AUDIOPARAM_CHANGED"

    .line 54
    .line 55
    invoke-virtual {p1, p2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 61
    .line 62
    .line 63
    const/4 p0, 0x0

    .line 64
    return p0
.end method

.method public voiceCallPostprocess()I
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mIsHostside:Z

    .line 2
    .line 3
    const-string v1, "OPERATION_VOICECALL_POSTROCESS"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-wide v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 8
    .line 9
    invoke-static {v1, v2, v3, v0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->voicecallPostprocess(Ljava/lang/String;JZ)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    const/4 p0, -0x1

    .line 19
    return p0

    .line 20
    :cond_1
    new-instance v0, Landroid/content/Intent;

    .line 21
    .line 22
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v2, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_REQUEST"

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    const-string v2, "PARAM_SESSIONID"

    .line 31
    .line 32
    iget-wide v3, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 33
    .line 34
    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    const-string v2, "PARAM_OPERATION"

    .line 38
    .line 39
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method public voiceCallPreprocess(II)I
    .locals 6

    .line 1
    iget-boolean v3, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mIsHostside:Z

    .line 2
    .line 3
    if-eqz v3, :cond_0

    .line 4
    .line 5
    const-string v0, "OPERATION_VOICECALL_PREPROCESS"

    .line 6
    .line 7
    iget-wide v1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 8
    .line 9
    move v4, p1

    .line 10
    move v5, p2

    .line 11
    invoke-static/range {v0 .. v5}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->voicecallPreprocess(Ljava/lang/String;JZII)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    move v4, p1

    .line 17
    move v5, p2

    .line 18
    iget-object p1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 19
    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    const/4 p0, -0x1

    .line 23
    return p0

    .line 24
    :cond_1
    new-instance p1, Landroid/content/Intent;

    .line 25
    .line 26
    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string p2, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_REQUEST"

    .line 30
    .line 31
    invoke-virtual {p1, p2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    const-string p2, "PARAM_SESSIONID"

    .line 35
    .line 36
    iget-wide v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mSessionId:J

    .line 37
    .line 38
    invoke-virtual {p1, p2, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    const-string p2, "PARAM_MODEPOLICY"

    .line 42
    .line 43
    invoke-virtual {p1, p2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 44
    .line 45
    .line 46
    const-string p2, "PARAM_STREAMTYPE"

    .line 47
    .line 48
    invoke-virtual {p1, p2, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 49
    .line 50
    .line 51
    const-string p2, "PARAM_OPERATION"

    .line 52
    .line 53
    const-string v0, "OPERATION_VOICECALL_PREPROCESS"

    .line 54
    .line 55
    invoke-virtual {p1, p2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->mContext:Landroid/content/Context;

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 61
    .line 62
    .line 63
    const/4 p0, 0x0

    .line 64
    return p0
.end method
