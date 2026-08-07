.class public Lio/agora/rtc2/LocalTranscoderConfiguration;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;
    }
.end annotation


# instance fields
.field public syncWithPrimaryCamera:Z

.field public transcodingVideoStreams:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;",
            ">;"
        }
    .end annotation
.end field

.field public videoOutputConfiguration:Lio/agora/rtc2/video/VideoEncoderConfiguration;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lio/agora/rtc2/LocalTranscoderConfiguration;->transcodingVideoStreams:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/agora/rtc2/LocalTranscoderConfiguration;->syncWithPrimaryCamera:Z

    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;

    invoke-direct {v0}, Lio/agora/rtc2/video/VideoEncoderConfiguration;-><init>()V

    iput-object v0, p0, Lio/agora/rtc2/LocalTranscoderConfiguration;->videoOutputConfiguration:Lio/agora/rtc2/video/VideoEncoderConfiguration;

    return-void
.end method
