.class public abstract Lorg/junit/rules/Stopwatch;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/junit/rules/TestRule;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/junit/rules/Stopwatch$Clock;,
        Lorg/junit/rules/Stopwatch$InternalWatcher;
    }
.end annotation


# instance fields
.field private final clock:Lorg/junit/rules/Stopwatch$Clock;

.field private volatile endNanos:J

.field private volatile startNanos:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    new-instance v0, Lorg/junit/rules/Stopwatch$Clock;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/junit/rules/Stopwatch$Clock;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lorg/junit/rules/Stopwatch;-><init>(Lorg/junit/rules/Stopwatch$Clock;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lorg/junit/rules/Stopwatch$Clock;)V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lorg/junit/rules/Stopwatch;->clock:Lorg/junit/rules/Stopwatch$Clock;

    return-void
.end method

.method public static synthetic access$100(Lorg/junit/rules/Stopwatch;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/junit/rules/Stopwatch;->starting()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$200(Lorg/junit/rules/Stopwatch;)J
    .locals 2

    .line 1
    invoke-direct {p0}, Lorg/junit/rules/Stopwatch;->getNanos()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public static synthetic access$300(Lorg/junit/rules/Stopwatch;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/junit/rules/Stopwatch;->stopping()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private getNanos()J
    .locals 4

    .line 1
    iget-wide v0, p0, Lorg/junit/rules/Stopwatch;->startNanos:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-wide v0, p0, Lorg/junit/rules/Stopwatch;->endNanos:J

    .line 10
    .line 11
    cmp-long v2, v0, v2

    .line 12
    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lorg/junit/rules/Stopwatch;->clock:Lorg/junit/rules/Stopwatch$Clock;

    .line 16
    .line 17
    invoke-virtual {v0}, Lorg/junit/rules/Stopwatch$Clock;->nanoTime()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    :cond_0
    iget-wide v2, p0, Lorg/junit/rules/Stopwatch;->startNanos:J

    .line 22
    .line 23
    sub-long/2addr v0, v2

    .line 24
    return-wide v0

    .line 25
    :cond_1
    const-string p0, "Test has not started"

    .line 26
    .line 27
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const-wide/16 v0, 0x0

    .line 31
    .line 32
    return-wide v0
.end method

.method private starting()V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/junit/rules/Stopwatch;->clock:Lorg/junit/rules/Stopwatch$Clock;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/junit/rules/Stopwatch$Clock;->nanoTime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iput-wide v0, p0, Lorg/junit/rules/Stopwatch;->startNanos:J

    .line 8
    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    iput-wide v0, p0, Lorg/junit/rules/Stopwatch;->endNanos:J

    .line 12
    .line 13
    return-void
.end method

.method private stopping()V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/junit/rules/Stopwatch;->clock:Lorg/junit/rules/Stopwatch$Clock;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/junit/rules/Stopwatch$Clock;->nanoTime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iput-wide v0, p0, Lorg/junit/rules/Stopwatch;->endNanos:J

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final apply(Lorg/junit/runners/model/Statement;Lorg/junit/runner/Description;)Lorg/junit/runners/model/Statement;
    .locals 2

    .line 1
    new-instance v0, Lorg/junit/rules/Stopwatch$InternalWatcher;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lorg/junit/rules/Stopwatch$InternalWatcher;-><init>(Lorg/junit/rules/Stopwatch;Lorg/junit/rules/Stopwatch$1;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {v0, p1, p2}, Lorg/junit/rules/TestWatcher;->apply(Lorg/junit/runners/model/Statement;Lorg/junit/runner/Description;)Lorg/junit/runners/model/Statement;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public failed(JLjava/lang/Throwable;Lorg/junit/runner/Description;)V
    .locals 0

    return-void
.end method

.method public finished(JLorg/junit/runner/Description;)V
    .locals 0

    return-void
.end method

.method public runtime(Ljava/util/concurrent/TimeUnit;)J
    .locals 2

    .line 1
    invoke-direct {p0}, Lorg/junit/rules/Stopwatch;->getNanos()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-object p0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 6
    .line 7
    invoke-virtual {p1, v0, v1, p0}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    .line 8
    .line 9
    .line 10
    move-result-wide p0

    .line 11
    return-wide p0
.end method

.method public skipped(JLorg/junit/AssumptionViolatedException;Lorg/junit/runner/Description;)V
    .locals 0

    return-void
.end method

.method public succeeded(JLorg/junit/runner/Description;)V
    .locals 0

    return-void
.end method
