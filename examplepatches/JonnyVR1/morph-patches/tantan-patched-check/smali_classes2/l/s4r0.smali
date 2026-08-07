.class public Ll/s4r0;
.super Ljava/lang/Object;


# static fields
.field private static a:Z

.field private static b:Z

.field private static c:Z

.field private static d:Z

.field private static e:Ll/owq0;

.field private static volatile f:Z

.field private static g:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/owq0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/owq0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/s4r0;->e:Ll/owq0;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    sput-boolean v0, Ll/s4r0;->f:Z

    .line 10
    .line 11
    sput-boolean v0, Ll/s4r0;->g:Z

    .line 12
    .line 13
    return-void
.end method

.method public static a()Ll/owq0;
    .locals 1

    .line 1
    sget-object v0, Ll/s4r0;->e:Ll/owq0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static declared-synchronized b(Landroid/app/Application;Landroid/content/Context;ZZZZJ)V
    .locals 4

    .line 1
    const-string p6, "Npth.init takes "

    .line 2
    .line 3
    const-class p7, Ll/s4r0;

    .line 4
    .line 5
    monitor-enter p7

    .line 6
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    sget-boolean v2, Ll/s4r0;->a:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    monitor-exit p7

    .line 15
    return-void

    .line 16
    :cond_0
    const/4 v2, 0x1

    .line 17
    :try_start_1
    sput-boolean v2, Ll/s4r0;->a:Z

    .line 18
    .line 19
    if-eqz p1, :cond_9

    .line 20
    .line 21
    if-eqz p0, :cond_9

    .line 22
    .line 23
    invoke-static {}, Ll/n0r0;->t()Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_2

    .line 28
    .line 29
    invoke-static {p0}, Ll/s4r0;->d(Landroid/content/Context;)Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-nez v3, :cond_1

    .line 34
    .line 35
    invoke-static {p0}, Ll/s4r0;->e(Landroid/content/Context;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-nez v3, :cond_1

    .line 40
    .line 41
    invoke-static {}, Ll/s4r0;->o()Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-eqz v3, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catchall_0
    move-exception p0

    .line 49
    goto/16 :goto_1

    .line 50
    .line 51
    :cond_1
    :goto_0
    const-string p0, "apminsight"

    .line 52
    .line 53
    const-string p1, "Inner npth checked."

    .line 54
    .line 55
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    .line 57
    .line 58
    monitor-exit p7

    .line 59
    return-void

    .line 60
    :cond_2
    :try_start_2
    invoke-static {p0, p1}, Ll/n0r0;->c(Landroid/app/Application;Landroid/content/Context;)V

    .line 61
    .line 62
    .line 63
    if-nez p2, :cond_3

    .line 64
    .line 65
    if-eqz p3, :cond_6

    .line 66
    .line 67
    :cond_3
    invoke-static {}, Ll/frq0;->e()Ll/frq0;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    if-eqz p3, :cond_4

    .line 72
    .line 73
    new-instance p3, Ll/duq0;

    .line 74
    .line 75
    invoke-direct {p3, p1}, Ll/duq0;-><init>(Landroid/content/Context;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0, p3}, Ll/frq0;->j(Ll/iwq0;)V

    .line 79
    .line 80
    .line 81
    :cond_4
    if-eqz p2, :cond_5

    .line 82
    .line 83
    new-instance p2, Ll/sxq0;

    .line 84
    .line 85
    invoke-direct {p2, p1}, Ll/sxq0;-><init>(Landroid/content/Context;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, p2}, Ll/frq0;->m(Ll/iwq0;)V

    .line 89
    .line 90
    .line 91
    :cond_5
    sput-boolean v2, Ll/s4r0;->b:Z

    .line 92
    .line 93
    :cond_6
    invoke-static {}, Lcom/apm/lite/nativecrash/NativeImpl;->p()Z

    .line 94
    .line 95
    .line 96
    if-eqz p4, :cond_7

    .line 97
    .line 98
    invoke-static {p1}, Lcom/apm/lite/nativecrash/NativeImpl;->w(Landroid/content/Context;)Z

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    sput-boolean p0, Ll/s4r0;->d:Z

    .line 103
    .line 104
    :cond_7
    if-eqz p5, :cond_8

    .line 105
    .line 106
    invoke-static {}, Ll/n0r0;->k()Ll/ow5;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {p0}, Ll/ow5;->p()Z

    .line 111
    .line 112
    .line 113
    move-result p0

    .line 114
    if-eqz p0, :cond_8

    .line 115
    .line 116
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    if-ne p0, p1, :cond_8

    .line 125
    .line 126
    sput-boolean v2, Ll/s4r0;->f:Z

    .line 127
    .line 128
    invoke-static {}, Lcom/apm/lite/nativecrash/NativeImpl;->s()V

    .line 129
    .line 130
    .line 131
    :cond_8
    invoke-static {p5}, Ll/s4r0;->i(Z)V

    .line 132
    .line 133
    .line 134
    new-instance p0, Ljava/lang/StringBuilder;

    .line 135
    .line 136
    invoke-direct {p0, p6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 140
    .line 141
    .line 142
    move-result-wide p1

    .line 143
    sub-long/2addr p1, v0

    .line 144
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    const-string p1, " ms."

    .line 148
    .line 149
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-static {p0}, Ll/q5r0;->a(Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 157
    .line 158
    .line 159
    monitor-exit p7

    .line 160
    return-void

    .line 161
    :cond_9
    :try_start_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 162
    .line 163
    const-string p1, "context or Application must be not null."

    .line 164
    .line 165
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    throw p0

    .line 169
    :goto_1
    monitor-exit p7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 170
    throw p0
.end method

.method public static declared-synchronized c(Landroid/content/Context;ZZZZJ)V
    .locals 10

    .line 1
    const-class v1, Ll/s4r0;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    invoke-static {}, Ll/n0r0;->j()Landroid/app/Application;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-static {}, Ll/n0r0;->j()Landroid/app/Application;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :cond_0
    :goto_0
    move-object v3, p0

    .line 15
    move v4, p1

    .line 16
    move v5, p2

    .line 17
    move v6, p3

    .line 18
    move v7, p4

    .line 19
    move-wide v8, p5

    .line 20
    move-object v2, v0

    .line 21
    goto :goto_1

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    move-object p0, v0

    .line 24
    goto :goto_2

    .line 25
    :cond_1
    instance-of v0, p0, Landroid/app/Application;

    .line 26
    .line 27
    if-eqz v0, :cond_3

    .line 28
    .line 29
    move-object v0, p0

    .line 30
    check-cast v0, Landroid/app/Application;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    if-eqz v2, :cond_2

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 40
    .line 41
    const-string p1, "Application not attach."

    .line 42
    .line 43
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    throw p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    :cond_3
    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Landroid/app/Application;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 52
    .line 53
    if-eqz v0, :cond_4

    .line 54
    .line 55
    :try_start_2
    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    if-eqz v2, :cond_0

    .line 60
    .line 61
    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    goto :goto_0

    .line 66
    :goto_1
    invoke-static/range {v2 .. v9}, Ll/s4r0;->b(Landroid/app/Application;Landroid/content/Context;ZZZZJ)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 67
    .line 68
    .line 69
    monitor-exit v1

    .line 70
    return-void

    .line 71
    :cond_4
    :try_start_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 72
    .line 73
    const-string p1, "no Application."

    .line 74
    .line 75
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    throw p0

    .line 79
    :catchall_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 80
    .line 81
    const-string p1, "no Application."

    .line 82
    .line 83
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    throw p0

    .line 87
    :goto_2
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 88
    throw p0
.end method

.method private static d(Landroid/content/Context;)Z
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-static {p0}, Ll/j5r0;->E(Landroid/content/Context;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v1, "npth"

    .line 8
    .line 9
    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 13
    .line 14
    .line 15
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    return p0

    .line 17
    :catchall_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method private static e(Landroid/content/Context;)Z
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, "libnpth.so"

    .line 10
    .line 11
    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 15
    .line 16
    .line 17
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    return p0

    .line 19
    :catchall_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public static synthetic f(Z)Z
    .locals 0

    .line 1
    sput-boolean p0, Ll/s4r0;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic g(Z)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/s4r0;->j(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static h()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/s4r0;->a:Z

    .line 2
    .line 3
    return v0
.end method

.method private static i(Z)V
    .locals 4

    .line 1
    invoke-static {}, Ll/c5r0;->b()Ll/r5r0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/s4r0$a;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/s4r0$a;-><init>(Z)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v2, 0x0

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2, v3}, Ll/r5r0;->f(Ljava/lang/Runnable;J)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private static j(Z)V
    .locals 2

    .line 1
    invoke-static {}, Ll/n0r0;->i()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/k0r0;->d()Ll/k0r0;

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/apm/lite/nativecrash/NativeImpl;->c()I

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/dsq0;->a()Ll/dsq0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1, v0}, Ll/dsq0;->b(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0}, Ll/h3r0;->a(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    invoke-static {v0}, Ll/vxq0;->a(Landroid/content/Context;)Ll/vxq0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ll/vxq0;->d()V

    .line 28
    .line 29
    .line 30
    sput-boolean p0, Ll/s4r0;->c:Z

    .line 31
    .line 32
    invoke-static {}, Ll/n0r0;->k()Ll/ow5;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Ll/ow5;->p()Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_0

    .line 41
    .line 42
    invoke-static {}, Lcom/apm/lite/nativecrash/NativeImpl;->x()V

    .line 43
    .line 44
    .line 45
    :cond_0
    invoke-static {}, Ll/f4r0;->g()V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Lcom/apm/lite/nativecrash/NativeImpl;->m()V

    .line 49
    .line 50
    .line 51
    const-string p0, "afterNpthInitAsync"

    .line 52
    .line 53
    const-string v0, "noValue"

    .line 54
    .line 55
    invoke-static {p0, v0}, Ll/h5r0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public static k()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/frq0;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Lcom/apm/lite/nativecrash/NativeImpl;->k()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    return v0

    .line 16
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 17
    return v0
.end method

.method public static l()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/frq0;->t()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Lcom/apm/lite/nativecrash/NativeImpl;->k()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    return v0

    .line 16
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 17
    return v0
.end method

.method public static m()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/s4r0;->g:Z

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic n()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/s4r0;->f:Z

    .line 2
    .line 3
    return v0
.end method

.method private static o()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return v0
.end method
