.class public Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/base/media/VideoCapturer;
.implements Lcom/ss/bytertc/base/media/VideoSink;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$HOLDER;,
        Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field public static final DEFAULT_MIN_FRAME_RATE:I = 0x4

.field private static final DISPLAY_FLAGS:I = 0xb

.field private static final TAG:Ljava/lang/String; = "ScreenCapture"

.field private static final VIRTUAL_DISPLAY_DPI:I = 0x190

.field private static final VIRTUAL_DISPLAY_NAME:Ljava/lang/String; = "RTCScreenCapture"


# instance fields
.field private capturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private height:I

.field private isDisposed:Z

.field private isSurfaceDispose:Z

.field private mContext:Landroid/content/Context;

.field private mCurrentOrientation:Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;

.field private mDisplay:Landroid/view/Display;

.field private mEnableDoOrientation:Z

.field private mFrameIndex:I

.field private mLocks:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/concurrent/CountDownLatch;",
            ">;"
        }
    .end annotation
.end field

.field private mPicoCapture2DTexture:Z

.field private mPicoCreateMediaProjection:Z

.field private mPicoNotCheckOrientation:Z

.field private mPicoVirtualDisplayDpi:I

.field private mPicoVirtualDisplayFlag:I

.field private mPicoVirtualDisplayName:Ljava/lang/String;

.field private mVideoFrames:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/bytedance/realx/video/VideoFrame;",
            ">;"
        }
    .end annotation
.end field

.field private mediaProjection:Landroid/media/projection/MediaProjection;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private mediaProjectionCallback:Landroid/media/projection/MediaProjection$Callback;

.field private mediaProjectionManager:Landroid/media/projection/MediaProjectionManager;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private mediaProjectionPermissionResultData:Landroid/content/Intent;

.field private numCapturedFrames:J

.field private surfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private virtualDisplay:Landroid/hardware/display/VirtualDisplay;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private width:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mFrameIndex:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput-boolean v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mEnableDoOrientation:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mPicoNotCheckOrientation:Z

    .line 11
    .line 12
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mPicoCreateMediaProjection:Z

    .line 13
    .line 14
    const-string v1, "RTCScreenCapture"

    .line 15
    .line 16
    iput-object v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mPicoVirtualDisplayName:Ljava/lang/String;

    .line 17
    .line 18
    const/16 v1, 0x190

    .line 19
    .line 20
    iput v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mPicoVirtualDisplayDpi:I

    .line 21
    .line 22
    const/16 v1, 0xb

    .line 23
    .line 24
    iput v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mPicoVirtualDisplayFlag:I

    .line 25
    .line 26
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mPicoCapture2DTexture:Z

    .line 27
    .line 28
    new-instance v0, Ljava/util/HashMap;

    .line 29
    .line 30
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mVideoFrames:Ljava/util/Map;

    .line 34
    .line 35
    new-instance v0, Ljava/util/HashMap;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mLocks:Ljava/util/Map;

    .line 41
    .line 42
    return-void
.end method

.method public synthetic constructor <init>(Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$1;)V
    .locals 0

    .line 43
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;-><init>()V

    return-void
.end method

