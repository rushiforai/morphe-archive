.class final Lcom/momo/xengine/ar/ARCameraImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xengine/ar/IXARCamera;


# instance fields
.field private engineListener:Lcom/momo/xeengine/xnative/IXEngineListener;

.field private nativeCamera:J


# direct methods
.method public constructor <init>(Lcom/momo/xeengine/IXEngine;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/xengine/ar/ARCameraImpl$1;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/momo/xengine/ar/ARCameraImpl$1;-><init>(Lcom/momo/xengine/ar/ARCameraImpl;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/xengine/ar/ARCameraImpl;->engineListener:Lcom/momo/xeengine/xnative/IXEngineListener;

    .line 10
    .line 11
    check-cast p1, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->addEngineListener(Lcom/momo/xeengine/xnative/IXEngineListener;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->getEngineIns()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    invoke-direct {p0, v0, v1}, Lcom/momo/xengine/ar/ARCameraImpl;->nativeCreateCamera(J)J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    iput-wide v0, p0, Lcom/momo/xengine/ar/ARCameraImpl;->nativeCamera:J

    .line 25
    .line 26
    const-wide/16 p0, 0x0

    .line 27
    .line 28
    cmp-long p0, v0, p0

    .line 29
    .line 30
    if-eqz p0, :cond_0

    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    const-string p0, "ARCameraImpl create failed"

    .line 34
    .line 35
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const/4 p0, 0x0

    .line 39
    throw p0
.end method

.method public static synthetic access$000(Lcom/momo/xengine/ar/ARCameraImpl;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/ar/ARCameraImpl;->nativeCamera:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$002(Lcom/momo/xengine/ar/ARCameraImpl;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/xengine/ar/ARCameraImpl;->nativeCamera:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic access$100(Lcom/momo/xengine/ar/ARCameraImpl;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/momo/xengine/ar/ARCameraImpl;->nativeRelease(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private check()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/ar/ARCameraImpl;->nativeCamera:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const-string p0, "IXARCamera \u5df2\u7ecf\u88ab\u91ca\u653e"

    .line 11
    .line 12
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private native nativeCreateCamera(J)J
.end method

.method private native nativeGetHeight(J)I
.end method

.method private native nativeGetWidth(J)I
.end method

.method private native nativePause(J)V
.end method

.method private native nativeRelease(J)V
.end method

.method private native nativeResume(J)V
.end method

.method private native nativeUpdate(JI)Z
.end method


# virtual methods
.method public getTextureSize()Lcom/momo/xengine/ar/IXARCamera$Size;
    .locals 3

    .line 1
    new-instance v0, Lcom/momo/xengine/ar/IXARCamera$Size;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/momo/xengine/ar/IXARCamera$Size;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/momo/xengine/ar/ARCameraImpl;->nativeCamera:J

    .line 7
    .line 8
    invoke-direct {p0, v1, v2}, Lcom/momo/xengine/ar/ARCameraImpl;->nativeGetWidth(J)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    iput v1, v0, Lcom/momo/xengine/ar/IXARCamera$Size;->width:I

    .line 13
    .line 14
    iget-wide v1, p0, Lcom/momo/xengine/ar/ARCameraImpl;->nativeCamera:J

    .line 15
    .line 16
    invoke-direct {p0, v1, v2}, Lcom/momo/xengine/ar/ARCameraImpl;->nativeGetHeight(J)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    iput p0, v0, Lcom/momo/xengine/ar/IXARCamera$Size;->height:I

    .line 21
    .line 22
    return-object v0
.end method

.method public pause()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/xengine/ar/ARCameraImpl;->check()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/xengine/ar/ARCameraImpl;->nativeCamera:J

    .line 5
    .line 6
    invoke-direct {p0, v0, v1}, Lcom/momo/xengine/ar/ARCameraImpl;->nativePause(J)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public resume()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/xengine/ar/ARCameraImpl;->check()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/xengine/ar/ARCameraImpl;->nativeCamera:J

    .line 5
    .line 6
    invoke-direct {p0, v0, v1}, Lcom/momo/xengine/ar/ARCameraImpl;->nativeResume(J)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public update(ILcom/momo/xengine/ar/IXARCamera$Size;)Z
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/xengine/ar/ARCameraImpl;->check()V

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    iget-wide v0, p0, Lcom/momo/xengine/ar/ARCameraImpl;->nativeCamera:J

    .line 7
    .line 8
    invoke-direct {p0, v0, v1}, Lcom/momo/xengine/ar/ARCameraImpl;->nativeGetWidth(J)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p2, Lcom/momo/xengine/ar/IXARCamera$Size;->width:I

    .line 13
    .line 14
    iget-wide v0, p0, Lcom/momo/xengine/ar/ARCameraImpl;->nativeCamera:J

    .line 15
    .line 16
    invoke-direct {p0, v0, v1}, Lcom/momo/xengine/ar/ARCameraImpl;->nativeGetHeight(J)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput v0, p2, Lcom/momo/xengine/ar/IXARCamera$Size;->height:I

    .line 21
    .line 22
    :cond_0
    iget-wide v0, p0, Lcom/momo/xengine/ar/ARCameraImpl;->nativeCamera:J

    .line 23
    .line 24
    invoke-direct {p0, v0, v1, p1}, Lcom/momo/xengine/ar/ARCameraImpl;->nativeUpdate(JI)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0
.end method
