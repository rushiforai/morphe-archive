.class Lcom/tencent/liteav/basic/c/f$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/basic/c/f$1;->onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/basic/c/f$1;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/basic/c/f$1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/f$1$1;->a:Lcom/tencent/liteav/basic/c/f$1;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/f$1$1;->a:Lcom/tencent/liteav/basic/c/f$1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/liteav/basic/c/f$1;->a:Lcom/tencent/liteav/basic/c/f;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/c/f;->a(Lcom/tencent/liteav/basic/c/f;Z)Z

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/tencent/liteav/basic/c/f$1$1;->a:Lcom/tencent/liteav/basic/c/f$1;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/tencent/liteav/basic/c/f$1;->a:Lcom/tencent/liteav/basic/c/f;

    .line 12
    .line 13
    const/16 v0, 0x66

    .line 14
    .line 15
    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/c/f;->a(Lcom/tencent/liteav/basic/c/f;I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
