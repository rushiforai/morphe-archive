.class public abstract Lcom/cosmos/photon/push/referee/Referee;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final APP_ID:Ljava/lang/String; = "8701b0b5e66f551562c78781b1dc88c3"

.field public static final DEFAULT_IM_HOST:Ljava/lang/String; = "paas-push-ap.immomo.com"

.field public static final DEFAULT_IM_PORT:I = 0x1f91

.field private static volatile instance:Lcom/cosmos/photon/push/referee/Referee;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getInstance()Lcom/cosmos/photon/push/referee/Referee;
    .locals 2

    .line 1
    sget-object v0, Lcom/cosmos/photon/push/referee/Referee;->instance:Lcom/cosmos/photon/push/referee/Referee;

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    const-class v0, Lcom/cosmos/photon/push/referee/Referee;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/cosmos/photon/push/referee/Referee;->instance:Lcom/cosmos/photon/push/referee/Referee;

    .line 9
    .line 10
    if-nez v1, :cond_1

    .line 11
    .line 12
    sget-boolean v1, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->mEnableFcmPush:Z

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    new-instance v1, Lcom/cosmos/photon/push/referee/RefereeOversea;

    .line 17
    .line 18
    invoke-direct {v1}, Lcom/cosmos/photon/push/referee/RefereeOversea;-><init>()V

    .line 19
    .line 20
    .line 21
    sput-object v1, Lcom/cosmos/photon/push/referee/Referee;->instance:Lcom/cosmos/photon/push/referee/Referee;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception v1

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    new-instance v1, Lcom/cosmos/photon/push/referee/RefereeInland;

    .line 27
    .line 28
    invoke-direct {v1}, Lcom/cosmos/photon/push/referee/RefereeInland;-><init>()V

    .line 29
    .line 30
    .line 31
    sput-object v1, Lcom/cosmos/photon/push/referee/Referee;->instance:Lcom/cosmos/photon/push/referee/Referee;

    .line 32
    .line 33
    :cond_1
    :goto_0
    monitor-exit v0

    .line 34
    goto :goto_2

    .line 35
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    throw v1

    .line 37
    :cond_2
    :goto_2
    sget-object v0, Lcom/cosmos/photon/push/referee/Referee;->instance:Lcom/cosmos/photon/push/referee/Referee;

    .line 38
    .line 39
    return-object v0
.end method


# virtual methods
.method public declared-synchronized failed(Lcom/cosmos/photon/push/Address;)V
    .locals 0

    monitor-enter p0

    .line 4
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized failed(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    monitor-exit p0

    .line 3
    return-void
.end method

.method public declared-synchronized getImAddress()Lcom/cosmos/photon/push/Address;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Lcom/cosmos/photon/push/Address;

    .line 3
    .line 4
    const-string v1, "paas-push-ap.immomo.com"

    .line 5
    .line 6
    const/16 v2, 0x1f91

    .line 7
    .line 8
    invoke-direct {v0, v1, v2}, Lcom/cosmos/photon/push/Address;-><init>(Ljava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    .line 11
    monitor-exit p0

    .line 12
    return-object v0

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    throw v0
.end method

.method public abstract isSupportDns(Ljava/lang/String;)Z
.end method

.method public declared-synchronized setRedirectAddress(Lcom/cosmos/photon/push/Address;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    monitor-exit p0

    .line 3
    return-void
.end method

.method public declared-synchronized success(Lcom/cosmos/photon/push/Address;)V
    .locals 0

    monitor-enter p0

    .line 4
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized success(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    monitor-exit p0

    .line 3
    return-void
.end method
