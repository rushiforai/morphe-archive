.class public Lcom/tantanapp/media/proxy/api/TTMediaProxy;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/media/proxy/api/TTMediaProxy$b;,
        Lcom/tantanapp/media/proxy/api/TTMediaProxy$a;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "TTMediaProxy"

.field private static mPreloadTaskCompleteListener:Lcom/tantanapp/media/proxy/api/TTMediaProxy$a;

.field private static sAppContext:Landroid/content/Context;

.field private static sProxyServerResultListener:Lcom/tantanapp/media/proxy/api/TTMediaProxy$b;

.field private static soLoadStatus:Z


# instance fields
.field public mNativeContext:J

.field private mTaskIdMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public m_bytes:J

.field public m_completeTimePoint:Ljava/lang/String;

.field public m_connectUsedTime:J

.field public m_downloadLimitRate:J

.field public m_downloadRate:J

.field public m_downloadedBytes:J

.field public m_downloadedDuration:J

.field public m_endReasonCode:I

.field public m_endReasonStr:Ljava/lang/String;

.field public m_httpHeader:Ljava/lang/String;

.field public m_key:Ljava/lang/String;

.field public m_milliSeconds:J

.field public m_priority:I

.field public m_start:J

.field public m_status:I

.field public m_taskId:I

.field public m_url:Ljava/lang/String;

.field public m_usedTime:J

.field public m_waitTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    :try_start_0
    const-string v0, "ttffmpeg"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "ttproxy"

    .line 7
    .line 8
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    sput-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception v0

    .line 16
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    sput-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 21
    .line 22
    :goto_0
    const/4 v0, 0x0

    .line 23
    sput-object v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->mPreloadTaskCompleteListener:Lcom/tantanapp/media/proxy/api/TTMediaProxy$a;

    .line 24
    .line 25
    sput-object v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->sProxyServerResultListener:Lcom/tantanapp/media/proxy/api/TTMediaProxy$b;

    .line 26
    .line 27
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->mTaskIdMap:Ljava/util/HashMap;

    .line 10
    .line 11
    return-void
.end method

