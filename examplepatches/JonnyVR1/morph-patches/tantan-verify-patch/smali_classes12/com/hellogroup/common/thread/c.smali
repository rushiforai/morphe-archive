.class public final Lcom/hellogroup/common/thread/c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hellogroup/common/thread/c$e;,
        Lcom/hellogroup/common/thread/c$b;,
        Lcom/hellogroup/common/thread/c$c;,
        Lcom/hellogroup/common/thread/c$d;
    }
.end annotation


# static fields
.field private static a:Ljava/lang/String; = "ThreadUtils"

.field private static b:Lcom/hellogroup/common/thread/c$d;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private static c:Lcom/hellogroup/common/thread/c$d;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private static d:Lcom/hellogroup/common/thread/c$d;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private static e:Lcom/hellogroup/common/thread/c$d;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private static f:Lcom/hellogroup/common/thread/c$d;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private static final g:Ljava/util/concurrent/TimeUnit;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 2
    .line 3
    sput-object v0, Lcom/hellogroup/common/thread/c;->g:Ljava/util/concurrent/TimeUnit;

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
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-static {p0}, Lcom/hellogroup/common/thread/c;->b(I)Lcom/hellogroup/common/thread/c$d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/hellogroup/common/thread/c$d;->a()Ll/n510;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private static declared-synchronized b(I)Lcom/hellogroup/common/thread/c$d;
    .locals 9
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    const-string v0, "type="

    .line 2
    .line 3
    const-class v1, Lcom/hellogroup/common/thread/c;

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
    sget-object v0, Lcom/hellogroup/common/thread/c;->f:Lcom/hellogroup/common/thread/c$d;

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    new-instance v2, Lcom/hellogroup/common/thread/c$d;

    .line 26
    .line 27
    sget-object v8, Lcom/hellogroup/common/thread/c;->g:Ljava/util/concurrent/TimeUnit;

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
    invoke-direct/range {v2 .. v8}, Lcom/hellogroup/common/thread/c$d;-><init>(IIIJLjava/util/concurrent/TimeUnit;)V

    .line 35
    .line 36
    .line 37
    sput-object v2, Lcom/hellogroup/common/thread/c;->f:Lcom/hellogroup/common/thread/c$d;

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
    sget-object p0, Lcom/hellogroup/common/thread/c;->f:Lcom/hellogroup/common/thread/c$d;
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
    sget-object p0, Lcom/hellogroup/common/thread/c;->e:Lcom/hellogroup/common/thread/c$d;

    .line 74
    .line 75
    if-nez p0, :cond_3

    .line 76
    .line 77
    new-instance v2, Lcom/hellogroup/common/thread/c$d;

    .line 78
    .line 79
    sget-object v8, Lcom/hellogroup/common/thread/c;->g:Ljava/util/concurrent/TimeUnit;

    .line 80
    .line 81
    const/4 v4, 0x1

    .line 82
    const/4 v5, 0x1

    .line 83
    const-wide/16 v6, 0x3c

    .line 84
    .line 85
    invoke-direct/range {v2 .. v8}, Lcom/hellogroup/common/thread/c$d;-><init>(IIIJLjava/util/concurrent/TimeUnit;)V

    .line 86
    .line 87
    .line 88
    sput-object v2, Lcom/hellogroup/common/thread/c;->e:Lcom/hellogroup/common/thread/c$d;

    .line 89
    .line 90
    :cond_3
    sget-object p0, Lcom/hellogroup/common/thread/c;->e:Lcom/hellogroup/common/thread/c$d;
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
    sget-object p0, Lcom/hellogroup/common/thread/c;->c:Lcom/hellogroup/common/thread/c$d;

    .line 96
    .line 97
    if-nez p0, :cond_5

    .line 98
    .line 99
    new-instance v2, Lcom/hellogroup/common/thread/c$d;

    .line 100
    .line 101
    sget-object v8, Lcom/hellogroup/common/thread/c;->g:Ljava/util/concurrent/TimeUnit;

    .line 102
    .line 103
    const/4 v4, 0x3

    .line 104
    const/4 v5, 0x3

    .line 105
    const-wide/16 v6, 0x3c

    .line 106
    .line 107
    invoke-direct/range {v2 .. v8}, Lcom/hellogroup/common/thread/c$d;-><init>(IIIJLjava/util/concurrent/TimeUnit;)V

    .line 108
    .line 109
    .line 110
    sput-object v2, Lcom/hellogroup/common/thread/c;->c:Lcom/hellogroup/common/thread/c$d;

    .line 111
    .line 112
    :cond_5
    sget-object p0, Lcom/hellogroup/common/thread/c;->c:Lcom/hellogroup/common/thread/c$d;
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
    sget-object p0, Lcom/hellogroup/common/thread/c;->d:Lcom/hellogroup/common/thread/c$d;

    .line 118
    .line 119
    if-nez p0, :cond_8

    .line 120
    .line 121
    invoke-static {}, Ll/lv0;->c()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-static {}, Ll/lv0;->b()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    if-eqz p0, :cond_7

    .line 134
    .line 135
    new-instance v2, Lcom/hellogroup/common/thread/c$d;

    .line 136
    .line 137
    sget-object v8, Lcom/hellogroup/common/thread/c;->g:Ljava/util/concurrent/TimeUnit;

    .line 138
    .line 139
    const/16 v4, 0xa

    .line 140
    .line 141
    const/16 v5, 0xa

    .line 142
    .line 143
    const-wide/16 v6, 0x78

    .line 144
    .line 145
    invoke-direct/range {v2 .. v8}, Lcom/hellogroup/common/thread/c$d;-><init>(IIIJLjava/util/concurrent/TimeUnit;)V

    .line 146
    .line 147
    .line 148
    sput-object v2, Lcom/hellogroup/common/thread/c;->d:Lcom/hellogroup/common/thread/c$d;

    .line 149
    .line 150
    goto :goto_1

    .line 151
    :cond_7
    new-instance v2, Lcom/hellogroup/common/thread/c$d;

    .line 152
    .line 153
    sget-object v8, Lcom/hellogroup/common/thread/c;->g:Ljava/util/concurrent/TimeUnit;

    .line 154
    .line 155
    const/4 v4, 0x5

    .line 156
    const/4 v5, 0x5

    .line 157
    const-wide/16 v6, 0x3c

    .line 158
    .line 159
    invoke-direct/range {v2 .. v8}, Lcom/hellogroup/common/thread/c$d;-><init>(IIIJLjava/util/concurrent/TimeUnit;)V

    .line 160
    .line 161
    .line 162
    sput-object v2, Lcom/hellogroup/common/thread/c;->d:Lcom/hellogroup/common/thread/c$d;

    .line 163
    .line 164
    :cond_8
    :goto_1
    sget-object p0, Lcom/hellogroup/common/thread/c;->d:Lcom/hellogroup/common/thread/c$d;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 165
    .line 166
    monitor-exit v1

    .line 167
    return-object p0

    .line 168
    :cond_9
    move v3, p0

    .line 169
    :try_start_4
    sget-object p0, Lcom/hellogroup/common/thread/c;->b:Lcom/hellogroup/common/thread/c$d;

    .line 170
    .line 171
    if-nez p0, :cond_a

    .line 172
    .line 173
    new-instance v2, Lcom/hellogroup/common/thread/c$d;

    .line 174
    .line 175
    sget-object v8, Lcom/hellogroup/common/thread/c;->g:Ljava/util/concurrent/TimeUnit;

    .line 176
    .line 177
    const/4 v4, 0x2

    .line 178
    const/4 v5, 0x2

    .line 179
    const-wide/16 v6, 0x3c

    .line 180
    .line 181
    invoke-direct/range {v2 .. v8}, Lcom/hellogroup/common/thread/c$d;-><init>(IIIJLjava/util/concurrent/TimeUnit;)V

    .line 182
    .line 183
    .line 184
    sput-object v2, Lcom/hellogroup/common/thread/c;->b:Lcom/hellogroup/common/thread/c$d;

    .line 185
    .line 186
    :cond_a
    sget-object p0, Lcom/hellogroup/common/thread/c;->b:Lcom/hellogroup/common/thread/c$d;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 187
    .line 188
    monitor-exit v1

    .line 189
    return-object p0

    .line 190
    :goto_2
    :try_start_5
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 191
    throw p0
.end method

.method public static synthetic c()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/hellogroup/common/thread/c;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static d(ILjava/lang/Runnable;)V
    .locals 3
    .param p1    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    sget-boolean v0, Ll/lv0;->c:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Lcom/hellogroup/common/thread/c;->a(I)Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1}, Lcom/hellogroup/common/thread/c;->f(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const-wide/16 v0, 0x0

    .line 20
    .line 21
    sget-object v2, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 22
    .line 23
    invoke-static {p0, p1, v0, v1, v2}, Lcom/hellogroup/common/thread/c;->e(ILjava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    const-string p0, "command is null"

    .line 28
    .line 29
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static e(ILjava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;
    .locals 0
    .param p1    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/util/concurrent/TimeUnit;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
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
    invoke-static {p0}, Lcom/hellogroup/common/thread/c;->a(I)Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1}, Lcom/hellogroup/common/thread/c;->f(Ljava/lang/Runnable;)Ljava/lang/Runnable;

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

.method private static f(Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 1
    .param p0    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    sget-boolean v0, Ll/lv0;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/hellogroup/common/thread/c$a;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/hellogroup/common/thread/c$a;-><init>(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    return-object v0

    .line 11
    :cond_0
    return-object p0
.end method
