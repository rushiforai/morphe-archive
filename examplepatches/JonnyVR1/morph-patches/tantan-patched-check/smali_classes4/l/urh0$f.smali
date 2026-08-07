.class Ll/urh0$f;
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
    iput-object p1, p0, Ll/urh0$f;->a:Ll/urh0;

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
    .locals 8

    .line 1
    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireNextImage()Landroid/media/Image;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/urh0$f;->a:Ll/urh0;

    .line 6
    .line 7
    invoke-static {v0}, Ll/urh0;->q1(Ll/urh0;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_3

    .line 12
    .line 13
    iget-object v0, p0, Ll/urh0$f;->a:Ll/urh0;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-static {v0, v1}, Ll/urh0;->r1(Ll/urh0;Z)Z

    .line 17
    .line 18
    .line 19
    if-eqz p1, :cond_2

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/media/Image;->getTimestamp()J

    .line 22
    .line 23
    .line 24
    move-result-wide v2

    .line 25
    iget-object v0, p0, Ll/urh0$f;->a:Ll/urh0;

    .line 26
    .line 27
    invoke-static {v0}, Ll/urh0;->P0(Ll/urh0;)[Landroid/hardware/camera2/TotalCaptureResult;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    array-length v4, v0

    .line 32
    :goto_0
    if-ge v1, v4, :cond_1

    .line 33
    .line 34
    aget-object v5, v0, v1

    .line 35
    .line 36
    sget-object v6, Landroid/hardware/camera2/TotalCaptureResult;->SENSOR_TIMESTAMP:Landroid/hardware/camera2/CaptureResult$Key;

    .line 37
    .line 38
    invoke-virtual {v5, v6}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v6

    .line 42
    check-cast v6, Ljava/lang/Long;

    .line 43
    .line 44
    if-eqz v6, :cond_0

    .line 45
    .line 46
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    .line 47
    .line 48
    .line 49
    move-result-wide v6

    .line 50
    cmp-long v6, v2, v6

    .line 51
    .line 52
    if-ltz v6, :cond_0

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    const/4 v5, 0x0

    .line 59
    :goto_1
    iget-object p0, p0, Ll/urh0$f;->a:Ll/urh0;

    .line 60
    .line 61
    invoke-static {p0, p1, v5}, Ll/urh0;->t1(Ll/urh0;Landroid/media/Image;Landroid/hardware/camera2/TotalCaptureResult;)V

    .line 62
    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_2
    iget-object p0, p0, Ll/urh0$f;->a:Ll/urh0;

    .line 66
    .line 67
    new-instance v0, Ljava/lang/Exception;

    .line 68
    .line 69
    const-string v1, "no image data"

    .line 70
    .line 71
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    const/16 v1, -0x3e8

    .line 75
    .line 76
    invoke-static {p0, v0, v1}, Ll/urh0;->u1(Ll/urh0;Ljava/lang/Exception;I)V

    .line 77
    .line 78
    .line 79
    :cond_3
    :goto_2
    if-eqz p1, :cond_4

    .line 80
    .line 81
    invoke-virtual {p1}, Landroid/media/Image;->close()V

    .line 82
    .line 83
    .line 84
    :cond_4
    return-void
.end method
