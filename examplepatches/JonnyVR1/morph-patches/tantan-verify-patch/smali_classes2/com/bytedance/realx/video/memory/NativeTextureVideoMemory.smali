.class public Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;
.super Lcom/bytedance/realx/video/memory/RXVideoTextureMemory;
.source "SourceFile"


# instance fields
.field private nativeHandle:J


# direct methods
.method public constructor <init>(J)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/bytedance/realx/video/memory/RXVideoTextureMemory;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeHandle:J

    .line 5
    .line 6
    new-instance p1, Ll/ze20;

    .line 7
    .line 8
    invoke-direct {p1, p0}, Ll/ze20;-><init>(Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/bytedance/realx/video/memory/RTCVideoMemory;->setReleaseCallback(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic b(Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;)V
    .locals 5

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeHandle:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-eqz v4, :cond_0

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeReleaseTextureVideoMemory(J)V

    .line 10
    .line 11
    .line 12
    iput-wide v2, p0, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeHandle:J

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private static native nativeGetHeight(J)I
.end method

.method private static native nativeGetJavaEGLContext(J)Landroid/opengl/EGLContext;
.end method

.method private static native nativeGetNativeEGLContext(J)J
.end method

.method private static native nativeGetRotation(J)Lcom/bytedance/realx/video/RXVideoRotation;
.end method

.method private static native nativeGetScaleFilter(J)Lcom/bytedance/realx/video/RXVideoScaleFilter;
.end method

.method private static native nativeGetTextureId(J)I
.end method

.method private static native nativeGetTextureMatrix(J)[F
.end method

.method private static native nativeGetTextureTarget(J)Lcom/bytedance/realx/video/RXPixelFormat;
.end method

.method private static native nativeGetUnscaledHeight(J)I
.end method

.method private static native nativeGetUnscaledWidth(J)I
.end method

.method private static native nativeGetVideoMemoryType(J)Lcom/bytedance/realx/video/RXVideoMemoryType;
.end method

.method private static native nativeGetWidth(J)I
.end method

.method private static native nativeReleaseTextureVideoMemory(J)V
.end method


# virtual methods
.method public getEGLContext()Landroid/opengl/EGLContext;
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeHandle:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeGetJavaEGLContext(J)Landroid/opengl/EGLContext;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public getHeight()I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeHandle:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeGetHeight(J)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public getMemoryType()Lcom/bytedance/realx/video/RXVideoMemoryType;
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeHandle:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeGetVideoMemoryType(J)Lcom/bytedance/realx/video/RXVideoMemoryType;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public getNativeEGLContext()J
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeHandle:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    return-wide v2

    .line 10
    :cond_0
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeGetNativeEGLContext(J)J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    return-wide v0
.end method

.method public getRotation()Lcom/bytedance/realx/video/RXVideoRotation;
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeHandle:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeGetRotation(J)Lcom/bytedance/realx/video/RXVideoRotation;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public getScaleFilter()Lcom/bytedance/realx/video/RXVideoScaleFilter;
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeHandle:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeGetScaleFilter(J)Lcom/bytedance/realx/video/RXVideoScaleFilter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getTextureId()I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeHandle:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeGetTextureId(J)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public getTextureMatrix()[F
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeHandle:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/16 p0, 0x10

    .line 10
    .line 11
    new-array p0, p0, [F

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    const/high16 v1, 0x3f800000    # 1.0f

    .line 15
    .line 16
    aput v1, p0, v0

    .line 17
    .line 18
    const/4 v0, 0x5

    .line 19
    aput v1, p0, v0

    .line 20
    .line 21
    const/16 v0, 0xa

    .line 22
    .line 23
    aput v1, p0, v0

    .line 24
    .line 25
    const/16 v0, 0xf

    .line 26
    .line 27
    aput v1, p0, v0

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_0
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeGetTextureMatrix(J)[F

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public getTextureTarget()Lcom/bytedance/realx/video/RXPixelFormat;
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeHandle:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeGetTextureTarget(J)Lcom/bytedance/realx/video/RXPixelFormat;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public getUnScaledHeight()I
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeHandle:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeGetUnscaledHeight(J)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getUnScaledWidth()I
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeHandle:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeGetUnscaledWidth(J)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getWidth()I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeHandle:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->nativeGetWidth(J)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method
