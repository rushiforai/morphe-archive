.class public final Ll/gyi0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/gyi0$d;,
        Ll/gyi0$f;,
        Ll/gyi0$b;,
        Ll/gyi0$c;,
        Ll/gyi0$e;
    }
.end annotation


# static fields
.field private static a:Ljava/lang/String; = "ThreadUtils"

.field private static b:Ll/gyi0$e;

.field private static c:Ll/gyi0$e;

.field private static d:Ll/gyi0$e;

.field private static e:Ll/gyi0$e;

.field private static f:Ll/gyi0$e;

.field private static final g:Ljava/util/concurrent/TimeUnit;

.field private static h:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 2
    .line 3
    sput-object v0, Ll/gyi0;->g:Ljava/util/concurrent/TimeUnit;

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(I)Ljava/util/concurrent/ScheduledThreadPoolExecutor;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/gyi0;->b(I)Ll/gyi0$e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/gyi0$e;->a()Ll/gyi0$d;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private static declared-synchronized b(I)Ll/gyi0$e;
    .locals 9

    .line 1
    const-string v0, "type="

    .line 2
    .line 3
    const-class v1, Ll/gyi0;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eq p0, v2, :cond_9

    .line 8
    .line 9
    const/4 v2, 0x2

    .line 10
    if-eq p0, v2, :cond_6

    .line 11
    .line 12
    const/4 v2, 0x3

    .line 13
    if-eq p0, v2, :cond_4

    .line 14
    .line 15
    const/4 v2, 0x4

    .line 16
    if-eq p0, v2, :cond_2

    .line 17
    .line 18
    const/4 v2, 0x5

    .line 19
    if-ne p0, v2, :cond_1

    .line 20
    .line 21
    :try_start_0
    sget-object v0, Ll/gyi0;->f:Ll/gyi0$e;

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    new-instance v2, Ll/gyi0$e;

    .line 26
    .line 27
    sget-object v8, Ll/gyi0;->g:Ljava/util/concurrent/TimeUnit;

    .line 28
    .line 29
    const/4 v4, 0x2

    .line 30
    const/4 v5, 0x2

    .line 31
    const-wide/16 v6, 0x3c

    .line 32
    .line 33
    move v3, p0

    .line 34
    invoke-direct/range {v2 .. v8}, Ll/gyi0$e;-><init>(IIIJLjava/util/concurrent/TimeUnit;)V

    .line 35
    .line 36
    .line 37
    sput-object v2, Ll/gyi0;->f:Ll/gyi0$e;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception v0

    .line 41
    move-object p0, v0

    .line 42
    goto/16 :goto_2

    .line 43
    .line 44
    :cond_0
    :goto_0
    sget-object p0, Ll/gyi0;->f:Ll/gyi0$e;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .line 46
    monitor-exit v1

    .line 47
    return-object p0

    .line 48
    :cond_1
    move v3, p0

    .line 49
    :try_start_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 50
    .line 51
    new-instance v2, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string v0, " not recognized"

    .line 60
    .line 61
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    throw p0

    .line 72
    :cond_2
    move v3, p0

    .line 73
    sget-object p0, Ll/gyi0;->e:Ll/gyi0$e;

    .line 74
    .line 75
    if-nez p0, :cond_3

    .line 76
    .line 77
    new-instance v2, Ll/gyi0$e;

    .line 78
    .line 79
    sget-object v8, Ll/gyi0;->g:Ljava/util/concurrent/TimeUnit;

    .line 80
    .line 81
    const/4 v4, 0x1

    .line 82
    const/4 v5, 0x1

    .line 83
    const-wide/16 v6, 0x3c

    .line 84
    .line 85
    invoke-direct/range {v2 .. v8}, Ll/gyi0$e;-><init>(IIIJLjava/util/concurrent/TimeUnit;)V

    .line 86
    .line 87
    .line 88
    sput-object v2, Ll/gyi0;->e:Ll/gyi0$e;

    .line 89
    .line 90
    :cond_3
    sget-object p0, Ll/gyi0;->e:Ll/gyi0$e;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 91
    .line 92
    monitor-exit v1

    .line 93
    return-object p0

    .line 94
    :cond_4
    move v3, p0

    .line 95
    :try_start_2
    sget-object p0, Ll/gyi0;->c:Ll/gyi0$e;

    .line 96
    .line 97
    if-nez p0, :cond_5

    .line 98
    .line 99
    new-instance v2, Ll/gyi0$e;

    .line 100
    .line 101
    sget-object v8, Ll/gyi0;->g:Ljava/util/concurrent/TimeUnit;

    .line 102
    .line 103
    const/4 v4, 0x3

    .line 104
    const/4 v5, 0x3

    .line 105
    const-wide/16 v6, 0x3c

    .line 106
    .line 107
    invoke-direct/range {v2 .. v8}, Ll/gyi0$e;-><init>(IIIJLjava/util/concurrent/TimeUnit;)V

    .line 108
    .line 109
    .line 110
    sput-object v2, Ll/gyi0;->c:Ll/gyi0$e;

    .line 111
    .line 112
    :cond_5
    sget-object p0, Ll/gyi0;->c:Ll/gyi0$e;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 113
    .line 114
    monitor-exit v1

    .line 115
    return-object p0

    .line 116
    :cond_6
    move v3, p0

    .line 117
    :try_start_3
    sget-object p0, Ll/gyi0;->d:Ll/gyi0$e;

    .line 118
    .line 119
    if-nez p0, :cond_8

    .line 120
    .line 121
    sget-object p0, Ll/l3d0;->g:Landroid/content/Context;

    .line 122
    .line 123
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-static {}, Ll/gyi0;->e()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    if-eqz p0, :cond_7

    .line 136
    .line 137
    new-instance v2, Ll/gyi0$e;

    .line 138
    .line 139
    sget-object v8, Ll/gyi0;->g:Ljava/util/concurrent/TimeUnit;

    .line 140
    .line 141
    const/16 v4, 0xa

    .line 142
    .line 143
    const/16 v5, 0xa

    .line 144
    .line 145
    const-wide/16 v6, 0x78

    .line 146
    .line 147
    invoke-direct/range {v2 .. v8}, Ll/gyi0$e;-><init>(IIIJLjava/util/concurrent/TimeUnit;)V

    .line 148
    .line 149
    .line 150
    sput-object v2, Ll/gyi0;->d:Ll/gyi0$e;

    .line 151
    .line 152
    goto :goto_1

    .line 153
    :cond_7
    new-instance v2, Ll/gyi0$e;

    .line 154
    .line 155
    sget-object v8, Ll/gyi0;->g:Ljava/util/concurrent/TimeUnit;

    .line 156
    .line 157
    const/4 v4, 0x5

    .line 158
    const/4 v5, 0x5

    .line 159
    const-wide/16 v6, 0x3c

    .line 160
    .line 161
    invoke-direct/range {v2 .. v8}, Ll/gyi0$e;-><init>(IIIJLjava/util/concurrent/TimeUnit;)V

    .line 162
    .line 163
    .line 164
    sput-object v2, Ll/gyi0;->d:Ll/gyi0$e;

    .line 165
    .line 166
    :cond_8
    :goto_1
    sget-object p0, Ll/gyi0;->d:Ll/gyi0$e;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 167
    .line 168
    monitor-exit v1

    .line 169
    return-object p0

    .line 170
    :cond_9
    move v3, p0

    .line 171
    :try_start_4
    sget-object p0, Ll/gyi0;->b:Ll/gyi0$e;

    .line 172
    .line 173
    if-nez p0, :cond_a

    .line 174
    .line 175
    new-instance v2, Ll/gyi0$e;

    .line 176
    .line 177
    sget-object v8, Ll/gyi0;->g:Ljava/util/concurrent/TimeUnit;

    .line 178
    .line 179
    const/4 v4, 0x2

    .line 180
    const/4 v5, 0x2

    .line 181
    const-wide/16 v6, 0x3c

    .line 182
    .line 183
    invoke-direct/range {v2 .. v8}, Ll/gyi0$e;-><init>(IIIJLjava/util/concurrent/TimeUnit;)V

    .line 184
    .line 185
    .line 186
    sput-object v2, Ll/gyi0;->b:Ll/gyi0$e;

    .line 187
    .line 188
    :cond_a
    sget-object p0, Ll/gyi0;->b:Ll/gyi0$e;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 189
    .line 190
    monitor-exit v1

    .line 191
    return-object p0

    .line 192
    :goto_2
    :try_start_5
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 193
    throw p0
