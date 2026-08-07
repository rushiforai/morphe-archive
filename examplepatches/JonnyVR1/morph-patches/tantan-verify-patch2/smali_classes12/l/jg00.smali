.class public Ll/jg00;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/jg00$d;,
        Ll/jg00$c;,
        Ll/jg00$b;
    }
.end annotation


# static fields
.field static a:Ll/j510;

.field static b:Ll/j510;

.field static c:Ll/j510;

.field static d:Ll/ig00;


# direct methods
.method static constructor <clinit>()V
    .locals 21

    .line 1
    new-instance v0, Ll/j510;

    .line 2
    .line 3
    new-instance v7, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 4
    .line 5
    invoke-direct {v7}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 6
    .line 7
    .line 8
    new-instance v8, Ll/jg00$d;

    .line 9
    .line 10
    const-string v1, "live-buz-high"

    .line 11
    .line 12
    invoke-direct {v8, v1}, Ll/jg00$d;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    new-instance v9, Ll/jg00$c;

    .line 16
    .line 17
    const/4 v10, 0x0

    .line 18
    invoke-direct {v9, v10}, Ll/jg00$c;-><init>(Ll/jg00$a;)V

    .line 19
    .line 20
    .line 21
    const-string v1, "live-buz-high"

    .line 22
    .line 23
    const/16 v2, 0xa

    .line 24
    .line 25
    const/16 v3, 0xf

    .line 26
    .line 27
    const-wide/16 v4, 0x7530

    .line 28
    .line 29
    sget-object v17, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 30
    .line 31
    move-object/from16 v6, v17

    .line 32
    .line 33
    invoke-direct/range {v0 .. v9}, Ll/j510;-><init>(Ljava/lang/String;IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;)V

    .line 34
    .line 35
    .line 36
    sput-object v0, Ll/jg00;->a:Ll/j510;

    .line 37
    .line 38
    new-instance v11, Ll/j510;

    .line 39
    .line 40
    new-instance v18, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 41
    .line 42
    invoke-direct/range {v18 .. v18}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 43
    .line 44
    .line 45
    new-instance v0, Ll/jg00$d;

    .line 46
    .line 47
    const-string v1, "live-buz-normal"

    .line 48
    .line 49
    invoke-direct {v0, v1}, Ll/jg00$d;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    new-instance v1, Ll/jg00$c;

    .line 53
    .line 54
    invoke-direct {v1, v10}, Ll/jg00$c;-><init>(Ll/jg00$a;)V

    .line 55
    .line 56
    .line 57
    const-string v12, "live-buz-normal"

    .line 58
    .line 59
    const/4 v13, 0x5

    .line 60
    const/16 v14, 0xa

    .line 61
    .line 62
    const-wide/16 v15, 0x7530

    .line 63
    .line 64
    move-object/from16 v19, v0

    .line 65
    .line 66
    move-object/from16 v20, v1

    .line 67
    .line 68
    invoke-direct/range {v11 .. v20}, Ll/j510;-><init>(Ljava/lang/String;IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;)V

    .line 69
    .line 70
    .line 71
    sput-object v11, Ll/jg00;->b:Ll/j510;

    .line 72
    .line 73
    new-instance v11, Ll/j510;

    .line 74
    .line 75
    new-instance v18, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 76
    .line 77
    invoke-direct/range {v18 .. v18}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 78
    .line 79
    .line 80
    new-instance v0, Ll/jg00$d;

    .line 81
    .line 82
    const-string v1, "live-buz-low"

    .line 83
    .line 84
    invoke-direct {v0, v1}, Ll/jg00$d;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    new-instance v1, Ll/jg00$c;

    .line 88
    .line 89
    invoke-direct {v1, v10}, Ll/jg00$c;-><init>(Ll/jg00$a;)V

    .line 90
    .line 91
    .line 92
    const-string v12, "live-buz-low"

    .line 93
    .line 94
    const/4 v13, 0x2

    .line 95
    const/4 v14, 0x2

    .line 96
    move-object/from16 v19, v0

    .line 97
    .line 98
    move-object/from16 v20, v1

    .line 99
    .line 100
    invoke-direct/range {v11 .. v20}, Ll/j510;-><init>(Ljava/lang/String;IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;)V

    .line 101
    .line 102
    .line 103
    sput-object v11, Ll/jg00;->c:Ll/j510;

    .line 104
    .line 105
    new-instance v11, Ll/ig00;

    .line 106
    .line 107
    new-instance v18, Ljava/util/concurrent/PriorityBlockingQueue;

    .line 108
    .line 109
    invoke-direct/range {v18 .. v18}, Ljava/util/concurrent/PriorityBlockingQueue;-><init>()V

    .line 110
    .line 111
    .line 112
    new-instance v0, Ll/jg00$d;

    .line 113
    .line 114
    const-string v1, "live-buz-priority_low"

    .line 115
    .line 116
    invoke-direct {v0, v1}, Ll/jg00$d;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    new-instance v1, Ll/jg00$c;

    .line 120
    .line 121
    invoke-direct {v1, v10}, Ll/jg00$c;-><init>(Ll/jg00$a;)V

    .line 122
    .line 123
    .line 124
    const-string v12, "live-buz-priority_low"

    .line 125
    .line 126
    move-object/from16 v19, v0

    .line 127
    .line 128
    move-object/from16 v20, v1

    .line 129
    .line 130
    invoke-direct/range {v11 .. v20}, Ll/ig00;-><init>(Ljava/lang/String;IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;)V

    .line 131
    .line 132
    .line 133
    sput-object v11, Ll/jg00;->d:Ll/ig00;

    .line 134
    .line 135
    sget-object v0, Ll/jg00;->a:Ll/j510;

    .line 136
    .line 137
    const/4 v1, 0x1

    .line 138
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 139
    .line 140
    .line 141
    sget-object v0, Ll/jg00;->b:Ll/j510;

    .line 142
    .line 143
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 144
    .line 145
    .line 146
    sget-object v0, Ll/jg00;->c:Ll/j510;

    .line 147
    .line 148
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 149
    .line 150
    .line 151
    sget-object v0, Ll/jg00;->d:Ll/ig00;

    .line 152
    .line 153
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 154
    .line 155
    .line 156
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

.method public static a(Lcom/immomo/medialog/thread/ThreadType;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    sget-object v0, Ll/jg00$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p0, v0, :cond_3

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p0, v0, :cond_2

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p0, v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x4

    .line 19
    if-eq p0, v0, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    sget-object p0, Ll/jg00;->d:Ll/ig00;

    .line 23
    .line 24
    invoke-static {p0, p1}, Ll/jg00;->b(Ll/ig00;Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    sget-object p0, Ll/jg00;->c:Ll/j510;

    .line 29
    .line 30
    invoke-static {p0, p1}, Ll/jg00;->c(Ll/j510;Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_2
    sget-object p0, Ll/jg00;->b:Ll/j510;

    .line 35
    .line 36
    invoke-static {p0, p1}, Ll/jg00;->c(Ll/j510;Ljava/lang/Runnable;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_3
    sget-object p0, Ll/jg00;->a:Ll/j510;

    .line 41
    .line 42
    invoke-static {p0, p1}, Ll/jg00;->c(Ll/j510;Ljava/lang/Runnable;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private static b(Ll/ig00;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ig00;->execute(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static c(Ll/j510;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
