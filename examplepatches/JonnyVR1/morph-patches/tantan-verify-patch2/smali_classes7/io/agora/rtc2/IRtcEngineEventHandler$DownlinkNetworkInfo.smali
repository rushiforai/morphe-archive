.class public Lio/agora/rtc2/IRtcEngineEventHandler$DownlinkNetworkInfo;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/IRtcEngineEventHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DownlinkNetworkInfo"
.end annotation


# instance fields
.field public bandwidth_estimation_bps:I

.field public lastmile_buffer_delay_time_ms:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
