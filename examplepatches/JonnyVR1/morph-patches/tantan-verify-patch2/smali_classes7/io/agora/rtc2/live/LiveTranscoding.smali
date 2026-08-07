.class public Lio/agora/rtc2/live/LiveTranscoding;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;,
        Lio/agora/rtc2/live/LiveTranscoding$VideoCodecType;,
        Lio/agora/rtc2/live/LiveTranscoding$AudioCodecProfileType;,
        Lio/agora/rtc2/live/LiveTranscoding$VideoCodecProfileType;,
        Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;
    }
.end annotation


# instance fields
.field private advancedFeatures:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public audioBitrate:I

.field public audioChannels:I

.field public audioCodecProfile:Lio/agora/rtc2/live/LiveTranscoding$AudioCodecProfileType;

.field public audioSampleRate:Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;

.field public backgroundColor:I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private backgroundImageList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lio/agora/rtc2/video/AgoraImage;",
            ">;"
        }
    .end annotation
.end field

.field public height:I

.field public lowLatency:Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public metadata:Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private transcodingUsers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;",
            ">;"
        }
    .end annotation
.end field

.field public userConfigExtraInfo:Ljava/lang/String;

.field public userCount:I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public videoBitrate:I

.field public videoCodecProfile:Lio/agora/rtc2/live/LiveTranscoding$VideoCodecProfileType;

.field public videoCodecType:Lio/agora/rtc2/live/LiveTranscoding$VideoCodecType;

.field public videoFramerate:I

.field public videoGop:I

.field private watermarkList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lio/agora/rtc2/video/AgoraImage;",
            ">;"
        }
    .end annotation
.end field

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x168

    iput v0, p0, Lio/agora/rtc2/live/LiveTranscoding;->width:I

    const/16 v0, 0x280

    iput v0, p0, Lio/agora/rtc2/live/LiveTranscoding;->height:I

    const/16 v0, 0x190

    iput v0, p0, Lio/agora/rtc2/live/LiveTranscoding;->videoBitrate:I

    sget-object v0, Lio/agora/rtc2/live/LiveTranscoding$VideoCodecProfileType;->HIGH:Lio/agora/rtc2/live/LiveTranscoding$VideoCodecProfileType;

    iput-object v0, p0, Lio/agora/rtc2/live/LiveTranscoding;->videoCodecProfile:Lio/agora/rtc2/live/LiveTranscoding$VideoCodecProfileType;

    sget-object v0, Lio/agora/rtc2/live/LiveTranscoding$VideoCodecType;->H264:Lio/agora/rtc2/live/LiveTranscoding$VideoCodecType;

    iput-object v0, p0, Lio/agora/rtc2/live/LiveTranscoding;->videoCodecType:Lio/agora/rtc2/live/LiveTranscoding$VideoCodecType;

    const/16 v0, 0x1e

    iput v0, p0, Lio/agora/rtc2/live/LiveTranscoding;->videoGop:I

    const/16 v0, 0xf

    iput v0, p0, Lio/agora/rtc2/live/LiveTranscoding;->videoFramerate:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/agora/rtc2/live/LiveTranscoding;->lowLatency:Z

    sget-object v0, Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;->TYPE_44100:Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;

    iput-object v0, p0, Lio/agora/rtc2/live/LiveTranscoding;->audioSampleRate:Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;

    const/16 v0, 0x30

    iput v0, p0, Lio/agora/rtc2/live/LiveTranscoding;->audioBitrate:I

    const/4 v0, 0x1

    iput v0, p0, Lio/agora/rtc2/live/LiveTranscoding;->audioChannels:I

    sget-object v0, Lio/agora/rtc2/live/LiveTranscoding$AudioCodecProfileType;->LC_AAC:Lio/agora/rtc2/live/LiveTranscoding$AudioCodecProfileType;

    iput-object v0, p0, Lio/agora/rtc2/live/LiveTranscoding;->audioCodecProfile:Lio/agora/rtc2/live/LiveTranscoding$AudioCodecProfileType;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/agora/rtc2/live/LiveTranscoding;->advancedFeatures:Ljava/util/Map;

    const/high16 v0, -0x1000000

    iput v0, p0, Lio/agora/rtc2/live/LiveTranscoding;->backgroundColor:I

    const/4 v0, 0x0

    iput-object v0, p0, Lio/agora/rtc2/live/LiveTranscoding;->userConfigExtraInfo:Ljava/lang/String;

    iput-object v0, p0, Lio/agora/rtc2/live/LiveTranscoding;->metadata:Ljava/lang/String;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/agora/rtc2/live/LiveTranscoding;->transcodingUsers:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public addBackgroundImage(Lio/agora/rtc2/video/AgoraImage;)V
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/live/LiveTranscoding;->backgroundImageList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lio/agora/rtc2/live/LiveTranscoding;->backgroundImageList:Ljava/util/ArrayList;

    :cond_0
    iget-object p0, p0, Lio/agora/rtc2/live/LiveTranscoding;->backgroundImageList:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public addUser(Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;)I
    .locals 2

    if-nez p1, :cond_0

    const/4 p0, -0x2

    return p0

    :cond_0
    iget-object v0, p0, Lio/agora/rtc2/live/LiveTranscoding;->transcodingUsers:Ljava/util/Map;

    iget v1, p1, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->uid:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lio/agora/rtc2/live/LiveTranscoding;->transcodingUsers:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/live/LiveTranscoding;->userCount:I

    const/4 p0, 0x0

    return p0
