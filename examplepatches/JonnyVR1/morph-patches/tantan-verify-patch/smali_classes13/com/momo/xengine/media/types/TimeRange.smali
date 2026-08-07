.class public Lcom/momo/xengine/media/types/TimeRange;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final MEDIA_END:J = -0x1L


# instance fields
.field beginning:J

.field end:J


# direct methods
.method public constructor <init>(JJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/momo/xengine/media/types/TimeRange;->beginning:J

    .line 5
    .line 6
    iput-wide p3, p0, Lcom/momo/xengine/media/types/TimeRange;->end:J

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getBeginning()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/types/TimeRange;->beginning:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getEnd()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/types/TimeRange;->end:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public setBeginning(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/xengine/media/types/TimeRange;->beginning:J

    .line 2
    .line 3
    return-void
.end method

.method public setEnd(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/xengine/media/types/TimeRange;->end:J

    .line 2
    .line 3
    return-void
.end method
