.class Lio/agora/rtc2/internal/RtcEngineImpl$InitResult;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/RtcEngineImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InitResult"
.end annotation


# instance fields
.field private nativeHandle:J

.field private retVal:I


# direct methods
.method public constructor <init>(IJ)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "InitResult"
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineImpl$InitResult;->retVal:I

    iput-wide p2, p0, Lio/agora/rtc2/internal/RtcEngineImpl$InitResult;->nativeHandle:J

    return-void
.end method

.method public static synthetic access$000(Lio/agora/rtc2/internal/RtcEngineImpl$InitResult;)I
    .locals 0

    iget p0, p0, Lio/agora/rtc2/internal/RtcEngineImpl$InitResult;->retVal:I

    return p0
.end method

.method public static synthetic access$100(Lio/agora/rtc2/internal/RtcEngineImpl$InitResult;)J
    .locals 2

    iget-wide v0, p0, Lio/agora/rtc2/internal/RtcEngineImpl$InitResult;->nativeHandle:J

    return-wide v0
.end method
