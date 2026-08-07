.class public Lcom/ss/bytertc/engine/data/VideoFrameInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public height:I

.field public rotation:Lcom/ss/bytertc/engine/data/VideoRotation;

.field public width:I


# direct methods
.method public constructor <init>(III)V
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/ss/bytertc/engine/data/VideoFrameInfo;->width:I

    .line 6
    .line 7
    iput v0, p0, Lcom/ss/bytertc/engine/data/VideoFrameInfo;->height:I

    .line 8
    .line 9
    sget-object v0, Lcom/ss/bytertc/engine/data/VideoRotation;->VIDEO_ROTATION_0:Lcom/ss/bytertc/engine/data/VideoRotation;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/ss/bytertc/engine/data/VideoFrameInfo;->rotation:Lcom/ss/bytertc/engine/data/VideoRotation;

    .line 12
    .line 13
    iput p1, p0, Lcom/ss/bytertc/engine/data/VideoFrameInfo;->width:I

    .line 14
    .line 15
    iput p2, p0, Lcom/ss/bytertc/engine/data/VideoFrameInfo;->height:I

    .line 16
    .line 17
    invoke-static {p3}, Lcom/ss/bytertc/engine/data/VideoRotation;->fromId(I)Lcom/ss/bytertc/engine/data/VideoRotation;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lcom/ss/bytertc/engine/data/VideoFrameInfo;->rotation:Lcom/ss/bytertc/engine/data/VideoRotation;

    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/data/VideoFrameInfo;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/data/VideoFrameInfo;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public setWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/ss/bytertc/engine/data/VideoFrameInfo;->width:I

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "VideoFrameInfo{width="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/ss/bytertc/engine/data/VideoFrameInfo;->width:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", height="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/ss/bytertc/engine/data/VideoFrameInfo;->height:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", rotation="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/VideoFrameInfo;->rotation:Lcom/ss/bytertc/engine/data/VideoRotation;

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const/16 p0, 0x7d

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method
