.class public Lcom/ss/bytertc/engine/data/LocalAudioPropertiesInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public audioPropertiesInfo:Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;

.field public streamIndex:Lcom/ss/bytertc/engine/data/StreamIndex;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/data/LocalAudioPropertiesInfo;->streamIndex:Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/ss/bytertc/engine/data/LocalAudioPropertiesInfo;->audioPropertiesInfo:Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;

    .line 7
    .line 8
    return-void
.end method

.method private static create(III[FID)Lcom/ss/bytertc/engine/data/LocalAudioPropertiesInfo;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;-><init>(II[FI)V

    .line 4
    .line 5
    .line 6
    iput-wide p5, v0, Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;->voicePitch:D

    .line 7
    .line 8
    new-instance p1, Lcom/ss/bytertc/engine/data/LocalAudioPropertiesInfo;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/ss/bytertc/engine/data/StreamIndex;->fromId(I)Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-direct {p1, p0, v0}, Lcom/ss/bytertc/engine/data/LocalAudioPropertiesInfo;-><init>(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;)V

    .line 15
    .line 16
    .line 17
    return-object p1
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "LocalAudioPropertiesInfo{streamIndex=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/engine/data/LocalAudioPropertiesInfo;->streamIndex:Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\'audioPropertiesInfo=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/LocalAudioPropertiesInfo;->audioPropertiesInfo:Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string p0, "\'}"

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method
