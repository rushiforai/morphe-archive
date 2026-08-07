.class public final Ll/ysf0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ysf0$b;,
        Ll/ysf0$d;,
        Ll/ysf0$c;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final a:Ljava/lang/Object;

.field public static final b:Ljava/lang/Object;

.field public static c:Z = false
    .annotation build Landroidx/annotation/GuardedBy;
        value = "valueLock"
    .end annotation
.end field

.field public static d:J = 0x0L
    .annotation build Landroidx/annotation/GuardedBy;
        value = "valueLock"
    .end annotation
.end field

.field public static e:Ljava/lang/String; = "time.android.com"
    .annotation build Landroidx/annotation/GuardedBy;
        value = "valueLock"
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/ysf0;->a:Ljava/lang/Object;

    .line 7
    .line 8
    new-instance v0, Ljava/lang/Object;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/ysf0;->b:Ljava/lang/Object;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic a()Ljava/lang/Object;
    .locals 1

    .line 1
    sget-object v0, Ll/ysf0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic b()Ljava/lang/Object;
    .locals 1

    .line 1
    sget-object v0, Ll/ysf0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic c()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/ysf0;->c:Z

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic d(Z)Z
    .locals 0

    .line 1
    sput-boolean p0, Ll/ysf0;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic e()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/ysf0;->l()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public static synthetic f(J)J
    .locals 0

    .line 1
    sput-wide p0, Ll/ysf0;->d:J

    .line 2
    .line 3
    return-wide p0
.end method

.method public static g(BBIJ)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x3

    .line 2
    if-eq p0, v0, :cond_4

    .line 3
    .line 4
    const/4 p0, 0x4

    .line 5
    if-eq p1, p0, :cond_1

    .line 6
    .line 7
    const/4 p0, 0x5

    .line 8
    if-ne p1, p0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const-string p0, "SNTP: Untrusted mode: "

    .line 12
    .line 13
    invoke-static {p0, p1}, Ll/p3r0;->a(Ljava/lang/String;I)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_1
    :goto_0
    if-eqz p2, :cond_3

    .line 18
    .line 19
    const/16 p0, 0xf

    .line 20
    .line 21
    if-gt p2, p0, :cond_3

    .line 22
    .line 23
    const-wide/16 p0, 0x0

    .line 24
    .line 25
    cmp-long p0, p3, p0

    .line 26
    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    return-void

    .line 30
    :cond_2
    const-string p0, "SNTP: Zero transmitTime"

    .line 31
    .line 32
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_3
    const-string p0, "SNTP: Untrusted stratum: "

    .line 37
    .line 38
    invoke-static {p0, p2}, Ll/p3r0;->a(Ljava/lang/String;I)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_4
    const-string p0, "SNTP: Unsynchronized server"

    .line 43
    .line 44
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public static h()J
    .locals 3

    .line 1
    sget-object v0, Ll/ysf0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Ll/ysf0;->c:Z

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    sget-wide v1, Ll/ysf0;->d:J

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :catchall_0
    move-exception v1

    .line 12
    goto :goto_1

    .line 13
    :cond_0
    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    :goto_0
    monitor-exit v0

    .line 19
    return-wide v1

    .line 20
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    throw v1
.end method

.method public static i()Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Ll/ysf0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Ll/ysf0;->e:Ljava/lang/String;

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-object v1

    .line 8
    :catchall_0
    move-exception v1

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw v1
.end method

