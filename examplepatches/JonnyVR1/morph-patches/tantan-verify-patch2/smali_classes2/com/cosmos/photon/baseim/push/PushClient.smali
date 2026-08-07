.class public Lcom/cosmos/photon/baseim/push/PushClient;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private nativePtr:J


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    const-string v0, "cosmos-im"

    .line 2
    .line 3
    const-string v1, "protobuf"

    .line 4
    .line 5
    const-string v2, "mdlog"

    .line 6
    .line 7
    const-string v3, "coded"

    .line 8
    .line 9
    const-string v4, "c++_shared"

    .line 10
    .line 11
    :try_start_0
    invoke-static {v4}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v3}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :catch_0
    move-exception v5

    .line 28
    invoke-virtual {v5}, Ljava/lang/Throwable;->printStackTrace()V

    .line 29
    .line 30
    .line 31
    sget-object v5, Lcom/cosmos/photon/baseim/push/PushContextHolder;->sContext:Landroid/content/Context;

    .line 32
    .line 33
    if-eqz v5, :cond_0

    .line 34
    .line 35
    invoke-static {v5, v4}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    sget-object v4, Lcom/cosmos/photon/baseim/push/PushContextHolder;->sContext:Landroid/content/Context;

    .line 39
    .line 40
    invoke-static {v4, v3}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    sget-object v3, Lcom/cosmos/photon/baseim/push/PushContextHolder;->sContext:Landroid/content/Context;

    .line 44
    .line 45
    invoke-static {v3, v2}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    sget-object v2, Lcom/cosmos/photon/baseim/push/PushContextHolder;->sContext:Landroid/content/Context;

    .line 49
    .line 50
    invoke-static {v2, v1}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    sget-object v1, Lcom/cosmos/photon/baseim/push/PushContextHolder;->sContext:Landroid/content/Context;

    .line 54
    .line 55
    invoke-static {v1, v0}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/cosmos/photon/baseim/push/PushClient;->nativeCreate()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iput-wide v0, p0, Lcom/cosmos/photon/baseim/push/PushClient;->nativePtr:J

    .line 9
    .line 10
    return-void
.end method

.method private native nativeAddPshLtBlackList(JLjava/lang/String;)V
.end method

