.class Lcom/tencent/liteav/renderer/TXCGLSurfaceView$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->a(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/nio/ByteBuffer;

.field final synthetic b:Landroid/graphics/Bitmap;

.field final synthetic c:I

.field final synthetic d:I

.field final synthetic e:Lcom/tencent/liteav/basic/c/o;

.field final synthetic f:Lcom/tencent/liteav/renderer/TXCGLSurfaceView;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/renderer/TXCGLSurfaceView;Ljava/nio/ByteBuffer;Landroid/graphics/Bitmap;IILcom/tencent/liteav/basic/c/o;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView$5;->f:Lcom/tencent/liteav/renderer/TXCGLSurfaceView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView$5;->a:Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView$5;->b:Landroid/graphics/Bitmap;

    .line 6
    .line 7
    iput p4, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView$5;->c:I

    .line 8
    .line 9
    iput p5, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView$5;->d:I

    .line 10
    .line 11
    iput-object p6, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView$5;->e:Lcom/tencent/liteav/basic/c/o;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .line 1
    const-string v1, "takePhoto error "

    .line 2
    .line 3
    const-string v2, "TXCGLSurfaceView"

    .line 4
    .line 5
    const/4 v3, 0x0

    .line 6
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView$5;->a:Ljava/nio/ByteBuffer;

    .line 7
    .line 8
    const/4 v4, 0x0

    .line 9
    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView$5;->b:Landroid/graphics/Bitmap;

    .line 13
    .line 14
    iget-object v4, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView$5;->a:Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    invoke-virtual {v0, v4}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 17
    .line 18
    .line 19
    new-instance v10, Landroid/graphics/Matrix;

    .line 20
    .line 21
    invoke-direct {v10}, Landroid/graphics/Matrix;-><init>()V

    .line 22
    .line 23
    .line 24
    const/high16 v0, 0x3f800000    # 1.0f

    .line 25
    .line 26
    const/high16 v4, -0x40800000    # -1.0f

    .line 27
    .line 28
    invoke-virtual {v10, v0, v4}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 29
    .line 30
    .line 31
    iget-object v5, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView$5;->b:Landroid/graphics/Bitmap;

    .line 32
    .line 33
    iget v8, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView$5;->c:I

    .line 34
    .line 35
    iget v9, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView$5;->d:I

    .line 36
    .line 37
    const/4 v11, 0x0

    .line 38
    const/4 v6, 0x0

    .line 39
    const/4 v7, 0x0

    .line 40
    invoke-static/range {v5 .. v11}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 41
    .line 42
    .line 43
    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    goto :goto_2

    .line 45
    :catch_0
    move-exception v0

    .line 46
    goto :goto_0

    .line 47
    :catch_1
    move-exception v0

    .line 48
    goto :goto_1

    .line 49
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    goto :goto_2

    .line 65
    :goto_1
    new-instance v4, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    :goto_2
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView$5;->e:Lcom/tencent/liteav/basic/c/o;

    .line 81
    .line 82
    invoke-interface {v0, v3}, Lcom/tencent/liteav/basic/c/o;->onTakePhotoComplete(Landroid/graphics/Bitmap;)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView$5;->b:Landroid/graphics/Bitmap;

    .line 86
    .line 87
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    .line 88
    .line 89
    .line 90
    return-void
.end method