.method public static j(Lcom/google/android/exoplayer2/upstream/Loader;Ll/ysf0$b;)V
    .locals 2
    .param p0    # Lcom/google/android/exoplayer2/upstream/Loader;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p1    # Ll/ysf0$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Ll/ysf0;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-interface {p1}, Ll/ysf0$b;->a()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    if-nez p0, :cond_2

    .line 14
    .line 15
    new-instance p0, Lcom/google/android/exoplayer2/upstream/Loader;

    .line 16
    .line 17
    const-string v0, "SntpClient"

    .line 18
    .line 19
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer2/upstream/Loader;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_2
    new-instance v0, Ll/ysf0$d;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-direct {v0, v1}, Ll/ysf0$d;-><init>(Ll/ysf0$a;)V

    .line 26
    .line 27
    .line 28
    new-instance v1, Ll/ysf0$c;

    .line 29
    .line 30
    invoke-direct {v1, p1}, Ll/ysf0$c;-><init>(Ll/ysf0$b;)V

    .line 31
    .line 32
    .line 33
    const/4 p1, 0x1

    .line 34
    invoke-virtual {p0, v0, v1, p1}, Lcom/google/android/exoplayer2/upstream/Loader;->n(Lcom/google/android/exoplayer2/upstream/Loader$e;Lcom/google/android/exoplayer2/upstream/Loader$b;I)J

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static k()Z
    .locals 2

    .line 1
    sget-object v0, Ll/ysf0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Ll/ysf0;->c:Z

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return v1

    .line 8
    :catchall_0
    move-exception v1

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw v1
.end method

