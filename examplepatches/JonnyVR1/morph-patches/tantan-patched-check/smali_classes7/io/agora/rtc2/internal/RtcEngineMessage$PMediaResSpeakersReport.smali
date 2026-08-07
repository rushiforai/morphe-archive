.class public Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport;
.super Lio/agora/rtc2/internal/Marshallable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/RtcEngineMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PMediaResSpeakersReport"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;
    }
.end annotation


# instance fields
.field mixVolume:I

.field speakers:[Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lio/agora/rtc2/internal/Marshallable;-><init>()V

    return-void
.end method


# virtual methods
.method public getAudioVolumeInfo()[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;
    .locals 6

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport;->speakers:[Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    array-length v2, v0

    if-lez v2, :cond_1

    array-length v0, v0

    new-array v0, v0, [Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    :goto_0
    iget-object v2, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport;->speakers:[Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;

    array-length v2, v2

    if-ge v1, v2, :cond_0

    new-instance v2, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    invoke-direct {v2}, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;-><init>()V

    aput-object v2, v0, v1

    iget-object v3, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport;->speakers:[Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;

    aget-object v3, v3, v1

    iget v4, v3, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;->vad:I

    iput v4, v2, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;->vad:I

    iget v4, v3, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;->volume:I

    iput v4, v2, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;->volume:I

    iget-wide v4, v3, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;->voicePitch:D

    iput-wide v4, v2, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;->voicePitch:D

    iget v3, v3, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;->uid:I

    iput v3, v2, Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;->uid:I

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0

    :cond_1
    new-array p0, v1, [Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    return-object p0
.end method

.method public marshall()[B
    .locals 4

    iget v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport;->mixVolume:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport;->speakers:[Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;

    array-length v0, v0

    int-to-short v1, v0

    invoke-virtual {p0, v1}, Lio/agora/rtc2/internal/Marshallable;->pushShort(S)V

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    iget-object v2, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport;->speakers:[Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;

    aget-object v2, v2, v1

    iget v2, v2, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;->uid:I

    invoke-virtual {p0, v2}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v2, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport;->speakers:[Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;

    aget-object v2, v2, v1

    iget v2, v2, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;->volume:I

    invoke-virtual {p0, v2}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v2, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport;->speakers:[Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;

    aget-object v2, v2, v1

    iget v2, v2, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;->vad:I

    invoke-virtual {p0, v2}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v2, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport;->speakers:[Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;

    aget-object v2, v2, v1

    iget-wide v2, v2, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;->voicePitch:D

    invoke-virtual {p0, v2, v3}, Lio/agora/rtc2/internal/Marshallable;->pushDouble(D)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    invoke-super {p0}, Lio/agora/rtc2/internal/Marshallable;->marshall()[B

    move-result-object p0

    return-object p0
.end method

.method public unmarshall([B)V
    .locals 4

    invoke-super {p0, p1}, Lio/agora/rtc2/internal/Marshallable;->unmarshall([B)V

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport;->mixVolume:I

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popShort()S

    move-result p1

    if-lez p1, :cond_0

    new-array v0, p1, [Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;

    iput-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport;->speakers:[Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p1, :cond_0

    iget-object v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport;->speakers:[Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;

    new-instance v2, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;

    invoke-direct {v2}, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;-><init>()V

    aput-object v2, v1, v0

    iget-object v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport;->speakers:[Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;

    aget-object v1, v1, v0

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v2

    iput v2, v1, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;->uid:I

    iget-object v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport;->speakers:[Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;

    aget-object v1, v1, v0

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v2

    iput v2, v1, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;->volume:I

    iget-object v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport;->speakers:[Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;

    aget-object v1, v1, v0

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v2

    iput v2, v1, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;->vad:I

    iget-object v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport;->speakers:[Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;

    aget-object v1, v1, v0

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popDouble()D

    move-result-wide v2

    iput-wide v2, v1, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;->voicePitch:D

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
