.class public Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;
.super Landroid/app/Service;
.source "SourceFile"


# static fields
.field private static final ACTION:Ljava/lang/String; = "ACTION"

.field public static final COMMAND_AUDIO_DISPOSE:I = 0x8

.field public static final COMMAND_AUDIO_START:I = 0x6

.field public static final COMMAND_AUDIO_STOP:I = 0x7

.field public static final COMMAND_CHANGE_CAPTURE_FORMAT:I = 0x3

.field public static final COMMAND_DISPOSE:I = 0x5

.field public static final COMMAND_INVALID:I = -0x1

.field public static final COMMAND_LAUNCH:I = 0x0

.field public static final COMMAND_ON_FRAME:I = 0x4

.field public static final COMMAND_START:I = 0x1

.field public static final COMMAND_STOP:I = 0x2

.field public static final COMMAND_STOP_SERVICE:I = 0x9

.field private static final DATA:Ljava/lang/String; = "DATA"

.field public static final KEY_CONTENT_TEXT:Ljava/lang/String; = "contentText"

.field public static final KEY_HASHCODE:Ljava/lang/String; = "hc"

.field public static final KEY_HEIGHT:Ljava/lang/String; = "h"

.field public static final KEY_IFRAMERATE:Ljava/lang/String; = "if"

.field public static final KEY_INDEX:Ljava/lang/String; = "i"

.field public static final KEY_LARGE_ICON:Ljava/lang/String; = "largei"

.field public static final KEY_LAUNCH_ACTIVITY:Ljava/lang/String; = "activity"

.field public static final KEY_MIN_FRAMERATE:Ljava/lang/String; = "minfr"

.field public static final KEY_PICO_CREATE_MEDIA_PROJECTION:Ljava/lang/String; = "pico_create_media_projection"

.field public static final KEY_PICO_NEED_CAPTURE_2D_TEXTURE:Ljava/lang/String; = "pico_need_capture_2d_texture"

.field public static final KEY_PICO_NOT_CHECK_ORIENTATION:Ljava/lang/String; = "pico_not_check_orientation"

.field public static final KEY_PICO_VIRTUAL_DISPLAY_DPI:Ljava/lang/String; = "pico_virtual_display_dpi"

.field public static final KEY_PICO_VIRTUAL_DISPLAY_FLAG:Ljava/lang/String; = "pico_virtual_display_flags"

.field public static final KEY_PICO_VIRTUAL_DISPLAY_NAME:Ljava/lang/String; = "pico_virtual_display_name"

.field public static final KEY_RESULT_DATA:Ljava/lang/String; = "PermissionResult"

.field public static final KEY_SMALL_ICON:Ljava/lang/String; = "largei"

.field public static final KEY_WIDTH:Ljava/lang/String; = "w"

.field public static final METHOD_PICO_CREATE_MEDIA_PROJECTION:Ljava/lang/String; = "createMediaProjection"

.field private static final TAG:Ljava/lang/String; = "RXScreenCaptureService"

.field public static serviceStarted:Ljava/util/concurrent/atomic/AtomicBoolean;


# instance fields
.field mContentText:Ljava/lang/String;

.field private mHandler:Landroid/os/Handler;

.field private mHandlerThread:Landroid/os/HandlerThread;

.field mLargeIcon:I

.field mLaunchActivity:Ljava/lang/String;

.field private mMediaProjection:Landroid/media/projection/MediaProjection;

.field private mMediaProjectionManager:Landroid/media/projection/MediaProjectionManager;

.field private mPermissionReulstData:Landroid/content/Intent;

.field private mPicoCreateMediaProjection:Z