.end method

.method public addWatermark(Lio/agora/rtc2/video/AgoraImage;)V
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/live/LiveTranscoding;->watermarkList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lio/agora/rtc2/live/LiveTranscoding;->watermarkList:Ljava/util/ArrayList;

    :cond_0
    iget-object p0, p0, Lio/agora/rtc2/live/LiveTranscoding;->watermarkList:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public getAdvancedFeatures()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/live/LiveTranscoding;->advancedFeatures:Ljava/util/Map;

    return-object p0
.end method

.method public getBackgroundColor()I
    .locals 0

    iget p0, p0, Lio/agora/rtc2/live/LiveTranscoding;->backgroundColor:I

    return p0
.end method

.method public getBackgroundImageList()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lio/agora/rtc2/video/AgoraImage;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/live/LiveTranscoding;->backgroundImageList:Ljava/util/ArrayList;

    return-object p0
.end method

.method public getBlue()I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget p0, p0, Lio/agora/rtc2/live/LiveTranscoding;->backgroundColor:I

    and-int/lit16 p0, p0, 0xff

    return p0
.end method

.method public getGreen()I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget p0, p0, Lio/agora/rtc2/live/LiveTranscoding;->backgroundColor:I

    shr-int/lit8 p0, p0, 0x8

    and-int/lit16 p0, p0, 0xff

    return p0
.end method

.method public getRed()I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget p0, p0, Lio/agora/rtc2/live/LiveTranscoding;->backgroundColor:I

    shr-int/lit8 p0, p0, 0x10

    and-int/lit16 p0, p0, 0xff

    return p0
.end method

.method public getUserCount()I
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/live/LiveTranscoding;->transcodingUsers:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result p0

    return p0
.end method

.method public final getUsers()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/live/LiveTranscoding;->transcodingUsers:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getWatermarkList()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lio/agora/rtc2/video/AgoraImage;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/live/LiveTranscoding;->watermarkList:Ljava/util/ArrayList;

    return-object p0
.end method

