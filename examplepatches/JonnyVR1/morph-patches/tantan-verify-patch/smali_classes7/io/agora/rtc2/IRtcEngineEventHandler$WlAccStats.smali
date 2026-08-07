.class public Lio/agora/rtc2/IRtcEngineEventHandler$WlAccStats;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/IRtcEngineEventHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WlAccStats"
.end annotation


# instance fields
.field public e2eDelayPercent:I

.field public frozenRatioPercent:I

.field public lossRatePercent:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