.method public static INSTANCE()Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;
    .locals 1

    .line 1
    invoke-static {}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$HOLDER;->access$100()Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static synthetic access$200(Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;)Lcom/ss/bytertc/base/media/SurfaceTextureHelper;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->surfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;)Lcom/ss/bytertc/base/media/CapturerObserver;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->capturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$400(Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;)Landroid/hardware/display/VirtualDisplay;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$402(Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;Landroid/hardware/display/VirtualDisplay;)Landroid/hardware/display/VirtualDisplay;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$500(Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;)Landroid/media/projection/MediaProjection;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mediaProjection:Landroid/media/projection/MediaProjection;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$502(Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;Landroid/media/projection/MediaProjection;)Landroid/media/projection/MediaProjection;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mediaProjection:Landroid/media/projection/MediaProjection;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$600(Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;)Landroid/media/projection/MediaProjection$Callback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mediaProjectionCallback:Landroid/media/projection/MediaProjection$Callback;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$702(Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;)Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mCurrentOrientation:Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$800(Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->createVirtualDisplay()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private checkNotDisposed()V
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->isDisposed:Z

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p0, "capturer is disposed."

    .line 7
    .line 8
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private createVirtualDisplay()V
    .locals 15

    .line 1
    const-string v0, "create virtual display failed."

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->updateVirtualDisplayConfig()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const-string v2, "ScreenCapture"

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->width:I

    .line 12
    .line 13
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->height:I

    .line 18
    .line 19
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "[ScreenCapture] call updateVirtualDisplayConfig success, width=%d, height=%d"

    .line 28
    .line 29
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {v2, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iget-object v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mediaProjection:Landroid/media/projection/MediaProjection;

    .line 38
    .line 39
    if-nez v1, :cond_1

    .line 40
    .line 41
    const-string p0, "createVirtualDisplay failed, mediaProjection is null"

    .line 42
    .line 43
    invoke-static {v2, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    iget-object v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    .line 48
    .line 49
    const/4 v3, 0x0

    .line 50
    if-eqz v1, :cond_2

    .line 51
    .line 52
    const-string v1, "[ScreenCapture] release current virtualdisplay"

    .line 53
    .line 54
    invoke-static {v2, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    .line 58
    .line 59
    invoke-virtual {v1}, Landroid/hardware/display/VirtualDisplay;->release()V

    .line 60
    .line 61
    .line 62
    iput-object v3, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    .line 63
    .line 64
    :cond_2
    iget-object v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->surfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 65
    .line 66
    iget v4, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->width:I

    .line 67
    .line 68
    iget v5, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->height:I

    .line 69
    .line 70
    invoke-virtual {v1, v4, v5}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->setTextureSize(II)V

    .line 71
    .line 72
    .line 73
    :try_start_0
    const-string v1, "[ScreenCapture] call |createVirtualDisplay|,  width=%d, height=%d"

    .line 74
    .line 75
    iget v4, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->width:I

    .line 76
    .line 77
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    iget v5, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->height:I

    .line 82
    .line 83
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    filled-new-array {v4, v5}, [Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-static {v2, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    iget-object v5, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mPicoVirtualDisplayName:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    .line 100
    iget-object v4, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mediaProjection:Landroid/media/projection/MediaProjection;

    .line 101
    .line 102
    if-eqz v5, :cond_3

    .line 103
    .line 104
    :try_start_1
    iget v6, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->width:I

    .line 105
    .line 106
    iget v7, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->height:I

    .line 107
    .line 108
    iget v8, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mPicoVirtualDisplayDpi:I

    .line 109
    .line 110
    iget v9, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mPicoVirtualDisplayFlag:I

    .line 111
    .line 112
    new-instance v10, Landroid/view/Surface;

    .line 113
    .line 114
    iget-object v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->surfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 115
    .line 116
    invoke-virtual {v1}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-direct {v10, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 121
    .line 122
    .line 123
    const/4 v11, 0x0

    .line 124
    const/4 v12, 0x0

    .line 125
    invoke-virtual/range {v4 .. v12}, Landroid/media/projection/MediaProjection;->createVirtualDisplay(Ljava/lang/String;IIIILandroid/view/Surface;Landroid/hardware/display/VirtualDisplay$Callback;Landroid/os/Handler;)Landroid/hardware/display/VirtualDisplay;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    iput-object v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_3
    const-string v7, "RTCScreenCapture"

    .line 133
    .line 134
    iget v8, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->width:I

    .line 135
    .line 136
    iget v9, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->height:I

    .line 137
    .line 138
    new-instance v12, Landroid/view/Surface;

    .line 139
    .line 140
    iget-object v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->surfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 141
    .line 142
    invoke-virtual {v1}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-direct {v12, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 147
    .line 148
    .line 149
    const/4 v13, 0x0

    .line 150
    const/4 v14, 0x0

    .line 151
    const/16 v10, 0x190

    .line 152
    .line 153
    const/16 v11, 0xb

    .line 154
    .line 155
    move-object v6, v4

    .line 156
    invoke-virtual/range {v6 .. v14}, Landroid/media/projection/MediaProjection;->createVirtualDisplay(Ljava/lang/String;IIIILandroid/view/Surface;Landroid/hardware/display/VirtualDisplay$Callback;Landroid/os/Handler;)Landroid/hardware/display/VirtualDisplay;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    iput-object v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    .line 161
    .line 162
    :goto_0
    iget-object v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    .line 163
    .line 164
    if-nez v1, :cond_4

    .line 165
    .line 166
    iget-object v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->capturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 167
    .line 168
    if-eqz v1, :cond_4

    .line 169
    .line 170
    invoke-interface {v1, v0}, Lcom/ss/bytertc/base/media/CapturerObserver;->onCapturerError(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :catch_0
    iput-object v3, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    .line 175
    .line 176
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->capturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 177
    .line 178
    if-eqz p0, :cond_4

    .line 179
    .line 180
    invoke-interface {p0, v0}, Lcom/ss/bytertc/base/media/CapturerObserver;->onCapturerError(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    :cond_4
    return-void
.end method

.method private getDeviceOrientation(I)Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    const/16 p0, 0x5a

    .line 4
    .line 5
    if-eq p1, p0, :cond_0

    .line 6
    .line 7
    const/16 p0, 0xb4

    .line 8
    .line 9
    if-eq p1, p0, :cond_1

    .line 10
    .line 11
    const/16 p0, 0x10e

    .line 12
    .line 13
    if-eq p1, p0, :cond_0

    .line 14
    .line 15
    sget-object p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;->LANDSCAPE:Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    sget-object p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;->LANDSCAPE:Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    sget-object p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;->PORTRAIT:Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;

    .line 22
    .line 23
    return-object p0
.end method

.method private getDeviceRotation()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mDisplay:Landroid/view/Display;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/Display;->getRotation()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p0, :cond_3

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    if-eq p0, v1, :cond_2

    .line 12
    .line 13
    const/4 v1, 0x2

    .line 14
    if-eq p0, v1, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x3

    .line 17
    if-eq p0, v1, :cond_0

    .line 18
    .line 19
    return v0

    .line 20
    :cond_0
    const/16 p0, 0x10e

    .line 21
    .line 22
    return p0

    .line 23
    :cond_1
    const/16 p0, 0xb4

    .line 24
    .line 25
    return p0

    .line 26
    :cond_2
    const/16 p0, 0x5a

    .line 27
    .line 28
    return p0

    .line 29
    :cond_3
    return v0
.end method

.method private getDisplayOrientation()Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget p0, p0, Landroid/content/res/Configuration;->orientation:I

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    if-ne p0, v0, :cond_0

    .line 15
    .line 16
    sget-object p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;->PORTRAIT:Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    sget-object p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;->LANDSCAPE:Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;

    .line 20
    .line 21
    return-object p0
.end method

.method private maybeDoRotation()Z
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->getDeviceRotation()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-direct {p0, v0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->getDeviceOrientation(I)Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->getDisplayOrientation()Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-object v3, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mCurrentOrientation:Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;

    .line 14
    .line 15
    if-ne v2, v3, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return p0

    .line 19
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    filled-new-array {v0, v3, v1}, [Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "[ScreenCapture] call |maybeDoRotation| and orientation != mCurrentOrientation, rotation:%d, orientation:%s, orientation1:%s"

    .line 36
    .line 37
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-string v1, "ScreenCapture"

    .line 42
    .line 43
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iput-object v2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mCurrentOrientation:Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;

    .line 47
    .line 48
    invoke-direct {p0, v2}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->rotateCaptureOrientation(Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;)V

    .line 49
    .line 50
    .line 51
    const/4 p0, 0x1

    .line 52
    return p0
.end method

.method private rotateCaptureOrientation(Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mEnableDoOrientation:Z

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    sget-object v0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;->LANDSCAPE:Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;

    .line 6
    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    iget v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->width:I

    .line 10
    .line 11
    iget v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->height:I

    .line 12
    .line 13
    if-lt v0, v1, :cond_1

    .line 14
    .line 15
    :cond_0
    sget-object v0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;->PORTRAIT:Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;

    .line 16
    .line 17
    if-ne p1, v0, :cond_2

    .line 18
    .line 19
    iget v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->height:I

    .line 20
    .line 21
    iget v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->width:I

    .line 22
    .line 23
    if-ge v0, v1, :cond_2

    .line 24
    .line 25
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->width:I

    .line 30
    .line 31
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iget v2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->height:I

    .line 36
    .line 37
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    filled-new-array {v0, v1, v2}, [Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v1, "[ScreenCapture] call |rotateCaptureOrientation| before(orientation:%s, width:%d, height:%d)"

    .line 46
    .line 47
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v1, "ScreenCapture"

    .line 52
    .line 53
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->width:I

    .line 57
    .line 58
    iget v2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->height:I

    .line 59
    .line 60
    iput v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->height:I

    .line 61
    .line 62
    sub-int/2addr v2, v0

    .line 63
    add-int/2addr v0, v2

    .line 64
    iput v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->width:I

    .line 65
    .line 66
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iget v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->width:I

    .line 71
    .line 72
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iget p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->height:I

    .line 77
    .line 78
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    filled-new-array {p1, v0, p0}, [Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    const-string p1, "[ScreenCapture] call |rotateCaptureOrientation| after(orientation:%s, width:%d, height:%d)"

    .line 87
    .line 88
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    :cond_2
    return-void
.end method

.method private updateVirtualDisplayConfig()Z
    .locals 4

    .line 1
    iget v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->width:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->height:I

    .line 8
    .line 9
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "[ScreenCapture] updateVirtualDisplayConfig width=%d, height=%d"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "ScreenCapture"

    .line 24
    .line 25
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mediaProjection:Landroid/media/projection/MediaProjection;

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    const-string p0, "updateVirtualDisplayConfig failed, mediaProjection is null"

    .line 34
    .line 35
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return v2

    .line 39
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    .line 40
    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    const-string p0, "updateVirtualDisplayConfig failed, virtualDisplay is null"

    .line 44
    .line 45
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return v2

    .line 49
    :cond_1
    iget-object v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mPicoVirtualDisplayName:Ljava/lang/String;

    .line 50
    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    iget v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mPicoVirtualDisplayDpi:I

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    const/16 v1, 0x190

    .line 57
    .line 58
    :goto_0
    const/4 v2, 0x0

    .line 59
    invoke-virtual {v0, v2}, Landroid/hardware/display/VirtualDisplay;->setSurface(Landroid/view/Surface;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->surfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 63
    .line 64
    iget v2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->width:I

    .line 65
    .line 66
    iget v3, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->height:I

    .line 67
    .line 68
    invoke-virtual {v0, v2, v3}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->setTextureSize(II)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    .line 72
    .line 73
    iget v2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->width:I

    .line 74
    .line 75
    iget v3, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->height:I

    .line 76
    .line 77
    invoke-virtual {v0, v2, v3, v1}, Landroid/hardware/display/VirtualDisplay;->resize(III)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    .line 81
    .line 82
    new-instance v1, Landroid/view/Surface;

    .line 83
    .line 84
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->surfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-direct {v1, p0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0, v1}, Landroid/hardware/display/VirtualDisplay;->setSurface(Landroid/view/Surface;)V

    .line 94
    .line 95
    .line 96
    const/4 p0, 0x1

    .line 97
    return p0
.end method


# virtual methods
.method public addFrame(Lcom/bytedance/realx/video/VideoFrame;)I
    .locals 3

    .line 1
    iget v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mFrameIndex:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mVideoFrames:Ljava/util/Map;

    .line 4
    .line 5
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    iget p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mFrameIndex:I

    .line 13
    .line 14
    add-int/lit8 p1, p1, 0x1

    .line 15
    .line 16
    iput p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mFrameIndex:I

    .line 17
    .line 18
    return v0
.end method

.method public addLock(ILjava/util/concurrent/CountDownLatch;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mLocks:Ljava/util/Map;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public declared-synchronized changeCaptureFormat(III)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->checkNotDisposed()V

    .line 3
    .line 4
    .line 5
    new-instance p3, Landroid/util/DisplayMetrics;

    .line 6
    .line 7
    invoke-direct {p3}, Landroid/util/DisplayMetrics;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mDisplay:Landroid/view/Display;

    .line 11
    .line 12
    invoke-virtual {v0, p3}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    .line 13
    .line 14
    .line 15
    if-lez p1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget p1, p3, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 19
    .line 20
    :goto_0
    if-lez p2, :cond_1

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_1
    iget p2, p3, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 24
    .line 25
    :goto_1
    add-int/lit8 p1, p1, 0x7

    .line 26
    .line 27
    div-int/lit8 p1, p1, 0x8

    .line 28
    .line 29
    mul-int/lit8 p1, p1, 0x8

    .line 30
    .line 31
    add-int/lit8 p2, p2, 0x7

    .line 32
    .line 33
    div-int/lit8 p2, p2, 0x8

    .line 34
    .line 35
    mul-int/lit8 p2, p2, 0x8

    .line 36
    .line 37
    iget p3, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->width:I

    .line 38
    .line 39
    if-ne p1, p3, :cond_2

    .line 40
    .line 41
    iget p3, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->height:I

    .line 42
    .line 43
    if-ne p2, p3, :cond_2

    .line 44
    .line 45
    const-string p1, "ScreenCapture"

    .line 46
    .line 47
    const-string p2, "[ScreenCapture] call |changeCaptureFormat|, width & height are same as previous, ignore the request"

    .line 48
    .line 49
    invoke-static {p1, p2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    .line 51
    .line 52
    monitor-exit p0

    .line 53
    return-void

    .line 54
    :catchall_0
    move-exception p1

    .line 55
    goto :goto_2

    .line 56
    :cond_2
    :try_start_1
    iput p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->width:I

    .line 57
    .line 58
    iput p2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->height:I

    .line 59
    .line 60
    iget-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 61
    .line 62
    if-nez p1, :cond_3

    .line 63
    .line 64
    monitor-exit p0

    .line 65
    return-void

    .line 66
    :cond_3
    :try_start_2
    iget-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->surfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 67
    .line 68
    invoke-virtual {p1}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->getHandler()Landroid/os/Handler;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    new-instance p2, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$2;

    .line 73
    .line 74
    invoke-direct {p2, p0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$2;-><init>(Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;)V

    .line 75
    .line 76
    .line 77
    invoke-static {p1, p2}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 78
    .line 79
    .line 80
    monitor-exit p0

    .line 81
    return-void

    .line 82
    :goto_2
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 83
    throw p1
.end method

.method public disableDoOrientation()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mEnableDoOrientation:Z

    .line 3
    .line 4
    return-void
.end method

.method public declared-synchronized dispose()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x1

    .line 29
    :try_start_0
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->isDisposed:Z

    .line 30
    iget-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->isSurfaceDispose:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->surfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    if-eqz v0, :cond_0

    .line 31
    invoke-virtual {v0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->dispose()V

    const/4 v0, 0x0

    .line 32
    iput-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->surfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    .line 33
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public declared-synchronized dispose(I)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mLocks:Ljava/util/Map;

    .line 3
    .line 4
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Ljava/util/concurrent/CountDownLatch;

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->dispose()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    monitor-exit p0

    .line 26
    return-void

    .line 27
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    throw p1
.end method

.method public enableFollowGravity(Z)I
    .locals 0

    const/4 p0, -0x1

    return p0
.end method

.method public getCameraZoomMaxRatio()F
    .locals 0

    const/high16 p0, 0x3f800000    # 1.0f

    return p0
.end method

.method public getDeviceOrientation()I
    .locals 0

    .line 24
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/CameraSession;->getDeviceUIOrientation(Landroid/content/Context;)I

    move-result p0

    return p0
.end method

.method public getMediaProjection()Landroid/media/projection/MediaProjection;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mediaProjection:Landroid/media/projection/MediaProjection;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNumCapturedFrames()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->numCapturedFrames:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public declared-synchronized initialize(Lcom/bytedance/realx/video/EglBase$Context;Landroid/content/Context;Lcom/ss/bytertc/base/media/CapturerObserver;)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->checkNotDisposed()V

    .line 3
    .line 4
    .line 5
    if-eqz p3, :cond_1

    .line 6
    .line 7
    iput-object p3, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->capturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 8
    .line 9
    const-string v0, "RXLocalCapturer"

    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mPicoCapture2DTexture:Z

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {v0, p1, v2, v1}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->create(Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;ZZ)Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->surfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->isSurfaceDispose:Z

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mCurrentOrientation:Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;

    .line 25
    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    iput-object p2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mContext:Landroid/content/Context;

    .line 29
    .line 30
    const-string p1, "media_projection"

    .line 31
    .line 32
    invoke-virtual {p2, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Landroid/media/projection/MediaProjectionManager;

    .line 37
    .line 38
    iput-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mediaProjectionManager:Landroid/media/projection/MediaProjectionManager;

    .line 39
    .line 40
    const-string p1, "window"

    .line 41
    .line 42
    invoke-virtual {p2, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Landroid/view/WindowManager;

    .line 47
    .line 48
    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iput-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mDisplay:Landroid/view/Display;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    .line 54
    monitor-exit p0

    .line 55
    return-void

    .line 56
    :catchall_0
    move-exception p1

    .line 57
    goto :goto_0

    .line 58
    :cond_0
    :try_start_1
    const-string p1, "surfaceTextureHelper is null."

    .line 59
    .line 60
    invoke-interface {p3, p1}, Lcom/ss/bytertc/base/media/CapturerObserver;->onCapturerError(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    new-instance p1, Ljava/lang/RuntimeException;

    .line 64
    .line 65
    const-string p2, "surfaceTextureHelper is null."

    .line 66
    .line 67
    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    throw p1

    .line 71
    :cond_1
    new-instance p1, Ljava/lang/RuntimeException;

    .line 72
    .line 73
    const-string p2, "capturerObserver not set."

    .line 74
    .line 75
    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    throw p1

    .line 79
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 80
    throw p1
.end method

.method public declared-synchronized initialize(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;Landroid/content/Context;Lcom/ss/bytertc/base/media/CapturerObserver;)V
    .locals 0

    monitor-enter p0

    .line 81
    :try_start_0
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->checkNotDisposed()V

    if-eqz p3, :cond_1

    .line 82
    iput-object p3, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->capturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

    if-eqz p1, :cond_0

    .line 83
    iput-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->surfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    const/4 p1, 0x0

    .line 84
    iput-boolean p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->isSurfaceDispose:Z

    const/4 p1, 0x0

    .line 85
    iput-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mCurrentOrientation:Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;

    .line 86
    iput-object p2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mContext:Landroid/content/Context;

    .line 87
    const-string p1, "media_projection"

    invoke-virtual {p2, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/media/projection/MediaProjectionManager;

    iput-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mediaProjectionManager:Landroid/media/projection/MediaProjectionManager;

    .line 88
    const-string p1, "window"

    .line 89
    invoke-virtual {p2, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/WindowManager;

    .line 90
    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mDisplay:Landroid/view/Display;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 91
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    goto :goto_0

    .line 92
    :cond_0
    :try_start_1
    const-string p1, "surfaceTextureHelper not set."

    invoke-interface {p3, p1}, Lcom/ss/bytertc/base/media/CapturerObserver;->onCapturerError(Ljava/lang/String;)V

    .line 93
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "surfaceTextureHelper not set."

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 94
    :cond_1
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "capturerObserver not set."

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 95
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public isCameraTorchSupported()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isCameraZoomSupported()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isScreencast()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public onFrame(Lcom/bytedance/realx/video/VideoFrame;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mPicoNotCheckOrientation:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->maybeDoRotation()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->createVirtualDisplay()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->numCapturedFrames:J

    .line 16
    .line 17
    const-wide/16 v2, 0x1

    .line 18
    .line 19
    add-long/2addr v0, v2

    .line 20
    iput-wide v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->numCapturedFrames:J

    .line 21
    .line 22
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->capturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 23
    .line 24
    invoke-interface {p0, p1}, Lcom/ss/bytertc/base/media/CapturerObserver;->onFrameCaptured(Lcom/bytedance/realx/video/VideoFrame;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public removeFrame(I)Lcom/bytedance/realx/video/VideoFrame;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mVideoFrames:Ljava/util/Map;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mVideoFrames:Ljava/util/Map;

    .line 14
    .line 15
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/bytedance/realx/video/VideoFrame;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public setCameraZoomRatio(F)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setData(Landroid/content/Intent;Landroid/media/projection/MediaProjection$Callback;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->isDisposed:Z

    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mediaProjectionPermissionResultData:Landroid/content/Intent;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mediaProjectionCallback:Landroid/media/projection/MediaProjection$Callback;

    .line 7
    .line 8
    const-string p2, "pico_not_check_orientation"

    .line 9
    .line 10
    invoke-virtual {p1, p2, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    iput-boolean p2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mPicoNotCheckOrientation:Z

    .line 15
    .line 16
    const-string p2, "pico_create_media_projection"

    .line 17
    .line 18
    invoke-virtual {p1, p2, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    iput-boolean p2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mPicoCreateMediaProjection:Z

    .line 23
    .line 24
    const-string p2, "pico_virtual_display_name"

    .line 25
    .line 26
    invoke-virtual {p1, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    iput-object p2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mPicoVirtualDisplayName:Ljava/lang/String;

    .line 31
    .line 32
    const-string p2, "pico_virtual_display_dpi"

    .line 33
    .line 34
    const/16 v1, 0x190

    .line 35
    .line 36
    invoke-virtual {p1, p2, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    iput p2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mPicoVirtualDisplayDpi:I

    .line 41
    .line 42
    const-string p2, "pico_virtual_display_flags"

    .line 43
    .line 44
    const/16 v1, 0xb

    .line 45
    .line 46
    invoke-virtual {p1, p2, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    iput p2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mPicoVirtualDisplayFlag:I

    .line 51
    .line 52
    const-string p2, "pico_need_capture_2d_texture"

    .line 53
    .line 54
    invoke-virtual {p1, p2, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    iput-boolean p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mPicoCapture2DTexture:Z

    .line 59
    .line 60
    return-void
.end method

.method public declared-synchronized startCapture(III)V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x4

    .line 233
    :try_start_0
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->startCapture(IIII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 234
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized startCapture(IIII)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->checkNotDisposed()V

    .line 3
    .line 4
    .line 5
    const-string p3, "ScreenCapture"

    .line 6
    .line 7
    const-string v0, "[ScreenCapture] call |startCapture|,  width=%d, height=%d"

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {p3, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    if-lez p1, :cond_0

    .line 29
    .line 30
    if-lez p2, :cond_0

    .line 31
    .line 32
    iput p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->width:I

    .line 33
    .line 34
    iput p2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->height:I

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception p1

    .line 38
    goto/16 :goto_4

    .line 39
    .line 40
    :cond_0
    new-instance p1, Landroid/util/DisplayMetrics;

    .line 41
    .line 42
    invoke-direct {p1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 43
    .line 44
    .line 45
    iget-object p2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mDisplay:Landroid/view/Display;

    .line 46
    .line 47
    invoke-virtual {p2, p1}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    .line 48
    .line 49
    .line 50
    iget p2, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 51
    .line 52
    iput p2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->width:I

    .line 53
    .line 54
    iget p3, p1, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 55
    .line 56
    iput p3, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->height:I

    .line 57
    .line 58
    const-string p3, "ScreenCapture"

    .line 59
    .line 60
    const-string v0, "[ScreenCapture] call |startCapture| , get screen real size, width=%d, height=%d"

    .line 61
    .line 62
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    iget p1, p1, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 67
    .line 68
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    filled-new-array {p2, p1}, [Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-static {p3, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :goto_0
    iget p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->width:I

    .line 84
    .line 85
    add-int/lit8 p1, p1, 0x7

    .line 86
    .line 87
    div-int/lit8 p1, p1, 0x8

    .line 88
    .line 89
    mul-int/lit8 p1, p1, 0x8

    .line 90
    .line 91
    iput p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->width:I

    .line 92
    .line 93
    iget p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->height:I

    .line 94
    .line 95
    add-int/lit8 p1, p1, 0x7

    .line 96
    .line 97
    div-int/lit8 p1, p1, 0x8

    .line 98
    .line 99
    mul-int/lit8 p1, p1, 0x8

    .line 100
    .line 101
    iput p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->height:I

    .line 102
    .line 103
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->maybeDoRotation()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 104
    .line 105
    .line 106
    const/4 p1, 0x0

    .line 107
    :try_start_1
    iget-object p2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mediaProjectionManager:Landroid/media/projection/MediaProjectionManager;

    .line 108
    .line 109
    iget-object p3, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mediaProjectionPermissionResultData:Landroid/content/Intent;

    .line 110
    .line 111
    const/4 v0, -0x1

    .line 112
    invoke-virtual {p2, v0, p3}, Landroid/media/projection/MediaProjectionManager;->getMediaProjection(ILandroid/content/Intent;)Landroid/media/projection/MediaProjection;

    .line 113
    .line 114
    .line 115
    move-result-object p2

    .line 116
    iput-object p2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mediaProjection:Landroid/media/projection/MediaProjection;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 117
    .line 118
    goto :goto_1

    .line 119
    :catch_0
    :try_start_2
    iput-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mediaProjection:Landroid/media/projection/MediaProjection;

    .line 120
    .line 121
    :goto_1
    iget-object p2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mediaProjection:Landroid/media/projection/MediaProjection;

    .line 122
    .line 123
    if-nez p2, :cond_1

    .line 124
    .line 125
    iget-boolean p2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mPicoCreateMediaProjection:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 126
    .line 127
    if-eqz p2, :cond_1

    .line 128
    .line 129
    :try_start_3
    const-class p2, Landroid/media/projection/MediaProjectionManager;

    .line 130
    .line 131
    const-string p3, "createMediaProjection"

    .line 132
    .line 133
    invoke-virtual {p2, p3, p1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    iget-object p3, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mediaProjectionManager:Landroid/media/projection/MediaProjectionManager;

    .line 138
    .line 139
    invoke-virtual {p2, p3, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object p2

    .line 143
    check-cast p2, Landroid/media/projection/MediaProjection;

    .line 144
    .line 145
    iput-object p2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mediaProjection:Landroid/media/projection/MediaProjection;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 146
    .line 147
    goto :goto_2

    .line 148
    :catch_1
    :try_start_4
    iput-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mediaProjection:Landroid/media/projection/MediaProjection;

    .line 149
    .line 150
    :cond_1
    :goto_2
    iget-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mediaProjection:Landroid/media/projection/MediaProjection;

    .line 151
    .line 152
    if-nez p1, :cond_3

    .line 153
    .line 154
    iget-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->capturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 155
    .line 156
    if-eqz p1, :cond_2

    .line 157
    .line 158
    const-string p2, "no permission to capture the screen video."

    .line 159
    .line 160
    invoke-interface {p1, p2}, Lcom/ss/bytertc/base/media/CapturerObserver;->onCapturerError(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 161
    .line 162
    .line 163
    :cond_2
    monitor-exit p0

    .line 164
    return-void

    .line 165
    :cond_3
    :try_start_5
    iget-object p2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mediaProjectionCallback:Landroid/media/projection/MediaProjection$Callback;

    .line 166
    .line 167
    iget-object p3, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->surfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 168
    .line 169
    invoke-virtual {p3}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->getHandler()Landroid/os/Handler;

    .line 170
    .line 171
    .line 172
    move-result-object p3

    .line 173
    invoke-virtual {p1, p2, p3}, Landroid/media/projection/MediaProjection;->registerCallback(Landroid/media/projection/MediaProjection$Callback;Landroid/os/Handler;)V

    .line 174
    .line 175
    .line 176
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->createVirtualDisplay()V

    .line 177
    .line 178
    .line 179
    iget-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->capturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 180
    .line 181
    const/4 p2, 0x1

    .line 182
    invoke-interface {p1, p2}, Lcom/ss/bytertc/base/media/CapturerObserver;->onCapturerStarted(Z)V

    .line 183
    .line 184
    .line 185
    iget-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->surfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 186
    .line 187
    if-lez p4, :cond_4

    .line 188
    .line 189
    goto :goto_3

    .line 190
    :cond_4
    const/4 p4, 0x4

    .line 191
    :goto_3
    invoke-virtual {p1, p4}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->setMinFps(I)V

    .line 192
    .line 193
    .line 194
    iget-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->surfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 195
    .line 196
    invoke-virtual {p1, p0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->startListening(Lcom/ss/bytertc/base/media/VideoSink;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 197
    .line 198
    .line 199
    monitor-exit p0

    .line 200
    return-void

    .line 201
    :goto_4
    :try_start_6
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 202
    throw p1
.end method

.method public declared-synchronized startCapture(IIIILandroid/media/projection/MediaProjection;)V
    .locals 3

    monitor-enter p0

    .line 203
    :try_start_0
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->checkNotDisposed()V

    .line 204
    const-string p3, "ScreenCapture"

    const-string v0, "[ScreenCapture] call |startCapture|,  width=%d, height=%d"

    .line 205
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    .line 206
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 207
    invoke-static {p3, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    if-lez p1, :cond_0

    if-lez p2, :cond_0

    .line 208
    iput p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->width:I

    .line 209
    iput p2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->height:I

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_2

    .line 210
    :cond_0
    new-instance p1, Landroid/util/DisplayMetrics;

    invoke-direct {p1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 211
    iget-object p2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mDisplay:Landroid/view/Display;

    invoke-virtual {p2, p1}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    .line 212
    iget p2, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    iput p2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->width:I

    .line 213
    iget p3, p1, Landroid/util/DisplayMetrics;->heightPixels:I

    iput p3, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->height:I

    .line 214
    const-string p3, "ScreenCapture"

    const-string v0, "[ScreenCapture] call |startCapture with MediaProjection| , get screen real size, width=%d, height=%d"

    .line 215
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    iget p1, p1, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p2, p1}, [Ljava/lang/Object;

    move-result-object p1

    .line 216
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 217
    invoke-static {p3, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 218
    :goto_0
    iget p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->width:I

    add-int/lit8 p1, p1, 0x7

    div-int/lit8 p1, p1, 0x8

    mul-int/lit8 p1, p1, 0x8

    iput p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->width:I

    .line 219
    iget p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->height:I

    add-int/lit8 p1, p1, 0x7

    div-int/lit8 p1, p1, 0x8

    mul-int/lit8 p1, p1, 0x8

    iput p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->height:I

    .line 220
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->maybeDoRotation()Z

    .line 221
    iput-object p5, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mediaProjection:Landroid/media/projection/MediaProjection;

    if-nez p5, :cond_2

    .line 222
    iget-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->capturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

    if-eqz p1, :cond_1

    .line 223
    const-string p2, "no permission to capture the screen video."

    invoke-interface {p1, p2}, Lcom/ss/bytertc/base/media/CapturerObserver;->onCapturerError(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 224
    :cond_1
    monitor-exit p0

    return-void

    .line 225
    :cond_2
    :try_start_1
    iget-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->mediaProjectionCallback:Landroid/media/projection/MediaProjection$Callback;

    iget-object p2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->surfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 226
    invoke-virtual {p2}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->getHandler()Landroid/os/Handler;

    move-result-object p2

    .line 227
    invoke-virtual {p5, p1, p2}, Landroid/media/projection/MediaProjection;->registerCallback(Landroid/media/projection/MediaProjection$Callback;Landroid/os/Handler;)V

    .line 228
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->createVirtualDisplay()V

    .line 229
    iget-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->capturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

    const/4 p2, 0x1

    invoke-interface {p1, p2}, Lcom/ss/bytertc/base/media/CapturerObserver;->onCapturerStarted(Z)V

    .line 230
    iget-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->surfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    if-lez p4, :cond_3

    goto :goto_1

    :cond_3
    const/4 p4, 0x4

    :goto_1
    invoke-virtual {p1, p4}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->setMinFps(I)V

    .line 231
    iget-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->surfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    invoke-virtual {p1, p0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->startListening(Lcom/ss/bytertc/base/media/VideoSink;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 232
    monitor-exit p0

    return-void

    :goto_2
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public declared-synchronized stopCapture()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->checkNotDisposed()V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->surfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->getHandler()Landroid/os/Handler;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$1;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$1;-><init>(Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    monitor-exit p0

    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw v0
.end method

.method public turnOffFlashLight()V
    .locals 0

    return-void
.end method

.method public turnOnFlashLight()V
    .locals 0

    return-void
.end method
