.class public Lcom/ss/bytertc/engine/RTCStream;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public hasAudio:Z

.field public hasVideo:Z

.field public isScreen:Z

.field public streamIndex:Lcom/ss/bytertc/engine/data/StreamIndex;

.field public userId:Ljava/lang/String;

.field public videoStreamDescriptions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/VideoStreamDescription;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/ss/bytertc/engine/data/StreamIndex;ZZZLjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/ss/bytertc/engine/data/StreamIndex;",
            "ZZZ",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/VideoStreamDescription;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/RTCStream;->userId:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/ss/bytertc/engine/RTCStream;->streamIndex:Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/ss/bytertc/engine/RTCStream;->isScreen:Z

    .line 9
    .line 10
    iput-boolean p4, p0, Lcom/ss/bytertc/engine/RTCStream;->hasVideo:Z

    .line 11
    .line 12
    iput-boolean p5, p0, Lcom/ss/bytertc/engine/RTCStream;->hasAudio:Z

    .line 13
    .line 14
    iput-object p6, p0, Lcom/ss/bytertc/engine/RTCStream;->videoStreamDescriptions:Ljava/util/List;

    .line 15
    .line 16
    return-void
.end method

.method private static create(Ljava/lang/String;Lcom/ss/bytertc/engine/data/StreamIndex;ZZZ)Lcom/ss/bytertc/engine/RTCStream;
    .locals 7
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/RTCStream;

    .line 2
    .line 3
    const/4 v6, 0x0

    .line 4
    move-object v1, p0

    .line 5
    move-object v2, p1

    .line 6
    move v3, p2

    .line 7
    move v4, p3

    .line 8
    move v5, p4

    .line 9
    invoke-direct/range {v0 .. v6}, Lcom/ss/bytertc/engine/RTCStream;-><init>(Ljava/lang/String;Lcom/ss/bytertc/engine/data/StreamIndex;ZZZLjava/util/List;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method private static createWithStreamDescriptions(Ljava/lang/String;Lcom/ss/bytertc/engine/data/StreamIndex;ZZZ[Lcom/ss/bytertc/engine/VideoStreamDescription;)Lcom/ss/bytertc/engine/RTCStream;
    .locals 7
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/RTCStream;

    .line 2
    .line 3
    invoke-static {p5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v6

    .line 7
    move-object v1, p0

    .line 8
    move-object v2, p1

    .line 9
    move v3, p2

    .line 10
    move v4, p3

    .line 11
    move v5, p4

    .line 12
    invoke-direct/range {v0 .. v6}, Lcom/ss/bytertc/engine/RTCStream;-><init>(Ljava/lang/String;Lcom/ss/bytertc/engine/data/StreamIndex;ZZZLjava/util/List;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "RTCStream{ userId=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/engine/RTCStream;->userId:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', isScreen="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/RTCStream;->isScreen:Z

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", hasVideo="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/RTCStream;->hasVideo:Z

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", hasAudio="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/RTCStream;->hasAudio:Z

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", videoStreamDescriptions="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTCStream;->videoStreamDescriptions:Ljava/util/List;

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const/16 p0, 0x7d

    .line 54
    .line 55
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method
