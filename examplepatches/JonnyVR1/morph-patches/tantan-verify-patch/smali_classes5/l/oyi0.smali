.class public Ll/oyi0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/oyi0$b;,
        Ll/oyi0$c;,
        Ll/oyi0$d;
    }
.end annotation


# static fields
.field public static a:Ll/o7b0;

.field public static b:Ll/o7b0;

.field public static c:Ll/o7b0;

.field public static d:Ll/o7b0;

.field public static final e:Ljava/util/concurrent/TimeUnit;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 2
    .line 3
    sput-object v0, Ll/oyi0;->e:Ljava/util/concurrent/TimeUnit;

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

.method public static a(Ll/o7b0;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static declared-synchronized b(ILjava/lang/Runnable;)V
    .locals 14

    .line 1
    const-class v1, Ll/oyi0;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    const/4 v0, 0x0

    .line 5
    const/4 v2, 0x1

    .line 6
    if-eq p0, v2, :cond_6

    .line 7
    .line 8
    const/4 v3, 0x2

    .line 9
    if-eq p0, v3, :cond_4

    .line 10
    .line 11
    const/4 v3, 0x3

    .line 12
    if-eq p0, v3, :cond_2

    .line 13
    .line 14
    const/4 v3, 0x4

    .line 15
    if-eq p0, v3, :cond_0

    .line 16
    .line 17
    goto/16 :goto_1

    .line 18
    .line 19
    :cond_0
    :try_start_0
    sget-object v3, Ll/oyi0;->d:Ll/o7b0;

    .line 20
    .line 21
    if-nez v3, :cond_1

    .line 22
    .line 23
    new-instance v4, Ll/o7b0;

    .line 24
    .line 25
    const-string v5, "proxy_message"

    .line 26
    .line 27
    sget-object v10, Ll/oyi0;->e:Ljava/util/concurrent/TimeUnit;

    .line 28
    .line 29
    new-instance v11, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 30
    .line 31
    invoke-direct {v11}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 32
    .line 33
    .line 34
    new-instance v12, Ll/oyi0$c;

    .line 35
    .line 36
    invoke-direct {v12, p0}, Ll/oyi0$c;-><init>(I)V

    .line 37
    .line 38
    .line 39
    new-instance v13, Ll/oyi0$d;

    .line 40
    .line 41
    invoke-direct {v13, v0}, Ll/oyi0$d;-><init>(Ll/oyi0$a;)V

    .line 42
    .line 43
    .line 44
    const/4 v6, 0x1

    .line 45
    const/4 v7, 0x1

    .line 46
    const-wide/16 v8, 0x3c

    .line 47
    .line 48
    invoke-direct/range {v4 .. v13}, Ll/o7b0;-><init>(Ljava/lang/String;IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;)V

    .line 49
    .line 50
    .line 51
    sput-object v4, Ll/oyi0;->d:Ll/o7b0;

    .line 52
    .line 53
    invoke-virtual {v4, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :catchall_0
    move-exception v0

    .line 58
    move-object p0, v0

    .line 59
    goto/16 :goto_2

    .line 60
    .line 61
    :cond_1
    :goto_0
    sget-object p0, Ll/oyi0;->d:Ll/o7b0;

    .line 62
    .line 63
    invoke-static {p0, p1}, Ll/oyi0;->a(Ll/o7b0;Ljava/lang/Runnable;)V

    .line 64
    .line 65
    .line 66
    goto/16 :goto_1

    .line 67
    .line 68
    :cond_2
    sget-object v3, Ll/oyi0;->b:Ll/o7b0;

    .line 69
    .line 70
    if-nez v3, :cond_3

    .line 71
    .line 72
    new-instance v4, Ll/o7b0;

    .line 73
    .line 74
    const-string v5, "proxy_local"

    .line 75
    .line 76
    sget-object v10, Ll/oyi0;->e:Ljava/util/concurrent/TimeUnit;

    .line 77
    .line 78
    new-instance v11, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 79
    .line 80
    invoke-direct {v11}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 81
    .line 82
    .line 83
    new-instance v12, Ll/oyi0$c;

    .line 84
    .line 85
    invoke-direct {v12, p0}, Ll/oyi0$c;-><init>(I)V

    .line 86
    .line 87
    .line 88
    new-instance v13, Ll/oyi0$d;

    .line 89
    .line 90
    invoke-direct {v13, v0}, Ll/oyi0$d;-><init>(Ll/oyi0$a;)V

    .line 91
    .line 92
    .line 93
    const/4 v6, 0x3

    .line 94
    const/4 v7, 0x3

    .line 95
    const-wide/16 v8, 0x3c

    .line 96
    .line 97
    invoke-direct/range {v4 .. v13}, Ll/o7b0;-><init>(Ljava/lang/String;IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;)V

    .line 98
    .line 99
    .line 100
    sput-object v4, Ll/oyi0;->b:Ll/o7b0;

    .line 101
    .line 102
    invoke-virtual {v4, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 103
    .line 104
    .line 105
    :cond_3
    sget-object p0, Ll/oyi0;->b:Ll/o7b0;

    .line 106
    .line 107
    invoke-static {p0, p1}, Ll/oyi0;->a(Ll/o7b0;Ljava/lang/Runnable;)V

    .line 108
    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_4
    sget-object v3, Ll/oyi0;->c:Ll/o7b0;

    .line 112
    .line 113
    if-nez v3, :cond_5

    .line 114
    .line 115
    new-instance v4, Ll/o7b0;

    .line 116
    .line 117
    const-string v5, "proxy_net"

    .line 118
    .line 119
    sget-object v10, Ll/oyi0;->e:Ljava/util/concurrent/TimeUnit;

    .line 120
    .line 121
    new-instance v11, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 122
    .line 123
    invoke-direct {v11}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 124
    .line 125
    .line 126
    new-instance v12, Ll/oyi0$c;

    .line 127
    .line 128
    invoke-direct {v12, p0}, Ll/oyi0$c;-><init>(I)V

    .line 129
    .line 130
    .line 131
    new-instance v13, Ll/oyi0$d;

    .line 132
    .line 133
    invoke-direct {v13, v0}, Ll/oyi0$d;-><init>(Ll/oyi0$a;)V

    .line 134
    .line 135
    .line 136
    const/16 v6, 0xa

    .line 137
    .line 138
    const/16 v7, 0xa

    .line 139
    .line 140
    const-wide/16 v8, 0x78

    .line 141
    .line 142
    invoke-direct/range {v4 .. v13}, Ll/o7b0;-><init>(Ljava/lang/String;IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;)V

    .line 143
    .line 144
    .line 145
    sput-object v4, Ll/oyi0;->c:Ll/o7b0;

    .line 146
    .line 147
    invoke-virtual {v4, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 148
    .line 149
    .line 150
    :cond_5
    sget-object p0, Ll/oyi0;->c:Ll/o7b0;

    .line 151
    .line 152
    invoke-static {p0, p1}, Ll/oyi0;->a(Ll/o7b0;Ljava/lang/Runnable;)V

    .line 153
    .line 154
    .line 155
    goto :goto_1

    .line 156
    :cond_6
    sget-object v3, Ll/oyi0;->a:Ll/o7b0;

    .line 157
    .line 158
    if-nez v3, :cond_7

    .line 159
    .line 160
    new-instance v4, Ll/o7b0;

    .line 161
    .line 162
    const-string v5, "proxy_inner"

    .line 163
    .line 164
    sget-object v10, Ll/oyi0;->e:Ljava/util/concurrent/TimeUnit;

    .line 165
    .line 166
    new-instance v11, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 167
    .line 168
    invoke-direct {v11}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 169
    .line 170
    .line 171
    new-instance v12, Ll/oyi0$c;

    .line 172
    .line 173
    invoke-direct {v12, p0}, Ll/oyi0$c;-><init>(I)V

    .line 174
    .line 175
    .line 176
    new-instance v13, Ll/oyi0$d;

    .line 177
    .line 178
    invoke-direct {v13, v0}, Ll/oyi0$d;-><init>(Ll/oyi0$a;)V

    .line 179
    .line 180
    .line 181
    const/4 v6, 0x2

    .line 182
    const/4 v7, 0x2

    .line 183
    const-wide/16 v8, 0x3c

    .line 184
    .line 185
    invoke-direct/range {v4 .. v13}, Ll/o7b0;-><init>(Ljava/lang/String;IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;)V

    .line 186
    .line 187
    .line 188
    sput-object v4, Ll/oyi0;->a:Ll/o7b0;

    .line 189
    .line 190
    invoke-virtual {v4, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 191
    .line 192
    .line 193
    :cond_7
    sget-object p0, Ll/oyi0;->a:Ll/o7b0;

    .line 194
    .line 195
    invoke-static {p0, p1}, Ll/oyi0;->a(Ll/o7b0;Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 196
    .line 197
    .line 198
    :goto_1
    monitor-exit v1

    .line 199
    return-void

    .line 200
    :goto_2
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 201
    throw p0
.end method
