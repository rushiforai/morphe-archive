.class public Ll/mxh0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/ImageReader$OnImageAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/mxh0;-><init>(Ll/cth0;IIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/cth0;

.field public final synthetic b:Ll/mxh0;


# direct methods
.method public constructor <init>(Ll/mxh0;Ll/cth0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/mxh0$a;->b:Ll/mxh0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/mxh0$a;->a:Ll/cth0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Ll/mxh0$a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mxh0$a;->c(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic b(Ll/mxh0$a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mxh0$a;->d(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public final synthetic c(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mxh0$a;->b:Ll/mxh0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/mxh0;->c(Ll/mxh0;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/mxh0$a;->b:Ll/mxh0;

    .line 14
    .line 15
    invoke-static {v0}, Ll/mxh0;->a(Ll/mxh0;)Ll/mxh0$b;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/mxh0$a;->b:Ll/mxh0;

    .line 22
    .line 23
    invoke-static {p0}, Ll/mxh0;->a(Ll/mxh0;)Ll/mxh0$b;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p0, p1}, Ll/mxh0$b;->onSuccess(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final synthetic d(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mxh0$a;->b:Ll/mxh0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/mxh0;->c(Ll/mxh0;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/mxh0$a;->b:Ll/mxh0;

    .line 7
    .line 8
    invoke-static {v0}, Ll/mxh0;->a(Ll/mxh0;)Ll/mxh0$b;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/mxh0$a;->b:Ll/mxh0;

    .line 15
    .line 16
    invoke-static {p0}, Ll/mxh0;->a(Ll/mxh0;)Ll/mxh0$b;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0, p1}, Ll/mxh0$b;->onError(Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public onImageAvailable(Landroid/media/ImageReader;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireLatestImage()Landroid/media/Image;

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
    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const/4 v0, 0x0

    .line 13
    aget-object p1, p1, v0

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    new-array v2, v1, [B

    .line 24
    .line 25
    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 26
    .line 27
    .line 28
    invoke-static {v2, v0, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object v0, p0, Ll/mxh0$a;->a:Ll/cth0;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/cth0;->n()Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_1

    .line 47
    .line 48
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Ll/qcj;

    .line 53
    .line 54
    invoke-interface {v1, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    check-cast p1, Landroid/graphics/Bitmap;

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 62
    .line 63
    const/4 v1, 0x0

    .line 64
    invoke-static {p1, v0, v1}, Ll/brd0;->c(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap$CompressFormat;Ljava/lang/String;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    new-instance v0, Ll/kxh0;

    .line 69
    .line 70
    invoke-direct {v0, p0}, Ll/kxh0;-><init>(Ll/mxh0$a;)V

    .line 71
    .line 72
    .line 73
    new-instance v1, Ll/lxh0;

    .line 74
    .line 75
    invoke-direct {v1, p0}, Ll/lxh0;-><init>(Ll/mxh0$a;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    iget-object p0, p0, Ll/mxh0$a;->b:Ll/mxh0;

    .line 87
    .line 88
    invoke-static {p0}, Ll/mxh0;->b(Ll/mxh0;)Ll/ft5;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0, p1}, Ll/ft5;->a(Ll/kcg0;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method
