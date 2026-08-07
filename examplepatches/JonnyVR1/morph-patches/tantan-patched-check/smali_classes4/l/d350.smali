.class public Ll/d350;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static g:Ll/d350;

.field public static h:Landroid/content/Context;

.field public static i:[Ljava/lang/String;


# instance fields
.field public final a:J

.field public b:Landroid/net/ConnectivityManager;

.field public c:Z

.field public d:J

.field public e:J

.field public f:J


# direct methods
.method static constructor <clinit>()V
    .locals 34

    .line 1
    const-string v32, "time.windows.com"

    .line 2
    .line 3
    const-string v33, "time.google.com"

    .line 4
    .line 5
    const-string v1, "ntp1.aliyun.com"

    .line 6
    .line 7
    const-string v2, "cn.ntp.org.cn"

    .line 8
    .line 9
    const-string v3, "1.android.pool.ntp.org"

    .line 10
    .line 11
    const-string v4, "ntp2.aliyun.com"

    .line 12
    .line 13
    const-string v5, "1.pool.ntp.org"

    .line 14
    .line 15
    const-string v6, "2.android.pool.ntp.org"

    .line 16
    .line 17
    const-string v7, "ntp3.aliyun.com"

    .line 18
    .line 19
    const-string v8, "ntp4.aliyun.com"

    .line 20
    .line 21
    const-string v9, "ntp5.aliyun.com"

    .line 22
    .line 23
    const-string v10, "ntp6.aliyun.com"

    .line 24
    .line 25
    const-string v11, "ntp7.aliyun.com"

    .line 26
    .line 27
    const-string v12, "edu.ntp.org.cn"

    .line 28
    .line 29
    const-string v13, "hk.ntp.org.cn"

    .line 30
    .line 31
    const-string v14, "tw.ntp.org.cn"

    .line 32
    .line 33
    const-string v15, "us.ntp.org.cn"

    .line 34
    .line 35
    const-string v16, "sgp.ntp.org.cn"

    .line 36
    .line 37
    const-string v17, "kr.ntp.org.cn"

    .line 38
    .line 39
    const-string v18, "jp.ntp.org.cn"

    .line 40
    .line 41
    const-string v19, "de.ntp.org.cn"

    .line 42
    .line 43
    const-string v20, "ina.ntp.org.cn"

    .line 44
    .line 45
    const-string v21, "sim.ntp.org.cn"

    .line 46
    .line 47
    const-string v22, "cn.pool.ntp.org"

    .line 48
    .line 49
    const-string v23, "hk.pool.ntp.org"

    .line 50
    .line 51
    const-string v24, "tw.ntp.org.cn"

    .line 52
    .line 53
    const-string v25, "asia.pool.ntp.org"

    .line 54
    .line 55
    const-string v26, "3.asia.pool.ntp.org"

    .line 56
    .line 57
    const-string v27, "0.centos.pool.ntp.org"

    .line 58
    .line 59
    const-string v28, "1.centos.pool.ntp.org"

    .line 60
    .line 61
    const-string v29, "time.asia.apple.com"

    .line 62
    .line 63
    const-string v30, "clock.cuhk.edu.hk"

    .line 64
    .line 65
    const-string v31, "133.100.11.8"

    .line 66
    .line 67
    filled-new-array/range {v1 .. v33}, [Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    sput-object v0, Ll/d350;->i:[Ljava/lang/String;

    .line 72
    .line 73
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p2, p0, Ll/d350;->a:J

    .line 5
    .line 6
    return-void
.end method

.method public static declared-synchronized d(Landroid/content/Context;)Ll/d350;
    .locals 5

    .line 1
    const-class v0, Ll/d350;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Ll/d350;->g:Ll/d350;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Ll/d350;

    .line 9
    .line 10
    const-string v2, "2.android.pool.ntp.org"

    .line 11
    .line 12
    const-wide/16 v3, 0x7d0

    .line 13
    .line 14
    invoke-direct {v1, v2, v3, v4}, Ll/d350;-><init>(Ljava/lang/String;J)V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/d350;->g:Ll/d350;

    .line 18
    .line 19
    sput-object p0, Ll/d350;->h:Landroid/content/Context;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :goto_0
    sget-object p0, Ll/d350;->g:Ll/d350;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    monitor-exit v0

    .line 27
    return-object p0

    .line 28
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    throw p0
.end method


# virtual methods
.method public a()J
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/d350;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    iget-wide v0, p0, Ll/d350;->d:J

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/d350;->c()J

    .line 13
    .line 14
    .line 15
    move-result-wide v2

    .line 16
    add-long/2addr v0, v2

    .line 17
    return-wide v0
.end method

.method public b()Z
    .locals 8

    .line 1
    iget-object v0, p0, Ll/d350;->b:Landroid/net/ConnectivityManager;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/d350;->h:Landroid/content/Context;

    .line 6
    .line 7
    const-string v1, "connectivity"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/net/ConnectivityManager;

    .line 14
    .line 15
    iput-object v0, p0, Ll/d350;->b:Landroid/net/ConnectivityManager;

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/d350;->b:Landroid/net/ConnectivityManager;

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    :goto_0
    const/4 v1, 0x0

    .line 28
    if-eqz v0, :cond_4

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_2

    .line 35
    .line 36
    goto :goto_2

    .line 37
    :cond_2
    new-instance v0, Lcom/tantanapp/foxstatistics/ntp/SntpClient;

    .line 38
    .line 39
    invoke-direct {v0}, Lcom/tantanapp/foxstatistics/ntp/SntpClient;-><init>()V

    .line 40
    .line 41
    .line 42
    sget-object v2, Ll/d350;->i:[Ljava/lang/String;

    .line 43
    .line 44
    array-length v3, v2

    .line 45
    move v4, v1

    .line 46
    :goto_1
    if-ge v4, v3, :cond_4

    .line 47
    .line 48
    aget-object v5, v2, v4

    .line 49
    .line 50
    iget-wide v6, p0, Ll/d350;->a:J

    .line 51
    .line 52
    long-to-int v6, v6

    .line 53
    invoke-virtual {v0, v5, v6}, Lcom/tantanapp/foxstatistics/ntp/SntpClient;->g(Ljava/lang/String;I)Z

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    if-eqz v5, :cond_3

    .line 58
    .line 59
    const/4 v1, 0x1

    .line 60
    iput-boolean v1, p0, Ll/d350;->c:Z

    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/tantanapp/foxstatistics/ntp/SntpClient;->b()J

    .line 63
    .line 64
    .line 65
    move-result-wide v2

    .line 66
    iput-wide v2, p0, Ll/d350;->d:J

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/tantanapp/foxstatistics/ntp/SntpClient;->c()J

    .line 69
    .line 70
    .line 71
    move-result-wide v2

    .line 72
    iput-wide v2, p0, Ll/d350;->e:J

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/tantanapp/foxstatistics/ntp/SntpClient;->d()J

    .line 75
    .line 76
    .line 77
    move-result-wide v2

    .line 78
    const-wide/16 v4, 0x2

    .line 79
    .line 80
    div-long/2addr v2, v4

    .line 81
    iput-wide v2, p0, Ll/d350;->f:J

    .line 82
    .line 83
    return v1

    .line 84
    :cond_3
    add-int/lit8 v4, v4, 0x1

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_4
    :goto_2
    return v1
.end method

.method public c()J
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/d350;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iget-wide v2, p0, Ll/d350;->e:J

    .line 10
    .line 11
    sub-long/2addr v0, v2

    .line 12
    return-wide v0

    .line 13
    :cond_0
    const-wide v0, 0x7fffffffffffffffL

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    return-wide v0
.end method
