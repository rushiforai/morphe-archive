.class public Lcom/immomo/mediacore/sink/CongressUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static volatile mIsLibLoaded:Z

.field private static sLocalLibLoader:Ll/wfm;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/immomo/mediacore/sink/CongressUtil$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/mediacore/sink/CongressUtil$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/immomo/mediacore/sink/CongressUtil;->sLocalLibLoader:Ll/wfm;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-static {v0}, Lcom/immomo/mediacore/sink/CongressUtil;->loadLibrariesOnce(Ll/wfm;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0}, Lcom/immomo/mediacore/sink/CongressUtil;->setYuvCallback(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private native _clearPcmCallBack()V
.end method

.method public static native _getPara([B)Ljava/lang/String;
.end method

.method private static native _renderYuvData(I[BII)V
.end method

.method private static native _setCutPosition(IIII)V
.end method

.method private static native _setCutPositionByUserid(FFFFI)V
.end method

.method private static native _setCutPosition_f(FFFF)V
.end method

.method private native _setRtcEngine(J)V
.end method

.method private native _setVideoSurface(JLandroid/view/Surface;)V
.end method

.method private native _yuvCallBackEnable(I)V
.end method

.method private static loadLibrariesOnce(Ll/wfm;)V
    .locals 2

    .line 1
    const-class v0, Lcom/immomo/mediacore/sink/CongressUtil;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/immomo/mediacore/sink/CongressUtil;->mIsLibLoaded:Z

    .line 5
    .line 6
    if-nez v1, :cond_1

    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    sget-object p0, Lcom/immomo/mediacore/sink/CongressUtil;->sLocalLibLoader:Ll/wfm;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    :goto_0
    const-string v1, "congressUtil"

    .line 16
    .line 17
    invoke-interface {p0, v1}, Ll/wfm;->loadLibrary(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const-string v1, "apm-congressRender"

    .line 21
    .line 22
    invoke-interface {p0, v1}, Ll/wfm;->loadLibrary(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    sput-boolean p0, Lcom/immomo/mediacore/sink/CongressUtil;->mIsLibLoaded:Z

    .line 27
    .line 28
    :cond_1
    monitor-exit v0

    .line 29
    return-void

    .line 30
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0
.end method

.method public static renderYuvData(I[BII)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/immomo/mediacore/sink/CongressUtil;->_renderYuvData(I[BII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static setCutPostion(FFFF)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/immomo/mediacore/sink/CongressUtil;->_setCutPosition_f(FFFF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static setCutPostion(FFFFI)V
    .locals 0

    .line 6
    invoke-static {p0, p1, p2, p3, p4}, Lcom/immomo/mediacore/sink/CongressUtil;->_setCutPositionByUserid(FFFFI)V

    return-void
.end method

.method public static setCutPostion(IIII)V
    .locals 0

    .line 5
    return-void
.end method


# virtual methods
.method public clearPcmCallback()V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/immomo/mediacore/sink/CongressUtil;->_clearPcmCallBack()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catch_1
    move-exception p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    :goto_0
    return-void
.end method

.method public getPara([B)Ljava/lang/String;
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p1}, Lcom/immomo/mediacore/sink/CongressUtil;->_getPara([B)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object p0

    .line 6
    :catch_0
    move-exception p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :catch_1
    move-exception p0

    .line 12
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 13
    .line 14
    .line 15
    :goto_0
    const-string p0, "xx00"

    .line 16
    .line 17
    return-object p0
.end method

.method public setRtcEngineHandler(J)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/immomo/mediacore/sink/CongressUtil;->_setRtcEngine(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setVideoSurface(JLandroid/view/Surface;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1, p2, p3}, Lcom/immomo/mediacore/sink/CongressUtil;->_setVideoSurface(JLandroid/view/Surface;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catch_1
    move-exception p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    :goto_0
    return-void
.end method

.method public setYuvCallback(I)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0, p1}, Lcom/immomo/mediacore/sink/CongressUtil;->_yuvCallBackEnable(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catch_1
    move-exception p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    :goto_0
    return-void
.end method
