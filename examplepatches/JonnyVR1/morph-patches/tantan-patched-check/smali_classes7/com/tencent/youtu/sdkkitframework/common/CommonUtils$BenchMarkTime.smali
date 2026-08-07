.class public Lcom/tencent/youtu/sdkkitframework/common/CommonUtils$BenchMarkTime;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BenchMarkTime"
.end annotation


# instance fields
.field public avg:J

.field public begin:J

.field public cur:J

.field public max:J

.field public min:J

.field public tick:J

.field public total:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils$BenchMarkTime;->total:J

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils$BenchMarkTime;->tick:J

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils$BenchMarkTime;->cur:J

    .line 11
    .line 12
    iput-wide v0, p0, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils$BenchMarkTime;->avg:J

    .line 13
    .line 14
    const-wide v0, 0x7fffffffffffffffL

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    iput-wide v0, p0, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils$BenchMarkTime;->min:J

    .line 20
    .line 21
    const-wide/high16 v0, -0x8000000000000000L

    .line 22
    .line 23
    iput-wide v0, p0, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils$BenchMarkTime;->max:J

    .line 24
    .line 25
    return-void
.end method

.method private update(J)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils$BenchMarkTime;->tick:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    add-long/2addr v0, v2

    .line 6
    iput-wide v0, p0, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils$BenchMarkTime;->tick:J

    .line 7
    .line 8
    iget-wide v0, p0, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils$BenchMarkTime;->min:J

    .line 9
    .line 10
    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    iput-wide v0, p0, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils$BenchMarkTime;->min:J

    .line 15
    .line 16
    iget-wide v0, p0, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils$BenchMarkTime;->max:J

    .line 17
    .line 18
    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->max(JJ)J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    iput-wide v0, p0, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils$BenchMarkTime;->max:J

    .line 23
    .line 24
    iget-wide v0, p0, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils$BenchMarkTime;->total:J

    .line 25
    .line 26
    add-long/2addr v0, p1

    .line 27
    iput-wide v0, p0, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils$BenchMarkTime;->total:J

    .line 28
    .line 29
    iget-wide p1, p0, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils$BenchMarkTime;->tick:J

    .line 30
    .line 31
    div-long/2addr v0, p1

    .line 32
    iput-wide v0, p0, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils$BenchMarkTime;->avg:J

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public begin()V
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils$BenchMarkTime;->begin:J

    .line 6
    .line 7
    return-void
.end method

.method public end()V
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils$BenchMarkTime;->begin:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    iput-wide v0, p0, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils$BenchMarkTime;->cur:J

    .line 9
    .line 10
    invoke-direct {p0, v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils$BenchMarkTime;->update(J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public getTime()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "avg: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-wide v1, p0, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils$BenchMarkTime;->avg:J

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "ms min: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-wide v1, p0, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils$BenchMarkTime;->min:J

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "ms max: "

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-wide v1, p0, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils$BenchMarkTime;->max:J

    .line 29
    .line 30
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "ms cur: "

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-wide v1, p0, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils$BenchMarkTime;->cur:J

    .line 39
    .line 40
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string p0, "ms"

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method
