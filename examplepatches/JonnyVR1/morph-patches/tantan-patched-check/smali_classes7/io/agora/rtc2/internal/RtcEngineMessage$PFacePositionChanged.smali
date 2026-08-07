.class public Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged;
.super Lio/agora/rtc2/internal/Marshallable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/RtcEngineMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PFacePositionChanged"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged$FaceRect;
    }
.end annotation


# instance fields
.field disArr:[I

.field public imageHeight:I

.field public imageWidth:I

.field public num:I

.field rectArr:[Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged$FaceRect;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lio/agora/rtc2/internal/Marshallable;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged;->rectArr:[Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged$FaceRect;

    iput-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged;->disArr:[I

    return-void
.end method


# virtual methods
.method public getAgoraFacePositionInfo()[Lio/agora/rtc2/IRtcEngineEventHandler$AgoraFacePositionInfo;
    .locals 5

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged;->rectArr:[Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged$FaceRect;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    array-length v2, v0

    if-lez v2, :cond_1

    array-length v0, v0

    new-array v0, v0, [Lio/agora/rtc2/IRtcEngineEventHandler$AgoraFacePositionInfo;

    :goto_0
    iget-object v2, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged;->rectArr:[Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged$FaceRect;

    array-length v3, v2

    if-ge v1, v3, :cond_0

    aget-object v2, v2, v1

    new-instance v3, Lio/agora/rtc2/IRtcEngineEventHandler$AgoraFacePositionInfo;

    invoke-direct {v3}, Lio/agora/rtc2/IRtcEngineEventHandler$AgoraFacePositionInfo;-><init>()V

    iget v4, v2, Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged$FaceRect;->x:I

    iput v4, v3, Lio/agora/rtc2/IRtcEngineEventHandler$AgoraFacePositionInfo;->x:I

    iget v4, v2, Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged$FaceRect;->y:I

    iput v4, v3, Lio/agora/rtc2/IRtcEngineEventHandler$AgoraFacePositionInfo;->y:I

    iget v4, v2, Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged$FaceRect;->width:I

    iput v4, v3, Lio/agora/rtc2/IRtcEngineEventHandler$AgoraFacePositionInfo;->width:I

    iget v2, v2, Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged$FaceRect;->height:I

    iput v2, v3, Lio/agora/rtc2/IRtcEngineEventHandler$AgoraFacePositionInfo;->height:I

    iget-object v2, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged;->disArr:[I

    aget v2, v2, v1

    iput v2, v3, Lio/agora/rtc2/IRtcEngineEventHandler$AgoraFacePositionInfo;->distance:I

    aput-object v3, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0

    :cond_1
    new-array p0, v1, [Lio/agora/rtc2/IRtcEngineEventHandler$AgoraFacePositionInfo;

    return-object p0
.end method

.method public unmarshall([B)V
    .locals 4

    invoke-super {p0, p1}, Lio/agora/rtc2/internal/Marshallable;->unmarshall([B)V

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged;->imageWidth:I

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged;->imageHeight:I

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popShort()S

    move-result p1

    const/4 v0, 0x0

    if-lez p1, :cond_0

    new-array v1, p1, [Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged$FaceRect;

    iput-object v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged;->rectArr:[Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged$FaceRect;

    move v1, v0

    :goto_0
    if-ge v1, p1, :cond_0

    iget-object v2, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged;->rectArr:[Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged$FaceRect;

    new-instance v3, Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged$FaceRect;

    invoke-direct {v3}, Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged$FaceRect;-><init>()V

    aput-object v3, v2, v1

    iget-object v2, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged;->rectArr:[Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged$FaceRect;

    aget-object v2, v2, v1

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v3

    iput v3, v2, Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged$FaceRect;->x:I

    iget-object v2, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged;->rectArr:[Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged$FaceRect;

    aget-object v2, v2, v1

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v3

    iput v3, v2, Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged$FaceRect;->y:I

    iget-object v2, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged;->rectArr:[Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged$FaceRect;

    aget-object v2, v2, v1

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v3

    iput v3, v2, Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged$FaceRect;->width:I

    iget-object v2, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged;->rectArr:[Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged$FaceRect;

    aget-object v2, v2, v1

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v3

    iput v3, v2, Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged$FaceRect;->height:I

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popShort()S

    move-result p1

    if-lez p1, :cond_1

    new-array v1, p1, [I

    iput-object v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged;->disArr:[I

    :goto_1
    if-ge v0, p1, :cond_1

    iget-object v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PFacePositionChanged;->disArr:[I

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v2

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method
