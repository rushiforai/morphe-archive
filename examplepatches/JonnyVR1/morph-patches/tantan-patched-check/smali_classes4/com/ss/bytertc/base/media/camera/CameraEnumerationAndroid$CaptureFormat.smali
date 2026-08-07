.class public Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CaptureFormat"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;
    }
.end annotation


# instance fields
.field public final framerate:Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;

.field public final height:I

.field public final imageFormat:I

.field public final width:I


# direct methods
.method public constructor <init>(IIII)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x11

    .line 5
    .line 6
    iput v0, p0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->imageFormat:I

    .line 7
    .line 8
    iput p1, p0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->width:I

    .line 9
    .line 10
    iput p2, p0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->height:I

    .line 11
    .line 12
    new-instance p1, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;

    .line 13
    .line 14
    invoke-direct {p1, p3, p4}, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;-><init>(II)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->framerate:Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(IILcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;)V
    .locals 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x11

    .line 21
    iput v0, p0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->imageFormat:I

    .line 22
    iput p1, p0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->width:I

    .line 23
    iput p2, p0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->height:I

    .line 24
    iput-object p3, p0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->framerate:Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;

    return-void
.end method

.method public static frameSize(III)I
    .locals 1

    .line 1
    const/16 v0, 0x11

    .line 2
    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    mul-int/2addr p0, p1

    .line 6
    invoke-static {p2}, Landroid/graphics/ImageFormat;->getBitsPerPixel(I)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    mul-int/2addr p0, p1

    .line 11
    div-int/lit8 p0, p0, 0x8

    .line 12
    .line 13
    return p0

    .line 14
    :cond_0
    const-string p0, "Don\'t know how to calculate the frame size of non-NV21 image formats."

    .line 15
    .line 16
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return p0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    check-cast p1, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;

    .line 8
    .line 9
    iget v0, p0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->width:I

    .line 10
    .line 11
    iget v2, p1, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->width:I

    .line 12
    .line 13
    if-ne v0, v2, :cond_1

    .line 14
    .line 15
    iget v0, p0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->height:I

    .line 16
    .line 17
    iget v2, p1, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->height:I

    .line 18
    .line 19
    if-ne v0, v2, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->framerate:Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->framerate:Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_1
    return v1
.end method

.method public frameSize()I
    .locals 2

    .line 21
    iget v0, p0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->width:I

    iget p0, p0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->height:I

    const/16 v1, 0x11

    invoke-static {v0, p0, v1}, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->frameSize(III)I

    move-result p0

    return p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->width:I

    .line 2
    .line 3
    const v1, 0xffd9

    .line 4
    .line 5
    .line 6
    mul-int/2addr v0, v1

    .line 7
    iget v1, p0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->height:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit16 v0, v0, 0xfb

    .line 11
    .line 12
    add-int/lit8 v0, v0, 0x1

    .line 13
    .line 14
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->framerate:Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;->hashCode()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    add-int/2addr v0, p0

    .line 21
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->width:I

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "x"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget v1, p0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->height:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, "@"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->framerate:Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method
