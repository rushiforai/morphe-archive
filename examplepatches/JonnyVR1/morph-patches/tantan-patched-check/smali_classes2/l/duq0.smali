.class public Ll/duq0;
.super Ljava/lang/Object;

# interfaces
.implements Ll/iwq0;


# instance fields
.field private a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/duq0;->a:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic b(Ll/duq0;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/duq0;->a:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method private declared-synchronized c(JLjava/lang/Thread;Ljava/lang/Throwable;Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Z)V
    .locals 13

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v10, Ljava/io/File;

    .line 3
    .line 4
    iget-object v0, p0, Ll/duq0;->a:Landroid/content/Context;

    .line 5
    .line 6
    invoke-static {v0}, Ll/j5r0;->b(Landroid/content/Context;)Ljava/io/File;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    move-object/from16 v9, p5

    .line 11
    .line 12
    invoke-direct {v10, v0, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/frq0;->e()Ll/frq0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v10}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ll/frq0;->g(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v10}, Ljava/io/File;->mkdirs()Z

    .line 27
    .line 28
    .line 29
    invoke-static {v10}, Ll/r3r0;->F(Ljava/io/File;)V

    .line 30
    .line 31
    .line 32
    invoke-static/range {p4 .. p4}, Ll/d6r0;->w(Ljava/lang/Throwable;)Z

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    invoke-static {}, Ll/k0r0;->d()Ll/k0r0;

    .line 37
    .line 38
    .line 39
    move-result-object v11

    .line 40
    sget-object v12, Lcom/apm/lite/CrashType;->LAUNCH:Lcom/apm/lite/CrashType;

    .line 41
    .line 42
    new-instance v0, Ll/duq0$a;

    .line 43
    .line 44
    move-object v1, p0

    .line 45
    move-wide v4, p1

    .line 46
    move-object/from16 v8, p3

    .line 47
    .line 48
    move-object/from16 v2, p4

    .line 49
    .line 50
    move-object/from16 v6, p7

    .line 51
    .line 52
    move/from16 v7, p8

    .line 53
    .line 54
    invoke-direct/range {v0 .. v10}, Ll/duq0$a;-><init>(Ll/duq0;Ljava/lang/Throwable;ZJLjava/lang/String;ZLjava/lang/Thread;Ljava/lang/String;Ljava/io/File;)V

    .line 55
    .line 56
    .line 57
    const/4 v1, 0x1

    .line 58
    const/4 v2, 0x0

    .line 59
    invoke-virtual {v11, v12, v2, v0, v1}, Ll/k0r0;->b(Lcom/apm/lite/CrashType;Ll/gsq0;Ll/bwq0$a;Z)Ll/gsq0;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 64
    .line 65
    .line 66
    move-result-wide v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 67
    sub-long/2addr v1, p1

    .line 68
    :try_start_1
    const-string p1, "crash_type"

    .line 69
    .line 70
    const-string p2, "normal"

    .line 71
    .line 72
    invoke-virtual {v0, p1, p2}, Ll/gsq0;->c(Ljava/lang/String;Ljava/lang/String;)Ll/gsq0;

    .line 73
    .line 74
    .line 75
    const-string p1, "crash_cost"

    .line 76
    .line 77
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    invoke-virtual {v0, p1, p2}, Ll/gsq0;->q(Ljava/lang/String;Ljava/lang/String;)Ll/gsq0;

    .line 82
    .line 83
    .line 84
    const-string p1, "crash_cost"

    .line 85
    .line 86
    const-wide/16 v3, 0x3e8

    .line 87
    .line 88
    div-long/2addr v1, v3

    .line 89
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    invoke-virtual {v0, p1, p2}, Ll/gsq0;->c(Ljava/lang/String;Ljava/lang/String;)Ll/gsq0;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :catchall_0
    move-exception v0

    .line 98
    move-object p1, v0

    .line 99
    :try_start_2
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 100
    .line 101
    .line 102
    const-string p2, "NPTH_CATCH"

    .line 103
    .line 104
    invoke-static {p2, p1}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 105
    .line 106
    .line 107
    :goto_0
    const/4 p1, 0x4

    .line 108
    invoke-static {p1}, Ll/u5r0;->c(I)Z

    .line 109
    .line 110
    .line 111
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 112
    if-eqz p1, :cond_0

    .line 113
    .line 114
    monitor-exit p0

    .line 115
    return-void

    .line 116
    :cond_0
    :try_start_3
    invoke-static {}, Ll/b350;->d()Z

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    if-nez p1, :cond_2

    .line 121
    .line 122
    const/16 p1, 0x800

    .line 123
    .line 124
    invoke-static {p1}, Ll/u5r0;->c(I)Z

    .line 125
    .line 126
    .line 127
    move-result p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 128
    if-eqz p1, :cond_1

    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_1
    monitor-exit p0

    .line 132
    return-void

    .line 133
    :catchall_1
    move-exception v0

    .line 134
    move-object p1, v0

    .line 135
    goto :goto_2

    .line 136
    :cond_2
    :goto_1
    monitor-exit p0

    .line 137
    return-void

    .line 138
    :goto_2
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 139
    throw p1
.end method


# virtual methods
.method public a(JLjava/lang/Thread;Ljava/lang/Throwable;Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p8}, Ll/duq0;->c(JLjava/lang/Thread;Ljava/lang/Throwable;Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public a(Ljava/lang/Throwable;)Z
    .locals 0

    .line 5
    const/4 p0, 0x1

    return p0
.end method
