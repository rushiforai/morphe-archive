.class public Ll/krq0;
.super Ljava/lang/Object;


# static fields
.field private static a:Ljava/lang/Runnable;

.field private static b:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/krq0$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/krq0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/krq0;->a:Ljava/lang/Runnable;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    sput v0, Ll/krq0;->b:I

    .line 10
    .line 11
    return-void
.end method

.method public static a()V
    .locals 2

    .line 1
    const/16 v0, 0x28

    .line 2
    .line 3
    sput v0, Ll/krq0;->b:I

    .line 4
    .line 5
    invoke-static {}, Ll/c5r0;->b()Ll/r5r0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Ll/krq0;->a:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/r5r0;->e(Ljava/lang/Runnable;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static b()V
    .locals 1

    .line 1
    invoke-static {}, Ll/f4r0;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/f4r0;->f()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-static {}, Ll/n0r0;->i()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Ll/l5r0;->c(Landroid/content/Context;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-static {v0}, Ll/f4r0;->d(Z)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-static {}, Ll/krq0;->g()V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public static synthetic c()Ljava/lang/Runnable;
    .locals 1

    .line 1
    sget-object v0, Ll/krq0;->a:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic d()V
    .locals 0

    .line 1
    invoke-static {}, Ll/krq0;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e()I
    .locals 1

    .line 1
    sget v0, Ll/krq0;->b:I

    .line 2
    .line 3
    return v0
.end method

.method private static f()[B
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-static {}, Ll/n0r0;->k()Ll/ow5;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    invoke-virtual {v1}, Ll/ow5;->b()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {}, Ll/vuq0;->c()Lorg/json/JSONArray;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-static {v1, v0, v2}, Lcom/apm/lite/j/e;->l(Ljava/lang/String;Ljava/util/Map;[B)[B

    .line 23
    .line 24
    .line 25
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    return-object v0

    .line 27
    :catchall_0
    move-exception v1

    .line 28
    invoke-static {v1}, Ll/q5r0;->f(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    return-object v0
.end method

.method private static declared-synchronized g()V
    .locals 8

    .line 1
    const-string v0, "after fetchApmConfig net "

    .line 2
    .line 3
    const-class v1, Ll/krq0;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    sget v2, Ll/krq0;->b:I

    .line 7
    .line 8
    const/4 v3, 0x1

    .line 9
    if-lez v2, :cond_0

    .line 10
    .line 11
    sub-int/2addr v2, v3

    .line 12
    sput v2, Ll/krq0;->b:I

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception v0

    .line 16
    goto :goto_4

    .line 17
    :cond_0
    :goto_0
    const-string v2, "try fetchApmConfig"

    .line 18
    .line 19
    invoke-static {v2}, Ll/q5r0;->a(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/n0r0;->i()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-static {v2}, Ll/lrq0;->j(Landroid/content/Context;)Z

    .line 27
    .line 28
    .line 29
    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    const/4 v4, 0x0

    .line 31
    if-eqz v2, :cond_3

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    :try_start_1
    invoke-static {}, Ll/krq0;->f()[B

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    if-eqz v5, :cond_1

    .line 39
    .line 40
    new-instance v6, Lorg/json/JSONObject;

    .line 41
    .line 42
    new-instance v7, Ljava/lang/String;

    .line 43
    .line 44
    invoke-direct {v7, v5}, Ljava/lang/String;-><init>([B)V

    .line 45
    .line 46
    .line 47
    invoke-direct {v6, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    const-string v5, "data"

    .line 51
    .line 52
    invoke-virtual {v6, v5}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 53
    .line 54
    .line 55
    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 56
    goto :goto_1

    .line 57
    :catchall_1
    move-exception v5

    .line 58
    :try_start_2
    const-string v6, "npth"

    .line 59
    .line 60
    invoke-static {v6, v5}, Ll/q5r0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    :goto_1
    new-instance v5, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {v0}, Ll/q5r0;->a(Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    if-eqz v2, :cond_2

    .line 79
    .line 80
    invoke-static {v2, v3}, Ll/nrq0;->f(Lorg/json/JSONArray;Z)V

    .line 81
    .line 82
    .line 83
    :goto_2
    sput v4, Ll/krq0;->b:I

    .line 84
    .line 85
    goto :goto_3

    .line 86
    :cond_2
    sget v0, Ll/krq0;->b:I

    .line 87
    .line 88
    add-int/lit8 v0, v0, -0xa

    .line 89
    .line 90
    sput v0, Ll/krq0;->b:I

    .line 91
    .line 92
    goto :goto_3

    .line 93
    :cond_3
    invoke-static {}, Ll/f4r0;->f()V

    .line 94
    .line 95
    .line 96
    invoke-static {}, Ll/f4r0;->c()Z

    .line 97
    .line 98
    .line 99
    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 100
    if-eqz v0, :cond_4

    .line 101
    .line 102
    goto :goto_2

    .line 103
    :cond_4
    :goto_3
    monitor-exit v1

    .line 104
    return-void

    .line 105
    :goto_4
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 106
    throw v0
.end method
