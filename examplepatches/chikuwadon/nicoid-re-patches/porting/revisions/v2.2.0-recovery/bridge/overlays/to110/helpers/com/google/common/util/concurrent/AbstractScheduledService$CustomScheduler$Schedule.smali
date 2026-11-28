.class public final Lcom/google/common/util/concurrent/AbstractScheduledService$CustomScheduler$Schedule;
.super Ljava/lang/Object;
.source "AbstractScheduledService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/AbstractScheduledService$CustomScheduler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1c
    name = "Schedule"
.end annotation


# instance fields
.field private final delay:J

.field private final unit:Ljava/util/concurrent/TimeUnit;


# direct methods
.method public constructor <init>(JLjava/util/concurrent/TimeUnit;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "delay",
            "unit"
        }
    .end annotation

    .line 721
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 722
    iput-wide p1, p0, Lcom/google/common/util/concurrent/AbstractScheduledService$CustomScheduler$Schedule;->delay:J

    .line 723
    invoke-static {p3}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/TimeUnit;

    iput-object p1, p0, Lcom/google/common/util/concurrent/AbstractScheduledService$CustomScheduler$Schedule;->unit:Ljava/util/concurrent/TimeUnit;

    return-void
.end method

.method public constructor <init>(Ljava/time/Duration;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "delay"
        }
    .end annotation

    .line 732
    invoke-static {p1}, Lcom/google/common/util/concurrent/Internal;->toNanosSaturated(Ljava/time/Duration;)J

    move-result-wide v0

    sget-object p1, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-direct {p0, v0, v1, p1}, Lcom/google/common/util/concurrent/AbstractScheduledService$CustomScheduler$Schedule;-><init>(JLjava/util/concurrent/TimeUnit;)V

    return-void
.end method

.method static synthetic access$700(Lcom/google/common/util/concurrent/AbstractScheduledService$CustomScheduler$Schedule;)J
    .registers 3

    .line 712
    iget-wide v0, p0, Lcom/google/common/util/concurrent/AbstractScheduledService$CustomScheduler$Schedule;->delay:J

    return-wide v0
.end method

.method static synthetic access$800(Lcom/google/common/util/concurrent/AbstractScheduledService$CustomScheduler$Schedule;)Ljava/util/concurrent/TimeUnit;
    .registers 1

    .line 712
    iget-object p0, p0, Lcom/google/common/util/concurrent/AbstractScheduledService$CustomScheduler$Schedule;->unit:Ljava/util/concurrent/TimeUnit;

    return-object p0
.end method
