.class public Lcn/shuzilm/core/DUHelper;
.super Landroid/telephony/PhoneStateListener;
.source "SourceFile"


# static fields
.field private static A:Ljava/util/Timer; = null

.field private static B:Ljava/util/TimerTask; = null

.field public static final MAIN_DU_ASYNCHRONOUS:I = 0x1

.field public static final MAIN_DU_SYNCHRONOUS:I = 0x0

.field private static final a:Ljava/lang/String; = "du.lock"

.field private static final b:Ljava/lang/String; = "du"

.field private static c:Lcn/shuzilm/core/AIClient;

.field private static final d:Lcn/shuzilm/core/DUHelper;

.field private static e:I

.field private static f:I

.field private static final g:Ljava/util/concurrent/locks/Lock;

.field private static final h:Ljava/util/concurrent/locks/Lock;

.field private static final i:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

.field private static j:Z

.field private static k:Ljava/lang/String;

.field private static l:Ljava/lang/String;

.field private static final m:Lorg/json/JSONObject;

.field public static mContext:Landroid/content/Context;

.field public static mMeic:I

.field public static mPopu:I

.field public static mPort:I

.field public static mSplt:I

.field private static final n:Lorg/json/JSONObject;

.field private static o:Lorg/json/JSONObject;

.field private static final p:Ljava/lang/ThreadLocal;

.field private static q:Ljava/lang/String;

.field private static r:Lorg/json/JSONObject;

.field private static final s:Ljava/util/concurrent/ExecutorService;

.field private static final t:Ljava/util/concurrent/ExecutorService;

.field private static final u:Ljava/util/concurrent/ExecutorService;

.field private static v:J

.field private static w:J

.field private static volatile x:Z

.field private static y:Ljava/util/Timer;

.field private static z:Lcn/shuzilm/core/t;


# instance fields
.field private C:I

.field private D:Z

