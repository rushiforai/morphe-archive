.class public Lorg/junit/rules/Timeout$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/junit/rules/Timeout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private lookForStuckThread:Z

.field private timeUnit:Ljava/util/concurrent/TimeUnit;

.field private timeout:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lorg/junit/rules/Timeout$Builder;->lookForStuckThread:Z

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    iput-wide v0, p0, Lorg/junit/rules/Timeout$Builder;->timeout:J

    .line 10
    .line 11
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 12
    .line 13
    iput-object v0, p0, Lorg/junit/rules/Timeout$Builder;->timeUnit:Ljava/util/concurrent/TimeUnit;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public build()Lorg/junit/rules/Timeout;
    .locals 1

    .line 1
    new-instance v0, Lorg/junit/rules/Timeout;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lorg/junit/rules/Timeout;-><init>(Lorg/junit/rules/Timeout$Builder;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public getLookingForStuckThread()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/junit/rules/Timeout$Builder;->lookForStuckThread:Z

    .line 2
    .line 3
    return p0
.end method

.method public getTimeUnit()Ljava/util/concurrent/TimeUnit;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/junit/rules/Timeout$Builder;->timeUnit:Ljava/util/concurrent/TimeUnit;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTimeout()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/junit/rules/Timeout$Builder;->timeout:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public withLookingForStuckThread(Z)Lorg/junit/rules/Timeout$Builder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/junit/rules/Timeout$Builder;->lookForStuckThread:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public withTimeout(JLjava/util/concurrent/TimeUnit;)Lorg/junit/rules/Timeout$Builder;
    .locals 0

    .line 1
    iput-wide p1, p0, Lorg/junit/rules/Timeout$Builder;->timeout:J

    .line 2
    .line 3
    iput-object p3, p0, Lorg/junit/rules/Timeout$Builder;->timeUnit:Ljava/util/concurrent/TimeUnit;

    .line 4
    .line 5
    return-object p0
.end method
