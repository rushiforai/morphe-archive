.class Ll/qqh0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/Camera$PreviewCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/qqh0;->i(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/qqh0;


# direct methods
.method public constructor <init>(Ll/qqh0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qqh0$a;->a:Ll/qqh0;

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
    .locals 7

    .line 1
    iget-object v0, p0, Ll/qqh0$a;->a:Ll/qqh0;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/qqh0;->p(Ll/qqh0;[B)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Lcom/ss/android/ttvecamera/TECameraFrame;

    .line 10
    .line 11
    iget-object v1, p0, Ll/qqh0$a;->a:Ll/qqh0;

    .line 12
    .line 13
    iget-object v1, v1, Ll/irh0;->c:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 14
    .line 15
    iget v2, v1, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 16
    .line 17
    iget v1, v1, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 18
    .line 19
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 20
    .line 21
    .line 22
    move-result-wide v3

    .line 23
    const-wide/16 v5, 0x3e8

    .line 24
    .line 25
    mul-long/2addr v3, v5

    .line 26
    invoke-direct {v0, v2, v1, v3, v4}, Lcom/ss/android/ttvecamera/TECameraFrame;-><init>(IIJ)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Ll/qqh0$a;->a:Ll/qqh0;

    .line 30
    .line 31
    iget-object v1, v1, Ll/irh0;->d:Lcom/ss/android/ttvecamera/c;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/ss/android/ttvecamera/c;->D()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    sget-object v2, Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;->PIXEL_FORMAT_NV21:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;

    .line 38
    .line 39
    iget-object v3, p0, Ll/qqh0$a;->a:Ll/qqh0;

    .line 40
    .line 41
    iget-object v3, v3, Ll/irh0;->d:Lcom/ss/android/ttvecamera/c;

    .line 42
    .line 43
    invoke-virtual {v3}, Lcom/ss/android/ttvecamera/c;->u()Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    iget v3, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 48
    .line 49
    invoke-virtual {v0, p1, v1, v2, v3}, Lcom/ss/android/ttvecamera/TECameraFrame;->d([BILcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;I)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Ll/qqh0$a;->a:Ll/qqh0;

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Ll/irh0;->k(Lcom/ss/android/ttvecamera/TECameraFrame;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    if-eqz p2, :cond_1

    .line 58
    .line 59
    invoke-virtual {p2, p1}, Landroid/hardware/Camera;->addCallbackBuffer([B)V

    .line 60
    .line 61
    .line 62
    :cond_1
    return-void
.end method
