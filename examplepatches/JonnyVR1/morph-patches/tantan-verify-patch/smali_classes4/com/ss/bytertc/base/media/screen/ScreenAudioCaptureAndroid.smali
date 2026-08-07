.class public Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroid;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureObserver;


# static fields
.field private static final TAG:Ljava/lang/String; = "ScreenAudioCaptureAndroid"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mIsAudioCaptureWorking:Z

.field private mNativeCaptureObserver:J


# direct methods
.method public constructor <init>(J)V
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
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroid;->mIsAudioCaptureWorking:Z

    .line 6
    .line 7
    iput-wide p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroid;->mNativeCaptureObserver:J

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public onAudioFrameCapture([BIII)V
    .locals 6

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroid;->mNativeCaptureObserver:J

    .line 2
    .line 3
    move-object v2, p1

    .line 4
    move v3, p2

    .line 5
    move v4, p3

    .line 6
    move v5, p4

    .line 7
    invoke-static/range {v0 .. v5}, Lcom/ss/bytertc/base/media/screen/RTCScreenAudioNativeFunctions;->nativeOnAuidoFrameCaptured(J[BIII)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onCapturerStarted()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroid;->mNativeCaptureObserver:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/ss/bytertc/base/media/screen/RTCScreenAudioNativeFunctions;->nativeOnCapturerStarted(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onCapturerStopped()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroid;->mNativeCaptureObserver:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/ss/bytertc/base/media/screen/RTCScreenAudioNativeFunctions;->nativeOnCapturerStopped(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public release()V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroid;->stopCapture()V

    .line 2
    .line 3
    .line 4
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroid;->mContext:Landroid/content/Context;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 9
    .line 10
    const/16 v1, 0x1c

    .line 11
    .line 12
    if-le v0, v1, :cond_0

    .line 13
    .line 14
    sget-object v0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->serviceStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroid;->mContext:Landroid/content/Context;

    .line 23
    .line 24
    const/16 v0, 0x8

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-static {p0, v0, v1}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->getServiceIntent(Landroid/content/Context;ILandroid/content/Intent;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {p0, v0}, Ll/tlk0;->a(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void

    .line 35
    :catch_0
    move-exception p0

    .line 36
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public startCapture()V
    .locals 4
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    :try_start_0
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroid;->mContext:Landroid/content/Context;

    .line 6
    .line 7
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 8
    .line 9
    const/16 v2, 0x1c

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    if-le v1, v2, :cond_2

    .line 13
    .line 14
    const-string v1, "android.permission.RECORD_AUDIO"

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-static {}, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->INSTANCE()Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroid;->mContext:Landroid/content/Context;

    .line 28
    .line 29
    invoke-virtual {v0, v1, p0}, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->initialize(Landroid/content/Context;Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureObserver;)V

    .line 30
    .line 31
    .line 32
    sget-object v0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->serviceStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroid;->mContext:Landroid/content/Context;

    .line 41
    .line 42
    const/4 v1, 0x6

    .line 43
    const/4 v2, 0x0

    .line 44
    invoke-static {v0, v1, v2}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->getServiceIntent(Landroid/content/Context;ILandroid/content/Intent;)Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-static {v0, v1}, Ll/tlk0;->a(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 49
    .line 50
    .line 51
    :cond_1
    iput-boolean v3, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroid;->mIsAudioCaptureWorking:Z

    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    :goto_0
    iget-wide v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroid;->mNativeCaptureObserver:J

    .line 55
    .line 56
    invoke-static {v0, v1, v3}, Lcom/ss/bytertc/base/media/screen/RTCScreenAudioNativeFunctions;->nativeOnCapturerError(JI)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :catch_0
    move-exception p0

    .line 61
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public stopCapture()V
    .locals 3
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroid;->mIsAudioCaptureWorking:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    :try_start_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 6
    .line 7
    const/16 v1, 0x1c

    .line 8
    .line 9
    if-le v0, v1, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->serviceStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroid;->mContext:Landroid/content/Context;

    .line 20
    .line 21
    const/4 v1, 0x7

    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-static {v0, v1, v2}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->getServiceIntent(Landroid/content/Context;ILandroid/content/Intent;)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v0, v1}, Ll/tlk0;->a(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 28
    .line 29
    .line 30
    :cond_0
    const/4 v0, 0x0

    .line 31
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroid;->mIsAudioCaptureWorking:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    return-void

    .line 34
    :catch_0
    move-exception p0

    .line 35
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method
