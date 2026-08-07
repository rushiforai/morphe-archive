.class Lcom/tencent/liteav/renderer/e$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/renderer/e;->a(Lcom/tencent/liteav/basic/c/o;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/graphics/Matrix;

.field final synthetic b:Landroid/graphics/Bitmap;

.field final synthetic c:Landroid/view/TextureView;

.field final synthetic d:Lcom/tencent/liteav/basic/c/o;

.field final synthetic e:Lcom/tencent/liteav/renderer/e;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/renderer/e;Landroid/graphics/Matrix;Landroid/graphics/Bitmap;Landroid/view/TextureView;Lcom/tencent/liteav/basic/c/o;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/renderer/e$1;->e:Lcom/tencent/liteav/renderer/e;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/renderer/e$1;->a:Landroid/graphics/Matrix;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/renderer/e$1;->b:Landroid/graphics/Bitmap;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/tencent/liteav/renderer/e$1;->c:Landroid/view/TextureView;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/tencent/liteav/renderer/e$1;->d:Lcom/tencent/liteav/basic/c/o;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 1
    const-string v0, "takePhoto error "

    .line 2
    .line 3
    const-string v1, "TXCVideoRender"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    :try_start_0
    iget-object v3, p0, Lcom/tencent/liteav/renderer/e$1;->e:Lcom/tencent/liteav/renderer/e;

    .line 7
    .line 8
    iget-object v4, p0, Lcom/tencent/liteav/renderer/e$1;->a:Landroid/graphics/Matrix;

    .line 9
    .line 10
    iget-object v5, p0, Lcom/tencent/liteav/renderer/e$1;->b:Landroid/graphics/Bitmap;

    .line 11
    .line 12
    iget-object v6, p0, Lcom/tencent/liteav/renderer/e$1;->c:Landroid/view/TextureView;

    .line 13
    .line 14
    invoke-virtual {v6}, Landroid/view/View;->getWidth()I

    .line 15
    .line 16
    .line 17
    move-result v6

    .line 18
    iget-object v7, p0, Lcom/tencent/liteav/renderer/e$1;->c:Landroid/view/TextureView;

    .line 19
    .line 20
    invoke-virtual {v7}, Landroid/view/View;->getHeight()I

    .line 21
    .line 22
    .line 23
    move-result v7

    .line 24
    invoke-static {v3, v4, v5, v6, v7}, Lcom/tencent/liteav/renderer/e;->a(Lcom/tencent/liteav/renderer/e;Landroid/graphics/Matrix;Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    .line 25
    .line 26
    .line 27
    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    goto :goto_2

    .line 29
    :catch_0
    move-exception v3

    .line 30
    goto :goto_0

    .line 31
    :catch_1
    move-exception v3

    .line 32
    goto :goto_1

    .line 33
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    goto :goto_2

    .line 49
    :goto_1
    new-instance v4, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :goto_2
    iget-object p0, p0, Lcom/tencent/liteav/renderer/e$1;->d:Lcom/tencent/liteav/basic/c/o;

    .line 65
    .line 66
    if-eqz p0, :cond_0

    .line 67
    .line 68
    invoke-interface {p0, v2}, Lcom/tencent/liteav/basic/c/o;->onTakePhotoComplete(Landroid/graphics/Bitmap;)V

    .line 69
    .line 70
    .line 71
    :cond_0
    return-void
.end method
