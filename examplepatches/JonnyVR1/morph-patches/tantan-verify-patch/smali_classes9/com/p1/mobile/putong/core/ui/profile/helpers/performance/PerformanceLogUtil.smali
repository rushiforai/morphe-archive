.class public Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil$FindCall;
    }
.end annotation


# static fields
.field private static final instance:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;

.field private static final logDirName:Ljava/lang/String; = "profilePerformances"

.field private static final suffix:Ljava/lang/String; = ".json"


# instance fields
.field private final beginLogs:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity<",
            "*>;>;"
        }
    .end annotation
.end field

.field private final gson:Lcom/google/gson/Gson;

.field private final logs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity<",
            "+",
            "Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogName;",
            ">;>;"
        }
    .end annotation
.end field

.field private preFix:Ljava/lang/String;

.field private final singleThreadExecutor:Ljava/util/concurrent/ExecutorService;

.field public volatile tranceHash:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->instance:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "profile_frag_"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->preFix:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v0, Lcom/google/gson/Gson;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->gson:Lcom/google/gson/Gson;

    .line 14
    .line 15
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->singleThreadExecutor:Ljava/util/concurrent/ExecutorService;

    .line 20
    .line 21
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ljava/util/UUID;->hashCode()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->tranceHash:I

    .line 30
    .line 31
    new-instance v0, Ljava/util/ArrayList;

    .line 32
    .line 33
    const/16 v1, 0x400

    .line 34
    .line 35
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logs:Ljava/util/List;

    .line 39
    .line 40
    new-instance v0, Ljava/util/HashMap;

    .line 41
    .line 42
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->beginLogs:Ljava/util/HashMap;

    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->needBlockCall()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->preFix:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string v1, "R_"

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->preFix:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->globalLifecycle()Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v1, Ll/kr60;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Ll/kr60;-><init>(Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;)V

    .line 82
    .line 83
    .line 84
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->lambda$new$2()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;Ljava/util/HashMap;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->lambda$new$3(Ljava/util/HashMap;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;)Z
    .locals 0

    .line 1
    iget p1, p1, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;->traceHash:I

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;->traceHash:I

    .line 4
    .line 5
    if-ne p1, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method private closeQuietly(Ljava/io/Closeable;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    :try_start_0
    invoke-interface {p1}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :catch_0
    move-exception p0

    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;JLcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;IILjava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->instance()Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;->builder()Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogBuilder;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;->logName(Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogName;)Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;->logTime(J)Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;->type(Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;)Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;->tranceHash(I)Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0, p5}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;->bindHash(I)Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0, p6}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;->logDescription(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;->build()Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;

    .line 38
    .line 39
    iget-object p3, v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logs:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    .line 42
    .line 43
    .line 44
    move-result p3

    .line 45
    if-nez p3, :cond_0

    .line 46
    .line 47
    iget-object p1, v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logs:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    add-int/lit8 p2, p2, -0x1

    .line 54
    .line 55
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;

    .line 60
    .line 61
    iget-wide p1, p1, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;->logTime:J

    .line 62
    .line 63
    :cond_0
    iget-wide p3, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;->logTime:J

    .line 64
    .line 65
    sub-long/2addr p3, p1

    .line 66
    iput-wide p3, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;->durationLast:J

    .line 67
    .line 68
    iget-object p1, v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logs:Ljava/util/List;

    .line 69
    .line 70
    new-instance p2, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/a;

    .line 71
    .line 72
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/a;-><init>(Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;)V

    .line 73
    .line 74
    .line 75
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->find(Ljava/util/List;Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil$FindCall;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;

    .line 80
    .line 81
    if-eqz p1, :cond_1

    .line 82
    .line 83
    iget-wide p2, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;->logTime:J

    .line 84
    .line 85
    iget-wide p4, p1, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;->logTime:J

    .line 86
    .line 87
    sub-long/2addr p2, p4

    .line 88
    iput-wide p2, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;->durationTrace:J

    .line 89
    .line 90
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;->type:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;

    .line 91
    .line 92
    sget-object p2, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;->BEGIN:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;

    .line 93
    .line 94
    if-ne p1, p2, :cond_2

    .line 95
    .line 96
    iget-object p1, v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->beginLogs:Ljava/util/HashMap;

    .line 97
    .line 98
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;->bindHash:I

    .line 99
    .line 100
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    invoke-virtual {p1, p2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_2
    sget-object p2, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;->END:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;

    .line 109
    .line 110
    if-ne p1, p2, :cond_3

    .line 111
    .line 112
    iget-object p1, v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->beginLogs:Ljava/util/HashMap;

    .line 113
    .line 114
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;->bindHash:I

    .line 115
    .line 116
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 117
    .line 118
    .line 119
    move-result-object p2

    .line 120
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;

    .line 125
    .line 126
    if-eqz p1, :cond_4

    .line 127
    .line 128
    iget-wide p1, p1, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;->logTime:J

    .line 129
    .line 130
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;->durationTime(J)J

    .line 131
    .line 132
    .line 133
    move-result-wide p1

    .line 134
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;->durationBegin:J

    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_3
    sget-object p2, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;->SINGLE:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;

    .line 138
    .line 139
    if-ne p1, p2, :cond_4

    .line 140
    .line 141
    const-wide/16 p1, 0x0

    .line 142
    .line 143
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;->durationBegin:J

    .line 144
    .line 145
    :cond_4
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->instance()Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logEntity(Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;)V

    .line 150
    .line 151
    .line 152
    return-void
.end method

.method private static find(Ljava/util/List;Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil$FindCall;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TT;>;",
            "Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil$FindCall<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_3

    .line 3
    .line 4
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/lit8 v1, v1, -0x1

    .line 16
    .line 17
    :goto_0
    if-ltz v1, :cond_3

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_2

    .line 28
    .line 29
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-interface {p1, v3}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil$FindCall;->isFind(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-eqz v4, :cond_1

    .line 38
    .line 39
    return-object v3

    .line 40
    :cond_2
    add-int/lit8 v1, v1, -0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_3
    :goto_1
    return-object v0
.end method

.method private getLogDir()Ljava/io/File;
    .locals 2

    .line 1
    new-instance p0, Ljava/io/File;

    .line 2
    .line 3
    invoke-static {}, Ll/oki;->v()Ljava/io/File;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "profilePerformances"

    .line 8
    .line 9
    invoke-direct {p0, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public static instance()Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->instance:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;

    .line 2
    .line 3
    return-object v0
.end method

.method private synthetic lambda$new$2()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->writeLogFile()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$new$3(Ljava/util/HashMap;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->singleThreadExecutor:Ljava/util/concurrent/ExecutorService;

    .line 9
    .line 10
    new-instance v0, Ll/ir60;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/ir60;-><init>(Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p1, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static logBegin(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->needBlockCall()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;->BEGIN:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logPerformance(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static logBegin(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;Ljava/lang/String;)V
    .locals 1

    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->needBlockCall()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 16
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;->BEGIN:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;

    invoke-static {p0, p1, v0, p2}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logPerformance(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;Ljava/lang/String;)V

    return-void
.end method

.method public static logEnd(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->needBlockCall()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;->END:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logPerformance(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static logEnd(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;Ljava/lang/String;)V
    .locals 1

    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->needBlockCall()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 16
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;->END:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;

    invoke-static {p0, p1, v0, p2}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logPerformance(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;Ljava/lang/String;)V

    return-void
.end method

.method private declared-synchronized logEntity(Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;)V
    .locals 1
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity<",
            "+",
            "Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogName;",
            ">;>(TT;)V"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logs:Ljava/util/List;

    .line 3
    .line 4
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p1

    .line 10
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw p1
.end method

.method private static logPerformance(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;Ljava/lang/String;)V
    .locals 8

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v2

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->instance:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;

    .line 6
    .line 7
    iget v5, v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->tranceHash:I

    .line 8
    .line 9
    new-instance v0, Ll/jr60;

    .line 10
    .line 11
    move v6, p0

    .line 12
    move-object v1, p1

    .line 13
    move-object v4, p2

    .line 14
    move-object v7, p3

    .line 15
    invoke-direct/range {v0 .. v7}, Ll/jr60;-><init>(Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;JLcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;IILjava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->instance()Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->singleThreadExecutor:Ljava/util/concurrent/ExecutorService;

    .line 23
    .line 24
    invoke-interface {p0, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static logSingle(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->needBlockCall()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;->CUSTOM:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;

    .line 13
    .line 14
    sget-object v2, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;->SINGLE:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;

    .line 15
    .line 16
    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logPerformance(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static needBlockCall()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method private writeLogFile()V
    .locals 7

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->needBlockCall()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->getLogDir()Ljava/io/File;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-nez v2, :cond_1

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/io/File;->mkdir()Z

    .line 24
    .line 25
    .line 26
    :cond_1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    new-instance v3, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->preFix:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const/4 v4, 0x1

    .line 41
    invoke-virtual {v2, v4}, Ljava/util/Calendar;->get(I)I

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v5, ""

    .line 49
    .line 50
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const/4 v6, 0x2

    .line 54
    invoke-virtual {v2, v6}, Ljava/util/Calendar;->get(I)I

    .line 55
    .line 56
    .line 57
    move-result v6

    .line 58
    add-int/2addr v6, v4

    .line 59
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const/4 v5, 0x5

    .line 66
    invoke-virtual {v2, v5}, Ljava/util/Calendar;->get(I)I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v2, ".json"

    .line 74
    .line 75
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    new-instance v3, Ljava/io/File;

    .line 83
    .line 84
    invoke-direct {v3, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    const/4 v1, 0x0

    .line 88
    :try_start_0
    invoke-static {v3, v4}, Lokio/Okio;->sink(Ljava/io/File;Z)Lokio/Sink;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    new-instance v2, Lokio/Buffer;

    .line 93
    .line 94
    invoke-direct {v2}, Lokio/Buffer;-><init>()V

    .line 95
    .line 96
    .line 97
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logs:Ljava/util/List;

    .line 98
    .line 99
    invoke-interface {v0, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 100
    .line 101
    .line 102
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    if-eqz v3, :cond_2

    .line 111
    .line 112
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;

    .line 117
    .line 118
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->gson:Lcom/google/gson/Gson;

    .line 119
    .line 120
    invoke-virtual {v4, v3}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 125
    .line 126
    invoke-virtual {v2, v3, v4}, Lokio/Buffer;->writeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lokio/Buffer;

    .line 127
    .line 128
    .line 129
    const-string v3, "\n"

    .line 130
    .line 131
    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    invoke-virtual {v2, v3}, Lokio/Buffer;->write([B)Lokio/Buffer;

    .line 136
    .line 137
    .line 138
    goto :goto_0

    .line 139
    :catchall_0
    move-exception v0

    .line 140
    goto :goto_2

    .line 141
    :catch_0
    move-exception v0

    .line 142
    goto :goto_1

    .line 143
    :cond_2
    invoke-virtual {v2}, Lokio/Buffer;->size()J

    .line 144
    .line 145
    .line 146
    move-result-wide v3

    .line 147
    invoke-interface {v1, v2, v3, v4}, Lokio/Sink;->write(Lokio/Buffer;J)V

    .line 148
    .line 149
    .line 150
    invoke-interface {v1}, Lokio/Sink;->flush()V

    .line 151
    .line 152
    .line 153
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logs:Ljava/util/List;

    .line 154
    .line 155
    invoke-interface {v0}, Ljava/util/List;->clear()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 156
    .line 157
    .line 158
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->closeQuietly(Ljava/io/Closeable;)V

    .line 159
    .line 160
    .line 161
    return-void

    .line 162
    :goto_1
    :try_start_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 166
    .line 167
    .line 168
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->closeQuietly(Ljava/io/Closeable;)V

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    :goto_2
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->closeQuietly(Ljava/io/Closeable;)V

    .line 173
    .line 174
    .line 175
    throw v0
.end method


# virtual methods
.method public beginTrance()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->needBlockCall()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ljava/util/UUID;->hashCode()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->tranceHash:I

    .line 17
    .line 18
    return-void
.end method

.method public endTrance()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->needBlockCall()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ljava/util/UUID;->hashCode()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->tranceHash:I

    .line 17
    .line 18
    return-void
.end method
