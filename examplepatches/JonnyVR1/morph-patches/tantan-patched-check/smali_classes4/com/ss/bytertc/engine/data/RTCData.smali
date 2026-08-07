.class public Lcom/ss/bytertc/engine/data/RTCData;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/engine/data/RTCData$SingletonHelper;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "RTCData"


# instance fields
.field private mOrientationMode:Lcom/ss/bytertc/engine/video/VideoEncoderConfiguration$OrientationMode;

.field private videoStreamDescriptions:[Lcom/ss/bytertc/engine/VideoStreamDescription;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    new-array v0, v0, [Lcom/ss/bytertc/engine/VideoStreamDescription;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/ss/bytertc/engine/data/RTCData;->videoStreamDescriptions:[Lcom/ss/bytertc/engine/VideoStreamDescription;

    .line 8
    .line 9
    new-instance v0, Lcom/ss/bytertc/engine/VideoStreamDescription;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/ss/bytertc/engine/VideoStreamDescription;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance v1, Landroid/util/Pair;

    .line 15
    .line 16
    const/16 v2, 0x280

    .line 17
    .line 18
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    const/16 v3, 0x168

    .line 23
    .line 24
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-direct {v1, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    iput-object v1, v0, Lcom/ss/bytertc/engine/VideoStreamDescription;->videoSize:Landroid/util/Pair;

    .line 32
    .line 33
    const/16 v1, 0x14

    .line 34
    .line 35
    iput v1, v0, Lcom/ss/bytertc/engine/VideoStreamDescription;->frameRate:I

    .line 36
    .line 37
    const/16 v1, 0x258

    .line 38
    .line 39
    iput v1, v0, Lcom/ss/bytertc/engine/VideoStreamDescription;->maxKbps:I

    .line 40
    .line 41
    iget-object v1, p0, Lcom/ss/bytertc/engine/data/RTCData;->videoStreamDescriptions:[Lcom/ss/bytertc/engine/VideoStreamDescription;

    .line 42
    .line 43
    const/4 v2, 0x0

    .line 44
    aput-object v0, v1, v2

    .line 45
    .line 46
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoEncoderConfiguration$OrientationMode;->ORIENTATION_MODE_ADAPTIVE:Lcom/ss/bytertc/engine/video/VideoEncoderConfiguration$OrientationMode;

    .line 47
    .line 48
    iput-object v0, p0, Lcom/ss/bytertc/engine/data/RTCData;->mOrientationMode:Lcom/ss/bytertc/engine/video/VideoEncoderConfiguration$OrientationMode;

    .line 49
    .line 50
    return-void
.end method

.method public static instance()Lcom/ss/bytertc/engine/data/RTCData;
    .locals 1

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/data/RTCData$SingletonHelper;->access$000()Lcom/ss/bytertc/engine/data/RTCData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public getOrientationMode()Lcom/ss/bytertc/engine/video/VideoEncoderConfiguration$OrientationMode;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/RTCData;->mOrientationMode:Lcom/ss/bytertc/engine/video/VideoEncoderConfiguration$OrientationMode;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVideoStreamDescriptions()[Lcom/ss/bytertc/engine/VideoStreamDescription;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/RTCData;->videoStreamDescriptions:[Lcom/ss/bytertc/engine/VideoStreamDescription;

    .line 2
    .line 3
    return-object p0
.end method

.method public setOrientationMode(Lcom/ss/bytertc/engine/video/VideoEncoderConfiguration$OrientationMode;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/data/RTCData;->mOrientationMode:Lcom/ss/bytertc/engine/video/VideoEncoderConfiguration$OrientationMode;

    .line 2
    .line 3
    return-void
.end method

.method public setVideoStreamDescriptions([Lcom/ss/bytertc/engine/VideoStreamDescription;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setVideoStreamDescriptions: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "RTCData"

    .line 20
    .line 21
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/ss/bytertc/engine/data/RTCData;->videoStreamDescriptions:[Lcom/ss/bytertc/engine/VideoStreamDescription;

    .line 25
    .line 26
    return-void
.end method