.field private E:J


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcn/shuzilm/core/DUHelper;

    .line 2
    .line 3
    invoke-direct {v0}, Lcn/shuzilm/core/DUHelper;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcn/shuzilm/core/DUHelper;->d:Lcn/shuzilm/core/DUHelper;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    sput v0, Lcn/shuzilm/core/DUHelper;->e:I

    .line 10
    .line 11
    sput v0, Lcn/shuzilm/core/DUHelper;->f:I

    .line 12
    .line 13
    new-instance v1, Ljava/util/concurrent/locks/ReentrantLock;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    .line 16
    .line 17
    .line 18
    sput-object v1, Lcn/shuzilm/core/DUHelper;->g:Ljava/util/concurrent/locks/Lock;

    .line 19
    .line 20
    new-instance v1, Ljava/util/concurrent/locks/ReentrantLock;

    .line 21
    .line 22
    invoke-direct {v1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    .line 23
    .line 24
    .line 25
    sput-object v1, Lcn/shuzilm/core/DUHelper;->h:Ljava/util/concurrent/locks/Lock;

    .line 26
    .line 27
    new-instance v1, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 28
    .line 29
    invoke-direct {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    .line 30
    .line 31
    .line 32
    sput-object v1, Lcn/shuzilm/core/DUHelper;->i:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 33
    .line 34
    sput-boolean v0, Lcn/shuzilm/core/DUHelper;->j:Z

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    sput-object v1, Lcn/shuzilm/core/DUHelper;->k:Ljava/lang/String;

    .line 38
    .line 39
    sput-object v1, Lcn/shuzilm/core/DUHelper;->l:Ljava/lang/String;

    .line 40
    .line 41
    new-instance v2, Lorg/json/JSONObject;

    .line 42
    .line 43
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 44
    .line 45
    .line 46
    sput-object v2, Lcn/shuzilm/core/DUHelper;->m:Lorg/json/JSONObject;

    .line 47
    .line 48
    new-instance v2, Lorg/json/JSONObject;

    .line 49
    .line 50
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 51
    .line 52
    .line 53
    sput-object v2, Lcn/shuzilm/core/DUHelper;->n:Lorg/json/JSONObject;

    .line 54
    .line 55
    sput-object v1, Lcn/shuzilm/core/DUHelper;->o:Lorg/json/JSONObject;

    .line 56
    .line 57
    new-instance v2, Ljava/lang/ThreadLocal;

    .line 58
    .line 59
    invoke-direct {v2}, Ljava/lang/ThreadLocal;-><init>()V

    .line 60
    .line 61
    .line 62
    sput-object v2, Lcn/shuzilm/core/DUHelper;->p:Ljava/lang/ThreadLocal;

    .line 63
    .line 64
    sput-object v1, Lcn/shuzilm/core/DUHelper;->q:Ljava/lang/String;

    .line 65
    .line 66
    new-instance v2, Lorg/json/JSONObject;

    .line 67
    .line 68
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 69
    .line 70
    .line 71
    sput-object v2, Lcn/shuzilm/core/DUHelper;->r:Lorg/json/JSONObject;

    .line 72
    .line 73
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    sput-object v2, Lcn/shuzilm/core/DUHelper;->s:Ljava/util/concurrent/ExecutorService;

    .line 78
    .line 79
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    sput-object v2, Lcn/shuzilm/core/DUHelper;->t:Ljava/util/concurrent/ExecutorService;

    .line 84
    .line 85
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    sput-object v2, Lcn/shuzilm/core/DUHelper;->u:Ljava/util/concurrent/ExecutorService;

    .line 90
    .line 91
    const-wide/16 v2, 0x0

    .line 92
    .line 93
    sput-wide v2, Lcn/shuzilm/core/DUHelper;->v:J

    .line 94
    .line 95
    sput-wide v2, Lcn/shuzilm/core/DUHelper;->w:J

    .line 96
    .line 97
    sput-boolean v0, Lcn/shuzilm/core/DUHelper;->x:Z

    .line 98
    .line 99
    sput-object v1, Lcn/shuzilm/core/DUHelper;->A:Ljava/util/Timer;

    .line 100
    .line 101
    new-instance v0, Lcn/shuzilm/core/f;

    .line 102
    .line 103
    invoke-direct {v0}, Lcn/shuzilm/core/f;-><init>()V

    .line 104
    .line 105
    .line 106
    sput-object v0, Lcn/shuzilm/core/DUHelper;->B:Ljava/util/TimerTask;

    .line 107
    .line 108
    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    iput v0, p0, Lcn/shuzilm/core/DUHelper;->C:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcn/shuzilm/core/DUHelper;->D:Z

    .line 9
    .line 10
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    iput-wide v0, p0, Lcn/shuzilm/core/DUHelper;->E:J

    .line 13
    .line 14
    return-void
.end method

.method public static ZVTFJRA(Landroid/content/Context;Lcn/shuzilm/core/Listener;IZ)V
    .locals 7

    .line 1
    :try_start_0
    invoke-static {p0}, Lcn/shuzilm/core/DUHelper;->c(Landroid/content/Context;)Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    sget-object v6, Lcn/shuzilm/core/DUHelper;->t:Ljava/util/concurrent/ExecutorService;

    .line 6
    .line 7
    new-instance v0, Lcn/shuzilm/core/e;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 8
    .line 9
    move-object v5, p0

    .line 10
    move-object v4, p1

    .line 11
    move v3, p2

    .line 12
    move v2, p3

    .line 13
    :try_start_1
    invoke-direct/range {v0 .. v5}, Lcn/shuzilm/core/e;-><init>(Landroid/content/Context;ZILcn/shuzilm/core/Listener;Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {v6, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception v0

    .line 21
    :goto_0
    move-object p0, v0

    .line 22
    goto :goto_1

    .line 23
    :catch_1
    move-exception v0

    .line 24
    move-object v4, p1

    .line 25
    goto :goto_0

    .line 26
    :goto_1
    if-eqz v4, :cond_0

    .line 27
    .line 28
    const-string p1, "NA"

    .line 29
    .line 30
    invoke-interface {v4, p1}, Lcn/shuzilm/core/Listener;->handler(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static synthetic a(Landroid/content/Context;)I
    .locals 0

    .line 120
    invoke-static {p0}, Lcn/shuzilm/core/DUHelper;->d(Landroid/content/Context;)I

    move-result p0

    return p0
.end method

.method public static synthetic a(Lcn/shuzilm/core/AIClient;)Lcn/shuzilm/core/AIClient;
    .locals 0

    .line 140
    sput-object p0, Lcn/shuzilm/core/DUHelper;->c:Lcn/shuzilm/core/AIClient;

    return-object p0
.end method

.method public static synthetic a()Lcn/shuzilm/core/DUHelper;
    .locals 1

    .line 159
    sget-object v0, Lcn/shuzilm/core/DUHelper;->d:Lcn/shuzilm/core/DUHelper;

    return-object v0
.end method

.method public static synthetic a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 121
    invoke-static {p0, p1}, Lcn/shuzilm/core/DUHelper;->zZVTFJRA(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 127
    invoke-static {p0, p1, p2}, Lcn/shuzilm/core/DUHelper;->run(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 4

    .line 1
    const-string v0, "1"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    :try_start_0
    sput-wide v2, Lcn/shuzilm/core/DUHelper;->w:J

    .line 7
    .line 8
    sput-wide v2, Lcn/shuzilm/core/DUHelper;->v:J

    .line 9
    .line 10
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 11
    .line 12
    .line 13
    move-result-wide v2

    .line 14
    sput-wide v2, Lcn/shuzilm/core/DUHelper;->v:J

    .line 15
    .line 16
    sget-object v2, Lcn/shuzilm/core/DUHelper;->d:Lcn/shuzilm/core/DUHelper;

    .line 17
    .line 18
    invoke-direct {v2, p1}, Lcn/shuzilm/core/DUHelper;->e(Landroid/content/Context;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-nez v2, :cond_0

    .line 23
    .line 24
    const-string p0, "[shuzilm]"

    .line 25
    .line 26
    const-string p1, "[20006] network is unavailable."

    .line 27
    .line 28
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    return-object v1

    .line 32
    :catch_0
    move-exception p0

    .line 33
    goto :goto_0

    .line 34
    :catch_1
    move-exception p0

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    const-string v2, "apiKey"

    .line 37
    .line 38
    sget-object v3, Lcn/shuzilm/core/DUHelper;->k:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v2, v3}, Lcn/shuzilm/core/DUHelper;->setConfig(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    sget-object v2, Lcn/shuzilm/core/DUHelper;->n:Lorg/json/JSONObject;

    .line 44
    .line 45
    invoke-direct {p0, p1, v2, p2}, Lcn/shuzilm/core/DUHelper;->a(Landroid/content/Context;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    sget-object p2, Lcn/shuzilm/core/DUHelper;->m:Lorg/json/JSONObject;

    .line 49
    .line 50
    invoke-direct {p0, p2, p3}, Lcn/shuzilm/core/DUHelper;->a(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-static {p1, p0, p2, p4}, Lcn/shuzilm/core/DUHelper;->query(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    if-eqz p0, :cond_2

    .line 66
    .line 67
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-nez p1, :cond_2

    .line 72
    .line 73
    const-string p1, "location"

    .line 74
    .line 75
    invoke-virtual {v2, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-eqz p1, :cond_1

    .line 84
    .line 85
    const/16 p1, 0x2711

    .line 86
    .line 87
    sput p1, Lcn/shuzilm/core/DUHelper;->mPopu:I

    .line 88
    .line 89
    :cond_1
    const-string p1, "operation"

    .line 90
    .line 91
    invoke-virtual {v2, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    sget-object p2, Lcn/shuzilm/core/DUHelper;->mContext:Landroid/content/Context;

    .line 100
    .line 101
    invoke-static {p2, p0, p1}, Lcn/shuzilm/core/dl;->d(Landroid/content/Context;Ljava/lang/String;Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_1 .. :try_end_1} :catch_0

    .line 102
    .line 103
    .line 104
    :catch_2
    :cond_2
    :try_start_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 105
    .line 106
    .line 107
    move-result-wide p1

    .line 108
    sput-wide p1, Lcn/shuzilm/core/DUHelper;->w:J
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_2 .. :try_end_2} :catch_0

    .line 109
    .line 110
    return-object p0

    .line 111
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 112
    .line 113
    .line 114
    goto :goto_2

    .line 115
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 116
    .line 117
    .line 118
    :goto_2
    return-object v1
.end method

.method public static synthetic a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 133
    invoke-static {p0, p1, p2, p3}, Lcn/shuzilm/core/DUHelper;->onIEvent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a(Lcn/shuzilm/core/DUHelper;Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 131
    invoke-direct {p0, p1}, Lcn/shuzilm/core/DUHelper;->i(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a(Lcn/shuzilm/core/DUHelper;Landroid/content/Context;I)Ljava/lang/String;
    .locals 0

    .line 129
    invoke-direct {p0, p1, p2}, Lcn/shuzilm/core/DUHelper;->b(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a(Lcn/shuzilm/core/DUHelper;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 0

    .line 130
    invoke-direct {p0, p1, p2, p3, p4}, Lcn/shuzilm/core/DUHelper;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a(Lcn/shuzilm/core/DUHelper;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 128
    invoke-direct {p0, p1, p2, p3, p4}, Lcn/shuzilm/core/DUHelper;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a(Ljava/util/Timer;)Ljava/util/Timer;
    .locals 0

    .line 135
    sput-object p0, Lcn/shuzilm/core/DUHelper;->y:Ljava/util/Timer;

    return-object p0
.end method

.method public static synthetic a(I)V
    .locals 0

    .line 119
    invoke-static {p0}, Lcn/shuzilm/core/DUHelper;->b(I)V

    return-void
.end method

.method private a(Landroid/content/Context;I)V
    .locals 6

    .line 122
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 123
    iget-wide v2, p0, Lcn/shuzilm/core/DUHelper;->E:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x1b58

    cmp-long p1, v2, v4

    if-lez p1, :cond_0

    .line 124
    sget-object p1, Lcn/shuzilm/core/DUHelper;->s:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lcn/shuzilm/core/r;

    invoke-direct {v2, p0, p2}, Lcn/shuzilm/core/r;-><init>(Lcn/shuzilm/core/DUHelper;I)V

    invoke-interface {p1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 125
    iput-wide v0, p0, Lcn/shuzilm/core/DUHelper;->E:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method public static synthetic a(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 136
    invoke-static {p0, p1}, Lcn/shuzilm/core/DUHelper;->aXZlZWNl(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static synthetic a(Landroid/content/Context;Landroid/hardware/SensorEvent;)V
    .locals 0

    .line 132
    invoke-static {p0, p1}, Lcn/shuzilm/core/DUHelper;->onSensorChanged(Landroid/content/Context;Landroid/hardware/SensorEvent;)V

    return-void
.end method

.method private a(Landroid/content/Context;Landroid/hardware/SensorManager;Landroid/hardware/Sensor;)V
    .locals 1

    .line 163
    new-instance v0, Lcn/shuzilm/core/b;

    invoke-direct {v0, p0, p1, p2}, Lcn/shuzilm/core/b;-><init>(Lcn/shuzilm/core/DUHelper;Landroid/content/Context;Landroid/hardware/SensorManager;)V

    const/4 p0, 0x1

    .line 164
    invoke-virtual {p2, v0, p3, p0}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    return-void
.end method

.method public static synthetic a(Landroid/content/Context;Ljava/lang/Object;I)V
    .locals 0

    .line 137
    invoke-static {p0, p1, p2}, Lcn/shuzilm/core/DUHelper;->oxlbmV0d(Landroid/content/Context;Ljava/lang/Object;I)V

    return-void
.end method

.method private a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcn/shuzilm/core/Listener;I)V
    .locals 8

    .line 160
    :try_start_0
    sget v0, Lcn/shuzilm/core/DUHelper;->e:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcn/shuzilm/core/DUHelper;->e:I

    .line 161
    sget-object v0, Lcn/shuzilm/core/DUHelper;->s:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcn/shuzilm/core/a;

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v7, p4

    move v6, p5

    invoke-direct/range {v1 .. v7}, Lcn/shuzilm/core/a;-><init>(Lcn/shuzilm/core/DUHelper;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILcn/shuzilm/core/Listener;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p0, v0

    .line 162
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    return-void
.end method

.method private a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcn/shuzilm/core/Listener;)V
    .locals 8

    .line 142
    sget-object v0, Lcn/shuzilm/core/DUHelper;->s:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcn/shuzilm/core/q;

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v1 .. v7}, Lcn/shuzilm/core/q;-><init>(Lcn/shuzilm/core/DUHelper;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcn/shuzilm/core/Listener;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private a(Landroid/content/Context;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 3

    const-string v0, "apiKey"

    const-string v1, "store"

    .line 151
    :try_start_0
    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    if-nez p3, :cond_0

    .line 152
    invoke-direct {p0, p1}, Lcn/shuzilm/core/DUHelper;->h(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p3

    if-nez p3, :cond_0

    .line 153
    invoke-direct {p0, p1, v1}, Lcn/shuzilm/core/DUHelper;->d(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    :cond_0
    if-eqz p3, :cond_1

    .line 154
    invoke-virtual {p2, v1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 155
    :cond_1
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_2

    .line 156
    invoke-direct {p0, p1, v0}, Lcn/shuzilm/core/DUHelper;->d(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_2

    .line 157
    invoke-virtual {p2, v0, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    return-void

    :catch_0
    move-exception p0

    .line 158
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    return-void
.end method

.method public static synthetic a(Lcn/shuzilm/core/DUHelper;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcn/shuzilm/core/Listener;I)V
    .locals 0

    .line 134
    invoke-direct/range {p0 .. p5}, Lcn/shuzilm/core/DUHelper;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcn/shuzilm/core/Listener;I)V

    return-void
.end method

.method public static synthetic a(Lcn/shuzilm/core/DUHelper;Landroid/content/Context;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0

    .line 141
    invoke-direct {p0, p1, p2, p3}, Lcn/shuzilm/core/DUHelper;->a(Landroid/content/Context;Lorg/json/JSONObject;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic a(Lcn/shuzilm/core/DUHelper;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0

    .line 126
    invoke-direct {p0, p1, p2}, Lcn/shuzilm/core/DUHelper;->a(Lorg/json/JSONObject;Ljava/lang/String;)V

    return-void
.end method

.method private a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 143
    :try_start_0
    sget-object p0, Lcn/shuzilm/core/DUHelper;->p:Ljava/lang/ThreadLocal;

    invoke-virtual {p0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    if-eqz v0, :cond_0

    .line 144
    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-void

    .line 145
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 146
    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 147
    invoke-virtual {p0, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 148
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    return-void
.end method

.method private a(Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 1

    .line 150
    const-string v0, "custom"

    invoke-direct {p0, p1, v0, p2}, Lcn/shuzilm/core/DUHelper;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 149
    invoke-virtual {p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-void
.end method

.method public static synthetic a(Lcn/shuzilm/core/DUHelper;)Z
    .locals 0

    .line 138
    iget-boolean p0, p0, Lcn/shuzilm/core/DUHelper;->D:Z

    return p0
.end method

.method public static synthetic a(Lcn/shuzilm/core/DUHelper;Z)Z
    .locals 0

    .line 139
    iput-boolean p1, p0, Lcn/shuzilm/core/DUHelper;->D:Z

    return p1
.end method

.method private static native aXZlZWNl(Landroid/content/Context;Landroid/content/Intent;)V
.end method

.method private b(Landroid/content/Context;I)Ljava/lang/String;
    .locals 2

    .line 88
    :try_start_0
    invoke-static {p1, p2}, Lcn/shuzilm/core/DUHelper;->c6M2YmYQ(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x1

    if-eq p2, v1, :cond_0

    .line 89
    invoke-direct {p0, p1, p2}, Lcn/shuzilm/core/DUHelper;->a(Landroid/content/Context;I)V

    :cond_0
    return-object v0
.end method

.method private static b(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 83
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 84
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "_prefs"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    .line 85
    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 86
    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 87
    invoke-static {p0, p1, p2}, Lcn/shuzilm/core/DUHelper;->reportRun(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    sget-object v1, Lcn/shuzilm/core/DUHelper;->d:Lcn/shuzilm/core/DUHelper;

    .line 3
    .line 4
    invoke-direct {v1, p1}, Lcn/shuzilm/core/DUHelper;->e(Landroid/content/Context;)Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    const-string p0, "[shuzilm]"

    .line 11
    .line 12
    const-string p1, "[20004] network is unavailable."

    .line 13
    .line 14
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    return-object v0

    .line 18
    :catch_0
    move-exception p0

    .line 19
    goto :goto_1

    .line 20
    :catch_1
    move-exception p0

    .line 21
    goto :goto_2

    .line 22
    :cond_0
    const-string v1, "pEventCode"

    .line 23
    .line 24
    invoke-direct {p0, v1, p2}, Lcn/shuzilm/core/DUHelper;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    if-eqz p3, :cond_1

    .line 28
    .line 29
    const-string p2, "mEventCode"

    .line 30
    .line 31
    invoke-direct {p0, p2, p3}, Lcn/shuzilm/core/DUHelper;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    sget-object p2, Lcn/shuzilm/core/DUHelper;->p:Ljava/lang/ThreadLocal;

    .line 35
    .line 36
    invoke-virtual {p2}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p3

    .line 40
    if-eqz p3, :cond_2

    .line 41
    .line 42
    invoke-virtual {p2}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    check-cast p2, Lorg/json/JSONObject;

    .line 47
    .line 48
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    goto :goto_0

    .line 53
    :cond_2
    move-object p2, v0

    .line 54
    :goto_0
    sget-object p3, Lcn/shuzilm/core/DUHelper;->m:Lorg/json/JSONObject;

    .line 55
    .line 56
    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p3

    .line 60
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    :try_start_1
    invoke-static {p1, p2, p3, p4}, Lcn/shuzilm/core/DUHelper;->onEvent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    monitor-exit p0

    .line 66
    return-object v0

    .line 67
    :catchall_0
    move-exception p1

    .line 68
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 69
    :try_start_2
    throw p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_2 .. :try_end_2} :catch_0

    .line 70
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 71
    .line 72
    .line 73
    goto :goto_3

    .line 74
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 75
    .line 76
    .line 77
    :goto_3
    return-object v0
.end method

.method public static synthetic b()Ljava/util/concurrent/locks/Lock;
    .locals 1

    .line 78
    sget-object v0, Lcn/shuzilm/core/DUHelper;->h:Ljava/util/concurrent/locks/Lock;

    return-object v0
.end method

.method private static b(I)V
    .locals 2

    .line 80
    sget-boolean v0, Lcn/shuzilm/core/DUHelper;->j:Z

    if-nez v0, :cond_0

    .line 81
    :try_start_0
    sget-object v0, Lcn/shuzilm/core/DUHelper;->t:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcn/shuzilm/core/m;

    invoke-direct {v1, p0}, Lcn/shuzilm/core/m;-><init>(I)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    const/4 v0, 0x2

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    .line 82
    sput-boolean p0, Lcn/shuzilm/core/DUHelper;->j:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    :cond_0
    return-void
.end method

.method public static synthetic b(Landroid/content/Context;)V
    .locals 0

    .line 79
    invoke-static {p0}, Lcn/shuzilm/core/DUHelper;->k(Landroid/content/Context;)V

    return-void
.end method

.method public static bm(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p0}, Lcn/shuzilm/core/DUHelper;->c(Landroid/content/Context;)Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :try_start_0
    sget-object v0, Lcn/shuzilm/core/DUHelper;->s:Ljava/util/concurrent/ExecutorService;

    .line 6
    .line 7
    new-instance v1, Lcn/shuzilm/core/g;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Lcn/shuzilm/core/g;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    :catch_0
    return-void
.end method

.method private static c(Landroid/content/Context;)Landroid/content/Context;
    .locals 1

    .line 51
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    return-object p0

    :catch_0
    move-exception v0

    .line 52
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    return-object p0
.end method

.method public static synthetic c()Lcn/shuzilm/core/AIClient;
    .locals 1

    .line 64
    sget-object v0, Lcn/shuzilm/core/DUHelper;->c:Lcn/shuzilm/core/AIClient;

    return-object v0
.end method

.method private c(Landroid/content/Context;I)Ljava/lang/String;
    .locals 4

    .line 1
    const/16 v0, 0xc

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-lt p2, v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    if-nez p2, :cond_1

    .line 8
    .line 9
    const-wide/16 v2, 0x14

    .line 10
    .line 11
    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    .line 12
    .line 13
    .line 14
    :cond_1
    monitor-enter p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 15
    :try_start_1
    const-string v0, "{}"

    .line 16
    .line 17
    const-string v2, "{}"

    .line 18
    .line 19
    invoke-static {p1, v0, v2}, Lcn/shuzilm/core/DUHelper;->nYfbIIFp(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-nez v2, :cond_2

    .line 30
    .line 31
    monitor-exit p0

    .line 32
    return-object v0

    .line 33
    :catchall_0
    move-exception p1

    .line 34
    goto :goto_0

    .line 35
    :cond_2
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    const-wide/16 v2, 0x78

    .line 37
    .line 38
    :try_start_2
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    .line 39
    .line 40
    .line 41
    add-int/lit8 p2, p2, 0x1

    .line 42
    .line 43
    invoke-direct {p0, p1, p2}, Lcn/shuzilm/core/DUHelper;->c(Landroid/content/Context;I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 47
    return-object p0

    .line 48
    :goto_0
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 49
    :try_start_4
    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 50
    :catchall_1
    return-object v1
.end method

.method public static declared-synchronized c(Landroid/content/Context;ILjava/lang/String;)Ljava/lang/String;
    .locals 1

    const-class v0, Lcn/shuzilm/core/DUHelper;

    monitor-enter v0

    .line 63
    :try_start_0
    invoke-static {p0, p1, p2}, Lcn/shuzilm/core/DUHelper;->c6M3YmYQ(Landroid/content/Context;ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    monitor-exit v0

    const/4 p0, 0x0

    return-object p0
.end method

.method private c(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 53
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p0

    .line 54
    invoke-virtual {p0, p2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    .line 55
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    new-instance p2, Ljava/io/BufferedReader;

    new-instance v0, Ljava/io/InputStreamReader;

    invoke-direct {v0, p0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {p2, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 57
    :goto_0
    invoke-virtual {p2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 58
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 59
    :cond_0
    invoke-virtual {p2}, Ljava/io/BufferedReader;->close()V

    .line 60
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 61
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static synthetic c(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 62
    invoke-static {p0, p1, p2}, Lcn/shuzilm/core/DUHelper;->dGZvcmRQ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private static native c6M2YmYQ(Landroid/content/Context;I)Ljava/lang/String;
.end method

.method private static native c6M3YmYQ(Landroid/content/Context;ILjava/lang/String;)Ljava/lang/String;
.end method

.method private static d(Landroid/content/Context;)I
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p0, v0, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    iget-wide v2, p0, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    .line 15
    .line 16
    long-to-int p0, v2

    .line 17
    rem-int/lit16 p0, p0, 0x2710

    .line 18
    .line 19
    new-instance v2, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-gez v0, :cond_0

    .line 41
    .line 42
    neg-int v0, v0

    .line 43
    :cond_0
    rem-int/lit16 v0, v0, 0x1388

    .line 44
    .line 45
    add-int/lit16 v0, v0, 0x2ee0

    .line 46
    .line 47
    add-int/2addr v0, p0

    .line 48
    sput v0, Lcn/shuzilm/core/DUHelper;->mPort:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    .line 50
    return v1

    .line 51
    :catch_0
    move-exception p0

    .line 52
    const/16 v0, 0x45ab

    .line 53
    .line 54
    sput v0, Lcn/shuzilm/core/DUHelper;->mPort:I

    .line 55
    .line 56
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 57
    .line 58
    .line 59
    const/4 p0, -0x1

    .line 60
    return p0
.end method

.method private d(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .line 62
    :try_start_0
    sget-object v0, Lcn/shuzilm/core/DUHelper;->o:Lorg/json/JSONObject;

    if-nez v0, :cond_0

    .line 63
    invoke-direct {p0, p1}, Lcn/shuzilm/core/DUHelper;->g(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object v0

    .line 64
    sput-object v0, Lcn/shuzilm/core/DUHelper;->o:Lorg/json/JSONObject;

    .line 65
    :cond_0
    invoke-virtual {v0, p2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static synthetic d()Ljava/lang/String;
    .locals 1

    .line 61
    sget-object v0, Lcn/shuzilm/core/DUHelper;->k:Ljava/lang/String;

    return-object v0
.end method

.method private static native dGZvcmRQ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method private e(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/16 v0, 0x80

    .line 10
    .line 11
    invoke-virtual {p0, p1, v0}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p0, p0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    .line 16
    .line 17
    invoke-virtual {p0, p2}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    return-object p0

    .line 28
    :catch_0
    :cond_0
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method public static synthetic e()Lorg/json/JSONObject;
    .locals 1

    .line 30
    sget-object v0, Lcn/shuzilm/core/DUHelper;->n:Lorg/json/JSONObject;

    return-object v0
.end method

.method private e(Landroid/content/Context;)Z
    .locals 0

    .line 31
    const/4 p0, 0x1

    return p0
.end method

.method private static f(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 51
    invoke-static {p0, p1}, Lcn/shuzilm/core/DUHelper;->b(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_0

    return-object p0

    .line 52
    :cond_0
    const-string p0, "0"

    return-object p0
.end method

.method public static synthetic f()Lorg/json/JSONObject;
    .locals 1

    .line 50
    sget-object v0, Lcn/shuzilm/core/DUHelper;->m:Lorg/json/JSONObject;

    return-object v0
.end method

.method private f(Landroid/content/Context;)Z
    .locals 2

    .line 1
    const-string p0, "connectivity"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/net/ConnectivityManager;

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    :try_start_0
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v1, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    if-ne v0, v1, :cond_0

    .line 31
    .line 32
    return p1

    .line 33
    :catch_0
    move-exception v0

    .line 34
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 35
    .line 36
    .line 37
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    .line 38
    .line 39
    .line 40
    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catch_1
    move-exception p0

    .line 45
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 46
    .line 47
    .line 48
    :cond_1
    const/4 p1, 0x0

    .line 49
    :goto_0
    return p1
.end method

.method public static f2c071(ILcn/shuzilm/core/Listener;)V
    .locals 9

    .line 1
    :try_start_0
    sget-object v0, Lcn/shuzilm/core/DUHelper;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcn/shuzilm/core/DUHelper;->c(Landroid/content/Context;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    sget-object v1, Lcn/shuzilm/core/DUHelper;->k:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v1, 0x1

    .line 15
    if-ne p0, v1, :cond_1

    .line 16
    .line 17
    sget-object v2, Lcn/shuzilm/core/DUHelper;->mContext:Landroid/content/Context;

    .line 18
    .line 19
    const-string v3, "NA"

    .line 20
    .line 21
    const-string v4, ""

    .line 22
    .line 23
    new-instance v7, Lcn/shuzilm/core/s;

    .line 24
    .line 25
    invoke-direct {v7, v0, p0, p1}, Lcn/shuzilm/core/s;-><init>(Landroid/content/Context;ILcn/shuzilm/core/Listener;)V

    .line 26
    .line 27
    .line 28
    add-int/lit8 v8, p0, 0x64

    .line 29
    .line 30
    const/4 v5, 0x0

    .line 31
    const/4 v6, 0x1

    .line 32
    invoke-static/range {v2 .. v8}, Lcn/shuzilm/core/DUHelper;->getQueryID(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZILcn/shuzilm/core/Listener;I)Ljava/util/Map;

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    sget-object v1, Lcn/shuzilm/core/DUHelper;->d:Lcn/shuzilm/core/DUHelper;

    .line 37
    .line 38
    invoke-direct {v1, v0, p0}, Lcn/shuzilm/core/DUHelper;->b(Landroid/content/Context;I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    if-eqz p1, :cond_3

    .line 43
    .line 44
    invoke-interface {p1, p0}, Lcn/shuzilm/core/Listener;->handler(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    :goto_0
    const-string p0, "[shuzilm]"

    .line 49
    .line 50
    const-string v0, "[20005] sdk init error."

    .line 51
    .line 52
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    if-eqz p1, :cond_3

    .line 56
    .line 57
    const/4 p0, 0x0

    .line 58
    invoke-interface {p1, p0}, Lcn/shuzilm/core/Listener;->handler(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    .line 60
    .line 61
    :catch_0
    :cond_3
    return-void
.end method

.method public static synthetic g()I
    .locals 2

    .line 17
    sget v0, Lcn/shuzilm/core/DUHelper;->e:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lcn/shuzilm/core/DUHelper;->e:I

    return v0
.end method

.method private g(Landroid/content/Context;)Lorg/json/JSONObject;
    .locals 1

    .line 1
    const-string v0, "cn.shuzilm.config.json"

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Lcn/shuzilm/core/DUHelper;->c(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    new-instance p1, Lorg/json/JSONObject;

    .line 10
    .line 11
    invoke-direct {p1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-object p1

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return-object p0
.end method

.method public static getQueryID(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 9

    .line 124
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 125
    new-instance v1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 126
    :try_start_0
    new-instance v7, Lcn/shuzilm/core/p;

    invoke-direct {v7, v1, v0}, Lcn/shuzilm/core/p;-><init>(Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/CountDownLatch;)V

    const/4 v8, 0x2

    const/4 v6, 0x1

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    invoke-static/range {v2 .. v8}, Lcn/shuzilm/core/DUHelper;->getQueryID(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZILcn/shuzilm/core/Listener;I)Ljava/util/Map;

    .line 127
    sget-object p0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 p1, 0x7530

    invoke-virtual {v0, p1, p2, p0}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    .line 128
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 129
    :catch_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    :catch_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getQueryID(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZILcn/shuzilm/core/Listener;I)Ljava/util/Map;
    .locals 9

    .line 1
    :try_start_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Landroid/os/Looper;->prepare()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    :catchall_0
    :cond_0
    const-string v0, "1"

    .line 11
    .line 12
    const-string v1, "0"

    .line 13
    .line 14
    const-string v2, "l_o"

    .line 15
    .line 16
    if-eqz p3, :cond_1

    .line 17
    .line 18
    const/4 p3, 0x2

    .line 19
    invoke-static {p3}, Lcn/shuzilm/core/DUHelper;->b(I)V

    .line 20
    .line 21
    .line 22
    invoke-static {v2, v1}, Lcn/shuzilm/core/DUHelper;->setConfig(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    invoke-static {v2, v0}, Lcn/shuzilm/core/DUHelper;->setConfig(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    :goto_0
    const/4 p3, 0x0

    .line 30
    :try_start_1
    new-instance v2, Ljava/util/HashMap;

    .line 31
    .line 32
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {p0}, Lcn/shuzilm/core/DUHelper;->c(Landroid/content/Context;)Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    sget-object v3, Lcn/shuzilm/core/DUHelper;->d:Lcn/shuzilm/core/DUHelper;

    .line 40
    .line 41
    iput p6, v3, Lcn/shuzilm/core/DUHelper;->C:I

    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    if-ne p4, p0, :cond_2

    .line 45
    .line 46
    move-object v5, p1

    .line 47
    move-object v6, p2

    .line 48
    move-object v7, p5

    .line 49
    move v8, p6

    .line 50
    invoke-direct/range {v3 .. v8}, Lcn/shuzilm/core/DUHelper;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcn/shuzilm/core/Listener;I)V

    .line 51
    .line 52
    .line 53
    return-object p3

    .line 54
    :catch_0
    move-exception v0

    .line 55
    move-object p0, v0

    .line 56
    goto :goto_4

    .line 57
    :cond_2
    move-object v5, p1

    .line 58
    move-object v6, p2

    .line 59
    move-object v7, p5

    .line 60
    move v8, p6

    .line 61
    sget-object p0, Lcn/shuzilm/core/DUHelper;->g:Ljava/util/concurrent/locks/Lock;

    .line 62
    .line 63
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->tryLock()Z

    .line 64
    .line 65
    .line 66
    move-result p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 67
    const-string p2, "valid"

    .line 68
    .line 69
    const-string p4, "device_id"

    .line 70
    .line 71
    if-nez p1, :cond_4

    .line 72
    .line 73
    :try_start_2
    invoke-direct {v3, v4}, Lcn/shuzilm/core/DUHelper;->i(Landroid/content/Context;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    if-nez p0, :cond_3

    .line 78
    .line 79
    invoke-direct/range {v3 .. v8}, Lcn/shuzilm/core/DUHelper;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcn/shuzilm/core/Listener;I)V

    .line 80
    .line 81
    .line 82
    :cond_3
    invoke-virtual {v2, p4, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v2, p2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    goto :goto_3

    .line 89
    :cond_4
    invoke-direct {v3, v4, v5, v6, v8}, Lcn/shuzilm/core/DUHelper;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    if-eqz p1, :cond_5

    .line 94
    .line 95
    sput-object p1, Lcn/shuzilm/core/DUHelper;->q:Ljava/lang/String;

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_5
    move-object v0, v1

    .line 99
    :goto_1
    if-nez p1, :cond_7

    .line 100
    .line 101
    sget-object p1, Lcn/shuzilm/core/DUHelper;->q:Ljava/lang/String;

    .line 102
    .line 103
    if-eqz p1, :cond_6

    .line 104
    .line 105
    goto :goto_2

    .line 106
    :cond_6
    invoke-direct {v3, v4}, Lcn/shuzilm/core/DUHelper;->i(Landroid/content/Context;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    :cond_7
    :goto_2
    invoke-virtual {v2, p4, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v2, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 117
    .line 118
    .line 119
    :goto_3
    return-object v2

    .line 120
    :goto_4
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 121
    .line 122
    .line 123
    return-object p3
.end method

.method public static go(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    :try_start_0
    invoke-static {p0}, Lcn/shuzilm/core/DUHelper;->c(Landroid/content/Context;)Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcn/shuzilm/core/DUHelper;->d:Lcn/shuzilm/core/DUHelper;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcn/shuzilm/core/DUHelper;->e(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const-string p0, "[shuzilm]"

    .line 14
    .line 15
    const-string p1, "[20002] network is unavailable."

    .line 16
    .line 17
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    sget-object v0, Lcn/shuzilm/core/DUHelper;->g:Ljava/util/concurrent/locks/Lock;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->tryLock()Z

    .line 24
    .line 25
    .line 26
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    :try_start_1
    sget-object v0, Lcn/shuzilm/core/DUHelper;->s:Ljava/util/concurrent/ExecutorService;

    .line 31
    .line 32
    new-instance v1, Lcn/shuzilm/core/n;

    .line 33
    .line 34
    invoke-direct {v1, p0, p1, p2}, Lcn/shuzilm/core/n;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 38
    .line 39
    .line 40
    :catch_0
    :try_start_2
    sget-object p0, Lcn/shuzilm/core/DUHelper;->g:Ljava/util/concurrent/locks/Lock;

    .line 41
    .line 42
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 43
    .line 44
    .line 45
    :goto_0
    return-void

    .line 46
    :catch_1
    move-exception p0

    .line 47
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public static synthetic h()I
    .locals 1

    .line 41
    sget v0, Lcn/shuzilm/core/DUHelper;->e:I

    return v0
.end method

.method private h(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    .line 1
    const/4 p0, 0x0

    .line 2
    :try_start_0
    sget-object v0, Lcn/shuzilm/core/DUHelper;->d:Lcn/shuzilm/core/DUHelper;

    .line 3
    .line 4
    const-string v1, "store"

    .line 5
    .line 6
    invoke-direct {v0, p1, v1}, Lcn/shuzilm/core/DUHelper;->d(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    instance-of v2, v1, Ljava/lang/String;

    .line 11
    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    new-instance v2, Lorg/json/JSONObject;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string v1, "metadata"

    .line 25
    .line 26
    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, "name"

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-direct {v0, p1, v1}, Lcn/shuzilm/core/DUHelper;->e(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    :catch_0
    return-object p0
.end method

.method private i(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v0, "_dna"

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p1, p0, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const/4 p1, 0x0

    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    const-string v0, "device_id"

    .line 31
    .line 32
    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_0
    return-object p1
.end method

.method public static synthetic i()Ljava/util/Timer;
    .locals 1

    .line 38
    sget-object v0, Lcn/shuzilm/core/DUHelper;->y:Ljava/util/Timer;

    return-object v0
.end method

.method public static init(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcn/shuzilm/core/DUHelper;->c(Landroid/content/Context;)Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    sput-object p2, Lcn/shuzilm/core/DUHelper;->mContext:Landroid/content/Context;

    .line 6
    .line 7
    sput-object p1, Lcn/shuzilm/core/DUHelper;->k:Ljava/lang/String;

    .line 8
    .line 9
    :try_start_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    invoke-static {}, Landroid/os/Looper;->prepare()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    .line 18
    :catchall_0
    :cond_0
    sget-object p1, Lcn/shuzilm/core/DUHelper;->s:Ljava/util/concurrent/ExecutorService;

    .line 19
    .line 20
    new-instance p2, Lcn/shuzilm/core/l;

    .line 21
    .line 22
    invoke-direct {p2, p0}, Lcn/shuzilm/core/l;-><init>(Landroid/content/Context;)V

    .line 23
    .line 24
    .line 25
    invoke-interface {p1, p2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private j(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-string v0, "sensor"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/hardware/SensorManager;

    .line 8
    .line 9
    const/16 v1, 0x9

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-direct {p0, p1, v0, v1}, Lcn/shuzilm/core/DUHelper;->a(Landroid/content/Context;Landroid/hardware/SensorManager;Landroid/hardware/Sensor;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    const/4 v1, 0x3

    .line 21
    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    invoke-direct {p0, p1, v0, v1}, Lcn/shuzilm/core/DUHelper;->a(Landroid/content/Context;Landroid/hardware/SensorManager;Landroid/hardware/Sensor;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    const/16 v1, 0xb

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-direct {p0, p1, v0, v1}, Lcn/shuzilm/core/DUHelper;->a(Landroid/content/Context;Landroid/hardware/SensorManager;Landroid/hardware/Sensor;)V

    .line 39
    .line 40
    .line 41
    :cond_2
    const/4 v1, 0x6

    .line 42
    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    invoke-direct {p0, p1, v0, v1}, Lcn/shuzilm/core/DUHelper;->a(Landroid/content/Context;Landroid/hardware/SensorManager;Landroid/hardware/Sensor;)V

    .line 49
    .line 50
    .line 51
    :cond_3
    const/4 v1, 0x1

    .line 52
    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    if-eqz v1, :cond_4

    .line 57
    .line 58
    invoke-direct {p0, p1, v0, v1}, Lcn/shuzilm/core/DUHelper;->a(Landroid/content/Context;Landroid/hardware/SensorManager;Landroid/hardware/Sensor;)V

    .line 59
    .line 60
    .line 61
    :cond_4
    const/4 v1, 0x4

    .line 62
    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    if-eqz v1, :cond_5

    .line 67
    .line 68
    invoke-direct {p0, p1, v0, v1}, Lcn/shuzilm/core/DUHelper;->a(Landroid/content/Context;Landroid/hardware/SensorManager;Landroid/hardware/Sensor;)V

    .line 69
    .line 70
    .line 71
    :cond_5
    const/4 v1, 0x5

    .line 72
    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    if-eqz v1, :cond_6

    .line 77
    .line 78
    invoke-direct {p0, p1, v0, v1}, Lcn/shuzilm/core/DUHelper;->a(Landroid/content/Context;Landroid/hardware/SensorManager;Landroid/hardware/Sensor;)V

    .line 79
    .line 80
    .line 81
    :cond_6
    const/4 v1, 0x2

    .line 82
    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    if-eqz v1, :cond_7

    .line 87
    .line 88
    invoke-direct {p0, p1, v0, v1}, Lcn/shuzilm/core/DUHelper;->a(Landroid/content/Context;Landroid/hardware/SensorManager;Landroid/hardware/Sensor;)V

    .line 89
    .line 90
    .line 91
    :cond_7
    return-void
.end method

.method private static declared-synchronized k(Landroid/content/Context;)V
    .locals 5

    .line 1
    const-class v0, Lcn/shuzilm/core/DUHelper;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcn/shuzilm/core/DUHelper;->x:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return-void

    .line 10
    :cond_0
    :try_start_1
    sget v1, Lcn/shuzilm/core/DUHelper;->e:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    .line 12
    if-lez v1, :cond_1

    .line 13
    .line 14
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :cond_1
    const/4 v1, 0x1

    .line 17
    :try_start_2
    sput-boolean v1, Lcn/shuzilm/core/DUHelper;->x:Z

    .line 18
    .line 19
    new-instance v1, Ljava/util/Timer;

    .line 20
    .line 21
    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    .line 22
    .line 23
    .line 24
    sput-object v1, Lcn/shuzilm/core/DUHelper;->y:Ljava/util/Timer;

    .line 25
    .line 26
    new-instance v2, Lcn/shuzilm/core/d;

    .line 27
    .line 28
    invoke-direct {v2, p0}, Lcn/shuzilm/core/d;-><init>(Landroid/content/Context;)V

    .line 29
    .line 30
    .line 31
    const-wide/16 v3, 0x7530

    .line 32
    .line 33
    invoke-virtual {v1, v2, v3, v4}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    .line 35
    .line 36
    :catchall_0
    monitor-exit v0

    .line 37
    return-void
.end method

.method private static l(Landroid/content/Context;)V
    .locals 4

    .line 1
    sget-object v0, Lcn/shuzilm/core/DUHelper;->d:Lcn/shuzilm/core/DUHelper;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcn/shuzilm/core/DUHelper;->e(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    :try_start_0
    sget-object v0, Lcn/shuzilm/core/DUHelper;->mContext:Landroid/content/Context;

    .line 11
    .line 12
    const-string v1, "android.permission.CHANGE_NETWORK_STATE"

    .line 13
    .line 14
    invoke-static {v0, v1}, Lcn/shuzilm/core/u;->a(Landroid/content/Context;Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    invoke-static {p0}, Lcn/shuzilm/core/u;->a(Landroid/content/Context;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    sget-object v0, Lcn/shuzilm/core/DUHelper;->mContext:Landroid/content/Context;

    .line 28
    .line 29
    const-string v1, "connectivity"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Landroid/net/ConnectivityManager;

    .line 36
    .line 37
    new-instance v1, Landroid/net/NetworkRequest$Builder;

    .line 38
    .line 39
    invoke-direct {v1}, Landroid/net/NetworkRequest$Builder;-><init>()V

    .line 40
    .line 41
    .line 42
    const/16 v2, 0xc

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Landroid/net/NetworkRequest$Builder;->addCapability(I)Landroid/net/NetworkRequest$Builder;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    const/4 v2, 0x0

    .line 49
    invoke-virtual {v1, v2}, Landroid/net/NetworkRequest$Builder;->addTransportType(I)Landroid/net/NetworkRequest$Builder;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1}, Landroid/net/NetworkRequest$Builder;->build()Landroid/net/NetworkRequest;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    new-instance v2, Lcn/shuzilm/core/h;

    .line 58
    .line 59
    invoke-direct {v2, p0}, Lcn/shuzilm/core/h;-><init>(Landroid/content/Context;)V

    .line 60
    .line 61
    .line 62
    const/4 v3, 0x2

    .line 63
    invoke-static {p0, v2, v3}, Lcn/shuzilm/core/DUHelper;->oxlbmV0d(Landroid/content/Context;Ljava/lang/Object;I)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1, v2}, Landroid/net/ConnectivityManager;->requestNetwork(Landroid/net/NetworkRequest;Landroid/net/ConnectivityManager$NetworkCallback;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    .line 68
    .line 69
    :catchall_0
    :cond_2
    :goto_0
    return-void
.end method

.method public static loadLibrary()V
    .locals 2

    .line 1
    sget-object v0, Lcn/shuzilm/core/DUHelper;->s:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    new-instance v1, Lcn/shuzilm/core/k;

    .line 4
    .line 5
    invoke-direct {v1}, Lcn/shuzilm/core/k;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private static m(Landroid/content/Context;)Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 5
    .line 6
    .line 7
    new-instance v1, Ljava/util/concurrent/atomic/AtomicReference;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 10
    .line 11
    .line 12
    :try_start_0
    new-instance v2, Lcn/shuzilm/core/i;

    .line 13
    .line 14
    invoke-direct {v2, v1, v0}, Lcn/shuzilm/core/i;-><init>(Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/CountDownLatch;)V

    .line 15
    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    invoke-static {p0, v2, v3, v3}, Lcn/shuzilm/core/DUHelper;->ZVTFJRA(Landroid/content/Context;Lcn/shuzilm/core/Listener;IZ)V

    .line 19
    .line 20
    .line 21
    sget-object p0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 22
    .line 23
    const-wide/16 v2, 0x64

    .line 24
    .line 25
    invoke-virtual {v0, v2, v3, p0}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    if-eqz p0, :cond_0

    .line 35
    .line 36
    return-object p0

    .line 37
    :catch_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 42
    .line 43
    .line 44
    :catch_1
    :cond_0
    const-string p0, "0"

    .line 45
    .line 46
    return-object p0
.end method

.method public static m(Landroid/content/Context;ILcn/shuzilm/core/Listener;)V
    .locals 1

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    .line 47
    sget-object p1, Lcn/shuzilm/core/DUHelper;->u:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Lcn/shuzilm/core/j;

    invoke-direct {v0, p0, p2}, Lcn/shuzilm/core/j;-><init>(Landroid/content/Context;Lcn/shuzilm/core/Listener;)V

    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public static n(Landroid/content/Context;)Ljava/lang/String;
    .locals 14

    .line 1
    const-string v0, "0"

    .line 2
    .line 3
    const-string v1, "2,"

    .line 4
    .line 5
    const-string v2, "1,"

    .line 6
    .line 7
    sget-object v3, Lcn/shuzilm/core/DUHelper;->d:Lcn/shuzilm/core/DUHelper;

    .line 8
    .line 9
    iget-boolean v4, v3, Lcn/shuzilm/core/DUHelper;->D:Z

    .line 10
    .line 11
    const-string v5, ""

    .line 12
    .line 13
    if-eqz v4, :cond_0

    .line 14
    .line 15
    const/16 v4, 0x1f5

    .line 16
    .line 17
    const/4 v6, 0x0

    .line 18
    invoke-static {p0, v4, v6}, Lcn/shuzilm/core/DUHelper;->c(Landroid/content/Context;ILjava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move-object v4, v5

    .line 24
    :goto_0
    :try_start_0
    new-instance v6, Lorg/json/JSONObject;

    .line 25
    .line 26
    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 27
    .line 28
    .line 29
    if-nez v4, :cond_1

    .line 30
    .line 31
    move-object v4, v0

    .line 32
    :cond_1
    const-string v7, "x1"

    .line 33
    .line 34
    invoke-virtual {v6, v7, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 35
    .line 36
    .line 37
    iget-boolean v4, v3, Lcn/shuzilm/core/DUHelper;->D:Z

    .line 38
    .line 39
    if-eqz v4, :cond_2

    .line 40
    .line 41
    invoke-static {p0}, Lcn/shuzilm/core/DUHelper;->m(Landroid/content/Context;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    :cond_2
    const-string v4, "x2"

    .line 46
    .line 47
    invoke-virtual {v6, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 48
    .line 49
    .line 50
    const-string v4, "x3"

    .line 51
    .line 52
    new-instance v5, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 55
    .line 56
    .line 57
    sget-object v7, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v7, ","

    .line 63
    .line 64
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    sget-object v7, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    invoke-virtual {v6, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 77
    .line 78
    .line 79
    const-string v4, "x4"

    .line 80
    .line 81
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    invoke-virtual {v5}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    invoke-virtual {v6, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 90
    .line 91
    .line 92
    invoke-direct {v3, p0}, Lcn/shuzilm/core/DUHelper;->f(Landroid/content/Context;)Z

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    const-string v4, "x5"

    .line 97
    .line 98
    invoke-virtual {v6, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 99
    .line 100
    .line 101
    invoke-static {p0}, Lcn/shuzilm/core/u;->a(Landroid/content/Context;)Z

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    const-string v4, "x6"

    .line 106
    .line 107
    invoke-virtual {v6, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 108
    .line 109
    .line 110
    const-string v3, "660252AEC9476C1C43EF3FB903B3A60E"

    .line 111
    .line 112
    invoke-static {p0, v3}, Lcn/shuzilm/core/DUHelper;->f(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    const-string v4, "x7"

    .line 117
    .line 118
    invoke-virtual {v6, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 119
    .line 120
    .line 121
    invoke-static {p0}, Lcn/shuzilm/core/DUHelper;->o(Landroid/content/Context;)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    const-string v4, "x8"

    .line 126
    .line 127
    invoke-virtual {v6, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 128
    .line 129
    .line 130
    const-string v3, "x9"

    .line 131
    .line 132
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 133
    .line 134
    invoke-virtual {v6, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 135
    .line 136
    .line 137
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 138
    .line 139
    .line 140
    move-result-wide v3

    .line 141
    sget-wide v7, Lcn/shuzilm/core/DUHelper;->w:J

    .line 142
    .line 143
    const-wide/16 v9, 0x0

    .line 144
    .line 145
    cmp-long v5, v7, v9

    .line 146
    .line 147
    if-lez v5, :cond_3

    .line 148
    .line 149
    sget-wide v11, Lcn/shuzilm/core/DUHelper;->v:J

    .line 150
    .line 151
    cmp-long v13, v11, v9

    .line 152
    .line 153
    if-lez v13, :cond_3

    .line 154
    .line 155
    sub-long/2addr v7, v11

    .line 156
    new-instance v1, Ljava/lang/StringBuilder;

    .line 157
    .line 158
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v1, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    goto :goto_1

    .line 169
    :cond_3
    if-nez v5, :cond_4

    .line 170
    .line 171
    sget-wide v7, Lcn/shuzilm/core/DUHelper;->v:J

    .line 172
    .line 173
    cmp-long v2, v7, v9

    .line 174
    .line 175
    if-lez v2, :cond_4

    .line 176
    .line 177
    sub-long v7, v3, v7

    .line 178
    .line 179
    new-instance v2, Ljava/lang/StringBuilder;

    .line 180
    .line 181
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {v2, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    goto :goto_1

    .line 192
    :cond_4
    if-nez v5, :cond_5

    .line 193
    .line 194
    sget-wide v1, Lcn/shuzilm/core/DUHelper;->v:J

    .line 195
    .line 196
    cmp-long v1, v1, v9

    .line 197
    .line 198
    if-nez v1, :cond_5

    .line 199
    .line 200
    const-string v1, "3"

    .line 201
    .line 202
    goto :goto_1

    .line 203
    :cond_5
    move-object v1, v0

    .line 204
    :goto_1
    const-string v2, "x10"

    .line 205
    .line 206
    invoke-virtual {v6, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 207
    .line 208
    .line 209
    const-string v1, "x0"

    .line 210
    .line 211
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    invoke-virtual {v6, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 216
    .line 217
    .line 218
    const-string v1, "2C281B48F6E872759F787C4106451E4D"

    .line 219
    .line 220
    invoke-static {p0, v1}, Lcn/shuzilm/core/DUHelper;->f(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    const-string v1, "x11"

    .line 225
    .line 226
    invoke-virtual {v6, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 227
    .line 228
    .line 229
    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 233
    return-object p0

    .line 234
    :catchall_0
    return-object v0
.end method

.method private static native nYfbIIFp(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method private static native ntERIJNQ(Landroid/content/Context;ILjava/lang/String;)Ljava/lang/String;
.end method

.method private static o(Landroid/content/Context;)Ljava/lang/String;
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuffer;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "connectivity"

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Landroid/net/ConnectivityManager;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {p0, v1}, Landroid/net/ConnectivityManager;->getLinkProperties(Landroid/net/Network;)Landroid/net/LinkProperties;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Landroid/net/LinkProperties;->getInterfaceName()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p0}, Landroid/net/LinkProperties;->getHttpProxy()Landroid/net/ProxyInfo;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {p0}, Landroid/net/LinkProperties;->getDnsServers()Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    const-string v4, "0,"

    .line 39
    .line 40
    const-string v5, ","

    .line 41
    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    :try_start_1
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 45
    .line 46
    .line 47
    move-result v6

    .line 48
    if-eqz v6, :cond_0

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-virtual {v1, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    :goto_0
    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 60
    .line 61
    .line 62
    :goto_1
    if-eqz v2, :cond_2

    .line 63
    .line 64
    new-instance v1, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2}, Landroid/net/ProxyInfo;->getHost()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {v2}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 88
    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_2
    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 92
    .line 93
    .line 94
    :goto_2
    const/4 v1, 0x0

    .line 95
    :goto_3
    if-ge v1, v3, :cond_3

    .line 96
    .line 97
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    check-cast v2, Ljava/net/InetAddress;

    .line 102
    .line 103
    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-virtual {v2}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    new-instance v4, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    const-string v2, "-"

    .line 120
    .line 121
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 129
    .line 130
    .line 131
    add-int/lit8 v1, v1, 0x1

    .line 132
    .line 133
    goto :goto_3

    .line 134
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 138
    return-object p0

    .line 139
    :catchall_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 144
    .line 145
    .line 146
    move-result p0

    .line 147
    if-lez p0, :cond_4

    .line 148
    .line 149
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    return-object p0

    .line 154
    :cond_4
    const-string p0, "0"

    .line 155
    .line 156
    return-object p0
.end method

.method public static o(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZILcn/shuzilm/core/Listener;I)V
    .locals 1

    const/16 v0, 0x259

    .line 157
    invoke-static {p0, v0, p2}, Lcn/shuzilm/core/DUHelper;->c(Landroid/content/Context;ILjava/lang/String;)Ljava/lang/String;

    .line 158
    invoke-static/range {p0 .. p6}, Lcn/shuzilm/core/DUHelper;->getQueryID(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZILcn/shuzilm/core/Listener;I)Ljava/util/Map;

    return-void
.end method

.method private static native onEvent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static onEvent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILcn/shuzilm/core/Listener;)Ljava/util/Map;
    .locals 8

    .line 1
    :try_start_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Landroid/os/Looper;->prepare()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    :catchall_0
    :cond_0
    const/4 v1, 0x0

    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    return-object v1

    .line 14
    :cond_1
    :try_start_1
    invoke-static {p0}, Lcn/shuzilm/core/DUHelper;->c(Landroid/content/Context;)Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    const/4 p0, 0x1

    .line 19
    if-ne p3, p0, :cond_2

    .line 20
    .line 21
    sget-object v2, Lcn/shuzilm/core/DUHelper;->d:Lcn/shuzilm/core/DUHelper;

    .line 22
    .line 23
    const/4 v5, 0x0

    .line 24
    move-object v4, p1

    .line 25
    move-object v6, p2

    .line 26
    move-object v7, p4

    .line 27
    invoke-direct/range {v2 .. v7}, Lcn/shuzilm/core/DUHelper;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcn/shuzilm/core/Listener;)V

    .line 28
    .line 29
    .line 30
    return-object v1

    .line 31
    :catch_0
    move-exception v0

    .line 32
    move-object p0, v0

    .line 33
    goto :goto_0

    .line 34
    :cond_2
    move-object v4, p1

    .line 35
    move-object v6, p2

    .line 36
    move-object v7, p4

    .line 37
    new-instance p0, Ljava/util/HashMap;

    .line 38
    .line 39
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 40
    .line 41
    .line 42
    sget-object p1, Lcn/shuzilm/core/DUHelper;->g:Ljava/util/concurrent/locks/Lock;

    .line 43
    .line 44
    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->tryLock()Z

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-nez p2, :cond_3

    .line 49
    .line 50
    sget-object v2, Lcn/shuzilm/core/DUHelper;->d:Lcn/shuzilm/core/DUHelper;

    .line 51
    .line 52
    const/4 v5, 0x0

    .line 53
    invoke-direct/range {v2 .. v7}, Lcn/shuzilm/core/DUHelper;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcn/shuzilm/core/Listener;)V

    .line 54
    .line 55
    .line 56
    return-object v1

    .line 57
    :cond_3
    sget-object p2, Lcn/shuzilm/core/DUHelper;->d:Lcn/shuzilm/core/DUHelper;

    .line 58
    .line 59
    invoke-direct {p2, v3, v4, v1, v6}, Lcn/shuzilm/core/DUHelper;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    const-string p3, "SessionID"

    .line 64
    .line 65
    invoke-virtual {p0, p3, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    const-string p2, "QueryID"

    .line 69
    .line 70
    sget-object p3, Lcn/shuzilm/core/DUHelper;->q:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {p0, p2, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 76
    .line 77
    .line 78
    return-object p0

    .line 79
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 80
    .line 81
    .line 82
    return-object v1
.end method

.method private static native onIEvent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static onIEvent(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p0}, Lcn/shuzilm/core/DUHelper;->c(Landroid/content/Context;)Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :try_start_0
    sget-object v0, Lcn/shuzilm/core/DUHelper;->s:Ljava/util/concurrent/ExecutorService;

    .line 6
    .line 7
    new-instance v1, Lcn/shuzilm/core/c;

    .line 8
    .line 9
    invoke-direct {v1, p1, p0}, Lcn/shuzilm/core/c;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    :catch_0
    return-void
.end method

.method private static native onSSChanged(Landroid/content/Context;Landroid/telephony/SignalStrength;)V
.end method

.method private static native onSensorChanged(Landroid/content/Context;Landroid/hardware/SensorEvent;)V
.end method

.method private static native oxlbmV0d(Landroid/content/Context;Ljava/lang/Object;I)V
.end method

.method private static native query(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
.end method

.method public static report(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    :try_start_0
    invoke-static {p0}, Lcn/shuzilm/core/DUHelper;->c(Landroid/content/Context;)Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcn/shuzilm/core/DUHelper;->d:Lcn/shuzilm/core/DUHelper;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcn/shuzilm/core/DUHelper;->e(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const-string p0, "[shuzilm]"

    .line 14
    .line 15
    const-string p1, "[20003] network is unavailable."

    .line 16
    .line 17
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    sget-object v0, Lcn/shuzilm/core/DUHelper;->g:Ljava/util/concurrent/locks/Lock;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->tryLock()Z

    .line 24
    .line 25
    .line 26
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    :try_start_1
    sget-object v0, Lcn/shuzilm/core/DUHelper;->s:Ljava/util/concurrent/ExecutorService;

    .line 31
    .line 32
    new-instance v1, Lcn/shuzilm/core/o;

    .line 33
    .line 34
    invoke-direct {v1, p0, p1, p2}, Lcn/shuzilm/core/o;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 38
    .line 39
    .line 40
    :catch_0
    :try_start_2
    sget-object p0, Lcn/shuzilm/core/DUHelper;->g:Ljava/util/concurrent/locks/Lock;

    .line 41
    .line 42
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 43
    .line 44
    .line 45
    :goto_0
    return-void

    .line 46
    :catch_1
    move-exception p0

    .line 47
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method private static native reportRun(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method private static native run(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static s(Landroid/content/Context;I)Ljava/lang/String;
    .locals 3

    .line 1
    const-string v0, "i"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v2, "_dna"

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const/4 v2, 0x0

    .line 43
    invoke-virtual {p0, v0, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    if-eqz p0, :cond_0

    .line 48
    .line 49
    invoke-interface {p0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    return-object p0

    .line 54
    :catchall_0
    :cond_0
    return-object v1
.end method

.method public static setConfig(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    :try_start_0
    sget-object v0, Lcn/shuzilm/core/DUHelper;->d:Lcn/shuzilm/core/DUHelper;

    .line 7
    .line 8
    sget-object v1, Lcn/shuzilm/core/DUHelper;->n:Lorg/json/JSONObject;

    .line 9
    .line 10
    invoke-direct {v0, v1, p0, p1}, Lcn/shuzilm/core/DUHelper;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    :catchall_0
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_1
    :goto_0
    const/4 p0, -0x1

    .line 16
    return p0
.end method

.method public static setData(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2

    .line 1
    sget-object v0, Lcn/shuzilm/core/DUHelper;->d:Lcn/shuzilm/core/DUHelper;

    .line 2
    .line 3
    sget-object v1, Lcn/shuzilm/core/DUHelper;->m:Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-direct {v0, v1, p0, p1}, Lcn/shuzilm/core/DUHelper;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public static sl(Landroid/content/Context;Landroid/content/IntentFilter;)I
    .locals 2

    .line 1
    :try_start_0
    sget-object v0, Lcn/shuzilm/core/DUHelper;->z:Lcn/shuzilm/core/t;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcn/shuzilm/core/t;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-direct {v0, v1}, Lcn/shuzilm/core/t;-><init>(Lcn/shuzilm/core/k;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcn/shuzilm/core/DUHelper;->z:Lcn/shuzilm/core/t;

    .line 12
    .line 13
    :cond_0
    sget-object v0, Lcn/shuzilm/core/DUHelper;->A:Ljava/util/Timer;

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    sget-object v0, Lcn/shuzilm/core/DUHelper;->z:Lcn/shuzilm/core/t;

    .line 18
    .line 19
    invoke-static {p0, v0, p1}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    new-instance p0, Ljava/util/Timer;

    .line 23
    .line 24
    invoke-direct {p0}, Ljava/util/Timer;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object p0, Lcn/shuzilm/core/DUHelper;->A:Ljava/util/Timer;

    .line 28
    .line 29
    sget-object p1, Lcn/shuzilm/core/DUHelper;->B:Ljava/util/TimerTask;

    .line 30
    .line 31
    const-wide/16 v0, 0x2710

    .line 32
    .line 33
    invoke-virtual {p0, p1, v0, v1}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    :catch_0
    :cond_1
    const/4 p0, 0x0

    .line 37
    return p0
.end method

.method private static native ttERIJNQ(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static ul(I)I
    .locals 2

    .line 1
    :try_start_0
    sget-object v0, Lcn/shuzilm/core/DUHelper;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    sget-object v1, Lcn/shuzilm/core/DUHelper;->z:Lcn/shuzilm/core/t;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    :catch_0
    if-nez p0, :cond_0

    .line 9
    .line 10
    :try_start_1
    new-instance p0, Landroid/content/Intent;

    .line 11
    .line 12
    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v0, "MTZiMjcx"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    sget-object v0, Lcn/shuzilm/core/DUHelper;->mContext:Landroid/content/Context;

    .line 21
    .line 22
    invoke-static {v0, p0}, Lcn/shuzilm/core/DUHelper;->aXZlZWNl(Landroid/content/Context;Landroid/content/Intent;)V

    .line 23
    .line 24
    .line 25
    sget-object p0, Lcn/shuzilm/core/DUHelper;->A:Ljava/util/Timer;

    .line 26
    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/util/Timer;->cancel()V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    sput-object p0, Lcn/shuzilm/core/DUHelper;->A:Ljava/util/Timer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 34
    .line 35
    :catch_1
    :cond_0
    const/4 p0, -0x1

    .line 36
    return p0
.end method

.method public static unResListener()I
    .locals 3

    .line 1
    :try_start_0
    sget-object v0, Lcn/shuzilm/core/DUHelper;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    const-string v1, "phone"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 10
    .line 11
    sget-object v1, Lcn/shuzilm/core/DUHelper;->d:Lcn/shuzilm/core/DUHelper;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    return v2

    .line 18
    :catch_0
    const/4 v0, -0x1

    .line 19
    return v0
.end method

.method private static native zZVTFJRA(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
.end method


# virtual methods
.method public onSignalStrengthsChanged(Landroid/telephony/SignalStrength;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/telephony/PhoneStateListener;->onSignalStrengthsChanged(Landroid/telephony/SignalStrength;)V

    .line 2
    .line 3
    .line 4
    :try_start_0
    sget-object p0, Lcn/shuzilm/core/DUHelper;->mContext:Landroid/content/Context;

    .line 5
    .line 6
    invoke-static {p0, p1}, Lcn/shuzilm/core/DUHelper;->onSSChanged(Landroid/content/Context;Landroid/telephony/SignalStrength;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :catch_0
    move-exception p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    return-void
.end method
