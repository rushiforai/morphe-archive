.class public Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:J

.field public b:J

.field public c:Z

.field public d:Z

.field public e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->a:J

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->b:J

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->c:Z

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->d:Z

    .line 15
    .line 16
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->e:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->b:J

    .line 2
    .line 3
    return-wide v0
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->e:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " cancel"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "TimeoutCounter"

    .line 21
    .line 22
    invoke-static {v1, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->c:Z

    .line 27
    .line 28
    return-void
.end method

.method public checkTimeout()Z
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->c:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-wide v2, p0, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->b:J

    .line 7
    .line 8
    const-wide/16 v4, 0x0

    .line 9
    .line 10
    cmp-long v0, v2, v4

    .line 11
    .line 12
    if-lez v0, :cond_0

    .line 13
    .line 14
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 15
    .line 16
    .line 17
    move-result-wide v2

    .line 18
    iget-wide v4, p0, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->a:J

    .line 19
    .line 20
    sub-long/2addr v2, v4

    .line 21
    iget-wide v4, p0, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->b:J

    .line 22
    .line 23
    cmp-long p0, v2, v4

    .line 24
    .line 25
    if-lez p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    return v1
.end method

.method public init(JZ)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->b:J

    .line 2
    .line 3
    iput-boolean p3, p0, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->d:Z

    .line 4
    .line 5
    new-instance p1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object p2, p0, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->e:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p2, " init with "

    .line 16
    .line 17
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-wide p2, p0, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->b:J

    .line 21
    .line 22
    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "TimeoutCounter"

    .line 30
    .line 31
    invoke-static {p1, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public isRunning()Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-wide v0, p0, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->b:J

    .line 6
    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    cmp-long p0, v0, v2

    .line 10
    .line 11
    if-lez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public reset()V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->e:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " reset"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "TimeoutCounter"

    .line 21
    .line 22
    invoke-static {v1, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->c:Z

    .line 27
    .line 28
    iget-wide v0, p0, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->b:J

    .line 29
    .line 30
    const-wide/16 v2, 0x0

    .line 31
    .line 32
    cmp-long v0, v0, v2

    .line 33
    .line 34
    if-lez v0, :cond_0

    .line 35
    .line 36
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->d:Z

    .line 37
    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter$1;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter$1;-><init>(Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 53
    .line 54
    .line 55
    move-result-wide v0

    .line 56
    iput-wide v0, p0, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->a:J

    .line 57
    .line 58
    return-void
.end method

.method public start()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->reset()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
