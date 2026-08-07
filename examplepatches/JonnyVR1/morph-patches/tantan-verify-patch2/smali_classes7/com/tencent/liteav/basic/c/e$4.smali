.class Lcom/tencent/liteav/basic/c/e$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/basic/c/e;->a(II)V
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

.field final synthetic f:Lcom/tencent/liteav/basic/c/e;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/basic/c/e;Ljava/nio/ByteBuffer;Landroid/graphics/Bitmap;IILcom/tencent/liteav/basic/c/o;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/e$4;->f:Lcom/tencent/liteav/basic/c/e;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/basic/c/e$4;->a:Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/basic/c/e$4;->b:Landroid/graphics/Bitmap;

    .line 6
    .line 7
    iput p4, p0, Lcom/tencent/liteav/basic/c/e$4;->c:I

    .line 8
    .line 9
    iput p5, p0, Lcom/tencent/liteav/basic/c/e$4;->d:I

    .line 10
    .line 11
    iput-object p6, p0, Lcom/tencent/liteav/basic/c/e$4;->e:Lcom/tencent/liteav/basic/c/o;

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
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/e$4;->a:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/e$4;->b:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/e$4;->a:Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 12
    .line 13
    .line 14
    new-instance v7, Landroid/graphics/Matrix;

    .line 15
    .line 16
    invoke-direct {v7}, Landroid/graphics/Matrix;-><init>()V

    .line 17
    .line 18
    .line 19
    const/high16 v0, 0x3f800000    # 1.0f

    .line 20
    .line 21
    const/high16 v1, -0x40800000    # -1.0f

    .line 22
    .line 23
    invoke-virtual {v7, v0, v1}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 24
    .line 25
    .line 26
    iget-object v2, p0, Lcom/tencent/liteav/basic/c/e$4;->b:Landroid/graphics/Bitmap;

    .line 27
    .line 28
    iget v5, p0, Lcom/tencent/liteav/basic/c/e$4;->c:I

    .line 29
    .line 30
    iget v6, p0, Lcom/tencent/liteav/basic/c/e$4;->d:I

    .line 31
    .line 32
    const/4 v8, 0x0

    .line 33
    const/4 v3, 0x0

    .line 34
    const/4 v4, 0x0

    .line 35
    invoke-static/range {v2 .. v8}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/e$4;->e:Lcom/tencent/liteav/basic/c/o;

    .line 40
    .line 41
    invoke-interface {v1, v0}, Lcom/tencent/liteav/basic/c/o;->onTakePhotoComplete(Landroid/graphics/Bitmap;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/tencent/liteav/basic/c/e$4;->b:Landroid/graphics/Bitmap;

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    .line 47
    .line 48
    .line 49
    return-void
.end method