.method public static getDNS()Ljava/lang/String;
    .locals 6

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->sAppContext:Landroid/content/Context;

    .line 7
    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    :try_start_0
    const-string v2, "connectivity"

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Landroid/net/ConnectivityManager;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/net/ConnectivityManager;->getLinkProperties(Landroid/net/Network;)Landroid/net/LinkProperties;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    invoke-virtual {v1}, Landroid/net/LinkProperties;->getDnsServers()Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_1

    .line 45
    .line 46
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Ljava/net/InetAddress;

    .line 51
    .line 52
    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    if-eqz v2, :cond_0

    .line 57
    .line 58
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-nez v3, :cond_0

    .line 63
    .line 64
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    if-nez v3, :cond_0

    .line 69
    .line 70
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :catchall_0
    move-exception v1

    .line 75
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 76
    .line 77
    .line 78
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-eqz v1, :cond_3

    .line 83
    .line 84
    :try_start_1
    const-string v1, "android.os.SystemProperties"

    .line 85
    .line 86
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    const-string v2, "get"

    .line 91
    .line 92
    const-class v3, Ljava/lang/String;

    .line 93
    .line 94
    filled-new-array {v3}, [Ljava/lang/Class;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    const-string v2, "net.dns1"

    .line 103
    .line 104
    const-string v3, "net.dns2"

    .line 105
    .line 106
    const-string v4, "net.dns3"

    .line 107
    .line 108
    const-string v5, "net.dns4"

    .line 109
    .line 110
    filled-new-array {v2, v3, v4, v5}, [Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    const/4 v3, 0x0

    .line 115
    :goto_1
    const/4 v4, 0x4

    .line 116
    if-ge v3, v4, :cond_3

    .line 117
    .line 118
    aget-object v4, v2, v3

    .line 119
    .line 120
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v4

    .line 124
    const/4 v5, 0x0

    .line 125
    invoke-virtual {v1, v5, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v4

    .line 129
    check-cast v4, Ljava/lang/String;

    .line 130
    .line 131
    if-eqz v4, :cond_2

    .line 132
    .line 133
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    .line 134
    .line 135
    .line 136
    move-result v5

    .line 137
    if-nez v5, :cond_2

    .line 138
    .line 139
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v5

    .line 143
    if-nez v5, :cond_2

    .line 144
    .line 145
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 146
    .line 147
    .line 148
    goto :goto_2

    .line 149
    :catchall_1
    move-exception v1

    .line 150
    goto :goto_3

    .line 151
    :cond_2
    :goto_2
    add-int/lit8 v3, v3, 0x1

    .line 152
    .line 153
    goto :goto_1

    .line 154
    :goto_3
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 155
    .line 156
    .line 157
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 158
    .line 159
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 167
    .line 168
    .line 169
    move-result v2

    .line 170
    if-eqz v2, :cond_4

    .line 171
    .line 172
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    check-cast v2, Ljava/lang/String;

    .line 177
    .line 178
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    const-string v2, ", "

    .line 182
    .line 183
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    goto :goto_4

    .line 187
    :cond_4
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    return-object v0
.end method

.method public static final md5(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 1
    :try_start_0
    const-string v0, "MD5"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->update([B)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    array-length v1, p0

    .line 24
    const/4 v2, 0x0

    .line 25
    :goto_0
    if-ge v2, v1, :cond_1

    .line 26
    .line 27
    aget-byte v3, p0, v2

    .line 28
    .line 29
    and-int/lit16 v3, v3, 0xff

    .line 30
    .line 31
    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    :goto_1
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    const/4 v5, 0x2

    .line 40
    if-ge v4, v5, :cond_0

    .line 41
    .line 42
    new-instance v4, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .line 46
    .line 47
    const-string v5, "0"

    .line 48
    .line 49
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    goto :goto_1

    .line 60
    :cond_0
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    add-int/lit8 v2, v2, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    return-object p0

    .line 71
    :catch_0
    move-exception p0

    .line 72
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 73
    .line 74
    .line 75
    const-string p0, ""

    .line 76
    .line 77
    return-object p0
.end method

.method private native nativeClearCacheWithKey(Ljava/lang/String;)J
.end method

.method private native nativeDumpMemoryData()V
.end method

.method private native nativeProxyAddPreloadTaskWithPreloadDuration(Ljava/lang/String;Ljava/lang/String;JJJLjava/lang/String;IJLjava/lang/String;)I
.end method

.method private native nativeProxyAddPreloadTaskWithRangeSize(Ljava/lang/String;Ljava/lang/String;JJLjava/lang/String;IJLjava/lang/String;)I
.end method

.method private native nativeProxyCheckCacheExist(Ljava/lang/String;)I
.end method

.method private native nativeProxyClearAllCache()V
.end method

.method private native nativeProxyClearAllPreloadTask()I
.end method

.method private native nativeProxyClearCache()V
.end method

.method private native nativeProxyGenerateSession()Ljava/lang/String;
.end method

.method private native nativeProxyGetAllDownloadedBytes()J
.end method

.method private native nativeProxyGetCurAllDownloadRate()J
.end method

.method private native nativeProxyGetTaskCount(I)I
.end method

.method private native nativeProxyHttpServerStart()V
.end method

.method private native nativeProxyInit(Ljava/lang/String;Ljava/lang/String;III)J
.end method

.method private native nativeProxyLimitRate(IJ)I
.end method

.method private native nativeProxyPauseAllPreloadTask()I
.end method

.method private native nativeProxyPausePreloadTaskWithFileKey(Ljava/lang/String;)I
.end method

.method private native nativeProxyPausePreloadTaskWithId(I)I
.end method

.method private native nativeProxyRemovePreloadTaskWithFileKey(Ljava/lang/String;)I
.end method

.method private native nativeProxyRemovePreloadTaskWithId(I)I
.end method

.method private native nativeProxyResumeAllPreloadTask()I
.end method

.method private native nativeProxyResumePreloadTaskWithFileKey(Ljava/lang/String;)I
.end method

.method private native nativeProxyResumePreloadTaskWithId(I)I
.end method

.method private native nativeProxySetConfig(Ljava/lang/String;)V
.end method

.method private native nativeProxySwitchPlayURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method private native nativeProxyUnInit()V
.end method

.method private native nativeProxyUpdateAllTaskInfo()[Ljava/lang/Object;
.end method

.method private native nativeProxyUpdatePlayerPreloadSize(J)V
.end method

.method private native nativeProxyUpdateTaskInfoForStatus(I)[Ljava/lang/Object;
.end method

.method public static postEventFromNative(Ljava/lang/String;)V
    .locals 4

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;-><init>()V

    .line 7
    .line 8
    .line 9
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string p0, "mEventCode"

    .line 15
    .line 16
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    iput p0, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mEventCode:I

    .line 21
    .line 22
    const-string p0, "mEventSubCode"

    .line 23
    .line 24
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    iput p0, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mEventSubCode:I

    .line 29
    .line 30
    const-string p0, "mTaskId"

    .line 31
    .line 32
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    iput p0, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mTaskId:I

    .line 37
    .line 38
    const-string p0, "mStatus"

    .line 39
    .line 40
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    iput p0, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mStatus:I

    .line 45
    .line 46
    const-string p0, "mUrl"

    .line 47
    .line 48
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    iput-object p0, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mUrl:Ljava/lang/String;

    .line 53
    .line 54
    const-string p0, "mKey"

    .line 55
    .line 56
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    iput-object p0, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mKey:Ljava/lang/String;

    .line 61
    .line 62
    const-string p0, "mHttpHeader"

    .line 63
    .line 64
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    iput-object p0, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mHttpHeader:Ljava/lang/String;

    .line 69
    .line 70
    const-string p0, "mPriority"

    .line 71
    .line 72
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    iput p0, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mPriority:I

    .line 77
    .line 78
    const-string p0, "mRequireStart"

    .line 79
    .line 80
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 81
    .line 82
    .line 83
    move-result-wide v2

    .line 84
    iput-wide v2, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mRequireStart:J

    .line 85
    .line 86
    const-string p0, "mRequireSize"

    .line 87
    .line 88
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 89
    .line 90
    .line 91
    move-result-wide v2

    .line 92
    iput-wide v2, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mRequireSize:J

    .line 93
    .line 94
    const-string p0, "mRequireDuration"

    .line 95
    .line 96
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 97
    .line 98
    .line 99
    move-result-wide v2

    .line 100
    iput-wide v2, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mRequireDuration:J

    .line 101
    .line 102
    const-string p0, "mDownloadedSize"

    .line 103
    .line 104
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 105
    .line 106
    .line 107
    move-result-wide v2

    .line 108
    iput-wide v2, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mDownloadedSize:J

    .line 109
    .line 110
    const-string p0, "mDownloadedDuration"

    .line 111
    .line 112
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 113
    .line 114
    .line 115
    move-result-wide v2

    .line 116
    iput-wide v2, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mDownloadedDuration:J

    .line 117
    .line 118
    const-string p0, "mConnectUsedTime"

    .line 119
    .line 120
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 121
    .line 122
    .line 123
    move-result-wide v2

    .line 124
    iput-wide v2, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mConnectUsedTime:J

    .line 125
    .line 126
    const-string p0, "mUsedTime"

    .line 127
    .line 128
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 129
    .line 130
    .line 131
    move-result-wide v2

    .line 132
    iput-wide v2, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mUsedTime:J

    .line 133
    .line 134
    const-string p0, "mCompleteTimestamp"

    .line 135
    .line 136
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 137
    .line 138
    .line 139
    move-result-wide v2

    .line 140
    iput-wide v2, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mCompleteTimestamp:J

    .line 141
    .line 142
    const-string p0, "mDownloadRate"

    .line 143
    .line 144
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 145
    .line 146
    .line 147
    move-result-wide v2

    .line 148
    iput-wide v2, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mDownloadRate:J

    .line 149
    .line 150
    const-string p0, "mDownloadLimitRate"

    .line 151
    .line 152
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 153
    .line 154
    .line 155
    move-result-wide v2

    .line 156
    iput-wide v2, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mDownloadLimitRate:J

    .line 157
    .line 158
    const-string p0, "mAverageRate"

    .line 159
    .line 160
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 161
    .line 162
    .line 163
    move-result-wide v2

    .line 164
    iput-wide v2, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mAverageRate:J

    .line 165
    .line 166
    const-string p0, "mWaitTime"

    .line 167
    .line 168
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 169
    .line 170
    .line 171
    move-result-wide v2

    .line 172
    iput-wide v2, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mWaitTime:J

    .line 173
    .line 174
    const-string p0, "mEndReasonCode"

    .line 175
    .line 176
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 177
    .line 178
    .line 179
    move-result p0

    .line 180
    iput p0, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mEndReasonCode:I

    .line 181
    .line 182
    const-string p0, "mEndReasonStr"

    .line 183
    .line 184
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    iput-object p0, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mEndReasonStr:Ljava/lang/String;

    .line 189
    .line 190
    const-string p0, "mAddTimestamp"

    .line 191
    .line 192
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 193
    .line 194
    .line 195
    move-result-wide v2

    .line 196
    iput-wide v2, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mAddTimestamp:J

    .line 197
    .line 198
    const-string p0, "mTcpConnectTime"

    .line 199
    .line 200
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 201
    .line 202
    .line 203
    move-result-wide v2

    .line 204
    iput-wide v2, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mTcpConnectTime:J

    .line 205
    .line 206
    const-string p0, "mDnsUsedTime"

    .line 207
    .line 208
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 209
    .line 210
    .line 211
    move-result-wide v2

    .line 212
    iput-wide v2, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mDnsUsedTime:J

    .line 213
    .line 214
    const-string p0, "mHttpHeaderTime"

    .line 215
    .line 216
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 217
    .line 218
    .line 219
    move-result-wide v2

    .line 220
    iput-wide v2, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mHttpHeaderTime:J

    .line 221
    .line 222
    const-string p0, "mHttpBodyTime"

    .line 223
    .line 224
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 225
    .line 226
    .line 227
    move-result-wide v2

    .line 228
    iput-wide v2, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mHttpBodyTime:J

    .line 229
    .line 230
    const-string p0, "mHttpCode"

    .line 231
    .line 232
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 233
    .line 234
    .line 235
    move-result p0

    .line 236
    iput p0, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mHttpCode:I

    .line 237
    .line 238
    const-string p0, "mCdnIp"

    .line 239
    .line 240
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object p0

    .line 244
    iput-object p0, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mCdnIp:Ljava/lang/String;

    .line 245
    .line 246
    const-string p0, "mSessionID"

    .line 247
    .line 248
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object p0

    .line 252
    iput-object p0, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mSessionID:Ljava/lang/String;

    .line 253
    .line 254
    const-string p0, "mFirstWriteTimestamp"

    .line 255
    .line 256
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 257
    .line 258
    .line 259
    move-result-wide v2

    .line 260
    iput-wide v2, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mFirstWriteTimestamp:J

    .line 261
    .line 262
    const-string p0, "mIsFirstNetworkPacket"

    .line 263
    .line 264
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 265
    .line 266
    .line 267
    move-result p0

    .line 268
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 269
    .line 270
    .line 271
    move-result-object p0

    .line 272
    iput-object p0, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mIsFirstNetworkPacket:Ljava/lang/Boolean;

    .line 273
    .line 274
    const-string p0, "mPreloadThreadNumber"

    .line 275
    .line 276
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 277
    .line 278
    .line 279
    move-result p0

    .line 280
    iput p0, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mPreloadThreadNumber:I

    .line 281
    .line 282
    invoke-static {}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->getDNS()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object p0

    .line 286
    iput-object p0, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mDNSServers:Ljava/lang/String;

    .line 287
    .line 288
    const-string p0, "mGetFileSizeCost"

    .line 289
    .line 290
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 291
    .line 292
    .line 293
    move-result p0

    .line 294
    int-to-long v2, p0

    .line 295
    iput-wide v2, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mGetFileSizeCost:J

    .line 296
    .line 297
    const-string p0, "mTlsTime"

    .line 298
    .line 299
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 300
    .line 301
    .line 302
    move-result p0

    .line 303
    iput p0, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mTlsTime:I

    .line 304
    .line 305
    const-string p0, "mFirstPacketTime"

    .line 306
    .line 307
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 308
    .line 309
    .line 310
    move-result p0

    .line 311
    iput p0, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mFirstPacketTime:I

    .line 312
    .line 313
    const-string p0, "mHeaderSize"

    .line 314
    .line 315
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 316
    .line 317
    .line 318
    move-result p0

    .line 319
    iput p0, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mHeaderSize:I

    .line 320
    .line 321
    iget p0, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mEventCode:I

    .line 322
    .line 323
    iget v1, v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mEventSubCode:I

    .line 324
    .line 325
    invoke-static {p0, v1, v0}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->postEventFromNativeDeal(IILjava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 326
    .line 327
    .line 328
    return-void

    .line 329
    :catch_0
    move-exception p0

    .line 330
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 331
    .line 332
    .line 333
    return-void
.end method

.method private static postEventFromNativeDeal(IILjava/lang/Object;)V
    .locals 11

    .line 1
    move-object v7, p2

    .line 2
    check-cast v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;

    .line 3
    .line 4
    new-instance p2, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v0, "url: "

    .line 7
    .line 8
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mUrl:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v0, "; offset: "

    .line 17
    .line 18
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-wide v0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mRequireStart:J

    .line 22
    .line 23
    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    const-string v9, "TTMediaProxy"

    .line 31
    .line 32
    invoke-static {v9, p2}, Ll/dtd0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    const/4 p2, 0x7

    .line 36
    const-string v10, " EventSubCode:"

    .line 37
    .line 38
    if-gt p0, p2, :cond_0

    .line 39
    .line 40
    if-gez p0, :cond_1

    .line 41
    .line 42
    :cond_0
    move v1, p1

    .line 43
    goto/16 :goto_2

    .line 44
    .line 45
    :cond_1
    packed-switch p0, :pswitch_data_0

    .line 46
    .line 47
    .line 48
    :cond_2
    :goto_0
    move v1, p1

    .line 49
    goto :goto_1

    .line 50
    :pswitch_0
    sget-object v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->mPreloadTaskCompleteListener:Lcom/tantanapp/media/proxy/api/TTMediaProxy$a;

    .line 51
    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    iget v1, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mTaskId:I

    .line 55
    .line 56
    iget-object v2, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mUrl:Ljava/lang/String;

    .line 57
    .line 58
    iget-object v3, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mKey:Ljava/lang/String;

    .line 59
    .line 60
    iget-object v4, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mSessionID:Ljava/lang/String;

    .line 61
    .line 62
    iget-wide v5, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mDownloadedSize:J

    .line 63
    .line 64
    invoke-interface/range {v0 .. v7}, Lcom/tantanapp/media/proxy/api/TTMediaProxy$a;->b(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/tantanapp/media/proxy/api/PreloadTaskInfo;)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :pswitch_1
    sget-object v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->mPreloadTaskCompleteListener:Lcom/tantanapp/media/proxy/api/TTMediaProxy$a;

    .line 69
    .line 70
    if-eqz v0, :cond_2

    .line 71
    .line 72
    iget v1, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mTaskId:I

    .line 73
    .line 74
    iget-object v2, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mUrl:Ljava/lang/String;

    .line 75
    .line 76
    iget-object v3, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mKey:Ljava/lang/String;

    .line 77
    .line 78
    iget-object v4, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mSessionID:Ljava/lang/String;

    .line 79
    .line 80
    iget-wide v5, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mDownloadedSize:J

    .line 81
    .line 82
    invoke-interface/range {v0 .. v7}, Lcom/tantanapp/media/proxy/api/TTMediaProxy$a;->b(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/tantanapp/media/proxy/api/PreloadTaskInfo;)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :pswitch_2
    sget-object v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->mPreloadTaskCompleteListener:Lcom/tantanapp/media/proxy/api/TTMediaProxy$a;

    .line 87
    .line 88
    if-eqz v0, :cond_2

    .line 89
    .line 90
    iget v2, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mTaskId:I

    .line 91
    .line 92
    iget-object v3, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mUrl:Ljava/lang/String;

    .line 93
    .line 94
    iget-object v4, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mKey:Ljava/lang/String;

    .line 95
    .line 96
    iget-object v5, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mSessionID:Ljava/lang/String;

    .line 97
    .line 98
    move-object v8, v7

    .line 99
    iget-wide v6, v8, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mDownloadedSize:J

    .line 100
    .line 101
    move v1, p1

    .line 102
    invoke-interface/range {v0 .. v8}, Lcom/tantanapp/media/proxy/api/TTMediaProxy$a;->a(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/tantanapp/media/proxy/api/PreloadTaskInfo;)V

    .line 103
    .line 104
    .line 105
    move-object v7, v8

    .line 106
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 107
    .line 108
    const-string p2, "Event:"

    .line 109
    .line 110
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    sget-object p2, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo$TaskEndReason;->StrTaskEndReason:[Ljava/lang/String;

    .line 114
    .line 115
    aget-object p2, p2, p0

    .line 116
    .line 117
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const-string p2, " EventCode:"

    .line 121
    .line 122
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {p1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    const-string p0, " Task id "

    .line 135
    .line 136
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    iget p0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mTaskId:I

    .line 140
    .line 141
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    const-string p0, " status:"

    .line 145
    .line 146
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    iget p0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mStatus:I

    .line 150
    .line 151
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    const-string p0, " "

    .line 155
    .line 156
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    sget-object p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo$TaskStatus;->StrTaskStatus:[Ljava/lang/String;

    .line 160
    .line 161
    iget p2, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mStatus:I

    .line 162
    .line 163
    aget-object p0, p0, p2

    .line 164
    .line 165
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    const-string p0, " url:"

    .line 169
    .line 170
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    iget-object p0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mUrl:Ljava/lang/String;

    .line 174
    .line 175
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    const-string p0, " key:"

    .line 179
    .line 180
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    iget-object p0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mKey:Ljava/lang/String;

    .line 184
    .line 185
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    const-string p0, " md5key:"

    .line 189
    .line 190
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    iget-object p0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mKey:Ljava/lang/String;

    .line 194
    .line 195
    invoke-static {p0}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->md5(Ljava/lang/String;)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    const-string p0, " httpHeader:"

    .line 203
    .line 204
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    iget-object p0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mHttpHeader:Ljava/lang/String;

    .line 208
    .line 209
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    const-string p0, " priority:"

    .line 213
    .line 214
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    iget p0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mPriority:I

    .line 218
    .line 219
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    const-string p0, " start:"

    .line 223
    .line 224
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    iget-wide v0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mRequireStart:J

    .line 228
    .line 229
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    const-string p0, " size:"

    .line 233
    .line 234
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    iget-wide v0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mRequireSize:J

    .line 238
    .line 239
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    const-string p0, " duration:"

    .line 243
    .line 244
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    iget-wide v0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mRequireDuration:J

    .line 248
    .line 249
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    const-string p0, " downloaded Bytes:"

    .line 253
    .line 254
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    iget-wide v0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mDownloadedSize:J

    .line 258
    .line 259
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    const-string p0, " downloaded Duration:"

    .line 263
    .line 264
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    iget-wide v0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mDownloadedDuration:J

    .line 268
    .line 269
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    const-string p0, " connect UsedTime:"

    .line 273
    .line 274
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    iget-wide v0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mConnectUsedTime:J

    .line 278
    .line 279
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    const-string p0, " usedTime:"

    .line 283
    .line 284
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    iget-wide v0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mUsedTime:J

    .line 288
    .line 289
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 290
    .line 291
    .line 292
    const-string p0, " completeTimestamp:"

    .line 293
    .line 294
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 295
    .line 296
    .line 297
    iget-wide v0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mCompleteTimestamp:J

    .line 298
    .line 299
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 300
    .line 301
    .line 302
    const-string p0, " downloadRate:"

    .line 303
    .line 304
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 305
    .line 306
    .line 307
    iget-wide v0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mDownloadRate:J

    .line 308
    .line 309
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 310
    .line 311
    .line 312
    const-string p0, " downloadLimitRate:"

    .line 313
    .line 314
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 315
    .line 316
    .line 317
    iget-wide v0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mDownloadLimitRate:J

    .line 318
    .line 319
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 320
    .line 321
    .line 322
    const-string p0, " averageRate:"

    .line 323
    .line 324
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 325
    .line 326
    .line 327
    iget-wide v0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mAverageRate:J

    .line 328
    .line 329
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 330
    .line 331
    .line 332
    const-string p0, " waitTime:"

    .line 333
    .line 334
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 335
    .line 336
    .line 337
    iget-wide v0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mWaitTime:J

    .line 338
    .line 339
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 340
    .line 341
    .line 342
    const-string p0, " endReasonCode:"

    .line 343
    .line 344
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 345
    .line 346
    .line 347
    iget p0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mEndReasonCode:I

    .line 348
    .line 349
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 350
    .line 351
    .line 352
    const-string p0, " endReasonStr:"

    .line 353
    .line 354
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 355
    .line 356
    .line 357
    iget-object p0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mEndReasonStr:Ljava/lang/String;

    .line 358
    .line 359
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 360
    .line 361
    .line 362
    const-string p0, " addTimestamp:"

    .line 363
    .line 364
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 365
    .line 366
    .line 367
    iget-wide v0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mAddTimestamp:J

    .line 368
    .line 369
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 370
    .line 371
    .line 372
    const-string p0, " Ip:"

    .line 373
    .line 374
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 375
    .line 376
    .line 377
    iget-object p0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mCdnIp:Ljava/lang/String;

    .line 378
    .line 379
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 380
    .line 381
    .line 382
    const-string p0, " dnsUseTime:"

    .line 383
    .line 384
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 385
    .line 386
    .line 387
    iget-wide v0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mDnsUsedTime:J

    .line 388
    .line 389
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 390
    .line 391
    .line 392
    const-string p0, " tcpConnectTime:"

    .line 393
    .line 394
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 395
    .line 396
    .line 397
    iget-wide v0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mTcpConnectTime:J

    .line 398
    .line 399
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 400
    .line 401
    .line 402
    const-string p0, " httpHeaderTime:"

    .line 403
    .line 404
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 405
    .line 406
    .line 407
    iget-wide v0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mHttpHeaderTime:J

    .line 408
    .line 409
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 410
    .line 411
    .line 412
    const-string p0, " httpBodyTime:"

    .line 413
    .line 414
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 415
    .line 416
    .line 417
    iget-wide v0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mHttpBodyTime:J

    .line 418
    .line 419
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 420
    .line 421
    .line 422
    const-string p0, " httpCode:"

    .line 423
    .line 424
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 425
    .line 426
    .line 427
    iget p0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mHttpCode:I

    .line 428
    .line 429
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 430
    .line 431
    .line 432
    const-string p0, " sessionID:"

    .line 433
    .line 434
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 435
    .line 436
    .line 437
    iget-object p0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mSessionID:Ljava/lang/String;

    .line 438
    .line 439
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 440
    .line 441
    .line 442
    const-string p0, " FirstWriteTimestamp:"

    .line 443
    .line 444
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 445
    .line 446
    .line 447
    iget-wide v0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mFirstWriteTimestamp:J

    .line 448
    .line 449
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 450
    .line 451
    .line 452
    const-string p0, " firstWrite-add:"

    .line 453
    .line 454
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 455
    .line 456
    .line 457
    iget-wide v0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mFirstWriteTimestamp:J

    .line 458
    .line 459
    iget-wide v2, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mAddTimestamp:J

    .line 460
    .line 461
    sub-long/2addr v0, v2

    .line 462
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 463
    .line 464
    .line 465
    const-string p0, " waitTime+connctTime+useTime:"

    .line 466
    .line 467
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 468
    .line 469
    .line 470
    iget-wide v0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mWaitTime:J

    .line 471
    .line 472
    iget-wide v2, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mConnectUsedTime:J

    .line 473
    .line 474
    add-long/2addr v0, v2

    .line 475
    iget-wide v2, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mUsedTime:J

    .line 476
    .line 477
    add-long/2addr v0, v2

    .line 478
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 479
    .line 480
    .line 481
    const-string p0, " end-add:"

    .line 482
    .line 483
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 484
    .line 485
    .line 486
    iget-wide v0, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mCompleteTimestamp:J

    .line 487
    .line 488
    iget-wide v2, v7, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mAddTimestamp:J

    .line 489
    .line 490
    sub-long/2addr v0, v2

    .line 491
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 492
    .line 493
    .line 494
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 495
    .line 496
    .line 497
    move-result-object p0

    .line 498
    invoke-static {v9, p0}, Ll/dtd0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 499
    .line 500
    .line 501
    return-void

    .line 502
    :goto_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 503
    .line 504
    const-string p2, "EventCode illegal!!!  EventCode:"

    .line 505
    .line 506
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 507
    .line 508
    .line 509
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 510
    .line 511
    .line 512
    invoke-virtual {p1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 513
    .line 514
    .line 515
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 516
    .line 517
    .line 518
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 519
    .line 520
    .line 521
    move-result-object p0

    .line 522
    invoke-static {v9, p0}, Ll/dtd0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 523
    .line 524
    .line 525
    return-void

    .line 526
    nop

    .line 527
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public static postProxyServerResultFromNative(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->sProxyServerResultListener:Lcom/tantanapp/media/proxy/api/TTMediaProxy$b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0}, Lcom/tantanapp/media/proxy/api/TTMediaProxy$b;->a(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static setAppContext(Landroid/content/Context;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sput-object p0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->sAppContext:Landroid/content/Context;

    .line 8
    .line 9
    :cond_0
    return-void
.end method


# virtual methods
.method public proxyAddPreloadTaskWithPreloadDuration(Ljava/lang/String;Ljava/lang/String;JJJLjava/lang/String;IJLjava/lang/String;)I
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct/range {p0 .. p13}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeProxyAddPreloadTaskWithPreloadDuration(Ljava/lang/String;Ljava/lang/String;JJJLjava/lang/String;IJLjava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p2, 0x0

    .line 11
    :goto_0
    if-lez p2, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->mTaskIdMap:Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    invoke-virtual {p0, p3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    :cond_1
    return p2
.end method

.method public proxyAddPreloadTaskWithRangeSize(Ljava/lang/String;Ljava/lang/String;JJLjava/lang/String;IJLjava/lang/String;)I
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct/range {p0 .. p11}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeProxyAddPreloadTaskWithRangeSize(Ljava/lang/String;Ljava/lang/String;JJLjava/lang/String;IJLjava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p2, 0x0

    .line 11
    :goto_0
    if-lez p2, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->mTaskIdMap:Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    invoke-virtual {p0, p3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    :cond_1
    return p2
.end method

.method public proxyCheckCacheExist(Ljava/lang/String;)I
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeProxyCheckCacheExist(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public proxyClearAllCache()V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeProxyClearAllCache()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public proxyClearAllPreloadTask()I
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeProxyClearAllPreloadTask()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public proxyClearCache()V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeProxyClearCache()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public proxyClearCacheWithKey(Ljava/lang/String;)J
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-direct {p0, p1}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeClearCacheWithKey(Ljava/lang/String;)J

    .line 12
    .line 13
    .line 14
    move-result-wide p0

    .line 15
    return-wide p0

    .line 16
    :cond_0
    const-wide/16 p0, -0x1

    .line 17
    .line 18
    return-wide p0
.end method

.method public proxyDumpMemoryData()V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeDumpMemoryData()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public proxyGenerateSession()Ljava/lang/String;
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeProxyGenerateSession()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, ""

    .line 11
    .line 12
    return-object p0
.end method

.method public proxyGetAllDownloadedBytes()J
    .locals 2

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeProxyGetAllDownloadedBytes()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, -0x1

    .line 11
    .line 12
    return-wide v0
.end method

.method public proxyGetCurAllDownloadRate()J
    .locals 2

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeProxyGetCurAllDownloadRate()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, -0x1

    .line 11
    .line 12
    return-wide v0
.end method

.method public proxyGetTaskCount(I)I
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeProxyGetTaskCount(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public proxyHttpServerStart()V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeProxyHttpServerStart()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public proxyInit(Ljava/lang/String;Ljava/lang/String;III)J
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct/range {p0 .. p5}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeProxyInit(Ljava/lang/String;Ljava/lang/String;III)J

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    return-wide p0

    .line 10
    :cond_0
    const-wide/16 p0, -0x1

    .line 11
    .line 12
    return-wide p0
.end method

.method public proxyLimitRate(IJ)I
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1, p2, p3}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeProxyLimitRate(IJ)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public proxyPauseAllPreloadTask()I
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeProxyPauseAllPreloadTask()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public proxyPausePreloadTaskWithFileKey(Ljava/lang/String;)I
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeProxyPausePreloadTaskWithFileKey(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public proxyPausePreloadTaskWithId(I)I
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeProxyPausePreloadTaskWithId(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public proxyRemovePreloadTaskWithFileKey(Ljava/lang/String;)I
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeProxyRemovePreloadTaskWithFileKey(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public proxyRemovePreloadTaskWithId(I)I
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeProxyRemovePreloadTaskWithId(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public proxyResumeAllPreloadTask()I
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeProxyResumeAllPreloadTask()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public proxyResumePreloadTaskWithFileKey(Ljava/lang/String;)I
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeProxyResumePreloadTaskWithFileKey(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public proxyResumePreloadTaskWithId(I)I
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeProxyResumePreloadTaskWithId(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public proxySetConfig(Ljava/lang/String;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeProxySetConfig(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public proxySwitchPlayURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1, p2, p3}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeProxySwitchPlayURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    return-object p1
.end method

.method public proxyUninit()V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeProxyUnInit()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public proxyUpdateAllTaskInfo()V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeProxyUpdateAllTaskInfo()[Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public proxyUpdatePlayerPreloadSize(J)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1, p2}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeProxyUpdatePlayerPreloadSize(J)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public proxyUpdateTaskInfoForStatus(I)[Ljava/lang/Object;
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->soLoadStatus:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->nativeProxyUpdateTaskInfoForStatus(I)[Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    new-array p0, p0, [Ljava/lang/Object;

    .line 12
    .line 13
    return-object p0
.end method

.method public setOnPreloadTaskCompleteListener(Lcom/tantanapp/media/proxy/api/TTMediaProxy$a;)V
    .locals 0

    .line 1
    sput-object p1, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->mPreloadTaskCompleteListener:Lcom/tantanapp/media/proxy/api/TTMediaProxy$a;

    .line 2
    .line 3
    return-void
.end method

.method public setProxyServerResultListener(Lcom/tantanapp/media/proxy/api/TTMediaProxy$b;)V
    .locals 0

    .line 1
    sput-object p1, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->sProxyServerResultListener:Lcom/tantanapp/media/proxy/api/TTMediaProxy$b;

    .line 2
    .line 3
    return-void
.end method
