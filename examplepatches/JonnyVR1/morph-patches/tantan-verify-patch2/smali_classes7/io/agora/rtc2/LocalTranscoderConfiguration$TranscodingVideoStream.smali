.class public Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/LocalTranscoderConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TranscodingVideoStream"
.end annotation


# instance fields
.field public alpha:D

.field public height:I

.field public imageUrl:Ljava/lang/String;

.field public mediaPlayerId:I

.field public mirror:Z

.field public remoteUserUid:I

.field public sourceType:Lio/agora/rtc2/Constants$VideoSourceType;

.field public width:I

.field public x:I

.field public y:I

.field public zOrder:I


# direct methods
.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->remoteUserUid:I

    sget-object v1, Lio/agora/rtc2/Constants$VideoSourceType;->VIDEO_SOURCE_CAMERA_PRIMARY:Lio/agora/rtc2/Constants$VideoSourceType;

    iput-object v1, p0, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->sourceType:Lio/agora/rtc2/Constants$VideoSourceType;

    const/4 v1, 0x0

    iput-object v1, p0, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->imageUrl:Ljava/lang/String;

    iput v0, p0, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->x:I

    iput v0, p0, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->y:I

    iput v0, p0, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->width:I

    iput v0, p0, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->height:I

    iput v0, p0, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->zOrder:I

    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    iput-wide v1, p0, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->alpha:D

    iput-boolean v0, p0, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->mirror:Z

    return-void
.end method
