.class public Lio/agora/rtc2/internal/RtcEngineMessage$PTranscodingVideoStream;
.super Lio/agora/rtc2/internal/Marshallable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/RtcEngineMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PTranscodingVideoStream"
.end annotation


# instance fields
.field public alpha:D

.field public error:I

.field public height:I

.field public imageUrl:Ljava/lang/String;

.field public mirror:Z

.field public remoteUserUid:I

.field public sourceType:I

.field public width:I

.field public x:I

.field public y:I

.field public zOrder:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lio/agora/rtc2/internal/Marshallable;-><init>()V

    return-void
.end method


# virtual methods
.method public getTranscodingVideoStream()Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;
    .locals 3

    new-instance v0, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;

    invoke-direct {v0}, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;-><init>()V

    iget v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PTranscodingVideoStream;->sourceType:I

    invoke-static {v1}, Lio/agora/rtc2/Constants$VideoSourceType;->fromInt(I)Lio/agora/rtc2/Constants$VideoSourceType;

    move-result-object v1

    iput-object v1, v0, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->sourceType:Lio/agora/rtc2/Constants$VideoSourceType;

    iget v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PTranscodingVideoStream;->remoteUserUid:I

    iput v1, v0, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->remoteUserUid:I

    iget-object v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PTranscodingVideoStream;->imageUrl:Ljava/lang/String;

    iput-object v1, v0, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->imageUrl:Ljava/lang/String;

    iget v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PTranscodingVideoStream;->x:I

    iput v1, v0, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->x:I

    iget v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PTranscodingVideoStream;->y:I

    iput v1, v0, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->y:I

    iget v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PTranscodingVideoStream;->width:I

    iput v1, v0, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->width:I

    iget v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PTranscodingVideoStream;->height:I

    iput v1, v0, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->height:I

    iget v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PTranscodingVideoStream;->zOrder:I

    iput v1, v0, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->zOrder:I

    iget-wide v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PTranscodingVideoStream;->alpha:D

    iput-wide v1, v0, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->alpha:D

    iget-boolean p0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PTranscodingVideoStream;->mirror:Z

    iput-boolean p0, v0, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->mirror:Z

    return-object v0
.end method

.method public marshall()[B
    .locals 0

    invoke-super {p0}, Lio/agora/rtc2/internal/Marshallable;->marshall()[B

    move-result-object p0

    return-object p0
.end method

.method public unmarshall([B)V
    .locals 2

    invoke-super {p0, p1}, Lio/agora/rtc2/internal/Marshallable;->unmarshall([B)V

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PTranscodingVideoStream;->error:I

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PTranscodingVideoStream;->sourceType:I

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PTranscodingVideoStream;->remoteUserUid:I

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popString16UTF8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PTranscodingVideoStream;->imageUrl:Ljava/lang/String;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PTranscodingVideoStream;->x:I

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PTranscodingVideoStream;->y:I

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PTranscodingVideoStream;->width:I

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PTranscodingVideoStream;->height:I

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PTranscodingVideoStream;->zOrder:I

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popDouble()D

    move-result-wide v0

    iput-wide v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PTranscodingVideoStream;->alpha:D

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popBool()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PTranscodingVideoStream;->mirror:Z

    return-void
.end method
