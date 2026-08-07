.class Ltv/danmaku/ijk/media/source/CameraSource$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/Camera$PreviewCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/source/CameraSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltv/danmaku/ijk/media/source/CameraSource;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/source/CameraSource;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPreviewFrame([BLandroid/hardware/Camera;)V
    .locals 6

    .line 1
    const-string p2, "VideoSource"

    .line 2
    .line 3
    const-string v0, "onPreviewFrame callback invoke:"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 13
    .line 14
    invoke-static {p2}, Ltv/danmaku/ijk/media/source/CameraSource;->e0(Ltv/danmaku/ijk/media/source/CameraSource;)J

    .line 15
    .line 16
    .line 17
    move-result-wide v2

    .line 18
    sub-long/2addr v0, v2

    .line 19
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 20
    .line 21
    iget-object v2, p2, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 22
    .line 23
    iget v2, v2, Lcom/immomo/mediacore/strinf/VideoQuality;->framerate:I

    .line 24
    .line 25
    add-int/lit8 v2, v2, 0x5

    .line 26
    .line 27
    int-to-long v2, v2

    .line 28
    const-wide/16 v4, 0x3e8

    .line 29
    .line 30
    div-long/2addr v4, v2

    .line 31
    cmp-long v0, v0, v4

    .line 32
    .line 33
    if-gez v0, :cond_1

    .line 34
    .line 35
    invoke-static {p2}, Ltv/danmaku/ijk/media/source/CameraSource;->j0(Ltv/danmaku/ijk/media/source/CameraSource;)Landroid/hardware/Camera;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    if-eqz p2, :cond_0

    .line 40
    .line 41
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 42
    .line 43
    invoke-static {p0}, Ltv/danmaku/ijk/media/source/CameraSource;->j0(Ltv/danmaku/ijk/media/source/CameraSource;)Landroid/hardware/Camera;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0, p1}, Landroid/hardware/Camera;->addCallbackBuffer([B)V

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void

    .line 51
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 52
    .line 53
    .line 54
    move-result-wide v0

    .line 55
    invoke-static {p2, v0, v1}, Ltv/danmaku/ijk/media/source/CameraSource;->g0(Ltv/danmaku/ijk/media/source/CameraSource;J)J

    .line 56
    .line 57
    .line 58
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 59
    .line 60
    invoke-static {p2}, Ltv/danmaku/ijk/media/source/CameraSource;->a0(Ltv/danmaku/ijk/media/source/CameraSource;)Landroid/os/Handler;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    new-instance v0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;

    .line 65
    .line 66
    invoke-direct {v0, p0, p1}, Ltv/danmaku/ijk/media/source/CameraSource$4$1;-><init>(Ltv/danmaku/ijk/media/source/CameraSource$4;[B)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p2, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 70
    .line 71
    .line 72
    return-void
.end method
