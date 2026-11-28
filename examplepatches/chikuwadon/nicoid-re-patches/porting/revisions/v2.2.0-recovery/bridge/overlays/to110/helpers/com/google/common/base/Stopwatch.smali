.class public final Lcom/google/common/base/Stopwatch;
.super Ljava/lang/Object;
.source "Stopwatch.java"


# instance fields
.field private elapsedNanos:J

.field private isRunning:Z

.field private startTick:J

.field private final ticker:Lcom/google/common/base/Ticker;


# direct methods
.method constructor <init>()V
    .registers 2

    .line 141
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 142
    invoke-static {}, Lcom/google/common/base/Ticker;->systemTicker()Lcom/google/common/base/Ticker;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/base/Stopwatch;->ticker:Lcom/google/common/base/Ticker;

    return-void
.end method

.method constructor <init>(Lcom/google/common/base/Ticker;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ticker"
        }
    .end annotation

    .line 145
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 146
    const-string v0, "ticker"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/base/Ticker;

    iput-object p1, p0, Lcom/google/common/base/Stopwatch;->ticker:Lcom/google/common/base/Ticker;

    return-void
.end method

.method private static abbreviate(Ljava/util/concurrent/TimeUnit;)Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "unit"
        }
    .end annotation

    .line 275
    sget-object v0, Lcom/google/common/base/Stopwatch$1;->$SwitchMap$java$util$concurrent$TimeUnit:[I

    invoke-virtual {p0}, Ljava/util/concurrent/TimeUnit;->ordinal()I

    move-result p0

    aget p0, v0, p0

    packed-switch p0, :pswitch_data_0

    .line 291
    new-instance p0, Ljava/lang/AssertionError;

    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    throw p0

    .line 289
    :pswitch_0
    const-string p0, "d"

    return-object p0

    .line 287
    :pswitch_1
    const-string p0, "h"

    return-object p0

    .line 285
    :pswitch_2
    const-string p0, "min"

    return-object p0

    .line 283
    :pswitch_3
    const-string p0, "s"

    return-object p0

    .line 281
    :pswitch_4
    const-string p0, "ms"

    return-object p0

    .line 279
    :pswitch_5
    const-string p0, "\u03bcs"

    return-object p0

    .line 277
    :pswitch_6
    const-string p0, "ns"

    return-object p0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static chooseUnit(J)Ljava/util/concurrent/TimeUnit;
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "nanos"
        }
    .end annotation

    .line 253
    sget-object v0, Ljava/util/concurrent/TimeUnit;->DAYS:Ljava/util/concurrent/TimeUnit;

    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide v0, 0x4e94914f0000L

    div-long v0, p0, v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 254
    sget-object p0, Ljava/util/concurrent/TimeUnit;->DAYS:Ljava/util/concurrent/TimeUnit;

    return-object p0

    .line 256
    :cond_0
    sget-object v0, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide v0, 0x34630b8a000L

    div-long v0, p0, v0

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    .line 257
    sget-object p0, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    return-object p0

    .line 259
    :cond_1
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide v0, 0xdf8475800L

    div-long v0, p0, v0

    cmp-long v0, v0, v2

    if-lez v0, :cond_2

    .line 260
    sget-object p0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    return-object p0

    .line 262
    :cond_2
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/32 v0, 0x3b9aca00

    div-long v0, p0, v0

    cmp-long v0, v0, v2

    if-lez v0, :cond_3

    .line 263
    sget-object p0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    return-object p0

    .line 265
    :cond_3
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/32 v0, 0xf4240

    div-long v0, p0, v0

    cmp-long v0, v0, v2

    if-lez v0, :cond_4

    .line 266
    sget-object p0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    return-object p0

    .line 268
    :cond_4
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v0, 0x3e8

    div-long/2addr p0, v0

    cmp-long p0, p0, v2

    if-lez p0, :cond_5

    .line 269
    sget-object p0, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    return-object p0

    .line 271
    :cond_5
    sget-object p0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    return-object p0
.end method

.method public static createStarted()Lcom/google/common/base/Stopwatch;
    .registers 1

    .line 129
    new-instance v0, Lcom/google/common/base/Stopwatch;

    invoke-direct {v0}, Lcom/google/common/base/Stopwatch;-><init>()V

    invoke-virtual {v0}, Lcom/google/common/base/Stopwatch;->start()Lcom/google/common/base/Stopwatch;

    move-result-object v0

    return-object v0
.end method

.method public static createStarted(Lcom/google/common/base/Ticker;)Lcom/google/common/base/Stopwatch;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ticker"
        }
    .end annotation

    .line 138
    new-instance v0, Lcom/google/common/base/Stopwatch;

    invoke-direct {v0, p0}, Lcom/google/common/base/Stopwatch;-><init>(Lcom/google/common/base/Ticker;)V

    invoke-virtual {v0}, Lcom/google/common/base/Stopwatch;->start()Lcom/google/common/base/Stopwatch;

    move-result-object p0

    return-object p0
