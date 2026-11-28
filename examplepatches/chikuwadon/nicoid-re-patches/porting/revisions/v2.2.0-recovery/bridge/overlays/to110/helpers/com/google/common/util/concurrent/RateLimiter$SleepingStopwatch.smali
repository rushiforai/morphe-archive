.class abstract Lcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch;
.super Ljava/lang/Object;
.source "RateLimiter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/RateLimiter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "SleepingStopwatch"
.end annotation


# direct methods
.method protected constructor <init>()V
    .registers 1

    .line 467
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createFromSystemTimer()Lcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch;
    .registers 1

    .line 479
    new-instance v0, Lcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch$1;

    invoke-direct {v0}, Lcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch$1;-><init>()V

    return-object v0
.end method


# virtual methods
.method protected abstract readMicros()J
.end method

.method protected abstract sleepMicrosUninterruptibly(J)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "micros"
        }
    .end annotation
.end method
