.class public Lcom/momo/xengine/media/types/AudioSpeedNode;
.super Lcom/momo/xengine/media/types/TimeRange;
.source "SourceFile"


# instance fields
.field private speed:F


# direct methods
.method public constructor <init>(JJ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/momo/xengine/media/types/TimeRange;-><init>(JJ)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput p1, p0, Lcom/momo/xengine/media/types/AudioSpeedNode;->speed:F

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(JJF)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/momo/xengine/media/types/TimeRange;-><init>(JJ)V

    .line 10
    iput p5, p0, Lcom/momo/xengine/media/types/AudioSpeedNode;->speed:F

    return-void
.end method


# virtual methods
.method public getSpeed()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/types/AudioSpeedNode;->speed:F

    .line 2
    .line 3
    return p0
.end method

.method public setSpeed(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/types/AudioSpeedNode;->speed:F

    .line 2
    .line 3
    return-void
.end method