.end method

.method public static createUnstarted()Lcom/google/common/base/Stopwatch;
    .registers 1

    .line 111
    new-instance v0, Lcom/google/common/base/Stopwatch;

    invoke-direct {v0}, Lcom/google/common/base/Stopwatch;-><init>()V

    return-object v0
.end method

.method public static createUnstarted(Lcom/google/common/base/Ticker;)Lcom/google/common/base/Stopwatch;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ticker"
        }
    .end annotation

    .line 120
    new-instance v0, Lcom/google/common/base/Stopwatch;

    invoke-direct {v0, p0}, Lcom/google/common/base/Stopwatch;-><init>(Lcom/google/common/base/Ticker;)V

    return-object v0
.end method

.method private elapsedNanos()J
    .registers 5

    .line 200
    iget-boolean v0, p0, Lcom/google/common/base/Stopwatch;->isRunning:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/common/base/Stopwatch;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v0}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/google/common/base/Stopwatch;->startTick:J

    sub-long/2addr v0, v2

    iget-wide v2, p0, Lcom/google/common/base/Stopwatch;->elapsedNanos:J

    add-long/2addr v0, v2

    return-wide v0

    :cond_0
    iget-wide v0, p0, Lcom/google/common/base/Stopwatch;->elapsedNanos:J

    return-wide v0
.end method


# virtual methods
.method public elapsed(Ljava/util/concurrent/TimeUnit;)J
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "desiredUnit"
        }
    .end annotation

    .line 217
    invoke-direct {p0}, Lcom/google/common/base/Stopwatch;->elapsedNanos()J

    move-result-wide v0

    sget-object p0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, p0}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method public elapsed()Ljava/time/Duration;
    .registers 3

    .line 237
    invoke-direct {p0}, Lcom/google/common/base/Stopwatch;->elapsedNanos()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/time/Duration;->ofNanos(J)Ljava/time/Duration;

    move-result-object p0

    return-object p0
.end method

.method public isRunning()Z
    .registers 1

    .line 154
    iget-boolean p0, p0, Lcom/google/common/base/Stopwatch;->isRunning:Z

    return p0
.end method

.method public reset()Lcom/google/common/base/Stopwatch;
    .registers 3

    const-wide/16 v0, 0x0

    .line 194
    iput-wide v0, p0, Lcom/google/common/base/Stopwatch;->elapsedNanos:J

    const/4 v0, 0x0

    .line 195
    iput-boolean v0, p0, Lcom/google/common/base/Stopwatch;->isRunning:Z

    return-object p0
.end method

.method public start()Lcom/google/common/base/Stopwatch;
    .registers 4

    .line 165
    iget-boolean v0, p0, Lcom/google/common/base/Stopwatch;->isRunning:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    const-string v2, "This stopwatch is already running."

    invoke-static {v0, v2}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 166
    iput-boolean v1, p0, Lcom/google/common/base/Stopwatch;->isRunning:Z

    .line 167
    iget-object v0, p0, Lcom/google/common/base/Stopwatch;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v0}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/common/base/Stopwatch;->startTick:J

    return-object p0
.end method

.method public stop()Lcom/google/common/base/Stopwatch;
    .registers 7

    .line 180
    iget-object v0, p0, Lcom/google/common/base/Stopwatch;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v0}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v0

    .line 181
    iget-boolean v2, p0, Lcom/google/common/base/Stopwatch;->isRunning:Z

    const-string v3, "This stopwatch is already stopped."

    invoke-static {v2, v3}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    const/4 v2, 0x0

    .line 182
    iput-boolean v2, p0, Lcom/google/common/base/Stopwatch;->isRunning:Z

    .line 183
    iget-wide v2, p0, Lcom/google/common/base/Stopwatch;->elapsedNanos:J

    iget-wide v4, p0, Lcom/google/common/base/Stopwatch;->startTick:J

    sub-long/2addr v0, v4

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/google/common/base/Stopwatch;->elapsedNanos:J

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .line 243
    invoke-direct {p0}, Lcom/google/common/base/Stopwatch;->elapsedNanos()J

    move-result-wide v0

    .line 245
    invoke-static {v0, v1}, Lcom/google/common/base/Stopwatch;->chooseUnit(J)Ljava/util/concurrent/TimeUnit;

    move-result-object p0

    long-to-double v0, v0

    .line 246
    sget-object v2, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v3, 0x1

    invoke-virtual {v2, v3, v4, p0}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v2

    long-to-double v2, v2

    div-double/2addr v0, v2

    .line 249
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v0, v1}, Lcom/google/common/base/Platform;->formatCompact4Digits(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Lcom/google/common/base/Stopwatch;->abbreviate(Ljava/util/concurrent/TimeUnit;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