.end method

.method public static synthetic c()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/gyi0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static d(ILjava/lang/Runnable;)V
    .locals 3

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    sget-object v2, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 4
    .line 5
    invoke-static {p0, p1, v0, v1, v2}, Ll/gyi0;->f(ILjava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static e()Ljava/lang/String;
    .locals 8

    .line 1
    sget-object v0, Ll/l3d0;->g:Landroid/content/Context;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    sget-object v0, Ll/gyi0;->h:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    sget-object v0, Ll/gyi0;->h:Ljava/lang/String;

    .line 16
    .line 17
    return-object v0

    .line 18
    :cond_1
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const-string v2, ""

    .line 23
    .line 24
    if-gtz v0, :cond_2

    .line 25
    .line 26
    return-object v2

    .line 27
    :cond_2
    sget-object v3, Ll/l3d0;->g:Landroid/content/Context;

    .line 28
    .line 29
    const-string v4, "activity"

    .line 30
    .line 31
    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    check-cast v3, Landroid/app/ActivityManager;

    .line 36
    .line 37
    :try_start_0
    invoke-virtual {v3}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    if-eqz v4, :cond_4

    .line 50
    .line 51
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    check-cast v4, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 56
    .line 57
    iget v5, v4, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    .line 59
    if-ne v5, v0, :cond_3

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :catch_0
    :cond_4
    move-object v4, v1

    .line 63
    :goto_0
    if-eqz v4, :cond_5

    .line 64
    .line 65
    iget-object v0, v4, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    .line 66
    .line 67
    return-object v0

    .line 68
    :cond_5
    const/16 v3, 0x80

    .line 69
    .line 70
    new-array v4, v3, [B

    .line 71
    .line 72
    :try_start_1
    new-instance v5, Ljava/io/FileInputStream;

    .line 73
    .line 74
    new-instance v6, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    const-string v7, "/proc/"

    .line 80
    .line 81
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v0, "/cmdline"

    .line 88
    .line 89
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-direct {v5, v0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 97
    .line 98
    .line 99
    :try_start_2
    invoke-virtual {v5, v4}, Ljava/io/FileInputStream;->read([B)I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-lez v0, :cond_9

    .line 104
    .line 105
    const/4 v1, 0x0

    .line 106
    move v6, v1

    .line 107
    :goto_1
    if-ge v6, v0, :cond_8

    .line 108
    .line 109
    aget-byte v7, v4, v6

    .line 110
    .line 111
    if-gt v7, v3, :cond_7

    .line 112
    .line 113
    if-gtz v7, :cond_6

    .line 114
    .line 115
    goto :goto_2

    .line 116
    :cond_6
    add-int/lit8 v6, v6, 0x1

    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_7
    :goto_2
    move v0, v6

    .line 120
    goto :goto_3

    .line 121
    :catchall_0
    move-exception v0

    .line 122
    move-object v1, v5

    .line 123
    goto :goto_6

    .line 124
    :catch_1
    move-exception v0

    .line 125
    move-object v1, v5

    .line 126
    goto :goto_4

    .line 127
    :cond_8
    :goto_3
    new-instance v3, Ljava/lang/String;

    .line 128
    .line 129
    invoke-direct {v3, v4, v1, v0}, Ljava/lang/String;-><init>([BII)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 130
    .line 131
    .line 132
    invoke-static {v5}, Ll/k1m;->b(Ljava/io/Closeable;)V

    .line 133
    .line 134
    .line 135
    return-object v3

    .line 136
    :cond_9
    invoke-static {v5}, Ll/k1m;->b(Ljava/io/Closeable;)V

    .line 137
    .line 138
    .line 139
    goto :goto_5

    .line 140
    :catchall_1
    move-exception v0

    .line 141
    goto :goto_6

    .line 142
    :catch_2
    move-exception v0

    .line 143
    :goto_4
    :try_start_3
    const-class v3, Ll/osw;

    .line 144
    .line 145
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    invoke-static {v3, v0}, Lcom/immomo/resdownloader/log/MLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 150
    .line 151
    .line 152
    invoke-static {v1}, Ll/k1m;->b(Ljava/io/Closeable;)V

    .line 153
    .line 154
    .line 155
    :goto_5
    return-object v2

    .line 156
    :goto_6
    invoke-static {v1}, Ll/k1m;->b(Ljava/io/Closeable;)V

    .line 157
    .line 158
    .line 159
    throw v0
.end method

.method public static f(ILjava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/Runnable;",
            "J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {p0}, Ll/gyi0;->a(I)Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1}, Ll/gyi0;->g(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1, p2, p3, p4}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string p0, "command is null"

    .line 17
    .line 18
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return-object p0
.end method

.method private static g(Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    return-object p0
.end method
