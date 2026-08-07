.class public Lcom/xiaomi/push/i;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/push/i$a;
    }
.end annotation


# static fields
.field private static final a:I

.field private static b:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget-object v0, Lcom/xiaomi/push/ei;->c:Lcom/xiaomi/push/ei;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/xiaomi/push/ei;->a()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/xiaomi/push/i;->a:I

    .line 8
    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    sput-wide v0, Lcom/xiaomi/push/i;->b:J

    .line 12
    .line 13
    return-void
.end method

.method public static a()V
    .locals 4

    .line 1
    sget-wide v0, Lcom/xiaomi/push/i;->b:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    sget-wide v2, Lcom/xiaomi/push/i;->b:J

    .line 14
    .line 15
    sub-long/2addr v0, v2

    .line 16
    const-wide/32 v2, 0x6ddd00

    .line 17
    .line 18
    .line 19
    cmp-long v0, v0, v2

    .line 20
    .line 21
    if-lez v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void

    .line 25
    :cond_1
    :goto_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    sput-wide v0, Lcom/xiaomi/push/i;->b:J

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    sget v1, Lcom/xiaomi/push/i;->a:I

    .line 33
    .line 34
    invoke-static {v0, v1}, Lcom/xiaomi/push/i;->c(II)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static b(I)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/xiaomi/push/h;->f()Lcom/xiaomi/push/h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/xiaomi/push/h;->a()Lcom/xiaomi/push/ej;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/xiaomi/push/ei;->k:Lcom/xiaomi/push/ei;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/xiaomi/push/ei;->a()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/ej;->a(I)Lcom/xiaomi/push/ej;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p0}, Lcom/xiaomi/push/ej;->c(I)Lcom/xiaomi/push/ej;

    .line 19
    .line 20
    .line 21
    invoke-static {}, Lcom/xiaomi/push/h;->f()Lcom/xiaomi/push/h;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/h;->i(Lcom/xiaomi/push/ej;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static declared-synchronized c(II)V
    .locals 3

    .line 1
    const-class v0, Lcom/xiaomi/push/i;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const v1, 0xffffff

    .line 5
    .line 6
    .line 7
    if-ge p1, v1, :cond_0

    .line 8
    .line 9
    shl-int/lit8 p0, p0, 0x18

    .line 10
    .line 11
    or-int/2addr p0, p1

    .line 12
    :try_start_0
    sget-object p1, Lcom/xiaomi/push/i$a;->a:Ljava/util/Hashtable;

    .line 13
    .line 14
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 19
    .line 20
    .line 21
    move-result-wide v1

    .line 22
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p1, p0, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    const-string p0, "stats key should less than 16777215"

    .line 33
    .line 34
    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    .line 36
    .line 37
    :goto_0
    monitor-exit v0

    .line 38
    return-void

    .line 39
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    throw p0
.end method

.method public static d(IIILjava/lang/String;I)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/xiaomi/push/h;->f()Lcom/xiaomi/push/h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/xiaomi/push/h;->a()Lcom/xiaomi/push/ej;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    int-to-byte p0, p0

    .line 10
    invoke-virtual {v0, p0}, Lcom/xiaomi/push/ej;->a(B)Lcom/xiaomi/push/ej;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/ej;->a(I)Lcom/xiaomi/push/ej;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Lcom/xiaomi/push/ej;->b(I)Lcom/xiaomi/push/ej;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p3}, Lcom/xiaomi/push/ej;->b(Ljava/lang/String;)Lcom/xiaomi/push/ej;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p4}, Lcom/xiaomi/push/ej;->c(I)Lcom/xiaomi/push/ej;

    .line 23
    .line 24
    .line 25
    invoke-static {}, Lcom/xiaomi/push/h;->f()Lcom/xiaomi/push/h;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/h;->i(Lcom/xiaomi/push/ej;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static declared-synchronized e(IILjava/lang/String;I)V
    .locals 6

    .line 1
    const-class v0, Lcom/xiaomi/push/i;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide v1

    .line 8
    shl-int/lit8 p0, p0, 0x18

    .line 9
    .line 10
    or-int/2addr p0, p1

    .line 11
    sget-object v3, Lcom/xiaomi/push/i$a;->a:Ljava/util/Hashtable;

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    invoke-virtual {v3, v4}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-eqz v3, :cond_1

    .line 22
    .line 23
    invoke-static {}, Lcom/xiaomi/push/h;->f()Lcom/xiaomi/push/h;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v3}, Lcom/xiaomi/push/h;->a()Lcom/xiaomi/push/ej;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v3, p1}, Lcom/xiaomi/push/ej;->a(I)Lcom/xiaomi/push/ej;

    .line 32
    .line 33
    .line 34
    sget-object v4, Lcom/xiaomi/push/i$a;->a:Ljava/util/Hashtable;

    .line 35
    .line 36
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v4, p0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, Ljava/lang/Long;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 47
    .line 48
    .line 49
    move-result-wide v4

    .line 50
    sub-long/2addr v1, v4

    .line 51
    long-to-int p0, v1

    .line 52
    invoke-virtual {v3, p0}, Lcom/xiaomi/push/ej;->b(I)Lcom/xiaomi/push/ej;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v3, p2}, Lcom/xiaomi/push/ej;->b(Ljava/lang/String;)Lcom/xiaomi/push/ej;

    .line 56
    .line 57
    .line 58
    const/4 p0, -0x1

    .line 59
    if-le p3, p0, :cond_0

    .line 60
    .line 61
    invoke-virtual {v3, p3}, Lcom/xiaomi/push/ej;->c(I)Lcom/xiaomi/push/ej;

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :catchall_0
    move-exception p0

    .line 66
    goto :goto_2

    .line 67
    :cond_0
    :goto_0
    invoke-static {}, Lcom/xiaomi/push/h;->f()Lcom/xiaomi/push/h;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0, v3}, Lcom/xiaomi/push/h;->i(Lcom/xiaomi/push/ej;)V

    .line 72
    .line 73
    .line 74
    sget-object p0, Lcom/xiaomi/push/i$a;->a:Ljava/util/Hashtable;

    .line 75
    .line 76
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {p0, p1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_1
    const-string p0, "stats key not found"

    .line 85
    .line 86
    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    .line 88
    .line 89
    :goto_1
    monitor-exit v0

    .line 90
    return-void

    .line 91
    :goto_2
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 92
    throw p0
.end method

.method public static f(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/service/am$b;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/xiaomi/push/b;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/xiaomi/push/b;-><init>(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/service/am$b;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/xiaomi/push/b;->a()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static g(Ljava/lang/String;ILjava/lang/Exception;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/xiaomi/push/h;->f()Lcom/xiaomi/push/h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/xiaomi/push/h;->a()Lcom/xiaomi/push/ej;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Lcom/xiaomi/push/h;->e()Lcom/xiaomi/push/f;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/xiaomi/push/h;->e()Lcom/xiaomi/push/f;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v1, v1, Lcom/xiaomi/push/f;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-static {}, Lcom/xiaomi/push/h;->e()Lcom/xiaomi/push/f;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget-object v1, v1, Lcom/xiaomi/push/f;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 28
    .line 29
    invoke-static {v1}, Ll/mtq0;->v(Landroid/content/Context;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/ej;->c(I)Lcom/xiaomi/push/ej;

    .line 34
    .line 35
    .line 36
    :cond_0
    if-lez p1, :cond_1

    .line 37
    .line 38
    sget-object p2, Lcom/xiaomi/push/ei;->l:Lcom/xiaomi/push/ei;

    .line 39
    .line 40
    invoke-virtual {p2}, Lcom/xiaomi/push/ei;->a()I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    invoke-virtual {v0, p2}, Lcom/xiaomi/push/ej;->a(I)Lcom/xiaomi/push/ej;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, p0}, Lcom/xiaomi/push/ej;->b(Ljava/lang/String;)Lcom/xiaomi/push/ej;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/ej;->b(I)Lcom/xiaomi/push/ej;

    .line 51
    .line 52
    .line 53
    invoke-static {}, Lcom/xiaomi/push/h;->f()Lcom/xiaomi/push/h;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/h;->i(Lcom/xiaomi/push/ej;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    :try_start_0
    invoke-static {p2}, Lcom/xiaomi/push/e;->a(Ljava/lang/Exception;)Lcom/xiaomi/push/e$a;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iget-object p2, p1, Lcom/xiaomi/push/e$a;->a:Lcom/xiaomi/push/ei;

    .line 66
    .line 67
    invoke-virtual {p2}, Lcom/xiaomi/push/ei;->a()I

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    invoke-virtual {v0, p2}, Lcom/xiaomi/push/ej;->a(I)Lcom/xiaomi/push/ej;

    .line 72
    .line 73
    .line 74
    iget-object p1, p1, Lcom/xiaomi/push/e$a;->b:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/ej;->c(Ljava/lang/String;)Lcom/xiaomi/push/ej;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, p0}, Lcom/xiaomi/push/ej;->b(Ljava/lang/String;)Lcom/xiaomi/push/ej;

    .line 80
    .line 81
    .line 82
    invoke-static {}, Lcom/xiaomi/push/h;->f()Lcom/xiaomi/push/h;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/h;->i(Lcom/xiaomi/push/ej;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    .line 88
    .line 89
    :catch_0
    return-void
.end method

.method public static h(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 2

    .line 1
    :try_start_0
    invoke-static {p1}, Lcom/xiaomi/push/e;->c(Ljava/lang/Exception;)Lcom/xiaomi/push/e$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Lcom/xiaomi/push/h;->f()Lcom/xiaomi/push/h;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/xiaomi/push/h;->a()Lcom/xiaomi/push/ej;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p1, Lcom/xiaomi/push/e$a;->a:Lcom/xiaomi/push/ei;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/xiaomi/push/ei;->a()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/ej;->a(I)Lcom/xiaomi/push/ej;

    .line 20
    .line 21
    .line 22
    iget-object p1, p1, Lcom/xiaomi/push/e$a;->b:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/ej;->c(Ljava/lang/String;)Lcom/xiaomi/push/ej;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p0}, Lcom/xiaomi/push/ej;->b(Ljava/lang/String;)Lcom/xiaomi/push/ej;

    .line 28
    .line 29
    .line 30
    invoke-static {}, Lcom/xiaomi/push/h;->e()Lcom/xiaomi/push/f;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    if-eqz p0, :cond_0

    .line 35
    .line 36
    invoke-static {}, Lcom/xiaomi/push/h;->e()Lcom/xiaomi/push/f;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    iget-object p0, p0, Lcom/xiaomi/push/f;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 41
    .line 42
    if-eqz p0, :cond_0

    .line 43
    .line 44
    invoke-static {}, Lcom/xiaomi/push/h;->e()Lcom/xiaomi/push/f;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    iget-object p0, p0, Lcom/xiaomi/push/f;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 49
    .line 50
    invoke-static {p0}, Ll/mtq0;->v(Landroid/content/Context;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    invoke-virtual {v0, p0}, Lcom/xiaomi/push/ej;->c(I)Lcom/xiaomi/push/ej;

    .line 55
    .line 56
    .line 57
    :cond_0
    invoke-static {}, Lcom/xiaomi/push/h;->f()Lcom/xiaomi/push/h;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/h;->i(Lcom/xiaomi/push/ej;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .line 63
    .line 64
    :catch_0
    return-void
.end method

.method public static i()[B
    .locals 1

    .line 1
    invoke-static {}, Lcom/xiaomi/push/h;->f()Lcom/xiaomi/push/h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/xiaomi/push/h;->c()Lcom/xiaomi/push/ek;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {v0}, Lcom/xiaomi/push/m;->e(Lcom/xiaomi/push/hq;)[B

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    return-object v0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    return-object v0
.end method

.method public static j()V
    .locals 4

    .line 1
    sget v0, Lcom/xiaomi/push/i;->a:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, -0x1

    .line 5
    const/4 v3, 0x0

    .line 6
    invoke-static {v3, v0, v1, v2}, Lcom/xiaomi/push/i;->e(IILjava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static k(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 2

    .line 1
    :try_start_0
    invoke-static {p1}, Lcom/xiaomi/push/e;->e(Ljava/lang/Exception;)Lcom/xiaomi/push/e$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Lcom/xiaomi/push/h;->f()Lcom/xiaomi/push/h;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/xiaomi/push/h;->a()Lcom/xiaomi/push/ej;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p1, Lcom/xiaomi/push/e$a;->a:Lcom/xiaomi/push/ei;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/xiaomi/push/ei;->a()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/ej;->a(I)Lcom/xiaomi/push/ej;

    .line 20
    .line 21
    .line 22
    iget-object p1, p1, Lcom/xiaomi/push/e$a;->b:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/ej;->c(Ljava/lang/String;)Lcom/xiaomi/push/ej;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p0}, Lcom/xiaomi/push/ej;->b(Ljava/lang/String;)Lcom/xiaomi/push/ej;

    .line 28
    .line 29
    .line 30
    invoke-static {}, Lcom/xiaomi/push/h;->e()Lcom/xiaomi/push/f;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    if-eqz p0, :cond_0

    .line 35
    .line 36
    invoke-static {}, Lcom/xiaomi/push/h;->e()Lcom/xiaomi/push/f;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    iget-object p0, p0, Lcom/xiaomi/push/f;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 41
    .line 42
    if-eqz p0, :cond_0

    .line 43
    .line 44
    invoke-static {}, Lcom/xiaomi/push/h;->e()Lcom/xiaomi/push/f;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    iget-object p0, p0, Lcom/xiaomi/push/f;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 49
    .line 50
    invoke-static {p0}, Ll/mtq0;->v(Landroid/content/Context;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    invoke-virtual {v0, p0}, Lcom/xiaomi/push/ej;->c(I)Lcom/xiaomi/push/ej;

    .line 55
    .line 56
    .line 57
    :cond_0
    invoke-static {}, Lcom/xiaomi/push/h;->f()Lcom/xiaomi/push/h;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/h;->i(Lcom/xiaomi/push/ej;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .line 63
    .line 64
    :catch_0
    return-void
.end method
