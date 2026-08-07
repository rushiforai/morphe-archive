.class public Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final TIME_FAST:F = 0.25f

.field public static final TIME_SLOW:F = 5.0f

.field public static final TIME_SPACER_FAST:J = 0x1f4L

.field public static final TIME_SPACER_SLOW:J = 0xc8L


# instance fields
.field private end:J

.field private speed:F

.field private start:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(JJF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;->start:J

    .line 5
    .line 6
    iput-wide p3, p0, Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;->end:J

    .line 7
    .line 8
    iput p5, p0, Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;->speed:F

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getEnd()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;->end:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getSpeed()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;->speed:F

    .line 2
    .line 3
    return p0
.end method

.method public getStart()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;->start:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public setEnd(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;->end:J

    .line 2
    .line 3
    return-void
.end method

.method public setSpeed(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;->speed:F

    .line 2
    .line 3
    return-void
.end method

.method public setStart(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;->start:J

    .line 2
    .line 3
    return-void
.end method
