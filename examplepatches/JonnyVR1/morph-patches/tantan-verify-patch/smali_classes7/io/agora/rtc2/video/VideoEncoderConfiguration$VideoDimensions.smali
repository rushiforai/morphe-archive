.class public Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/video/VideoEncoderConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "VideoDimensions"
.end annotation


# instance fields
.field public height:I

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;->width:I

    iput v0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;->height:I

    return-void
.end method

.method public constructor <init>(II)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;->width:I

    iput p2, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;->height:I

    return-void
.end method
