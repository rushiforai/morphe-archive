.class public Lcom/cosmos/photon/push/referee/RefereeInland;
.super Lcom/cosmos/photon/push/referee/Referee;
.source "SourceFile"


# static fields
.field private static final ALL_PORTS:[I


# instance fields
.field private directAddress:Lcom/cosmos/photon/push/Address;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x6

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/cosmos/photon/push/referee/RefereeInland;->ALL_PORTS:[I

    .line 8
    .line 9
    return-void

    .line 10
    nop

    .line 11
    :array_0
    .array-data 4
        0x1f91
        0x1f92
        0x1f93
        0x1f94
        0x1f95
        0x1f96
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/cosmos/photon/push/referee/Referee;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public declared-synchronized failed(Lcom/cosmos/photon/push/Address;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/cosmos/photon/push/util/NetUtil;->isNetworkAvailable()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    const-string v0, "MoPush-REFEREE"

    .line 13
    .line 14
    const-string v1, "im address failed : %s network unavailable"

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/cosmos/photon/push/Address;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {v0, v1, p1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    .line 27
    monitor-exit p0

    .line 28
    return-void

    .line 29
    :catchall_0
    move-exception p1

    .line 30
    goto :goto_0

    .line 31
    :cond_1
    :try_start_1
    const-string v0, "8701b0b5e66f551562c78781b1dc88c3"

    .line 32
    .line 33
    invoke-static {v0}, Ll/w1c;->b(Ljava/lang/String;)Ll/lsl;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "paas-push-ap.immomo.com"

    .line 38
    .line 39
    iget-object p1, p1, Lcom/cosmos/photon/push/Address;->host:Ljava/lang/String;

    .line 40
    .line 41
    invoke-interface {v0, v1, p1}, Ll/lsl;->f(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    .line 43
    .line 44
    monitor-exit p0

    .line 45
    return-void

    .line 46
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 47
    throw p1
.end method

.method public declared-synchronized failed(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    monitor-enter p0

    .line 48
    :try_start_0
    invoke-static {}, Lcom/cosmos/photon/push/util/NetUtil;->isNetworkAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 49
    const-string v0, "8701b0b5e66f551562c78781b1dc88c3"

    invoke-static {v0}, Ll/w1c;->b(Ljava/lang/String;)Ll/lsl;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ll/lsl;->f(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 50
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized getImAddress()Lcom/cosmos/photon/push/Address;
    .locals 5
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/cosmos/photon/push/referee/RefereeInland;->directAddress:Lcom/cosmos/photon/push/Address;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput-object v1, p0, Lcom/cosmos/photon/push/referee/RefereeInland;->directAddress:Lcom/cosmos/photon/push/Address;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    monitor-exit p0

    .line 10
    return-object v0

    .line 11
    :catchall_0
    move-exception v0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    :try_start_1
    const-string v0, "8701b0b5e66f551562c78781b1dc88c3"

    .line 14
    .line 15
    invoke-static {v0}, Ll/w1c;->b(Ljava/lang/String;)Ll/lsl;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "paas-push-ap.immomo.com"

    .line 20
    .line 21
    invoke-interface {v0, v1}, Ll/lsl;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Lcom/cosmos/photon/push/Address;

    .line 26
    .line 27
    sget-object v2, Lcom/cosmos/photon/push/referee/RefereeInland;->ALL_PORTS:[I

    .line 28
    .line 29
    new-instance v3, Ljava/util/Random;

    .line 30
    .line 31
    invoke-direct {v3}, Ljava/util/Random;-><init>()V

    .line 32
    .line 33
    .line 34
    array-length v4, v2

    .line 35
    invoke-virtual {v3, v4}, Ljava/util/Random;->nextInt(I)I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    aget v2, v2, v3

    .line 40
    .line 41
    invoke-direct {v1, v0, v2}, Lcom/cosmos/photon/push/Address;-><init>(Ljava/lang/String;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    .line 43
    .line 44
    monitor-exit p0

    .line 45
    return-object v1

    .line 46
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 47
    throw v0
.end method

.method public isSupportDns(Ljava/lang/String;)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public declared-synchronized setRedirectAddress(Lcom/cosmos/photon/push/Address;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :cond_0
    :try_start_0
    iput-object p1, p0, Lcom/cosmos/photon/push/referee/RefereeInland;->directAddress:Lcom/cosmos/photon/push/Address;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    monitor-exit p0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p1

    .line 11
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 12
    throw p1
.end method

.method public declared-synchronized success(Lcom/cosmos/photon/push/Address;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :cond_0
    :try_start_0
    const-string v0, "8701b0b5e66f551562c78781b1dc88c3"

    .line 7
    .line 8
    invoke-static {v0}, Ll/w1c;->b(Ljava/lang/String;)Ll/lsl;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "paas-push-ap.immomo.com"

    .line 13
    .line 14
    iget-object p1, p1, Lcom/cosmos/photon/push/Address;->host:Ljava/lang/String;

    .line 15
    .line 16
    invoke-interface {v0, v1, p1}, Ll/lsl;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    monitor-exit p0

    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception p1

    .line 22
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw p1
.end method

.method public declared-synchronized success(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    monitor-enter p0

    .line 24
    :try_start_0
    const-string v0, "8701b0b5e66f551562c78781b1dc88c3"

    invoke-static {v0}, Ll/w1c;->b(Ljava/lang/String;)Ll/lsl;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ll/lsl;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
