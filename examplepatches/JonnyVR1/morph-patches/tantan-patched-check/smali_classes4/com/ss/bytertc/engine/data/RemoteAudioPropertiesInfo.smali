.class public Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public audioPropertiesInfo:Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;

.field public streamKey:Lcom/ss/bytertc/engine/data/RemoteStreamKey;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;->streamKey:Lcom/ss/bytertc/engine/data/RemoteStreamKey;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;->audioPropertiesInfo:Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;

    .line 7
    .line 8
    return-void
.end method

.method private static create(Ljava/lang/String;Ljava/lang/String;III[FI)Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/data/RemoteStreamKey;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/ss/bytertc/engine/data/StreamIndex;->fromId(I)Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-direct {v0, p0, p1, p2}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/StreamIndex;)V

    .line 8
    .line 9
    .line 10
    new-instance p0, Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;

    .line 11
    .line 12
    invoke-direct {p0, p3, p4, p5, p6}, Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;-><init>(II[FI)V

    .line 13
    .line 14
    .line 15
    new-instance p1, Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;

    .line 16
    .line 17
    invoke-direct {p1, v0, p0}, Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;-><init>(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;)V

    .line 18
    .line 19
    .line 20
    return-object p1
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "RemoteAudioPropertiesInfo{user_id=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;->streamKey:Lcom/ss/bytertc/engine/data/RemoteStreamKey;

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getUserId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, "\'room_id=\'"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;->streamKey:Lcom/ss/bytertc/engine/data/RemoteStreamKey;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getUserId()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, "\'stream_index=\'"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;->streamKey:Lcom/ss/bytertc/engine/data/RemoteStreamKey;

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getStreamIndex()Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v1, "\'audioPropertiesInfo [\'linear_volume=\'"

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;->audioPropertiesInfo:Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;

    .line 51
    .line 52
    iget v1, v1, Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;->linearVolume:I

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v1, "\'nonlinear_volume=\'"

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/RemoteAudioPropertiesInfo;->audioPropertiesInfo:Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;

    .line 63
    .line 64
    iget p0, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;->nonlinearVolume:I

    .line 65
    .line 66
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string p0, "\']}"

    .line 70
    .line 71
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0
.end method
