.class public Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;,
        Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$WarmUpTiming;,
        Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;,
        Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$ConfigurationException;,
        Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Singleton;,
        Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$LibraryLoader;
    }
.end annotation


# static fields
.field private static final BACKTRACE_LIBRARY_NAME:Ljava/lang/String; = "wechatbacktrace"

.field public static final ISOLATE_PROCESS_SUFFIX:Ljava/lang/String; = ":backtrace__"

.field private static final SYSTEM_BOOT_OAT_PATH:Ljava/lang/String; = "/system/framework/arm/"

.field private static final SYSTEM_BOOT_OAT_PATH_64:Ljava/lang/String; = "/system/framework/arm64/"

.field private static final SYSTEM_LIBRARY_PATH:Ljava/lang/String; = "/system/lib/"

.field private static final SYSTEM_LIBRARY_PATH_64:Ljava/lang/String; = "/system/lib64/"

.field private static final SYSTEM_LIBRARY_PATH_Q:Ljava/lang/String; = "/apex/com.android.runtime/lib/"

.field private static final SYSTEM_LIBRARY_PATH_Q_64:Ljava/lang/String; = "/apex/com.android.runtime/lib64/"

.field private static final TAG:Ljava/lang/String; = "Matrix.Backtrace"

.field private static sLibraryLoaded:Z


# instance fields
.field private volatile mConfiguration:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;

.field private volatile mConfigured:Z

.field private mHandler:Landroid/os/Handler;

.field private volatile mInitialized:Z

.field private mScheduleQutGenerationRequestsRunning:Z

.field private mWarmUpDelegate:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->mWarmUpDelegate:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 10
    .line 11
    new-instance v0, Landroid/os/Handler;

    .line 12
    .line 13
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->mHandler:Landroid/os/Handler;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-boolean v0, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->mScheduleQutGenerationRequestsRunning:Z

    .line 24
    .line 25
    return-void
.end method

