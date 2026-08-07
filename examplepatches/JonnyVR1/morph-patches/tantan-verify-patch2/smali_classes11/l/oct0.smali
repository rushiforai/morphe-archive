.class public final Ll/oct0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/xvw0;

.field public static final b:Ll/xvw0;

.field public static final c:Ll/xvw0;

.field public static final d:Ljava/util/concurrent/ScheduledExecutorService;

.field public static final e:Ll/xvw0;

.field public static final f:Ll/xvw0;


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 1
    invoke-static {}, Lcom/google/android/gms/common/util/ClientLibraryUtils;->isPackageSide()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "Default"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/tkw0;->a()Ll/qkw0;

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/kct0;

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ll/kct0;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0}, Ljava/util/concurrent/Executors;->newCachedThreadPool(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Ljava/util/concurrent/Executors;->unconfigurableExecutorService(Ljava/util/concurrent/ExecutorService;)Ljava/util/concurrent/ExecutorService;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move-object v0, v1

    .line 27
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 28
    .line 29
    new-instance v7, Ljava/util/concurrent/SynchronousQueue;

    .line 30
    .line 31
    invoke-direct {v7}, Ljava/util/concurrent/SynchronousQueue;-><init>()V

    .line 32
    .line 33
    .line 34
    new-instance v8, Ll/kct0;

    .line 35
    .line 36
    invoke-direct {v8, v0}, Ll/kct0;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const/4 v2, 0x2

    .line 40
    const v3, 0x7fffffff

    .line 41
    .line 42
    .line 43
    const-wide/16 v4, 0xa

    .line 44
    .line 45
    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 46
    .line 47
    invoke-direct/range {v1 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 48
    .line 49
    .line 50
    move-object v0, v1

    .line 51
    :goto_0
    new-instance v1, Ll/nct0;

    .line 52
    .line 53
    const/4 v2, 0x0

    .line 54
    invoke-direct {v1, v0, v2}, Ll/nct0;-><init>(Ljava/util/concurrent/Executor;Ll/mct0;)V

    .line 55
    .line 56
    .line 57
    sput-object v1, Ll/oct0;->a:Ll/xvw0;

    .line 58
    .line 59
    invoke-static {}, Lcom/google/android/gms/common/util/ClientLibraryUtils;->isPackageSide()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    const-string v1, "Loader"

    .line 64
    .line 65
    const/4 v3, 0x1

    .line 66
    if-eqz v0, :cond_1

    .line 67
    .line 68
    invoke-static {}, Ll/tkw0;->a()Ll/qkw0;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v4, Ll/kct0;

    .line 73
    .line 74
    invoke-direct {v4, v1}, Ll/kct0;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    const/4 v1, 0x5

    .line 78
    invoke-interface {v0, v1, v4, v3}, Ll/qkw0;->b(ILjava/util/concurrent/ThreadFactory;I)Ljava/util/concurrent/ExecutorService;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    goto :goto_1

    .line 83
    :cond_1
    new-instance v4, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 84
    .line 85
    new-instance v10, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 86
    .line 87
    invoke-direct {v10}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 88
    .line 89
    .line 90
    new-instance v11, Ll/kct0;

    .line 91
    .line 92
    invoke-direct {v11, v1}, Ll/kct0;-><init>(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    const/4 v5, 0x5

    .line 96
    const/4 v6, 0x5

    .line 97
    const-wide/16 v7, 0xa

    .line 98
    .line 99
    sget-object v9, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 100
    .line 101
    invoke-direct/range {v4 .. v11}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v4, v3}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 105
    .line 106
    .line 107
    move-object v0, v4

    .line 108
    :goto_1
    new-instance v1, Ll/nct0;

    .line 109
    .line 110
    invoke-direct {v1, v0, v2}, Ll/nct0;-><init>(Ljava/util/concurrent/Executor;Ll/mct0;)V

    .line 111
    .line 112
    .line 113
    sput-object v1, Ll/oct0;->b:Ll/xvw0;

    .line 114
    .line 115
    invoke-static {}, Lcom/google/android/gms/common/util/ClientLibraryUtils;->isPackageSide()Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    const-string v1, "Activeview"

    .line 120
    .line 121
    if-eqz v0, :cond_2

    .line 122
    .line 123
    invoke-static {}, Ll/tkw0;->a()Ll/qkw0;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    new-instance v4, Ll/kct0;

    .line 128
    .line 129
    invoke-direct {v4, v1}, Ll/kct0;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    invoke-interface {v0, v4, v3}, Ll/qkw0;->a(Ljava/util/concurrent/ThreadFactory;I)Ljava/util/concurrent/ExecutorService;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    goto :goto_2

    .line 137
    :cond_2
    new-instance v4, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 138
    .line 139
    new-instance v10, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 140
    .line 141
    invoke-direct {v10}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 142
    .line 143
    .line 144
    new-instance v11, Ll/kct0;

    .line 145
    .line 146
    invoke-direct {v11, v1}, Ll/kct0;-><init>(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    const/4 v5, 0x1

    .line 150
    const/4 v6, 0x1

    .line 151
    const-wide/16 v7, 0xa

    .line 152
    .line 153
    sget-object v9, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 154
    .line 155
    invoke-direct/range {v4 .. v11}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v4, v3}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 159
    .line 160
    .line 161
    move-object v0, v4

    .line 162
    :goto_2
    new-instance v1, Ll/nct0;

    .line 163
    .line 164
    invoke-direct {v1, v0, v2}, Ll/nct0;-><init>(Ljava/util/concurrent/Executor;Ll/mct0;)V

    .line 165
    .line 166
    .line 167
    sput-object v1, Ll/oct0;->c:Ll/xvw0;

    .line 168
    .line 169
    new-instance v0, Ll/jct0;

    .line 170
    .line 171
    new-instance v1, Ll/kct0;

    .line 172
    .line 173
    const-string v3, "Schedule"

    .line 174
    .line 175
    invoke-direct {v1, v3}, Ll/kct0;-><init>(Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    const/4 v3, 0x3

    .line 179
    invoke-direct {v0, v3, v1}, Ll/jct0;-><init>(ILjava/util/concurrent/ThreadFactory;)V

    .line 180
    .line 181
    .line 182
    sput-object v0, Ll/oct0;->d:Ljava/util/concurrent/ScheduledExecutorService;

    .line 183
    .line 184
    new-instance v0, Ll/lct0;

    .line 185
    .line 186
    invoke-direct {v0}, Ll/lct0;-><init>()V

    .line 187
    .line 188
    .line 189
    new-instance v1, Ll/nct0;

    .line 190
    .line 191
    invoke-direct {v1, v0, v2}, Ll/nct0;-><init>(Ljava/util/concurrent/Executor;Ll/mct0;)V

    .line 192
    .line 193
    .line 194
    sput-object v1, Ll/oct0;->e:Ll/xvw0;

    .line 195
    .line 196
    invoke-static {}, Lcom/google/android/gms/internal/ads/u3;->b()Ljava/util/concurrent/Executor;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    new-instance v1, Ll/nct0;

    .line 201
    .line 202
    invoke-direct {v1, v0, v2}, Ll/nct0;-><init>(Ljava/util/concurrent/Executor;Ll/mct0;)V

    .line 203
    .line 204
    .line 205
    sput-object v1, Ll/oct0;->f:Ll/xvw0;

    .line 206
    .line 207
    return-void
.end method
