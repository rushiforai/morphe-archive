.class public Ll/msx;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a()Ljava/lang/String;
    .locals 8

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :try_start_0
    new-instance v2, Landroid/media/MediaDrm;

    .line 8
    .line 9
    new-instance v3, Ljava/util/UUID;

    .line 10
    .line 11
    const-wide v4, -0x121074568629b532L    # -3.563403477674908E221

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    const-wide v6, -0x5c37d8232ae2de13L

    .line 17
    .line 18
    .line 19
    .line 20
    .line 21
    invoke-direct {v3, v4, v5, v6, v7}, Ljava/util/UUID;-><init>(JJ)V

    .line 22
    .line 23
    .line 24
    invoke-direct {v2, v3}, Landroid/media/MediaDrm;-><init>(Ljava/util/UUID;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 25
    .line 26
    .line 27
    const/16 v1, 0xe

    .line 28
    .line 29
    :try_start_1
    new-array v1, v1, [B

    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    const/16 v4, 0x54

    .line 33
    .line 34
    aput-byte v4, v1, v3

    .line 35
    .line 36
    const/4 v3, 0x1

    .line 37
    const/4 v4, 0x3

    .line 38
    aput-byte v4, v1, v3

    .line 39
    .line 40
    const/16 v3, 0x47

    .line 41
    .line 42
    const/4 v5, 0x2

    .line 43
    aput-byte v3, v1, v5

    .line 44
    .line 45
    const/16 v3, 0x5e

    .line 46
    .line 47
    aput-byte v3, v1, v4

    .line 48
    .line 49
    const/4 v3, 0x4

    .line 50
    aput-byte v5, v1, v3

    .line 51
    .line 52
    const/4 v3, 0x5

    .line 53
    aput-byte v4, v1, v3

    .line 54
    .line 55
    const/4 v3, 0x6

    .line 56
    const/16 v6, 0x65

    .line 57
    .line 58
    aput-byte v6, v1, v3

    .line 59
    .line 60
    const/4 v3, 0x7

    .line 61
    const/16 v6, 0x8

    .line 62
    .line 63
    aput-byte v6, v1, v3

    .line 64
    .line 65
    const/16 v3, 0x58

    .line 66
    .line 67
    aput-byte v3, v1, v6

    .line 68
    .line 69
    const/16 v3, 0x9

    .line 70
    .line 71
    const/16 v6, 0x46

    .line 72
    .line 73
    aput-byte v6, v1, v3

    .line 74
    .line 75
    const/16 v3, 0xa

    .line 76
    .line 77
    const/16 v6, 0x14

    .line 78
    .line 79
    aput-byte v6, v1, v3

    .line 80
    .line 81
    const/16 v3, 0xb

    .line 82
    .line 83
    aput-byte v4, v1, v3

    .line 84
    .line 85
    const/16 v3, 0xc

    .line 86
    .line 87
    const/16 v4, 0x79

    .line 88
    .line 89
    aput-byte v4, v1, v3

    .line 90
    .line 91
    const/16 v3, 0xd

    .line 92
    .line 93
    aput-byte v5, v1, v3

    .line 94
    .line 95
    invoke-static {v1}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v2, v1}, Landroid/media/MediaDrm;->getPropertyByteArray(Ljava/lang/String;)[B

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    if-eqz v1, :cond_0

    .line 104
    .line 105
    invoke-static {v1}, Ll/zhw;->b([B)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 110
    .line 111
    .line 112
    goto :goto_0

    .line 113
    :catchall_0
    move-exception v0

    .line 114
    move-object v1, v2

    .line 115
    goto :goto_1

    .line 116
    :catch_0
    move-object v1, v2

    .line 117
    goto :goto_2

    .line 118
    :cond_0
    :goto_0
    invoke-virtual {v2}, Landroid/media/MediaDrm;->release()V

    .line 119
    .line 120
    .line 121
    goto :goto_3

    .line 122
    :catchall_1
    move-exception v0

    .line 123
    :goto_1
    if-eqz v1, :cond_1

    .line 124
    .line 125
    invoke-virtual {v1}, Landroid/media/MediaDrm;->release()V

    .line 126
    .line 127
    .line 128
    :cond_1
    throw v0

    .line 129
    :catch_1
    :goto_2
    if-eqz v1, :cond_2

    .line 130
    .line 131
    invoke-virtual {v1}, Landroid/media/MediaDrm;->release()V

    .line 132
    .line 133
    .line 134
    :cond_2
    :goto_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    return-object v0
.end method

.method public static b()Ljava/lang/String;
    .locals 6

    .line 1
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/lsx;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/lsx;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/4 v2, 0x1

    .line 15
    :try_start_0
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 16
    .line 17
    const-wide/16 v4, 0x3e8

    .line 18
    .line 19
    invoke-interface {v1, v4, v5, v3}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    check-cast v3, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    .line 25
    :goto_0
    invoke-interface {v1, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 26
    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 29
    .line 30
    .line 31
    return-object v3

    .line 32
    :catchall_0
    move-exception v3

    .line 33
    goto :goto_1

    .line 34
    :catch_0
    :try_start_1
    const-string v3, ""
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :goto_1
    invoke-interface {v1, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 38
    .line 39
    .line 40
    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 41
    .line 42
    .line 43
    throw v3
.end method
