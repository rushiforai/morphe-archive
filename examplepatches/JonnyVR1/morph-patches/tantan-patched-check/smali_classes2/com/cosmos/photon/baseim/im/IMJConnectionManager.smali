.class public Lcom/cosmos/photon/baseim/im/IMJConnectionManager;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/cosmos/photon/baseim/im/IConnectionManager;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cosmos/photon/baseim/im/IMJConnectionManager$LibraryLoader;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "IMJConnectionManager"

.field private static volatile isSoLoaded:Z

.field private static volatile libraryLoader:Lcom/cosmos/photon/baseim/im/IMJConnectionManager$LibraryLoader;


# instance fields
.field private isStarted:Z

.field private mNativePtr:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 8

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->isStarted:Z

    .line 6
    .line 7
    sget-boolean v1, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->isSoLoaded:Z

    .line 8
    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    sget-object v1, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->libraryLoader:Lcom/cosmos/photon/baseim/im/IMJConnectionManager$LibraryLoader;

    .line 12
    .line 13
    const-string v2, "IMJConnectionManager"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    const-string v4, "cosmos-im"

    .line 17
    .line 18
    const-string v5, "mdlog"

    .line 19
    .line 20
    const-string v6, "coded"

    .line 21
    .line 22
    const-string v7, "c++_shared"

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    :try_start_0
    sget-object v1, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->libraryLoader:Lcom/cosmos/photon/baseim/im/IMJConnectionManager$LibraryLoader;

    .line 27
    .line 28
    invoke-interface {v1, p1, v7}, Lcom/cosmos/photon/baseim/im/IMJConnectionManager$LibraryLoader;->loadLibrary(Landroid/content/Context;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    sget-object v1, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->libraryLoader:Lcom/cosmos/photon/baseim/im/IMJConnectionManager$LibraryLoader;

    .line 32
    .line 33
    invoke-interface {v1, p1, v6}, Lcom/cosmos/photon/baseim/im/IMJConnectionManager$LibraryLoader;->loadLibrary(Landroid/content/Context;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sget-object v1, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->libraryLoader:Lcom/cosmos/photon/baseim/im/IMJConnectionManager$LibraryLoader;

    .line 37
    .line 38
    invoke-interface {v1, p1, v5}, Lcom/cosmos/photon/baseim/im/IMJConnectionManager$LibraryLoader;->loadLibrary(Landroid/content/Context;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    sget-object v1, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->libraryLoader:Lcom/cosmos/photon/baseim/im/IMJConnectionManager$LibraryLoader;

    .line 42
    .line 43
    invoke-interface {v1, p1, v4}, Lcom/cosmos/photon/baseim/im/IMJConnectionManager$LibraryLoader;->loadLibrary(Landroid/content/Context;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    sput-boolean v3, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->isSoLoaded:Z
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catch_0
    move-exception v1

    .line 50
    sput-boolean v0, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->isSoLoaded:Z

    .line 51
    .line 52
    const-string v0, "error 1"

    .line 53
    .line 54
    invoke-static {v2, v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    :try_start_1
    invoke-static {v7}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v6}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v5}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v4}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    sput-boolean v3, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->isSoLoaded:Z
    :try_end_1
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_1 .. :try_end_1} :catch_1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :catch_1
    move-exception v1

    .line 74
    sput-boolean v0, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->isSoLoaded:Z

    .line 75
    .line 76
    const-string v0, "error 2"

    .line 77
    .line 78
    invoke-static {v2, v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 79
    .line 80
    .line 81
    :cond_1
    :goto_0
    invoke-static {p1}, Lcom/cosmos/photon/baseim/im/NetUtil;->init(Landroid/content/Context;)V

    .line 82
    .line 83
    .line 84
    invoke-static {p1}, Lcom/cosmos/photon/baseim/im/AppEvent;->initScreenListener(Landroid/content/Context;)V

    .line 85
    .line 86
    .line 87
    invoke-direct {p0}, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->nativeCreate()J

    .line 88
    .line 89
    .line 90
    move-result-wide v0

    .line 91
    iput-wide v0, p0, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->mNativePtr:J

    .line 92
    .line 93
    return-void
.end method

.method private native nativeCreate()J
.end method

.method private native nativeGetCFlag(J)Ljava/lang/String;
.end method

.method private native nativeNotifySyncMsgSaved(JLjava/lang/String;J)V
.end method

.method private native nativeNotifySyncMsgSavedForMap(JLjava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation
.end method

.method private native nativePost(JLjava/lang/String;)V
.end method

.method private native nativeRegisterActionHandler(JLjava/lang/String;Lcom/cosmos/photon/baseim/im/IMessageHandler;)V
.end method

.method private native nativeRelease(J)V
.end method

.method private native nativeRemoveActionHandler(JLjava/lang/String;)V
.end method

.method private native nativeRemoveAllActionHandler(J)V
.end method

.method private native nativeSend(JLcom/cosmos/photon/baseim/im/SendTask;ILjava/lang/String;)V
.end method

.method private native nativeSetAddressProvider(JLcom/cosmos/photon/baseim/im/IMJConnectionAddressProvider;)V
.end method

.method private native nativeSetAuthInfo(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
.end method

.method private native nativeSetIMJEventListener(JLcom/cosmos/photon/baseim/im/IMJEventListener;)V
.end method

.method private native nativeStartIMJ(J)V
.end method

.method private native nativeStopIMJ(J)V
.end method

.method public static setLibraryLoader(Lcom/cosmos/photon/baseim/im/IMJConnectionManager$LibraryLoader;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->libraryLoader:Lcom/cosmos/photon/baseim/im/IMJConnectionManager$LibraryLoader;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public getCFlag()Ljava/lang/String;
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->mNativePtr:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->nativeGetCFlag(J)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public native nativeSetTrafficReporter(JLcom/cosmos/photon/baseim/im/TrafficReporter;)V
.end method

.method public notifySyncMsgSaved(Ljava/lang/String;J)V
    .locals 7

    .line 19
    iget-boolean v0, p0, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->isStarted:Z

    if-eqz v0, :cond_0

    .line 20
    iget-wide v2, p0, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->mNativePtr:J

    move-object v1, p0

    move-object v4, p1

    move-wide v5, p2

    invoke-direct/range {v1 .. v6}, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->nativeNotifySyncMsgSaved(JLjava/lang/String;J)V

    :cond_0
    return-void
.end method

.method public notifySyncMsgSaved(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->isStarted:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/Map;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->mNativePtr:J

    .line 14
    .line 15
    invoke-direct {p0, v0, v1, p1}, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->nativeNotifySyncMsgSavedForMap(JLjava/util/Map;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public post(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->mNativePtr:J

    .line 9
    .line 10
    invoke-direct {p0, v0, v1, p1}, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->nativePost(JLjava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public registerActionHandler(Ljava/lang/String;Lcom/cosmos/photon/baseim/im/IMessageHandler;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->mNativePtr:J

    .line 6
    .line 7
    invoke-direct {p0, v0, v1, p1, p2}, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->nativeRegisterActionHandler(JLjava/lang/String;Lcom/cosmos/photon/baseim/im/IMessageHandler;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public release()V
    .locals 2

    .line 1
    const-string v0, "IMJConnectionManager"

    .line 2
    .line 3
    const-string v1, "connectionManagerNative release"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->isStarted:Z

    .line 10
    .line 11
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->mNativePtr:J

    .line 12
    .line 13
    invoke-direct {p0, v0, v1}, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->nativeRelease(J)V

    .line 14
    .line 15
    .line 16
    const-wide/16 v0, 0x0

    .line 17
    .line 18
    iput-wide v0, p0, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->mNativePtr:J

    .line 19
    .line 20
    return-void
.end method

.method public removeActionHandler(Ljava/lang/String;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->mNativePtr:J

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, p1}, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->nativeRemoveActionHandler(JLjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public removeAllActionHandler()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->mNativePtr:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->nativeRemoveAllActionHandler(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public send(Lcom/cosmos/photon/baseim/im/SendTask;)V
    .locals 7

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-boolean v0, p0, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->isStarted:Z

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-wide v2, p0, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->mNativePtr:J

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/cosmos/photon/baseim/im/SendTask;->getType()I

    .line 11
    .line 12
    .line 13
    move-result v5

    .line 14
    invoke-virtual {p1}, Lcom/cosmos/photon/baseim/im/SendTask;->getId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v6

    .line 18
    move-object v1, p0

    .line 19
    move-object v4, p1

    .line 20
    invoke-direct/range {v1 .. v6}, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->nativeSend(JLcom/cosmos/photon/baseim/im/SendTask;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    move-object v4, p1

    .line 25
    invoke-interface {v4}, Lcom/cosmos/photon/baseim/im/ITask;->failed()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public setAddressProvider(Lcom/cosmos/photon/baseim/im/IMJConnectionAddressProvider;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->mNativePtr:J

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, p1}, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->nativeSetAddressProvider(JLcom/cosmos/photon/baseim/im/IMJConnectionAddressProvider;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setAuthInfo(Lcom/cosmos/photon/baseim/im/AuthInfo;)V
    .locals 11

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-wide v1, p0, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->mNativePtr:J

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/cosmos/photon/baseim/im/AuthInfo;->getUsername()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v3

    .line 9
    invoke-virtual {p1}, Lcom/cosmos/photon/baseim/im/AuthInfo;->getCflag()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    invoke-virtual {p1}, Lcom/cosmos/photon/baseim/im/AuthInfo;->getUid()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    invoke-virtual {p1}, Lcom/cosmos/photon/baseim/im/AuthInfo;->getToken()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v6

    .line 21
    invoke-virtual {p1}, Lcom/cosmos/photon/baseim/im/AuthInfo;->getAppKey()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v7

    .line 25
    invoke-virtual {p1}, Lcom/cosmos/photon/baseim/im/AuthInfo;->getCt()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v8

    .line 29
    invoke-virtual {p1}, Lcom/cosmos/photon/baseim/im/AuthInfo;->getVersion()I

    .line 30
    .line 31
    .line 32
    move-result v9

    .line 33
    invoke-virtual {p1}, Lcom/cosmos/photon/baseim/im/AuthInfo;->getExtraData()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v10

    .line 37
    move-object v0, p0

    .line 38
    invoke-direct/range {v0 .. v10}, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->nativeSetAuthInfo(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public setIMJEventListener(Lcom/cosmos/photon/baseim/im/IMJEventListener;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->mNativePtr:J

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, p1}, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->nativeSetIMJEventListener(JLcom/cosmos/photon/baseim/im/IMJEventListener;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setTrafficReporter(Lcom/cosmos/photon/baseim/im/TrafficReporter;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->mNativePtr:J

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1, p1}, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->nativeSetTrafficReporter(JLcom/cosmos/photon/baseim/im/TrafficReporter;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public startIMJ()V
    .locals 2

    .line 1
    const-string v0, "IMJConnectionManager"

    .line 2
    .line 3
    const-string v1, "connectionManagerNative startIMJ"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->isStarted:Z

    .line 10
    .line 11
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->mNativePtr:J

    .line 12
    .line 13
    invoke-direct {p0, v0, v1}, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->nativeStartIMJ(J)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public stopIMJ()V
    .locals 2

    .line 1
    const-string v0, "IMJConnectionManager"

    .line 2
    .line 3
    const-string v1, "connectionManagerNative stopIMJ"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->isStarted:Z

    .line 10
    .line 11
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->mNativePtr:J

    .line 12
    .line 13
    invoke-direct {p0, v0, v1}, Lcom/cosmos/photon/baseim/im/IMJConnectionManager;->nativeStopIMJ(J)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
