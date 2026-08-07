.class public Lcom/tencent/could/huiyansdk/entity/LivenessRequest;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public bestFrameImageFromTerminal:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "bestFrameImageFromTerminal"
    .end annotation
.end field

.field public liveData:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "LiveData"
    .end annotation
.end field

.field public needBestFrame:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "NeedBestFrame"
    .end annotation
.end field

.field public video:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "Video"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/entity/LivenessRequest;->needBestFrame:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public getBestFrameImageFromTerminal()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/LivenessRequest;->bestFrameImageFromTerminal:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveData()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/LivenessRequest;->liveData:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVideo()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/LivenessRequest;->video:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isNeedBestFrame()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/LivenessRequest;->needBestFrame:Z

    .line 2
    .line 3
    return p0
.end method

.method public setBestFrameImageFromTerminal(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/LivenessRequest;->bestFrameImageFromTerminal:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setLiveData(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/LivenessRequest;->liveData:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setNeedBestFrame(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/LivenessRequest;->needBestFrame:Z

    .line 2
    .line 3
    return-void
.end method

.method public setVideo(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/LivenessRequest;->video:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
