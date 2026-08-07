.class public Lcom/tencent/youtu/liveness/YTFaceTracker;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/youtu/liveness/YTFaceTracker$IYtLoggerListener;,
        Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;,
        Lcom/tencent/youtu/liveness/YTFaceTracker$Param;
    }
.end annotation


# static fields
.field public static loggerListener:Lcom/tencent/youtu/liveness/YTFaceTracker$IYtLoggerListener;


# instance fields
.field public nativePtr:J


# direct methods
.method public constructor <init>(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    invoke-direct {p0, p1, p2, p3}, Lcom/tencent/youtu/liveness/YTFaceTracker;->NativeConstructor(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    if-nez p0, :cond_0

    return-void

    .line 33
    :cond_0
    new-instance p1, Ljava/lang/IllegalAccessError;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "error model dirpath and config filaneme or memory exhausted: "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2}, Lcom/tencent/youtu/liveness/YTFaceTracker;->NativeConstructor(Ljava/lang/String;Ljava/lang/String;)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    new-instance p1, Ljava/lang/IllegalAccessError;

    .line 12
    .line 13
    new-instance p2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v0, "error model dirpath and config filaneme or memory exhausted: "

    .line 16
    .line 17
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-direct {p1, p0}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    throw p1
.end method

.method private native NativeConstructor(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/lang/String;)I
.end method

.method private native NativeConstructor(Ljava/lang/String;Ljava/lang/String;)I
.end method

.method private native NativeDestructor()V
.end method

.method public static native getVersion()Ljava/lang/String;
.end method

.method public static nativeLog(ILjava/lang/String;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/tencent/youtu/liveness/YTFaceTracker;->loggerListener:Lcom/tencent/youtu/liveness/YTFaceTracker$IYtLoggerListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "[YTFaceTracker.nativeLog]"

    .line 6
    .line 7
    invoke-interface {p0, v0, p1}, Lcom/tencent/youtu/liveness/YTFaceTracker$IYtLoggerListener;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static native setLoggerLevel(I)V
.end method

.method public static setLoggerListener(Lcom/tencent/youtu/liveness/YTFaceTracker$IYtLoggerListener;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/tencent/youtu/liveness/YTFaceTracker;->loggerListener:Lcom/tencent/youtu/liveness/YTFaceTracker$IYtLoggerListener;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/youtu/liveness/YTFaceTracker;->NativeDestructor()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public finalize()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/youtu/liveness/YTFaceTracker;->NativeDestructor()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public native getParam()Lcom/tencent/youtu/liveness/YTFaceTracker$Param;
.end method

.method public native reset()V
.end method

.method public native setParam(Lcom/tencent/youtu/liveness/YTFaceTracker$Param;)V
.end method

.method public native track(I[BIII)[Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;
.end method
