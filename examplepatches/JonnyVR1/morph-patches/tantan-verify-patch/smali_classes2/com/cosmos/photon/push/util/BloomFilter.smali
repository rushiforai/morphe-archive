.class public Lcom/cosmos/photon/push/util/BloomFilter;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x4875cd7b97326290L


# instance fields
.field private final autoClearRate:Ljava/lang/Double;

.field private final notebook:Ljava/util/BitSet;

.field private final rate:Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;

.field private final seeds:[I

.field private final size:I

.field private final useCount:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method public constructor <init>(I)V
    .locals 2

    .line 60
    sget-object v0, Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;->MIDDLE:Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lcom/cosmos/photon/push/util/BloomFilter;-><init>(Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;ILjava/lang/Double;)V

    return-void
.end method

.method public constructor <init>(Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;ILjava/lang/Double;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/cosmos/photon/push/util/BloomFilter;->useCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;->access$000(Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;)[I

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    array-length v0, v0

    .line 17
    mul-int/2addr v0, p2

    .line 18
    int-to-long v0, v0

    .line 19
    const-wide/16 v2, 0x0

    .line 20
    .line 21
    cmp-long p2, v0, v2

    .line 22
    .line 23
    if-ltz p2, :cond_0

    .line 24
    .line 25
    const-wide/32 v2, 0x7fffffff

    .line 26
    .line 27
    .line 28
    cmp-long p2, v0, v2

    .line 29
    .line 30
    if-gtz p2, :cond_0

    .line 31
    .line 32
    iput-object p1, p0, Lcom/cosmos/photon/push/util/BloomFilter;->rate:Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;

    .line 33
    .line 34
    invoke-static {p1}, Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;->access$000(Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;)[I

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Lcom/cosmos/photon/push/util/BloomFilter;->seeds:[I

    .line 39
    .line 40
    long-to-int p1, v0

    .line 41
    iput p1, p0, Lcom/cosmos/photon/push/util/BloomFilter;->size:I

    .line 42
    .line 43
    new-instance p2, Ljava/util/BitSet;

    .line 44
    .line 45
    invoke-direct {p2, p1}, Ljava/util/BitSet;-><init>(I)V

    .line 46
    .line 47
    .line 48
    iput-object p2, p0, Lcom/cosmos/photon/push/util/BloomFilter;->notebook:Ljava/util/BitSet;

    .line 49
    .line 50
    iput-object p3, p0, Lcom/cosmos/photon/push/util/BloomFilter;->autoClearRate:Ljava/lang/Double;

    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    const-string p0, "\u4f4d\u6570\u592a\u5927\u6ea2\u51fa\u4e86\uff0c\u8bf7\u964d\u4f4e\u8bef\u5224\u7387\u6216\u8005\u964d\u4f4e\u6570\u636e\u5927\u5c0f"

    .line 54
    .line 55
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    const/4 p0, 0x0

    .line 59
    throw p0
.end method

.method private checkNeedClear()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/push/util/BloomFilter;->autoClearRate:Ljava/lang/Double;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/cosmos/photon/push/util/BloomFilter;->getUseRate()D

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iget-object v2, p0, Lcom/cosmos/photon/push/util/BloomFilter;->autoClearRate:Ljava/lang/Double;

    .line 10
    .line 11
    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    cmpl-double v0, v0, v2

    .line 16
    .line 17
    if-ltz v0, :cond_1

    .line 18
    .line 19
    monitor-enter p0

    .line 20
    :try_start_0
    invoke-virtual {p0}, Lcom/cosmos/photon/push/util/BloomFilter;->getUseRate()D

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    iget-object v2, p0, Lcom/cosmos/photon/push/util/BloomFilter;->autoClearRate:Ljava/lang/Double;

    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    .line 27
    .line 28
    .line 29
    move-result-wide v2

    .line 30
    cmpl-double v0, v0, v2

    .line 31
    .line 32
    if-ltz v0, :cond_0

    .line 33
    .line 34
    iget-object v0, p0, Lcom/cosmos/photon/push/util/BloomFilter;->notebook:Ljava/util/BitSet;

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/util/BitSet;->clear()V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/cosmos/photon/push/util/BloomFilter;->useCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catchall_0
    move-exception v0

    .line 47
    goto :goto_1

    .line 48
    :cond_0
    :goto_0
    monitor-exit p0

    .line 49
    return-void

    .line 50
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    throw v0

    .line 52
    :cond_1
    return-void
.end method

.method private hash(Ljava/lang/String;I)I
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    array-length v0, p1

    .line 6
    const/4 v1, 0x0

    .line 7
    if-lez v0, :cond_1

    .line 8
    .line 9
    move v0, v1

    .line 10
    :goto_0
    array-length v2, p1

    .line 11
    if-ge v1, v2, :cond_0

    .line 12
    .line 13
    mul-int/2addr v0, v1

    .line 14
    aget-char v2, p1, v1

    .line 15
    .line 16
    add-int/2addr v0, v2

    .line 17
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v1, v0

    .line 21
    :cond_1
    mul-int/2addr v1, p2

    .line 22
    iget p0, p0, Lcom/cosmos/photon/push/util/BloomFilter;->size:I

    .line 23
    .line 24
    rem-int/2addr v1, p0

    .line 25
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0
.end method

.method public static readFilterFromFile(Ljava/lang/String;)Lcom/cosmos/photon/push/util/BloomFilter;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    new-instance v1, Ljava/io/File;

    .line 3
    .line 4
    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_0
    new-instance p0, Ljava/io/ObjectInputStream;

    .line 15
    .line 16
    new-instance v2, Ljava/io/FileInputStream;

    .line 17
    .line 18
    invoke-direct {v2, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0, v2}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 22
    .line 23
    .line 24
    :try_start_1
    invoke-virtual {p0}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/cosmos/photon/push/util/BloomFilter;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    .line 30
    :try_start_2
    invoke-virtual {p0}, Ljava/io/ObjectInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 31
    .line 32
    .line 33
    return-object v0

    .line 34
    :catch_0
    move-exception p0

    .line 35
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 36
    .line 37
    .line 38
    return-object v0

    .line 39
    :catchall_0
    move-exception v0

    .line 40
    goto :goto_1

    .line 41
    :catch_1
    move-exception v0

    .line 42
    goto :goto_0

    .line 43
    :catchall_1
    move-exception p0

    .line 44
    move-object v3, v0

    .line 45
    move-object v0, p0

    .line 46
    move-object p0, v3

    .line 47
    goto :goto_1

    .line 48
    :catch_2
    move-exception p0

    .line 49
    move-object v3, v0

    .line 50
    move-object v0, p0

    .line 51
    move-object p0, v3

    .line 52
    :goto_0
    :try_start_3
    new-instance v1, Ljava/lang/RuntimeException;

    .line 53
    .line 54
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 55
    .line 56
    .line 57
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 58
    :goto_1
    if-eqz p0, :cond_1

    .line 59
    .line 60
    :try_start_4
    invoke-virtual {p0}, Ljava/io/ObjectInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 61
    .line 62
    .line 63
    goto :goto_2

    .line 64
    :catch_3
    move-exception p0

    .line 65
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 66
    .line 67
    .line 68
    :cond_1
    :goto_2
    throw v0
.end method


# virtual methods
.method public add(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/cosmos/photon/push/util/BloomFilter;->checkNeedClear()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    :goto_0
    iget-object v1, p0, Lcom/cosmos/photon/push/util/BloomFilter;->seeds:[I

    .line 6
    .line 7
    array-length v2, v1

    .line 8
    if-ge v0, v2, :cond_0

    .line 9
    .line 10
    aget v1, v1, v0

    .line 11
    .line 12
    invoke-direct {p0, p1, v1}, Lcom/cosmos/photon/push/util/BloomFilter;->hash(Ljava/lang/String;I)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {p0, v1}, Lcom/cosmos/photon/push/util/BloomFilter;->setTrue(I)V

    .line 17
    .line 18
    .line 19
    add-int/lit8 v0, v0, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void
.end method

.method public addIfNotExist(Ljava/lang/String;)Z
    .locals 6

    .line 1
    invoke-direct {p0}, Lcom/cosmos/photon/push/util/BloomFilter;->checkNeedClear()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/cosmos/photon/push/util/BloomFilter;->seeds:[I

    .line 5
    .line 6
    array-length v0, v0

    .line 7
    new-array v0, v0, [I

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    move v3, v2

    .line 12
    :goto_0
    iget-object v4, p0, Lcom/cosmos/photon/push/util/BloomFilter;->seeds:[I

    .line 13
    .line 14
    array-length v5, v4

    .line 15
    if-ge v3, v5, :cond_3

    .line 16
    .line 17
    aget v4, v4, v3

    .line 18
    .line 19
    invoke-direct {p0, p1, v4}, Lcom/cosmos/photon/push/util/BloomFilter;->hash(Ljava/lang/String;I)I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    aput v4, v0, v3

    .line 24
    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    iget-object v5, p0, Lcom/cosmos/photon/push/util/BloomFilter;->notebook:Ljava/util/BitSet;

    .line 28
    .line 29
    invoke-virtual {v5, v4}, Ljava/util/BitSet;->get(I)Z

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    if-nez v4, :cond_2

    .line 34
    .line 35
    move v1, v2

    .line 36
    :goto_1
    if-gt v1, v3, :cond_0

    .line 37
    .line 38
    aget v4, v0, v1

    .line 39
    .line 40
    invoke-virtual {p0, v4}, Lcom/cosmos/photon/push/util/BloomFilter;->setTrue(I)V

    .line 41
    .line 42
    .line 43
    add-int/lit8 v1, v1, 0x1

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_0
    move v1, v2

    .line 47
    goto :goto_2

    .line 48
    :cond_1
    invoke-virtual {p0, v4}, Lcom/cosmos/photon/push/util/BloomFilter;->setTrue(I)V

    .line 49
    .line 50
    .line 51
    :cond_2
    :goto_2
    add-int/lit8 v3, v3, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_3
    return v1
.end method

.method public check(Ljava/lang/String;)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lcom/cosmos/photon/push/util/BloomFilter;->seeds:[I

    .line 4
    .line 5
    array-length v3, v2

    .line 6
    if-ge v1, v3, :cond_1

    .line 7
    .line 8
    aget v2, v2, v1

    .line 9
    .line 10
    invoke-direct {p0, p1, v2}, Lcom/cosmos/photon/push/util/BloomFilter;->hash(Ljava/lang/String;I)I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    iget-object v3, p0, Lcom/cosmos/photon/push/util/BloomFilter;->notebook:Ljava/util/BitSet;

    .line 15
    .line 16
    invoke-virtual {v3, v2}, Ljava/util/BitSet;->get(I)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    return v0

    .line 23
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/4 p0, 0x1

    .line 27
    return p0
.end method

.method public clear()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/push/util/BloomFilter;->useCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/cosmos/photon/push/util/BloomFilter;->notebook:Ljava/util/BitSet;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/util/BitSet;->clear()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public getRate()Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/util/BloomFilter;->rate:Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUseRate()D
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/push/util/BloomFilter;->useCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-double v0, v0

    .line 8
    iget p0, p0, Lcom/cosmos/photon/push/util/BloomFilter;->size:I

    .line 9
    .line 10
    int-to-double v2, p0

    .line 11
    div-double/2addr v0, v2

    .line 12
    return-wide v0
.end method

.method public saveFilterToFile(Ljava/lang/String;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    new-instance v1, Ljava/io/File;

    .line 3
    .line 4
    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    goto :goto_2

    .line 19
    :catch_0
    move-exception p0

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    :goto_0
    new-instance p1, Ljava/io/ObjectOutputStream;

    .line 22
    .line 23
    new-instance v2, Ljava/io/FileOutputStream;

    .line 24
    .line 25
    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 26
    .line 27
    .line 28
    invoke-direct {p1, v2}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    .line 30
    .line 31
    :try_start_1
    invoke-virtual {p1, p0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 32
    .line 33
    .line 34
    :try_start_2
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :catch_1
    move-exception p0

    .line 39
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :catchall_1
    move-exception p0

    .line 44
    move-object v0, p1

    .line 45
    goto :goto_2

    .line 46
    :catch_2
    move-exception p0

    .line 47
    move-object v0, p1

    .line 48
    :goto_1
    :try_start_3
    new-instance p1, Ljava/lang/RuntimeException;

    .line 49
    .line 50
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 51
    .line 52
    .line 53
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 54
    :goto_2
    if-eqz v0, :cond_1

    .line 55
    .line 56
    :try_start_4
    invoke-virtual {v0}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 57
    .line 58
    .line 59
    goto :goto_3

    .line 60
    :catch_3
    move-exception p1

    .line 61
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 62
    .line 63
    .line 64
    :cond_1
    :goto_3
    throw p0
.end method

.method public setTrue(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/push/util/BloomFilter;->useCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/cosmos/photon/push/util/BloomFilter;->notebook:Ljava/util/BitSet;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, p1, v0}, Ljava/util/BitSet;->set(IZ)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