.method public static synthetic access$000(Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->requestQutGenerate()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$102(Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->mScheduleQutGenerationRequestsRunning:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$200(Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->startScheduleQutGenerationRequests()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$300(Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->configure(Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private configure(Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;)V
    .locals 6

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->runningInIsolateProcess(Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const-string v2, "Matrix.Backtrace"

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-string p0, "Isolate process does not need any configuration."

    .line 11
    .line 12
    new-array p1, v1, [Ljava/lang/Object;

    .line 13
    .line 14
    invoke-static {v2, p0, p1}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-boolean v0, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mWarmUpInIsolateProcess:Z

    .line 19
    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    iget-object v0, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mLibraryLoader:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$LibraryLoader;

    .line 23
    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    new-instance p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$ConfigurationException;

    .line 28
    .line 29
    const-string p1, "Custom library loader is not supported in isolate process warm-up mode."

    .line 30
    .line 31
    invoke-direct {p0, p1}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$ConfigurationException;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    throw p0

    .line 35
    :cond_2
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mLibraryLoader:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$LibraryLoader;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->loadLibrary(Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$LibraryLoader;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mPathOfXLogSo:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v0}, Lcom/p1/mobile/backtrace/xlog/XLogNative;->setXLogger(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-boolean v0, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mEnableLog:Z

    .line 46
    .line 47
    invoke-static {v0}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->enableLogger(Z)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-array v1, v1, [Ljava/lang/Object;

    .line 55
    .line 56
    invoke-static {v2, v0, v1}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mBacktraceMode:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 60
    .line 61
    sget-object v1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;->Fp:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 62
    .line 63
    if-eq v0, v1, :cond_3

    .line 64
    .line 65
    sget-object v3, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;->Dwarf:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 66
    .line 67
    if-ne v0, v3, :cond_4

    .line 68
    .line 69
    :cond_3
    iget v0, v0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;->value:I

    .line 70
    .line 71
    invoke-static {v0}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktraceNative;->setBacktraceMode(I)V

    .line 72
    .line 73
    .line 74
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mBacktraceMode:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 75
    .line 76
    sget-object v3, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;->Quicken:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 77
    .line 78
    if-eq v0, v3, :cond_5

    .line 79
    .line 80
    sget-object v4, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;->FpUntilQuickenWarmedUp:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 81
    .line 82
    if-eq v0, v4, :cond_5

    .line 83
    .line 84
    sget-object v4, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;->DwarfUntilQuickenWarmedUp:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 85
    .line 86
    if-eq v0, v4, :cond_5

    .line 87
    .line 88
    iget-boolean v0, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mQuickenAlwaysOn:Z

    .line 89
    .line 90
    if-eqz v0, :cond_b

    .line 91
    .line 92
    :cond_5
    invoke-static {p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->validateSavingPath(Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    const-string v4, "Set saving path: %s"

    .line 97
    .line 98
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    invoke-static {v2, v4, v5}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    new-instance v4, Ljava/io/File;

    .line 106
    .line 107
    invoke-direct {v4, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    .line 111
    .line 112
    .line 113
    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {v0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 116
    .line 117
    .line 118
    move-result v5

    .line 119
    if-nez v5, :cond_6

    .line 120
    .line 121
    new-instance v5, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    :cond_6
    iget-object v4, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->mWarmUpDelegate:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 137
    .line 138
    invoke-virtual {v4, v0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->setSavingPath(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    invoke-direct {p0, p1}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->dealWithCoolDown(Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;)V

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->mWarmUpDelegate:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 145
    .line 146
    invoke-virtual {v0, p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->prepare(Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;)V

    .line 147
    .line 148
    .line 149
    iget-object v0, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mContext:Landroid/content/Context;

    .line 150
    .line 151
    invoke-static {v0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->hasWarmedUp(Landroid/content/Context;)Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    iget-object v4, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mBacktraceMode:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 156
    .line 157
    if-eq v4, v3, :cond_7

    .line 158
    .line 159
    iget-boolean v5, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mQuickenAlwaysOn:Z

    .line 160
    .line 161
    if-nez v5, :cond_a

    .line 162
    .line 163
    :cond_7
    if-nez v0, :cond_9

    .line 164
    .line 165
    sget-object v5, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;->FpUntilQuickenWarmedUp:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 166
    .line 167
    if-ne v4, v5, :cond_8

    .line 168
    .line 169
    goto :goto_1

    .line 170
    :cond_8
    sget-object v1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;->DwarfUntilQuickenWarmedUp:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 171
    .line 172
    if-ne v4, v1, :cond_9

    .line 173
    .line 174
    sget-object v1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;->Dwarf:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 175
    .line 176
    goto :goto_1

    .line 177
    :cond_9
    move-object v1, v3

    .line 178
    :goto_1
    iget v1, v1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;->value:I

    .line 179
    .line 180
    invoke-static {v1}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktraceNative;->setBacktraceMode(I)V

    .line 181
    .line 182
    .line 183
    :cond_a
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    const-string v3, "Has warmed up: %s"

    .line 192
    .line 193
    invoke-static {v2, v3, v1}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 194
    .line 195
    .line 196
    invoke-static {v0}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktraceNative;->setWarmedUp(Z)V

    .line 197
    .line 198
    .line 199
    invoke-direct {p0}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->startScheduleQutGenerationRequests()V

    .line 200
    .line 201
    .line 202
    iget-boolean v0, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mIsWarmUpProcess:Z

    .line 203
    .line 204
    if-nez v0, :cond_b

    .line 205
    .line 206
    iget-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->mWarmUpDelegate:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 207
    .line 208
    iget-object v1, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mBacktraceMode:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 209
    .line 210
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->registerWarmedUpReceiver(Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;)V

    .line 211
    .line 212
    .line 213
    :cond_b
    const/4 p1, 0x1

    .line 214
    iput-boolean p1, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->mConfigured:Z

    .line 215
    .line 216
    return-void
.end method

.method private dealWithCoolDown(Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;)V
    .locals 4

    .line 1
    iget-boolean p0, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mIsWarmUpProcess:Z

    .line 2
    .line 3
    if-eqz p0, :cond_2

    .line 4
    .line 5
    iget-object p0, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mContext:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->warmUpMarkedFile(Landroid/content/Context;)Ljava/io/File;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-boolean v0, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mCoolDownIfApkUpdated:Z

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    const/16 v0, 0x1000

    .line 22
    .line 23
    invoke-static {p0, v0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->readFileContent(Ljava/io/File;I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/4 v1, 0x1

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    iput-boolean v1, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mCoolDown:Z

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const-string v2, "\n"

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const/4 v2, 0x0

    .line 40
    aget-object v0, v0, v2

    .line 41
    .line 42
    iget-object v3, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mContext:Landroid/content/Context;

    .line 43
    .line 44
    invoke-virtual {v3}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_1

    .line 55
    .line 56
    const-string v0, "Apk updated, remove warmed-up file."

    .line 57
    .line 58
    new-array v2, v2, [Ljava/lang/Object;

    .line 59
    .line 60
    const-string v3, "Matrix.Backtrace"

    .line 61
    .line 62
    invoke-static {v3, v0, v2}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    iput-boolean v1, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mCoolDown:Z

    .line 66
    .line 67
    :cond_1
    :goto_0
    iget-boolean v0, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mCoolDown:Z

    .line 68
    .line 69
    if-eqz v0, :cond_2

    .line 70
    .line 71
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 72
    .line 73
    .line 74
    iget-object p0, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mContext:Landroid/content/Context;

    .line 75
    .line 76
    invoke-static {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->unfinishedFile(Landroid/content/Context;)Ljava/io/File;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 81
    .line 82
    .line 83
    :cond_2
    return-void
.end method

.method public static doStatistic(Ljava/lang/String;)[I
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktraceNative;->statistic(Ljava/lang/String;)[I

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static enableLogger(Z)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktraceNative;->enableLogger(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getBaseODEXPath(Landroid/content/Context;)Ljava/lang/String;
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->is64BitRuntime()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, "arm"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, "arm64"

    .line 11
    .line 12
    :goto_0
    new-instance v1, Ljava/io/File;

    .line 13
    .line 14
    new-instance v2, Ljava/io/File;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    iget-object p0, p0, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    .line 21
    .line 22
    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    new-instance v2, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v3, "/oat/"

    .line 36
    .line 37
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v0, "/base.odex"

    .line 44
    .line 45
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-direct {v1, p0, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0
.end method

.method public static getSystemFrameworkOATPath()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->is64BitRuntime()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, "/system/framework/arm/"

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    const-string v0, "/system/framework/arm64/"

    .line 11
    .line 12
    return-object v0
.end method

.method public static getSystemLibraryPath()Ljava/lang/String;
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1d

    .line 4
    .line 5
    if-lt v0, v1, :cond_1

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->is64BitRuntime()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const-string v0, "/apex/com.android.runtime/lib/"

    .line 14
    .line 15
    return-object v0

    .line 16
    :cond_0
    const-string v0, "/apex/com.android.runtime/lib64/"

    .line 17
    .line 18
    return-object v0

    .line 19
    :cond_1
    invoke-static {}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->is64BitRuntime()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    const-string v0, "/system/lib/"

    .line 26
    .line 27
    return-object v0

    .line 28
    :cond_2
    const-string v0, "/system/lib64/"

    .line 29
    .line 30
    return-object v0
.end method

.method public static hasWarmedUp(Landroid/content/Context;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->hasWarmedUp(Landroid/content/Context;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static instance()Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Singleton;->INSTANCE:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;

    .line 2
    .line 3
    return-object v0
.end method

.method public static is64BitRuntime()Z
    .locals 2

    .line 1
    sget-object v0, Landroid/os/Build;->CPU_ABI:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "arm64-v8a"

    .line 4
    .line 5
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    const-string v1, "x86_64"

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    const-string v1, "mips64"

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v0, 0x0

    .line 29
    return v0

    .line 30
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 31
    return v0
.end method

.method public static loadLibrary()V
    .locals 1

    .line 32
    const-string v0, "wechatbacktrace"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    return-void
.end method

.method public static loadLibrary(Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$LibraryLoader;)V
    .locals 3

    .line 1
    sget-boolean v0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->sLibraryLoaded:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    if-nez p0, :cond_1

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->loadLibrary()V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_1
    const-string v0, "Using custom library loader: %s."

    .line 13
    .line 14
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const-string v2, "Matrix.Backtrace"

    .line 19
    .line 20
    invoke-static {v2, v0, v1}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    const-string v0, "wechatbacktrace"

    .line 24
    .line 25
    invoke-interface {p0, v0}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$LibraryLoader;->load(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :goto_0
    const/4 p0, 0x1

    .line 29
    sput-boolean p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->sLibraryLoaded:Z

    .line 30
    .line 31
    return-void
.end method

.method private requestQutGenerate()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->mInitialized:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->mConfigured:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->mWarmUpDelegate:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->requestConsuming()V

    .line 13
    .line 14
    .line 15
    :cond_1
    :goto_0
    return-void
.end method

.method private runningInIsolateProcess(Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/backtrace/backtrace/ProcessUtil;->getProcessNameByPid(Landroid/content/Context;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const-string p1, ":backtrace__"

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public static setReporter(Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->sReporter:Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter;

    .line 2
    .line 3
    return-void
.end method

.method private startScheduleQutGenerationRequests()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->mScheduleQutGenerationRequestsRunning:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->mScheduleQutGenerationRequestsRunning:Z

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->mHandler:Landroid/os/Handler;

    .line 10
    .line 11
    new-instance v1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$1;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$1;-><init>(Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;)V

    .line 14
    .line 15
    .line 16
    const-wide/32 v2, 0x1499700

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public declared-synchronized configure(Landroid/content/Context;)Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;
    .locals 1

    monitor-enter p0

    .line 217
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->mConfiguration:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;

    if-eqz v0, :cond_0

    .line 218
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->mConfiguration:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    goto :goto_0

    .line 219
    :cond_0
    :try_start_1
    new-instance v0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;

    invoke-direct {v0, p1, p0}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;-><init>(Landroid/content/Context;Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;)V

    iput-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->mConfiguration:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;

    const/4 p1, 0x1

    .line 220
    iput-boolean p1, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->mInitialized:Z

    .line 221
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->mConfiguration:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public getSavingPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->mWarmUpDelegate:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mSavingPath:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public isBacktraceThreadBlocked()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->mWarmUpDelegate:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->isBacktraceThreadBlocked()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
