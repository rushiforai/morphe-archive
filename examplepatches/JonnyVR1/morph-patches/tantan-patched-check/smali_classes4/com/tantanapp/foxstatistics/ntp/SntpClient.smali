.class public Lcom/tantanapp/foxstatistics/ntp/SntpClient;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/foxstatistics/ntp/SntpClient$InvalidServerReplyException;
    }
.end annotation


# instance fields
.field public a:J

.field public b:J

.field public c:J


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

.method public static a(BBIJ)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/tantanapp/foxstatistics/ntp/SntpClient$InvalidServerReplyException;
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
    new-instance p0, Lcom/tantanapp/foxstatistics/ntp/SntpClient$InvalidServerReplyException;

    .line 12
    .line 13
    new-instance p2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string p3, "untrusted mode: "

    .line 16
    .line 17
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-direct {p0, p1}, Lcom/tantanapp/foxstatistics/ntp/SntpClient$InvalidServerReplyException;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    throw p0

    .line 31
    :cond_1
    :goto_0
    if-eqz p2, :cond_3

    .line 32
    .line 33
    const/16 p0, 0xf

    .line 34
    .line 35
    if-gt p2, p0, :cond_3

    .line 36
    .line 37
    const-wide/16 p0, 0x0

    .line 38
    .line 39
    cmp-long p0, p3, p0

    .line 40
    .line 41
    if-eqz p0, :cond_2

    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    new-instance p0, Lcom/tantanapp/foxstatistics/ntp/SntpClient$InvalidServerReplyException;

    .line 45
    .line 46
    const-string p1, "zero transmitTime"

    .line 47
    .line 48
    invoke-direct {p0, p1}, Lcom/tantanapp/foxstatistics/ntp/SntpClient$InvalidServerReplyException;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    throw p0

    .line 52
    :cond_3
    new-instance p0, Lcom/tantanapp/foxstatistics/ntp/SntpClient$InvalidServerReplyException;

    .line 53
    .line 54
    new-instance p1, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string p3, "untrusted stratum: "

    .line 57
    .line 58
    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-direct {p0, p1}, Lcom/tantanapp/foxstatistics/ntp/SntpClient$InvalidServerReplyException;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    throw p0

    .line 72
    :cond_4
    new-instance p0, Lcom/tantanapp/foxstatistics/ntp/SntpClient$InvalidServerReplyException;

    .line 73
    .line 74
    const-string p1, "unsynchronized server"

    .line 75
    .line 76
    invoke-direct {p0, p1}, Lcom/tantanapp/foxstatistics/ntp/SntpClient$InvalidServerReplyException;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    throw p0
.end method


