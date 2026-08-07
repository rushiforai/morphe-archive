.class Ll/yrh0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/ImageReader$OnImageAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/yrh0;->i(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/yrh0;


# direct methods
.method public constructor <init>(Ll/yrh0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yrh0$a;->a:Ll/yrh0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onImageAvailable(Landroid/media/ImageReader;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireNextImage()Landroid/media/Image;

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
    invoke-virtual {p1}, Landroid/media/Image;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p1}, Landroid/media/Image;->getHeight()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    new-instance v2, Lcom/ss/android/ttvecamera/TECameraFrame;

    .line 17
    .line 18
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 19
    .line 20
    .line 21
    move-result-wide v3

    .line 22
    const-wide/16 v5, 0x3e8

    .line 23
    .line 24
    mul-long/2addr v3, v5

    .line 25
    invoke-direct {v2, v0, v1, v3, v4}, Lcom/ss/android/ttvecamera/TECameraFrame;-><init>(IIJ)V

    .line 26
    .line 27
    .line 28
    new-instance v0, Ll/zrh0;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-direct {v0, v1}, Ll/zrh0;-><init>([Landroid/media/Image$Plane;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/yrh0$a;->a:Ll/yrh0;

    .line 38
    .line 39
    iget-object v1, v1, Ll/irh0;->d:Lcom/ss/android/ttvecamera/c;

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/ss/android/ttvecamera/c;->D()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    iget-object v3, p0, Ll/yrh0$a;->a:Ll/yrh0;

    .line 46
    .line 47
    iget-object v4, v3, Ll/irh0;->b:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;

    .line 48
    .line 49
    iget-object v3, v3, Ll/irh0;->d:Lcom/ss/android/ttvecamera/c;

    .line 50
    .line 51
    invoke-virtual {v3}, Lcom/ss/android/ttvecamera/c;->y()I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    invoke-virtual {v2, v0, v1, v4, v3}, Lcom/ss/android/ttvecamera/TECameraFrame;->f(Ll/zrh0;ILcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;I)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Ll/yrh0$a;->a:Ll/yrh0;

    .line 59
    .line 60
    invoke-virtual {p0, v2}, Ll/irh0;->k(Lcom/ss/android/ttvecamera/TECameraFrame;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1}, Landroid/media/Image;->close()V

    .line 64
    .line 65
    .line 66
    return-void
.end method