.field mSmallIcon:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->serviceStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mLargeIcon:I

    .line 6
    .line 7
    iput v0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mSmallIcon:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mPicoCreateMediaProjection:Z

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->INSTANCE()Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->stopAudioCapture()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private audioDispose()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mHandler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v0, Ll/ujc0;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/ujc0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic b()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->INSTANCE()Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->dispose()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic c(III)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->INSTANCE()Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0, p1, p2}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->changeCaptureFormat(III)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private changeCaptureFormat(Landroid/content/Intent;)V
    .locals 4

    .line 1
    invoke-static {p1}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->getData(Landroid/content/Intent;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string v0, "w"

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const-string v2, "h"

    .line 16
    .line 17
    invoke-virtual {p1, v2, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    const-string v3, "if"

    .line 22
    .line 23
    invoke-virtual {p1, v3, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mHandler:Landroid/os/Handler;

    .line 28
    .line 29
    new-instance v1, Ll/rjc0;

    .line 30
    .line 31
    invoke-direct {v1, v0, v2, p1}, Ll/rjc0;-><init>(III)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private createNotificationChannel()V
    .locals 6
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x10
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mLaunchActivity:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    goto :goto_0

    .line 8
    :catch_0
    move-exception v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    :goto_0
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto/16 :goto_2

    .line 16
    .line 17
    :cond_0
    new-instance v1, Landroid/app/Notification$Builder;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-direct {v1, v2}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    new-instance v2, Landroid/content/Intent;

    .line 27
    .line 28
    invoke-direct {v2, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 29
    .line 30
    .line 31
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 32
    .line 33
    const/16 v3, 0x1e

    .line 34
    .line 35
    if-le v0, v3, :cond_1

    .line 36
    .line 37
    const/high16 v3, 0xc000000

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    const/high16 v3, 0x8000000

    .line 41
    .line 42
    :goto_1
    const/4 v4, 0x0

    .line 43
    invoke-static {p0, v4, v2, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v1, v2}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    iget v4, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mLargeIcon:I

    .line 56
    .line 57
    invoke-static {v3, v4}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    iget v3, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mSmallIcon:I

    .line 66
    .line 67
    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    iget-object v3, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mContentText:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 78
    .line 79
    .line 80
    move-result-wide v3

    .line 81
    invoke-virtual {v2, v3, v4}, Landroid/app/Notification$Builder;->setWhen(J)Landroid/app/Notification$Builder;

    .line 82
    .line 83
    .line 84
    const-string v2, "notification_id"

    .line 85
    .line 86
    const/16 v3, 0x1a

    .line 87
    .line 88
    if-lt v0, v3, :cond_2

    .line 89
    .line 90
    invoke-static {v1, v2}, Ll/hy40;->a(Landroid/app/Notification$Builder;Ljava/lang/String;)Landroid/app/Notification$Builder;

    .line 91
    .line 92
    .line 93
    :cond_2
    if-lt v0, v3, :cond_3

    .line 94
    .line 95
    const-string v3, "notification"

    .line 96
    .line 97
    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    check-cast v3, Landroid/app/NotificationManager;

    .line 102
    .line 103
    const-string v4, "notification_name"

    .line 104
    .line 105
    const/4 v5, 0x2

    .line 106
    invoke-static {v2, v4, v5}, Ll/iy40;->a(Ljava/lang/String;Ljava/lang/CharSequence;I)Landroid/app/NotificationChannel;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-static {v3, v2}, Ll/gy40;->a(Landroid/app/NotificationManager;Landroid/app/NotificationChannel;)V

    .line 111
    .line 112
    .line 113
    :cond_3
    invoke-virtual {v1}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    const/4 v2, 0x1

    .line 118
    iput v2, v1, Landroid/app/Notification;->defaults:I

    .line 119
    .line 120
    const/16 v2, 0x21

    .line 121
    .line 122
    const/16 v3, 0x6e

    .line 123
    .line 124
    if-lt v0, v2, :cond_4

    .line 125
    .line 126
    const/16 v0, 0x20

    .line 127
    .line 128
    invoke-static {p0, v3, v1, v0}, Ll/ojc0;->a(Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;ILandroid/app/Notification;I)V

    .line 129
    .line 130
    .line 131
    goto :goto_2

    .line 132
    :cond_4
    invoke-virtual {p0, v3, v1}, Landroid/app/Service;->startForeground(ILandroid/app/Notification;)V

    .line 133
    .line 134
    .line 135
    :goto_2
    return-void
.end method

.method private createOrGetMediaProjection()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mMediaProjection:Landroid/media/projection/MediaProjection;

    .line 6
    .line 7
    if-nez v1, :cond_2

    .line 8
    .line 9
    iget-object v1, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mMediaProjectionManager:Landroid/media/projection/MediaProjectionManager;

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-string v1, "media_projection"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Landroid/media/projection/MediaProjectionManager;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mMediaProjectionManager:Landroid/media/projection/MediaProjectionManager;

    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mMediaProjectionManager:Landroid/media/projection/MediaProjectionManager;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    const/4 v1, -0x1

    .line 30
    iget-object v2, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mPermissionReulstData:Landroid/content/Intent;

    .line 31
    .line 32
    invoke-virtual {v0, v1, v2}, Landroid/media/projection/MediaProjectionManager;->getMediaProjection(ILandroid/content/Intent;)Landroid/media/projection/MediaProjection;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mMediaProjection:Landroid/media/projection/MediaProjection;

    .line 37
    .line 38
    :cond_1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mMediaProjection:Landroid/media/projection/MediaProjection;

    .line 39
    .line 40
    if-nez v0, :cond_2

    .line 41
    .line 42
    iget-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mPicoCreateMediaProjection:Z

    .line 43
    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    :try_start_0
    const-class v1, Landroid/media/projection/MediaProjectionManager;

    .line 48
    .line 49
    const-string v2, "createMediaProjection"

    .line 50
    .line 51
    invoke-virtual {v1, v2, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    iget-object v2, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mMediaProjectionManager:Landroid/media/projection/MediaProjectionManager;

    .line 56
    .line 57
    invoke-virtual {v1, v2, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    check-cast v1, Landroid/media/projection/MediaProjection;

    .line 62
    .line 63
    iput-object v1, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mMediaProjection:Landroid/media/projection/MediaProjection;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    .line 65
    return-void

    .line 66
    :catch_0
    iput-object v0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mMediaProjection:Landroid/media/projection/MediaProjection;

    .line 67
    .line 68
    :cond_2
    return-void
.end method

.method public static synthetic d(Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->INSTANCE()Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mMediaProjection:Landroid/media/projection/MediaProjection;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Lcom/ss/bytertc/base/media/screen/ScreenAudioCaptureAndroidManager;->startAudioCapture(Landroid/media/projection/MediaProjection;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private dispose(Landroid/content/Intent;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->getData(Landroid/content/Intent;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string v0, "hc"

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mHandler:Landroid/os/Handler;

    .line 16
    .line 17
    new-instance v0, Ll/pjc0;

    .line 18
    .line 19
    invoke-direct {v0, p1}, Ll/pjc0;-><init>(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic e()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->INSTANCE()Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->stopCapture()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic f(Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;IIII)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->INSTANCE()Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v5, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mMediaProjection:Landroid/media/projection/MediaProjection;

    .line 9
    .line 10
    move v1, p1

    .line 11
    move v2, p2

    .line 12
    move v3, p3

    .line 13
    move v4, p4

    .line 14
    invoke-virtual/range {v0 .. v5}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->startCapture(IIIILandroid/media/projection/MediaProjection;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic g(I)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->INSTANCE()Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->dispose(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private static getCommand(Landroid/content/Intent;)I
    .locals 2

    .line 1
    const/4 v0, -0x1

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const-string v1, "ACTION"

    .line 6
    .line 7
    invoke-virtual {p0, v1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private static getData(Landroid/content/Intent;)Landroid/content/Intent;
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    const-string v0, "DATA"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Landroid/content/Intent;

    .line 12
    .line 13
    return-object p0
.end method

.method public static getServiceIntent(Landroid/content/Context;ILandroid/content/Intent;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "ACTION"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    const-string p0, "DATA"

    .line 16
    .line 17
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    :cond_0
    return-object v0
.end method

.method public static synthetic h(Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->stopMediaProjection()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-virtual {p0, v0}, Landroid/app/Service;->stopForeground(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private startAudioCapture()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->createOrGetMediaProjection()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mHandler:Landroid/os/Handler;

    .line 5
    .line 6
    new-instance v1, Ll/wjc0;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/wjc0;-><init>(Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private startCapture(Landroid/content/Intent;)V
    .locals 8

    .line 1
    invoke-static {p1}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->getData(Landroid/content/Intent;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->createOrGetMediaProjection()V

    .line 9
    .line 10
    .line 11
    const-string v0, "w"

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    const-string v0, "h"

    .line 19
    .line 20
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    const-string v0, "if"

    .line 25
    .line 26
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 27
    .line 28
    .line 29
    move-result v6

    .line 30
    const-string v0, "minfr"

    .line 31
    .line 32
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 33
    .line 34
    .line 35
    move-result v7

    .line 36
    iget-object p1, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mHandler:Landroid/os/Handler;

    .line 37
    .line 38
    new-instance v2, Ll/qjc0;

    .line 39
    .line 40
    move-object v3, p0

    .line 41
    invoke-direct/range {v2 .. v7}, Ll/qjc0;-><init>(Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;IIII)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method private startLaunch(Landroid/content/Intent;)V
    .locals 3
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x10
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->getData(Landroid/content/Intent;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string v0, "largei"

    .line 9
    .line 10
    const/4 v1, -0x1

    .line 11
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    iput v2, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mLargeIcon:I

    .line 16
    .line 17
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput v0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mSmallIcon:I

    .line 22
    .line 23
    const-string v0, "activity"

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mLaunchActivity:Ljava/lang/String;

    .line 30
    .line 31
    const-string v0, "contentText"

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mContentText:Ljava/lang/String;

    .line 38
    .line 39
    const-string v0, "pico_create_media_projection"

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mPicoCreateMediaProjection:Z

    .line 47
    .line 48
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mLaunchActivity:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_4

    .line 55
    .line 56
    iget v0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mLargeIcon:I

    .line 57
    .line 58
    if-ne v0, v1, :cond_1

    .line 59
    .line 60
    iget v2, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mSmallIcon:I

    .line 61
    .line 62
    if-ne v2, v1, :cond_1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    iget v2, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mSmallIcon:I

    .line 66
    .line 67
    if-ne v2, v1, :cond_2

    .line 68
    .line 69
    iput v0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mSmallIcon:I

    .line 70
    .line 71
    :cond_2
    if-ne v0, v1, :cond_3

    .line 72
    .line 73
    iget v0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mSmallIcon:I

    .line 74
    .line 75
    iput v0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mLargeIcon:I

    .line 76
    .line 77
    :cond_3
    const-string v0, "PermissionResult"

    .line 78
    .line 79
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    check-cast p1, Landroid/content/Intent;

    .line 84
    .line 85
    iput-object p1, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mPermissionReulstData:Landroid/content/Intent;

    .line 86
    .line 87
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->createNotificationChannel()V

    .line 88
    .line 89
    .line 90
    :cond_4
    :goto_0
    return-void
.end method

.method private stop()V
    .locals 3
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    sget-object v0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->serviceStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mHandler:Landroid/os/Handler;

    .line 9
    .line 10
    new-instance v1, Ll/tjc0;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/tjc0;-><init>(Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private stopAudioCapture()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mHandler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v0, Ll/vjc0;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/vjc0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private stopCapture(Landroid/content/Intent;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mHandler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance p1, Ll/sjc0;

    .line 4
    .line 5
    invoke-direct {p1}, Ll/sjc0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private stopMediaProjection()V
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mMediaProjection:Landroid/media/projection/MediaProjection;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/media/projection/MediaProjection;->stop()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mMediaProjection:Landroid/media/projection/MediaProjection;

    .line 10
    .line 11
    :cond_0
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public onCreate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->serviceStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 9
    .line 10
    .line 11
    const-string v0, "[ScreenCapture] RXScreenCaptureService::onCreate success!"

    .line 12
    .line 13
    new-array v1, v2, [Ljava/lang/Object;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "RXScreenCaptureService"

    .line 20
    .line 21
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    new-instance v0, Landroid/os/HandlerThread;

    .line 25
    .line 26
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mHandlerThread:Landroid/os/HandlerThread;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 32
    .line 33
    .line 34
    new-instance v0, Landroid/os/Handler;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mHandlerThread:Landroid/os/HandlerThread;

    .line 37
    .line 38
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mHandler:Landroid/os/Handler;

    .line 46
    .line 47
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->mHandlerThread:Landroid/os/HandlerThread;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->getCommand(Landroid/content/Intent;)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    packed-switch p2, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    :pswitch_0
    goto :goto_0

    .line 9
    :pswitch_1
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->stop()V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :pswitch_2
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->audioDispose()V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :pswitch_3
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->stopAudioCapture()V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :pswitch_4
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->startAudioCapture()V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :pswitch_5
    invoke-direct {p0, p1}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->dispose(Landroid/content/Intent;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :pswitch_6
    invoke-direct {p0, p1}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->changeCaptureFormat(Landroid/content/Intent;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :pswitch_7
    invoke-direct {p0, p1}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->stopCapture(Landroid/content/Intent;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :pswitch_8
    invoke-direct {p0, p1}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->startCapture(Landroid/content/Intent;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :pswitch_9
    invoke-direct {p0, p1}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->startLaunch(Landroid/content/Intent;)V

    .line 42
    .line 43
    .line 44
    :goto_0
    const/4 p0, 0x2

    .line 45
    return p0

    .line 46
    nop

    .line 47
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
