.class public Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface$IYtLoggerListener;
    }
.end annotation


# static fields
.field public static final CHECKSUM_BEST:I = 0x0

.field public static final CHECKSUM_EYE:I = 0x1

.field public static final CHECKSUM_MOUTH:I = 0x2

.field public static compressPoseImageScore:I = 0x63

.field public static compressVideoScore:I = 0x50

.field public static loggerListener:Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface$IYtLoggerListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static native canReflect()Z
.end method

.method public static native configNativeLog(Z)V
.end method

.method public static encodeJpeg(Landroid/graphics/Bitmap;Z)[B
    .locals 2

    .line 1
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    sget p1, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->compressPoseImageScore:I

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    sget p1, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->compressVideoScore:I

    .line 14
    .line 15
    :goto_0
    invoke-virtual {p0, v1, p1, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static native getActionData()Lcom/tencent/youtu/ytposedetect/data/ActionData;
.end method

.method public static native getActionReflectData(I)Lcom/tencent/youtu/ytposedetect/data/YTActRefData;
.end method

.method public static native getBestImage()[B
.end method

.method public static native getEyeImage(I)[B
.end method

.method public static native getFaceDetectDistanceRectParam()Ljava/lang/String;
.end method

.method public static native getFaceDistanceDetectData()Lcom/tencent/youtu/ytposedetect/data/YTFaceDistanceDetectData;
.end method

.method public static native getFar2NearRectChangeScore()F
.end method

.method public static native getFrameList()[[B
.end method

.method public static native getMouthImage(I)[B
.end method

.method public static native getOneActionFrame(II)V
.end method

.method public static native getVersion()Ljava/lang/String;
.end method

.method public static native initFaceDistanceDetect(IIIFF)V
.end method

.method public static native initModel(Ljava/lang/String;)I
.end method

.method public static native isFrameListNull()Z
.end method

.method public static native isRecordingDone()Z
.end method

.method public static nativeLog(ILjava/lang/String;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->loggerListener:Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface$IYtLoggerListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "[YTPoseDetectJNIInterface.nativeLog]"

    .line 6
    .line 7
    invoke-interface {p0, v0, p1}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface$IYtLoggerListener;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static nativeLog(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 11
    sget-object v0, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->loggerListener:Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface$IYtLoggerListener;

    if-eqz v0, :cond_0

    .line 12
    invoke-interface {v0, p0, p1}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface$IYtLoggerListener;->log(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static native poseDetect(Lcom/tencent/youtu/ytposedetect/data/PoseDetectData;)I
.end method

.method public static native releaseAll()V
.end method

.method public static native resetDetect()V
.end method

.method public static native resetQualityContinuousCount()V
.end method

.method public static native setColorData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public static setLoggerListener(Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface$IYtLoggerListener;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->loggerListener:Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface$IYtLoggerListener;

    .line 2
    .line 3
    return-void
.end method

.method public static native setSafetyLevel(I)V
.end method

.method public static native updateParam(Ljava/lang/String;Ljava/lang/String;)I
.end method
