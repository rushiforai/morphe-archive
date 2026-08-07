.class Lcom/tencent/liteav/f$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/f;->onNotifyEvent(ILandroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Landroid/os/Bundle;

.field final synthetic c:Lcom/tencent/liteav/f;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/f;ILandroid/os/Bundle;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/f$6;->c:Lcom/tencent/liteav/f;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/f$6;->a:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/f$6;->b:Landroid/os/Bundle;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/f$6;->c:Lcom/tencent/liteav/f;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/liteav/n;->d:Ljava/lang/ref/WeakReference;

    .line 4
    .line 5
    iget v1, p0, Lcom/tencent/liteav/f$6;->a:I

    .line 6
    .line 7
    iget-object v2, p0, Lcom/tencent/liteav/f$6;->b:Landroid/os/Bundle;

    .line 8
    .line 9
    invoke-static {v0, v1, v2}, Lcom/tencent/liteav/basic/util/f;->a(Ljava/lang/ref/WeakReference;ILandroid/os/Bundle;)V

    .line 10
    .line 11
    .line 12
    iget v0, p0, Lcom/tencent/liteav/f$6;->a:I

    .line 13
    .line 14
    const/16 v1, 0x837

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/tencent/liteav/f$6;->c:Lcom/tencent/liteav/f;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/tencent/liteav/f;->f(Lcom/tencent/liteav/f;)Lcom/tencent/liteav/TXCRenderAndDec;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object p0, p0, Lcom/tencent/liteav/f$6;->c:Lcom/tencent/liteav/f;

    .line 27
    .line 28
    invoke-static {p0}, Lcom/tencent/liteav/f;->f(Lcom/tencent/liteav/f;)Lcom/tencent/liteav/TXCRenderAndDec;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Lcom/tencent/liteav/TXCRenderAndDec;->restartDecoder()V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method
