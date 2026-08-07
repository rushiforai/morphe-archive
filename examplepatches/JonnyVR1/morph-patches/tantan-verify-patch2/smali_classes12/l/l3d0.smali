.class public Ll/l3d0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:J = -0x1L

.field public static volatile b:Ljava/lang/String; = null

.field public static volatile c:Ljava/lang/String; = ""

.field private static volatile d:Z

.field public static volatile e:Ljava/lang/String;

.field public static volatile f:I

.field public static g:Landroid/content/Context;

.field public static h:Z

.field public static i:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/l3d0;->e(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/yd00;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static c(Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    sget-wide v0, Ll/l3d0;->a:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v0, v2, v0

    .line 6
    .line 7
    const-string v1, ""

    .line 8
    .line 9
    const-string v4, "CVCENTER_MODEL_CONFIG"

    .line 10
    .line 11
    const-string v5, "CVCENTER_MODEL_CONFIG_LAST_UPDATE"

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {v5, v2, v3}, Ll/dq80;->c(Ljava/lang/String;J)J

    .line 16
    .line 17
    .line 18
    move-result-wide v6

    .line 19
    sget-wide v8, Ll/l3d0;->a:J

    .line 20
    .line 21
    add-long/2addr v6, v8

    .line 22
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 23
    .line 24
    .line 25
    move-result-wide v8

    .line 26
    cmp-long v0, v6, v8

    .line 27
    .line 28
    if-lez v0, :cond_0

    .line 29
    .line 30
    invoke-static {v4, v1}, Ll/dq80;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v6

    .line 38
    if-nez v6, :cond_0

    .line 39
    .line 40
    return-object v0

    .line 41
    :cond_0
    invoke-static {p0}, Ll/yd00;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    sget-wide v6, Ll/l3d0;->a:J

    .line 46
    .line 47
    cmp-long v0, v2, v6

    .line 48
    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 52
    .line 53
    .line 54
    move-result-wide v0

    .line 55
    invoke-static {v5, v0, v1}, Ll/dq80;->f(Ljava/lang/String;J)Z

    .line 56
    .line 57
    .line 58
    invoke-static {v4, p0}, Ll/dq80;->g(Ljava/lang/String;Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    return-object p0

    .line 62
    :cond_1
    invoke-static {v5, v2, v3}, Ll/dq80;->f(Ljava/lang/String;J)Z

    .line 63
    .line 64
    .line 65
    invoke-static {v4, v1}, Ll/dq80;->g(Ljava/lang/String;Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    return-object p0
.end method

.method public static d(Landroid/content/Context;Ll/ysd0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ll/l3d0;->g:Landroid/content/Context;

    .line 6
    .line 7
    if-eqz p1, :cond_2

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/ysd0;->d()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Ll/l3d0;->i:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/ysd0;->b()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sput-object v0, Ll/l3d0;->b:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/ysd0;->c()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Ll/l3d0;->c:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p1}, Ll/ysd0;->e()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    sput v0, Ll/l3d0;->f:I

    .line 32
    .line 33
    invoke-virtual {p1}, Ll/ysd0;->f()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sput-object v0, Ll/l3d0;->e:Ljava/lang/String;

    .line 38
    .line 39
    iget-wide v0, p1, Ll/ysd0;->a:J

    .line 40
    .line 41
    sput-wide v0, Ll/l3d0;->a:J

    .line 42
    .line 43
    invoke-virtual {p1}, Ll/ysd0;->g()Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    const/4 p1, 0x1

    .line 50
    sput-boolean p1, Ll/l3d0;->h:Z

    .line 51
    .line 52
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    if-eq p1, v0, :cond_0

    .line 61
    .line 62
    new-instance p1, Landroid/os/Handler;

    .line 63
    .line 64
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 69
    .line 70
    .line 71
    new-instance v0, Ll/l3d0$a;

    .line 72
    .line 73
    invoke-direct {v0, p0}, Ll/l3d0$a;-><init>(Landroid/content/Context;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_0
    invoke-static {p0}, Ll/l3d0;->e(Landroid/content/Context;)V

    .line 81
    .line 82
    .line 83
    :cond_1
    return-void

    .line 84
    :cond_2
    const-string p0, "SDKConfig should not be null"

    .line 85
    .line 86
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method private static declared-synchronized e(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-class v0, Ll/l3d0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-static {p0}, Ll/nxv;->b(Landroid/content/Context;)Ll/nxv;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v1}, Ll/nxv;->c()Ll/nxv$b;

    .line 9
    .line 10
    .line 11
    new-instance v1, Ll/l3d0$b;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/l3d0$b;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p0, v1}, Lcom/immomo/mmdns/DNSManager;->init(Landroid/content/Context;Lcom/immomo/mmdns/IMDDNSConfig;)V

    .line 17
    .line 18
    .line 19
    const-string p0, "8701b0b5e66f551562c78781b1dc66c3"

    .line 20
    .line 21
    invoke-static {p0}, Lcom/immomo/mmdns/DNSManager;->getInstance(Ljava/lang/String;)Lcom/immomo/mmdns/MDDNSEntrance;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-virtual {p0, v1}, Lcom/immomo/mmdns/MDDNSEntrance;->openAll(Z)V

    .line 27
    .line 28
    .line 29
    sput-boolean v1, Ll/l3d0;->d:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    .line 31
    monitor-exit v0

    .line 32
    return-void

    .line 33
    :catchall_0
    move-exception p0

    .line 34
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    throw p0
.end method
