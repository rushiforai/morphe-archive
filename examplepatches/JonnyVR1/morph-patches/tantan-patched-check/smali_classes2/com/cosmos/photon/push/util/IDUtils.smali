.class public Lcom/cosmos/photon/push/util/IDUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static filterFile:Ljava/lang/String;

.field private static idFilter:Lcom/cosmos/photon/push/util/BloomFilter;

.field private static idSet:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static declared-synchronized exists(Ljava/lang/String;)Z
    .locals 3

    .line 1
    const-class v0, Lcom/cosmos/photon/push/util/IDUtils;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    monitor-exit v0

    .line 8
    return v1

    .line 9
    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/cosmos/photon/push/util/MD5Utils;->getMD5(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object v2, Lcom/cosmos/photon/push/util/IDUtils;->idSet:Ljava/util/HashSet;

    .line 14
    .line 15
    invoke-virtual {v2, p0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-nez v2, :cond_1

    .line 20
    .line 21
    sget-object v2, Lcom/cosmos/photon/push/util/IDUtils;->idFilter:Lcom/cosmos/photon/push/util/BloomFilter;

    .line 22
    .line 23
    invoke-virtual {v2, p0}, Lcom/cosmos/photon/push/util/BloomFilter;->check(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    :goto_0
    const/4 v1, 0x1

    .line 33
    :cond_2
    monitor-exit v0

    .line 34
    return v1

    .line 35
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    throw p0
.end method

.method public static declared-synchronized init(Ljava/lang/String;)V
    .locals 4

    .line 1
    const-class v0, Lcom/cosmos/photon/push/util/IDUtils;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    new-instance v1, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    sput-object v1, Lcom/cosmos/photon/push/util/IDUtils;->idSet:Ljava/util/HashSet;

    .line 10
    .line 11
    sput-object p0, Lcom/cosmos/photon/push/util/IDUtils;->filterFile:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 12
    .line 13
    :try_start_1
    invoke-static {p0}, Lcom/cosmos/photon/push/util/BloomFilter;->readFilterFromFile(Ljava/lang/String;)Lcom/cosmos/photon/push/util/BloomFilter;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sput-object p0, Lcom/cosmos/photon/push/util/IDUtils;->idFilter:Lcom/cosmos/photon/push/util/BloomFilter;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 22
    .line 23
    .line 24
    :goto_0
    sget-object p0, Lcom/cosmos/photon/push/util/IDUtils;->idFilter:Lcom/cosmos/photon/push/util/BloomFilter;

    .line 25
    .line 26
    if-nez p0, :cond_0

    .line 27
    .line 28
    new-instance p0, Lcom/cosmos/photon/push/util/BloomFilter;

    .line 29
    .line 30
    sget-object v1, Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;->MIDDLE:Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;

    .line 31
    .line 32
    const-wide v2, 0x3fd28f5c28f5c28fL    # 0.29

    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    const v3, 0x186a0

    .line 42
    .line 43
    .line 44
    invoke-direct {p0, v1, v3, v2}, Lcom/cosmos/photon/push/util/BloomFilter;-><init>(Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;ILjava/lang/Double;)V

    .line 45
    .line 46
    .line 47
    sput-object p0, Lcom/cosmos/photon/push/util/IDUtils;->idFilter:Lcom/cosmos/photon/push/util/BloomFilter;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :catchall_1
    move-exception p0

    .line 51
    goto :goto_2

    .line 52
    :cond_0
    :goto_1
    monitor-exit v0

    .line 53
    return-void

    .line 54
    :goto_2
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 55
    throw p0
.end method

.method public static declared-synchronized saveId(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-class v0, Lcom/cosmos/photon/push/util/IDUtils;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-void

    .line 8
    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/cosmos/photon/push/util/MD5Utils;->getMD5(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    sget-object v2, Lcom/cosmos/photon/push/util/IDUtils;->idFilter:Lcom/cosmos/photon/push/util/BloomFilter;

    .line 13
    .line 14
    invoke-virtual {v2, v1}, Lcom/cosmos/photon/push/util/BloomFilter;->add(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object v1, Lcom/cosmos/photon/push/util/IDUtils;->idSet:Ljava/util/HashSet;

    .line 18
    .line 19
    invoke-virtual {v1, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 20
    .line 21
    .line 22
    :try_start_1
    sget-object p0, Lcom/cosmos/photon/push/util/IDUtils;->idFilter:Lcom/cosmos/photon/push/util/BloomFilter;

    .line 23
    .line 24
    sget-object v1, Lcom/cosmos/photon/push/util/IDUtils;->filterFile:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Lcom/cosmos/photon/push/util/BloomFilter;->saveFilterToFile(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 32
    .line 33
    .line 34
    :goto_0
    monitor-exit v0

    .line 35
    return-void

    .line 36
    :catchall_1
    move-exception p0

    .line 37
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 38
    throw p0
.end method
