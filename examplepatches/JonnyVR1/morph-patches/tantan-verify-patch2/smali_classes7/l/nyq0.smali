.class public Ll/nyq0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static volatile b:Ll/nyq0;


# instance fields
.field private a:Landroid/content/Context;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/nyq0;->a:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method

.method public static a(I)I
    .locals 1

    .line 1
    const/16 v0, 0x3c

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static b(Landroid/content/Context;)Ll/nyq0;
    .locals 2

    .line 1
    sget-object v0, Ll/nyq0;->b:Ll/nyq0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/nyq0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/nyq0;->b:Ll/nyq0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/nyq0;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/nyq0;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/nyq0;->b:Ll/nyq0;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0

    .line 26
    :cond_1
    :goto_2
    sget-object p0, Ll/nyq0;->b:Ll/nyq0;

    .line 27
    .line 28
    return-object p0
.end method

.method private d(Lcom/xiaomi/push/service/ah;Ll/tsq0;Z)V
    .locals 2

    .line 1
    sget-object v0, Lcom/xiaomi/push/gk;->a:Lcom/xiaomi/push/gk;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/xiaomi/push/gk;->a()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {p1, v0, v1}, Lcom/xiaomi/push/service/ah;->a(IZ)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    new-instance v0, Ll/dzq0;

    .line 15
    .line 16
    iget-object p0, p0, Ll/nyq0;->a:Landroid/content/Context;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ll/dzq0;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    if-eqz p3, :cond_0

    .line 22
    .line 23
    sget-object p0, Lcom/xiaomi/push/gk;->b:Lcom/xiaomi/push/gk;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/xiaomi/push/gk;->a()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    const p3, 0x15180

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, p0, p3}, Lcom/xiaomi/push/service/ah;->a(II)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    invoke-static {p0}, Ll/nyq0;->a(I)I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    invoke-virtual {p2, v0, p0}, Ll/tsq0;->k(Ll/tsq0$c;I)Z

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    invoke-virtual {p2, v0}, Ll/tsq0;->j(Ll/tsq0$c;)Z

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public static synthetic e(Ll/nyq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/nyq0;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private f()Z
    .locals 6

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/nyq0;->a:Landroid/content/Context;

    .line 2
    .line 3
    instance-of v1, v0, Landroid/app/Application;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Landroid/app/Application;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Landroid/app/Application;

    .line 15
    .line 16
    :goto_0
    new-instance v1, Ll/hyq0;

    .line 17
    .line 18
    iget-object p0, p0, Ll/nyq0;->a:Landroid/content/Context;

    .line 19
    .line 20
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 21
    .line 22
    .line 23
    move-result-wide v2

    .line 24
    const-wide/16 v4, 0x3e8

    .line 25
    .line 26
    div-long/2addr v2, v4

    .line 27
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-direct {v1, p0, v2}, Ll/hyq0;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :catch_0
    move-exception p0

    .line 40
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method private g()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/nyq0;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tsq0;->f(Landroid/content/Context;)Ll/tsq0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/nyq0;->a:Landroid/content/Context;

    .line 8
    .line 9
    invoke-static {v1}, Lcom/xiaomi/push/service/ah;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/ah;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, p0, Ll/nyq0;->a:Landroid/content/Context;

    .line 14
    .line 15
    const-string v3, "mipush_extra"

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 23
    .line 24
    .line 25
    move-result-wide v5

    .line 26
    const-string v3, "first_try_ts"

    .line 27
    .line 28
    invoke-interface {v2, v3, v5, v6}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 29
    .line 30
    .line 31
    move-result-wide v7

    .line 32
    cmp-long v9, v7, v5

    .line 33
    .line 34
    if-nez v9, :cond_0

    .line 35
    .line 36
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-interface {v2, v3, v5, v6}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 45
    .line 46
    .line 47
    :cond_0
    sub-long/2addr v5, v7

    .line 48
    invoke-static {v5, v6}, Ljava/lang/Math;->abs(J)J

    .line 49
    .line 50
    .line 51
    move-result-wide v2

    .line 52
    const-wide/32 v5, 0xa4cb800

    .line 53
    .line 54
    .line 55
    cmp-long v2, v2, v5

    .line 56
    .line 57
    if-gez v2, :cond_1

    .line 58
    .line 59
    return-void

    .line 60
    :cond_1
    invoke-direct {p0, v1, v0, v4}, Ll/nyq0;->d(Lcom/xiaomi/push/service/ah;Ll/tsq0;Z)V

    .line 61
    .line 62
    .line 63
    sget-object v2, Lcom/xiaomi/push/gk;->aI:Lcom/xiaomi/push/gk;

    .line 64
    .line 65
    invoke-virtual {v2}, Lcom/xiaomi/push/gk;->a()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    const/4 v3, 0x1

    .line 70
    invoke-virtual {v1, v2, v3}, Lcom/xiaomi/push/service/ah;->a(IZ)Z

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    if-eqz v2, :cond_2

    .line 75
    .line 76
    sget-object v2, Lcom/xiaomi/push/gk;->aJ:Lcom/xiaomi/push/gk;

    .line 77
    .line 78
    invoke-virtual {v2}, Lcom/xiaomi/push/gk;->a()I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    const v5, 0x15180

    .line 83
    .line 84
    .line 85
    invoke-virtual {v1, v2, v5}, Lcom/xiaomi/push/service/ah;->a(II)I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    invoke-static {v2}, Ll/nyq0;->a(I)I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    new-instance v5, Ll/czq0;

    .line 94
    .line 95
    iget-object v6, p0, Ll/nyq0;->a:Landroid/content/Context;

    .line 96
    .line 97
    invoke-direct {v5, v6, v2}, Ll/czq0;-><init>(Landroid/content/Context;I)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, v5, v2, v4}, Ll/tsq0;->l(Ll/tsq0$c;II)Z

    .line 101
    .line 102
    .line 103
    :cond_2
    iget-object v2, p0, Ll/nyq0;->a:Landroid/content/Context;

    .line 104
    .line 105
    invoke-static {v2}, Ll/l4r0;->j(Landroid/content/Context;)Z

    .line 106
    .line 107
    .line 108
    sget-object v2, Lcom/xiaomi/push/gk;->ap:Lcom/xiaomi/push/gk;

    .line 109
    .line 110
    invoke-virtual {v2}, Lcom/xiaomi/push/gk;->a()I

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    invoke-virtual {v1, v2, v4}, Lcom/xiaomi/push/service/ah;->a(IZ)Z

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    if-eqz v2, :cond_3

    .line 119
    .line 120
    invoke-direct {p0}, Ll/nyq0;->f()Z

    .line 121
    .line 122
    .line 123
    :cond_3
    invoke-direct {p0, v1, v0, v3}, Ll/nyq0;->d(Lcom/xiaomi/push/service/ah;Ll/tsq0;Z)V

    .line 124
    .line 125
    .line 126
    return-void
.end method


# virtual methods
.method public c()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nyq0;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tsq0;->f(Landroid/content/Context;)Ll/tsq0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/nyq0$a;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/nyq0$a;-><init>(Ll/nyq0;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/tsq0;->g(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
