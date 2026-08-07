.class public Lcom/immomo/momosec/network/a;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static volatile e:Ll/rg50;

.field private static volatile f:Ll/rg50;


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:Ljava/lang/String;

.field private final c:J

.field private d:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/immomo/momosec/network/a;->d:I

    .line 6
    .line 7
    iput-object p1, p0, Lcom/immomo/momosec/network/a;->a:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p2, p0, Lcom/immomo/momosec/network/a;->b:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide p1

    .line 15
    iput-wide p1, p0, Lcom/immomo/momosec/network/a;->c:J

    .line 16
    .line 17
    return-void
.end method

.method private a()J
    .locals 4

    .line 1
    iget p0, p0, Lcom/immomo/momosec/network/a;->d:I

    .line 2
    .line 3
    int-to-double v0, p0

    .line 4
    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    .line 5
    .line 6
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->pow(DD)D

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    double-to-long v0, v0

    .line 11
    const-wide/16 v2, 0x3e8

    .line 12
    .line 13
    mul-long/2addr v0, v2

    .line 14
    return-wide v0
.end method

.method private static b()Ll/rg50$b;
    .locals 4

    .line 1
    new-instance v0, Ll/rg50$b;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/rg50$b;-><init>()V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0xf

    .line 7
    .line 8
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2, v3}, Ll/rg50$b;->f(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, v1, v2, v3}, Ll/rg50$b;->u(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Lokhttp3/Protocol;->HTTP_1_1:Lokhttp3/Protocol;

    .line 19
    .line 20
    sget-object v2, Lokhttp3/Protocol;->HTTP_2:Lokhttp3/Protocol;

    .line 21
    .line 22
    filled-new-array {v1, v2}, [Lokhttp3/Protocol;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Ll/rg50$b;->r(Ljava/util/List;)Ll/rg50$b;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sget-object v1, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ll/rg50$b;->s(Ljava/net/Proxy;)Ll/rg50$b;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    return-object v0
.end method

.method private c(Ljava/lang/Exception;)Lcom/immomo/momosec/network/HttpBaseException;
    .locals 4

    .line 1
    new-instance v0, Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/momosec/network/HttpBaseException$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;->NETWORK:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/immomo/momosec/network/HttpBaseException$a;->l(Lcom/immomo/momosec/network/HttpBaseException$ErrorType;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/16 v1, 0x2c

    .line 13
    .line 14
    new-array v1, v1, [B

    .line 15
    .line 16
    fill-array-data v1, :array_0

    .line 17
    .line 18
    .line 19
    invoke-static {v1}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lcom/immomo/momosec/network/HttpBaseException$a;->m(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0, p1}, Lcom/immomo/momosec/network/HttpBaseException$a;->k(Ljava/lang/Throwable;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget-object v0, p0, Lcom/immomo/momosec/network/a;->a:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Lcom/immomo/momosec/network/HttpBaseException$a;->s(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget-object v0, p0, Lcom/immomo/momosec/network/a;->b:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Lcom/immomo/momosec/network/HttpBaseException$a;->o(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget v0, p0, Lcom/immomo/momosec/network/a;->d:I

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Lcom/immomo/momosec/network/HttpBaseException$a;->p(I)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 50
    .line 51
    .line 52
    move-result-wide v0

    .line 53
    iget-wide v2, p0, Lcom/immomo/momosec/network/a;->c:J

    .line 54
    .line 55
    sub-long/2addr v0, v2

    .line 56
    invoke-virtual {p1, v0, v1}, Lcom/immomo/momosec/network/HttpBaseException$a;->r(J)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Lcom/immomo/momosec/network/HttpBaseException$a;->j()Lcom/immomo/momosec/network/HttpBaseException;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0

    .line 65
    :array_0
    .array-data 1
        0x62t
        0x3t
        0x40t
        0x42t
        0x4t
        0x15t
        0x44t
        0x46t
        0x57t
        0x56t
        0x8t
        0xat
        0x55t
        0x2t
        0x11t
        0x53t
        0x14t
        0x3t
        0x10t
        0x12t
        0x5et
        0x17t
        0x15t
        0xft
        0x5dt
        0x3t
        0x5et
        0x42t
        0x15t
        0x46t
        0x5ft
        0x14t
        0x11t
        0x5at
        0x0t
        0x1et
        0x10t
        0x14t
        0x54t
        0x43t
        0x13t
        0xft
        0x55t
        0x15t
    .end array-data
.end method

.method private d(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/immomo/momosec/network/HttpBaseException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    :goto_0
    const/4 v2, 0x2

    .line 4
    if-ge v1, v2, :cond_1

    .line 5
    .line 6
    :try_start_0
    new-instance v2, Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 9
    .line 10
    .line 11
    move-result-object v3

    .line 12
    const/16 v4, 0x67

    .line 13
    .line 14
    invoke-static {v3, v4}, Lcom/immomo/momosec/Coded;->doCommand([BI)[B

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-direct {v2, v3}, Ljava/lang/String;-><init>([B)V

    .line 19
    .line 20
    .line 21
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    if-nez v3, :cond_0

    .line 26
    .line 27
    return-object v2

    .line 28
    :catchall_0
    move-exception v0

    .line 29
    new-instance v2, Ljava/lang/Exception;

    .line 30
    .line 31
    invoke-direct {v2, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    move-object v0, v2

    .line 35
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    new-instance v1, Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 39
    .line 40
    invoke-direct {v1}, Lcom/immomo/momosec/network/HttpBaseException$a;-><init>()V

    .line 41
    .line 42
    .line 43
    sget-object v2, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;->DECRYPTION:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Lcom/immomo/momosec/network/HttpBaseException$a;->l(Lcom/immomo/momosec/network/HttpBaseException$ErrorType;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    const/16 v2, 0x1f

    .line 50
    .line 51
    new-array v2, v2, [B

    .line 52
    .line 53
    fill-array-data v2, :array_0

    .line 54
    .line 55
    .line 56
    invoke-static {v2}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v1, v2}, Lcom/immomo/momosec/network/HttpBaseException$a;->m(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v1, v0}, Lcom/immomo/momosec/network/HttpBaseException$a;->k(Ljava/lang/Throwable;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-object v1, p0, Lcom/immomo/momosec/network/a;->a:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Lcom/immomo/momosec/network/HttpBaseException$a;->s(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget-object v1, p0, Lcom/immomo/momosec/network/a;->b:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Lcom/immomo/momosec/network/HttpBaseException$a;->o(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget v1, p0, Lcom/immomo/momosec/network/a;->d:I

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Lcom/immomo/momosec/network/HttpBaseException$a;->p(I)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 87
    .line 88
    .line 89
    move-result-wide v1

    .line 90
    iget-wide v3, p0, Lcom/immomo/momosec/network/a;->c:J

    .line 91
    .line 92
    sub-long/2addr v1, v3

    .line 93
    invoke-virtual {v0, v1, v2}, Lcom/immomo/momosec/network/HttpBaseException$a;->r(J)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {p0, p1}, Lcom/immomo/momosec/network/HttpBaseException$a;->n(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p0}, Lcom/immomo/momosec/network/HttpBaseException$a;->j()Lcom/immomo/momosec/network/HttpBaseException;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    throw p0

    .line 106
    nop

    .line 107
    :array_0
    .array-data 1
        0x74t
        0x3t
        0x52t
        0x45t
        0x18t
        0x16t
        0x44t
        0xft
        0x5et
        0x59t
        0x41t
        0x0t
        0x51t
        0xft
        0x5dt
        0x52t
        0x5t
        0x46t
        0x51t
        0x0t
        0x45t
        0x52t
        0x13t
        0x46t
        0x42t
        0x3t
        0x45t
        0x45t
        0x8t
        0x3t
        0x43t
    .end array-data
.end method

.method private f(Z)Ll/i5d0;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/l1j$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/l1j$a;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x4

    .line 7
    new-array v1, v1, [B

    .line 8
    .line 9
    fill-array-data v1, :array_0

    .line 10
    .line 11
    .line 12
    invoke-static {v1}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-object v2, p0, Lcom/immomo/momosec/network/a;->b:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2}, Ll/l1j$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/l1j$a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ll/l1j$a;->b()Ll/l1j;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/x1d0$a;

    .line 27
    .line 28
    invoke-direct {v1}, Ll/x1d0$a;-><init>()V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/immomo/momosec/network/a;->a:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v1, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const/16 v1, 0xa

    .line 38
    .line 39
    new-array v1, v1, [B

    .line 40
    .line 41
    fill-array-data v1, :array_1

    .line 42
    .line 43
    .line 44
    invoke-static {v1}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    const/4 v2, 0x5

    .line 49
    new-array v3, v2, [B

    .line 50
    .line 51
    fill-array-data v3, :array_2

    .line 52
    .line 53
    .line 54
    invoke-static {v3}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {p0, v1, v3}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const/4 v1, 0x7

    .line 63
    new-array v1, v1, [B

    .line 64
    .line 65
    fill-array-data v1, :array_3

    .line 66
    .line 67
    .line 68
    invoke-static {v1}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    new-array v3, v2, [B

    .line 73
    .line 74
    fill-array-data v3, :array_4

    .line 75
    .line 76
    .line 77
    invoke-static {v3}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-virtual {p0, v1, v3}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    const/16 v1, 0xf

    .line 86
    .line 87
    new-array v1, v1, [B

    .line 88
    .line 89
    fill-array-data v1, :array_5

    .line 90
    .line 91
    .line 92
    invoke-static {v1}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    new-array v2, v2, [B

    .line 97
    .line 98
    fill-array-data v2, :array_6

    .line 99
    .line 100
    .line 101
    invoke-static {v2}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-virtual {p0, v1, v2}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    const/16 v1, 0xc

    .line 110
    .line 111
    new-array v1, v1, [B

    .line 112
    .line 113
    fill-array-data v1, :array_7

    .line 114
    .line 115
    .line 116
    invoke-static {v1}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    const/16 v2, 0x21

    .line 121
    .line 122
    new-array v2, v2, [B

    .line 123
    .line 124
    fill-array-data v2, :array_8

    .line 125
    .line 126
    .line 127
    invoke-static {v2}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    invoke-virtual {p0, v1, v2}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    const/16 v1, 0xe

    .line 136
    .line 137
    new-array v1, v1, [B

    .line 138
    .line 139
    fill-array-data v1, :array_9

    .line 140
    .line 141
    .line 142
    invoke-static {v1}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-virtual {v0}, Ll/z1d0;->contentLength()J

    .line 147
    .line 148
    .line 149
    move-result-wide v2

    .line 150
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-virtual {p0, v1, v2}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-virtual {p0, v0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-static {p1}, Lcom/immomo/momosec/network/a;->h(Z)Ll/rg50;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    invoke-virtual {p1, p0}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    invoke-interface {p0}, Ll/ry3;->execute()Ll/i5d0;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    return-object p0

    .line 179
    :array_0
    .array-data 1
        0x5dt
        0x1ct
        0x58t
        0x47t
    .end array-data

    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    :array_1
    .array-data 1
        0x73t
        0x9t
        0x5ft
        0x59t
        0x4t
        0x5t
        0x44t
        0xft
        0x5et
        0x59t
    .end array-data

    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    nop

    .line 195
    :array_2
    .array-data 1
        0x53t
        0xat
        0x5et
        0x44t
        0x4t
    .end array-data

    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    nop

    .line 203
    :array_3
    .array-data 1
        0x73t
        0xet
        0x50t
        0x45t
        0x12t
        0x3t
        0x44t
    .end array-data

    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    :array_4
    .array-data 1
        0x65t
        0x32t
        0x77t
        0x1at
        0x59t
    .end array-data

    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    nop

    .line 219
    :array_5
    .array-data 1
        0x71t
        0x5t
        0x52t
        0x52t
        0x11t
        0x12t
        0x1dt
        0x2at
        0x50t
        0x59t
        0x6t
        0x13t
        0x51t
        0x1t
        0x54t
    .end array-data

    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    :array_6
    .array-data 1
        0x4at
        0xet
        0x1ct
        0x74t
        0x2ft
    .end array-data

    .line 232
    .line 233
    .line 234
    .line 235
    .line 236
    .line 237
    .line 238
    nop

    .line 239
    :array_7
    .array-data 1
        0x73t
        0x9t
        0x5ft
        0x43t
        0x4t
        0x8t
        0x44t
        0x4bt
        0x65t
        0x4et
        0x11t
        0x3t
    .end array-data

    .line 240
    .line 241
    .line 242
    .line 243
    .line 244
    .line 245
    .line 246
    .line 247
    .line 248
    .line 249
    :array_8
    .array-data 1
        0x51t
        0x16t
        0x41t
        0x5bt
        0x8t
        0x5t
        0x51t
        0x12t
        0x58t
        0x58t
        0xft
        0x49t
        0x48t
        0x4bt
        0x46t
        0x40t
        0x16t
        0x4bt
        0x56t
        0x9t
        0x43t
        0x5at
        0x4ct
        0x13t
        0x42t
        0xat
        0x54t
        0x59t
        0x2t
        0x9t
        0x54t
        0x3t
        0x55t
    .end array-data

    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
    .line 258
    .line 259
    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
    .line 266
    .line 267
    .line 268
    .line 269
    .line 270
    nop

    .line 271
    :array_9
    .array-data 1
        0x73t
        0x9t
        0x5ft
        0x43t
        0x4t
        0x8t
        0x44t
        0x4bt
        0x7dt
        0x52t
        0xft
        0x1t
        0x44t
        0xet
    .end array-data
.end method

.method private g()Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/immomo/momosec/network/HttpBaseException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move-object v1, v0

    .line 3
    :goto_0
    iget v2, p0, Lcom/immomo/momosec/network/a;->d:I

    .line 4
    .line 5
    const/4 v3, 0x3

    .line 6
    if-ge v2, v3, :cond_5

    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    iget-wide v4, p0, Lcom/immomo/momosec/network/a;->c:J

    .line 13
    .line 14
    sub-long/2addr v2, v4

    .line 15
    const-wide/16 v4, 0x7530

    .line 16
    .line 17
    cmp-long v2, v2, v4

    .line 18
    .line 19
    if-gtz v2, :cond_5

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    :try_start_0
    iget v2, p0, Lcom/immomo/momosec/network/a;->d:I

    .line 23
    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    move v2, v0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    const/4 v2, 0x0

    .line 29
    :goto_1
    invoke-direct {p0, v2}, Lcom/immomo/momosec/network/a;->f(Z)Ll/i5d0;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Ll/i5d0;->q()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    const/16 v3, 0xc8

    .line 38
    .line 39
    if-lt v2, v3, :cond_2

    .line 40
    .line 41
    const/16 v3, 0x12b

    .line 42
    .line 43
    if-gt v2, v3, :cond_2

    .line 44
    .line 45
    invoke-virtual {v1}, Ll/i5d0;->k()Ll/k5d0;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    if-eqz v3, :cond_1

    .line 50
    .line 51
    invoke-virtual {v1}, Ll/i5d0;->k()Ll/k5d0;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v2}, Ll/k5d0;->string()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2
    :try_end_0
    .catch Lcom/immomo/momosec/network/HttpBaseException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    invoke-virtual {v1}, Ll/i5d0;->close()V

    .line 60
    .line 61
    .line 62
    iget v1, p0, Lcom/immomo/momosec/network/a;->d:I

    .line 63
    .line 64
    add-int/2addr v1, v0

    .line 65
    iput v1, p0, Lcom/immomo/momosec/network/a;->d:I

    .line 66
    .line 67
    return-object v2

    .line 68
    :catchall_0
    move-exception v2

    .line 69
    goto/16 :goto_4

    .line 70
    .line 71
    :catch_0
    move-exception v2

    .line 72
    goto/16 :goto_2

    .line 73
    .line 74
    :catch_1
    move-exception v2

    .line 75
    goto/16 :goto_3

    .line 76
    .line 77
    :cond_1
    :try_start_1
    new-instance v3, Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 78
    .line 79
    invoke-direct {v3}, Lcom/immomo/momosec/network/HttpBaseException$a;-><init>()V

    .line 80
    .line 81
    .line 82
    sget-object v4, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;->NETWORK:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 83
    .line 84
    invoke-virtual {v3, v4}, Lcom/immomo/momosec/network/HttpBaseException$a;->l(Lcom/immomo/momosec/network/HttpBaseException$ErrorType;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    const/16 v4, 0x13

    .line 89
    .line 90
    new-array v4, v4, [B

    .line 91
    .line 92
    fill-array-data v4, :array_0

    .line 93
    .line 94
    .line 95
    invoke-static {v4}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    invoke-virtual {v3, v4}, Lcom/immomo/momosec/network/HttpBaseException$a;->m(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    iget-object v4, p0, Lcom/immomo/momosec/network/a;->a:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {v3, v4}, Lcom/immomo/momosec/network/HttpBaseException$a;->s(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    iget-object v4, p0, Lcom/immomo/momosec/network/a;->b:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {v3, v4}, Lcom/immomo/momosec/network/HttpBaseException$a;->o(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    invoke-virtual {v3, v2}, Lcom/immomo/momosec/network/HttpBaseException$a;->q(I)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    iget v3, p0, Lcom/immomo/momosec/network/a;->d:I

    .line 120
    .line 121
    invoke-virtual {v2, v3}, Lcom/immomo/momosec/network/HttpBaseException$a;->p(I)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 126
    .line 127
    .line 128
    move-result-wide v3

    .line 129
    iget-wide v5, p0, Lcom/immomo/momosec/network/a;->c:J

    .line 130
    .line 131
    sub-long/2addr v3, v5

    .line 132
    invoke-virtual {v2, v3, v4}, Lcom/immomo/momosec/network/HttpBaseException$a;->r(J)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    invoke-virtual {v2}, Lcom/immomo/momosec/network/HttpBaseException$a;->j()Lcom/immomo/momosec/network/HttpBaseException;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    throw v2

    .line 141
    :cond_2
    new-instance v3, Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 142
    .line 143
    invoke-direct {v3}, Lcom/immomo/momosec/network/HttpBaseException$a;-><init>()V

    .line 144
    .line 145
    .line 146
    sget-object v4, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;->NETWORK:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 147
    .line 148
    invoke-virtual {v3, v4}, Lcom/immomo/momosec/network/HttpBaseException$a;->l(Lcom/immomo/momosec/network/HttpBaseException$ErrorType;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 149
    .line 150
    .line 151
    move-result-object v3

    .line 152
    new-instance v4, Ljava/lang/StringBuilder;

    .line 153
    .line 154
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 155
    .line 156
    .line 157
    const/16 v5, 0x1a

    .line 158
    .line 159
    new-array v5, v5, [B

    .line 160
    .line 161
    fill-array-data v5, :array_1

    .line 162
    .line 163
    .line 164
    invoke-static {v5}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v5

    .line 168
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v4

    .line 178
    invoke-virtual {v3, v4}, Lcom/immomo/momosec/network/HttpBaseException$a;->m(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 179
    .line 180
    .line 181
    move-result-object v3

    .line 182
    iget-object v4, p0, Lcom/immomo/momosec/network/a;->a:Ljava/lang/String;

    .line 183
    .line 184
    invoke-virtual {v3, v4}, Lcom/immomo/momosec/network/HttpBaseException$a;->s(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 185
    .line 186
    .line 187
    move-result-object v3

    .line 188
    iget-object v4, p0, Lcom/immomo/momosec/network/a;->b:Ljava/lang/String;

    .line 189
    .line 190
    invoke-virtual {v3, v4}, Lcom/immomo/momosec/network/HttpBaseException$a;->o(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 191
    .line 192
    .line 193
    move-result-object v3

    .line 194
    invoke-virtual {v3, v2}, Lcom/immomo/momosec/network/HttpBaseException$a;->q(I)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    iget v3, p0, Lcom/immomo/momosec/network/a;->d:I

    .line 199
    .line 200
    invoke-virtual {v2, v3}, Lcom/immomo/momosec/network/HttpBaseException$a;->p(I)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 205
    .line 206
    .line 207
    move-result-wide v3

    .line 208
    iget-wide v5, p0, Lcom/immomo/momosec/network/a;->c:J

    .line 209
    .line 210
    sub-long/2addr v3, v5

    .line 211
    invoke-virtual {v2, v3, v4}, Lcom/immomo/momosec/network/HttpBaseException$a;->r(J)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    invoke-virtual {v2}, Lcom/immomo/momosec/network/HttpBaseException$a;->j()Lcom/immomo/momosec/network/HttpBaseException;

    .line 216
    .line 217
    .line 218
    move-result-object v2

    .line 219
    throw v2
    :try_end_1
    .catch Lcom/immomo/momosec/network/HttpBaseException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 220
    :goto_2
    :try_start_2
    invoke-direct {p0}, Lcom/immomo/momosec/network/a;->a()J

    .line 221
    .line 222
    .line 223
    move-result-wide v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 224
    :try_start_3
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 225
    .line 226
    .line 227
    :catch_2
    if-eqz v1, :cond_3

    .line 228
    .line 229
    invoke-virtual {v1}, Ll/i5d0;->close()V

    .line 230
    .line 231
    .line 232
    :cond_3
    iget v3, p0, Lcom/immomo/momosec/network/a;->d:I

    .line 233
    .line 234
    add-int/2addr v3, v0

    .line 235
    iput v3, p0, Lcom/immomo/momosec/network/a;->d:I

    .line 236
    .line 237
    move-object v0, v2

    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :goto_3
    :try_start_4
    throw v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 241
    :goto_4
    if-eqz v1, :cond_4

    .line 242
    .line 243
    invoke-virtual {v1}, Ll/i5d0;->close()V

    .line 244
    .line 245
    .line 246
    :cond_4
    iget v1, p0, Lcom/immomo/momosec/network/a;->d:I

    .line 247
    .line 248
    add-int/2addr v1, v0

    .line 249
    iput v1, p0, Lcom/immomo/momosec/network/a;->d:I

    .line 250
    .line 251
    throw v2

    .line 252
    :cond_5
    invoke-direct {p0, v0}, Lcom/immomo/momosec/network/a;->c(Ljava/lang/Exception;)Lcom/immomo/momosec/network/HttpBaseException;

    .line 253
    .line 254
    .line 255
    move-result-object p0

    .line 256
    throw p0

    .line 257
    :array_0
    .array-data 1
        0x75t
        0xbt
        0x41t
        0x43t
        0x18t
        0x46t
        0x42t
        0x3t
        0x42t
        0x47t
        0xet
        0x8t
        0x43t
        0x3t
        0x11t
        0x55t
        0xet
        0x2t
        0x49t
    .end array-data

    .line 258
    .line 259
    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
    .line 266
    .line 267
    .line 268
    .line 269
    .line 270
    .line 271
    :array_1
    .array-data 1
        0x79t
        0x8t
        0x47t
        0x56t
        0xdt
        0xft
        0x54t
        0x46t
        0x79t
        0x63t
        0x35t
        0x36t
        0x10t
        0x15t
        0x45t
        0x56t
        0x15t
        0x13t
        0x43t
        0x46t
        0x52t
        0x58t
        0x5t
        0x3t
        0xat
        0x46t
    .end array-data
.end method

.method private static h(Z)Ll/rg50;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-static {}, Lcom/immomo/momosec/network/a;->j()Ll/rg50;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-static {}, Lcom/immomo/momosec/network/a;->i()Ll/rg50;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method private static i()Ll/rg50;
    .locals 2

    .line 1
    sget-object v0, Lcom/immomo/momosec/network/a;->e:Ll/rg50;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/immomo/momosec/network/a;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/immomo/momosec/network/a;->e:Ll/rg50;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    invoke-static {}, Lcom/immomo/momosec/network/a;->b()Ll/rg50$b;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Ll/rg50$b;->c()Ll/rg50;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    sput-object v1, Lcom/immomo/momosec/network/a;->e:Ll/rg50;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception v1

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    :goto_0
    monitor-exit v0

    .line 26
    goto :goto_2

    .line 27
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    throw v1

    .line 29
    :cond_1
    :goto_2
    sget-object v0, Lcom/immomo/momosec/network/a;->e:Ll/rg50;

    .line 30
    .line 31
    return-object v0
.end method

.method private static j()Ll/rg50;
    .locals 3

    .line 1
    sget-object v0, Lcom/immomo/momosec/network/a;->f:Ll/rg50;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/immomo/momosec/network/a;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/immomo/momosec/network/a;->f:Ll/rg50;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    invoke-static {}, Lcom/immomo/momosec/network/a;->b()Ll/rg50$b;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    new-instance v2, Ll/sml;

    .line 17
    .line 18
    invoke-direct {v2}, Ll/sml;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ll/rg50$b;->k(Ll/t4f;)Ll/rg50$b;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    new-instance v2, Ll/uml;

    .line 26
    .line 27
    invoke-direct {v2}, Ll/uml;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1, v2}, Ll/rg50$b;->j(Ll/o6e;)Ll/rg50$b;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Ll/rg50$b;->c()Ll/rg50;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    sput-object v1, Lcom/immomo/momosec/network/a;->f:Ll/rg50;

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catchall_0
    move-exception v1

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    :goto_0
    monitor-exit v0

    .line 44
    goto :goto_2

    .line 45
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    throw v1

    .line 47
    :cond_1
    :goto_2
    sget-object v0, Lcom/immomo/momosec/network/a;->f:Ll/rg50;

    .line 48
    .line 49
    return-object v0
.end method

.method private k(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/immomo/momosec/network/HttpBaseException;
        }
    .end annotation

    .line 1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    new-array v1, v1, [B

    .line 8
    .line 9
    fill-array-data v1, :array_0

    .line 10
    .line 11
    .line 12
    invoke-static {v1}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const v2, -0x1869f

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    const/4 v2, 0x4

    .line 26
    new-array v2, v2, [B

    .line 27
    .line 28
    fill-array-data v2, :array_1

    .line 29
    .line 30
    .line 31
    invoke-static {v2}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-nez v2, :cond_0

    .line 44
    .line 45
    return-object v0

    .line 46
    :cond_0
    new-instance v0, Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 47
    .line 48
    invoke-direct {v0}, Lcom/immomo/momosec/network/HttpBaseException$a;-><init>()V

    .line 49
    .line 50
    .line 51
    sget-object v2, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;->SERVER_ERROR:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 52
    .line 53
    invoke-virtual {v0, v2}, Lcom/immomo/momosec/network/HttpBaseException$a;->l(Lcom/immomo/momosec/network/HttpBaseException$ErrorType;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const/16 v2, 0x1a

    .line 58
    .line 59
    new-array v2, v2, [B

    .line 60
    .line 61
    fill-array-data v2, :array_2

    .line 62
    .line 63
    .line 64
    invoke-static {v2}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v0, v2}, Lcom/immomo/momosec/network/HttpBaseException$a;->m(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v2, p0, Lcom/immomo/momosec/network/a;->a:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v0, v2}, Lcom/immomo/momosec/network/HttpBaseException$a;->s(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iget-object v2, p0, Lcom/immomo/momosec/network/a;->b:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v0, v2}, Lcom/immomo/momosec/network/HttpBaseException$a;->o(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iget v2, p0, Lcom/immomo/momosec/network/a;->d:I

    .line 85
    .line 86
    invoke-virtual {v0, v2}, Lcom/immomo/momosec/network/HttpBaseException$a;->p(I)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 91
    .line 92
    .line 93
    move-result-wide v2

    .line 94
    iget-wide v4, p0, Lcom/immomo/momosec/network/a;->c:J

    .line 95
    .line 96
    sub-long/2addr v2, v4

    .line 97
    invoke-virtual {v0, v2, v3}, Lcom/immomo/momosec/network/HttpBaseException$a;->r(J)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v0, p1}, Lcom/immomo/momosec/network/HttpBaseException$a;->n(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {v0, v1}, Lcom/immomo/momosec/network/HttpBaseException$a;->q(I)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v0}, Lcom/immomo/momosec/network/HttpBaseException$a;->j()Lcom/immomo/momosec/network/HttpBaseException;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    throw v0

    .line 114
    :catch_0
    move-exception v0

    .line 115
    goto :goto_0

    .line 116
    :cond_1
    new-instance v0, Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 117
    .line 118
    invoke-direct {v0}, Lcom/immomo/momosec/network/HttpBaseException$a;-><init>()V

    .line 119
    .line 120
    .line 121
    sget-object v2, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;->SERVER_ERROR:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 122
    .line 123
    invoke-virtual {v0, v2}, Lcom/immomo/momosec/network/HttpBaseException$a;->l(Lcom/immomo/momosec/network/HttpBaseException$ErrorType;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    new-instance v2, Ljava/lang/StringBuilder;

    .line 128
    .line 129
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 130
    .line 131
    .line 132
    const/16 v3, 0x23

    .line 133
    .line 134
    new-array v3, v3, [B

    .line 135
    .line 136
    fill-array-data v3, :array_3

    .line 137
    .line 138
    .line 139
    invoke-static {v3}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    invoke-virtual {v0, v2}, Lcom/immomo/momosec/network/HttpBaseException$a;->m(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    iget-object v2, p0, Lcom/immomo/momosec/network/a;->a:Ljava/lang/String;

    .line 158
    .line 159
    invoke-virtual {v0, v2}, Lcom/immomo/momosec/network/HttpBaseException$a;->s(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    iget-object v2, p0, Lcom/immomo/momosec/network/a;->b:Ljava/lang/String;

    .line 164
    .line 165
    invoke-virtual {v0, v2}, Lcom/immomo/momosec/network/HttpBaseException$a;->o(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    iget v2, p0, Lcom/immomo/momosec/network/a;->d:I

    .line 170
    .line 171
    invoke-virtual {v0, v2}, Lcom/immomo/momosec/network/HttpBaseException$a;->p(I)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 176
    .line 177
    .line 178
    move-result-wide v2

    .line 179
    iget-wide v4, p0, Lcom/immomo/momosec/network/a;->c:J

    .line 180
    .line 181
    sub-long/2addr v2, v4

    .line 182
    invoke-virtual {v0, v2, v3}, Lcom/immomo/momosec/network/HttpBaseException$a;->r(J)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {v0, p1}, Lcom/immomo/momosec/network/HttpBaseException$a;->n(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    invoke-virtual {v0, v1}, Lcom/immomo/momosec/network/HttpBaseException$a;->q(I)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-virtual {v0}, Lcom/immomo/momosec/network/HttpBaseException$a;->j()Lcom/immomo/momosec/network/HttpBaseException;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    throw v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 199
    :goto_0
    new-instance v1, Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 200
    .line 201
    invoke-direct {v1}, Lcom/immomo/momosec/network/HttpBaseException$a;-><init>()V

    .line 202
    .line 203
    .line 204
    sget-object v2, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;->JSON_PARSE:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 205
    .line 206
    invoke-virtual {v1, v2}, Lcom/immomo/momosec/network/HttpBaseException$a;->l(Lcom/immomo/momosec/network/HttpBaseException$ErrorType;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    const/16 v2, 0x1b

    .line 211
    .line 212
    new-array v2, v2, [B

    .line 213
    .line 214
    fill-array-data v2, :array_4

    .line 215
    .line 216
    .line 217
    invoke-static {v2}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v2

    .line 221
    invoke-virtual {v1, v2}, Lcom/immomo/momosec/network/HttpBaseException$a;->m(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    invoke-virtual {v1, v0}, Lcom/immomo/momosec/network/HttpBaseException$a;->k(Ljava/lang/Throwable;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    iget-object v1, p0, Lcom/immomo/momosec/network/a;->a:Ljava/lang/String;

    .line 230
    .line 231
    invoke-virtual {v0, v1}, Lcom/immomo/momosec/network/HttpBaseException$a;->s(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    iget-object v1, p0, Lcom/immomo/momosec/network/a;->b:Ljava/lang/String;

    .line 236
    .line 237
    invoke-virtual {v0, v1}, Lcom/immomo/momosec/network/HttpBaseException$a;->o(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    iget v1, p0, Lcom/immomo/momosec/network/a;->d:I

    .line 242
    .line 243
    invoke-virtual {v0, v1}, Lcom/immomo/momosec/network/HttpBaseException$a;->p(I)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 248
    .line 249
    .line 250
    move-result-wide v1

    .line 251
    iget-wide v3, p0, Lcom/immomo/momosec/network/a;->c:J

    .line 252
    .line 253
    sub-long/2addr v1, v3

    .line 254
    invoke-virtual {v0, v1, v2}, Lcom/immomo/momosec/network/HttpBaseException$a;->r(J)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 255
    .line 256
    .line 257
    move-result-object p0

    .line 258
    invoke-virtual {p0, p1}, Lcom/immomo/momosec/network/HttpBaseException$a;->n(Ljava/lang/String;)Lcom/immomo/momosec/network/HttpBaseException$a;

    .line 259
    .line 260
    .line 261
    move-result-object p0

    .line 262
    invoke-virtual {p0}, Lcom/immomo/momosec/network/HttpBaseException$a;->j()Lcom/immomo/momosec/network/HttpBaseException;

    .line 263
    .line 264
    .line 265
    move-result-object p0

    .line 266
    throw p0

    .line 267
    :array_0
    .array-data 1
        0x55t
        0x5t
    .end array-data

    .line 268
    .line 269
    .line 270
    .line 271
    .line 272
    nop

    .line 273
    :array_1
    .array-data 1
        0x54t
        0x7t
        0x45t
        0x56t
    .end array-data

    .line 274
    .line 275
    .line 276
    .line 277
    .line 278
    .line 279
    :array_2
    .array-data 1
        0x63t
        0x3t
        0x43t
        0x41t
        0x4t
        0x14t
        0x10t
        0x14t
        0x54t
        0x43t
        0x14t
        0x14t
        0x5et
        0x3t
        0x55t
        0x17t
        0x4t
        0xbt
        0x40t
        0x12t
        0x48t
        0x17t
        0x5t
        0x7t
        0x44t
        0x7t
    .end array-data

    .line 280
    .line 281
    .line 282
    .line 283
    .line 284
    .line 285
    .line 286
    .line 287
    .line 288
    .line 289
    .line 290
    .line 291
    .line 292
    .line 293
    .line 294
    .line 295
    .line 296
    nop

    .line 297
    :array_3
    .array-data 1
        0x63t
        0x3t
        0x43t
        0x41t
        0x4t
        0x14t
        0x10t
        0x14t
        0x54t
        0x43t
        0x14t
        0x14t
        0x5et
        0x3t
        0x55t
        0x17t
        0x4t
        0x14t
        0x42t
        0x9t
        0x43t
        0x17t
        0x12t
        0x12t
        0x51t
        0x12t
        0x44t
        0x44t
        0x5bt
        0x46t
        0x55t
        0x5t
        0x11t
        0xat
        0x41t
    .end array-data

    .line 298
    .line 299
    .line 300
    .line 301
    .line 302
    .line 303
    .line 304
    .line 305
    .line 306
    .line 307
    .line 308
    .line 309
    .line 310
    .line 311
    .line 312
    .line 313
    .line 314
    .line 315
    .line 316
    .line 317
    .line 318
    .line 319
    :array_4
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x40t
        0x7t
        0x43t
        0x44t
        0x8t
        0x8t
        0x57t
        0x46t
        0x7bt
        0x64t
        0x2et
        0x28t
        0x10t
        0x14t
        0x54t
        0x44t
        0x11t
        0x9t
        0x5et
        0x15t
        0x54t
    .end array-data
.end method


# virtual methods
.method public e()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/immomo/momosec/network/HttpBaseException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/immomo/momosec/network/a;->g()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Lcom/immomo/momosec/network/a;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {p0, v0}, Lcom/immomo/momosec/network/a;->k(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
