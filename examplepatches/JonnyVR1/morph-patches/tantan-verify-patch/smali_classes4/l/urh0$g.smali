.class Ll/urh0$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/ImageReader$OnImageAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/urh0;->Z1(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/urh0;


# direct methods
.method public constructor <init>(Ll/urh0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/urh0$g;->a:Ll/urh0;

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
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireNextImage()Landroid/media/Image;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/urh0$g;->a:Ll/urh0;

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    new-instance p0, Ljava/lang/Exception;

    .line 10
    .line 11
    const-string p1, "no image data"

    .line 12
    .line 13
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/16 p1, -0x3e8

    .line 17
    .line 18
    invoke-static {v0, p0, p1}, Ll/urh0;->u1(Ll/urh0;Ljava/lang/Exception;I)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p1}, Landroid/media/Image;->getFormat()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const/16 v2, 0x100

    .line 27
    .line 28
    const/4 v3, 0x0

    .line 29
    if-eq v1, v2, :cond_1

    .line 30
    .line 31
    iget-object v1, p0, Ll/urh0$g;->a:Ll/urh0;

    .line 32
    .line 33
    invoke-static {v1}, Ll/urh0;->U0(Ll/urh0;)Landroid/hardware/camera2/TotalCaptureResult;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    move-object v1, v3

    .line 39
    :goto_0
    invoke-static {v0, p1, v1}, Ll/urh0;->t1(Ll/urh0;Landroid/media/Image;Landroid/hardware/camera2/TotalCaptureResult;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/urh0$g;->a:Ll/urh0;

    .line 43
    .line 44
    invoke-static {p0, v3}, Ll/urh0;->V0(Ll/urh0;Landroid/hardware/camera2/TotalCaptureResult;)Landroid/hardware/camera2/TotalCaptureResult;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/media/Image;->close()V

    .line 48
    .line 49
    .line 50
    return-void
.end method