.method public removeBackgroundImage(Lio/agora/rtc2/video/AgoraImage;)Z
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/live/LiveTranscoding;->backgroundImageList:Ljava/util/ArrayList;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public removeUser(I)I
    .locals 2

    iget-object v0, p0, Lio/agora/rtc2/live/LiveTranscoding;->transcodingUsers:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, -0x2

    return p0

    :cond_0
    iget-object v0, p0, Lio/agora/rtc2/live/LiveTranscoding;->transcodingUsers:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lio/agora/rtc2/live/LiveTranscoding;->transcodingUsers:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/live/LiveTranscoding;->userCount:I

    const/4 p0, 0x0

    return p0
.end method

.method public removeWatermark(Lio/agora/rtc2/video/AgoraImage;)Z
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/live/LiveTranscoding;->watermarkList:Ljava/util/ArrayList;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public setAdvancedFeatures(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/live/LiveTranscoding;->advancedFeatures:Ljava/util/Map;

    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public setBackgroundColor(I)V
    .locals 0

    .line 2
    iput p1, p0, Lio/agora/rtc2/live/LiveTranscoding;->backgroundColor:I

    return-void
.end method

.method public setBackgroundColor(III)V
    .locals 0

    .line 1
    shl-int/lit8 p1, p1, 0x10

    shl-int/lit8 p2, p2, 0x8

    or-int/2addr p1, p2

    or-int/2addr p1, p3

    iput p1, p0, Lio/agora/rtc2/live/LiveTranscoding;->backgroundColor:I

    return-void
.end method

.method public setBlue(I)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0}, Lio/agora/rtc2/live/LiveTranscoding;->getRed()I

    move-result v0

    invoke-virtual {p0}, Lio/agora/rtc2/live/LiveTranscoding;->getGreen()I

    move-result v1

    shl-int/lit8 v0, v0, 0x10

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    or-int/2addr p1, v0

    iput p1, p0, Lio/agora/rtc2/live/LiveTranscoding;->backgroundColor:I

    return-void
.end method

.method public setGreen(I)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0}, Lio/agora/rtc2/live/LiveTranscoding;->getRed()I

    move-result v0

    invoke-virtual {p0}, Lio/agora/rtc2/live/LiveTranscoding;->getBlue()I

    move-result v1

    shl-int/lit8 v0, v0, 0x10

    shl-int/lit8 p1, p1, 0x8

    or-int/2addr p1, v0

    or-int/2addr p1, v1

    iput p1, p0, Lio/agora/rtc2/live/LiveTranscoding;->backgroundColor:I

    return-void
.end method

.method public setRed(I)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0}, Lio/agora/rtc2/live/LiveTranscoding;->getGreen()I

    move-result v0

    invoke-virtual {p0}, Lio/agora/rtc2/live/LiveTranscoding;->getBlue()I

    move-result v1

    shl-int/lit8 p1, p1, 0x10

    shl-int/lit8 v0, v0, 0x8

    or-int/2addr p1, v0

    or-int/2addr p1, v1

    iput p1, p0, Lio/agora/rtc2/live/LiveTranscoding;->backgroundColor:I

    return-void
.end method

.method public setUsers(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lio/agora/rtc2/live/LiveTranscoding;->transcodingUsers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;

    iget-object v1, p0, Lio/agora/rtc2/live/LiveTranscoding;->transcodingUsers:Ljava/util/Map;

    iget v2, v0, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->uid:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lio/agora/rtc2/live/LiveTranscoding;->transcodingUsers:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/live/LiveTranscoding;->userCount:I

    return-void
.end method

.method public setUsers(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;",
            ">;)V"
        }
    .end annotation

    .line 2
    iget-object v0, p0, Lio/agora/rtc2/live/LiveTranscoding;->transcodingUsers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    if-eqz p1, :cond_0

    iget-object v0, p0, Lio/agora/rtc2/live/LiveTranscoding;->transcodingUsers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    :cond_0
    iget-object p1, p0, Lio/agora/rtc2/live/LiveTranscoding;->transcodingUsers:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/live/LiveTranscoding;->userCount:I

    return-void
.end method
