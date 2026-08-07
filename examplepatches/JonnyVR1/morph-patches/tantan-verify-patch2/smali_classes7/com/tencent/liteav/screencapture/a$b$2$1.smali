.class Lcom/tencent/liteav/screencapture/a$b$2$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/screencapture/a$b$2;->onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/screencapture/a$b$2;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/screencapture/a$b$2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/screencapture/a$b$2$1;->a:Lcom/tencent/liteav/screencapture/a$b$2;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/screencapture/a$b$2$1;->a:Lcom/tencent/liteav/screencapture/a$b$2;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tencent/liteav/screencapture/a$b$2;->a:Lcom/tencent/liteav/screencapture/a$b;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/tencent/liteav/screencapture/a$b;->h:Z

    .line 7
    .line 8
    iget-object p0, p0, Lcom/tencent/liteav/screencapture/a$b;->n:Lcom/tencent/liteav/screencapture/a;

    .line 9
    .line 10
    const/16 v0, 0x66

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/screencapture/a;->b(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
