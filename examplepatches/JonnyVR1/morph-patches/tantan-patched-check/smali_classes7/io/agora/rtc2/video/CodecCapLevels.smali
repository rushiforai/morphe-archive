.class public Lio/agora/rtc2/video/CodecCapLevels;
.super Ljava/lang/Object;


# instance fields
.field public hwDecodingLevel:I

.field public swDecodingLevel:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lio/agora/rtc2/video/CodecCapLevels;->hwDecodingLevel:I

    iput v0, p0, Lio/agora/rtc2/video/CodecCapLevels;->swDecodingLevel:I

    return-void
.end method

.method public constructor <init>(II)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lio/agora/rtc2/video/CodecCapLevels;->hwDecodingLevel:I

    iput p2, p0, Lio/agora/rtc2/video/CodecCapLevels;->swDecodingLevel:I

    return-void
.end method
