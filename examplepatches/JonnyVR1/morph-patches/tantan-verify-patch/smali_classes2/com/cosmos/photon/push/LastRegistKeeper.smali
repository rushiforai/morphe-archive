.class public Lcom/cosmos/photon/push/LastRegistKeeper;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/cosmos/photon/push/util/NetUtil$NetChangeReceiver;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cosmos/photon/push/LastRegistKeeper$RegistVendorToken;,
        Lcom/cosmos/photon/push/LastRegistKeeper$RegistSelfToken;,
        Lcom/cosmos/photon/push/LastRegistKeeper$LastRegistKeeperHolder;
    }
.end annotation


# instance fields
.field private lastSelfToken:Lcom/cosmos/photon/push/LastRegistKeeper$RegistSelfToken;

.field private lastVendorToken:Lcom/cosmos/photon/push/LastRegistKeeper$RegistVendorToken;

.field private final mutex:Ljava/lang/Object;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/cosmos/photon/push/LastRegistKeeper;->mutex:Ljava/lang/Object;

    .line 10
    .line 11
    return-void
.end method

.method public synthetic constructor <init>(Lcom/cosmos/photon/push/LastRegistKeeper$1;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Lcom/cosmos/photon/push/LastRegistKeeper;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/cosmos/photon/push/LastRegistKeeper;
    .locals 1

    .line 1
    sget-object v0, Lcom/cosmos/photon/push/LastRegistKeeper$LastRegistKeeperHolder;->lastRegistKeeper:Lcom/cosmos/photon/push/LastRegistKeeper;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public clearRegistSelfRequest()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/push/LastRegistKeeper;->mutex:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    iput-object v1, p0, Lcom/cosmos/photon/push/LastRegistKeeper;->lastSelfToken:Lcom/cosmos/photon/push/LastRegistKeeper$RegistSelfToken;

    .line 6
    .line 7
    monitor-exit v0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p0

    .line 10
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    throw p0
.end method

.method public clearRegistTokenRequest()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/push/LastRegistKeeper;->mutex:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    iput-object v1, p0, Lcom/cosmos/photon/push/LastRegistKeeper;->lastVendorToken:Lcom/cosmos/photon/push/LastRegistKeeper$RegistVendorToken;

    .line 6
    .line 7
    monitor-exit v0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p0

    .line 10
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    throw p0
.end method

.method public init()V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/cosmos/photon/push/util/NetUtil;->registerNetChangeReceiver(Lcom/cosmos/photon/push/util/NetUtil$NetChangeReceiver;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public keepRegistSelfToken(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/push/LastRegistKeeper;->mutex:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/cosmos/photon/push/LastRegistKeeper;->lastSelfToken:Lcom/cosmos/photon/push/LastRegistKeeper$RegistSelfToken;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lcom/cosmos/photon/push/LastRegistKeeper$RegistSelfToken;

    .line 9
    .line 10
    invoke-direct {v1}, Lcom/cosmos/photon/push/LastRegistKeeper$RegistSelfToken;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v1, p0, Lcom/cosmos/photon/push/LastRegistKeeper;->lastSelfToken:Lcom/cosmos/photon/push/LastRegistKeeper$RegistSelfToken;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    iget-object p0, p0, Lcom/cosmos/photon/push/LastRegistKeeper;->lastSelfToken:Lcom/cosmos/photon/push/LastRegistKeeper$RegistSelfToken;

    .line 19
    .line 20
    iput-object p1, p0, Lcom/cosmos/photon/push/LastRegistKeeper$RegistSelfToken;->deviceId:Ljava/lang/String;

    .line 21
    .line 22
    iput-object p2, p0, Lcom/cosmos/photon/push/LastRegistKeeper$RegistSelfToken;->appId:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p3, p0, Lcom/cosmos/photon/push/LastRegistKeeper$RegistSelfToken;->alias:Ljava/lang/String;

    .line 25
    .line 26
    iput-object p4, p0, Lcom/cosmos/photon/push/LastRegistKeeper$RegistSelfToken;->sn:Ljava/lang/String;

    .line 27
    .line 28
    iput-boolean p5, p0, Lcom/cosmos/photon/push/LastRegistKeeper$RegistSelfToken;->tryReferee:Z

    .line 29
    .line 30
    monitor-exit v0

    .line 31
    return-void

    .line 32
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    throw p0
.end method

.method public keepRegistVendorToken(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/push/LastRegistKeeper;->mutex:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/cosmos/photon/push/LastRegistKeeper;->lastVendorToken:Lcom/cosmos/photon/push/LastRegistKeeper$RegistVendorToken;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lcom/cosmos/photon/push/LastRegistKeeper$RegistVendorToken;

    .line 9
    .line 10
    invoke-direct {v1}, Lcom/cosmos/photon/push/LastRegistKeeper$RegistVendorToken;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v1, p0, Lcom/cosmos/photon/push/LastRegistKeeper;->lastVendorToken:Lcom/cosmos/photon/push/LastRegistKeeper$RegistVendorToken;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    iget-object p0, p0, Lcom/cosmos/photon/push/LastRegistKeeper;->lastVendorToken:Lcom/cosmos/photon/push/LastRegistKeeper$RegistVendorToken;

    .line 19
    .line 20
    iput-object p1, p0, Lcom/cosmos/photon/push/LastRegistKeeper$RegistVendorToken;->token:Ljava/lang/String;

    .line 21
    .line 22
    iput-object p2, p0, Lcom/cosmos/photon/push/LastRegistKeeper$RegistVendorToken;->appId:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p3, p0, Lcom/cosmos/photon/push/LastRegistKeeper$RegistVendorToken;->vendorType:Ljava/lang/String;

    .line 25
    .line 26
    iput-object p4, p0, Lcom/cosmos/photon/push/LastRegistKeeper$RegistVendorToken;->vendorToken:Ljava/lang/String;

    .line 27
    .line 28
    monitor-exit v0

    .line 29
    return-void

    .line 30
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0
.end method

.method public onNetworkChanged()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/cosmos/photon/push/util/NetUtil;->isNetworkAvailable()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/cosmos/photon/push/LastRegistKeeper;->mutex:Ljava/lang/Object;

    .line 8
    .line 9
    monitor-enter v0

    .line 10
    :try_start_0
    iget-object v1, p0, Lcom/cosmos/photon/push/LastRegistKeeper;->lastSelfToken:Lcom/cosmos/photon/push/LastRegistKeeper$RegistSelfToken;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/cosmos/photon/push/LastRegistKeeper$RegistSelfToken;->requestRegistSelfToken()V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    :goto_0
    iget-object p0, p0, Lcom/cosmos/photon/push/LastRegistKeeper;->lastVendorToken:Lcom/cosmos/photon/push/LastRegistKeeper$RegistVendorToken;

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/cosmos/photon/push/LastRegistKeeper$RegistVendorToken;->requestVendorToken()V

    .line 25
    .line 26
    .line 27
    :cond_1
    monitor-exit v0

    .line 28
    return-void

    .line 29
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    throw p0

    .line 31
    :cond_2
    return-void
.end method