.method private native nativeAuth(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
.end method

.method private native nativeConnect(JLjava/lang/String;I)V
.end method

.method private native nativeCreate()J
.end method

.method private native nativeDisconnect(J)V
.end method

.method private native nativeNotifyMessageSaved(JLjava/lang/String;J)V
.end method

.method private native nativeRegisterPacketReceiver(JILcom/cosmos/photon/baseim/push/PacketReceiver;)V
.end method

.method private native nativeRelease(J)V
.end method

.method private native nativeRemoveAllPacketReceiver(J)V
.end method

.method private native nativeRemovePacketReceiver(JI)V
.end method

.method private native nativeRemovePshLtBlackList(JLjava/lang/String;)V
.end method

.method private native nativeSendProbePacket(J)V
.end method

.method private native nativeSendSyncRequest(JLjava/lang/String;)V
.end method

.method private native nativeSetConnectStateChangeListener(JLcom/cosmos/photon/baseim/push/ConnectStateChangeListener;)V
.end method

.method private native nativeStartKeepAlive(J)V
.end method

.method private native nativeStartSync(J)V
.end method

.method private native nativeStopKeepAlive(J)V
.end method

.method private native nativeStopSync(J)V
.end method


# virtual methods
.method public addPshLtBlackList(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/push/PushClient;->nativePtr:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1, p1}, Lcom/cosmos/photon/baseim/push/PushClient;->nativeAddPshLtBlackList(JLjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public auth(Lcom/cosmos/photon/baseim/push/PushAuthInfo;)V
    .locals 8

    .line 1
    iget-wide v1, p0, Lcom/cosmos/photon/baseim/push/PushClient;->nativePtr:J

    .line 2
    .line 3
    iget-object v3, p1, Lcom/cosmos/photon/baseim/push/PushAuthInfo;->appId:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v4, p1, Lcom/cosmos/photon/baseim/push/PushAuthInfo;->token:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v5, p1, Lcom/cosmos/photon/baseim/push/PushAuthInfo;->deviceId:Ljava/lang/String;

    .line 8
    .line 9
    iget v6, p1, Lcom/cosmos/photon/baseim/push/PushAuthInfo;->version:I

    .line 10
    .line 11
    iget-object v7, p1, Lcom/cosmos/photon/baseim/push/PushAuthInfo;->clientType:Ljava/lang/String;

    .line 12
    .line 13
    move-object v0, p0

    .line 14
    invoke-direct/range {v0 .. v7}, Lcom/cosmos/photon/baseim/push/PushClient;->nativeAuth(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public connect(Ljava/lang/String;I)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/push/PushClient;->nativePtr:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1, p1, p2}, Lcom/cosmos/photon/baseim/push/PushClient;->nativeConnect(JLjava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public disconnect()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/push/PushClient;->nativePtr:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/cosmos/photon/baseim/push/PushClient;->nativeDisconnect(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public notifyMessageSaved(Ljava/lang/String;J)V
    .locals 6

    .line 1
    iget-wide v1, p0, Lcom/cosmos/photon/baseim/push/PushClient;->nativePtr:J

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v3, p1

    .line 5
    move-wide v4, p2

    .line 6
    invoke-direct/range {v0 .. v5}, Lcom/cosmos/photon/baseim/push/PushClient;->nativeNotifyMessageSaved(JLjava/lang/String;J)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public registerPacketReceiver(ILcom/cosmos/photon/baseim/push/PacketReceiver;)V
    .locals 2

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/push/PushClient;->nativePtr:J

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, p1, p2}, Lcom/cosmos/photon/baseim/push/PushClient;->nativeRegisterPacketReceiver(JILcom/cosmos/photon/baseim/push/PacketReceiver;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public release()V
    .locals 5

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/push/PushClient;->nativePtr:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-eqz v4, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, v0, v1}, Lcom/cosmos/photon/baseim/push/PushClient;->nativeRelease(J)V

    .line 10
    .line 11
    .line 12
    iput-wide v2, p0, Lcom/cosmos/photon/baseim/push/PushClient;->nativePtr:J

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public removeAllPacketReceiver()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/push/PushClient;->nativePtr:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/cosmos/photon/baseim/push/PushClient;->nativeRemoveAllPacketReceiver(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public removePacketReceiver(I)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/push/PushClient;->nativePtr:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1, p1}, Lcom/cosmos/photon/baseim/push/PushClient;->nativeRemovePacketReceiver(JI)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public removePshLtBlackList(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/push/PushClient;->nativePtr:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1, p1}, Lcom/cosmos/photon/baseim/push/PushClient;->nativeRemovePshLtBlackList(JLjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public sendProbePacket()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/push/PushClient;->nativePtr:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/cosmos/photon/baseim/push/PushClient;->nativeSendProbePacket(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public sendSyncRequest(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/push/PushClient;->nativePtr:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1, p1}, Lcom/cosmos/photon/baseim/push/PushClient;->nativeSendSyncRequest(JLjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setConnectStateChangeListener(Lcom/cosmos/photon/baseim/push/ConnectStateChangeListener;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/push/PushClient;->nativePtr:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1, p1}, Lcom/cosmos/photon/baseim/push/PushClient;->nativeSetConnectStateChangeListener(JLcom/cosmos/photon/baseim/push/ConnectStateChangeListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public startKeepAlive()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/push/PushClient;->nativePtr:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/cosmos/photon/baseim/push/PushClient;->nativeStartKeepAlive(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public startSync()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/push/PushClient;->nativePtr:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/cosmos/photon/baseim/push/PushClient;->nativeStartSync(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public stopKeepAlive()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/push/PushClient;->nativePtr:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/cosmos/photon/baseim/push/PushClient;->nativeStopKeepAlive(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public stopSync()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/push/PushClient;->nativePtr:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/cosmos/photon/baseim/push/PushClient;->nativeStopSync(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