# virtual methods
.method public b()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/foxstatistics/ntp/SntpClient;->a:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public c()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/foxstatistics/ntp/SntpClient;->b:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public d()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/foxstatistics/ntp/SntpClient;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final e([BI)J
    .locals 6

    .line 1
    aget-byte p0, p1, p2

    .line 2
    .line 3
    add-int/lit8 v0, p2, 0x1

    .line 4
    .line 5
    aget-byte v0, p1, v0

    .line 6
    .line 7
    add-int/lit8 v1, p2, 0x2

    .line 8
    .line 9
    aget-byte v1, p1, v1

    .line 10
    .line 11
    add-int/lit8 p2, p2, 0x3

    .line 12
    .line 13
    aget-byte p1, p1, p2

    .line 14
    .line 15
    and-int/lit16 p2, p0, 0x80

    .line 16
    .line 17
    const/16 v2, 0x80

    .line 18
    .line 19
    if-ne p2, v2, :cond_0

    .line 20
    .line 21
    and-int/lit8 p0, p0, 0x7f

    .line 22
    .line 23
    add-int/2addr p0, v2

    .line 24
    :cond_0
    and-int/lit16 p2, v0, 0x80

    .line 25
    .line 26
    if-ne p2, v2, :cond_1

    .line 27
    .line 28
    and-int/lit8 p2, v0, 0x7f

    .line 29
    .line 30
    add-int/lit16 v0, p2, 0x80

    .line 31
    .line 32
    :cond_1
    and-int/lit16 p2, v1, 0x80

    .line 33
    .line 34
    if-ne p2, v2, :cond_2

    .line 35
    .line 36
    and-int/lit8 p2, v1, 0x7f

    .line 37
    .line 38
    add-int/lit16 v1, p2, 0x80

    .line 39
    .line 40
    :cond_2
    and-int/lit16 p2, p1, 0x80

    .line 41
    .line 42
    if-ne p2, v2, :cond_3

    .line 43
    .line 44
    and-int/lit8 p1, p1, 0x7f

    .line 45
    .line 46
    add-int/2addr p1, v2

    .line 47
    :cond_3
    int-to-long v2, p0

    .line 48
    const/16 p0, 0x18

    .line 49
    .line 50
    shl-long/2addr v2, p0

    .line 51
    int-to-long v4, v0

    .line 52
    const/16 p0, 0x10

    .line 53
    .line 54
    shl-long/2addr v4, p0

    .line 55
    add-long/2addr v2, v4

    .line 56
    int-to-long v0, v1

    .line 57
    const/16 p0, 0x8

    .line 58
    .line 59
    shl-long/2addr v0, p0

    .line 60
    add-long/2addr v2, v0

    .line 61
    int-to-long p0, p1

    .line 62
    add-long/2addr v2, p0

    .line 63
    return-wide v2
.end method

.method public final f([BI)J
    .locals 4

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/foxstatistics/ntp/SntpClient;->e([BI)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    add-int/lit8 p2, p2, 0x4

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/foxstatistics/ntp/SntpClient;->e([BI)J

    .line 8
    .line 9
    .line 10
    move-result-wide p0

    .line 11
    const-wide/16 v2, 0x0

    .line 12
    .line 13
    cmp-long p2, v0, v2

    .line 14
    .line 15
    if-nez p2, :cond_0

    .line 16
    .line 17
    cmp-long p2, p0, v2

    .line 18
    .line 19
    if-nez p2, :cond_0

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

.method public g(Ljava/lang/String;I)Z
    .locals 1

    .line 1
    :try_start_0
    invoke-static {p1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    .line 2
    .line 3
    .line 4
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    const/16 v0, 0x7b

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0, p2}, Lcom/tantanapp/foxstatistics/ntp/SntpClient;->h(Ljava/net/InetAddress;II)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :catch_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public h(Ljava/net/InetAddress;II)Z
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    :try_start_0
    new-instance v3, Ljava/net/DatagramSocket;

    .line 6
    .line 7
    invoke-direct {v3}, Ljava/net/DatagramSocket;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 8
    .line 9
    .line 10
    move/from16 v2, p3

    .line 11
    .line 12
    :try_start_1
    invoke-virtual {v3, v2}, Ljava/net/DatagramSocket;->setSoTimeout(I)V

    .line 13
    .line 14
    .line 15
    const/16 v2, 0x30

    .line 16
    .line 17
    new-array v4, v2, [B

    .line 18
    .line 19
    new-instance v5, Ljava/net/DatagramPacket;

    .line 20
    .line 21
    move-object/from16 v6, p1

    .line 22
    .line 23
    move/from16 v7, p2

    .line 24
    .line 25
    invoke-direct {v5, v4, v2, v6, v7}, Ljava/net/DatagramPacket;-><init>([BILjava/net/InetAddress;I)V

    .line 26
    .line 27
    .line 28
    const/16 v6, 0x1b

    .line 29
    .line 30
    aput-byte v6, v4, v1

    .line 31
    .line 32
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 33
    .line 34
    .line 35
    move-result-wide v6

    .line 36
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 37
    .line 38
    .line 39
    move-result-wide v8

    .line 40
    const/16 v10, 0x28

    .line 41
    .line 42
    invoke-virtual {v0, v4, v10, v6, v7}, Lcom/tantanapp/foxstatistics/ntp/SntpClient;->i([BIJ)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v3, v5}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    .line 46
    .line 47
    .line 48
    new-instance v5, Ljava/net/DatagramPacket;

    .line 49
    .line 50
    invoke-direct {v5, v4, v2}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v3, v5}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V

    .line 54
    .line 55
    .line 56
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 57
    .line 58
    .line 59
    move-result-wide v11

    .line 60
    sub-long v8, v11, v8

    .line 61
    .line 62
    add-long/2addr v6, v8

    .line 63
    aget-byte v2, v4, v1

    .line 64
    .line 65
    shr-int/lit8 v5, v2, 0x6

    .line 66
    .line 67
    and-int/lit8 v5, v5, 0x3

    .line 68
    .line 69
    int-to-byte v5, v5

    .line 70
    and-int/lit8 v2, v2, 0x7

    .line 71
    .line 72
    int-to-byte v2, v2

    .line 73
    const/4 v13, 0x1

    .line 74
    aget-byte v14, v4, v13

    .line 75
    .line 76
    and-int/lit16 v14, v14, 0xff

    .line 77
    .line 78
    const/16 v15, 0x18

    .line 79
    .line 80
    invoke-virtual {v0, v4, v15}, Lcom/tantanapp/foxstatistics/ntp/SntpClient;->f([BI)J

    .line 81
    .line 82
    .line 83
    move-result-wide v15
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 84
    move/from16 v17, v1

    .line 85
    .line 86
    const/16 v1, 0x20

    .line 87
    .line 88
    :try_start_2
    invoke-virtual {v0, v4, v1}, Lcom/tantanapp/foxstatistics/ntp/SntpClient;->f([BI)J

    .line 89
    .line 90
    .line 91
    move-result-wide v18
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 92
    move-object v1, v3

    .line 93
    :try_start_3
    invoke-virtual {v0, v4, v10}, Lcom/tantanapp/foxstatistics/ntp/SntpClient;->f([BI)J

    .line 94
    .line 95
    .line 96
    move-result-wide v3

    .line 97
    invoke-static {v5, v2, v14, v3, v4}, Lcom/tantanapp/foxstatistics/ntp/SntpClient;->a(BBIJ)V

    .line 98
    .line 99
    .line 100
    sub-long v20, v3, v18

    .line 101
    .line 102
    sub-long v8, v8, v20

    .line 103
    .line 104
    sub-long v18, v18, v15

    .line 105
    .line 106
    sub-long/2addr v3, v6

    .line 107
    add-long v18, v18, v3

    .line 108
    .line 109
    const-wide/16 v2, 0x2

    .line 110
    .line 111
    div-long v18, v18, v2

    .line 112
    .line 113
    add-long v6, v6, v18

    .line 114
    .line 115
    iput-wide v6, v0, Lcom/tantanapp/foxstatistics/ntp/SntpClient;->a:J

    .line 116
    .line 117
    iput-wide v11, v0, Lcom/tantanapp/foxstatistics/ntp/SntpClient;->b:J

    .line 118
    .line 119
    iput-wide v8, v0, Lcom/tantanapp/foxstatistics/ntp/SntpClient;->c:J
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 120
    .line 121
    invoke-virtual {v1}, Ljava/net/DatagramSocket;->close()V

    .line 122
    .line 123
    .line 124
    return v13

    .line 125
    :catchall_0
    move-exception v0

    .line 126
    :goto_0
    move-object v2, v1

    .line 127
    goto :goto_3

    .line 128
    :catch_0
    :goto_1
    move-object v2, v1

    .line 129
    goto :goto_4

    .line 130
    :catchall_1
    move-exception v0

    .line 131
    move-object v1, v3

    .line 132
    goto :goto_0

    .line 133
    :catch_1
    :goto_2
    move-object v1, v3

    .line 134
    goto :goto_1

    .line 135
    :catch_2
    move/from16 v17, v1

    .line 136
    .line 137
    goto :goto_2

    .line 138
    :catchall_2
    move-exception v0

    .line 139
    goto :goto_3

    .line 140
    :catch_3
    move/from16 v17, v1

    .line 141
    .line 142
    goto :goto_4

    .line 143
    :goto_3
    if-eqz v2, :cond_0

    .line 144
    .line 145
    invoke-virtual {v2}, Ljava/net/DatagramSocket;->close()V

    .line 146
    .line 147
    .line 148
    :cond_0
    throw v0

    .line 149
    :goto_4
    if-eqz v2, :cond_1

    .line 150
    .line 151
    invoke-virtual {v2}, Ljava/net/DatagramSocket;->close()V

    .line 152
    .line 153
    .line 154
    :cond_1
    return v17
.end method

.method public final i([BIJ)V
    .locals 10

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long p0, p3, v0

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    add-int/lit8 p0, p2, 0x8

    .line 8
    .line 9
    const/4 p3, 0x0

    .line 10
    invoke-static {p1, p2, p0, p3}, Ljava/util/Arrays;->fill([BIIB)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-wide/16 v0, 0x3e8

    .line 15
    .line 16
    div-long v2, p3, v0

    .line 17
    .line 18
    mul-long v4, v2, v0

    .line 19
    .line 20
    sub-long/2addr p3, v4

    .line 21
    const-wide v4, 0x83aa7e80L

    .line 22
    .line 23
    .line 24
    .line 25
    .line 26
    add-long/2addr v2, v4

    .line 27
    add-int/lit8 p0, p2, 0x1

    .line 28
    .line 29
    const/16 v4, 0x18

    .line 30
    .line 31
    shr-long v5, v2, v4

    .line 32
    .line 33
    long-to-int v5, v5

    .line 34
    int-to-byte v5, v5

    .line 35
    aput-byte v5, p1, p2

    .line 36
    .line 37
    add-int/lit8 v5, p2, 0x2

    .line 38
    .line 39
    const/16 v6, 0x10

    .line 40
    .line 41
    shr-long v7, v2, v6

    .line 42
    .line 43
    long-to-int v7, v7

    .line 44
    int-to-byte v7, v7

    .line 45
    aput-byte v7, p1, p0

    .line 46
    .line 47
    add-int/lit8 p0, p2, 0x3

    .line 48
    .line 49
    const/16 v7, 0x8

    .line 50
    .line 51
    shr-long v8, v2, v7

    .line 52
    .line 53
    long-to-int v8, v8

    .line 54
    int-to-byte v8, v8

    .line 55
    aput-byte v8, p1, v5

    .line 56
    .line 57
    add-int/lit8 v5, p2, 0x4

    .line 58
    .line 59
    long-to-int v2, v2

    .line 60
    int-to-byte v2, v2

    .line 61
    aput-byte v2, p1, p0

    .line 62
    .line 63
    const-wide v2, 0x100000000L

    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    mul-long/2addr p3, v2

    .line 69
    div-long/2addr p3, v0

    .line 70
    add-int/lit8 p0, p2, 0x5

    .line 71
    .line 72
    shr-long v0, p3, v4

    .line 73
    .line 74
    long-to-int v0, v0

    .line 75
    int-to-byte v0, v0

    .line 76
    aput-byte v0, p1, v5

    .line 77
    .line 78
    add-int/lit8 v0, p2, 0x6

    .line 79
    .line 80
    shr-long v1, p3, v6

    .line 81
    .line 82
    long-to-int v1, v1

    .line 83
    int-to-byte v1, v1

    .line 84
    aput-byte v1, p1, p0

    .line 85
    .line 86
    add-int/lit8 p2, p2, 0x7

    .line 87
    .line 88
    shr-long/2addr p3, v7

    .line 89
    long-to-int p0, p3

    .line 90
    int-to-byte p0, p0

    .line 91
    aput-byte p0, p1, v0

    .line 92
    .line 93
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 94
    .line 95
    .line 96
    move-result-wide p3

    .line 97
    const-wide v0, 0x406fe00000000000L    # 255.0

    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    mul-double/2addr p3, v0

    .line 103
    double-to-int p0, p3

    .line 104
    int-to-byte p0, p0

    .line 105
    aput-byte p0, p1, p2

    .line 106
    .line 107
    return-void
.end method