.method public static l()J
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/ysf0;->i()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljava/net/DatagramSocket;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/net/DatagramSocket;-><init>()V

    .line 12
    .line 13
    .line 14
    const/16 v2, 0x2710

    .line 15
    .line 16
    :try_start_0
    invoke-virtual {v1, v2}, Ljava/net/DatagramSocket;->setSoTimeout(I)V

    .line 17
    .line 18
    .line 19
    const/16 v2, 0x30

    .line 20
    .line 21
    new-array v3, v2, [B

    .line 22
    .line 23
    new-instance v4, Ljava/net/DatagramPacket;

    .line 24
    .line 25
    const/16 v5, 0x7b

    .line 26
    .line 27
    invoke-direct {v4, v3, v2, v0, v5}, Ljava/net/DatagramPacket;-><init>([BILjava/net/InetAddress;I)V

    .line 28
    .line 29
    .line 30
    const/16 v0, 0x1b

    .line 31
    .line 32
    const/4 v5, 0x0

    .line 33
    aput-byte v0, v3, v5

    .line 34
    .line 35
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 36
    .line 37
    .line 38
    move-result-wide v6

    .line 39
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 40
    .line 41
    .line 42
    move-result-wide v8

    .line 43
    const/16 v0, 0x28

    .line 44
    .line 45
    invoke-static {v3, v0, v6, v7}, Ll/ysf0;->o([BIJ)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, v4}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    .line 49
    .line 50
    .line 51
    new-instance v4, Ljava/net/DatagramPacket;

    .line 52
    .line 53
    invoke-direct {v4, v3, v2}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1, v4}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 60
    .line 61
    .line 62
    move-result-wide v10

    .line 63
    sub-long v8, v10, v8

    .line 64
    .line 65
    add-long/2addr v6, v8

    .line 66
    aget-byte v2, v3, v5

    .line 67
    .line 68
    shr-int/lit8 v4, v2, 0x6

    .line 69
    .line 70
    and-int/lit8 v4, v4, 0x3

    .line 71
    .line 72
    int-to-byte v4, v4

    .line 73
    and-int/lit8 v2, v2, 0x7

    .line 74
    .line 75
    int-to-byte v2, v2

    .line 76
    const/4 v5, 0x1

    .line 77
    aget-byte v5, v3, v5

    .line 78
    .line 79
    and-int/lit16 v5, v5, 0xff

    .line 80
    .line 81
    const/16 v8, 0x18

    .line 82
    .line 83
    invoke-static {v3, v8}, Ll/ysf0;->n([BI)J

    .line 84
    .line 85
    .line 86
    move-result-wide v8

    .line 87
    const/16 v12, 0x20

    .line 88
    .line 89
    invoke-static {v3, v12}, Ll/ysf0;->n([BI)J

    .line 90
    .line 91
    .line 92
    move-result-wide v12

    .line 93
    invoke-static {v3, v0}, Ll/ysf0;->n([BI)J

    .line 94
    .line 95
    .line 96
    move-result-wide v14

    .line 97
    invoke-static {v4, v2, v5, v14, v15}, Ll/ysf0;->g(BBIJ)V

    .line 98
    .line 99
    .line 100
    sub-long/2addr v12, v8

    .line 101
    sub-long/2addr v14, v6

    .line 102
    add-long/2addr v12, v14

    .line 103
    const-wide/16 v2, 0x2

    .line 104
    .line 105
    div-long/2addr v12, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 106
    add-long/2addr v6, v12

    .line 107
    sub-long/2addr v6, v10

    .line 108
    invoke-virtual {v1}, Ljava/net/DatagramSocket;->close()V

    .line 109
    .line 110
    .line 111
    return-wide v6

    .line 112
    :catchall_0
    move-exception v0

    .line 113
    :try_start_1
    invoke-virtual {v1}, Ljava/net/DatagramSocket;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 114
    .line 115
    .line 116
    goto :goto_0

    .line 117
    :catchall_1
    move-exception v1

    .line 118
    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 119
    .line 120
    .line 121
    :goto_0
    throw v0
.end method

.method public static m([BI)J
    .locals 5

    .line 1
    aget-byte v0, p0, p1

    .line 2
    .line 3
    add-int/lit8 v1, p1, 0x1

    .line 4
    .line 5
    aget-byte v1, p0, v1

    .line 6
    .line 7
    add-int/lit8 v2, p1, 0x2

    .line 8
    .line 9
    aget-byte v2, p0, v2

    .line 10
    .line 11
    add-int/lit8 p1, p1, 0x3

    .line 12
    .line 13
    aget-byte p0, p0, p1

    .line 14
    .line 15
    and-int/lit16 p1, v0, 0x80

    .line 16
    .line 17
    const/16 v3, 0x80

    .line 18
    .line 19
    if-ne p1, v3, :cond_0

    .line 20
    .line 21
    and-int/lit8 p1, v0, 0x7f

    .line 22
    .line 23
    add-int/lit16 v0, p1, 0x80

    .line 24
    .line 25
    :cond_0
    and-int/lit16 p1, v1, 0x80

    .line 26
    .line 27
    if-ne p1, v3, :cond_1

    .line 28
    .line 29
    and-int/lit8 p1, v1, 0x7f

    .line 30
    .line 31
    add-int/lit16 v1, p1, 0x80

    .line 32
    .line 33
    :cond_1
    and-int/lit16 p1, v2, 0x80

    .line 34
    .line 35
    if-ne p1, v3, :cond_2

    .line 36
    .line 37
    and-int/lit8 p1, v2, 0x7f

    .line 38
    .line 39
    add-int/lit16 v2, p1, 0x80

    .line 40
    .line 41
    :cond_2
    and-int/lit16 p1, p0, 0x80

    .line 42
    .line 43
    if-ne p1, v3, :cond_3

    .line 44
    .line 45
    and-int/lit8 p0, p0, 0x7f

    .line 46
    .line 47
    add-int/2addr p0, v3

    .line 48
    :cond_3
    int-to-long v3, v0

    .line 49
    const/16 p1, 0x18

    .line 50
    .line 51
    shl-long/2addr v3, p1

    .line 52
    int-to-long v0, v1

    .line 53
    const/16 p1, 0x10

    .line 54
    .line 55
    shl-long/2addr v0, p1

    .line 56
    add-long/2addr v3, v0

    .line 57
    int-to-long v0, v2

    .line 58
    const/16 p1, 0x8

    .line 59
    .line 60
    shl-long/2addr v0, p1

    .line 61
    add-long/2addr v3, v0

    .line 62
    int-to-long p0, p0

    .line 63
    add-long/2addr v3, p0

    .line 64
    return-wide v3
.end method

.method public static n([BI)J
    .locals 5

    .line 1
    invoke-static {p0, p1}, Ll/ysf0;->m([BI)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    add-int/lit8 p1, p1, 0x4

    .line 6
    .line 7
    invoke-static {p0, p1}, Ll/ysf0;->m([BI)J

    .line 8
    .line 9
    .line 10
    move-result-wide p0

    .line 11
    const-wide/16 v2, 0x0

    .line 12
    .line 13
    cmp-long v4, v0, v2

    .line 14
    .line 15
    if-nez v4, :cond_0

    .line 16
    .line 17
    cmp-long v4, p0, v2

    .line 18
    .line 19
    if-nez v4, :cond_0

    .line 20
    .line 21
    return-wide v2

    .line 22
    :cond_0
    const-wide v2, 0x83aa7e80L

    .line 23
    .line 24
    .line 25
    .line 26
    .line 27
    sub-long/2addr v0, v2

    .line 28
    const-wide/16 v2, 0x3e8

    .line 29
    .line 30
    mul-long/2addr v0, v2

    .line 31
    mul-long/2addr p0, v2

    .line 32
    const-wide v2, 0x100000000L

    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    div-long/2addr p0, v2

    .line 38
    add-long/2addr v0, p0

    .line 39
    return-wide v0
.end method

.method public static o([BIJ)V
    .locals 11

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p2, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    add-int/lit8 p2, p1, 0x8

    .line 8
    .line 9
    const/4 p3, 0x0

    .line 10
    invoke-static {p0, p1, p2, p3}, Ljava/util/Arrays;->fill([BIIB)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-wide/16 v0, 0x3e8

    .line 15
    .line 16
    div-long v2, p2, v0

    .line 17
    .line 18
    mul-long v4, v2, v0

    .line 19
    .line 20
    sub-long/2addr p2, v4

    .line 21
    const-wide v4, 0x83aa7e80L

    .line 22
    .line 23
    .line 24
    .line 25
    .line 26
    add-long/2addr v2, v4

    .line 27
    add-int/lit8 v4, p1, 0x1

    .line 28
    .line 29
    const/16 v5, 0x18

    .line 30
    .line 31
    shr-long v6, v2, v5

    .line 32
    .line 33
    long-to-int v6, v6

    .line 34
    int-to-byte v6, v6

    .line 35
    aput-byte v6, p0, p1

    .line 36
    .line 37
    add-int/lit8 v6, p1, 0x2

    .line 38
    .line 39
    const/16 v7, 0x10

    .line 40
    .line 41
    shr-long v8, v2, v7

    .line 42
    .line 43
    long-to-int v8, v8

    .line 44
    int-to-byte v8, v8

    .line 45
    aput-byte v8, p0, v4

    .line 46
    .line 47
    add-int/lit8 v4, p1, 0x3

    .line 48
    .line 49
    const/16 v8, 0x8

    .line 50
    .line 51
    shr-long v9, v2, v8

    .line 52
    .line 53
    long-to-int v9, v9

    .line 54
    int-to-byte v9, v9

    .line 55
    aput-byte v9, p0, v6

    .line 56
    .line 57
    add-int/lit8 v6, p1, 0x4

    .line 58
    .line 59
    long-to-int v2, v2

    .line 60
    int-to-byte v2, v2

    .line 61
    aput-byte v2, p0, v4

    .line 62
    .line 63
    const-wide v2, 0x100000000L

    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    mul-long/2addr p2, v2

    .line 69
    div-long/2addr p2, v0

    .line 70
    add-int/lit8 v0, p1, 0x5

    .line 71
    .line 72
    shr-long v1, p2, v5

    .line 73
    .line 74
    long-to-int v1, v1

    .line 75
    int-to-byte v1, v1

    .line 76
    aput-byte v1, p0, v6

    .line 77
    .line 78
    add-int/lit8 v1, p1, 0x6

    .line 79
    .line 80
    shr-long v2, p2, v7

    .line 81
    .line 82
    long-to-int v2, v2

    .line 83
    int-to-byte v2, v2

    .line 84
    aput-byte v2, p0, v0

    .line 85
    .line 86
    add-int/lit8 p1, p1, 0x7

    .line 87
    .line 88
    shr-long/2addr p2, v8

    .line 89
    long-to-int p2, p2

    .line 90
    int-to-byte p2, p2

    .line 91
    aput-byte p2, p0, v1

    .line 92
    .line 93
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 94
    .line 95
    .line 96
    move-result-wide p2

    .line 97
    const-wide v0, 0x406fe00000000000L    # 255.0

    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    mul-double/2addr p2, v0

    .line 103
    double-to-int p2, p2

    .line 104
    int-to-byte p2, p2

    .line 105
    aput-byte p2, p0, p1

    .line 106
    .line 107
    return-void
.end method
