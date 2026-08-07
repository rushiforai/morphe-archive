.class public Lio/agora/rtc2/video/FocalLengthInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public cameraDirection:I

.field public cameraId:I

.field public focalLengthType:I

.field public index:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(IIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lio/agora/rtc2/video/FocalLengthInfo;->cameraDirection:I

    .line 5
    .line 6
    iput p2, p0, Lio/agora/rtc2/video/FocalLengthInfo;->index:I

    .line 7
    .line 8
    iput p3, p0, Lio/agora/rtc2/video/FocalLengthInfo;->cameraId:I

    .line 9
    .line 10
    iput p4, p0, Lio/agora/rtc2/video/FocalLengthInfo;->focalLengthType:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    check-cast p1, Lio/agora/rtc2/video/FocalLengthInfo;

    .line 20
    .line 21
    iget v2, p0, Lio/agora/rtc2/video/FocalLengthInfo;->cameraDirection:I

    .line 22
    .line 23
    iget v3, p1, Lio/agora/rtc2/video/FocalLengthInfo;->cameraDirection:I

    .line 24
    .line 25
    if-ne v2, v3, :cond_2

    .line 26
    .line 27
    iget p0, p0, Lio/agora/rtc2/video/FocalLengthInfo;->focalLengthType:I

    .line 28
    .line 29
    iget p1, p1, Lio/agora/rtc2/video/FocalLengthInfo;->focalLengthType:I

    .line 30
    .line 31
    if-ne p0, p1, :cond_2

    .line 32
    .line 33
    return v0

    .line 34
    :cond_2
    :goto_0
    return v1
.end method

.method public getCameraDirection()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lio/agora/rtc2/video/FocalLengthInfo;->cameraDirection:I

    .line 2
    .line 3
    return p0
.end method

.method public getCameraId()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lio/agora/rtc2/video/FocalLengthInfo;->cameraId:I

    .line 2
    .line 3
    return p0
.end method

.method public getFocalLengthType()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lio/agora/rtc2/video/FocalLengthInfo;->focalLengthType:I

    .line 2
    .line 3
    return p0
.end method

.method public getIndex()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lio/agora/rtc2/video/FocalLengthInfo;->index:I

    .line 2
    .line 3
    return p0
.end method

.method public hashCode()I
    .locals 1

    .line 1
    iget v0, p0, Lio/agora/rtc2/video/FocalLengthInfo;->cameraDirection:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget p0, p0, Lio/agora/rtc2/video/FocalLengthInfo;->focalLengthType:I

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "{cameraDirection="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lio/agora/rtc2/video/FocalLengthInfo;->cameraDirection:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", Type="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget p0, p0, Lio/agora/rtc2/video/FocalLengthInfo;->focalLengthType:I

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const/16 p0, 0x7d

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method
