.class public Lio/agora/rtc2/video/CodecCapInfo;
.super Ljava/lang/Object;


# instance fields
.field public codecCapMask:I

.field public codecLevels:Lio/agora/rtc2/video/CodecCapLevels;

.field public codecType:I


# direct methods
.method public constructor <init>(IILio/agora/rtc2/video/CodecCapLevels;)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lio/agora/rtc2/video/CodecCapInfo;->codecType:I

    iput p2, p0, Lio/agora/rtc2/video/CodecCapInfo;->codecCapMask:I

    iput-object p3, p0, Lio/agora/rtc2/video/CodecCapInfo;->codecLevels:Lio/agora/rtc2/video/CodecCapLevels;

    return-void
.end method


# virtual methods
.method public SetCodecCapMask(I)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iput p1, p0, Lio/agora/rtc2/video/CodecCapInfo;->codecCapMask:I

    return-void
.end method

.method public SetCodecType(I)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iput p1, p0, Lio/agora/rtc2/video/CodecCapInfo;->codecType:I

    return-void
.end method
