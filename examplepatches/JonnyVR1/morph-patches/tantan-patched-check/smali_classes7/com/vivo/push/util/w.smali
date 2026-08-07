.class public final Lcom/vivo/push/util/w;
.super Lcom/vivo/push/util/b;
.source "SourceFile"


# static fields
.field private static b:Lcom/vivo/push/util/w;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/vivo/push/util/b;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static declared-synchronized b()Lcom/vivo/push/util/w;
    .locals 2

    .line 1
    const-class v0, Lcom/vivo/push/util/w;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/vivo/push/util/w;->b:Lcom/vivo/push/util/w;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lcom/vivo/push/util/w;

    .line 9
    .line 10
    invoke-direct {v1}, Lcom/vivo/push/util/w;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lcom/vivo/push/util/w;->b:Lcom/vivo/push/util/w;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v1

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    sget-object v1, Lcom/vivo/push/util/w;->b:Lcom/vivo/push/util/w;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-object v1

    .line 22
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw v1
.end method

.method private static c(Ljava/lang/String;)[B
    .locals 4

    const/4 v0, 0x0

    .line 93
    :try_start_0
    const-string v1, ","

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 94
    array-length v1, p0

    const/4 v2, 0x0

    if-lez v1, :cond_0

    .line 95
    array-length v1, p0

    new-array v0, v1, [B

    .line 96
    array-length v1, p0

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_1

    :cond_0
    move v1, v2

    :goto_0
    if-ge v2, v1, :cond_1

    .line 97
    aget-object v3, p0, v2

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Byte;->parseByte(Ljava/lang/String;)B

    move-result v3

    aput-byte v3, v0, v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v0

    .line 98
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "getCodeBytes error:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "SharePreferenceManager"

    invoke-static {v1, p0}, Lcom/vivo/push/util/p;->a(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0
.end method


# virtual methods
.method public final declared-synchronized a(Landroid/content/Context;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/vivo/push/util/b;->a:Landroid/content/Context;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iput-object p1, p0, Lcom/vivo/push/util/b;->a:Landroid/content/Context;

    .line 7
    .line 8
    const-string v0, "com.vivo.push_preferences"

    .line 9
    .line 10
    invoke-virtual {p0, p1, v0}, Lcom/vivo/push/util/b;->a(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    throw p1
.end method

.method public final c()[B
    .locals 5

    .line 1
    const-string v0, "com.vivo.push.secure_cache_iv"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Lcom/vivo/push/util/b;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/vivo/push/util/w;->c(Ljava/lang/String;)[B

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    array-length v0, p0

    .line 16
    if-gtz v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    return-object p0

    .line 20
    :cond_1
    :goto_0
    const/16 p0, 0x10

    .line 21
    .line 22
    new-array p0, p0, [B

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    const/16 v1, 0x22

    .line 26
    .line 27
    aput-byte v1, p0, v0

    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    const/16 v2, 0x20

    .line 31
    .line 32
    aput-byte v2, p0, v0

    .line 33
    .line 34
    const/4 v0, 0x2

    .line 35
    const/16 v3, 0x21

    .line 36
    .line 37
    aput-byte v3, p0, v0

    .line 38
    .line 39
    const/4 v0, 0x3

    .line 40
    const/16 v4, 0x25

    .line 41
    .line 42
    aput-byte v4, p0, v0

    .line 43
    .line 44
    const/4 v0, 0x4

    .line 45
    aput-byte v3, p0, v0

    .line 46
    .line 47
    const/4 v0, 0x5

    .line 48
    aput-byte v1, p0, v0

    .line 49
    .line 50
    const/4 v0, 0x6

    .line 51
    aput-byte v2, p0, v0

    .line 52
    .line 53
    const/4 v0, 0x7

    .line 54
    aput-byte v3, p0, v0

    .line 55
    .line 56
    const/16 v0, 0x8

    .line 57
    .line 58
    aput-byte v3, p0, v0

    .line 59
    .line 60
    const/16 v0, 0x9

    .line 61
    .line 62
    aput-byte v3, p0, v0

    .line 63
    .line 64
    const/16 v0, 0xa

    .line 65
    .line 66
    aput-byte v1, p0, v0

    .line 67
    .line 68
    const/16 v0, 0xb

    .line 69
    .line 70
    const/16 v1, 0x29

    .line 71
    .line 72
    aput-byte v1, p0, v0

    .line 73
    .line 74
    const/16 v0, 0xc

    .line 75
    .line 76
    const/16 v1, 0x23

    .line 77
    .line 78
    aput-byte v1, p0, v0

    .line 79
    .line 80
    const/16 v0, 0xd

    .line 81
    .line 82
    aput-byte v2, p0, v0

    .line 83
    .line 84
    const/16 v0, 0xe

    .line 85
    .line 86
    aput-byte v2, p0, v0

    .line 87
    .line 88
    const/16 v0, 0xf

    .line 89
    .line 90
    aput-byte v2, p0, v0

    .line 91
    .line 92
    return-object p0
.end method

.method public final d()[B
    .locals 8

    .line 1
    const-string v0, "com.vivo.push.secure_cache_key"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Lcom/vivo/push/util/b;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/vivo/push/util/w;->c(Ljava/lang/String;)[B

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    array-length v0, p0

    .line 16
    if-gtz v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    return-object p0

    .line 20
    :cond_1
    :goto_0
    const/16 p0, 0x10

    .line 21
    .line 22
    new-array p0, p0, [B

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    const/16 v1, 0x21

    .line 26
    .line 27
    aput-byte v1, p0, v0

    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    const/16 v2, 0x22

    .line 31
    .line 32
    aput-byte v2, p0, v0

    .line 33
    .line 34
    const/4 v0, 0x2

    .line 35
    const/16 v3, 0x23

    .line 36
    .line 37
    aput-byte v3, p0, v0

    .line 38
    .line 39
    const/4 v0, 0x3

    .line 40
    const/16 v4, 0x24

    .line 41
    .line 42
    aput-byte v4, p0, v0

    .line 43
    .line 44
    const/4 v0, 0x4

    .line 45
    const/16 v5, 0x25

    .line 46
    .line 47
    aput-byte v5, p0, v0

    .line 48
    .line 49
    const/4 v0, 0x5

    .line 50
    const/16 v6, 0x26

    .line 51
    .line 52
    aput-byte v6, p0, v0

    .line 53
    .line 54
    const/4 v0, 0x6

    .line 55
    const/16 v7, 0x27

    .line 56
    .line 57
    aput-byte v7, p0, v0

    .line 58
    .line 59
    const/4 v0, 0x7

    .line 60
    const/16 v7, 0x28

    .line 61
    .line 62
    aput-byte v7, p0, v0

    .line 63
    .line 64
    const/16 v0, 0x8

    .line 65
    .line 66
    const/16 v7, 0x29

    .line 67
    .line 68
    aput-byte v7, p0, v0

    .line 69
    .line 70
    const/16 v0, 0x9

    .line 71
    .line 72
    const/16 v7, 0x20

    .line 73
    .line 74
    aput-byte v7, p0, v0

    .line 75
    .line 76
    const/16 v0, 0xa

    .line 77
    .line 78
    aput-byte v6, p0, v0

    .line 79
    .line 80
    const/16 v0, 0xb

    .line 81
    .line 82
    aput-byte v5, p0, v0

    .line 83
    .line 84
    const/16 v0, 0xc

    .line 85
    .line 86
    aput-byte v4, p0, v0

    .line 87
    .line 88
    const/16 v0, 0xd

    .line 89
    .line 90
    aput-byte v3, p0, v0

    .line 91
    .line 92
    const/16 v0, 0xe

    .line 93
    .line 94
    aput-byte v2, p0, v0

    .line 95
    .line 96
    const/16 v0, 0xf

    .line 97
    .line 98
    aput-byte v1, p0, v0

    .line 99
    .line 100
    return-object p0
.end method
